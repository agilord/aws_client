// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2020-07-01.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureValue _$FeatureValueFromJson(Map<String, dynamic> json) {
  return FeatureValue(
    featureName: json['FeatureName'] as String,
    valueAsString: json['ValueAsString'] as String,
  );
}

Map<String, dynamic> _$FeatureValueToJson(FeatureValue instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FeatureName', instance.featureName);
  writeNotNull('ValueAsString', instance.valueAsString);
  return val;
}

GetRecordResponse _$GetRecordResponseFromJson(Map<String, dynamic> json) {
  return GetRecordResponse(
    record: (json['Record'] as List)
        ?.map((e) =>
            e == null ? null : FeatureValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}
