import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class JsonServiceBuilder extends ServiceBuilder {
  final Api api;

  JsonServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : '@_s.required';
    return '''
  final _s.JsonProtocol _protocol;
  ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.JsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    var payload = '';
    if (operation.input != null) {
      final inputShape = operation.input.shapeClass;
      if (inputShape.members.isNotEmpty) {
        inputShape.markUsed(true);
        final payloadCode = StringBuffer();
        for (var member in inputShape.members) {
          payloadCode.writeln('${member.fieldName}: ${member.fieldName},');
        }
        payload = 'payload: ${inputShape.className}($payloadCode),';
      }
    }

    final outputClass = operation.output?.shapeClass?.className;

    return '''
      final headers = <String, String>{
        'Content-Type': 'application/x-amz-json-${api.metadata.jsonVersion ?? '1.0'}',
        'X-Amz-Target': '${api.metadata.targetPrefix}.${operation.name}'
      };
      final jsonResponse = await _protocol.send(
        method: '${operation.http.method}',
        requestUri: '${operation.http.requestUri}',
        exceptionFnMap: _exceptionFns,
        // TODO queryParams
        headers: headers,
        $payload
      );

      ${outputClass == null ? '' : 'return $outputClass.fromJson(jsonResponse.body);'}''';
  }
}
