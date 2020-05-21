import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class JsonServiceBuilder extends ServiceBuilder {
  final Api api;

  JsonServiceBuilder(this.api);

  @override
  String constructor() => '''
  final _s.JsonProtocol _protocol;
  ${api.metadata.className}({@_s.required String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.JsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final payloadMembers = operation.input?.shapeClass?.members?.map((m) {
      var serializationSuffix = '';
      if (m.shapeClass.enumeration != null) {
        m.shapeClass.isTopLevelInputEnum = true;
        serializationSuffix = '?.toValue()';
      }
      return '''
    '${m.name}': ${m.fieldName}$serializationSuffix,
    ''';
    })?.join();
    var payload = '';
    if (payloadMembers?.isNotEmpty == true) {
      payload = 'payload: {$payloadMembers},';
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
