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

class Uint8ListListConverter
    implements JsonConverter<List<Uint8List>, List<String>> {
  const Uint8ListListConverter();

  @override
  List<Uint8List> fromJson(List<String> json) {
    return json.map((x) => base64.decode(x)).toList(growable: false);
  }

  @override
  List<String> toJson(List<Uint8List> list) {
    return list.map((x) => base64.encode(x)).toList(growable: false);
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
