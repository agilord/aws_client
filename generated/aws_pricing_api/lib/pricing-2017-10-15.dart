// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// AWS Price List Service API (AWS Price List Service) is a centralized and
/// convenient way to programmatically query Amazon Web Services for services,
/// products, and pricing information. The AWS Price List Service uses
/// standardized product attributes such as <code>Location</code>, <code>Storage
/// Class</code>, and <code>Operating System</code>, and provides prices at the
/// SKU level. You can use the AWS Price List Service to build cost control and
/// scenario planning tools, reconcile billing data, forecast future spend for
/// budgeting purposes, and provide cost benefit analysis that compare your
/// internal workloads with AWS.
///
/// Use <code>GetServices</code> without a service code to retrieve the service
/// codes for all AWS services, then <code>GetServices</code> with a service
/// code to retreive the attribute names for that service. After you have the
/// service code and attribute names, you can use
/// <code>GetAttributeValues</code> to see what values are available for an
/// attribute. With the service code and an attribute name and value, you can
/// use <code>GetProducts</code> to find specific products that you're
/// interested in, such as an <code>AmazonEC2</code> instance, with a
/// <code>Provisioned IOPS</code> <code>volumeType</code>.
///
/// Service Endpoint
///
/// AWS Price List Service API provides the following two endpoints:
///
/// <ul>
/// <li>
/// https://api.pricing.us-east-1.amazonaws.com
/// </li>
/// <li>
/// https://api.pricing.ap-south-1.amazonaws.com
/// </li>
/// </ul>
class Pricing {
  final _s.JsonProtocol _protocol;
  Pricing({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'api.pricing',
            signingName: 'pricing',
          ),
          region: region,
          credentials: credentials,
          credentialsProvider: credentialsProvider,
          endpointUrl: endpointUrl,
        );

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Returns the metadata for one service or a list of the metadata for all
  /// services. Use this without a service code to get the service codes for all
  /// services. Use it with a service code, such as <code>AmazonEC2</code>, to
  /// get information specific to that service, such as the attribute names
  /// available for that service. For example, some of the attribute names
  /// available for EC2 are <code>volumeType</code>, <code>maxIopsVolume</code>,
  /// <code>operation</code>, <code>locationType</code>, and
  /// <code>instanceCapacity10xlarge</code>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  ///
  /// Parameter [formatVersion] :
  /// The format version that you want the response to be in.
  ///
  /// Valid values are: <code>aws_v1</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that you want returned in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [serviceCode] :
  /// The code for the service whose information you want to retrieve, such as
  /// <code>AmazonEC2</code>. You can use the <code>ServiceCode</code> to filter
  /// the results in a <code>GetProducts</code> call. To retrieve a list of all
  /// services, leave this blank.
  Future<DescribeServicesResponse> describeServices({
    String? formatVersion,
    int? maxResults,
    String? nextToken,
    String? serviceCode,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPriceListService.DescribeServices'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (formatVersion != null) 'FormatVersion': formatVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (serviceCode != null) 'ServiceCode': serviceCode,
      },
    );

    return DescribeServicesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of attribute values. Attibutes are similar to the details
  /// in a Price List API offer file. For a list of available attributes, see <a
  /// href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs">Offer
  /// File Definitions</a> in the <a
  /// href="http://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html">AWS
  /// Billing and Cost Management User Guide</a>.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  ///
  /// Parameter [attributeName] :
  /// The name of the attribute that you want to retrieve the values for, such
  /// as <code>volumeType</code>.
  ///
  /// Parameter [serviceCode] :
  /// The service code for the service whose attributes you want to retrieve.
  /// For example, if you want the retrieve an EC2 attribute, use
  /// <code>AmazonEC2</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  Future<GetAttributeValuesResponse> getAttributeValues({
    required String attributeName,
    required String serviceCode,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(attributeName, 'attributeName');
    ArgumentError.checkNotNull(serviceCode, 'serviceCode');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPriceListService.GetAttributeValues'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'AttributeName': attributeName,
        'ServiceCode': serviceCode,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetAttributeValuesResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all products that match the filter criteria.
  ///
  /// May throw [InternalErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ExpiredNextTokenException].
  ///
  /// Parameter [filters] :
  /// The list of filters that limit the returned products. only products that
  /// match all filters are returned.
  ///
  /// Parameter [formatVersion] :
  /// The format version that you want the response to be in.
  ///
  /// Valid values are: <code>aws_v1</code>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [serviceCode] :
  /// The code for the service whose products you want to retrieve.
  Future<GetProductsResponse> getProducts({
    List<Filter>? filters,
    String? formatVersion,
    int? maxResults,
    String? nextToken,
    String? serviceCode,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPriceListService.GetProducts'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filters != null) 'Filters': filters,
        if (formatVersion != null) 'FormatVersion': formatVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (serviceCode != null) 'ServiceCode': serviceCode,
      },
    );

    return GetProductsResponse.fromJson(jsonResponse.body);
  }
}

/// The values of a given attribute, such as <code>Throughput Optimized
/// HDD</code> or <code>Provisioned IOPS</code> for the <code>Amazon EC2</code>
/// <code>volumeType</code> attribute.
class AttributeValue {
  /// The specific value of an <code>attributeName</code>.
  final String? value;

  AttributeValue({
    this.value,
  });
  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      value: json['Value'] as String?,
    );
  }
}

class DescribeServicesResponse {
  /// The format version of the response. For example, <code>aws_v1</code>.
  final String? formatVersion;

  /// The pagination token for the next set of retreivable results.
  final String? nextToken;

  /// The service metadata for the service or services in the response.
  final List<Service>? services;

  DescribeServicesResponse({
    this.formatVersion,
    this.nextToken,
    this.services,
  });
  factory DescribeServicesResponse.fromJson(Map<String, dynamic> json) {
    return DescribeServicesResponse(
      formatVersion: json['FormatVersion'] as String?,
      nextToken: json['NextToken'] as String?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}

/// The pagination token expired. Try again without a pagination token.
class ExpiredNextTokenException implements _s.AwsException {
  final String? message;

  ExpiredNextTokenException({
    this.message,
  });
  factory ExpiredNextTokenException.fromJson(Map<String, dynamic> json) {
    return ExpiredNextTokenException(
      message: json['Message'] as String?,
    );
  }
}

/// The constraints that you want all returned products to match.
class Filter {
  /// The product metadata field that you want to filter on. You can filter by
  /// just the service code to see all products for a specific service, filter by
  /// just the attribute name to see a specific attribute for multiple services,
  /// or use both a service code and an attribute name to retrieve only products
  /// that match both fields.
  ///
  /// Valid values include: <code>ServiceCode</code>, and all attribute names
  ///
  /// For example, you can filter by the <code>AmazonEC2</code> service code and
  /// the <code>volumeType</code> attribute name to get the prices for only Amazon
  /// EC2 volumes.
  final String field;

  /// The type of filter that you want to use.
  ///
  /// Valid values are: <code>TERM_MATCH</code>. <code>TERM_MATCH</code> returns
  /// only products that match both the given filter field and the given value.
  final FilterType type;

  /// The service code or attribute value that you want to filter by. If you are
  /// filtering by service code this is the actual service code, such as
  /// <code>AmazonEC2</code>. If you are filtering by attribute name, this is the
  /// attribute value that you want the returned products to match, such as a
  /// <code>Provisioned IOPS</code> volume.
  final String value;

  Filter({
    required this.field,
    required this.type,
    required this.value,
  });
  Map<String, dynamic> toJson() {
    final field = this.field;
    final type = this.type;
    final value = this.value;
    return {
      'Field': field,
      'Type': type.toValue(),
      'Value': value,
    };
  }
}

enum FilterType {
  termMatch,
}

extension FilterTypeValueExtension on FilterType {
  String toValue() {
    switch (this) {
      case FilterType.termMatch:
        return 'TERM_MATCH';
    }
  }
}

extension FilterTypeFromString on String {
  FilterType toFilterType() {
    switch (this) {
      case 'TERM_MATCH':
        return FilterType.termMatch;
    }
    throw Exception('$this is not known in enum FilterType');
  }
}

class GetAttributeValuesResponse {
  /// The list of values for an attribute. For example, <code>Throughput Optimized
  /// HDD</code> and <code>Provisioned IOPS</code> are two available values for
  /// the <code>AmazonEC2</code> <code>volumeType</code>.
  final List<AttributeValue>? attributeValues;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  GetAttributeValuesResponse({
    this.attributeValues,
    this.nextToken,
  });
  factory GetAttributeValuesResponse.fromJson(Map<String, dynamic> json) {
    return GetAttributeValuesResponse(
      attributeValues: (json['AttributeValues'] as List?)
          ?.whereNotNull()
          .map((e) => AttributeValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }
}

class GetProductsResponse {
  /// The format version of the response. For example, aws_v1.
  final String? formatVersion;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  /// The list of products that match your filters. The list contains both the
  /// product metadata and the price information.
  final List<Object>? priceList;

  GetProductsResponse({
    this.formatVersion,
    this.nextToken,
    this.priceList,
  });
  factory GetProductsResponse.fromJson(Map<String, dynamic> json) {
    return GetProductsResponse(
      formatVersion: json['FormatVersion'] as String?,
      nextToken: json['NextToken'] as String?,
      priceList: json['PriceList'] == null
          ? null
          : (json['PriceList'] as List)
              .map((v) => jsonDecode(v as String))
              .toList()
              .cast<Object>(),
    );
  }
}

/// An error on the server occurred during the processing of your request. Try
/// again later.
class InternalErrorException implements _s.AwsException {
  final String? message;

  InternalErrorException({
    this.message,
  });
  factory InternalErrorException.fromJson(Map<String, dynamic> json) {
    return InternalErrorException(
      message: json['Message'] as String?,
    );
  }
}

/// The pagination token is invalid. Try again without a pagination token.
class InvalidNextTokenException implements _s.AwsException {
  final String? message;

  InvalidNextTokenException({
    this.message,
  });
  factory InvalidNextTokenException.fromJson(Map<String, dynamic> json) {
    return InvalidNextTokenException(
      message: json['Message'] as String?,
    );
  }
}

/// One or more parameters had an invalid value.
class InvalidParameterException implements _s.AwsException {
  final String? message;

  InvalidParameterException({
    this.message,
  });
  factory InvalidParameterException.fromJson(Map<String, dynamic> json) {
    return InvalidParameterException(
      message: json['Message'] as String?,
    );
  }
}

/// The requested resource can't be found.
class NotFoundException implements _s.AwsException {
  final String? message;

  NotFoundException({
    this.message,
  });
  factory NotFoundException.fromJson(Map<String, dynamic> json) {
    return NotFoundException(
      message: json['Message'] as String?,
    );
  }
}

/// The metadata for a service, such as the service code and available attribute
/// names.
class Service {
  /// The attributes that are available for this service.
  final List<String>? attributeNames;

  /// The code for the AWS service.
  final String? serviceCode;

  Service({
    this.attributeNames,
    this.serviceCode,
  });
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      attributeNames: (json['AttributeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      serviceCode: json['ServiceCode'] as String?,
    );
  }
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ExpiredNextTokenException': (type, message) =>
      ExpiredNextTokenException(message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(message: message),
  'NotFoundException': (type, message) => NotFoundException(message: message),
};
