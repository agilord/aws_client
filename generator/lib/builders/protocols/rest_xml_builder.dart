import 'package:aws_client.generator/builders/protocols/service_builder.dart';
import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/dart_type.dart';
import 'package:aws_client.generator/model/operation.dart';

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
        : _protocol = _s.RestXmlProtocol(client: client, service: \'${api.metadata.endpointPrefix}\', region: region, credentials: credentials, endpointUrl: endpointUrl,);
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
        payloadArg = 'payload: ${payloadMember.fieldName},';
      } else if (payloadMember.shapeClass.enumeration != null) {
        payloadMember.shapeClass.isTopLevelInputEnum = true;
        payloadArg = 'payload: ${payloadMember.fieldName}?.toValue(),';
      } else if (payloadMember.shapeClass.type.isBasicType()) {
        payloadArg = 'payload: ${payloadMember.fieldName},';
      } else {
        payloadArg =
            'payload: ${payloadMember.fieldName}${payloadMember.isRequired ? '' : '?'}.toXml(\'${shapeClass.payload}\'),';
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
            "payload: ${shapeClass.className}(${bodyMembers.map((m) => '${m.fieldName}: ${m.fieldName}').join(',')}).toXml('$tagName'$extraParameters),";
      }
    }

    final params = [
      'method: \'${operation.http.method}\',',
      'requestUri: \'${buildRequestUri(operation)}\',',
      if (shapeClass?.hasQueryMembers ?? false) 'queryParams: queryParams,',
      if (shapeClass?.hasHeaderMembers ?? false) 'headers: headers,',
      if (payloadArg != null) payloadArg,
      'exceptionFnMap: _exceptionFns,',
    ];
    if (operation.output?.resultWrapper != null) {
      params.add('resultWrapper: \'${operation.output.resultWrapper}\',');
    }
    if (operation.hasReturnType) {
      buf.writeln(
          '    final \$result = await _protocol.send(${params.join('\n')});');
      var fromXmlParams = '';
      if (operation.output.shapeClass.hasHeaderMembers ?? false) {
        fromXmlParams += ', headers: \$result.headers';
      }
      buf.writeln(
          '    return ${operation.returnType}.fromXml(\$result.body$fromXmlParams);');
    } else {
      buf.writeln('    await _protocol.send(${params.join('\n')});');
    }
    return buf.toString();
  }
}
