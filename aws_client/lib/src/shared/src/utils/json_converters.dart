import 'dart:convert';
import 'dart:typed_data';

Uint8List? decodeNullableUint8List(String? input) {
  if (input != null) {
    return decodeUint8List(input);
  }
  return null;
}

Uint8List decodeUint8List(String input) {
  return base64.decode(input);
}

// JSON has no NaN/Infinity literals; AWS sends them as strings.
Object? encodeJsonDouble(double? value) {
  if (value == null) return null;
  if (value.isNaN) return 'NaN';
  if (value == double.infinity) return 'Infinity';
  if (value == double.negativeInfinity) return '-Infinity';
  return value;
}

double? parseJsonDouble(Object? value) {
  if (value == null) return null;
  if (value is num) return value.toDouble();
  if (value is String) {
    switch (value) {
      case 'NaN':
        return double.nan;
      case 'Infinity':
        return double.infinity;
      case '-Infinity':
        return double.negativeInfinity;
    }
    return double.parse(value);
  }
  throw FormatException('Cannot parse $value as a double');
}
