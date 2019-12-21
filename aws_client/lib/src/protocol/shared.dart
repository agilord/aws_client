import 'dart:convert';
import 'dart:typed_data';

import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

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

abstract class AwsException implements Exception {}

class GenericAwsException implements AwsException {
  final String type;
  final String code;
  final String message;

  GenericAwsException({this.type, this.code, this.message});

  @override
  String toString() => '$code: $message';
}

typedef AwsExceptionFn = AwsException Function(String type, String message);

XmlElement extractXmlChild(XmlElement elem, String name) {
  return elem.findElements(name).firstWhere((e) => true, orElse: () => null);
}

String extractXmlStringValue(XmlElement elem, String name) {
  final c = extractXmlChild(elem, name);
  return c?.text;
}

int extractXmlIntValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : int.parse(str);
}

bool extractXmlBoolValue(XmlElement elem, String name) {
  return _parseBool(extractXmlStringValue(elem, name));
}

DateTime extractXmlDateTimeValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : DateTime.parse(str);
}

double extractXmlDoubleValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : double.parse(str);
}

Uint8List extractXmlUint8ListValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : base64.decode(str);
}

List<String> extractXmlStringListValues(XmlElement elem, String name) {
  return elem.findElements(name).map((e) => e.text).toList();
}

List<bool> extractXmlBoolListValues(XmlElement elem, String name) {
  return extractXmlStringListValues(elem, name).map(_parseBool).toList();
}

List<int> extractXmlIntListValues(XmlElement elem, String name) {
  return extractXmlStringListValues(elem, name).map(int.parse).toList();
}

List<double> extractXmlDoubleListValues(XmlElement elem, String name) {
  return extractXmlStringListValues(elem, name).map(double.parse).toList();
}

List<DateTime> extractXmlDateTimeListValues(XmlElement elem, String name) {
  return extractXmlStringListValues(elem, name).map(DateTime.parse).toList();
}

List<Uint8List> extractXmlUint8ListListValues(XmlElement elem, String name) {
  return extractXmlStringListValues(elem, name)
      .map((str) => base64.decode(str))
      .toList();
}

bool _parseBool(String value) {
  if (value == null) return null;
  switch (value.toLowerCase()) {
    case 'true':
      return true;
    case 'false':
      return false;
  }
  throw ArgumentError('Unable to parse bool value: $value');
}

XmlElement encodeXmlStringValue(String name, String value) {
  if (value == null) return null;
  return XmlElement(XmlName(name), [], [XmlText(value)]);
}

XmlElement encodeXmlBoolValue(String name, bool value) {
  return encodeXmlStringValue(name, value?.toString());
}

XmlElement encodeXmlIntValue(String name, int value) {
  return encodeXmlStringValue(name, value?.toString());
}

XmlElement encodeXmlDoubleValue(String name, double value) {
  return encodeXmlStringValue(name, value?.toString());
}

XmlElement encodeXmlDateTimeValue(String name, DateTime value) {
  return encodeXmlStringValue(name, value?.toUtc()?.toIso8601String());
}

XmlElement encodeXmlUint8ListValue(String name, Uint8List value) {
  if (value == null) return null;
  return encodeXmlStringValue(name, base64.encode(value));
}
