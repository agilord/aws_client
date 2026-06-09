import '../model/api.dart';
import '../model/descriptor.dart';
import '../model/operation.dart';
import '../model/shape.dart';
import '../model/xml_namespace.dart';
import 'ast.dart';
import 'traits.dart';

Api apiFromSmithy(SmithyModel model, {required String uid, String? serviceId}) {
  final serviceEntry = serviceId != null
      ? MapEntry(serviceId, model.shapes[serviceId]!)
      : model.service;
  final service = serviceEntry.value;
  final (protocol, jsonVersion, usesTarget) = switch (service.protocolTraitId) {
    TraitIds.awsJson1_0 => ('json', '1.0', true),
    TraitIds.awsJson1_1 => ('json', '1.1', true),
    TraitIds.restJson1 => ('rest-json', null, false),
    TraitIds.restXml => ('rest-xml', null, false),
    TraitIds.awsQuery => ('query', null, false),
    final p => throw UnsupportedError('from_smithy: unsupported protocol $p'),
  };

  final rest = protocol == 'rest-json' || protocol == 'rest-xml';
  final query = protocol == 'query';
  final xml = protocol == 'rest-xml' || query;

  final svcTrait = service.traits.object(TraitIds.awsApiService) ?? const {};
  final sigv4 = service.traits.object(TraitIds.sigv4);
  final sdkId = svcTrait['sdkId'] as String?;
  final signingName = sigv4?['name'] as String?;
  // endpointPrefix is optional in Smithy; it defaults to arnNamespace.
  final endpointPrefix = (svcTrait['endpointPrefix'] ??
      svcTrait['arnNamespace'] ??
      signingName) as String?;

  final metadata = Metadata(
    apiVersion: service.version!,
    endpointPrefix: endpointPrefix!,
    protocol: protocol,
    protocols: [protocol],
    jsonVersion: jsonVersion,
    serviceFullName:
        service.traits.string(TraitIds.title) ?? sdkId ?? endpointPrefix,
    serviceAbbreviation: sdkId,
    serviceId: sdkId,
    signatureVersion: 'v4',
    signingName: (signingName != null && signingName != endpointPrefix)
        ? signingName
        : null,
    targetPrefix: usesTarget ? _local(serviceEntry.key) : null,
    xmlNamespace: query
        ? (service.traits.object(TraitIds.xmlNamespace)?['uri'] as String?)
        : null,
    uid: uid,
    auth: sigv4 != null ? [TraitIds.sigv4] : null,
  );

  // Only emit shapes reachable from this service's operation closure. Official
  // Smithy models bundle multiple services and meta-namespace trait-definition
  // shapes that collide on their stripped local names; the closure walk excludes them.
  final reachable = _reachableShapeIds(model,
      [for (final ref in _collectOperations(model, service)) ref.target]);

  final dataShapeIds = [
    for (final id in reachable)
      if (model.shapes[id] != null &&
          !const {'service', 'operation', 'resource'}
              .contains(model.shapes[id]!.type) &&
          !model.shapes[id]!.traits.containsKey('smithy.api#mixin'))
        id
  ];

  final names = _disambiguatedNames(dataShapeIds);
  String resolve(String shapeId) => names[shapeId] ?? _local(shapeId);

  final operations = <String, Operation>{};
  for (final ref in _collectOperations(model, service)) {
    final name = _local(ref.target);
    operations[name] =
        _operation(name, model.shapes[ref.target]!, rest, query, resolve);
  }

  final shapes = <String, Shape>{};
  for (final id in dataShapeIds) {
    final name = resolve(id);
    if (shapes.containsKey(name)) {
      throw StateError('Shape name collision after disambiguation: $name '
          '(resolving $id)');
    }
    shapes[name] = _shape(model.shapes[id]!, model, rest, xml, resolve);
  }
  _injectPreludeShapes(model, shapes);

  return Api(
    metadata: metadata,
    operations: operations,
    shapes: shapes,
    version: service.version,
    documentation: _doc(service.documentation),
  );
}

List<ShapeRef> _collectOperations(SmithyModel model, SmithyShape service) {
  final refs = <ShapeRef>[];
  final seen = <String>{};

  void add(ShapeRef? r) {
    if (r != null && seen.add(r.target)) refs.add(r);
  }

  void walkResource(ShapeRef resourceRef) {
    final r = model.shapes[resourceRef.target];
    if (r == null) return;
    [r.create, r.put, r.read, r.update, r.delete, r.list].forEach(add);
    r.operations?.forEach(add);
    r.collectionOperations?.forEach(add);
    r.resources?.forEach(walkResource);
  }

  service.operations?.forEach(add);
  service.resources?.forEach(walkResource);
  return refs;
}

Set<String> _reachableShapeIds(SmithyModel model, List<String> operationIds) {
  final seen = <String>{};
  final stack = <String>[];

  void visit(String? id) {
    if (id == null) return;
    if (id.startsWith('smithy.api#')) return;
    if (seen.add(id)) stack.add(id);
  }

  for (final opId in operationIds) {
    final op = model.shapes[opId];
    if (op == null) continue;
    seen.add(opId);
    visit(op.input?.target);
    visit(op.output?.target);
    op.errors?.forEach((e) => visit(e.target));
  }

  while (stack.isNotEmpty) {
    final id = stack.removeLast();
    final shape = model.shapes[id];
    if (shape == null) continue;
    _effectiveMembers(shape, model).forEach((_, ref) => visit(ref.target));
    visit(shape.member?.target);
    visit(shape.key?.target);
    visit(shape.value?.target);
  }
  return seen;
}

Map<String, ShapeRef> _effectiveMembers(SmithyShape shape, SmithyModel model) {
  final mixins = shape.mixins;
  if (mixins == null || mixins.isEmpty) return shape.members ?? const {};
  final merged = <String, ShapeRef>{};
  for (final ref in mixins) {
    final mixin = model.shapes[ref.target];
    if (mixin != null) merged.addAll(_effectiveMembers(mixin, model));
  }
  if (shape.members != null) merged.addAll(shape.members!);
  return merged;
}

Operation _operation(String localName, SmithyShape op, bool rest, bool query,
    String Function(String) resolve) {
  final wireName = op.traits.string(TraitIds.operationWireName) ?? localName;
  return Operation(
    name: wireName,
    methodNameOverride: wireName != localName ? localName : null,
    http: rest
        ? _http(op.traits.object(TraitIds.http))
        : const Http(method: 'POST', requestUri: '/'),
    authtype: switch (op.traits) {
      final t when t.has(TraitIds.optionalAuth) => 'none',
      final t when t.has(TraitIds.unsignedPayload) => 'v4-unsigned-body',
      _ => '',
    },
    input: _descriptor(op.input, resolve: resolve),
    output: _descriptor(op.output,
        resultWrapper: query ? '${wireName}Result' : null, resolve: resolve),
    errors: op.errors == null || op.errors!.isEmpty
        ? null
        : [for (final e in op.errors!) Descriptor(shape: resolve(e.target))],
    documentation: _doc(op.documentation),
  );
}

Descriptor? _descriptor(ShapeRef? ref,
    {String? resultWrapper, required String Function(String) resolve}) {
  if (ref == null || ref.target == 'smithy.api#Unit') return null;
  return Descriptor(shape: resolve(ref.target), resultWrapper: resultWrapper);
}

Http _http(Map<String, Object?>? trait) {
  if (trait == null) return const Http(method: 'POST', requestUri: '/');
  return Http(
    method: trait['method'] as String? ?? 'POST',
    requestUri: trait['uri'] as String? ?? '/',
    responseCode: (trait['code'] as num?)?.toInt(),
  );
}

Shape _shape(SmithyShape shape, SmithyModel model, bool rest, bool xml,
    String Function(String) resolve) {
  switch (shape.type) {
    case 'structure':
    case 'union':
      return _structure(shape, model, rest, xml, resolve);
    case 'enum':
      return _enum(shape);
    case 'document':
      return Shape(
        type: 'document',
        documentation: _doc(shape.documentation),
      );
    case 'list':
    case 'set':
      return Shape(
        type: 'list',
        member: _memberDescriptor(shape.member!, xml, resolve),
        flattened: xml && shape.traits.has(TraitIds.xmlFlattened),
        min: _bound(shape, 'min'),
        max: _bound(shape, 'max'),
        xmlNamespace: xml ? _xmlNs(shape.traits) : null,
        documentation: _doc(shape.documentation),
      );
    case 'map':
      return Shape(
        type: 'map',
        key: _memberDescriptor(shape.key!, xml, resolve),
        value: _memberDescriptor(shape.value!, xml, resolve),
        xmlNamespace: xml ? _xmlNs(shape.traits) : null,
        documentation: _doc(shape.documentation),
      );
    default:
      return Shape(
        type: _scalarType(shape.type),
        enumeration: _legacyEnumTrait(shape),
        pattern: shape.traits.string(TraitIds.pattern),
        min: _bound(shape, 'min'),
        max: _bound(shape, 'max'),
        xmlNamespace: xml ? _xmlNs(shape.traits) : null,
        documentation: _doc(shape.documentation),
        timestampFormat:
            _timestampFormat(shape.traits.string(TraitIds.timestampFormat)),
      );
  }
}

Shape _structure(SmithyShape shape, SmithyModel model, bool rest, bool xml,
    String Function(String) resolve) {
  final isException = shape.traits.has(TraitIds.error);
  final members = <String, Member>{};
  final required = <String>[];
  String? payload;
  _effectiveMembers(shape, model).forEach((name, ref) {
    if (rest && ref.traits.has(TraitIds.httpPayload)) payload = name;
    members[name] = _member(name, ref, rest, xml, resolve);
    if (ref.isRequired) required.add(name);
  });
  return Shape(
    type: 'structure',
    membersMap: members,
    required: (isException || required.isEmpty) ? null : required,
    exception: isException,
    payload: payload,
    xmlNamespace: xml ? _xmlNs(shape.traits) : null,
    documentation: _doc(shape.documentation),
  );
}

Member _member(String name, ShapeRef ref, bool rest, bool xml,
    String Function(String) resolve) {
  final t = ref.traits;
  String? location;
  String? locationName =
      xml ? t.string(TraitIds.xmlName) : t.string(TraitIds.jsonName);
  if (rest) {
    if (t.has(TraitIds.httpLabel)) {
      location = 'uri';
      locationName = name;
    } else if (t.string(TraitIds.httpHeader) != null) {
      location = 'header';
      locationName = t.string(TraitIds.httpHeader);
    } else if (t.string(TraitIds.httpPrefixHeaders) != null) {
      location = 'headers';
      locationName = t.string(TraitIds.httpPrefixHeaders);
    } else if (t.string(TraitIds.httpQuery) != null) {
      location = 'querystring';
      locationName = t.string(TraitIds.httpQuery);
    } else if (t.has(TraitIds.httpResponseCode)) {
      location = 'statusCode';
    }
  }
  return Member(
    shape: resolve(ref.target),
    documentation: _doc(ref.documentation),
    idempotencyToken: t.has(TraitIds.idempotencyToken),
    location: location,
    locationName: locationName,
    flattened: xml && t.has(TraitIds.xmlFlattened),
    xmlAttribute: xml && t.has(TraitIds.xmlAttribute),
    xmlNamespace: xml ? _xmlNs(t) : null,
    timestampFormat: _timestampFormat(t.string(TraitIds.timestampFormat)),
  );
}

Descriptor _memberDescriptor(
        ShapeRef ref, bool xml, String Function(String) resolve) =>
    Descriptor(
      shape: resolve(ref.target),
      locationName: xml ? ref.traits.string(TraitIds.xmlName) : null,
      xmlNamespace: xml ? _xmlNs(ref.traits) : null,
    );

XmlNamespace? _xmlNs(Map<String, Object?> traits) {
  final ns = traits.object(TraitIds.xmlNamespace);
  return ns == null
      ? null
      : XmlNamespace(ns['uri'] as String, ns['prefix'] as String?);
}

Shape _enum(SmithyShape shape) {
  final values = <String>[];
  shape.members?.forEach((name, ref) {
    values.add(ref.traits.string('smithy.api#enumValue') ?? name);
  });
  return Shape(
    type: 'string',
    enumeration: values,
    documentation: _doc(shape.documentation),
  );
}

List<String>? _legacyEnumTrait(SmithyShape shape) {
  final raw = shape.traits[TraitIds.enumTrait];
  if (raw is! List) return null;
  return [for (final e in raw.cast<Map>()) e['value'] as String];
}

num? _bound(SmithyShape shape, String key) {
  final c = shape.traits.object(TraitIds.length) ??
      shape.traits.object(TraitIds.range);
  return c?[key] as num?;
}

String _local(String shapeId) => shapeId.split('#').last;

// When two shapes in different namespaces strip to the same local name, prefix
// each with its PascalCased last namespace segment (e.g. SharedGreetingStruct /
// NestedGreetingStruct). A numeric suffix resolves any remaining collisions.
// Only colliding ids appear in the result; callers fall back to _local otherwise.
Map<String, String> _disambiguatedNames(Iterable<String> dataShapeIds) {
  final byLocal = <String, List<String>>{};
  for (final id in dataShapeIds) {
    byLocal.putIfAbsent(_local(id), () => <String>[]).add(id);
  }

  final names = <String, String>{};
  byLocal.forEach((local, ids) {
    if (ids.length == 1) return; // no collision: caller falls back to _local
    final used = <String>{};
    for (final id in ids) {
      final prefix = _pascal(_namespaceSegment(id));
      var candidate = '$prefix$local';
      var n = 2;
      while (used.contains(candidate)) {
        candidate = '$prefix$local$n';
        n++;
      }
      used.add(candidate);
      names[id] = candidate;
    }
  });
  return names;
}

String _namespaceSegment(String shapeId) =>
    shapeId.split('#').first.split('.').last;

String _pascal(String s) =>
    s.isEmpty ? s : s.substring(0, 1).toUpperCase() + s.substring(1);

String? _timestampFormat(String? smithyFormat) => switch (smithyFormat) {
      null => null,
      'date-time' => 'iso8601',
      'http-date' => 'rfc822',
      'epoch-seconds' => 'unixTimestamp',
      final f => f,
    };

String _scalarType(String t) => switch (t) {
      'byte' || 'short' || 'intEnum' => 'integer',
      'bigInteger' => 'long',
      'bigDecimal' => 'double',
      _ => t,
    };

const _preludePrimitives = {
  'smithy.api#String': 'string',
  'smithy.api#Boolean': 'boolean',
  'smithy.api#PrimitiveBoolean': 'boolean',
  'smithy.api#Byte': 'integer',
  'smithy.api#Short': 'integer',
  'smithy.api#Integer': 'integer',
  'smithy.api#PrimitiveInteger': 'integer',
  'smithy.api#Long': 'long',
  'smithy.api#PrimitiveLong': 'long',
  'smithy.api#BigInteger': 'long',
  'smithy.api#Float': 'float',
  'smithy.api#PrimitiveFloat': 'float',
  'smithy.api#Double': 'double',
  'smithy.api#PrimitiveDouble': 'double',
  'smithy.api#BigDecimal': 'double',
  'smithy.api#Timestamp': 'timestamp',
  'smithy.api#Blob': 'blob',
};

void _injectPreludeShapes(SmithyModel model, Map<String, Shape> shapes) {
  void visit(ShapeRef? ref) {
    if (ref == null) return;
    if (ref.target == 'smithy.api#Document' ||
        ref.target == 'smithy.api#Unit') {
      shapes.putIfAbsent(_local(ref.target),
          () => Shape(type: 'structure', membersMap: const {}));
      return;
    }
    final type = _preludePrimitives[ref.target];
    if (type != null) {
      shapes.putIfAbsent(_local(ref.target), () => Shape(type: type));
    }
  }

  for (final shape in model.shapes.values) {
    shape.members?.values.forEach(visit);
    visit(shape.member);
    visit(shape.key);
    visit(shape.value);
  }
}

String? _doc(String? text) => text?.replaceAll(RegExp(r'\s+'), ' ').trim();
