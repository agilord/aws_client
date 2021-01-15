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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2017-01-11.g.dart';

/// This reference provides descriptions of the AWS Marketplace Entitlement
/// Service API.
class MarketplaceEntitlement {
  final _s.JsonProtocol _protocol;
  MarketplaceEntitlement({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'entitlement.marketplace',
            signingName: 'aws-marketplace',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// GetEntitlements retrieves entitlement values for a given product. The
  /// results can be filtered based on customer identifier or product
  /// dimensions.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServiceErrorException].
  ///
  /// Parameter [productCode] :
  /// Product code is used to uniquely identify a product in AWS Marketplace.
  /// The product code will be provided by AWS Marketplace when the product
  /// listing is created.
  ///
  /// Parameter [filter] :
  /// Filter is used to return entitlements for a specific customer or for a
  /// specific dimension. Filters are described as keys mapped to a lists of
  /// values. Filtered requests are <i>unioned</i> for each value in the value
  /// list, and then <i>intersected</i> for each filter key.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of items to retrieve from the GetEntitlements
  /// operation. For pagination, use the NextToken field in subsequent calls to
  /// GetEntitlements.
  ///
  /// Parameter [nextToken] :
  /// For paginated calls to GetEntitlements, pass the NextToken from the
  /// previous GetEntitlementsResult.
  Future<GetEntitlementsResult> getEntitlements({
    @_s.required String productCode,
    Map<GetEntitlementFilterName, List<String>> filter,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(productCode, 'productCode');
    _s.validateStringLength(
      'productCode',
      productCode,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''\S+''',
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSMPEntitlementService.GetEntitlements'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'ProductCode': productCode,
        if (filter != null)
          'Filter': filter.map((k, e) => MapEntry(k.toValue(), e)),
        if (maxResults != null) 'MaxResults': maxResults,
        if (nextToken != null) 'NextToken': nextToken,
      },
    );

    return GetEntitlementsResult.fromJson(jsonResponse.body);
  }
}

/// An entitlement represents capacity in a product owned by the customer. For
/// example, a customer might own some number of users or seats in an SaaS
/// application or some amount of data capacity in a multi-tenant database.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Entitlement {
  /// The customer identifier is a handle to each unique customer in an
  /// application. Customer identifiers are obtained through the ResolveCustomer
  /// operation in AWS Marketplace Metering Service.
  @_s.JsonKey(name: 'CustomerIdentifier')
  final String customerIdentifier;

  /// The dimension for which the given entitlement applies. Dimensions represent
  /// categories of capacity in a product and are specified when the product is
  /// listed in AWS Marketplace.
  @_s.JsonKey(name: 'Dimension')
  final String dimension;

  /// The expiration date represents the minimum date through which this
  /// entitlement is expected to remain valid. For contractual products listed on
  /// AWS Marketplace, the expiration date is the date at which the customer will
  /// renew or cancel their contract. Customers who are opting to renew their
  /// contract will still have entitlements with an expiration date.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ExpirationDate')
  final DateTime expirationDate;

  /// The product code for which the given entitlement applies. Product codes are
  /// provided by AWS Marketplace when the product listing is created.
  @_s.JsonKey(name: 'ProductCode')
  final String productCode;

  /// The EntitlementValue represents the amount of capacity that the customer is
  /// entitled to for the product.
  @_s.JsonKey(name: 'Value')
  final EntitlementValue value;

  Entitlement({
    this.customerIdentifier,
    this.dimension,
    this.expirationDate,
    this.productCode,
    this.value,
  });
  factory Entitlement.fromJson(Map<String, dynamic> json) =>
      _$EntitlementFromJson(json);
}

/// The EntitlementValue represents the amount of capacity that the customer is
/// entitled to for the product.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EntitlementValue {
  /// The BooleanValue field will be populated with a boolean value when the
  /// entitlement is a boolean type. Otherwise, the field will not be set.
  @_s.JsonKey(name: 'BooleanValue')
  final bool booleanValue;

  /// The DoubleValue field will be populated with a double value when the
  /// entitlement is a double type. Otherwise, the field will not be set.
  @_s.JsonKey(name: 'DoubleValue')
  final double doubleValue;

  /// The IntegerValue field will be populated with an integer value when the
  /// entitlement is an integer type. Otherwise, the field will not be set.
  @_s.JsonKey(name: 'IntegerValue')
  final int integerValue;

  /// The StringValue field will be populated with a string value when the
  /// entitlement is a string type. Otherwise, the field will not be set.
  @_s.JsonKey(name: 'StringValue')
  final String stringValue;

  EntitlementValue({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });
  factory EntitlementValue.fromJson(Map<String, dynamic> json) =>
      _$EntitlementValueFromJson(json);
}

enum GetEntitlementFilterName {
  @_s.JsonValue('CUSTOMER_IDENTIFIER')
  customerIdentifier,
  @_s.JsonValue('DIMENSION')
  dimension,
}

extension on GetEntitlementFilterName {
  String toValue() {
    switch (this) {
      case GetEntitlementFilterName.customerIdentifier:
        return 'CUSTOMER_IDENTIFIER';
      case GetEntitlementFilterName.dimension:
        return 'DIMENSION';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The GetEntitlementsRequest contains results from the GetEntitlements
/// operation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEntitlementsResult {
  /// The set of entitlements found through the GetEntitlements operation. If the
  /// result contains an empty set of entitlements, NextToken might still be
  /// present and should be used.
  @_s.JsonKey(name: 'Entitlements')
  final List<Entitlement> entitlements;

  /// For paginated results, use NextToken in subsequent calls to GetEntitlements.
  /// If the result contains an empty set of entitlements, NextToken might still
  /// be present and should be used.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetEntitlementsResult({
    this.entitlements,
    this.nextToken,
  });
  factory GetEntitlementsResult.fromJson(Map<String, dynamic> json) =>
      _$GetEntitlementsResultFromJson(json);
}

/// An internal error has occurred. Retry your request. If the problem persists,
/// post a message with details on the AWS forums.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InternalServiceErrorException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InternalServiceErrorException({
    this.message,
  });
  factory InternalServiceErrorException.fromJson(Map<String, dynamic> json) =>
      _$InternalServiceErrorExceptionFromJson(json);
}

/// One or more parameters in your request was invalid.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InvalidParameterException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  InvalidParameterException({
    this.message,
  });
  factory InvalidParameterException.fromJson(Map<String, dynamic> json) =>
      _$InvalidParameterExceptionFromJson(json);
}

/// The calls to the GetEntitlements API are throttled.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ThrottlingException implements _s.AwsException {
  @_s.JsonKey(name: 'message')
  final String message;

  ThrottlingException({
    this.message,
  });
  factory ThrottlingException.fromJson(Map<String, dynamic> json) =>
      _$ThrottlingExceptionFromJson(json);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(message: message),
};
