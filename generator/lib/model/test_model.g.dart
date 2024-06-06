// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestSuite _$TestSuiteFromJson(Map<String, dynamic> json) => TestSuite(
      json['description'] as String,
      json['skip'] as String?,
      (json['metadata'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      (json['shapes'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, e as Object),
      ),
      (json['cases'] as List<dynamic>)
          .map((e) => TestCase.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

TestCase _$TestCaseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const [
      'given',
      'skip',
      'result',
      'response',
      'params',
      'serialized'
    ],
  );
  return TestCase(
    (json['given'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, e as Object),
    ),
    json['skip'] as String?,
    (json['result'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as Object),
    ),
    json['response'] == null
        ? null
        : OutputResponse.fromJson(json['response'] as Map<String, dynamic>),
    json['params'] as Map<String, dynamic>?,
    json['serialized'] == null
        ? null
        : Serialized.fromJson(json['serialized'] as Map<String, dynamic>),
  );
}

OutputResponse _$OutputResponseFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['body', 'status_code', 'headers'],
  );
  return OutputResponse(
    json['body'] as String?,
    (json['status_code'] as num).toInt(),
    (json['headers'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Serialized _$SerializedFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    allowedKeys: const ['uri', 'host', 'method', 'body', 'headers'],
  );
  return Serialized(
    json['uri'] as String,
    json['host'] as String?,
    json['method'] as String?,
    json['body'] as String?,
    (json['headers'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}
