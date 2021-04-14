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
