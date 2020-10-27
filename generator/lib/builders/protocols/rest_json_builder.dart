import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);

  @override
  String constructor() => '''
  final _s.RestJsonProtocol _protocol;
  ${api.metadata.className}({@_s.required String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.RestJsonProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';

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
      final payload = inputShape?.payloadMember;
      if (payload == null) {
        buf.writeln('final \$payload = <String, dynamic>{');
        inputShape.members.where((m) => m.isBody).forEach((member) {
          var serializationSuffix = '';
          if (member.shapeClass.enumeration != null) {
            member.shapeClass.isTopLevelInputEnum = true;
            serializationSuffix = '?.toValue()';
          }

          var fieldAccess = '${member.fieldName}$serializationSuffix';
          if (member.shapeClass.type == 'blob') {
            fieldAccess = 'base64Encode($fieldAccess)';
          }

          if (!member.isRequired) {
            buf.writeln('if (${member.fieldName} != null)');
          }
          buf.writeln("'${member.name}': $fieldAccess,");
        });
        buf.writeln('};');
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
      buf.writeln('return $outputClass.fromJson(response);');
    }
    return buf.toString();
  }
}
