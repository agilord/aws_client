import '../../model/api.dart';
import '../../model/descriptor.dart';
import '../../model/operation.dart';
import '../../model/shape.dart';

abstract class ServiceBuilder {
  String imports();

  String constructor();

  String operationContent(Operation operation);

  void buildRequestHeaders(Operation operation, StringBuffer out,
      {Set<String> guaranteedNonNull = const {}}) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasHeaderMembers) return;

    out.writeln('final headers = <String, String>{');
    for (var m in sc.headerMembers) {
      final headerName = m.locationName ?? m.shapeClass?.locationName ?? m.name;
      final location = m.location ?? m.shapeClass?.location;
      if (!m.isRequired && !guaranteedNonNull.contains(m.fieldName)) {
        out.writeln('if (${m.fieldName} != null)');
      }
      if (location == 'headers') {
        if (headerName.isEmpty) {
          out.writeln('...${m.fieldName},');
        } else {
          out.writeln(
              "...${m.fieldName}.map((key, value) => MapEntry('$headerName\$key', value)),");
        }
      } else {
        out.writeln(
            "'$headerName': ${_encodeHeaderValue(m.shapeClass!, m.fieldName, member: m)},");
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

      uri = uri.split('/').map((part) {
        if (!allMembersToReplace.any((e) => part.contains(e)) &&
            !part.contains('?')) {
          return Uri.encodeComponent(part);
        }
        return part;
      }).join('/');
      for (var m in sc.uriMembers) {
        final fieldCode = _encodePath(m.shapeClass!, m.fieldName, member: m);
        final name = m.locationName ?? m.name;
        uri = uri
            .replaceAll('{$name}', '\${Uri.encodeComponent($fieldCode)}')
            .replaceAll('{$name+}',
                "\${$fieldCode.split('/').map(Uri.encodeComponent).join('/')}");
      }
    }
    return uri;
  }

  void buildRequestQueryParams(Operation operation, StringBuffer out,
      {Set<String> guaranteedNonNull = const {}}) {
    final sc = operation.input?.shapeClass;
    if (sc == null || !sc.hasQueryMembers) return;

    out.writeln('final \$query = <String, List<String>>{');
    for (final member in sc.queryMembers) {
      final location =
          member.locationName ?? member.shapeClass?.locationName ?? member.name;

      // A field the caller already promoted to non-null (e.g. an `??=`'d
      // idempotency token) needs no guard — it would be a dead null check.
      if (!member.isRequired && !guaranteedNonNull.contains(member.fieldName)) {
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
    return '$variable.value';
  } else if (shape.type == 'list') {
    final memberShape = shape.member!.shapeClass!;
    var code = _encodeQueryCode(memberShape, 'e', descriptor: shape.member!);
    if (code == 'e' && memberShape.type != 'string') {
      code = 'e.toString()';
    }
    if (code != 'e') {
      final tearoff = RegExp(r'^([\w.$]+)\(e\)$').firstMatch(code);
      return tearoff != null
          ? '$variable.map(${tearoff.group(1)}).toList()'
          : '$variable.map((e) => $code).toList()';
    }
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    variable =
        '_s.${timestampFormat}ToJson($variable)${timestampFormat == 'unixTimestamp' ? '.toString()' : ''}';
  }

  return variable;
}

String _encodeHeaderValue(Shape shape, String variable, {Member? member}) {
  if (member?.jsonvalue == true) {
    return 'base64Encode(utf8.encode(jsonEncode($variable)))';
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.value';
  } else if (shape.type == 'list') {
    final element = shape.member!.shapeClass!;
    if (element.enumeration != null) {
      element.isTopLevelInputEnum = true;
      return "$variable.map((e) => e.value).join(', ')";
    } else if (element.type == 'timestamp') {
      final fmt = element.timestampFormat ?? 'rfc822';
      if (fmt == 'unixTimestamp') {
        return "$variable.map((e) => _s.${fmt}ToJson(e).toString()).join(', ')";
      }
      return "$variable.map(_s.${fmt}ToJson).join(', ')";
    } else if (element.type == 'string') {
      return '_s.encodeHttpHeaderList($variable)';
    } else {
      return "$variable.map((e) => e.toString()).join(', ')";
    }
  } else if (shape.type == 'timestamp') {
    final fmt = member?.timestampFormat ?? shape.timestampFormat ?? 'rfc822';
    final code = '_s.${fmt}ToJson($variable)';
    return fmt == 'unixTimestamp' ? '$code.toString()' : code;
  }
  return '$variable.toString()';
}

String _encodePath(Shape shape, String variable, {Member? member}) {
  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable.value';
  } else if (shape.type == 'timestamp') {
    final fmt = member?.timestampFormat ?? shape.timestampFormat ?? 'iso8601';
    final code = '_s.${fmt}ToJson($variable)';
    return fmt == 'unixTimestamp' ? '$code.toString()' : code;
  } else if (const ['integer', 'long', 'double', 'float', 'boolean']
      .contains(shape.type)) {
    return '$variable.toString()';
  }

  return variable;
}
