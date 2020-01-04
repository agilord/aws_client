import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);

  @override
  String constructor() => '''
  final shared.RestJsonProtocol _protocol;
  ${api.metadata.className}({@shared.required String region, @shared.required shared.AwsClientCredentials credentials, shared.Client client, String endpointUrl,})
  : _protocol = shared.RestJsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final shapeClass = operation.input?.shapeClass;
    buildRequestHeaders(operation, buf);
    if (!operation.http.bodyForbidden && shapeClass != null) {
      final payload = shapeClass?.payloadMember;
      if (payload == null) {
        buf.writeln('final \$payload = <String, dynamic>{');
        shapeClass.members.where((m) => m.isBody).forEach((member) {
          buf.writeln("'${member.name}': ${member.fieldName},");
        });
        buf.writeln('};');
        buf.writeln('await _protocol.send(\$payload,');
      } else {
        buf.writeln('await _protocol.send(${payload.fieldName},');
      }
    } else {
      buf.writeln('await _protocol.send(null,');
    }
    if (shapeClass?.hasHeaderMembers == true) {
      buf.writeln('headers: headers,');
    }
    // TODO: handle querystring too

    buf.writeln('method: \'${operation.http.method}\', '
        'requestUri: \'${buildRequestUri(operation)}\', '
        'exceptionFnMap: _exceptionFns, '
        ');');
    buf.writeln('''// TODO: implement rest-json
      throw UnimplementedError();''');
    return buf.toString();
  }
}
