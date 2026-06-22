import '../../model/api.dart';
import '../../model/descriptor.dart';
import '../../model/operation.dart';
import '../../model/shape.dart';
import '../../utils/case.dart';

abstract class ServiceBuilder {
  String imports();

  String constructor();

  String operationContent(Operation operation);

  void buildRequestHeaders(Operation operation, StringBuffer out,
      {Set<String> guaranteedNonNull = const {}}) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasHeaderMembers) return;

    out.writeln('final headers = <String, String>{');
    for (var m in sc.headerMembers) {
      final headerName = m.locationName ?? m.shapeClass?.locationName ?? m.name;
      final location = m.location ?? m.shapeClass?.location;
      if (!m.isRequired && !guaranteedNonNull.contains(m.fieldName)) {
        out.writeln('if (${m.fieldName} != null)');
      }
      if (location == 'headers') {
        if (headerName.isEmpty) {
          out.writeln('...${m.fieldName},');
        } else {
          out.writeln(
              "...${m.fieldName}.map((key, value) => MapEntry('$headerName\$key', value)),");
        }
      } else {
        out.writeln(
            "'$headerName': ${_encodeHeaderValue(m.shapeClass!, m.fieldName, member: m)},");
      }
    }
    out.writeln('};');
  }

  String buildRequestUri(Operation operation) {
    // TODO implement UriEscape and UriEscapePath according to https://github.com/aws/aws-sdk-js/blob/master/lib/util.js#L39..L57
    var uri = operation.http.requestUri;
    final sc = operation.input?.shapeClass;
    if (sc != null) {
      // Drop URI labels the endpoint owns (e.g. S3's Bucket, which the endpoint
      // rules place into the host/path) so the path doesn't duplicate them.
      final owned = _endpointOwnedParams(operation.api);
      for (final m in sc.uriMembers) {
        if (m.contextParam != null && owned.contains(m.contextParam)) {
          final name = m.locationName ?? m.name;
          uri = uri.replaceAll('/{$name+}', '').replaceAll('/{$name}', '');
        }
      }
      final allMembersToReplace = sc.uriMembers
          .expand((m) => [
                '{${m.locationName ?? m.name}}',
                '{${m.locationName ?? m.name}+'
              ])
          .toSet();

      uri = uri.split('/').map((part) {
        if (!allMembersToReplace.any((e) => part.contains(e)) &&
            !part.contains('?')) {
          return Uri.encodeComponent(part);
        }
        return part;
      }).join('/');
      for (var m in sc.uriMembers) {
        final fieldCode = _encodePath(m.shapeClass!, m.fieldName, member: m);
        final name = m.locationName ?? m.name;
        uri = uri
            .replaceAll('{$name}', '\${Uri.encodeComponent($fieldCode)}')
            .replaceAll('{$name+}',
                "\${$fieldCode.split('/').map(Uri.encodeComponent).join('/')}");
      }
    }
    return uri;
  }

  void buildRequestQueryParams(Operation operation, StringBuffer out,
      {Set<String> guaranteedNonNull = const {}}) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasQueryMembers) return;

    out.writeln('final \$query = <String, List<String>>{');
    for (final member in sc.queryMembers) {
      final location =
          member.locationName ?? member.shapeClass?.locationName ?? member.name;

      // A field the caller already promoted to non-null (e.g. an `??=`'d
      // idempotency token) needs no guard — it would be a dead null check.
      if (!member.isRequired && !guaranteedNonNull.contains(member.fieldName)) {
        out.writeln('if(${member.fieldName} != null)');
      }
      if (member.shapeClass?.type == 'map') {
        final variable = _encodeQueryParamCode(
            member.shapeClass!.value!.shapeClass!, 'e.value',
            member: member);
        out.writeln('for (var e in ${member.fieldName}.entries)');
        out.writeln('e.key: $variable,');
      } else {
        final variable = _encodeQueryParamCode(
            member.shapeClass!, member.fieldName,
            member: member);
        out.writeln("'$location': $variable,");
      }
    }
    out.writeln('};');
  }

  String buildServiceMetadata(Api api) {
    final args = StringBuffer();
    args.writeln("endpointPrefix: '${api.metadata.endpointPrefix}',");
    if (api.metadata.signingName != null) {
      args.writeln("signingName: '${api.metadata.signingName}',");
    }
    return '_s.ServiceMetadata($args)';
  }

  bool _hasResolver(Api api) => api.metadata.endpointRuleSet != null;

  // Rule-set params whose value flows into a resolved endpoint URL. httpLabel
  // members bound to one are dropped from the requestUri (the endpoint owns
  // their placement) — the S3 bucket / ARN customization.
  final _ownedCache = <Api, Set<String>>{};
  Set<String> _endpointOwnedParams(Api api) {
    final cached = _ownedCache[api];
    if (cached != null) return cached;
    final rs = api.metadata.endpointRuleSet;
    if (rs == null) return _ownedCache[api] = const {};

    final assigns = <String, Set<String>>{}; // assigned var -> source refs
    final urlRefs = <String>{};

    void refsIn(Object? node, Set<String> into) {
      if (node is String) {
        for (final m in RegExp(r'\{(\w+)').allMatches(node)) {
          into.add(m.group(1)!);
        }
      } else if (node is Map) {
        if (node.length == 1 && node.containsKey('ref')) {
          into.add(node['ref'] as String);
        } else if (node.containsKey('fn')) {
          for (final a in node['argv'] as List) {
            refsIn(a, into);
          }
        } else {
          for (final v in node.values) {
            refsIn(v, into);
          }
        }
      } else if (node is List) {
        for (final v in node) {
          refsIn(v, into);
        }
      }
    }

    void walk(Object? node) {
      if (node is! Map) return;
      if (node['type'] == 'endpoint') {
        refsIn((node['endpoint'] as Map)['url'], urlRefs);
      }
      for (final c in (node['conditions'] as List?) ?? const []) {
        final assign = (c as Map)['assign'] as String?;
        if (assign != null) {
          final src = <String>{};
          refsIn(c['argv'], src);
          assigns[assign] = src;
        }
      }
      (node['rules'] as List?)?.forEach(walk);
    }

    for (final r in rs['rules'] as List) {
      walk(r);
    }

    // Transitively expand assigned vars back to their source parameters.
    final result = <String>{};
    final seen = <String>{};
    final stack = urlRefs.toList();
    while (stack.isNotEmpty) {
      final v = stack.removeLast();
      if (!seen.add(v)) continue;
      final src = assigns[v];
      if (src != null) {
        stack.addAll(src);
      } else {
        result.add(v);
      }
    }
    return _ownedCache[api] = result;
  }

  Map<String, Object?> _ruleSetParams(Api api) =>
      (api.metadata.endpointRuleSet?['parameters'] as Map?)
          ?.cast<String, Object?>() ??
      const {};

  Map<String, Object?> _clientContextParams(Api api) =>
      api.metadata.clientContextParams ?? const {};

  List<String> _operationParamNames(Api api) {
    final names = <String>{};
    for (final op in api.operations.values) {
      op.staticContextParams?.keys.forEach(names.add);
      for (final m in op.input?.shapeClass?.members ?? const <Member>[]) {
        if (m.contextParam != null) names.add(m.contextParam!);
      }
    }
    final list = names.toList()..sort();
    return list;
  }

  bool _hasPerRequest(Api api) => _operationParamNames(api).isNotEmpty;

  String _paramName(String name) => lowerCamel(splitWords(name));

  // Must match how the generated resolveEndpoint declares the param so
  // forwarding type-checks.
  ({String type, String? def}) _resolverParam(Api api, String name) {
    final spec = (_ruleSetParams(api)[name] as Map?)?.cast<String, Object?>() ??
        const {};
    final hasDef = spec.containsKey('default');
    return switch (spec['type']) {
      'boolean' => hasDef
          ? (type: 'bool', def: _staticValue(spec['default']))
          : (type: 'bool?', def: null),
      'string' => hasDef
          ? (type: 'String', def: _staticValue(spec['default']))
          : (type: 'String?', def: null),
      'stringArray' => (type: 'List<String>?', def: null),
      _ => (type: 'Object?', def: null),
    };
  }

  // Nullable so "unset by this operation" falls back to the client value/default.
  String _nullableType(Api api, String name) =>
      switch ((_ruleSetParams(api)[name] as Map?)?['type']) {
        'boolean' => 'bool?',
        'string' => 'String?',
        'stringArray' => 'List<String>?',
        _ => 'Object?',
      };

  String _staticValue(Object? value) => switch (value) {
        bool() || num() => '$value',
        String() => "'$value'",
        _ => 'null',
      };

  String buildProtocolConstructor(Api api, String protocolClass) {
    final cls = api.metadata.className;
    final hasResolver = _hasResolver(api);
    final perRequest = _hasPerRequest(api);
    final ccp = _clientContextParams(api);
    final regionParam =
        api.isGlobalService ? 'String? region' : 'required String region';

    String ccpDecl(String name) {
      final p = _resolverParam(api, name);
      return '${p.type} ${_paramName(name)}${p.def != null ? ' = ${p.def}' : ''}';
    }

    final ctorParams = <String>[
      regionParam,
      '_s.AwsClientCredentials? credentials',
      '_s.AwsClientCredentialsProvider? credentialsProvider',
      '_s.Client? client',
      'String? endpointUrl',
      if (hasResolver) ...[
        'bool useFipsEndpoint = false',
        'bool useDualStackEndpoint = false',
        for (final name in ccp.keys) ccpDecl(name),
      ],
      if (_hasHostPrefix(api)) 'bool disableHostPrefix = false',
    ];

    String resolverCall() {
      final args = <String>[
        'region: region',
        'endpoint: endpointUrl',
        'useFips: useFipsEndpoint',
        'useDualStack: useDualStackEndpoint',
        for (final name in ccp.keys) '${_paramName(name)}: ${_paramName(name)}',
      ];
      return '_endpoints.resolveEndpoint(${args.join(', ')})';
    }

    final defaultEndpoint = hasResolver
        ? '_s.Endpoint.fromResolved(${resolverCall()}, service: service, region: region)'
        : '_s.Endpoint.forProtocol(service: service, region: region, endpointUrl: endpointUrl)';

    final protocolArgs = [
      'client: client',
      'endpointBuilder: () => $defaultEndpoint',
      'credentials: credentials',
      'credentialsProvider: credentialsProvider',
      if (_hasHostPrefix(api)) 'disableHostPrefix: disableHostPrefix',
    ].join(', ');

    final buf = StringBuffer()..writeln('final _s.$protocolClass _protocol;');
    if (perRequest) {
      buf
        ..writeln('final _s.ServiceMetadata _service;')
        ..writeln('final String? _region;')
        ..writeln('final String? _endpointUrl;')
        ..writeln('final bool _useFipsEndpoint;')
        ..writeln('final bool _useDualStackEndpoint;');
      for (final name in ccp.keys) {
        buf.writeln(
            'final ${_resolverParam(api, name).type} _${_paramName(name)};');
      }
    }

    buf
      ..writeln('factory $cls({${ctorParams.join(', ')},}) {')
      ..writeln('final service = ${buildServiceMetadata(api)};')
      ..writeln('return $cls._(')
      ..writeln('protocol: _s.$protocolClass($protocolArgs,),');
    if (perRequest) {
      buf
        ..writeln('service: service,')
        ..writeln('region: region,')
        ..writeln('endpointUrl: endpointUrl,')
        ..writeln('useFipsEndpoint: useFipsEndpoint,')
        ..writeln('useDualStackEndpoint: useDualStackEndpoint,');
      for (final name in ccp.keys) {
        buf.writeln('${_paramName(name)}: ${_paramName(name)},');
      }
    }
    buf
      ..writeln(');')
      ..writeln('}');

    final privParams = <String>['required _s.$protocolClass protocol'];
    final privInits = <String>['_protocol = protocol'];
    if (perRequest) {
      privParams.addAll([
        'required _s.ServiceMetadata service',
        'required String? region',
        'required String? endpointUrl',
        'required bool useFipsEndpoint',
        'required bool useDualStackEndpoint',
      ]);
      privInits.addAll([
        '_service = service',
        '_region = region',
        '_endpointUrl = endpointUrl',
        '_useFipsEndpoint = useFipsEndpoint',
        '_useDualStackEndpoint = useDualStackEndpoint',
      ]);
      for (final name in ccp.keys) {
        privParams.add(
            'required ${_resolverParam(api, name).type} ${_paramName(name)}');
        privInits.add('_${_paramName(name)} = ${_paramName(name)}');
      }
    }
    buf.writeln(
        '$cls._({${privParams.join(', ')},}) : ${privInits.join(', ')};');

    if (perRequest) buf.writeln(_buildEndpointHelper(api));
    return buf.toString();
  }

  String _buildEndpointHelper(Api api) {
    final ccp = _clientContextParams(api);
    final opParams = _operationParamNames(api);
    final opSet = opParams.toSet();

    final helperParams = opParams
        .map((name) => '${_nullableType(api, name)} ${_paramName(name)}')
        .join(', ');

    String opForward(String name) {
      final dart = _paramName(name);
      // An operation param that is also client config falls back to the client
      // field; otherwise to the rule-set default (when the resolver param is
      // non-nullable).
      if (ccp.containsKey(name)) return '$dart: $dart ?? _$dart';
      final def = _resolverParam(api, name).def;
      return def != null ? '$dart: $dart ?? $def' : '$dart: $dart';
    }

    final resolveArgs = <String>[
      'region: _region',
      'endpoint: _endpointUrl',
      'useFips: _useFipsEndpoint',
      'useDualStack: _useDualStackEndpoint',
      for (final name in ccp.keys)
        if (!opSet.contains(name)) '${_paramName(name)}: _${_paramName(name)}',
      for (final name in opParams) opForward(name),
    ];
    return '''
_s.Endpoint _resolveEndpoint({$helperParams,}) {
  return _s.Endpoint.fromResolved(
    _endpoints.resolveEndpoint(${resolveArgs.join(', ')},),
    service: _service, region: _region,);
}
''';
  }

  String? buildOperationEndpoint(Api api, Operation op) {
    if (!_hasPerRequest(api)) return null;
    final args = <String>[];
    op.staticContextParams?.forEach((name, value) {
      args.add('${_paramName(name)}: ${_staticValue(value)}');
    });
    for (final m in op.input?.shapeClass?.members ?? const <Member>[]) {
      if (m.contextParam != null) {
        args.add('${_paramName(m.contextParam!)}: ${m.fieldName}');
      }
    }
    if (args.isEmpty) return null;
    return 'endpoint: _resolveEndpoint(${args.join(', ')},),';
  }

  bool _hasHostPrefix(Api api) =>
      api.operations.values.any((op) => op.endpoint != null);

  String? buildHostPrefix(Operation op) {
    final prefix = op.endpoint?.hostPrefix;
    if (prefix == null) return null;
    var expr = prefix;
    for (final m in op.input?.shapeClass?.members ?? const <Member>[]) {
      if (m.hostLabel) {
        expr = expr.replaceAll(
            '{${m.locationName ?? m.name}}', '\${${m.fieldName}}');
      }
    }
    return "hostPrefix: '$expr',";
  }
}

String _encodeQueryParamCode(Shape shape, String variable, {Member? member}) {
  var code = _encodeQueryCode(shape, variable, member: member);
  if (shape.type == 'list') {
    return code;
  } else if (shape.type == 'map') {
    throw StateError('Map is handled at a higher level');
  } else {
    if (shape.type != 'string') {
      code = '$code.toString()';
    }
    return '[$code]';
  }
}

String _encodeQueryCode(Shape shape, String variable,
    {Member? member, Descriptor? descriptor}) {
  if (member?.jsonvalue == true || descriptor?.jsonvalue == true) {
    return 'jsonEncode($variable)';
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.value';
  } else if (shape.type == 'list') {
    final memberShape = shape.member!.shapeClass!;
    var code = _encodeQueryCode(memberShape, 'e', descriptor: shape.member!);
    if (code == 'e' && memberShape.type != 'string') {
      code = 'e.toString()';
    }
    if (code != 'e') {
      final tearoff = RegExp(r'^([\w.$]+)\(e\)$').firstMatch(code);
      return tearoff != null
          ? '$variable.map(${tearoff.group(1)}).toList()'
          : '$variable.map((e) => $code).toList()';
    }
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    variable =
        '_s.${timestampFormat}ToJson($variable)${timestampFormat == 'unixTimestamp' ? '.toString()' : ''}';
  }

  return variable;
}

String _encodeHeaderValue(Shape shape, String variable, {Member? member}) {
  if (member?.jsonvalue == true) {
    return 'base64Encode(utf8.encode(jsonEncode($variable)))';
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.value';
  } else if (shape.type == 'list') {
    final element = shape.member!.shapeClass!;
    if (element.enumeration != null) {
      element.isTopLevelInputEnum = true;
      return "$variable.map((e) => e.value).join(', ')";
    } else if (element.type == 'timestamp') {
      final fmt = element.timestampFormat ?? 'rfc822';
      if (fmt == 'unixTimestamp') {
        return "$variable.map((e) => _s.${fmt}ToJson(e).toString()).join(', ')";
      }
      return "$variable.map(_s.${fmt}ToJson).join(', ')";
    } else if (element.type == 'string') {
      return '_s.encodeHttpHeaderList($variable)';
    } else {
      return "$variable.map((e) => e.toString()).join(', ')";
    }
  } else if (shape.type == 'timestamp') {
    final fmt = member?.timestampFormat ?? shape.timestampFormat ?? 'rfc822';
    final code = '_s.${fmt}ToJson($variable)';
    return fmt == 'unixTimestamp' ? '$code.toString()' : code;
  }
  return '$variable.toString()';
}

String _encodePath(Shape shape, String variable, {Member? member}) {
  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.value';
  } else if (shape.type == 'timestamp') {
    final fmt = member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    final code = '_s.${fmt}ToJson($variable)';
    return fmt == 'unixTimestamp' ? '$code.toString()' : code;
  } else if (const ['integer', 'long', 'double', 'float', 'boolean']
      .contains(shape.type)) {
    return '$variable.toString()';
  }

  return variable;
}
