import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    return base64.decode(json);
  }

  @override
  String toJson(Uint8List object) {
    return base64.encode(object);
  }
}

class AwsException implements Exception {
  final String type;
  final String code;
  final String message;

  AwsException({this.type, this.code, this.message});

  @override
  String toString() => '$code: $message';
}

typedef AwsExceptionFn = AwsException Function(String type, String message);
