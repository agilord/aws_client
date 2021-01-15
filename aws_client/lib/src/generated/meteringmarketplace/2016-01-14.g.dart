// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2016-01-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BatchMeterUsageResult _$BatchMeterUsageResultFromJson(
    Map<String, dynamic> json) {
  return BatchMeterUsageResult(
    results: (json['Results'] as List)
        ?.map((e) => e == null
            ? null
            : UsageRecordResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    unprocessedRecords: (json['UnprocessedRecords'] as List)
        ?.map((e) =>
            e == null ? null : UsageRecord.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

MeterUsageResult _$MeterUsageResultFromJson(Map<String, dynamic> json) {
  return MeterUsageResult(
    meteringRecordId: json['MeteringRecordId'] as String,
  );
}

RegisterUsageResult _$RegisterUsageResultFromJson(Map<String, dynamic> json) {
  return RegisterUsageResult(
    publicKeyRotationTimestamp: const UnixDateTimeConverter()
        .fromJson(json['PublicKeyRotationTimestamp']),
    signature: json['Signature'] as String,
  );
}

ResolveCustomerResult _$ResolveCustomerResultFromJson(
    Map<String, dynamic> json) {
  return ResolveCustomerResult(
    customerIdentifier: json['CustomerIdentifier'] as String,
    productCode: json['ProductCode'] as String,
  );
}

Tag _$TagFromJson(Map<String, dynamic> json) {
  return Tag(
    key: json['Key'] as String,
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$TagToJson(Tag instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Key', instance.key);
  writeNotNull('Value', instance.value);
  return val;
}

UsageAllocation _$UsageAllocationFromJson(Map<String, dynamic> json) {
  return UsageAllocation(
    allocatedUsageQuantity: json['AllocatedUsageQuantity'] as int,
    tags: (json['Tags'] as List)
        ?.map((e) => e == null ? null : Tag.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsageAllocationToJson(UsageAllocation instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AllocatedUsageQuantity', instance.allocatedUsageQuantity);
  writeNotNull('Tags', instance.tags?.map((e) => e?.toJson())?.toList());
  return val;
}

UsageRecord _$UsageRecordFromJson(Map<String, dynamic> json) {
  return UsageRecord(
    customerIdentifier: json['CustomerIdentifier'] as String,
    dimension: json['Dimension'] as String,
    timestamp: const UnixDateTimeConverter().fromJson(json['Timestamp']),
    quantity: json['Quantity'] as int,
    usageAllocations: (json['UsageAllocations'] as List)
        ?.map((e) => e == null
            ? null
            : UsageAllocation.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$UsageRecordToJson(UsageRecord instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('CustomerIdentifier', instance.customerIdentifier);
  writeNotNull('Dimension', instance.dimension);
  writeNotNull(
      'Timestamp', const UnixDateTimeConverter().toJson(instance.timestamp));
  writeNotNull('Quantity', instance.quantity);
  writeNotNull('UsageAllocations',
      instance.usageAllocations?.map((e) => e?.toJson())?.toList());
  return val;
}

UsageRecordResult _$UsageRecordResultFromJson(Map<String, dynamic> json) {
  return UsageRecordResult(
    meteringRecordId: json['MeteringRecordId'] as String,
    status:
        _$enumDecodeNullable(_$UsageRecordResultStatusEnumMap, json['Status']),
    usageRecord: json['UsageRecord'] == null
        ? null
        : UsageRecord.fromJson(json['UsageRecord'] as Map<String, dynamic>),
  );
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

const _$UsageRecordResultStatusEnumMap = {
  UsageRecordResultStatus.success: 'Success',
  UsageRecordResultStatus.customerNotSubscribed: 'CustomerNotSubscribed',
  UsageRecordResultStatus.duplicateRecord: 'DuplicateRecord',
};
