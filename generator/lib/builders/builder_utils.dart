import 'package:aws_client.generator/model/descriptor.dart';

import '../model/dart_type.dart';
import '../model/shape.dart';
import '../utils/string_utils.dart';

String extractJsonCode(Shape shape, String variable, {Member member}) {
  if (member?.jsonvalue == true) {
    return '$variable == null ? null : jsonDecode($variable as String)';
  } else if (shape.type == 'map') {
    return '($variable as Map<String, dynamic>)?.map((k, e) => MapEntry(k, ${extractJsonCode(shape.value.shapeClass, 'e')}))';
  } else if (shape.type == 'list') {
    return '($variable as List)?.map((e) => ${extractJsonCode(shape.member.shapeClass, 'e')})?.toList()';
  } else if (shape.type == 'structure') {
    return '${shape.className}.fromJson($variable as Map<String, dynamic>)';
  } else if (shape.enumeration?.isNotEmpty ?? false) {
    shape.isTopLevelOutputEnum = true;
    return '($variable as String)?.to${shape.className}()';
  } else if (shape.type == 'timestamp') {
    return 'timeStampFromJson($variable)';
  } else if (shape.type == 'blob') {
    return 'const Uint8ListConverter().fromJson($variable as String)';
  } else {
    return '$variable as ${shape.type.getDartType(shape.api)}';
  }
}

String encodeJsonCode(Shape shape, String variable,
    {Member member, bool maybeNull}) {
  maybeNull ??= true;

  if (member?.jsonvalue == true) {
    return '$variable == null ? null : jsonEncode($variable)';
  } else if (shape.type == 'map') {
    final keyCode = encodeJsonCode(shape.key.shapeClass, 'k', maybeNull: false);
    final valueCode = encodeJsonCode(shape.value.shapeClass, 'e');
    if (keyCode != 'k' || valueCode != 'e') {
      return '$variable${maybeNull ? '?' : ''}.map((k, e) => MapEntry($keyCode, $valueCode))';
    }
  } else if (shape.type == 'list') {
    final valueCode = encodeJsonCode(shape.member.shapeClass, 'e');
    if (valueCode != 'e') {
      final nullAware = maybeNull ? '?' : '';
      return '$variable$nullAware.map((e) => $valueCode)$nullAware.toList()';
    }
  } else if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    return '$variable${maybeNull ? '?' : ''}.toValue()${maybeNull ? "?? ''" : ''}';
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'unixTimestamp';
    return '${timestampFormat}ToJson($variable)';
  } else if (shape.type == 'blob') {
    if (maybeNull) {
      return '$variable?.let(base64Encode)';
    } else {
      return 'base64Encode($variable)';
    }
  }
  return '$variable';
}

String encodeXmlCode(Shape shape, String variable,
    {Member structureMember,
    Descriptor listMember,
    Descriptor value,
    Descriptor key,
    bool maybeNull}) {
  maybeNull ??= true;

  final elemName = structureMember?.locationName ??
      value?.locationName ??
      key?.locationName ??
      listMember?.locationName ??
      shape.locationName ??
      (value != null ? 'value' : null) ??
      (key != null ? 'key' : null) ??
      (listMember != null ? 'member' : null) ??
      structureMember.name;

  if (shape.type == 'map') {
    final keyCode = encodeXmlCode(shape.key.shapeClass, 'e.key',
        key: shape.key, maybeNull: false);
    final valueCode =
        encodeXmlCode(shape.value.shapeClass, 'e.value', value: shape.value);
    final fn =
        "$variable${maybeNull ? '?' : ''}.entries.map((e) => _s.XmlElement(_s.XmlName('entry'), [], <_s.XmlNode>[$keyCode, $valueCode]))";
    return '_s.XmlElement(_s.XmlName(\'$elemName\'), [], $fn)';
  } else if (shape.type == 'list') {
    final flattened = shape.flattened || (structureMember?.flattened ?? false);
    final valueCode = encodeXmlCode(shape.member.shapeClass, 'e',
        structureMember: flattened ? structureMember : null,
        listMember: flattened ? null : shape.member);
    final nullAware = maybeNull ? '?' : '';
    var fn = '$variable$nullAware.map((e) => $valueCode)';

    if (flattened) {
      fn = '...$fn';
    } else {
      fn = '_s.XmlElement(_s.XmlName(\'$elemName\'), [], $fn)';
    }
    return fn;
  } else if (shape.type == 'structure') {
    return '$variable?.toXml(\'$elemName\')';
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        structureMember?.timestampFormat ?? shape.timestampFormat;
    var formatterArg = '';
    if (timestampFormat != null) {
      formatterArg = ', formatter: _s.${timestampFormat}ToJson';
    }
    return '_s.encodeXmlDateTimeValue(\'$elemName\', $variable$formatterArg)';
  }

  if (shape.enumeration != null) {
    shape.isTopLevelInputEnum = true;
    variable =
        "$variable${maybeNull ? '?' : ''}.toValue()${maybeNull ? " ?? ''" : ''}";
  }

  final dartType = shape.type.getDartType(shape.api);
  return '_s.encodeXml${uppercaseName(dartType)}Value(\'$elemName\', $variable)';
}
