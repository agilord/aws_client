import 'package:aws_client.generator/model/operation.dart';

abstract class ServiceBuilder {
  String imports();

  String constructor();

  String operationContent(Operation operation);

  void buildRequestHeaders(Operation operation, StringBuffer out) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasHeaderMembers) return;
    out.writeln('final headers = <String, String>{};');
    sc.headerMembers.forEach((m) {
      if (m.location == 'headers') {
        out.writeln(
            '${m.fieldName}?.forEach((key, value) => headers[\'${m.locationName ?? m.name}\$key\'] = value);');
      } else {
        // TODO: implement proper value -> String conversion (e.g. date values).
        out.writeln(
            '${m.fieldName}?.let((v) => headers[\'${m.locationName ?? m.name}\'] = v.toString());');
      }
    });
  }

  String buildRequestUri(Operation operation) {
    var uri = operation.http.requestUri.replaceAll(r'$', r'\$');
    final sc = operation.input?.shapeClass;
    if (sc != null) {
      sc.uriMembers.forEach((m) {
        uri = uri
            .replaceAll('{${m.locationName ?? m.name}}', '\$${m.fieldName}')
            .replaceAll('{${m.locationName ?? m.name}+}', '\$${m.fieldName}');
      });
    }
    return uri;
  }
}
