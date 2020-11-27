import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/dart_type.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

import '../library_builder.dart';

class RestXmlServiceBuilder extends ServiceBuilder {
  final Api api;

  RestXmlServiceBuilder(this.api);

  @override
  String constructor() {
    final regionRequired = api.isGlobalService ? '' : '@_s.required';
    return '''
    final _s.RestXmlProtocol _protocol;
    ${api.metadata.className}({$regionRequired String region, _s.AwsClientCredentials credentials, _s.Client client, String endpointUrl,})
        : _protocol = _s.RestXmlProtocol(client: client, service: ${buildServiceMetadata(api)}, region: region, credentials: credentials, endpointUrl: endpointUrl,);
    ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final input = operation.input;
    final shapeClass = operation.input?.shapeClass;
    buildRequestHeaders(operation, buf);
    buildRequestQueryParams(operation, buf);
    String payloadArg;
    if (shapeClass?.payload != null) {
      final payloadMember =
          shapeClass.members.firstWhere((m) => m.name == shapeClass.payload);
      if (payloadMember.streaming) {
        payloadArg = payloadMember.fieldName;
      } else if (payloadMember.shapeClass.enumeration != null) {
        payloadMember.shapeClass.isTopLevelInputEnum = true;
        payloadArg = '${payloadMember.fieldName}?.toValue()';
      } else if (payloadMember.shapeClass.type.isBasicType()) {
        payloadArg = payloadMember.fieldName;
      } else {
        payloadArg =
            '${payloadMember.fieldName}${payloadMember.isRequired ? '' : '?'}.toXml(\'${shapeClass.payload}\')';
      }
    } else if (shapeClass != null) {
      final bodyMembers = shapeClass.members.where((m) => m.isBody);
      if (bodyMembers.isNotEmpty) {
        shapeClass.markUsed(true);
        final tagName =
            input.locationName ?? shapeClass.locationName ?? shapeClass.name;

        var extraParameters = '';
        final xmlNamespace = input.xmlNamespace;
        if (xmlNamespace != null) {
          extraParameters =
              ", attributes: [${xmlNamespaceToCode(xmlNamespace, importPrefix: '_s.')},],";
        }
        payloadArg =
            "${shapeClass.className}(${shapeClass.members.map((m) => '${m.fieldName}: ${m.fieldName}').join(',')}).toXml('$tagName'$extraParameters)";
      }
    }

    final params = [
      'method: \'${operation.http.method}\',',
      'requestUri: \'${buildRequestUri(operation)}\',',
      if (shapeClass?.hasQueryMembers ?? false) 'queryParams: queryParams,',
      if (shapeClass?.hasHeaderMembers ?? false) 'headers: headers,',
      if (payloadArg != null) 'payload: $payloadArg,',
      'exceptionFnMap: _exceptionFns,',
    ];
    var resultWrapperParam = '';
    if (operation.output?.resultWrapper != null) {
      resultWrapperParam =
          'resultWrapper: \'${operation.output.resultWrapper}\',';
    }

    var isBlobPayload = false, isStringPayload = false;
    Member payloadMember;
    final outputShape = operation.output?.shapeClass;
    if (outputShape?.payload != null) {
      payloadMember = outputShape.membersMap[outputShape.payload];
      isBlobPayload = payloadMember.shapeClass.type == 'blob';
      isStringPayload = payloadMember.dartType == 'String';
    }
    final isInlineExtraction =
        payloadMember != null || outputShape?.hasHeaderMembers == true;

    if (!isInlineExtraction) {
      params.add(resultWrapperParam);
    }

    buf.writeln(
        '${operation.hasReturnType ? 'final \$result =' : ''}await _protocol.send${isInlineExtraction ? 'Raw' : ''}(${params.join('\n')});');

    if (operation.hasReturnType) {
      if (!isBlobPayload && !isStringPayload && isInlineExtraction) {
        buf.writeln(
            'final \$elem = await _s.xmlFromResponse(\$result$resultWrapperParam);');
      }

      buf.writeln('return ${operation.returnType}');

      if (isInlineExtraction) {
        buf.writeln('(');
        if (isBlobPayload) {
          buf.writeln(
              '${payloadMember.fieldName}: await \$result.stream.toBytes(),');
        } else if (isStringPayload) {
          buf.writeln(
              '${payloadMember.fieldName}: await \$result.stream.bytesToString(),');
        } else if (payloadMember != null) {
          buf.writeln(
              '${payloadMember.fieldName}: ${payloadMember.shapeClass.className}.fromXml(\$elem),');
        } else {
          for (var member in outputShape.members.where((m) => m.isBody)) {
            final extractor = extractXmlCode(
              member.shapeClass,
              elemVar: '\$elem',
              elemName: member.locationName ??
                  member.shapeClass.locationName ??
                  member.name,
              flattened: member.flattened,
              container: operation.output.shapeClass,
              member: member,
            );
            buf.writeln('${member.fieldName}: $extractor,');
          }
        }
        for (var member in outputShape.members.where((m) => m.isHeader)) {
          buf.writeln(
              "${member.fieldName}: ${extractHeaderCode(member, '\$result.headers')},");
        }
        for (var member in outputShape.members.where((m) => m.isStatusCode)) {
          buf.writeln('${member.fieldName}: \$result.statusCode,');
        }
        buf.writeln(');');
      } else {
        buf.writeln('.fromXml(\$result.body);');
      }
    }
    return buf.toString();
  }
}
