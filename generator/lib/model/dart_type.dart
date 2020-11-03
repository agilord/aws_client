import 'api.dart';
import 'shape.dart';

String getListOrMapDartType(Shape shape) {
  final buf = StringBuffer();
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
      this == 'character' ||
      this == 'boolean' ||
      this == 'double' ||
      this == 'float' ||
      this == 'integer' ||
      this == 'long' ||
      this == 'blob' ||
      this == 'timestamp';

  bool isMapOrList() => this == 'list' || this == 'map';

  String getDartType(Api api) {
    switch (this) {
      case 'string':
      case 'character':
        return 'String';
      case 'boolean':
        return 'bool';
      case 'double':
      case 'float':
        return 'double';
      case 'integer':
      case 'long':
        return 'int';
      case 'blob':
        if (api.usesQueryProtocol) return 'String';
        return 'Uint8List';
      case 'timestamp':
        return 'DateTime';
      default:
        throw ArgumentError('Unknown type: $this');
    }
  }
}
