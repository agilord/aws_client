import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class QueryServiceBuilder extends ServiceBuilder {
  final Api api;

  QueryServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : '@_s.required';
    return '''
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials credentials, _s.Client client,})
  : _protocol = _s.QueryProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials,),
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
      var serializationSuffix = '';
      if (member.shapeClass.enumeration != null) {
        member.shapeClass.isTopLevelInputEnum = true;
        serializationSuffix = '.toValue()';
      }
      if (member.isRequired) {
        buf.writeln(
            "\$request['${member.name}'] = ${member.fieldName}$serializationSuffix;");
      } else {
        buf.writeln(
            "${member.fieldName}?.also((arg) => \$request['${member.name}'] = arg$serializationSuffix);");
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
        "shape: shapes['${operation.input.shape}'], shapes: shapes,",
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
