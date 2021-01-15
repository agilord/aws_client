import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import '../protocol/shared.dart';

abstract class DateTimeConverter implements JsonConverter<DateTime, dynamic> {
  final dynamic Function(DateTime date) converter;

  const DateTimeConverter(this.converter);

  @override
  DateTime fromJson(dynamic json) => timeStampFromJson(json);

  @override
  dynamic toJson(DateTime object) => converter(object);
}

class RfcDateTimeConverter extends DateTimeConverter {
  const RfcDateTimeConverter() : super(rfc822ToJson);
}

class IsoDateTimeConverter extends DateTimeConverter {
  const IsoDateTimeConverter() : super(iso8601ToJson);
}

class UnixDateTimeConverter extends DateTimeConverter {
  const UnixDateTimeConverter() : super(unixTimestampToJson);
}

class Uint8ListConverter implements JsonConverter<Uint8List, String> {
  const Uint8ListConverter();

  @override
  Uint8List fromJson(String json) {
    if (json != null) {
      return base64.decode(json);
    }
    return null;
  }

  @override
  String toJson(Uint8List object) {
    if (object != null) {
      return base64.encode(object);
    }
    return null;
  }
}

class Uint8ListListConverter
    implements JsonConverter<List<Uint8List>, List<dynamic>> {
  const Uint8ListListConverter();

  @override
  List<Uint8List> fromJson(List<dynamic> json) {
    if (json == null) {
      return null;
    } else {
      return json.map((x) {
        if (x != null) {
          return base64.decode(x as String);
        }
        return null;
      }).toList(growable: false);
    }
  }

  @override
  List<String> toJson(List<Uint8List> list) {
    if (list == null) {
      return null;
    } else {
      return list.map((x) {
        if (x != null) {
          return base64.encode(x);
        }
        return null;
      }).toList(growable: false);
    }
  }
}

class StringJsonConverter implements JsonConverter<Object, String> {
  const StringJsonConverter();

  @override
  Object fromJson(String json) => json == null ? null : jsonDecode(json);

  @override
  String toJson(Object object) => object == null ? null : jsonEncode(object);
}

class Base64JsonConverter implements JsonConverter<Object, String> {
  const Base64JsonConverter();

  @override
  Object fromJson(String json) =>
      json == null ? null : jsonDecode(utf8.decode(base64Decode(json)));

  @override
  String toJson(Object object) =>
      object == null ? null : base64Encode(utf8.encode(jsonEncode(object)));
}
