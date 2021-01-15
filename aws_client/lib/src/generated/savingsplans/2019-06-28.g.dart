// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2019-06-28.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateSavingsPlanResponse _$CreateSavingsPlanResponseFromJson(
    Map<String, dynamic> json) {
  return CreateSavingsPlanResponse(
    savingsPlanId: json['savingsPlanId'] as String,
  );
}

DeleteQueuedSavingsPlanResponse _$DeleteQueuedSavingsPlanResponseFromJson(
    Map<String, dynamic> json) {
  return DeleteQueuedSavingsPlanResponse();
}

DescribeSavingsPlanRatesResponse _$DescribeSavingsPlanRatesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSavingsPlanRatesResponse(
    nextToken: json['nextToken'] as String,
    savingsPlanId: json['savingsPlanId'] as String,
    searchResults: (json['searchResults'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlanRate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSavingsPlansOfferingRatesResponse
    _$DescribeSavingsPlansOfferingRatesResponseFromJson(
        Map<String, dynamic> json) {
  return DescribeSavingsPlansOfferingRatesResponse(
    nextToken: json['nextToken'] as String,
    searchResults: (json['searchResults'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlanOfferingRate.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSavingsPlansOfferingsResponse
    _$DescribeSavingsPlansOfferingsResponseFromJson(Map<String, dynamic> json) {
  return DescribeSavingsPlansOfferingsResponse(
    nextToken: json['nextToken'] as String,
    searchResults: (json['searchResults'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlanOffering.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

DescribeSavingsPlansResponse _$DescribeSavingsPlansResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeSavingsPlansResponse(
    nextToken: json['nextToken'] as String,
    savingsPlans: (json['savingsPlans'] as List)
        ?.map((e) =>
            e == null ? null : SavingsPlan.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ListTagsForResourceResponse _$ListTagsForResourceResponseFromJson(
    Map<String, dynamic> json) {
  return ListTagsForResourceResponse(
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

ParentSavingsPlanOffering _$ParentSavingsPlanOfferingFromJson(
    Map<String, dynamic> json) {
  return ParentSavingsPlanOffering(
    currency: _$enumDecodeNullable(_$CurrencyCodeEnumMap, json['currency']),
    durationSeconds: json['durationSeconds'] as int,
    offeringId: json['offeringId'] as String,
    paymentOption: _$enumDecodeNullable(
        _$SavingsPlanPaymentOptionEnumMap, json['paymentOption']),
    planDescription: json['planDescription'] as String,
    planType: _$enumDecodeNullable(_$SavingsPlanTypeEnumMap, json['planType']),
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

const _$CurrencyCodeEnumMap = {
  CurrencyCode.cny: 'CNY',
  CurrencyCode.usd: 'USD',
};

const _$SavingsPlanPaymentOptionEnumMap = {
  SavingsPlanPaymentOption.allUpfront: 'All Upfront',
  SavingsPlanPaymentOption.partialUpfront: 'Partial Upfront',
  SavingsPlanPaymentOption.noUpfront: 'No Upfront',
};

const _$SavingsPlanTypeEnumMap = {
  SavingsPlanType.compute: 'Compute',
  SavingsPlanType.eC2Instance: 'EC2Instance',
};

SavingsPlan _$SavingsPlanFromJson(Map<String, dynamic> json) {
  return SavingsPlan(
    commitment: json['commitment'] as String,
    currency: _$enumDecodeNullable(_$CurrencyCodeEnumMap, json['currency']),
    description: json['description'] as String,
    ec2InstanceFamily: json['ec2InstanceFamily'] as String,
    end: json['end'] as String,
    offeringId: json['offeringId'] as String,
    paymentOption: _$enumDecodeNullable(
        _$SavingsPlanPaymentOptionEnumMap, json['paymentOption']),
    productTypes: (json['productTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SavingsPlanProductTypeEnumMap, e))
        ?.toList(),
    recurringPaymentAmount: json['recurringPaymentAmount'] as String,
    region: json['region'] as String,
    savingsPlanArn: json['savingsPlanArn'] as String,
    savingsPlanId: json['savingsPlanId'] as String,
    savingsPlanType:
        _$enumDecodeNullable(_$SavingsPlanTypeEnumMap, json['savingsPlanType']),
    start: json['start'] as String,
    state: _$enumDecodeNullable(_$SavingsPlanStateEnumMap, json['state']),
    tags: (json['tags'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
    termDurationInSeconds: json['termDurationInSeconds'] as int,
    upfrontPaymentAmount: json['upfrontPaymentAmount'] as String,
  );
}

const _$SavingsPlanProductTypeEnumMap = {
  SavingsPlanProductType.ec2: 'EC2',
  SavingsPlanProductType.fargate: 'Fargate',
  SavingsPlanProductType.lambda: 'Lambda',
};

const _$SavingsPlanStateEnumMap = {
  SavingsPlanState.paymentPending: 'payment-pending',
  SavingsPlanState.paymentFailed: 'payment-failed',
  SavingsPlanState.active: 'active',
  SavingsPlanState.retired: 'retired',
  SavingsPlanState.queued: 'queued',
  SavingsPlanState.queuedDeleted: 'queued-deleted',
};

Map<String, dynamic> _$SavingsPlanFilterToJson(SavingsPlanFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$SavingsPlansFilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$SavingsPlansFilterNameEnumMap = {
  SavingsPlansFilterName.region: 'region',
  SavingsPlansFilterName.ec2InstanceFamily: 'ec2-instance-family',
  SavingsPlansFilterName.commitment: 'commitment',
  SavingsPlansFilterName.upfront: 'upfront',
  SavingsPlansFilterName.term: 'term',
  SavingsPlansFilterName.savingsPlanType: 'savings-plan-type',
  SavingsPlansFilterName.paymentOption: 'payment-option',
  SavingsPlansFilterName.start: 'start',
  SavingsPlansFilterName.end: 'end',
};

SavingsPlanOffering _$SavingsPlanOfferingFromJson(Map<String, dynamic> json) {
  return SavingsPlanOffering(
    currency: _$enumDecodeNullable(_$CurrencyCodeEnumMap, json['currency']),
    description: json['description'] as String,
    durationSeconds: json['durationSeconds'] as int,
    offeringId: json['offeringId'] as String,
    operation: json['operation'] as String,
    paymentOption: _$enumDecodeNullable(
        _$SavingsPlanPaymentOptionEnumMap, json['paymentOption']),
    planType: _$enumDecodeNullable(_$SavingsPlanTypeEnumMap, json['planType']),
    productTypes: (json['productTypes'] as List)
        ?.map((e) => _$enumDecodeNullable(_$SavingsPlanProductTypeEnumMap, e))
        ?.toList(),
    properties: (json['properties'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlanOfferingProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    serviceCode: json['serviceCode'] as String,
    usageType: json['usageType'] as String,
  );
}

Map<String, dynamic> _$SavingsPlanOfferingFilterElementToJson(
    SavingsPlanOfferingFilterElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'name', _$SavingsPlanOfferingFilterAttributeEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$SavingsPlanOfferingFilterAttributeEnumMap = {
  SavingsPlanOfferingFilterAttribute.region: 'region',
  SavingsPlanOfferingFilterAttribute.instanceFamily: 'instanceFamily',
};

SavingsPlanOfferingProperty _$SavingsPlanOfferingPropertyFromJson(
    Map<String, dynamic> json) {
  return SavingsPlanOfferingProperty(
    name: _$enumDecodeNullable(
        _$SavingsPlanOfferingPropertyKeyEnumMap, json['name']),
    value: json['value'] as String,
  );
}

const _$SavingsPlanOfferingPropertyKeyEnumMap = {
  SavingsPlanOfferingPropertyKey.region: 'region',
  SavingsPlanOfferingPropertyKey.instanceFamily: 'instanceFamily',
};

SavingsPlanOfferingRate _$SavingsPlanOfferingRateFromJson(
    Map<String, dynamic> json) {
  return SavingsPlanOfferingRate(
    operation: json['operation'] as String,
    productType: _$enumDecodeNullable(
        _$SavingsPlanProductTypeEnumMap, json['productType']),
    properties: (json['properties'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlanOfferingRateProperty.fromJson(
                e as Map<String, dynamic>))
        ?.toList(),
    rate: json['rate'] as String,
    savingsPlanOffering: json['savingsPlanOffering'] == null
        ? null
        : ParentSavingsPlanOffering.fromJson(
            json['savingsPlanOffering'] as Map<String, dynamic>),
    serviceCode: _$enumDecodeNullable(
        _$SavingsPlanRateServiceCodeEnumMap, json['serviceCode']),
    unit: _$enumDecodeNullable(_$SavingsPlanRateUnitEnumMap, json['unit']),
    usageType: json['usageType'] as String,
  );
}

const _$SavingsPlanRateServiceCodeEnumMap = {
  SavingsPlanRateServiceCode.amazonEC2: 'AmazonEC2',
  SavingsPlanRateServiceCode.amazonECS: 'AmazonECS',
  SavingsPlanRateServiceCode.awsLambda: 'AWSLambda',
};

const _$SavingsPlanRateUnitEnumMap = {
  SavingsPlanRateUnit.hrs: 'Hrs',
  SavingsPlanRateUnit.lambdaGbSecond: 'Lambda-GB-Second',
  SavingsPlanRateUnit.request: 'Request',
};

Map<String, dynamic> _$SavingsPlanOfferingRateFilterElementToJson(
    SavingsPlanOfferingRateFilterElement instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$SavingsPlanRateFilterAttributeEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$SavingsPlanRateFilterAttributeEnumMap = {
  SavingsPlanRateFilterAttribute.region: 'region',
  SavingsPlanRateFilterAttribute.instanceFamily: 'instanceFamily',
  SavingsPlanRateFilterAttribute.instanceType: 'instanceType',
  SavingsPlanRateFilterAttribute.productDescription: 'productDescription',
  SavingsPlanRateFilterAttribute.tenancy: 'tenancy',
  SavingsPlanRateFilterAttribute.productId: 'productId',
};

SavingsPlanOfferingRateProperty _$SavingsPlanOfferingRatePropertyFromJson(
    Map<String, dynamic> json) {
  return SavingsPlanOfferingRateProperty(
    name: json['name'] as String,
    value: json['value'] as String,
  );
}

SavingsPlanRate _$SavingsPlanRateFromJson(Map<String, dynamic> json) {
  return SavingsPlanRate(
    currency: _$enumDecodeNullable(_$CurrencyCodeEnumMap, json['currency']),
    operation: json['operation'] as String,
    productType: _$enumDecodeNullable(
        _$SavingsPlanProductTypeEnumMap, json['productType']),
    properties: (json['properties'] as List)
        ?.map((e) => e == null
            ? null
            : SavingsPlanRateProperty.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    rate: json['rate'] as String,
    serviceCode: _$enumDecodeNullable(
        _$SavingsPlanRateServiceCodeEnumMap, json['serviceCode']),
    unit: _$enumDecodeNullable(_$SavingsPlanRateUnitEnumMap, json['unit']),
    usageType: json['usageType'] as String,
  );
}

Map<String, dynamic> _$SavingsPlanRateFilterToJson(
    SavingsPlanRateFilter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', _$SavingsPlanRateFilterNameEnumMap[instance.name]);
  writeNotNull('values', instance.values);
  return val;
}

const _$SavingsPlanRateFilterNameEnumMap = {
  SavingsPlanRateFilterName.region: 'region',
  SavingsPlanRateFilterName.instanceType: 'instanceType',
  SavingsPlanRateFilterName.productDescription: 'productDescription',
  SavingsPlanRateFilterName.tenancy: 'tenancy',
  SavingsPlanRateFilterName.productType: 'productType',
  SavingsPlanRateFilterName.serviceCode: 'serviceCode',
  SavingsPlanRateFilterName.usageType: 'usageType',
  SavingsPlanRateFilterName.operation: 'operation',
};

SavingsPlanRateProperty _$SavingsPlanRatePropertyFromJson(
    Map<String, dynamic> json) {
  return SavingsPlanRateProperty(
    name:
        _$enumDecodeNullable(_$SavingsPlanRatePropertyKeyEnumMap, json['name']),
    value: json['value'] as String,
  );
}

const _$SavingsPlanRatePropertyKeyEnumMap = {
  SavingsPlanRatePropertyKey.region: 'region',
  SavingsPlanRatePropertyKey.instanceType: 'instanceType',
  SavingsPlanRatePropertyKey.instanceFamily: 'instanceFamily',
  SavingsPlanRatePropertyKey.productDescription: 'productDescription',
  SavingsPlanRatePropertyKey.tenancy: 'tenancy',
};

TagResourceResponse _$TagResourceResponseFromJson(Map<String, dynamic> json) {
  return TagResourceResponse();
}

UntagResourceResponse _$UntagResourceResponseFromJson(
    Map<String, dynamic> json) {
  return UntagResourceResponse();
}
