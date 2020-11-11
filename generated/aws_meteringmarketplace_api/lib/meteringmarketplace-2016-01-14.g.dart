// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meteringmarketplace-2016-01-14.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$BatchMeterUsageRequestToJson(
    BatchMeterUsageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductCode', instance.productCode);
  writeNotNull(
      'UsageRecords', instance.usageRecords?.map((e) => e?.toJson())?.toList());
  return val;
}

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

Map<String, dynamic> _$MeterUsageRequestToJson(MeterUsageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductCode', instance.productCode);
  writeNotNull('Timestamp', unixTimestampToJson(instance.timestamp));
  writeNotNull('UsageDimension', instance.usageDimension);
  writeNotNull('DryRun', instance.dryRun);
  writeNotNull('UsageQuantity', instance.usageQuantity);
  return val;
}

MeterUsageResult _$MeterUsageResultFromJson(Map<String, dynamic> json) {
  return MeterUsageResult(
    meteringRecordId: json['MeteringRecordId'] as String,
  );
}

Map<String, dynamic> _$RegisterUsageRequestToJson(
    RegisterUsageRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductCode', instance.productCode);
  writeNotNull('PublicKeyVersion', instance.publicKeyVersion);
  writeNotNull('Nonce', instance.nonce);
  return val;
}

RegisterUsageResult _$RegisterUsageResultFromJson(Map<String, dynamic> json) {
  return RegisterUsageResult(
    publicKeyRotationTimestamp:
        unixTimestampFromJson(json['PublicKeyRotationTimestamp']),
    signature: json['Signature'] as String,
  );
}

Map<String, dynamic> _$ResolveCustomerRequestToJson(
    ResolveCustomerRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('RegistrationToken', instance.registrationToken);
  return val;
}

ResolveCustomerResult _$ResolveCustomerResultFromJson(
    Map<String, dynamic> json) {
  return ResolveCustomerResult(
    customerIdentifier: json['CustomerIdentifier'] as String,
    productCode: json['ProductCode'] as String,
  );
}

UsageRecord _$UsageRecordFromJson(Map<String, dynamic> json) {
  return UsageRecord(
    customerIdentifier: json['CustomerIdentifier'] as String,
    dimension: json['Dimension'] as String,
    timestamp: unixTimestampFromJson(json['Timestamp']),
    quantity: json['Quantity'] as int,
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
  writeNotNull('Timestamp', unixTimestampToJson(instance.timestamp));
  writeNotNull('Quantity', instance.quantity);
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
