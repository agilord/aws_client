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

/// You can use the Amazon Web Services Free Tier API to query programmatically
/// your Free Tier usage data.
///
/// Free Tier tracks your monthly usage data for all free tier offers that are
/// associated with your Amazon Web Services account. You can use the Free Tier
/// API to filter and show only the data that you want.
///
/// Service endpoint
///
/// The Free Tier API provides the following endpoint:
///
/// <ul>
/// <li>
/// https://freetier.us-east-1.api.aws
/// </li>
/// </ul>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/billing-free-tier.html">Using
/// the Amazon Web Services Free Tier</a> in the <i>Billing User Guide</i>.
class FreeTier {
  final _s.JsonProtocol _protocol;
  FreeTier({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'freetier',
            signingName: 'freetier',
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

  /// Returns a list of all Free Tier usage objects that match your filters.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filter] :
  /// An expression that specifies the conditions that you want each
  /// <code>FreeTierUsage</code> object to meet.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in the response.
  /// <code>MaxResults</code> means that there can be up to the specified number
  /// of values, but there might be fewer results based on your filters.
  ///
  /// Parameter [nextToken] :
  /// The pagination token that indicates the next set of results to retrieve.
  Future<GetFreeTierUsageResponse> getFreeTierUsage({
    Expression? filter,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.0',
      'X-Amz-Target': 'AWSFreeTierService.GetFreeTierUsage'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (filter != null) 'filter': filter,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetFreeTierUsageResponse.fromJson(jsonResponse.body);
  }
}

enum Dimension {
  service,
  operation,
  usageType,
  region,
  freeTierType,
  description,
  usagePercentage,
}

extension DimensionValueExtension on Dimension {
  String toValue() {
    switch (this) {
      case Dimension.service:
        return 'SERVICE';
      case Dimension.operation:
        return 'OPERATION';
      case Dimension.usageType:
        return 'USAGE_TYPE';
      case Dimension.region:
        return 'REGION';
      case Dimension.freeTierType:
        return 'FREE_TIER_TYPE';
      case Dimension.description:
        return 'DESCRIPTION';
      case Dimension.usagePercentage:
        return 'USAGE_PERCENTAGE';
    }
  }
}

extension DimensionFromString on String {
  Dimension toDimension() {
    switch (this) {
      case 'SERVICE':
        return Dimension.service;
      case 'OPERATION':
        return Dimension.operation;
      case 'USAGE_TYPE':
        return Dimension.usageType;
      case 'REGION':
        return Dimension.region;
      case 'FREE_TIER_TYPE':
        return Dimension.freeTierType;
      case 'DESCRIPTION':
        return Dimension.description;
      case 'USAGE_PERCENTAGE':
        return Dimension.usagePercentage;
    }
    throw Exception('$this is not known in enum Dimension');
  }
}

/// Contains the specifications for the filters to use for your request.
class DimensionValues {
  /// The name of the dimension that you want to filter on.
  final Dimension key;

  /// The match options that you can use to filter your results. You can specify
  /// only one of these values in the array.
  final List<MatchOption> matchOptions;

  /// The metadata values you can specify to filter upon, so that the results all
  /// match at least one of the specified values.
  final List<String> values;

  DimensionValues({
    required this.key,
    required this.matchOptions,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final matchOptions = this.matchOptions;
    final values = this.values;
    return {
      'Key': key.toValue(),
      'MatchOptions': matchOptions.map((e) => e.toValue()).toList(),
      'Values': values,
    };
  }
}

/// Use <code>Expression</code> to filter in the <code>GetFreeTierUsage</code>
/// API operation.
///
/// You can use the following patterns:
///
/// <ul>
/// <li>
/// Simple dimension values (<code>Dimensions</code> root operator)
/// </li>
/// <li>
/// Complex expressions with logical operators (<code>AND</code>,
/// <code>NOT</code>, and <code>OR</code> root operators).
/// </li>
/// </ul>
/// For <i>simple dimension values</i>, you can set the dimension name, values,
/// and match type for the filters that you plan to use.
///
/// <b>Example for simple dimension values</b>
///
/// You can filter to match exactly for <code>REGION==us-east-1 OR
/// REGION==us-west-1</code>.
///
/// The corresponding <code>Expression</code> appears like the following:
/// <code>{ "Dimensions": { "Key": "REGION", "Values": [ "us-east-1",
/// "us-west-1" ], "MatchOptions": ["EQUALS"] } }</code>
///
/// As shown in the previous example, lists of dimension values are combined
/// with <code>OR</code> when you apply the filter.
///
/// For <i>complex expressions with logical operators</i>, you can have nested
/// expressions to use the logical operators and specify advanced filtering.
///
/// <b>Example for complex expressions with logical operators</b>
///
/// You can filter by <code>((REGION == us-east-1 OR REGION == us-west-1) OR
/// (SERVICE CONTAINS AWSLambda)) AND (USAGE_TYPE !CONTAINS
/// DataTransfer)</code>.
///
/// The corresponding <code>Expression</code> appears like the following:
/// <code>{ "And": [ {"Or": [ {"Dimensions": { "Key": "REGION", "Values": [
/// "us-east-1", "us-west-1" ], "MatchOptions": ["EQUALS"] }}, {"Dimensions": {
/// "Key": "SERVICE", "Values": ["AWSLambda"], "MatchOptions": ["CONTAINS"] } }
/// ]}, {"Not": {"Dimensions": { "Key": "USAGE_TYPE", "Values":
/// ["DataTransfer"], "MatchOptions": ["CONTAINS"] }}} ] }</code>
///
/// In the following <b>Contents</b>, you must specify exactly one of the
/// following root operators.
class Expression {
  /// Return results that match all <code>Expressions</code> that you specified in
  /// the array.
  final List<Expression>? and;

  /// The specific dimension, values, and match type to filter objects with.
  final DimensionValues? dimensions;

  /// Return results that don’t match the <code>Expression</code> that you
  /// specified.
  final Expression? not;

  /// Return results that match any of the <code>Expressions</code> that you
  /// specified. in the array.
  final List<Expression>? or;

  Expression({
    this.and,
    this.dimensions,
    this.not,
    this.or,
  });

  Map<String, dynamic> toJson() {
    final and = this.and;
    final dimensions = this.dimensions;
    final not = this.not;
    final or = this.or;
    return {
      if (and != null) 'And': and,
      if (dimensions != null) 'Dimensions': dimensions,
      if (not != null) 'Not': not,
      if (or != null) 'Or': or,
    };
  }
}

/// Consists of a Amazon Web Services Free Tier offer’s metadata and your data
/// usage for the offer.
class FreeTierUsage {
  /// Describes the actual usage accrued month-to-day (MTD) that you've used so
  /// far.
  final double? actualUsageAmount;

  /// The description of the Free Tier offer.
  final String? description;

  /// Describes the forecasted usage by the month that you're expected to use.
  final double? forecastedUsageAmount;

  /// Describes the type of the Free Tier offer. For example, the offer can be
  /// <code>"12 Months Free"</code>, <code>"Always Free"</code>, and <code>"Free
  /// Trial"</code>.
  final String? freeTierType;

  /// Describes the maximum usage allowed in Free Tier.
  final double? limit;

  /// Describes <code>usageType</code> more granularly with the specific Amazon
  /// Web Service API operation. For example, this can be the
  /// <code>RunInstances</code> API operation for Amazon Elastic Compute Cloud.
  final String? operation;

  /// Describes the Amazon Web Services Region for which this offer is applicable
  final String? region;

  /// The name of the Amazon Web Service providing the Free Tier offer. For
  /// example, this can be Amazon Elastic Compute Cloud.
  final String? service;

  /// Describes the unit of the <code>usageType</code>, such as <code>Hrs</code>.
  final String? unit;

  /// Describes the usage details of the offer. For example, this might be
  /// <code>Global-BoxUsage:freetrial</code>.
  final String? usageType;

  FreeTierUsage({
    this.actualUsageAmount,
    this.description,
    this.forecastedUsageAmount,
    this.freeTierType,
    this.limit,
    this.operation,
    this.region,
    this.service,
    this.unit,
    this.usageType,
  });

  factory FreeTierUsage.fromJson(Map<String, dynamic> json) {
    return FreeTierUsage(
      actualUsageAmount: json['actualUsageAmount'] as double?,
      description: json['description'] as String?,
      forecastedUsageAmount: json['forecastedUsageAmount'] as double?,
      freeTierType: json['freeTierType'] as String?,
      limit: json['limit'] as double?,
      operation: json['operation'] as String?,
      region: json['region'] as String?,
      service: json['service'] as String?,
      unit: json['unit'] as String?,
      usageType: json['usageType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actualUsageAmount = this.actualUsageAmount;
    final description = this.description;
    final forecastedUsageAmount = this.forecastedUsageAmount;
    final freeTierType = this.freeTierType;
    final limit = this.limit;
    final operation = this.operation;
    final region = this.region;
    final service = this.service;
    final unit = this.unit;
    final usageType = this.usageType;
    return {
      if (actualUsageAmount != null) 'actualUsageAmount': actualUsageAmount,
      if (description != null) 'description': description,
      if (forecastedUsageAmount != null)
        'forecastedUsageAmount': forecastedUsageAmount,
      if (freeTierType != null) 'freeTierType': freeTierType,
      if (limit != null) 'limit': limit,
      if (operation != null) 'operation': operation,
      if (region != null) 'region': region,
      if (service != null) 'service': service,
      if (unit != null) 'unit': unit,
      if (usageType != null) 'usageType': usageType,
    };
  }
}

class GetFreeTierUsageResponse {
  /// The list of Free Tier usage objects that meet your filter expression.
  final List<FreeTierUsage> freeTierUsages;

  /// The pagination token that indicates the next set of results to retrieve.
  final String? nextToken;

  GetFreeTierUsageResponse({
    required this.freeTierUsages,
    this.nextToken,
  });

  factory GetFreeTierUsageResponse.fromJson(Map<String, dynamic> json) {
    return GetFreeTierUsageResponse(
      freeTierUsages: (json['freeTierUsages'] as List)
          .whereNotNull()
          .map((e) => FreeTierUsage.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final freeTierUsages = this.freeTierUsages;
    final nextToken = this.nextToken;
    return {
      'freeTierUsages': freeTierUsages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

enum MatchOption {
  equals,
  startsWith,
  endsWith,
  contains,
  greaterThanOrEqual,
}

extension MatchOptionValueExtension on MatchOption {
  String toValue() {
    switch (this) {
      case MatchOption.equals:
        return 'EQUALS';
      case MatchOption.startsWith:
        return 'STARTS_WITH';
      case MatchOption.endsWith:
        return 'ENDS_WITH';
      case MatchOption.contains:
        return 'CONTAINS';
      case MatchOption.greaterThanOrEqual:
        return 'GREATER_THAN_OR_EQUAL';
    }
  }
}

extension MatchOptionFromString on String {
  MatchOption toMatchOption() {
    switch (this) {
      case 'EQUALS':
        return MatchOption.equals;
      case 'STARTS_WITH':
        return MatchOption.startsWith;
      case 'ENDS_WITH':
        return MatchOption.endsWith;
      case 'CONTAINS':
        return MatchOption.contains;
      case 'GREATER_THAN_OR_EQUAL':
        return MatchOption.greaterThanOrEqual;
    }
    throw Exception('$this is not known in enum MatchOption');
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
