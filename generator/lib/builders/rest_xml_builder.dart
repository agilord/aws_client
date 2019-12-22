import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class RestXmlServiceBuilder extends ServiceBuilder {
  final Api api;

  RestXmlServiceBuilder(this.api);

  @override
  String constructor() {
    return '''
    final RestXmlProtocol _protocol;
    ${api.metadata.className}({@_meta.required String region, @_meta.required _src_credentials.Credentials credentials, Client client, String endpointUrl,})
        : _protocol = RestXmlProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
    ''';
  }

  @override
  String imports() => 'import \'package:xml/xml.dart\';\n'
      'import \'package:aws_client/src/protocol/rest-xml.dart\';';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final shapeClass = operation.input?.shapeClass;
    buildRequestHeaders(operation, buf);
    buildRequestQueryParams(operation, buf);

    final params = [
      'method: \'${operation.http.method}\',',
      'requestUri: \'${buildRequestUri(operation)}\',',
      if (shapeClass?.hasQueryMembers ?? false) 'queryParams: queryParams,',
      if (shapeClass?.hasHeaderMembers ?? false) 'headers: headers,',
      'exceptionFnMap: _exceptionFns,',
    ];
    if (operation.output?.resultWrapper != null) {
      params.add('resultWrapper: \'${operation.output.resultWrapper}\',');
    }
    if (operation.hasReturnType) {
      buf.writeln(
          '    final \$result = await _protocol.send(${params.join('\n')});');
      buf.writeln('    return ${operation.returnType}.fromXml(\$result);');
    } else {
      buf.writeln('    await _protocol.send(${params.join('\n')});');
    }
    return buf.toString();
  }
}
