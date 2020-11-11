// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing-2017-10-15.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AttributeValue _$AttributeValueFromJson(Map<String, dynamic> json) {
  return AttributeValue(
    value: json['Value'] as String,
  );
}

Map<String, dynamic> _$DescribeServicesRequestToJson(
    DescribeServicesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('FormatVersion', instance.formatVersion);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ServiceCode', instance.serviceCode);
  return val;
}

DescribeServicesResponse _$DescribeServicesResponseFromJson(
    Map<String, dynamic> json) {
  return DescribeServicesResponse(
    formatVersion: json['FormatVersion'] as String,
    nextToken: json['NextToken'] as String,
    services: (json['Services'] as List)
        ?.map((e) =>
            e == null ? null : Service.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

ExpiredNextTokenException _$ExpiredNextTokenExceptionFromJson(
    Map<String, dynamic> json) {
  return ExpiredNextTokenException(
    message: json['Message'] as String,
  );
}

Map<String, dynamic> _$FilterToJson(Filter instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Field', instance.field);
  writeNotNull('Type', _$FilterTypeEnumMap[instance.type]);
  writeNotNull('Value', instance.value);
  return val;
}

const _$FilterTypeEnumMap = {
  FilterType.termMatch: 'TERM_MATCH',
};

Map<String, dynamic> _$GetAttributeValuesRequestToJson(
    GetAttributeValuesRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('AttributeName', instance.attributeName);
  writeNotNull('ServiceCode', instance.serviceCode);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  return val;
}

GetAttributeValuesResponse _$GetAttributeValuesResponseFromJson(
    Map<String, dynamic> json) {
  return GetAttributeValuesResponse(
    attributeValues: (json['AttributeValues'] as List)
        ?.map((e) => e == null
            ? null
            : AttributeValue.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    nextToken: json['NextToken'] as String,
  );
}

Map<String, dynamic> _$GetProductsRequestToJson(GetProductsRequest instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('Filters', instance.filters?.map((e) => e?.toJson())?.toList());
  writeNotNull('FormatVersion', instance.formatVersion);
  writeNotNull('MaxResults', instance.maxResults);
  writeNotNull('NextToken', instance.nextToken);
  writeNotNull('ServiceCode', instance.serviceCode);
  return val;
}

GetProductsResponse _$GetProductsResponseFromJson(Map<String, dynamic> json) {
  return GetProductsResponse(
    formatVersion: json['FormatVersion'] as String,
    nextToken: json['NextToken'] as String,
    priceList: (json['PriceList'] as List)?.map((e) => e as String)?.toList(),
  );
}

InternalErrorException _$InternalErrorExceptionFromJson(
    Map<String, dynamic> json) {
  return InternalErrorException(
    message: json['Message'] as String,
  );
}

InvalidNextTokenException _$InvalidNextTokenExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidNextTokenException(
    message: json['Message'] as String,
  );
}

InvalidParameterException _$InvalidParameterExceptionFromJson(
    Map<String, dynamic> json) {
  return InvalidParameterException(
    message: json['Message'] as String,
  );
}

NotFoundException _$NotFoundExceptionFromJson(Map<String, dynamic> json) {
  return NotFoundException(
    message: json['Message'] as String,
  );
}

Service _$ServiceFromJson(Map<String, dynamic> json) {
  return Service(
    attributeNames:
        (json['AttributeNames'] as List)?.map((e) => e as String)?.toList(),
    serviceCode: json['ServiceCode'] as String,
  );
}
