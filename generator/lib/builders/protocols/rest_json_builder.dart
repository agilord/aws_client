import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';
import '../builder_utils.dart';
import '../library_builder.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : '@_s.required';
    return '''
  final _s.RestJsonProtocol _protocol;
  ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
  : _protocol = _s.RestJsonProtocol(client: client, service: ${buildServiceMetadata(api)}, region: region, credentials: credentials, endpointUrl: endpointUrl,);
  ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final inputShape = operation.input?.shapeClass;

    buildRequestHeaders(operation, buf);
    buildRequestQueryParams(operation, buf);

    final outputShape = operation.output?.shapeClass;

    var payloadCode = 'payload: null,';
    if (!operation.http.bodyForbidden && inputShape != null) {
      final payload = operation.input.payloadMember;
      if (payload == null) {
        if (inputShape.hasBodyMembers) {
          buf.writeln('final \$payload = <String, dynamic>{');
          for (var member in inputShape.members.where((m) => m.isBody)) {
            if (!member.isRequired) {
              buf.writeln('if (${member.fieldName} != null)');
            }
            final encodeCode = encodeJsonCode(
                member.shapeClass, member.fieldName,
                member: member, maybeNull: member.isRequired);
            final location = member.locationName ??
                member.shapeClass.locationName ??
                member.name;
            buf.writeln("'$location': $encodeCode,");
          }
          buf.writeln('};');
          payloadCode = 'payload: \$payload,';
        }
      } else {
        payloadCode = 'payload: ${payload.fieldName},';
      }
    }
    var isBlobResponse = false;
    Member payloadMember;
    if (outputShape?.payload != null) {
      payloadMember = outputShape.membersMap[outputShape.payload];
      isBlobResponse = payloadMember.shapeClass.type == 'blob';
    }
    final isInlineExtraction =
        payloadMember != null || outputShape?.hasHeaderMembers == true;

    buf.writeln(
        '${outputShape != null ? 'final response = ' : ''}await _protocol.send${isInlineExtraction ? 'Raw' : ''}($payloadCode');

    buf.writeln([
      'method: \'${operation.http.method}\',',
      'requestUri: \'${buildRequestUri(operation)}\',',
      if (inputShape?.hasQueryMembers ?? false) 'queryParams: \$query,',
      if (inputShape?.hasHeaderMembers ?? false) 'headers: headers,',
      'exceptionFnMap: _exceptionFns,',
    ].join('\n'));
    buf.writeln(');');

    if (outputShape != null) {
      final outputShape = operation.output.shapeClass;
      if (!isBlobResponse && isInlineExtraction) {
        buf.writeln('final \$json = await _s.jsonFromResponse(response);');
      }

      buf.writeln('return ${outputShape.className}');
      if (isInlineExtraction) {
        buf.writeln('(');
        if (isBlobResponse) {
          buf.writeln(
              '${payloadMember.fieldName}: await response.stream.toBytes(),');
        } else if (payloadMember != null) {
          buf.writeln(
              '${payloadMember.fieldName}: ${payloadMember.shapeClass.className}.fromJson(\$json),');
        } else {
          for (var member in outputShape.members.where((m) => m.isBody)) {
            buf.writeln(
                "${member.fieldName}: ${extractJsonCode(member.shapeClass, "\$json['${member.locationName ?? member.name}']", member: member)},");
          }
        }
        for (var member in outputShape.members.where((m) => m.isHeader)) {
          buf.writeln(
              "${member.fieldName}: ${extractHeaderCode(member, 'response.headers')},");
        }
        for (var member in outputShape.members.where((m) => m.isStatusCode)) {
          buf.writeln('${member.fieldName}: response.statusCode,');
        }
        buf.writeln(');');
      } else {
        buf.writeln('.fromJson(response);');
      }
    }
    return buf.toString();
  }
}
