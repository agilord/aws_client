import 'dart:convert';
import 'dart:typed_data';

import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:xml/xml.dart';

final rfc822Formatter = DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US');
final iso8601Formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ", 'en_US');

DateTime rfc822fromJson(String date) => rfc822Formatter.parse(date);

String rfc822toJson(DateTime date) => rfc822Formatter.format(date);

DateTime iso8601fromJson(String date) => iso8601Formatter.parse(date);

String iso8601toJson(DateTime date) => iso8601Formatter.format(date);

DateTime unixFromJson(dynamic date) {
  if (date is String) {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000);
  } else if (date is num) {
    return DateTime.fromMillisecondsSinceEpoch(date.toInt() * 1000);
  }

  throw ArgumentError.value(date, 'date', 'Unknown date type, can not convert');
}

int unixToJson(DateTime date) => date.millisecondsSinceEpoch ~/ 1000;

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
    implements JsonConverter<List<Uint8List>, List<String>> {
  const Uint8ListListConverter();

  @override
  List<Uint8List> fromJson(List<String> json) {
    if (json == null) {
      return null;
    } else {
      return json.map((x) {
        if (x != null) {
          return base64.decode(x);
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

abstract class AwsException implements Exception {}

class GenericAwsException implements AwsException {
  final String type;
  final String code;
  final String message;

  GenericAwsException({this.type, this.code, this.message});

  @override
  String toString() => '$code $type: $message';

  Map<String, String> toJson() => {
        'type': type,
        'code': code,
        'message': message,
      };
}

class MessageAttributeValue {
  final String dataType;
  final List<Uint8List> binaryListValues; /// Not implemented. Reserved for future use.
  final Uint8List binaryValue;
  final List<String> stringListValues; /// Not implemented. Reserved for future use.
  final String stringValue;

  MessageAttributeValue({
    @required this.dataType,
    this.binaryListValues,
    this.binaryValue,
    this.stringListValues,
    this.stringValue,
  });
  factory MessageAttributeValue.fromXml(XmlElement elem) {
    return MessageAttributeValue(
      dataType: extractXmlStringValue(elem, 'DataType'),
      binaryListValues: extractXmlUint8ListListValues(elem, 'BinaryListValue'),
      binaryValue: extractXmlUint8ListValue(elem, 'BinaryValue'),
      stringListValues: extractXmlStringListValues(elem, 'StringListValue'),
      stringValue: extractXmlStringValue(elem, 'StringValue'),
    );
  }
}

class MessageSystemAttributeValue {
  final String dataType;
  final List<Uint8List> binaryListValues; /// Not implemented. Reserved for future use.
  final Uint8List binaryValue;
  final List<String> stringListValues; /// Not implemented. Reserved for future use.
  final String stringValue;

  MessageSystemAttributeValue({
    @required this.dataType,
    this.binaryListValues,
    this.binaryValue,
    this.stringListValues,
    this.stringValue,
  });
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

String extractHeaderStringValue(Map<String, String> headers, String name) {
  if (headers == null) return null;
  return headers[name] ?? headers[name.toLowerCase()];
}

int extractHeaderIntValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v == null ? null : int.parse(v);
}

bool extractHeaderBoolValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v?.toLowerCase() == 'true';
}

DateTime extractHeaderDateTimeValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v == null ? null : DateTime.parse(v);
}

Map<String, String> extractHeaderMapValues(
    Map<String, String> headers, String name) {
  if (headers == null) return null;
  return Map<String, String>.fromEntries(headers.entries
      .where((e) => e.key.toLowerCase().startsWith(name.toLowerCase()))
      .map((e) => MapEntry(e.key.substring(name.length), e.value)));
}

String extractService(Uri uri) {
  final parts = uri.host.split('.');
  if (parts.length == 4) return parts.first;
  throw Exception('Unable to detect service in ${uri.host}.');
}

String extractRegion(Uri uri) {
  final parts = uri.host.split('.');
  if (parts.length == 4 && parts[1].contains('-')) return parts[1];
  throw Exception('Unable to detect region in ${uri.host}.');
}
