import '../../model/api.dart';
import '../../model/operation.dart';
import '../../model/shape.dart';
import '../builder_utils.dart';
import '../library_builder.dart';
import 'service_builder.dart';

class RestJsonServiceBuilder extends ServiceBuilder {
  final Api api;

  RestJsonServiceBuilder(this.api);

  @override
  String constructor() => buildProtocolConstructor(api, 'RestJsonProtocol');

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
      final payload = operation.input!.payloadMember;
      if (payload == null) {
        if (inputShape.hasBodyMembers) {
          buf.writeln('final \$payload = <String, dynamic>{');
          for (var member in inputShape.members.where((m) => m.isBody)) {
            if (!member.isRequired && !member.idempotencyToken) {
              buf.writeln('if (${member.fieldName} != null)');
            }
            final encodeCode = encodeJsonCode(
                member.shapeClass!, member.fieldName,
                member: member, nullability: Nullability.none);
            final location = member.locationName ??
                member.shapeClass!.locationName ??
                member.name;
            final idempotency = member.idempotencyToken
                ? '?? _s.generateIdempotencyToken()'
                : '';
            buf.writeln("'$location': $encodeCode$idempotency,");
          }
          buf.writeln('};');
          payloadCode = 'payload: \$payload,';
        }
      } else {
        final idempotency =
            payload.idempotencyToken ? '?? _s.generateIdempotencyToken()' : '';
        payloadCode = 'payload: ${payload.fieldName}$idempotency,';
      }
    }
    var isBlobResponse = false;
    Member? payloadMember;
    if (outputShape?.payload != null) {
      payloadMember = outputShape!.membersMap![outputShape.payload];
      isBlobResponse = payloadMember!.shapeClass!.type == 'blob';
    }
    final payloadShape = payloadMember?.shapeClass;
    final isRawPayload = payloadShape != null &&
        (payloadShape.type == 'blob' ||
            (payloadShape.type == 'string' &&
                payloadShape.className != 'string'));
    final isInlineExtraction =
        payloadMember != null || outputShape?.hasHeaderMembers == true;
    final hasOutputShape = outputShape != null;
    buf.writeln(
        '${hasOutputShape ? 'final response = ' : ''}await _protocol.send${isInlineExtraction ? 'Raw' : ''}($payloadCode');

    buf.writeln([
      'method: \'${operation.http.method}\',',
      'requestUri: \'${buildRequestUri(operation)}\',',
      if (operation.authtype == 'none') 'signed: false,',
      if (inputShape?.hasQueryMembers ?? false) 'queryParams: \$query,',
      if (inputShape?.hasHeaderMembers ?? false) 'headers: headers,',
      if (buildOperationEndpoint(api, operation) case final ep?) ep,
      if (buildHostPrefix(operation) case final hp?) hp,
      'exceptionFnMap: _exceptionFns,',
    ].join('\n'));
    buf.writeln(');');

    if (operation.hasReturnType) {
      final outputShape = operation.output!.shapeClass;
      if (!isRawPayload && isInlineExtraction) {
        buf.writeln('final \$json = await _s.jsonFromResponse(response);');
      }

      buf.writeln('return ${outputShape!.className}');
      if (isInlineExtraction) {
        outputShape.excludeFactoryMethod = true;
        buf.writeln('(');
        if (isBlobResponse) {
          buf.writeln(
              '${payloadMember!.fieldName}: await response.stream.toBytes(),');
        } else if (payloadMember != null) {
          final shape = payloadMember.shapeClass!;
          final field = payloadMember.fieldName;
          if (shape.className == 'string') {
            buf.writeln('$field: jsonEncode(\$json),');
          } else if (shape.enumeration?.isNotEmpty ?? false) {
            buf.writeln(
                '$field: ${shape.className}.fromString(await response.stream.bytesToString()),');
          } else if (shape.type == 'string') {
            buf.writeln('$field: await response.stream.bytesToString(),');
          } else if (shape.type == 'document') {
            buf.writeln('$field: \$json,');
          } else {
            buf.writeln('$field: ${shape.className}.fromJson(\$json),');
          }
        } else {
          for (var member in outputShape.members.where((m) => m.isBody)) {
            final nullability =
                member.isRequired ? Nullability.input : Nullability.inputOutput;
            final extractCode = extractJsonCode(member.shapeClass!,
                "\$json['${member.locationName ?? member.name}']",
                member: member, nullability: nullability);
            buf.writeln('${member.fieldName}: $extractCode,');
          }
        }
        for (var member in outputShape.members.where((m) => m.isHeader)) {
          var headerCode = extractHeaderCode(member, 'response.headers');
          if (member.isRequired) {
            if (headerCode.contains('?.')) {
              headerCode = '($headerCode)';
            }
            headerCode += '!';
          }
          buf.writeln('${member.fieldName}: $headerCode,');
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
