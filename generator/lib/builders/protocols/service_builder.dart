import 'package:aws_client.generator/model/api.dart';
import 'package:aws_client.generator/model/operation.dart';
import 'package:aws_client.generator/model/shape.dart';

abstract class ServiceBuilder {
  String imports();

  String constructor();

  String operationContent(Operation operation);

  void buildRequestHeaders(Operation operation, StringBuffer out) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasHeaderMembers) return;
    _buildMap(out, sc.headerMembers, 'headers');
  }

  String buildRequestUri(Operation operation) {
    // TODO implement UriEscape and UriEscapePath according to https://github.com/aws/aws-sdk-js/blob/master/lib/util.js#L39..L57
    var uri = operation.http.requestUri.replaceAll(r'$', r'\$');
    final sc = operation.input?.shapeClass;
    if (sc != null) {
      sc.uriMembers.forEach((m) {
        uri = uri
            .replaceAll('{${m.locationName ?? m.name}}',
                '\${Uri.encodeComponent(${m.fieldName}.toString())}')
            .replaceAll('{${m.locationName ?? m.name}+}',
                '\${Uri.encodeComponent(${m.fieldName}.toString())}');
      });
    }
    return uri;
  }

  void buildRequestQueryParams(Operation operation, StringBuffer out) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasQueryMembers) return;
    _buildMap(out, sc.queryMembers, 'queryParams');
  }

  void _buildMap(StringBuffer out, Iterable<Member> members, String varName) {
    out.writeln('final $varName = <String, String>{};');
    members.forEach((m) {
      if (m.location == 'headers') {
        out.writeln(
            '${m.fieldName}?.forEach((key, value) => $varName[\'${m.locationName ?? m.name}\$key\'] = value);');
      } else {
        var converter = 'v.toString()';
        if (m.dartType == 'DateTime') {
          converter = 'v.toUtc().toIso8601String()';
        }
        if (m.shapeClass.enumeration != null) {
          m.shapeClass.isTopLevelInputEnum = true;
          converter = 'v.toValue()';
        }
        out.writeln(
            '${m.fieldName}?.let((v) => $varName[\'${m.locationName ?? m.name}\'] = $converter);');
      }
    });
  }

  String buildServiceMetadata(Api api) {
    final args = StringBuffer();
    args.writeln("endpointPrefix: '${api.metadata.endpointPrefix}',");
    if (api.metadata.signingName != null) {
      args.writeln("signingName: '${api.metadata.signingName}',");
    }
    return '_s.ServiceMetadata($args)';
  }
}
