// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'migrationhub-config-2019-06-30.dart';

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
    homeRegionControls: (json['HomeRegionControls'] as List<dynamic>?)
        ?.map((e) => HomeRegionControl.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

GetHomeRegionResult _$GetHomeRegionResultFromJson(Map<String, dynamic> json) {
  return GetHomeRegionResult(
    homeRegion: json['HomeRegion'] as String?,
  );
}

HomeRegionControl _$HomeRegionControlFromJson(Map<String, dynamic> json) {
  return HomeRegionControl(
    controlId: json['ControlId'] as String?,
    homeRegion: json['HomeRegion'] as String?,
    requestedTime:
        const UnixDateTimeConverter().fromJson(json['RequestedTime']),
    target: json['Target'] == null
        ? null
        : Target.fromJson(json['Target'] as Map<String, dynamic>),
  );
}

Target _$TargetFromJson(Map<String, dynamic> json) {
  return Target(
    type: _$enumDecode(_$TargetTypeEnumMap, json['Type']),
    id: json['Id'] as String?,
  );
}

Map<String, dynamic> _$TargetToJson(Target instance) {
  final val = <String, dynamic>{
    'Type': _$TargetTypeEnumMap[instance.type],
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Id', instance.id);
  return val;
}

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TargetTypeEnumMap = {
  TargetType.account: 'ACCOUNT',
};
