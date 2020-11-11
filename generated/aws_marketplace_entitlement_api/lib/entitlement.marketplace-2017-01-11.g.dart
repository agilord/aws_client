// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entitlement.marketplace-2017-01-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entitlement _$EntitlementFromJson(Map<String, dynamic> json) {
  return Entitlement(
    customerIdentifier: json['CustomerIdentifier'] as String,
    dimension: json['Dimension'] as String,
    expirationDate: unixTimestampFromJson(json['ExpirationDate']),
    productCode: json['ProductCode'] as String,
    value: json['Value'] == null
        ? null
        : EntitlementValue.fromJson(json['Value'] as Map<String, dynamic>),
  );
}

EntitlementValue _$EntitlementValueFromJson(Map<String, dynamic> json) {
  return EntitlementValue(
    booleanValue: json['BooleanValue'] as bool,
    doubleValue: (json['DoubleValue'] as num)?.toDouble(),
    integerValue: json['IntegerValue'] as int,
    stringValue: json['StringValue'] as String,
  );
}

Map<String, dynamic> _$GetEntitlementsRequestToJson(
    GetEntitlementsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ProductCode', instance.productCode);
  writeNotNull('Filter', instance.filter);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

GetEntitlementsResult _$GetEntitlementsResultFromJson(
    Map<String, dynamic> json) {
  return GetEntitlementsResult(
    entitlements: (json['Entitlements'] as List)
        ?.map((e) =>
            e == null ? null : Entitlement.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

InternalServiceErrorException _$InternalServiceErrorExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalServiceErrorException(
    message: json['message'] as String,
  );
}

InvalidParameterException _$InvalidParameterExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidParameterException(
    message: json['message'] as String,
  );
}

ThrottlingException _$ThrottlingExceptionFromJson(Map<String, dynamic> json) {
  return ThrottlingException(
    message: json['message'] as String,
  );
}
