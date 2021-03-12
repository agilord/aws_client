import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

class QueryServiceBuilder extends ServiceBuilder {
  final Api api;

  QueryServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : 'required';
    return '''
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials? credentials, _s.Client? client,})
  : _protocol = _s.QueryProtocol(client: client, service: ${buildServiceMetadata(api)}, region: region, credentials: credentials,),
  shapes = shapesJson.map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));
  ''';
  }

  @override
  String imports() => "import '${api.fileBasename}.meta.dart';";

  @override
  String operationContent(Operation operation) {
    final parameterShape = api.shapes[operation.parameterType];

    final buf = StringBuffer();
    buf.writeln('    final \$request = <String, dynamic>{};');
    parameterShape?.members?.forEach((member) {
      member.shapeClass.markUsed(true);
      final idempotency =
          member.idempotencyToken ? '?? _s.generateIdempotencyToken()' : '';

      if (member.isRequired || member.idempotencyToken) {
        final code = _encodeQueryCode(member.shapeClass, member.fieldName,
            member: member, maybeNull: false);
        buf.writeln("\$request['${member.name}'] = $code$idempotency;");
      } else {
        final code = _encodeQueryCode(member.shapeClass, 'arg',
            member: member, maybeNull: false);
        buf.writeln(
            "${member.fieldName}?.also((arg) => \$request['${member.name}'] = $code);");
      }
    });
    final params = StringBuffer([
      '\$request, ',
      "action: '${operation.name}',",
      "version: '${api.metadata.apiVersion}',",
      'method: \'${operation.http.method}\', ',
      'requestUri: \'${operation.http.requestUri}\', ',
      'exceptionFnMap: _exceptionFns, ',
      if (operation.input?.shape != null)
        "shape: shapes['${operation.input.shape}'], ",
      'shapes: shapes,',
    ].join());
    if (operation.output?.resultWrapper != null) {
      params.write('resultWrapper: \'${operation.output.resultWrapper}\',');
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

String _encodeQueryCode(Shape shape, String variable,
    {Member member, bool maybeNull}) {
  maybeNull ??= true;
  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable${maybeNull ? '?' : ''}.toValue()${maybeNull ? "??''" : ''}';
  } else if (shape.type == 'list') {
    final code = _encodeQueryCode(shape.member.shapeClass, 'e');
    if (code != 'e') {
      final nullAware = maybeNull ? '?' : '';
      return '$nullAware$variable$nullAware.map((e) => $code)$nullAware.toList()';
    }
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    variable =
        '_s.${timestampFormat}ToJson($variable)${timestampFormat == 'unixTimestamp' ? '.toString()' : ''}';
  }

  return variable;
}
