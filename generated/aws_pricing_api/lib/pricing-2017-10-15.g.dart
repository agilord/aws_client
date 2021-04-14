// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing-2017-10-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    value: json['Value'] as String?,
  );
}

DescribeServicesResponse _$DescribeServicesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServicesResponse(
    formatVersion: json['FormatVersion'] as String?,
    nextToken: json['NextToken'] as String?,
    services: (json['Services'] as List<dynamic>?)
        ?.map((e) => Service.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

ExpiredNextTokenException _$ExpiredNextTokenExceptionFromJson(
    Map<String, dynamic> json) {
  return ExpiredNextTokenException(
    message: json['Message'] as String?,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'Field': instance.field,
      'Type': _$FilterTypeEnumMap[instance.type],
      'Value': instance.value,
    };

const _$FilterTypeEnumMap = {
  FilterType.termMatch: 'TERM_MATCH',
};

GetAttributeValuesResponse _$GetAttributeValuesResponseFromJson(
    Map<String, dynamic> json) {
  return GetAttributeValuesResponse(
    attributeValues: (json['AttributeValues'] as List<dynamic>?)
        ?.map((e) => AttributeValue.fromJson(e as Map<String, dynamic>))
        .toList(),
    nextToken: json['NextToken'] as String?,
  );
}

GetProductsResponse _$GetProductsResponseFromJson(Map<String, dynamic> json) {
  return GetProductsResponse(
    formatVersion: json['FormatVersion'] as String?,
    nextToken: json['NextToken'] as String?,
    priceList:
        (json['PriceList'] as List<dynamic>?)?.map((e) => e as Object).toList(),
  );
}

InternalErrorException _$InternalErrorExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalErrorException(
    message: json['Message'] as String?,
  );
}

InvalidNextTokenException _$InvalidNextTokenExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidNextTokenException(
    message: json['Message'] as String?,
  );
}

InvalidParameterException _$InvalidParameterExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidParameterException(
    message: json['Message'] as String?,
  );
}

NotFoundException _$NotFoundExceptionFromJson(Map<String, dynamic> json) {
  return NotFoundException(
    message: json['Message'] as String?,
  );
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    attributeNames: (json['AttributeNames'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    serviceCode: json['ServiceCode'] as String?,
  );
}
