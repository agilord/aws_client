import 'shape.dart';

String getListOrMapDartType(Shape shape) {
  final StringBuffer buf = StringBuffer();
  if (shape.type == 'list') {
    buf.write('List<');

    final String memberShape = shape.member?.shape;
    final String memberType = shape.api.shapes[memberShape].type;

    if (memberType.isBasicType()) {
      buf.write(memberType.getDartType());
    } else if (memberType.isMapOrList()) {
      final String type = getListOrMapDartType(shape.api.shapes[memberShape]);
      buf.write(type);
    } else {
      buf.write(memberShape);
    }
    buf.write('>');
  } else if (shape.type == 'map') {
    buf.write('Map<');

    final String memberKey = shape.key.shape;
    final String memberKeyType = shape.api.shapes[memberKey].type;

    if (memberKeyType.isBasicType()) {
      buf.write(memberKeyType.getDartType());
    } else if (memberKeyType.isMapOrList()) {
      final String type = getListOrMapDartType(shape.api.shapes[memberKey]);
      buf.write(type);
    } else {
      buf.write(memberKey);
    }
    buf.write(', ');

    final String memberValue = shape.value.shape;
    final String memberValueType = shape.api.shapes[memberValue].type;

    if (memberValueType.isBasicType()) {
      buf.write(memberValueType.getDartType());
    } else if (memberValueType.isMapOrList()) {
      final String type = getListOrMapDartType(shape..api.shapes[memberValue]);
      buf.write(type);
    } else {
      buf.write(memberValue);
    }

    buf.write('>');
  } else {
    throw Exception('No type found');
  }

  return buf.toString();
}

extension StringStuff on String {
  bool isBasicType() =>
      this == 'string' ||
      this == 'boolean' ||
      this == 'double' ||
      this == 'integer' ||
      this == 'long' ||
      this == 'blob' ||
      this == 'timestamp';

  bool isMapOrList() => this == 'list' || this == 'map';

  String getDartType() {
    switch (this) {
      case 'string':
        return 'String';
      case 'boolean':
        return 'bool';
      case 'double':
        return this;
      case 'integer':
        return 'int';
      case 'long':
        return 'int';
      case 'blob':
        return 'blob';
      case 'timestamp':
        return 'DateTime';
      default:
        return '???';
    }
  }
}
