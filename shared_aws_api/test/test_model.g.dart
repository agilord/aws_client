// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestSuite _$TestSuiteFromJson(Map<String, dynamic> json) {
  return TestSuite(
    (json['shapes'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Shape.fromJson(e as Map<String, dynamic>)),
    ),
    json['description'] as String,
    (json['cases'] as List)
        ?.map(
            (e) => e == null ? null : Case.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    (json['metadata'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Case _$CaseFromJson(Map<String, dynamic> json) {
  return Case(
    json['given'] == null
        ? null
        : Given.fromJson(json['given'] as Map<String, dynamic>),
    json['params'] as Map<String, dynamic>,
    json['serialized'] == null
        ? null
        : Serialized.fromJson(json['serialized'] as Map<String, dynamic>),
  );
}

Given _$GivenFromJson(Map<String, dynamic> json) {
  return Given(
    json['input'] == null
        ? null
        : Descriptor.fromJson(json['input'] as Map<String, dynamic>),
    json['name'] as String,
  );
}

Serialized _$SerializedFromJson(Map<String, dynamic> json) {
  return Serialized(
    json['uri'] as String,
    json['body'] as String,
  );
}
