// GENERATED CODE - DO NOT MODIFY BY HAND

part of '2017-01-11.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entitlement _$EntitlementFromJson(Map<String, dynamic> json) {
  return Entitlement(
    customerIdentifier: json['CustomerIdentifier'] as String,
    dimension: json['Dimension'] as String,
    expirationDate:
        const UnixDateTimeConverter().fromJson(json['ExpirationDate']),
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
