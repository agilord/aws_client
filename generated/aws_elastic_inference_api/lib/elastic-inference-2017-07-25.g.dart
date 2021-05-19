// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'elastic-inference-2017-07-25.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcceleratorType _$AcceleratorTypeFromJson(Map<String, dynamic> json) {
  return AcceleratorType(
    acceleratorTypeName: json['acceleratorTypeName'] as String?,
    memoryInfo: json['memoryInfo'] == null
        ? null
        : MemoryInfo.fromJson(json['memoryInfo'] as Map<String, dynamic>),
    throughputInfo: (json['throughputInfo'] as List<dynamic>?)
        ?.map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

AcceleratorTypeOffering _$AcceleratorTypeOfferingFromJson(
    Map<String, dynamic> json) {
  return AcceleratorTypeOffering(
    acceleratorType: json['acceleratorType'] as String?,
    location: json['location'] as String?,
    locationType:
        _$enumDecodeNullable(_$LocationTypeEnumMap, json['locationType']),
  );
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$LocationTypeEnumMap = {
  LocationType.region: 'region',
  LocationType.availabilityZone: 'availability-zone',
  LocationType.availabilityZoneId: 'availability-zone-id',
};

DescribeAcceleratorOfferingsResponse
    _$DescribeAcceleratorOfferingsResponseFromJson(Map<String, dynamic> json) {
  return DescribeAcceleratorOfferingsResponse(
    acceleratorTypeOfferings: (json['acceleratorTypeOfferings']
            as List<dynamic>?)
        ?.map(
            (e) => AcceleratorTypeOffering.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeAcceleratorTypesResponse _$DescribeAcceleratorTypesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAcceleratorTypesResponse(
    acceleratorTypes: (json['acceleratorTypes'] as List<dynamic>?)
        ?.map((e) => AcceleratorType.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

DescribeAcceleratorsResponse _$DescribeAcceleratorsResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeAcceleratorsResponse(
    acceleratorSet: (json['acceleratorSet'] as List<dynamic>?)
        ?.map((e) =>
            ElasticInferenceAccelerator.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['nextToken'] as String?,
  );
}

ElasticInferenceAccelerator _$ElasticInferenceAcceleratorFromJson(
    Map<String, dynamic> json) {
  return ElasticInferenceAccelerator(
    acceleratorHealth: json['acceleratorHealth'] == null
        ? null
        : ElasticInferenceAcceleratorHealth.fromJson(
            json['acceleratorHealth'] as Map<String, dynamic>),
    acceleratorId: json['acceleratorId'] as String?,
    acceleratorType: json['acceleratorType'] as String?,
    attachedResource: json['attachedResource'] as String?,
    availabilityZone: json['availabilityZone'] as String?,
  );
}

ElasticInferenceAcceleratorHealth _$ElasticInferenceAcceleratorHealthFromJson(
    Map<String, dynamic> json) {
  return ElasticInferenceAcceleratorHealth(
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('values', instance.values);
  return val;
}

KeyValuePair _$KeyValuePairFromJson(Map<String, dynamic> json) {
  return KeyValuePair(
    key: json['key'] as String?,
    value: json['value'] as int?,
  );
}

ListTagsForResourceResult _$ListTagsForResourceResultFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResult(
    tags: (json['tags'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

MemoryInfo _$MemoryInfoFromJson(Map<String, dynamic> json) {
  return MemoryInfo(
    sizeInMiB: json['sizeInMiB'] as int?,
  );
}

TagResourceResult _$TagResourceResultFromJson(Map<String, dynamic> json) {
  return TagResourceResult();
}

UntagResourceResult _$UntagResourceResultFromJson(Map<String, dynamic> json) {
  return UntagResourceResult();
}
