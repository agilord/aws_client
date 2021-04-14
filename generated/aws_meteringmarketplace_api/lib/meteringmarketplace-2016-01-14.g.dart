// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteringmarketplace-2016-01-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchMeterUsageResult _$BatchMeterUsageResultFromJson(
    Map<String, dynamic> json) {
  return BatchMeterUsageResult(
    results: (json['Results'] as List<dynamic>?)
        ?.map((e) => UsageRecordResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    unprocessedRecords: (json['UnprocessedRecords'] as List<dynamic>?)
        ?.map((e) => UsageRecord.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

MeterUsageResult _$MeterUsageResultFromJson(Map<String, dynamic> json) {
  return MeterUsageResult(
    meteringRecordId: json['MeteringRecordId'] as String?,
  );
}

RegisterUsageResult _$RegisterUsageResultFromJson(Map<String, dynamic> json) {
  return RegisterUsageResult(
    publicKeyRotationTimestamp: const UnixDateTimeConverter()
        .fromJson(json['PublicKeyRotationTimestamp']),
    signature: json['Signature'] as String?,
  );
}

ResolveCustomerResult _$ResolveCustomerResultFromJson(
    Map<String, dynamic> json) {
  return ResolveCustomerResult(
    customerIdentifier: json['CustomerIdentifier'] as String?,
    productCode: json['ProductCode'] as String?,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'Key': instance.key,
      'Value': instance.value,
    };

UsageAllocation _$UsageAllocationFromJson(Map<String, dynamic> json) {
  return UsageAllocation(
    allocatedUsageQuantity: json['AllocatedUsageQuantity'] as int,
    tags: (json['Tags'] as List<dynamic>?)
        ?.map((e) => Tag.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UsageAllocationToJson(UsageAllocation instance) {
  final val = <String, dynamic>{
    'AllocatedUsageQuantity': instance.allocatedUsageQuantity,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Tags', instance.tags?.map((e) => e.toJson()).toList());
  return val;
}

UsageRecord _$UsageRecordFromJson(Map<String, dynamic> json) {
  return UsageRecord(
    customerIdentifier: json['CustomerIdentifier'] as String,
    dimension: json['Dimension'] as String,
    timestamp: DateTime.parse(json['Timestamp'] as String),
    quantity: json['Quantity'] as int?,
    usageAllocations: (json['UsageAllocations'] as List<dynamic>?)
        ?.map((e) => UsageAllocation.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$UsageRecordToJson(UsageRecord instance) {
  final val = <String, dynamic>{
    'CustomerIdentifier': instance.customerIdentifier,
    'Dimension': instance.dimension,
    'Timestamp': instance.timestamp.toIso8601String(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Quantity', instance.quantity);
  writeNotNull('UsageAllocations',
      instance.usageAllocations?.map((e) => e.toJson()).toList());
  return val;
}

UsageRecordResult _$UsageRecordResultFromJson(Map<String, dynamic> json) {
  return UsageRecordResult(
    meteringRecordId: json['MeteringRecordId'] as String?,
    status:
        _$enumDecodeNullable(_$UsageRecordResultStatusEnumMap, json['Status']),
    usageRecord: json['UsageRecord'] == null
        ? null
        : UsageRecord.fromJson(json['UsageRecord'] as Map<String, dynamic>),
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

const _$UsageRecordResultStatusEnumMap = {
  UsageRecordResultStatus.success: 'Success',
  UsageRecordResultStatus.customerNotSubscribed: 'CustomerNotSubscribed',
  UsageRecordResultStatus.duplicateRecord: 'DuplicateRecord',
};
