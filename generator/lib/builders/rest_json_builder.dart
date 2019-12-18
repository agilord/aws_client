import 'package:aws_client.generator/builders/builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);

  @override
  String constructor() => '''
  final RestJsonProtocol _protocol;
  ${api.metadata.className}({@required String region, @required _src_credentials.Credentials credentials, Client client, String endpointUrl,})
  : _protocol = RestJsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';

  @override
  String imports() =>
      "import 'package:aws_client/src/protocol/rest-json.dart';";

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final input = operation.input;
    final members = input?.shapeClass?.members;
    final uriMembers = members?.where((m) => m.location == 'uri');
    final headerMembers =
        members?.where((m) => m.location?.contains('header') == true);
    if (headerMembers != null && headerMembers.isNotEmpty) {
      buf.writeln('final headers = <String, String>{};');
      headerMembers.forEach((m) {
        if (m.location == 'headers') {
          buf.writeln(
              '${m.fieldName}.forEach((key, value) => headers[${m.name} + key] = value);');
        } else {
          buf.writeln("headers['${m.name}'] = ${m.fieldName};");
        }
      });
    }
    if (!operation.http.bodyForbidden && input != null) {
      final payload = input?.shapeClass?.payloadMember;
      if (payload == null) {
        buf.writeln('final payload = <String, dynamic>{');
        members.where((m) => m.location == null).forEach((member) {
          buf.writeln("'${member.name}': ${member.fieldName},");
        });
        buf.writeln('};');
        buf.writeln('await _protocol.send(payload,');
      } else {
        buf.writeln('await _protocol.send(${payload.fieldName},');
      }

      var uri = operation.http.requestUri;
      uriMembers?.forEach((m) {
        uri = uri.replaceAll('{${m.locationName}}', '\$${m.fieldName}');
      });

      if (headerMembers != null && headerMembers.isNotEmpty) {
        buf.writeln('headers: headers,');
      }

      buf.writeln('method: \'${operation.http.method}\', '
          'requestUri: \'$uri\', '
          'exceptionFnMap: _exceptionFns, '
          ');');
    } else {}
    buf.writeln('''// TODO: implement rest-json
      throw UnimplementedError();''');
    return buf.toString();
  }
}
