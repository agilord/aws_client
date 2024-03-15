import '../../model/api.dart';
import '../../model/dart_type.dart';
import '../../model/operation.dart';
import '../../model/shape.dart';
import '../builder_utils.dart';
import '../library_builder.dart';
import 'service_builder.dart';

class RestXmlServiceBuilder extends ServiceBuilder {
  final Api api;

  RestXmlServiceBuilder(this.api);

  @override
  String constructor() {
    final isRegionRequired = !api.isGlobalService;
    return '''
    final _s.RestXmlProtocol _protocol;
    ${api.metadata.className}({
      ${isRegionRequired ? 'required String' : 'String?'} region,
      _s.AwsClientCredentials? credentials,
      _s.AwsClientCredentialsProvider? credentialsProvider,
      _s.Client? client,
      String? endpointUrl,
    })
    : _protocol = _s.RestXmlProtocol(
        client: client, 
        service: ${buildServiceMetadata(api)}, 
        region: region, 
        credentials: credentials, 
        credentialsProvider: credentialsProvider, 
        endpointUrl: endpointUrl,
      );
    ''';
  }

  @override
  String imports() => '';

  @override
  String operationContent(Operation operation) {
    final buf = StringBuffer();
    final input = operation.input;
    final shapeClass = operation.input?.shapeClass;

    if (shapeClass != null) {
      for (var m in shapeClass.members) {
        if (m.idempotencyToken) {
          buf.writeln('${m.fieldName} ??= _s.generateIdempotencyToken();');
        }
      }
    }

    buildRequestHeaders(operation, buf);
    buildRequestQueryParams(operation, buf);
    String? payloadArg;
    if (shapeClass?.payload != null) {
      final payloadMember =
          shapeClass!.members.firstWhere((m) => m.name == shapeClass.payload);
      if (payloadMember.streaming) {
        payloadArg = payloadMember.fieldName;
      } else if (payloadMember.shapeClass!.enumeration != null) {
        payloadMember.shapeClass!.isTopLevelInputEnum = true;
        payloadArg = '${payloadMember.fieldName}?.toValue()';
      } else if (payloadMember.shapeClass!.type.isBasicType()) {
        payloadArg = payloadMember.fieldName;
      } else {
        payloadArg =
            '${payloadMember.fieldName}${payloadMember.isRequired ? '' : '?'}.toXml(\'${payloadMember.locationName ?? shapeClass.payload}\')';
      }
    } else if (shapeClass != null) {
      final bodyMembers = shapeClass.members.where((m) => m.isBody);
      if (bodyMembers.isNotEmpty) {
        shapeClass.markUsed(true);
        final tagName =
            input!.locationName ?? shapeClass.locationName ?? shapeClass.name;

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
      if (operation.authtype == 'none') 'signed: false,',
      if (shapeClass?.hasQueryMembers ?? false) 'queryParams: \$query,',
      if (shapeClass?.hasHeaderMembers ?? false) 'headers: headers,',
      if (payloadArg != null) 'payload: $payloadArg,',
      'exceptionFnMap: _exceptionFns,',
    ];
    var resultWrapperParam = '';
    if (operation.output?.resultWrapper != null) {
      resultWrapperParam =
          'resultWrapper: \'${operation.output!.resultWrapper}\',';
    }

    var isBlobPayload = false, isStringPayload = false;
    Member? payloadMember;
    final outputShape = operation.output?.shapeClass;
    if (outputShape?.payload != null) {
      payloadMember = outputShape!.membersMap![outputShape.payload];
      isBlobPayload = payloadMember!.shapeClass!.type == 'blob';
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
        outputShape!.excludeFactoryMethod = true;
        buf.writeln('(');
        if (isBlobPayload) {
          buf.writeln(
              '${payloadMember!.fieldName}: await \$result.stream.toBytes(),');
        } else if (isStringPayload) {
          buf.writeln(
              '${payloadMember!.fieldName}: await \$result.stream.bytesToString(),');
        } else if (payloadMember != null) {
          buf.writeln(
              '${payloadMember.fieldName}: ${payloadMember.shapeClass!.className}.fromXml(\$elem),');
        } else {
          for (var member in outputShape.members.where((m) => m.isBody)) {
            final extractor = extractXmlCode(
              member.shapeClass!,
              elemVar: '\$elem',
              elemName: member.locationName ??
                  member.shapeClass!.locationName ??
                  member.name,
              flattened: member.flattened,
              container: operation.output!.shapeClass!,
              member: member,
              nullability: member.isRequired
                  ? Nullability.input
                  : Nullability.inputOutput,
            );
            buf.writeln('${member.fieldName}: $extractor,');
          }
        }
        for (var member in outputShape.members.where((m) => m.isHeader)) {
          buf.writeln(
              "${member.fieldName}: ${extractHeaderCode(member, '\$result.headers')}${member.isRequired ? '!' : ''},");
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
