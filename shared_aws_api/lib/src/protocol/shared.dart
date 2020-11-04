import 'dart:convert';
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:xml/xml.dart';

final rfc822Formatter = DateFormat("EEE, dd MMM yyyy HH:mm:ss 'Z'", 'en_US');
final iso8601Formatter = DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'", 'en_US');

DateTime rfc822FromJson(String date) =>
    date == null ? null : rfc822Formatter.parse(date);

String rfc822ToJson(DateTime date) =>
    date == null ? null : rfc822Formatter.format(date.toUtc());

DateTime iso8601FromJson(String date) =>
    date == null ? null : iso8601Formatter.parse(date);

String iso8601ToJson(DateTime date) =>
    date == null ? null : iso8601Formatter.format(date.toUtc());

DateTime unixTimestampFromJson(dynamic date) {
  if (date == null) return null;
  if (date is String) {
    return DateTime.fromMillisecondsSinceEpoch(int.parse(date) * 1000);
  } else if (date is num) {
    return DateTime.fromMillisecondsSinceEpoch(date.toInt() * 1000);
  }

  throw ArgumentError.value(date, 'date', 'Unknown date type, can not convert');
}

int unixTimestampToJson(DateTime date) =>
    date == null ? null : date.millisecondsSinceEpoch ~/ 1000;

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

double extractHeaderDoubleValue(Map<String, String> headers, String name) {
  final v = extractHeaderStringValue(headers, name);
  return v == null ? null : num.parse(v).toDouble();
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

class JsonResponse {
  final Map<String, String> headers;
  final Map<String, dynamic> body;

  JsonResponse(this.headers, this.body);
}

void throwException(StreamedResponse rs, String body,
    Map<String, AwsExceptionFn> exceptionFnMap) {
  var type =
      rs.headers['x-amzn-errortype']?.split(':')?.first ?? 'UnknownError';
  String message;

  final statusCode = rs.statusCode.toString();

  if (body?.isNotEmpty == true) {
    try {
      final e = jsonDecode(body);
      if (e['__type'] != null || e['code'] != null) {
        type =
            ((e['__type'] as String) ?? (e['code'] as String)).split('#').last;
      }
      if (type == 'RequestEntityTooLarge') {
        message = 'Request body must be less than 1 MB';
      } else {
        message = e['message'] as String ?? e['Message'] as String;
      }
    } catch (_) {
      message = statusCode;
    }
  } else {
    message = statusCode;
  }

  final fn = exceptionFnMap[type];
  final exception = fn != null
      ? fn(type, message)
      : GenericAwsException(
          type: type,
          code: statusCode,
          message: message,
        );
  throw exception;
}

String toQueryParam(String name, dynamic param) {
  if (param == null) {
    return null;
  }

  if (param is String || param is bool) {
    if (name != null) {
      return '$name=$param';
    }
    return '$param';
  }

  if (param is Map) {
    return param.entries
        .map((e) => toQueryParam(e.key as String, e.value))
        .where((e) => e != null)
        .join('&');
  }

  if (param is List) {
    return param
        .map((e) {
          final value = toQueryParam(null, e);
          if (value == null) return null;
          return '$name=$value';
        })
        .where((e) => e != null)
        .join('&');
  }

  // Last resort
  return toQueryParam(name, param.toJson());
}
