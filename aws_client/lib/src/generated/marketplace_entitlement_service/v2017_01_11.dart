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

/// This reference provides descriptions of the AWS Marketplace Entitlement
/// Service API.
class MarketplaceEntitlement {
  final _s.JsonProtocol _protocol;
  MarketplaceEntitlement({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'entitlement.marketplace',
            signingName: 'aws-marketplace',
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
    required String productCode,
    Map<GetEntitlementFilterName, List<String>>? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      25,
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
class Entitlement {
  /// The customer identifier is a handle to each unique customer in an
  /// application. Customer identifiers are obtained through the ResolveCustomer
  /// operation in AWS Marketplace Metering Service.
  final String? customerIdentifier;

  /// The dimension for which the given entitlement applies. Dimensions represent
  /// categories of capacity in a product and are specified when the product is
  /// listed in AWS Marketplace.
  final String? dimension;

  /// The expiration date represents the minimum date through which this
  /// entitlement is expected to remain valid. For contractual products listed on
  /// AWS Marketplace, the expiration date is the date at which the customer will
  /// renew or cancel their contract. Customers who are opting to renew their
  /// contract will still have entitlements with an expiration date.
  final DateTime? expirationDate;

  /// The product code for which the given entitlement applies. Product codes are
  /// provided by AWS Marketplace when the product listing is created.
  final String? productCode;

  /// The EntitlementValue represents the amount of capacity that the customer is
  /// entitled to for the product.
  final EntitlementValue? value;

  Entitlement({
    this.customerIdentifier,
    this.dimension,
    this.expirationDate,
    this.productCode,
    this.value,
  });

  factory Entitlement.fromJson(Map<String, dynamic> json) {
    return Entitlement(
      customerIdentifier: json['CustomerIdentifier'] as String?,
      dimension: json['Dimension'] as String?,
      expirationDate: timeStampFromJson(json['ExpirationDate']),
      productCode: json['ProductCode'] as String?,
      value: json['Value'] != null
          ? EntitlementValue.fromJson(json['Value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerIdentifier = this.customerIdentifier;
    final dimension = this.dimension;
    final expirationDate = this.expirationDate;
    final productCode = this.productCode;
    final value = this.value;
    return {
      if (customerIdentifier != null) 'CustomerIdentifier': customerIdentifier,
      if (dimension != null) 'Dimension': dimension,
      if (expirationDate != null)
        'ExpirationDate': unixTimestampToJson(expirationDate),
      if (productCode != null) 'ProductCode': productCode,
      if (value != null) 'Value': value,
    };
  }
}

/// The EntitlementValue represents the amount of capacity that the customer is
/// entitled to for the product.
class EntitlementValue {
  /// The BooleanValue field will be populated with a boolean value when the
  /// entitlement is a boolean type. Otherwise, the field will not be set.
  final bool? booleanValue;

  /// The DoubleValue field will be populated with a double value when the
  /// entitlement is a double type. Otherwise, the field will not be set.
  final double? doubleValue;

  /// The IntegerValue field will be populated with an integer value when the
  /// entitlement is an integer type. Otherwise, the field will not be set.
  final int? integerValue;

  /// The StringValue field will be populated with a string value when the
  /// entitlement is a string type. Otherwise, the field will not be set.
  final String? stringValue;

  EntitlementValue({
    this.booleanValue,
    this.doubleValue,
    this.integerValue,
    this.stringValue,
  });

  factory EntitlementValue.fromJson(Map<String, dynamic> json) {
    return EntitlementValue(
      booleanValue: json['BooleanValue'] as bool?,
      doubleValue: json['DoubleValue'] as double?,
      integerValue: json['IntegerValue'] as int?,
      stringValue: json['StringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final doubleValue = this.doubleValue;
    final integerValue = this.integerValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'BooleanValue': booleanValue,
      if (doubleValue != null) 'DoubleValue': doubleValue,
      if (integerValue != null) 'IntegerValue': integerValue,
      if (stringValue != null) 'StringValue': stringValue,
    };
  }
}

enum GetEntitlementFilterName {
  customerIdentifier,
  dimension,
}

extension GetEntitlementFilterNameValueExtension on GetEntitlementFilterName {
  String toValue() {
    switch (this) {
      case GetEntitlementFilterName.customerIdentifier:
        return 'CUSTOMER_IDENTIFIER';
      case GetEntitlementFilterName.dimension:
        return 'DIMENSION';
    }
  }
}

extension GetEntitlementFilterNameFromString on String {
  GetEntitlementFilterName toGetEntitlementFilterName() {
    switch (this) {
      case 'CUSTOMER_IDENTIFIER':
        return GetEntitlementFilterName.customerIdentifier;
      case 'DIMENSION':
        return GetEntitlementFilterName.dimension;
    }
    throw Exception('$this is not known in enum GetEntitlementFilterName');
  }
}

/// The GetEntitlementsRequest contains results from the GetEntitlements
/// operation.
class GetEntitlementsResult {
  /// The set of entitlements found through the GetEntitlements operation. If the
  /// result contains an empty set of entitlements, NextToken might still be
  /// present and should be used.
  final List<Entitlement>? entitlements;

  /// For paginated results, use NextToken in subsequent calls to GetEntitlements.
  /// If the result contains an empty set of entitlements, NextToken might still
  /// be present and should be used.
  final String? nextToken;

  GetEntitlementsResult({
    this.entitlements,
    this.nextToken,
  });

  factory GetEntitlementsResult.fromJson(Map<String, dynamic> json) {
    return GetEntitlementsResult(
      entitlements: (json['Entitlements'] as List?)
          ?.whereNotNull()
          .map((e) => Entitlement.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entitlements = this.entitlements;
    final nextToken = this.nextToken;
    return {
      if (entitlements != null) 'Entitlements': entitlements,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
