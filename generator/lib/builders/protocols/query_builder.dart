import '../../model/api.dart';
import '../../model/descriptor.dart';
import '../../model/operation.dart';
import '../../model/shape.dart';
import 'service_builder.dart';

class QueryServiceBuilder extends ServiceBuilder {
  final Api api;

  QueryServiceBuilder(this.api);

  @override
  String constructor() {
    final isRegionRequired = !api.isGlobalService;
    return '''
  final _s.QueryProtocol _protocol;

  ${api.metadata.className}({
    ${isRegionRequired ? 'required String' : 'String?'} region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client, String? endpointUrl,
    })
  : _protocol = _s.QueryProtocol(
      client: client,
      service: ${buildServiceMetadata(api)},
      region: region,
      credentials: credentials,
      credentialsProvider: credentialsProvider,
      endpointUrl: endpointUrl,
    );
  ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final parameterShape = api.shapes[operation.parameterType];

    final buf = StringBuffer();
    buf.writeln('    final \$request = <String, String>{');
    for (var member in parameterShape?.members ?? <Member>[]) {
      member.shapeClass!.markUsed(true);
      final lastName = member.name;
      for (var line in queryLines(member.fieldName,
          member: member, prefixes: [lastName])) {
        buf.writeln(line);
      }
    }
    buf.writeln('};');
    final params = StringBuffer([
      '\$request, ',
      "action: '${operation.name}',",
      "version: '${api.metadata.apiVersion}',",
      'method: \'${operation.http.method}\', ',
      'requestUri: \'${operation.http.requestUri}\', ',
      'exceptionFnMap: _exceptionFns, ',
      if (operation.authtype == 'none') 'signed: false, ',
    ].join());
    if (operation.output?.resultWrapper != null) {
      params.write('resultWrapper: \'${operation.output!.resultWrapper}\',');
    }
    if (operation.hasReturnType) {
      buf.writeln('    final \$result = await _protocol.send($params);');
      buf.writeln('    return ${operation.returnType}.fromXml(\$result);');
    } else {
      buf.writeln('    await _protocol.send($params);');
    }
    return buf.toString();
  }
}

Iterable<String> queryLines(String variable,
    {Member? member,
    Descriptor? descriptor,
    required List<String> prefixes}) sync* {
  final shape = (member?.shapeClass ?? descriptor?.shapeClass)!;

  final idempotency = member?.idempotencyToken ?? false
      ? '?? _s.generateIdempotencyToken()'
      : '';

  if (!(member?.isRequired ?? false) &&
      !(member?.idempotencyToken ?? false) &&
      descriptor == null) {
    yield 'if ($variable != null)';
  }

  if (shape.type == 'structure') {
    final loopVariable = 'e${prefixes.length}';
    yield 'for (var $loopVariable in $variable.toQueryMap().entries)';
    yield "'${prefixes.join('.')}.\${$loopVariable.key}': $loopVariable.value,";
  } else if (shape.type == 'list') {
    yield 'if ($variable.isEmpty)';
    yield "'${prefixes.join('.')}': ''";
    yield 'else';

    final name = shape.member?.locationName ?? member?.locationName;
    if (shape.flattened && name != null) {
      prefixes.removeLast();
      prefixes.add(name);
    }

    final loopVariable = 'i${prefixes.length}';
    yield 'for (var $loopVariable = 0; $loopVariable < $variable.length; $loopVariable++)';
    yield* queryLines('$variable[$loopVariable]',
        descriptor: shape.member!,
        prefixes: [
          ...prefixes,
          if (!shape.flattened) name ?? 'member',
          '\${$loopVariable + 1}'
        ]);
  } else if (shape.type == 'map') {
    // TODO: Once migrated to Dart 3, use .indexed
    final loopVariable = 'e${prefixes.length}';
    yield 'for (var $loopVariable in $variable.entries.toList().asMap().entries) ...{';

    final keyShape = shape.key!.shapeClass!;
    final valueShape = shape.value!.shapeClass!;

    final initialPrefixes = [
      ...prefixes,
      if (!shape.flattened) 'entry',
      '\${$loopVariable.key + 1}',
    ];
    final keyEntryKey = [
      ...initialPrefixes,
      shape.key!.locationName ?? keyShape.locationName ?? 'key'
    ];
    final valueEntryKey = [
      ...initialPrefixes,
      shape.value!.locationName ?? valueShape.locationName ?? 'value'
    ];

    yield* queryLines('$loopVariable.value.key',
        descriptor: shape.key, prefixes: keyEntryKey);
    yield* queryLines('$loopVariable.value.value',
        descriptor: shape.value, prefixes: valueEntryKey);
    yield '},';
  } else {
    final code = _encodeQueryCode(shape, variable,
        member: member, descriptor: descriptor);
    yield "'${prefixes.join('.')}': $code$idempotency,";
  }
}

String _encodeQueryCode(Shape shape, String variable,
    {Member? member, Descriptor? descriptor}) {
  if (member?.jsonvalue == true || descriptor?.jsonvalue == true) {
    return 'jsonEncode($variable)';
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.value';
  } else if (shape.type == 'blob') {
    return 'base64Encode($variable)';
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    variable =
        '_s.${timestampFormat}ToJson($variable)${timestampFormat == 'unixTimestamp' ? '.toString()' : ''}';
  } else if (shape.type == 'string') {
    return variable;
  } else {
    assert(shape.type != 'structure');
    return '$variable.toString()';
  }
  return variable;
}
