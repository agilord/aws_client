// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import '../../shared/shared.dart' as _s;
import '../../shared/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export '../../shared/shared.dart' show AwsClientCredentials;

/// The Amazon Web Services Price List API is a centralized and convenient way
/// to programmatically query Amazon Web Services for services, products, and
/// pricing information. The Amazon Web Services Price List uses standardized
/// product attributes such as <code>Location</code>, <code>Storage
/// Class</code>, and <code>Operating System</code>, and provides prices at the
/// SKU level. You can use the Amazon Web Services Price List to do the
/// following:
///
/// <ul>
/// <li>
/// Build cost control and scenario planning tools
/// </li>
/// <li>
/// Reconcile billing data
/// </li>
/// <li>
/// Forecast future spend for budgeting purposes
/// </li>
/// <li>
/// Provide cost benefit analysis that compare your internal workloads with
/// Amazon Web Services
/// </li>
/// </ul>
/// Use <code>GetServices</code> without a service code to retrieve the service
/// codes for all Amazon Web Services, then <code>GetServices</code> with a
/// service code to retrieve the attribute names for that service. After you
/// have the service code and attribute names, you can use
/// <code>GetAttributeValues</code> to see what values are available for an
/// attribute. With the service code and an attribute name and value, you can
/// use <code>GetProducts</code> to find specific products that you're
/// interested in, such as an <code>AmazonEC2</code> instance, with a
/// <code>Provisioned IOPS</code> <code>volumeType</code>.
///
/// For more information, see <a
/// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/price-changes.html">Using
/// the Amazon Web Services Price List API</a> in the <i>Billing User Guide</i>.
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
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [ThrottlingException].
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

  /// Returns a list of attribute values. Attributes are similar to the details
  /// in a Price List API offer file. For a list of available attributes, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/reading-an-offer.html#pps-defs">Offer
  /// File Definitions</a> in the <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-what-is.html">Billing
  /// and Cost Management User Guide</a>.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [ThrottlingException].
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

  /// <i> <b>This feature is in preview release and is subject to change. Your
  /// use of Amazon Web Services Price List API is subject to the Beta Service
  /// Participation terms of the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Section 1.10).</b> </i>
  ///
  /// This returns the URL that you can retrieve your Price List file from. This
  /// URL is based on the <code>PriceListArn</code> and <code>FileFormat</code>
  /// that you retrieve from the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html">ListPriceLists</a>
  /// response.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [fileFormat] :
  /// The format that you want to retrieve your Price List files in. The
  /// <code>FileFormat</code> can be obtained from the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html">ListPriceLists</a>
  /// response.
  ///
  /// Parameter [priceListArn] :
  /// The unique identifier that maps to where your Price List files are
  /// located. <code>PriceListArn</code> can be obtained from the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html">ListPriceLists</a>
  /// response.
  Future<GetPriceListFileUrlResponse> getPriceListFileUrl({
    required String fileFormat,
    required String priceListArn,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPriceListService.GetPriceListFileUrl'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'FileFormat': fileFormat,
        'PriceListArn': priceListArn,
      },
    );

    return GetPriceListFileUrlResponse.fromJson(jsonResponse.body);
  }

  /// Returns a list of all products that match the filter criteria.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NotFoundException].
  /// May throw [InternalErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ExpiredNextTokenException].
  ///
  /// Parameter [serviceCode] :
  /// The code for the service whose products you want to retrieve.
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
  Future<GetProductsResponse> getProducts({
    required String serviceCode,
    List<Filter>? filters,
    String? formatVersion,
    int? maxResults,
    String? nextToken,
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
        'ServiceCode': serviceCode,
        if (filters != null) 'Filters': filters,
        if (formatVersion != null) 'FormatVersion': formatVersion,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetProductsResponse.fromJson(jsonResponse.body);
  }

  /// <i> <b>This feature is in preview release and is subject to change. Your
  /// use of Amazon Web Services Price List API is subject to the Beta Service
  /// Participation terms of the <a
  /// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
  /// Terms</a> (Section 1.10).</b> </i>
  ///
  /// This returns a list of Price List references that the requester if
  /// authorized to view, given a <code>ServiceCode</code>,
  /// <code>CurrencyCode</code>, and an <code>EffectiveDate</code>. Use without
  /// a <code>RegionCode</code> filter to list Price List references from all
  /// available Amazon Web Services Regions. Use with a <code>RegionCode</code>
  /// filter to get the Price List reference that's specific to a specific
  /// Amazon Web Services Region. You can use the <code>PriceListArn</code> from
  /// the response to get your preferred Price List files through the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_GetPriceListFileUrl.html">GetPriceListFileUrl</a>
  /// API.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [NotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ExpiredNextTokenException].
  ///
  /// Parameter [currencyCode] :
  /// The three alphabetical character ISO-4217 currency code that the Price
  /// List files are denominated in.
  ///
  /// Parameter [effectiveDate] :
  /// The date that the Price List file prices are effective from.
  ///
  /// Parameter [serviceCode] :
  /// The service code or the Savings Plan service code for the attributes that
  /// you want to retrieve. For example, to get the list of applicable Amazon
  /// EC2 price lists, use <code>AmazonEC2</code>. For a full list of service
  /// codes containing On-Demand and Reserved Instance (RI) pricing, use the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_DescribeServices.html#awscostmanagement-pricing_DescribeServices-request-FormatVersion">DescribeServices</a>
  /// API.
  ///
  /// To retrieve the Reserved Instance and Compute Savings Plan price lists,
  /// use <code>ComputeSavingsPlans</code>.
  ///
  /// To retrieve Machine Learning Savings Plans price lists, use
  /// <code>MachineLearningSavingsPlans</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results that you want
  /// to retrieve.
  ///
  /// Parameter [regionCode] :
  /// This is used to filter the Price List by Amazon Web Services Region. For
  /// example, to get the price list only for the <code>US East (N.
  /// Virginia)</code> Region, use <code>us-east-1</code>. If nothing is
  /// specified, you retrieve price lists for all applicable Regions. The
  /// available <code>RegionCode</code> list can be retrieved from <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_GetAttributeValues.html">GetAttributeValues</a>
  /// API.
  Future<ListPriceListsResponse> listPriceLists({
    required String currencyCode,
    required DateTime effectiveDate,
    required String serviceCode,
    int? maxResults,
    String? nextToken,
    String? regionCode,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSPriceListService.ListPriceLists'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'CurrencyCode': currencyCode,
        'EffectiveDate': unixTimestampToJson(effectiveDate),
        'ServiceCode': serviceCode,
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
        if (regionCode != null) 'RegionCode': regionCode,
      },
    );

    return ListPriceListsResponse.fromJson(jsonResponse.body);
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

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      if (value != null) 'Value': value,
    };
  }
}

class DescribeServicesResponse {
  /// The format version of the response. For example, <code>aws_v1</code>.
  final String? formatVersion;

  /// The pagination token for the next set of retrievable results.
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

  Map<String, dynamic> toJson() {
    final formatVersion = this.formatVersion;
    final nextToken = this.nextToken;
    final services = this.services;
    return {
      if (formatVersion != null) 'FormatVersion': formatVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (services != null) 'Services': services,
    };
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

  /// The service code or attribute value that you want to filter by. If you're
  /// filtering by service code this is the actual service code, such as
  /// <code>AmazonEC2</code>. If you're filtering by attribute name, this is the
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

  Map<String, dynamic> toJson() {
    final attributeValues = this.attributeValues;
    final nextToken = this.nextToken;
    return {
      if (attributeValues != null) 'AttributeValues': attributeValues,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetPriceListFileUrlResponse {
  /// The URL to download your Price List file from.
  final String? url;

  GetPriceListFileUrlResponse({
    this.url,
  });

  factory GetPriceListFileUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetPriceListFileUrlResponse(
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'Url': url,
    };
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

  Map<String, dynamic> toJson() {
    final formatVersion = this.formatVersion;
    final nextToken = this.nextToken;
    final priceList = this.priceList;
    return {
      if (formatVersion != null) 'FormatVersion': formatVersion,
      if (nextToken != null) 'NextToken': nextToken,
      if (priceList != null) 'PriceList': priceList.map(jsonEncode).toList(),
    };
  }
}

class ListPriceListsResponse {
  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  /// The type of price list references that match your request.
  final List<PriceList>? priceLists;

  ListPriceListsResponse({
    this.nextToken,
    this.priceLists,
  });

  factory ListPriceListsResponse.fromJson(Map<String, dynamic> json) {
    return ListPriceListsResponse(
      nextToken: json['NextToken'] as String?,
      priceLists: (json['PriceLists'] as List?)
          ?.whereNotNull()
          .map((e) => PriceList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final priceLists = this.priceLists;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (priceLists != null) 'PriceLists': priceLists,
    };
  }
}

/// <i> <b>This feature is in preview release and is subject to change. Your use
/// of Amazon Web Services Price List API is subject to the Beta Service
/// Participation terms of the <a
/// href="https://aws.amazon.com/service-terms/">Amazon Web Services Service
/// Terms</a> (Section 1.10).</b> </i>
///
/// This is the type of price list references that match your request.
class PriceList {
  /// The three alphabetical character ISO-4217 currency code the Price List files
  /// are denominated in.
  final String? currencyCode;

  /// The format you want to retrieve your Price List files. The
  /// <code>FileFormat</code> can be obtained from the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html">
  /// <code>ListPriceList</code> </a> response.
  final List<String>? fileFormats;

  /// The unique identifier that maps to where your Price List files are located.
  /// <code>PriceListArn</code> can be obtained from the <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_ListPriceLists.html">
  /// <code>ListPriceList</code> </a> response.
  final String? priceListArn;

  /// This is used to filter the Price List by Amazon Web Services Region. For
  /// example, to get the price list only for the <code>US East (N.
  /// Virginia)</code> Region, use <code>us-east-1</code>. If nothing is
  /// specified, you retrieve price lists for all applicable Regions. The
  /// available <code>RegionCode</code> list can be retrieved from <a
  /// href="https://docs.aws.amazon.com/aws-cost-management/latest/APIReference/API_pricing_GetAttributeValues.html">
  /// <code>GetAttributeValues</code> </a> API.
  final String? regionCode;

  PriceList({
    this.currencyCode,
    this.fileFormats,
    this.priceListArn,
    this.regionCode,
  });

  factory PriceList.fromJson(Map<String, dynamic> json) {
    return PriceList(
      currencyCode: json['CurrencyCode'] as String?,
      fileFormats: (json['FileFormats'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      priceListArn: json['PriceListArn'] as String?,
      regionCode: json['RegionCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final fileFormats = this.fileFormats;
    final priceListArn = this.priceListArn;
    final regionCode = this.regionCode;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (fileFormats != null) 'FileFormats': fileFormats,
      if (priceListArn != null) 'PriceListArn': priceListArn,
      if (regionCode != null) 'RegionCode': regionCode,
    };
  }
}

/// The metadata for a service, such as the service code and available attribute
/// names.
class Service {
  /// The code for the Amazon Web Services service.
  final String serviceCode;

  /// The attributes that are available for this service.
  final List<String>? attributeNames;

  Service({
    required this.serviceCode,
    this.attributeNames,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      serviceCode: json['ServiceCode'] as String,
      attributeNames: (json['AttributeNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serviceCode = this.serviceCode;
    final attributeNames = this.attributeNames;
    return {
      'ServiceCode': serviceCode,
      if (attributeNames != null) 'AttributeNames': attributeNames,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ExpiredNextTokenException extends _s.GenericAwsException {
  ExpiredNextTokenException({String? type, String? message})
      : super(type: type, code: 'ExpiredNextTokenException', message: message);
}

class InternalErrorException extends _s.GenericAwsException {
  InternalErrorException({String? type, String? message})
      : super(type: type, code: 'InternalErrorException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ExpiredNextTokenException': (type, message) =>
      ExpiredNextTokenException(type: type, message: message),
  'InternalErrorException': (type, message) =>
      InternalErrorException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
