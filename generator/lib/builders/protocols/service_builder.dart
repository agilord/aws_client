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

    out.writeln('final headers = <String, String>{};');
    for (var m in sc.headerMembers) {
      final location = m.location ?? m.shapeClass.location;
      if (location == 'headers') {
        out.writeln(
            '${m.fieldName}?.forEach((key, value) => headers[\'${m.locationName ?? m.shapeClass.locationName ?? m.name}\$key\'] = value);');
      } else {
        var converter = 'v.toString()';
        if (m.dartType == 'DateTime') {
          final timestampFormat = m.timestampFormat ??
              m.shapeClass.timestampFormat ??
              (location == 'header' ? 'rfc822' : 'iso8601');
          converter = '_s.${timestampFormat}ToJson(v)';
          if (timestampFormat == 'unixTimestamp') {
            converter += '.toString()';
          }
        }
        if (m.shapeClass.enumeration != null) {
          m.shapeClass.isTopLevelInputEnum = true;
          converter = 'v.toValue()';
        }
        out.writeln(
            '${m.fieldName}?.let((v) => headers[\'${m.locationName ?? m.shapeClass.locationName ?? m.name}\'] = $converter);');
      }
    }
  }

  String buildRequestUri(Operation operation) {
    // TODO implement UriEscape and UriEscapePath according to https://github.com/aws/aws-sdk-js/blob/master/lib/util.js#L39..L57
    var uri = operation.http.requestUri.replaceAll(r'$', r'\$');
    final sc = operation.input?.shapeClass;
    if (sc != null) {
      sc.uriMembers.forEach((m) {
        final fieldCode = _encodePath(m.shapeClass, m.fieldName);
        uri = uri
            .replaceAll('{${m.locationName ?? m.name}}',
                '\${Uri.encodeComponent($fieldCode)}')
            .replaceAll('{${m.locationName ?? m.name}+}',
                "\${$fieldCode.split('/').map(Uri.encodeComponent).join('/')}");
      });
    }
    return uri;
  }

  void buildRequestQueryParams(Operation operation, StringBuffer out) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasQueryMembers) return;

    out.writeln('final \$query = <String, List<String>>{');
    for (final member in sc.queryMembers) {
      final location =
          member.locationName ?? member.shapeClass.locationName ?? member.name;

      out.writeln('if(${member.fieldName} != null)');
      if (member.shapeClass.type == 'map') {
        final variable = _encodeQueryParamCode(
            member.shapeClass.value.shapeClass, 'e.value',
            member: member, maybeNull: false);
        out.writeln('for (var e in ${member.fieldName}.entries)');
        out.writeln('e.key: $variable,');
      } else {
        final variable = _encodeQueryParamCode(
            member.shapeClass, member.fieldName,
            member: member, maybeNull: false);
        out.writeln("'$location': $variable,");
      }
    }
    out.writeln('};');
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

String _encodeQueryParamCode(Shape shape, String variable,
    {Member member, bool maybeNull = false}) {
  var code = _queryCode(shape, variable, member: member, maybeNull: maybeNull);
  if (shape.type == 'list') {
    return code;
  } else if (shape.type == 'map') {
    throw StateError('Map is handled at a higher level');
  } else {
    if (shape.type != 'string') {
      code = '$code.toString()';
    }
    return '[$code]';
  }
}

String _queryCode(Shape shape, String variable,
    {Member member, bool maybeNull = false}) {
  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable${maybeNull ? '?' : ''}.toValue()${maybeNull ? "??''" : ''}';
  } else if (shape.type == 'list') {
    final code = _queryCode(shape.member.shapeClass, 'e', maybeNull: true);
    if (code != 'e') {
      final nullAware = maybeNull ? '?' : '';
      return '$nullAware$variable$nullAware.map((e) => $code)$nullAware.toList()';
    }
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    variable =
        '_s.${timestampFormat}ToJson($variable)${timestampFormat == 'unixTimestamp' ? '.toString()' : ''}';
  }

  return variable;
}

String _encodePath(Shape shape, String variable) {
  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.toValue()';
  } else if (const ['integer', 'long'].contains(shape.type)) {
    return '$variable.toString()';
  }

  return variable;
}
