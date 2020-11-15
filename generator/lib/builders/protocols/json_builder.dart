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
  : _protocol = _s.JsonProtocol(client: client, service: ${buildServiceMetadata(api)}, region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final payloadMembers = operation.input?.shapeClass?.members?.map((m) {
      var serializationSuffix = '';
      if (m.shapeClass.enumeration != null) {
        m.shapeClass.isTopLevelInputEnum = true;
        serializationSuffix = '?.toValue()';
      } else if (m.shapeClass.type == 'blob') {
        serializationSuffix = '${m.isRequired ? '?' : ''}.let(base64Encode)';
      }

      final buffer = StringBuffer();
      if (!m.isRequired) {
        buffer.writeln('if (${m.fieldName} != null)');
      }
      buffer.writeln("'${m.name}': ${m.fieldName}$serializationSuffix,");
      return '$buffer';
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
