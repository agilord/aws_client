import 'dart:typed_data';

import '../../../dynamo_db_2012_08_10.dart';

AttributeValue toAttributeValue(dynamic value) {
  if (value == null) {
    return AttributeValue(nullValue: true);
  } else if (value is AttributeValue) {
    return value;
  } else if (value is bool) {
    return AttributeValue(boolValue: value);
  } else if (value is String) {
    return AttributeValue(s: value);
  } else if (value is int || value is double) {
    return AttributeValue(n: value.toString());
  } else if (value is List<Uint8List>) {
    return AttributeValue(bs: value);
  } else if (value is Uint8List) {
    return AttributeValue(b: value);
  } else if (value is List<num>) {
    return AttributeValue(ns: value.map((e) => e.toString()).toList());
  } else if (value is Set<String>) {
    return AttributeValue(ss: value.toList());
  } else if (value is List) {
    return AttributeValue(
      l: value.map(toAttributeValue).toList().cast(),
    );
  } else if (value is Map<String, dynamic>) {
    return AttributeValue(
        m: value.map((k, v) => MapEntry(k, toAttributeValue(v))));
  } else {
    return toAttributeValue(value.toJson());
  }
}

dynamic toDartType(AttributeValue value) {
  if (value.nullValue ?? false) {
    return null;
  } else if (value.n != null) {
    return double.parse(value.n!);
  } else if (value.s != null) {
    return value.s;
  } else if (value.boolValue != null) {
    return value.boolValue;
  } else if (value.b != null) {
    return value.b;
  } else if (value.l != null) {
    return value.l!.map(toDartType).toList();
  } else if (value.m != null) {
    return value.m!.map((k, v) => MapEntry(k, toDartType(v)));
  } else if (value.ns != null) {
    return value.ns!.map(double.parse).toList();
  } else if (value.bs != null) {
    return value.bs;
  } else if (value.ss != null) {
    return value.ss!.toSet();
  }
}

extension AttributeTranslator on Map<String, AttributeValue>? {
  Map<String, dynamic>? toJson() {
    return this?.toJson();
  }
}

extension AttributeTranslatorNonNullable on Map<String, AttributeValue> {
  Map<String, dynamic> toJson() {
    return map((key, value) => MapEntry(key, toDartType(value)));
  }
}

extension DynamicTranslator on Map<String, dynamic>? {
  Map<String, AttributeValue>? fromJsonToAttributeValue() {
    return this?.fromJsonToAttributeValue();
  }
}

extension DynamicTranslatorNonNull on Map<String, dynamic> {
  Map<String, AttributeValue> fromJsonToAttributeValue() {
    return map((key, value) => MapEntry(key, toAttributeValue(value)));
  }
}
