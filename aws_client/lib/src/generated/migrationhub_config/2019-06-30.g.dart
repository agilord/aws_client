// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-06-30.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateHomeRegionControlResult _$CreateHomeRegionControlResultFromJson(
    Map<String, dynamic> json) {
  return CreateHomeRegionControlResult(
    homeRegionControl: json['HomeRegionControl'] == null
        ? null
        : HomeRegionControl.fromJson(
            json['HomeRegionControl'] as Map<String, dynamic>),
  );
}

DescribeHomeRegionControlsResult _$DescribeHomeRegionControlsResultFromJson(
    Map<String, dynamic> json) {
  return DescribeHomeRegionControlsResult(
    homeRegionControls: (json['HomeRegionControls'] as List)
        ?.map((e) => e == null
            ? null
            : HomeRegionControl.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

GetHomeRegionResult _$GetHomeRegionResultFromJson(Map<String, dynamic> json) {
  return GetHomeRegionResult(
    homeRegion: json['HomeRegion'] as String,
  );
}

HomeRegionControl _$HomeRegionControlFromJson(Map<String, dynamic> json) {
  return HomeRegionControl(
    controlId: json['ControlId'] as String,
    homeRegion: json['HomeRegion'] as String,
    requestedTime:
        const UnixDateTimeConverter().fromJson(json['RequestedTime']),
    target: json['Target'] == null
        ? null
        : Target.fromJson(json['Target'] as Map<String, dynamic>),
  );
}

Target _$TargetFromJson(Map<String, dynamic> json) {
  return Target(
    type: _$enumDecodeNullable(_$TargetTypeEnumMap, json['Type']),
    id: json['Id'] as String,
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Type', _$TargetTypeEnumMap[instance.type]);
  writeNotNull('Id', instance.id);
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$TargetTypeEnumMap = {
  TargetType.account: 'ACCOUNT',
};
