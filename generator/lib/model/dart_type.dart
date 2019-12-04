import 'shape.dart';

String getListOrMapDartType(Shape shape) {
  final StringBuffer buf = StringBuffer();
  if (shape.type == 'list') {
    buf.write('List<');
    buf.write(shape.member.dartType);
    buf.write('>');
  } else if (shape.type == 'map') {
    buf.write('Map<');
    buf.write(shape.key.dartType);
    buf.write(', ');
    buf.write(shape.value.dartType);
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
