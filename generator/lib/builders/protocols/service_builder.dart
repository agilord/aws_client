import '../../model/api.dart';
import '../../model/descriptor.dart';
import '../../model/operation.dart';
import '../../model/shape.dart';

abstract class ServiceBuilder {
  String imports();

  String constructor();

  String operationContent(Operation operation);

  void buildRequestHeaders(Operation operation, StringBuffer out) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasHeaderMembers) return;

    out.writeln('final headers = <String, String>{');
    for (var m in sc.headerMembers) {
      final headerName = m.locationName ?? m.shapeClass?.locationName ?? m.name;
      final location = m.location ?? m.shapeClass?.location;
      if (!m.isRequired) {
        out.writeln('if (${m.fieldName} != null)');
      }
      if (location == 'headers') {
        out.writeln(
            "...${m.fieldName}.map((key, value) => MapEntry('$headerName\$key', value)),");
      } else {
        final variable = m.fieldName;
        var converter = '$variable.toString()';
        if (m.dartType == 'DateTime') {
          final timestampFormat = m.timestampFormat ??
              m.shapeClass?.timestampFormat ??
              (location == 'header' ? 'rfc822' : 'iso8601');
          converter = '_s.${timestampFormat}ToJson($variable)';
          if (timestampFormat == 'unixTimestamp') {
            converter += '.toString()';
          }
        } else if (m.jsonvalue) {
          converter = 'base64Encode(utf8.encode(jsonEncode($variable)))';
        }
        if (m.shapeClass?.enumeration != null) {
          m.shapeClass?.isTopLevelInputEnum = true;
          converter = '$variable.toValue()';
        }

        out.writeln("'$headerName': $converter,");
      }
    }
    out.writeln('};');
  }

  String buildRequestUri(Operation operation) {
    // TODO implement UriEscape and UriEscapePath according to https://github.com/aws/aws-sdk-js/blob/master/lib/util.js#L39..L57
    var uri = operation.http.requestUri;
    final sc = operation.input?.shapeClass;
    if (sc != null) {
      final allMembersToReplace = sc.uriMembers
          .expand((m) => [
                '{${m.locationName ?? m.name}}',
                '{${m.locationName ?? m.name}+'
              ])
          .toSet();
      for (var m in sc.uriMembers) {
        final fieldCode = _encodePath(m.shapeClass!, m.fieldName);
        uri = uri
            .split('/')
            .map((part) {
              if (!allMembersToReplace.any((e) => part.contains(e)) &&
                  !part.contains('Uri.encodeComponent') &&
                  !part.contains('?')) {
                return Uri.encodeComponent(part);
              }
              return part;
            })
            .join('/')
            .replaceAll('{${m.locationName ?? m.name}}',
                '\${Uri.encodeComponent($fieldCode)}')
            .replaceAll('{${m.locationName ?? m.name}+}',
                "\${$fieldCode.split('/').map(Uri.encodeComponent).join('/')}");
      }
    }
    return uri;
  }

  void buildRequestQueryParams(Operation operation, StringBuffer out) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasQueryMembers) return;

    out.writeln('final \$query = <String, List<String>>{');
    for (final member in sc.queryMembers) {
      final location =
          member.locationName ?? member.shapeClass?.locationName ?? member.name;

      if (!member.isRequired) {
        out.writeln('if(${member.fieldName} != null)');
      }
      if (member.shapeClass?.type == 'map') {
        final variable = _encodeQueryParamCode(
            member.shapeClass!.value!.shapeClass!, 'e.value',
            member: member);
        out.writeln('for (var e in ${member.fieldName}.entries)');
        out.writeln('e.key: $variable,');
      } else {
        final variable = _encodeQueryParamCode(
            member.shapeClass!, member.fieldName,
            member: member);
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

String _encodeQueryParamCode(Shape shape, String variable, {Member? member}) {
  var code = _encodeQueryCode(shape, variable, member: member);
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

String _encodeQueryCode(Shape shape, String variable,
    {Member? member, Descriptor? descriptor}) {
  if (member?.jsonvalue == true || descriptor?.jsonvalue == true) {
    return 'jsonEncode($variable)';
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.toValue()';
  } else if (shape.type == 'list') {
    final code = _encodeQueryCode(shape.member!.shapeClass!, 'e',
        descriptor: shape.member!);
    if (code != 'e') {
      return '$variable.map((e) => $code).toList()';
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
