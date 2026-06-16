// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// The AWS Sustainability service provides programmatic access to estimated
/// carbon emissions data for your Amazon Web Services usage. Use the AWS
/// Sustainability service to retrieve, analyze, and track the carbon footprint
/// of your cloud infrastructure over time.
///
/// With the AWS Sustainability service, you can:
///
/// <ul>
/// <li>
/// Retrieve estimated carbon emissions for your Amazon Web Services usage
/// across different time periods
/// </li>
/// <li>
/// Group emissions data by dimensions such as account, region, and service
/// </li>
/// <li>
/// Filter emissions data to focus on specific accounts, regions, or services
/// </li>
/// <li>
/// Access multiple emissions calculation methodologies including Location-based
/// Method (LBM) and Market-based Method (MBM)
/// </li>
/// <li>
/// Aggregate emissions data at various time granularities including monthly,
/// quarterly, and yearly periods
/// </li>
/// </ul>
/// The API supports pagination for efficient data retrieval and provides
/// dimension values to help you understand the available grouping and filtering
/// options for your account.
///
/// All emissions values are calculated using methodologies aligned with the
/// Greenhouse Gas (GHG) Protocol and are provided in metric tons of carbon
/// dioxide-equivalent (MTCO2e).
class Sustainability {
  final _s.RestJsonProtocol _protocol;
  Sustainability({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sustainability',
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

  /// Returns estimated carbon emission values based on customer grouping and
  /// filtering parameters. We recommend using pagination to ensure that the
  /// operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [timePeriod] :
  /// The date range for fetching estimated carbon emissions.
  ///
  /// Parameter [emissionsTypes] :
  /// The emission types to include in the results. If absent, returns
  /// <code>TOTAL_LBM_CARBON_EMISSIONS</code> and
  /// <code>TOTAL_MBM_CARBON_EMISSIONS</code> emissions types.
  ///
  /// Parameter [filterBy] :
  /// The criteria for filtering estimated carbon emissions.
  ///
  /// Parameter [granularity] :
  /// The time granularity for the results. If absent, uses <code>MONTHLY</code>
  /// time granularity.
  ///
  /// Parameter [granularityConfiguration] :
  /// Configuration for fiscal year calculations when using
  /// <code>YEARLY_FISCAL</code> or <code>QUARTERLY_FISCAL</code> granularity.
  ///
  /// Parameter [groupBy] :
  /// The dimensions available for grouping estimated carbon emissions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Default is 40.
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  Future<GetEstimatedCarbonEmissionsResponse> getEstimatedCarbonEmissions({
    required TimePeriod timePeriod,
    List<EmissionsType>? emissionsTypes,
    FilterExpression? filterBy,
    TimeGranularity? granularity,
    GranularityConfiguration? granularityConfiguration,
    List<Dimension>? groupBy,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5000,
    );
    final $payload = <String, dynamic>{
      'TimePeriod': timePeriod,
      if (emissionsTypes != null)
        'EmissionsTypes': emissionsTypes.map((e) => e.value).toList(),
      if (filterBy != null) 'FilterBy': filterBy,
      if (granularity != null) 'Granularity': granularity.value,
      if (granularityConfiguration != null)
        'GranularityConfiguration': granularityConfiguration,
      if (groupBy != null) 'GroupBy': groupBy.map((e) => e.value).toList(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/estimated-carbon-emissions',
      exceptionFnMap: _exceptionFns,
    );
    return GetEstimatedCarbonEmissionsResponse.fromJson(response);
  }

  /// Returns the possible dimension values available for a customer's account.
  /// We recommend using pagination to ensure that the operation returns quickly
  /// and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [dimensions] :
  /// The dimensions available for grouping estimated carbon emissions.
  ///
  /// Parameter [timePeriod] :
  /// The date range for fetching the dimension values.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Default is 40.
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  Future<GetEstimatedCarbonEmissionsDimensionValuesResponse>
      getEstimatedCarbonEmissionsDimensionValues({
    required List<Dimension> dimensions,
    required TimePeriod timePeriod,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      5000,
    );
    final $payload = <String, dynamic>{
      'Dimensions': dimensions.map((e) => e.value).toList(),
      'TimePeriod': timePeriod,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/estimated-carbon-emissions-dimension-values',
      exceptionFnMap: _exceptionFns,
    );
    return GetEstimatedCarbonEmissionsDimensionValuesResponse.fromJson(
        response);
  }
}

class GetEstimatedCarbonEmissionsResponse {
  /// The result of the requested inputs.
  final List<EstimatedCarbonEmissions> results;

  /// The pagination token indicating there are additional pages available. You
  /// can use the token in a following request to fetch the next set of results.
  final String? nextToken;

  GetEstimatedCarbonEmissionsResponse({
    required this.results,
    this.nextToken,
  });

  factory GetEstimatedCarbonEmissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEstimatedCarbonEmissionsResponse(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              EstimatedCarbonEmissions.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final results = this.results;
    final nextToken = this.nextToken;
    return {
      'Results': results,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetEstimatedCarbonEmissionsDimensionValuesResponse {
  /// The pagination token indicating there are additional pages available. You
  /// can use the token in a following request to fetch the next set of results.
  final String? nextToken;

  /// The list of possible dimensions over which the emissions data is aggregated.
  final List<DimensionEntry>? results;

  GetEstimatedCarbonEmissionsDimensionValuesResponse({
    this.nextToken,
    this.results,
  });

  factory GetEstimatedCarbonEmissionsDimensionValuesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEstimatedCarbonEmissionsDimensionValuesResponse(
      nextToken: json['NextToken'] as String?,
      results: (json['Results'] as List?)
          ?.nonNulls
          .map((e) => DimensionEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final results = this.results;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (results != null) 'Results': results,
    };
  }
}

/// Represents a dimension and its corresponding value.
class DimensionEntry {
  /// The dimension type that categorizes this entry.
  final Dimension dimension;

  /// The value for the specified dimension. Valid values vary based on the
  /// dimension type (e.g., <code>us-east-1</code> for the <code>REGION</code>
  /// dimension, <code>AmazonEC2</code> for the <code>SERVICE</code> dimension).
  final String value;

  DimensionEntry({
    required this.dimension,
    required this.value,
  });

  factory DimensionEntry.fromJson(Map<String, dynamic> json) {
    return DimensionEntry(
      dimension: Dimension.fromString((json['Dimension'] as String?) ?? ''),
      value: (json['Value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final dimension = this.dimension;
    final value = this.value;
    return {
      'Dimension': dimension.value,
      'Value': value,
    };
  }
}

/// Specifies the dimensions available for grouping and filtering emissions
/// data.
class Dimension {
  static const usageAccountId = Dimension._('USAGE_ACCOUNT_ID');
  static const region = Dimension._('REGION');
  static const service = Dimension._('SERVICE');

  final String value;

  const Dimension._(this.value);

  static const values = [usageAccountId, region, service];

  static Dimension fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Dimension._(value));

  @override
  bool operator ==(other) => other is Dimension && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a duration of time defined by start and end timestamps.
class TimePeriod {
  /// The end (exclusive) of the time period. ISO-8601 formatted timestamp, for
  /// example: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime end;

  /// The start (inclusive) of the time period. ISO-8601 formatted timestamp, for
  /// example: <code>YYYY-MM-DDThh:mm:ss.sssZ</code>
  final DateTime start;

  TimePeriod({
    required this.end,
    required this.start,
  });

  factory TimePeriod.fromJson(Map<String, dynamic> json) {
    return TimePeriod(
      end: nonNullableTimeStampFromJson(json['End'] ?? 0),
      start: nonNullableTimeStampFromJson(json['Start'] ?? 0),
    );
  }

  Map<String, dynamic> toJson() {
    final end = this.end;
    final start = this.start;
    return {
      'End': iso8601ToJson(end),
      'Start': iso8601ToJson(start),
    };
  }
}

/// Contains estimated carbon emissions data for a specific time period and
/// dimension grouping.
class EstimatedCarbonEmissions {
  /// The dimensions used to group emissions values.
  final Map<Dimension, String> dimensionsValues;

  /// The emissions values for the requested emissions types.
  final Map<EmissionsType, Emissions> emissionsValues;

  /// The semantic version-formatted string that indicates the methodology version
  /// used to calculate the emission values.
  /// <note>
  /// The AWS Sustainability service reflects the most recent model version for
  /// every month. You will not see two entries for the same month with different
  /// <code>ModelVersion</code> values. To track the evolution of the methodology
  /// and compare emission values from previous versions, we recommend creating a
  /// <a
  /// href="https://docs.aws.amazon.com/cur/latest/userguide/what-is-data-exports.html">Data
  /// Export</a>.
  /// </note>
  final String modelVersion;

  /// The reporting period for emission values.
  final TimePeriod timePeriod;

  EstimatedCarbonEmissions({
    required this.dimensionsValues,
    required this.emissionsValues,
    required this.modelVersion,
    required this.timePeriod,
  });

  factory EstimatedCarbonEmissions.fromJson(Map<String, dynamic> json) {
    return EstimatedCarbonEmissions(
      dimensionsValues: ((json['DimensionsValues'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(Dimension.fromString(k), e as String)),
      emissionsValues: ((json['EmissionsValues'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(EmissionsType.fromString(k),
              Emissions.fromJson(e as Map<String, dynamic>))),
      modelVersion: (json['ModelVersion'] as String?) ?? '',
      timePeriod: TimePeriod.fromJson(
          (json['TimePeriod'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionsValues = this.dimensionsValues;
    final emissionsValues = this.emissionsValues;
    final modelVersion = this.modelVersion;
    final timePeriod = this.timePeriod;
    return {
      'DimensionsValues': dimensionsValues.map((k, e) => MapEntry(k.value, e)),
      'EmissionsValues': emissionsValues.map((k, e) => MapEntry(k.value, e)),
      'ModelVersion': modelVersion,
      'TimePeriod': timePeriod,
    };
  }
}

/// Specifies the types of carbon emissions calculations available.
class EmissionsType {
  static const totalLbmCarbonEmissions =
      EmissionsType._('TOTAL_LBM_CARBON_EMISSIONS');
  static const totalMbmCarbonEmissions =
      EmissionsType._('TOTAL_MBM_CARBON_EMISSIONS');
  static const totalScope_1CarbonEmissions =
      EmissionsType._('TOTAL_SCOPE_1_CARBON_EMISSIONS');
  static const totalScope_2LbmCarbonEmissions =
      EmissionsType._('TOTAL_SCOPE_2_LBM_CARBON_EMISSIONS');
  static const totalScope_2MbmCarbonEmissions =
      EmissionsType._('TOTAL_SCOPE_2_MBM_CARBON_EMISSIONS');
  static const totalScope_3LbmCarbonEmissions =
      EmissionsType._('TOTAL_SCOPE_3_LBM_CARBON_EMISSIONS');
  static const totalScope_3MbmCarbonEmissions =
      EmissionsType._('TOTAL_SCOPE_3_MBM_CARBON_EMISSIONS');

  final String value;

  const EmissionsType._(this.value);

  static const values = [
    totalLbmCarbonEmissions,
    totalMbmCarbonEmissions,
    totalScope_1CarbonEmissions,
    totalScope_2LbmCarbonEmissions,
    totalScope_2MbmCarbonEmissions,
    totalScope_3LbmCarbonEmissions,
    totalScope_3MbmCarbonEmissions
  ];

  static EmissionsType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EmissionsType._(value));

  @override
  bool operator ==(other) => other is EmissionsType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a carbon emissions quantity with its value and unit of
/// measurement.
class Emissions {
  /// The unit of measurement for the emissions value.
  final EmissionsUnit unit;

  /// The numeric value of the emissions quantity.
  final double value;

  Emissions({
    required this.unit,
    required this.value,
  });

  factory Emissions.fromJson(Map<String, dynamic> json) {
    return Emissions(
      unit: EmissionsUnit.fromString((json['Unit'] as String?) ?? ''),
      value: (json['Value'] as double?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'Unit': unit.value,
      'Value': value,
    };
  }
}

/// Specifies the unit of measurement for emissions.
class EmissionsUnit {
  static const mTCO2e = EmissionsUnit._('MTCO2e');

  final String value;

  const EmissionsUnit._(this.value);

  static const values = [mTCO2e];

  static EmissionsUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EmissionsUnit._(value));

  @override
  bool operator ==(other) => other is EmissionsUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters emission values by specific dimension values.
class FilterExpression {
  /// Filters emission values by specific dimension values.
  final Map<Dimension, List<String>>? dimensions;

  FilterExpression({
    this.dimensions,
  });

  Map<String, dynamic> toJson() {
    final dimensions = this.dimensions;
    return {
      if (dimensions != null)
        'Dimensions': dimensions.map((k, e) => MapEntry(k.value, e)),
    };
  }
}

/// Specifies the time period over which emissions data is aggregated.
class TimeGranularity {
  static const yearlyCalendar = TimeGranularity._('YEARLY_CALENDAR');
  static const yearlyFiscal = TimeGranularity._('YEARLY_FISCAL');
  static const quarterlyCalendar = TimeGranularity._('QUARTERLY_CALENDAR');
  static const quarterlyFiscal = TimeGranularity._('QUARTERLY_FISCAL');
  static const monthly = TimeGranularity._('MONTHLY');

  final String value;

  const TimeGranularity._(this.value);

  static const values = [
    yearlyCalendar,
    yearlyFiscal,
    quarterlyCalendar,
    quarterlyFiscal,
    monthly
  ];

  static TimeGranularity fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TimeGranularity._(value));

  @override
  bool operator ==(other) => other is TimeGranularity && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains configuration for the fiscal year granularities (e.g.,
/// <code>YEARLY_FISCAL</code>, <code>QUARTERLY_FISCAL</code>.
class GranularityConfiguration {
  /// The month (1-12) when the fiscal year begins. Used for
  /// <code>YEARLY_FISCAL</code> and <code>QUARTERLY_FISCAL</code> granularity.
  /// Defaults to 1 (January).
  final int? fiscalYearStartMonth;

  GranularityConfiguration({
    this.fiscalYearStartMonth,
  });

  Map<String, dynamic> toJson() {
    final fiscalYearStartMonth = this.fiscalYearStartMonth;
    return {
      if (fiscalYearStartMonth != null)
        'FiscalYearStartMonth': fiscalYearStartMonth,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
