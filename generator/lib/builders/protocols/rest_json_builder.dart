import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : '@_s.required';
    return '''
  final _s.RestJsonProtocol _protocol;
  ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.RestJsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final inputShape = operation.input?.shapeClass;

    buildRequestHeaders(operation, buf);

    final hasQueryMembers = inputShape?.hasQueryMembers == true;

    if (hasQueryMembers) {
      buf.writeln("var _query = '';");
      buf.writeln("_query = '?\${[");
      for (final member in inputShape.queryMembers) {
        buf.writeln('if(${member.fieldName} != null)');
        buf.writeln(
            '_s.toQueryParam(${member.locationName == null ? 'null' : "'${member.locationName}'"}, ${member.fieldName}),');
      }
      buf.writeln("].where((e) => e != null).join('&')}';");
    }

    final outputClass = operation.output?.shapeClass?.className;

    if (!operation.http.bodyForbidden && inputShape != null) {
      final payload = operation.input.payloadMember;
      if (payload == null) {
        final members = inputShape.members;
        buf.write('final \$payload = ');
        if (members.isNotEmpty) {
          inputShape.markUsed(true);
          buf.write('${inputShape.className}(');
          for (var member in members) {
            buf.write('${member.fieldName}: ${member.fieldName},');
          }
          buf.writeln(');');
        } else {
          buf.write('<String, dynamic>{};');
        }
        buf.writeln(
            '${outputClass != null ? 'final response = ' : ''}await _protocol.send(payload: \$payload,');
      } else {
        buf.writeln(
            '${outputClass != null ? 'final response = ' : ''}await _protocol.send(payload: ${payload.fieldName},');
      }
    } else {
      buf.writeln(
          '${outputClass != null ? 'final response = ' : ''}await _protocol.send(payload: null,');
    }
    if (inputShape?.hasHeaderMembers == true) {
      buf.writeln('headers: headers,');
    }

    buf.writeln('method: \'${operation.http.method}\', '
        "requestUri: '${buildRequestUri(operation)}${hasQueryMembers ? '\$_query' : ''}', "
        'exceptionFnMap: _exceptionFns, '
        ');');

    if (outputClass != null) {
      var responseCode = 'response';
      final responsePayload = operation.output.shapeClass.payload;
      if (responsePayload != null) {
        responseCode = "{...response, '$responsePayload': response}";
      }

      buf.writeln('return $outputClass.fromJson($responseCode);');
    }
    return buf.toString();
  }
}
