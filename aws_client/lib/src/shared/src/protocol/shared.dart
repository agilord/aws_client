import 'dart:convert';
import 'dart:typed_data';

import 'package:collection/collection.dart' show IterableExtension;
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
import 'package:xml/xml.dart';

final _rfc822Parser = DateFormat('EEE, dd MMM yyyy HH:mm:ss Z', 'en_US');
final _rfc822Formatter = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'GMT'", 'en_US');
final _iso8601Formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", 'en_US');

final unixRegex = RegExp(r'^\d+$');
final isoRegex = RegExp(r'^\d{4}');
final rfcRegex = RegExp(r'^\w{3},');

final String Function({Map<String, dynamic> options}) _uuidV4 = Uuid().v4;

String Function()? idempotencyGeneratorOverride;

String generateIdempotencyToken() =>
    (idempotencyGeneratorOverride ?? _uuidV4)();

String rfc822ToJson(DateTime date) => _rfc822Formatter.format(date.toUtc());

String iso8601ToJson(DateTime date) => _iso8601Formatter.format(date.toUtc());

int unixTimestampToJson(DateTime date) => date.millisecondsSinceEpoch ~/ 1000;

DateTime? timeStampFromJson(Object? date) {
  if (date == null) return null;
  return nonNullableTimeStampFromJson(date);
}

DateTime nonNullableTimeStampFromJson(Object date) {
  if (date is num) {
    // unix timestamp (number)
    return DateTime.fromMillisecondsSinceEpoch(date.toInt() * 1000,
        isUtc: true);
  }

  if (date is String) {
    if (unixRegex.hasMatch(date)) {
      // unix timestamp
      return DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000,
          isUtc: true);
    } else if (isoRegex.hasMatch(date)) {
      // iso8601
      return _iso8601Formatter.parseUtc(date);
    } else if (rfcRegex.hasMatch(date)) {
      // rfc822
      return _rfc822Parser.parseUtc(date);
    }
  }

  throw ArgumentError.value(date, 'date', 'Unknown date type, can not convert');
}

abstract class AwsException implements Exception {}

class GenericAwsException implements AwsException {
  final String? type;
  final String code;
  final String? message;

  GenericAwsException({this.type, required this.code, this.message});

  @override
  String toString() => '$code $type: $message';

  Map<String, String?> toJson() => {
        'type': type,
        'code': code,
        'message': message,
      };
}

typedef AwsExceptionFn = AwsException Function(String type, String message);

XmlElement? extractXmlChild(XmlElement elem, String name) {
  if (name == elem.localName) {
    return elem;
  }
  return elem.findElements(name).firstOrNull;
}

String? extractXmlStringValue(XmlElement elem, String name) {
  final c = extractXmlChild(elem, name);
  return c?.innerText;
}

String? extractXmlStringAttribute(XmlElement elem, String name) {
  return elem.attributes
      .firstWhereOrNull((e) => e.name.qualified == name)
      ?.value;
}

int? extractXmlIntValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : int.parse(str);
}

bool? extractXmlBoolValue(XmlElement elem, String name) {
  final value = extractXmlStringValue(elem, name);
  if (value == null) return null;
  return _parseBool(value);
}

DateTime? extractXmlDateTimeValue(XmlElement elem, String name,
    {DateTime? Function(String)? parser}) {
  final str = extractXmlStringValue(elem, name);
  if (str == null) {
    return null;
  }
  if (parser != null) {
    return parser(str);
  }
  return DateTime.parse(str);
}

double? extractXmlDoubleValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : double.parse(str);
}

Uint8List? extractXmlUint8ListValue(XmlElement elem, String name) {
  final str = extractXmlStringValue(elem, name);
  return str == null ? null : base64.decode(str);
}

List<String> extractXmlStringListValues(XmlElement elem, String name) {
  return elem.findElements(name).map((e) => e.innerText).toList();
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
  switch (value.toLowerCase()) {
    case 'true':
      return true;
    case 'false':
      return false;
  }
  throw ArgumentError('Unable to parse bool value: $value');
}

XmlElement encodeXmlStringValue(String name, String value) {
  return XmlElement(XmlName(name), [], [XmlText(value)]);
}

XmlElement encodeXmlBoolValue(String name, bool value) {
  return encodeXmlStringValue(name, value.toString());
}

XmlElement encodeXmlIntValue(String name, int value) {
  return encodeXmlStringValue(name, value.toString());
}

XmlElement encodeXmlDoubleValue(String name, double value) {
  return encodeXmlStringValue(name, value.toString());
}

XmlElement encodeXmlDateTimeValue(String name, DateTime value,
    {String Function(DateTime)? formatter}) {
  value = value.toUtc();

  formatter ??= iso8601ToJson;

  final output = formatter(value);

  return encodeXmlStringValue(name, output);
}

XmlElement encodeXmlUint8ListValue(String name, Uint8List value) {
  return encodeXmlStringValue(name, base64.encode(value));
}

String? extractHeaderStringValue(Map<String, String> headers, String name) {
  return headers[name] ?? headers[name.toLowerCase()];
}

Object? extractHeaderJsonValue(Map<String, String> headers, String name) {
  final header = extractHeaderStringValue(headers, name);
  if (header == null) return null;
  return jsonDecode(utf8.decode(base64Decode(header))) as Object?;
}

int? extractHeaderIntValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v == null ? null : int.parse(v);
}

double? extractHeaderDoubleValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v == null ? null : num.parse(v).toDouble();
}

bool extractHeaderBoolValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v?.toLowerCase() == 'true';
}

DateTime? extractHeaderDateTimeValue(Map<String, String> headers, String name,
    {DateTime? Function(String)? parser}) {
  final v = extractHeaderStringValue(headers, name);

  if (v == null) {
    return null;
  }

  if (parser != null) {
    return parser(v);
  }

  return DateTime.tryParse(v) ?? _rfc822Parser.parseUtc(v);
}

Map<String, String>? extractHeaderMapValues(
    Map<String, String>? headers, String name) {
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

class JsonResponse {
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  JsonResponse(this.headers, this.body);
}

Future<Map<String, dynamic>> jsonFromResponse(StreamedResponse rs) async {
  final body = await rs.stream.bytesToString();
  return body.isEmpty
      ? <String, dynamic>{}
      : jsonDecode(body) as Map<String, dynamic>;
}

Future<XmlElement> xmlFromResponse(StreamedResponse rs,
    {String? resultWrapper}) async {
  final body = await rs.stream.bytesToString();
  if (body.isNotEmpty) {
    var elem = XmlDocument.parse(body).rootElement;

    if (resultWrapper != null) {
      elem = elem.findElements(resultWrapper).first;
    }
    return elem;
  } else {
    return XmlElement(XmlName('empty'));
  }
}

void throwException(StreamedResponse rs, String body,
    Map<String, AwsExceptionFn> exceptionFnMap) {
  var type =
      rs.headers['x-amzn-errortype']?.split(':').firstOrNull ?? 'UnknownError';
  String? message;

  final statusCode = rs.statusCode.toString();

  if (body.isNotEmpty == true) {
    try {
      final e = jsonDecode(body);
      if (e['__type'] != null || e['code'] != null) {
        type = ((e['__type'] as String?) ?? (e['code'] as String?))!
            .split('#')
            .last;
      }
      if (type == 'RequestEntityTooLarge') {
        message = 'Request body must be less than 1 MB';
      } else {
        message = e['message'] as String? ?? e['Message'] as String?;
      }
    } catch (_) {
      message = statusCode;
    }
  } else {
    message = statusCode;
  }

  final fn = exceptionFnMap[type];
  final exception = fn != null
      ? fn(type, message ?? '')
      : GenericAwsException(
          type: type,
          code: statusCode,
          message: message,
        );
  throw exception;
}
