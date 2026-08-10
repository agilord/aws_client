// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2018_05_10.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// The AWS Sustainability service provides programmatic access to estimated
/// environmental impact data for your Amazon Web Services usage. Use the AWS
/// Sustainability service to retrieve, analyze, and track the environmental
/// impact of your cloud infrastructure over time.
///
/// With the AWS Sustainability service, you can:
///
/// <ul>
/// <li>
/// Retrieve estimated carbon emissions and water allocation for your Amazon Web
/// Services usage across different time periods
/// </li>
/// <li>
/// Group environmental impact data by dimensions such as account, region, and
/// service
/// </li>
/// <li>
/// Filter environmental impact data to focus on specific accounts, regions, or
/// services
/// </li>
/// <li>
/// Access multiple carbon emissions calculation methodologies including
/// Location-based Method (LBM) and Market-based Method (MBM)
/// </li>
/// <li>
/// Aggregate environmental impact data at various time granularities including
/// monthly, quarterly, and yearly periods
/// </li>
/// </ul>
/// The API supports pagination for efficient data retrieval and provides
/// dimension values to help you understand the available grouping and filtering
/// options for your account.
class Sustainability {
  final _s.RestJsonProtocol _protocol;
  factory Sustainability({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'sustainability',
    );
    return Sustainability._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Sustainability._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

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
  /// The date range for fetching estimated carbon emissions. The range must
  /// include the start date of a month for that month's data to be included in
  /// the response.
  ///
  /// Parameter [emissionsTypes] :
  /// The emission types to include in the results. If absent, returns
  /// <code>TOTAL_LBM_CARBON_EMISSIONS</code> and
  /// <code>TOTAL_MBM_CARBON_EMISSIONS</code> emissions types.
  ///
  /// Parameter [filterBy] :
  /// The criteria for filtering estimated carbon emissions. To determine which
  /// dimensions are available to be filtered by, you can first call
  /// <a>GetEstimatedCarbonEmissionsDimensionValues</a>
  ///
  /// Parameter [granularity] :
  /// The time granularity for the results. If absent, uses <code>MONTHLY</code>
  /// time granularity. The smallest supported granularity for carbon emissions
  /// is <code>MONTHLY</code>.
  ///
  /// If requesting partial time periods, data will be returned based on the
  /// smallest supported granularity. For example, requesting
  /// <code>2025-04-01T00:00:00Z</code> to <code>2026-04-01T00:00:00Z</code>
  /// with <code>YEARLY_CALENDAR</code> granularity will return the last 9
  /// months for 2025 and the first 3 months of 2026.
  ///
  /// Parameter [granularityConfiguration] :
  /// Configuration for fiscal year calculations when using
  /// <code>YEARLY_FISCAL</code> or <code>QUARTERLY_FISCAL</code> granularity.
  ///
  /// Parameter [groupBy] :
  /// The dimensions available for grouping estimated carbon emissions.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Default is 1000.
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
  /// The date range for fetching the dimension values. The range must include
  /// the start date of a month for that month's dimensions to be included in
  /// the response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Default is 1000.
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

  /// Returns estimated water allocation values based on customer grouping and
  /// filtering parameters. We recommend using pagination to ensure that the
  /// operation returns quickly and successfully.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [timePeriod] :
  /// The date range for fetching estimated water allocation. The range must
  /// include the start date of a year for that year's data to be included in
  /// the response.
  ///
  /// Parameter [allocationTypes] :
  /// The allocation types to include in the results. If absent, returns
  /// <code>TOTAL_WATER_WITHDRAWALS</code> allocation types.
  ///
  /// Parameter [filterBy] :
  /// The criteria for filtering estimated water allocation. To determine which
  /// dimensions are available to be filtered by, you can first call
  /// <a>GetEstimatedWaterAllocationDimensionValues</a>
  ///
  /// Parameter [granularity] :
  /// The time granularity for the results. Only <code>YEARLY_CALENDAR</code>
  /// time granularity is currently supported for water allocation. Defaults to
  /// <code>YEARLY_CALENDAR</code> if absent.
  ///
  /// If requesting partial time periods, data will be returned based on the
  /// smallest supported granularity. For example, requesting
  /// <code>2025-04-01T00:00:00Z</code> to <code>2026-04-01T00:00:00Z</code>
  /// with <code>YEARLY_CALENDAR</code> will return all the data for 2026 only.
  ///
  /// Parameter [groupBy] :
  /// The dimensions available for grouping estimated water allocation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Default is 1000.
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  Future<GetEstimatedWaterAllocationResponse> getEstimatedWaterAllocation({
    required TimePeriod timePeriod,
    List<WaterAllocationType>? allocationTypes,
    FilterExpression? filterBy,
    TimeGranularity? granularity,
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
      if (allocationTypes != null)
        'AllocationTypes': allocationTypes.map((e) => e.value).toList(),
      if (filterBy != null) 'FilterBy': filterBy,
      if (granularity != null) 'Granularity': granularity.value,
      if (groupBy != null) 'GroupBy': groupBy.map((e) => e.value).toList(),
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/v1/estimated-water-allocation',
      exceptionFnMap: _exceptionFns,
    );
    return GetEstimatedWaterAllocationResponse.fromJson(response);
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
  /// The dimensions available for grouping estimated water allocation.
  ///
  /// Parameter [timePeriod] :
  /// The date range for fetching the dimension values. The range must include
  /// the start date of a year for that year's data to be included in the
  /// response.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Default is 1000.
  ///
  /// Parameter [nextToken] :
  /// The pagination token specifying which page of results to return in the
  /// response. If no token is provided, the default page is the first page.
  Future<GetEstimatedWaterAllocationDimensionValuesResponse>
      getEstimatedWaterAllocationDimensionValues({
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
      requestUri: '/v1/estimated-water-allocation-dimension-values',
      exceptionFnMap: _exceptionFns,
    );
    return GetEstimatedWaterAllocationDimensionValuesResponse.fromJson(
        response);
  }
}

/// @nodoc
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

/// @nodoc
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

/// @nodoc
class GetEstimatedWaterAllocationResponse {
  /// The result of the requested inputs.
  final List<EstimatedWaterAllocation> results;

  /// The pagination token indicating there are additional pages available. You
  /// can use the token in a following request to fetch the next set of results.
  final String? nextToken;

  GetEstimatedWaterAllocationResponse({
    required this.results,
    this.nextToken,
  });

  factory GetEstimatedWaterAllocationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEstimatedWaterAllocationResponse(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) =>
              EstimatedWaterAllocation.fromJson(e as Map<String, dynamic>))
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

/// @nodoc
class GetEstimatedWaterAllocationDimensionValuesResponse {
  /// The list of possible dimensions over which the allocation data is
  /// aggregated.
  final List<DimensionEntry> results;

  /// The pagination token indicating there are additional pages available. You
  /// can use the token in a following request to fetch the next set of results.
  final String? nextToken;

  GetEstimatedWaterAllocationDimensionValuesResponse({
    required this.results,
    this.nextToken,
  });

  factory GetEstimatedWaterAllocationDimensionValuesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetEstimatedWaterAllocationDimensionValuesResponse(
      results: ((json['Results'] as List?) ?? const [])
          .nonNulls
          .map((e) => DimensionEntry.fromJson(e as Map<String, dynamic>))
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

/// Represents a dimension and its corresponding value.
///
/// @nodoc
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

/// Specifies the dimensions available for grouping and filtering environmental
/// impact data.
///
/// @nodoc
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
///
/// @nodoc
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

/// Contains estimated water allocation data for a specific time period and
/// dimension grouping.
///
/// @nodoc
class EstimatedWaterAllocation {
  /// The allocation values for the requested water allocation types.
  final Map<WaterAllocationType, WaterAllocation> allocationValues;

  /// The dimensions used to group water allocation values.
  final Map<Dimension, String> dimensionsValues;

  /// The semantic version-formatted string that indicates the methodology version
  /// used to calculate the water allocation values.
  /// <note>
  /// The AWS Sustainability service reflects the most recent model version for
  /// every month. You will not see two entries for the same month with different
  /// <code>ModelVersion</code> values.
  /// </note>
  final String modelVersion;

  /// The reporting period for water allocation values.
  final TimePeriod timePeriod;

  EstimatedWaterAllocation({
    required this.allocationValues,
    required this.dimensionsValues,
    required this.modelVersion,
    required this.timePeriod,
  });

  factory EstimatedWaterAllocation.fromJson(Map<String, dynamic> json) {
    return EstimatedWaterAllocation(
      allocationValues: ((json['AllocationValues'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(WaterAllocationType.fromString(k),
              WaterAllocation.fromJson(e as Map<String, dynamic>))),
      dimensionsValues: ((json['DimensionsValues'] as Map<String, dynamic>?) ??
              const <String, dynamic>{})
          .map((k, e) => MapEntry(Dimension.fromString(k), e as String)),
      modelVersion: (json['ModelVersion'] as String?) ?? '',
      timePeriod: TimePeriod.fromJson(
          (json['TimePeriod'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final allocationValues = this.allocationValues;
    final dimensionsValues = this.dimensionsValues;
    final modelVersion = this.modelVersion;
    final timePeriod = this.timePeriod;
    return {
      'AllocationValues': allocationValues.map((k, e) => MapEntry(k.value, e)),
      'DimensionsValues': dimensionsValues.map((k, e) => MapEntry(k.value, e)),
      'ModelVersion': modelVersion,
      'TimePeriod': timePeriod,
    };
  }
}

/// Specifies the types of water allocation calculations available.
///
/// @nodoc
class WaterAllocationType {
  static const totalWaterWithdrawals =
      WaterAllocationType._('TOTAL_WATER_WITHDRAWALS');

  final String value;

  const WaterAllocationType._(this.value);

  static const values = [totalWaterWithdrawals];

  static WaterAllocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaterAllocationType._(value));

  @override
  bool operator ==(other) =>
      other is WaterAllocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a water allocation quantity with its value and unit of
/// measurement.
///
/// @nodoc
class WaterAllocation {
  /// The unit of measurement for the allocation value.
  final WaterAllocationUnit unit;

  /// The numeric value of the allocation quantity.
  final double value;

  WaterAllocation({
    required this.unit,
    required this.value,
  });

  factory WaterAllocation.fromJson(Map<String, dynamic> json) {
    return WaterAllocation(
      unit: WaterAllocationUnit.fromString((json['Unit'] as String?) ?? ''),
      value: _s.parseJsonDouble(json['Value']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'Unit': unit.value,
      'Value': _s.encodeJsonDouble(value),
    };
  }
}

/// Specifies the unit of measurement for allocation.
///
/// @nodoc
class WaterAllocationUnit {
  static const m3 = WaterAllocationUnit._('m3');

  final String value;

  const WaterAllocationUnit._(this.value);

  static const values = [m3];

  static WaterAllocationUnit fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => WaterAllocationUnit._(value));

  @override
  bool operator ==(other) =>
      other is WaterAllocationUnit && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Filters environmental impact values by specific dimension values.
///
/// @nodoc
class FilterExpression {
  /// Filters environmental impact values by specific dimension values.
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

/// Specifies the time period over which environmental impact data is
/// aggregated.
///
/// @nodoc
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

/// Contains estimated carbon emissions data for a specific time period and
/// dimension grouping.
///
/// @nodoc
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
///
/// @nodoc
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
///
/// @nodoc
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
      value: _s.parseJsonDouble(json['Value']) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final unit = this.unit;
    final value = this.value;
    return {
      'Unit': unit.value,
      'Value': _s.encodeJsonDouble(value),
    };
  }
}

/// Specifies the unit of measurement for emissions.
///
/// @nodoc
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

/// Contains configuration for the fiscal year granularities (e.g.,
/// <code>YEARLY_FISCAL</code>, <code>QUARTERLY_FISCAL</code>.
///
/// @nodoc
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

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
