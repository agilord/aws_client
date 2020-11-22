import '../model/dart_type.dart';
import '../model/shape.dart';

String extractJsonCode(Shape shape, String variable, {Member member}) {
  if (shape.type == 'map') {
    return '($variable as Map<String, dynamic>)?.map((k, e) => MapEntry(k, ${extractJsonCode(shape.value.shapeClass, 'e')}))';
  } else if (shape.type == 'list') {
    return '($variable as List)?.map((e) => ${extractJsonCode(shape.member.shapeClass, 'e')})?.toList()';
  } else if (shape.type == 'structure') {
    return '${shape.className}.fromJson($variable as Map<String, dynamic>)';
  } else if (shape.enumeration?.isNotEmpty ?? false) {
    shape.isTopLevelOutputEnum = true;
    return '($variable as String)?.to${shape.className}()';
  } else if (shape.type == 'timestamp') {
    final timestampFormat =
        member?.timestampFormat ?? shape.timestampFormat ?? 'unixTimestamp';
    final sourceType = timestampFormat == 'unixTimestamp' ? 'int' : 'String';
    return '${timestampFormat}FromJson($variable as $sourceType)';
  } else if (shape.type == 'blob') {
    return 'const Uint8ListConverter().fromJson($variable as String)';
  } else {
    return '$variable as ${shape.type.getDartType(shape.api)}';
  }
}

String encodeJsonCode(Shape shape, String variable,
    {Member member, bool maybeNull}) {
  maybeNull ??= true;
  if (shape.type == 'map') {
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
