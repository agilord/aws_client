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

/// This is the <i>Amazon Lookout for Metrics API Reference</i>. For an
/// introduction to the service with tutorials for getting started, visit <a
/// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev">Amazon Lookout
/// for Metrics Developer Guide</a>.
class LookoutMetrics {
  final _s.RestJsonProtocol _protocol;
  LookoutMetrics({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'lookoutmetrics',
            signingName: 'lookoutmetrics',
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

  /// Activates an anomaly detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector.
  Future<void> activateAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ActivateAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Runs a backtest for anomaly detection for the specified resource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  Future<void> backTestAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/BackTestAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an alert for an anomaly detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [action] :
  /// Action that will be triggered when there is an alert.
  ///
  /// Parameter [alertName] :
  /// The name of the alert.
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the detector to which the alert is attached.
  ///
  /// Parameter [alertDescription] :
  /// A description of the alert.
  ///
  /// Parameter [alertFilters] :
  /// The configuration of the alert filters, containing MetricList and
  /// DimensionFilterList.
  ///
  /// Parameter [alertSensitivityThreshold] :
  /// An integer from 0 to 100 specifying the alert sensitivity threshold.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>
  /// to apply to the alert.
  Future<CreateAlertResponse> createAlert({
    required Action action,
    required String alertName,
    required String anomalyDetectorArn,
    String? alertDescription,
    AlertFilters? alertFilters,
    int? alertSensitivityThreshold,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'alertSensitivityThreshold',
      alertSensitivityThreshold,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'Action': action,
      'AlertName': alertName,
      'AnomalyDetectorArn': anomalyDetectorArn,
      if (alertDescription != null) 'AlertDescription': alertDescription,
      if (alertFilters != null) 'AlertFilters': alertFilters,
      if (alertSensitivityThreshold != null)
        'AlertSensitivityThreshold': alertSensitivityThreshold,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateAlert',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAlertResponse.fromJson(response);
  }

  /// Creates an anomaly detector.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorConfig] :
  /// Contains information about the configuration of the anomaly detector.
  ///
  /// Parameter [anomalyDetectorName] :
  /// The name of the detector.
  ///
  /// Parameter [anomalyDetectorDescription] :
  /// A description of the detector.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the KMS key to use to encrypt your data.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>
  /// to apply to the anomaly detector.
  Future<CreateAnomalyDetectorResponse> createAnomalyDetector({
    required AnomalyDetectorConfig anomalyDetectorConfig,
    required String anomalyDetectorName,
    String? anomalyDetectorDescription,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorConfig': anomalyDetectorConfig,
      'AnomalyDetectorName': anomalyDetectorName,
      if (anomalyDetectorDescription != null)
        'AnomalyDetectorDescription': anomalyDetectorDescription,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAnomalyDetectorResponse.fromJson(response);
  }

  /// Creates a dataset.
  ///
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector that will use the dataset.
  ///
  /// Parameter [metricList] :
  /// A list of metrics that the dataset will contain.
  ///
  /// Parameter [metricSetName] :
  /// The name of the dataset.
  ///
  /// Parameter [metricSource] :
  /// Contains information about how the source data should be interpreted.
  ///
  /// Parameter [dimensionFilterList] :
  /// A list of filters that specify which data is kept for anomaly detection.
  ///
  /// Parameter [dimensionList] :
  /// A list of the fields you want to treat as dimensions.
  ///
  /// Parameter [metricSetDescription] :
  /// A description of the dataset you are creating.
  ///
  /// Parameter [metricSetFrequency] :
  /// The frequency with which the source data will be analyzed for anomalies.
  ///
  /// Parameter [offset] :
  /// After an interval ends, the amount of seconds that the detector waits
  /// before importing data. Offset is only supported for S3, Redshift, Athena
  /// and datasources.
  ///
  /// Parameter [tags] :
  /// A list of <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>
  /// to apply to the dataset.
  ///
  /// Parameter [timestampColumn] :
  /// Contains information about the column used for tracking time in your
  /// source data.
  ///
  /// Parameter [timezone] :
  /// The time zone in which your source data was recorded.
  Future<CreateMetricSetResponse> createMetricSet({
    required String anomalyDetectorArn,
    required List<Metric> metricList,
    required String metricSetName,
    required MetricSource metricSource,
    List<MetricSetDimensionFilter>? dimensionFilterList,
    List<String>? dimensionList,
    String? metricSetDescription,
    Frequency? metricSetFrequency,
    int? offset,
    Map<String, String>? tags,
    TimestampColumn? timestampColumn,
    String? timezone,
  }) async {
    _s.validateNumRange(
      'offset',
      offset,
      0,
      432000,
    );
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'MetricList': metricList,
      'MetricSetName': metricSetName,
      'MetricSource': metricSource,
      if (dimensionFilterList != null)
        'DimensionFilterList': dimensionFilterList,
      if (dimensionList != null) 'DimensionList': dimensionList,
      if (metricSetDescription != null)
        'MetricSetDescription': metricSetDescription,
      if (metricSetFrequency != null)
        'MetricSetFrequency': metricSetFrequency.toValue(),
      if (offset != null) 'Offset': offset,
      if (tags != null) 'Tags': tags,
      if (timestampColumn != null) 'TimestampColumn': timestampColumn,
      if (timezone != null) 'Timezone': timezone,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateMetricSet',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMetricSetResponse.fromJson(response);
  }

  /// Deactivates an anomaly detector.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  Future<void> deactivateAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeactivateAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an alert.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [alertArn] :
  /// The ARN of the alert to delete.
  Future<void> deleteAlert({
    required String alertArn,
  }) async {
    final $payload = <String, dynamic>{
      'AlertArn': alertArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteAlert',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a detector. Deleting an anomaly detector will delete all of its
  /// corresponding resources including any configured datasets and alerts.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [TooManyRequestsException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the detector to delete.
  Future<void> deleteAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes an alert.
  ///
  /// Amazon Lookout for Metrics API actions are eventually consistent. If you
  /// do a read operation on a resource immediately after creating or modifying
  /// it, use retries to allow time for the write operation to complete.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [alertArn] :
  /// The ARN of the alert to describe.
  Future<DescribeAlertResponse> describeAlert({
    required String alertArn,
  }) async {
    final $payload = <String, dynamic>{
      'AlertArn': alertArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeAlert',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAlertResponse.fromJson(response);
  }

  /// Returns information about the status of the specified anomaly detection
  /// jobs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [maxResults] :
  /// The number of items to return in the response.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [timestamp] :
  /// The timestamp of the anomaly detection job.
  Future<DescribeAnomalyDetectionExecutionsResponse>
      describeAnomalyDetectionExecutions({
    required String anomalyDetectorArn,
    int? maxResults,
    String? nextToken,
    String? timestamp,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (timestamp != null) 'Timestamp': timestamp,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeAnomalyDetectionExecutions',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnomalyDetectionExecutionsResponse.fromJson(response);
  }

  /// Describes a detector.
  ///
  /// Amazon Lookout for Metrics API actions are eventually consistent. If you
  /// do a read operation on a resource immediately after creating or modifying
  /// it, use retries to allow time for the write operation to complete.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the detector to describe.
  Future<DescribeAnomalyDetectorResponse> describeAnomalyDetector({
    required String anomalyDetectorArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAnomalyDetectorResponse.fromJson(response);
  }

  /// Describes a dataset.
  ///
  /// Amazon Lookout for Metrics API actions are eventually consistent. If you
  /// do a read operation on a resource immediately after creating or modifying
  /// it, use retries to allow time for the write operation to complete.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [metricSetArn] :
  /// The ARN of the dataset.
  Future<DescribeMetricSetResponse> describeMetricSet({
    required String metricSetArn,
  }) async {
    final $payload = <String, dynamic>{
      'MetricSetArn': metricSetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeMetricSet',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeMetricSetResponse.fromJson(response);
  }

  /// Detects an Amazon S3 dataset's file format, interval, and offset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// An anomaly detector ARN.
  ///
  /// Parameter [autoDetectionMetricSource] :
  /// A data source.
  Future<DetectMetricSetConfigResponse> detectMetricSetConfig({
    required String anomalyDetectorArn,
    required AutoDetectionMetricSource autoDetectionMetricSource,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'AutoDetectionMetricSource': autoDetectionMetricSource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DetectMetricSetConfig',
      exceptionFnMap: _exceptionFns,
    );
    return DetectMetricSetConfigResponse.fromJson(response);
  }

  /// Returns details about a group of anomalous metrics.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [anomalyGroupId] :
  /// The ID of the anomaly group.
  Future<GetAnomalyGroupResponse> getAnomalyGroup({
    required String anomalyDetectorArn,
    required String anomalyGroupId,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'AnomalyGroupId': anomalyGroupId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetAnomalyGroup',
      exceptionFnMap: _exceptionFns,
    );
    return GetAnomalyGroupResponse.fromJson(response);
  }

  /// Returns details about the requested data quality metrics.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector that you want to
  /// investigate.
  ///
  /// Parameter [metricSetArn] :
  /// The Amazon Resource Name (ARN) of a specific data quality metric set.
  Future<GetDataQualityMetricsResponse> getDataQualityMetrics({
    required String anomalyDetectorArn,
    String? metricSetArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      if (metricSetArn != null) 'MetricSetArn': metricSetArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetDataQualityMetrics',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataQualityMetricsResponse.fromJson(response);
  }

  /// Get feedback for an anomaly group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [anomalyGroupTimeSeriesFeedback] :
  /// The anomalous metric and group ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  Future<GetFeedbackResponse> getFeedback({
    required String anomalyDetectorArn,
    required AnomalyGroupTimeSeries anomalyGroupTimeSeriesFeedback,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'AnomalyGroupTimeSeriesFeedback': anomalyGroupTimeSeriesFeedback,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetFeedback',
      exceptionFnMap: _exceptionFns,
    );
    return GetFeedbackResponse.fromJson(response);
  }

  /// Returns a selection of sample records from an Amazon S3 datasource.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [s3SourceConfig] :
  /// A datasource bucket in Amazon S3.
  Future<GetSampleDataResponse> getSampleData({
    SampleDataS3SourceConfig? s3SourceConfig,
  }) async {
    final $payload = <String, dynamic>{
      if (s3SourceConfig != null) 'S3SourceConfig': s3SourceConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetSampleData',
      exceptionFnMap: _exceptionFns,
    );
    return GetSampleDataResponse.fromJson(response);
  }

  /// Lists the alerts attached to a detector.
  ///
  /// Amazon Lookout for Metrics API actions are eventually consistent. If you
  /// do a read operation on a resource immediately after creating or modifying
  /// it, use retries to allow time for the write operation to complete.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  /// May throw [ValidationException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the alert's detector.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results that will be displayed by the request.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request is truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListAlertsResponse> listAlerts({
    String? anomalyDetectorArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAlerts',
      exceptionFnMap: _exceptionFns,
    );
    return ListAlertsResponse.fromJson(response);
  }

  /// Lists the detectors in the current AWS Region.
  ///
  /// Amazon Lookout for Metrics API actions are eventually consistent. If you
  /// do a read operation on a resource immediately after creating or modifying
  /// it, use retries to allow time for the write operation to complete.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListAnomalyDetectorsResponse> listAnomalyDetectors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAnomalyDetectors',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomalyDetectorsResponse.fromJson(response);
  }

  /// Returns a list of measures that are potential causes or effects of an
  /// anomaly group.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [anomalyGroupId] :
  /// The ID of the anomaly group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  ///
  /// Parameter [relationshipTypeFilter] :
  /// Filter for potential causes (<code>CAUSE_OF_INPUT_ANOMALY_GROUP</code>) or
  /// downstream effects (<code>EFFECT_OF_INPUT_ANOMALY_GROUP</code>) of the
  /// anomaly group.
  Future<ListAnomalyGroupRelatedMetricsResponse>
      listAnomalyGroupRelatedMetrics({
    required String anomalyDetectorArn,
    required String anomalyGroupId,
    int? maxResults,
    String? nextToken,
    RelationshipType? relationshipTypeFilter,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'AnomalyGroupId': anomalyGroupId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (relationshipTypeFilter != null)
        'RelationshipTypeFilter': relationshipTypeFilter.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAnomalyGroupRelatedMetrics',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomalyGroupRelatedMetricsResponse.fromJson(response);
  }

  /// Returns a list of anomaly groups.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [sensitivityThreshold] :
  /// The minimum severity score for inclusion in the output.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  Future<ListAnomalyGroupSummariesResponse> listAnomalyGroupSummaries({
    required String anomalyDetectorArn,
    required int sensitivityThreshold,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'sensitivityThreshold',
      sensitivityThreshold,
      0,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'SensitivityThreshold': sensitivityThreshold,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAnomalyGroupSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomalyGroupSummariesResponse.fromJson(response);
  }

  /// Gets a list of anomalous metrics for a measure in an anomaly group.
  ///
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [anomalyGroupId] :
  /// The ID of the anomaly group.
  ///
  /// Parameter [metricName] :
  /// The name of the measure field.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token that's returned by a previous request to
  /// retrieve the next page of results.
  Future<ListAnomalyGroupTimeSeriesResponse> listAnomalyGroupTimeSeries({
    required String anomalyDetectorArn,
    required String anomalyGroupId,
    required String metricName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'AnomalyGroupId': anomalyGroupId,
      'MetricName': metricName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListAnomalyGroupTimeSeries',
      exceptionFnMap: _exceptionFns,
    );
    return ListAnomalyGroupTimeSeriesResponse.fromJson(response);
  }

  /// Lists the datasets in the current AWS Region.
  ///
  /// Amazon Lookout for Metrics API actions are eventually consistent. If you
  /// do a read operation on a resource immediately after creating or modifying
  /// it, use retries to allow time for the write operation to complete.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the anomaly detector containing the metrics sets to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return.
  ///
  /// Parameter [nextToken] :
  /// If the result of the previous request was truncated, the response includes
  /// a <code>NextToken</code>. To retrieve the next set of results, use the
  /// token in the next request. Tokens expire after 24 hours.
  Future<ListMetricSetsResponse> listMetricSets({
    String? anomalyDetectorArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListMetricSets',
      exceptionFnMap: _exceptionFns,
    );
    return ListMetricSetsResponse.fromJson(response);
  }

  /// Gets a list of <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>
  /// for a detector, dataset, or alert.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Add feedback for an anomalous metric.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The Amazon Resource Name (ARN) of the anomaly detector.
  ///
  /// Parameter [anomalyGroupTimeSeriesFeedback] :
  /// Feedback for an anomalous metric.
  Future<void> putFeedback({
    required String anomalyDetectorArn,
    required AnomalyGroupTimeSeriesFeedback anomalyGroupTimeSeriesFeedback,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      'AnomalyGroupTimeSeriesFeedback': anomalyGroupTimeSeriesFeedback,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutFeedback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>
  /// to a detector, dataset, or alert.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tags] :
  /// Tags to apply to the resource. Tag keys and values can contain letters,
  /// numbers, spaces, and the following symbols: <code>_.:/=+@-</code>
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>
  /// from a detector, dataset, or alert.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The resource's Amazon Resource Name (ARN).
  ///
  /// Parameter [tagKeys] :
  /// Keys to remove from the resource's tags.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Make changes to an existing alert.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [alertArn] :
  /// The ARN of the alert to update.
  ///
  /// Parameter [action] :
  /// Action that will be triggered when there is an alert.
  ///
  /// Parameter [alertDescription] :
  /// A description of the alert.
  ///
  /// Parameter [alertFilters] :
  /// The configuration of the alert filters, containing MetricList and
  /// DimensionFilterList.
  ///
  /// Parameter [alertSensitivityThreshold] :
  /// An integer from 0 to 100 specifying the alert sensitivity threshold.
  Future<UpdateAlertResponse> updateAlert({
    required String alertArn,
    Action? action,
    String? alertDescription,
    AlertFilters? alertFilters,
    int? alertSensitivityThreshold,
  }) async {
    _s.validateNumRange(
      'alertSensitivityThreshold',
      alertSensitivityThreshold,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'AlertArn': alertArn,
      if (action != null) 'Action': action,
      if (alertDescription != null) 'AlertDescription': alertDescription,
      if (alertFilters != null) 'AlertFilters': alertFilters,
      if (alertSensitivityThreshold != null)
        'AlertSensitivityThreshold': alertSensitivityThreshold,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateAlert',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAlertResponse.fromJson(response);
  }

  /// Updates a detector. After activation, you can only change a detector's
  /// ingestion delay and description.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  ///
  /// Parameter [anomalyDetectorArn] :
  /// The ARN of the detector to update.
  ///
  /// Parameter [anomalyDetectorConfig] :
  /// Contains information about the configuration to which the detector will be
  /// updated.
  ///
  /// Parameter [anomalyDetectorDescription] :
  /// The updated detector description.
  ///
  /// Parameter [kmsKeyArn] :
  /// The Amazon Resource Name (ARN) of an AWS KMS encryption key.
  Future<UpdateAnomalyDetectorResponse> updateAnomalyDetector({
    required String anomalyDetectorArn,
    AnomalyDetectorConfig? anomalyDetectorConfig,
    String? anomalyDetectorDescription,
    String? kmsKeyArn,
  }) async {
    final $payload = <String, dynamic>{
      'AnomalyDetectorArn': anomalyDetectorArn,
      if (anomalyDetectorConfig != null)
        'AnomalyDetectorConfig': anomalyDetectorConfig,
      if (anomalyDetectorDescription != null)
        'AnomalyDetectorDescription': anomalyDetectorDescription,
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateAnomalyDetector',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAnomalyDetectorResponse.fromJson(response);
  }

  /// Updates a dataset.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  /// May throw [TooManyRequestsException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [metricSetArn] :
  /// The ARN of the dataset to update.
  ///
  /// Parameter [dimensionFilterList] :
  /// Describes a list of filters for choosing specific dimensions and specific
  /// values. Each filter consists of the dimension and one of its values that
  /// you want to include. When multiple dimensions or values are specified, the
  /// dimensions are joined with an AND operation and the values are joined with
  /// an OR operation.
  ///
  /// Parameter [dimensionList] :
  /// The dimension list.
  ///
  /// Parameter [metricList] :
  /// The metric list.
  ///
  /// Parameter [metricSetDescription] :
  /// The dataset's description.
  ///
  /// Parameter [metricSetFrequency] :
  /// The dataset's interval.
  ///
  /// Parameter [offset] :
  /// After an interval ends, the amount of seconds that the detector waits
  /// before importing data. Offset is only supported for S3, Redshift, Athena
  /// and datasources.
  ///
  /// Parameter [timestampColumn] :
  /// The timestamp column.
  Future<UpdateMetricSetResponse> updateMetricSet({
    required String metricSetArn,
    List<MetricSetDimensionFilter>? dimensionFilterList,
    List<String>? dimensionList,
    List<Metric>? metricList,
    String? metricSetDescription,
    Frequency? metricSetFrequency,
    MetricSource? metricSource,
    int? offset,
    TimestampColumn? timestampColumn,
  }) async {
    _s.validateNumRange(
      'offset',
      offset,
      0,
      432000,
    );
    final $payload = <String, dynamic>{
      'MetricSetArn': metricSetArn,
      if (dimensionFilterList != null)
        'DimensionFilterList': dimensionFilterList,
      if (dimensionList != null) 'DimensionList': dimensionList,
      if (metricList != null) 'MetricList': metricList,
      if (metricSetDescription != null)
        'MetricSetDescription': metricSetDescription,
      if (metricSetFrequency != null)
        'MetricSetFrequency': metricSetFrequency.toValue(),
      if (metricSource != null) 'MetricSource': metricSource,
      if (offset != null) 'Offset': offset,
      if (timestampColumn != null) 'TimestampColumn': timestampColumn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateMetricSet',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMetricSetResponse.fromJson(response);
  }
}

/// A configuration that specifies the action to perform when anomalies are
/// detected.
class Action {
  /// A configuration for an AWS Lambda channel.
  final LambdaConfiguration? lambdaConfiguration;

  /// A configuration for an Amazon SNS channel.
  final SNSConfiguration? sNSConfiguration;

  Action({
    this.lambdaConfiguration,
    this.sNSConfiguration,
  });

  factory Action.fromJson(Map<String, dynamic> json) {
    return Action(
      lambdaConfiguration: json['LambdaConfiguration'] != null
          ? LambdaConfiguration.fromJson(
              json['LambdaConfiguration'] as Map<String, dynamic>)
          : null,
      sNSConfiguration: json['SNSConfiguration'] != null
          ? SNSConfiguration.fromJson(
              json['SNSConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaConfiguration = this.lambdaConfiguration;
    final sNSConfiguration = this.sNSConfiguration;
    return {
      if (lambdaConfiguration != null)
        'LambdaConfiguration': lambdaConfiguration,
      if (sNSConfiguration != null) 'SNSConfiguration': sNSConfiguration,
    };
  }
}

class ActivateAnomalyDetectorResponse {
  ActivateAnomalyDetectorResponse();

  factory ActivateAnomalyDetectorResponse.fromJson(Map<String, dynamic> _) {
    return ActivateAnomalyDetectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum AggregationFunction {
  avg,
  sum,
}

extension AggregationFunctionValueExtension on AggregationFunction {
  String toValue() {
    switch (this) {
      case AggregationFunction.avg:
        return 'AVG';
      case AggregationFunction.sum:
        return 'SUM';
    }
  }
}

extension AggregationFunctionFromString on String {
  AggregationFunction toAggregationFunction() {
    switch (this) {
      case 'AVG':
        return AggregationFunction.avg;
      case 'SUM':
        return AggregationFunction.sum;
    }
    throw Exception('$this is not known in enum AggregationFunction');
  }
}

/// A configuration for Amazon SNS-integrated notifications.
class Alert {
  /// Action that will be triggered when there is an alert.
  final Action? action;

  /// The ARN of the alert.
  final String? alertArn;

  /// A description of the alert.
  final String? alertDescription;

  /// The configuration of the alert filters, containing MetricList and
  /// DimensionFilter.
  final AlertFilters? alertFilters;

  /// The name of the alert.
  final String? alertName;

  /// The minimum severity for an anomaly to trigger the alert.
  final int? alertSensitivityThreshold;

  /// The status of the alert.
  final AlertStatus? alertStatus;

  /// The type of the alert.
  final AlertType? alertType;

  /// The ARN of the detector to which the alert is attached.
  final String? anomalyDetectorArn;

  /// The time at which the alert was created.
  final DateTime? creationTime;

  /// The time at which the alert was last modified.
  final DateTime? lastModificationTime;

  Alert({
    this.action,
    this.alertArn,
    this.alertDescription,
    this.alertFilters,
    this.alertName,
    this.alertSensitivityThreshold,
    this.alertStatus,
    this.alertType,
    this.anomalyDetectorArn,
    this.creationTime,
    this.lastModificationTime,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      action: json['Action'] != null
          ? Action.fromJson(json['Action'] as Map<String, dynamic>)
          : null,
      alertArn: json['AlertArn'] as String?,
      alertDescription: json['AlertDescription'] as String?,
      alertFilters: json['AlertFilters'] != null
          ? AlertFilters.fromJson(json['AlertFilters'] as Map<String, dynamic>)
          : null,
      alertName: json['AlertName'] as String?,
      alertSensitivityThreshold: json['AlertSensitivityThreshold'] as int?,
      alertStatus: (json['AlertStatus'] as String?)?.toAlertStatus(),
      alertType: (json['AlertType'] as String?)?.toAlertType(),
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final action = this.action;
    final alertArn = this.alertArn;
    final alertDescription = this.alertDescription;
    final alertFilters = this.alertFilters;
    final alertName = this.alertName;
    final alertSensitivityThreshold = this.alertSensitivityThreshold;
    final alertStatus = this.alertStatus;
    final alertType = this.alertType;
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    return {
      if (action != null) 'Action': action,
      if (alertArn != null) 'AlertArn': alertArn,
      if (alertDescription != null) 'AlertDescription': alertDescription,
      if (alertFilters != null) 'AlertFilters': alertFilters,
      if (alertName != null) 'AlertName': alertName,
      if (alertSensitivityThreshold != null)
        'AlertSensitivityThreshold': alertSensitivityThreshold,
      if (alertStatus != null) 'AlertStatus': alertStatus.toValue(),
      if (alertType != null) 'AlertType': alertType.toValue(),
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
    };
  }
}

/// The configuration of the alert filters.
class AlertFilters {
  /// The list of DimensionFilter objects that are used for dimension-based
  /// filtering.
  final List<DimensionFilter>? dimensionFilterList;

  /// The list of measures that you want to get alerts for.
  final List<String>? metricList;

  AlertFilters({
    this.dimensionFilterList,
    this.metricList,
  });

  factory AlertFilters.fromJson(Map<String, dynamic> json) {
    return AlertFilters(
      dimensionFilterList: (json['DimensionFilterList'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricList: (json['MetricList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionFilterList = this.dimensionFilterList;
    final metricList = this.metricList;
    return {
      if (dimensionFilterList != null)
        'DimensionFilterList': dimensionFilterList,
      if (metricList != null) 'MetricList': metricList,
    };
  }
}

enum AlertStatus {
  active,
  inactive,
}

extension AlertStatusValueExtension on AlertStatus {
  String toValue() {
    switch (this) {
      case AlertStatus.active:
        return 'ACTIVE';
      case AlertStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension AlertStatusFromString on String {
  AlertStatus toAlertStatus() {
    switch (this) {
      case 'ACTIVE':
        return AlertStatus.active;
      case 'INACTIVE':
        return AlertStatus.inactive;
    }
    throw Exception('$this is not known in enum AlertStatus');
  }
}

/// Provides a summary of an alert's configuration.
class AlertSummary {
  /// The ARN of the alert.
  final String? alertArn;

  /// The name of the alert.
  final String? alertName;

  /// The minimum severity for an anomaly to trigger the alert.
  final int? alertSensitivityThreshold;

  /// The status of the alert.
  final AlertStatus? alertStatus;

  /// The type of the alert.
  final AlertType? alertType;

  /// The ARN of the detector to which the alert is attached.
  final String? anomalyDetectorArn;

  /// The time at which the alert was created.
  final DateTime? creationTime;

  /// The time at which the alert was last modified.
  final DateTime? lastModificationTime;

  /// The alert's <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>.
  final Map<String, String>? tags;

  AlertSummary({
    this.alertArn,
    this.alertName,
    this.alertSensitivityThreshold,
    this.alertStatus,
    this.alertType,
    this.anomalyDetectorArn,
    this.creationTime,
    this.lastModificationTime,
    this.tags,
  });

  factory AlertSummary.fromJson(Map<String, dynamic> json) {
    return AlertSummary(
      alertArn: json['AlertArn'] as String?,
      alertName: json['AlertName'] as String?,
      alertSensitivityThreshold: json['AlertSensitivityThreshold'] as int?,
      alertStatus: (json['AlertStatus'] as String?)?.toAlertStatus(),
      alertType: (json['AlertType'] as String?)?.toAlertType(),
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final alertArn = this.alertArn;
    final alertName = this.alertName;
    final alertSensitivityThreshold = this.alertSensitivityThreshold;
    final alertStatus = this.alertStatus;
    final alertType = this.alertType;
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final tags = this.tags;
    return {
      if (alertArn != null) 'AlertArn': alertArn,
      if (alertName != null) 'AlertName': alertName,
      if (alertSensitivityThreshold != null)
        'AlertSensitivityThreshold': alertSensitivityThreshold,
      if (alertStatus != null) 'AlertStatus': alertStatus.toValue(),
      if (alertType != null) 'AlertType': alertType.toValue(),
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum AlertType {
  sns,
  lambda,
}

extension AlertTypeValueExtension on AlertType {
  String toValue() {
    switch (this) {
      case AlertType.sns:
        return 'SNS';
      case AlertType.lambda:
        return 'LAMBDA';
    }
  }
}

extension AlertTypeFromString on String {
  AlertType toAlertType() {
    switch (this) {
      case 'SNS':
        return AlertType.sns;
      case 'LAMBDA':
        return AlertType.lambda;
    }
    throw Exception('$this is not known in enum AlertType');
  }
}

enum AnomalyDetectionTaskStatus {
  pending,
  inProgress,
  completed,
  failed,
  failedToSchedule,
}

extension AnomalyDetectionTaskStatusValueExtension
    on AnomalyDetectionTaskStatus {
  String toValue() {
    switch (this) {
      case AnomalyDetectionTaskStatus.pending:
        return 'PENDING';
      case AnomalyDetectionTaskStatus.inProgress:
        return 'IN_PROGRESS';
      case AnomalyDetectionTaskStatus.completed:
        return 'COMPLETED';
      case AnomalyDetectionTaskStatus.failed:
        return 'FAILED';
      case AnomalyDetectionTaskStatus.failedToSchedule:
        return 'FAILED_TO_SCHEDULE';
    }
  }
}

extension AnomalyDetectionTaskStatusFromString on String {
  AnomalyDetectionTaskStatus toAnomalyDetectionTaskStatus() {
    switch (this) {
      case 'PENDING':
        return AnomalyDetectionTaskStatus.pending;
      case 'IN_PROGRESS':
        return AnomalyDetectionTaskStatus.inProgress;
      case 'COMPLETED':
        return AnomalyDetectionTaskStatus.completed;
      case 'FAILED':
        return AnomalyDetectionTaskStatus.failed;
      case 'FAILED_TO_SCHEDULE':
        return AnomalyDetectionTaskStatus.failedToSchedule;
    }
    throw Exception('$this is not known in enum AnomalyDetectionTaskStatus');
  }
}

/// Contains information about a detector's configuration.
class AnomalyDetectorConfig {
  /// The frequency at which the detector analyzes its source data.
  final Frequency? anomalyDetectorFrequency;

  AnomalyDetectorConfig({
    this.anomalyDetectorFrequency,
  });

  Map<String, dynamic> toJson() {
    final anomalyDetectorFrequency = this.anomalyDetectorFrequency;
    return {
      if (anomalyDetectorFrequency != null)
        'AnomalyDetectorFrequency': anomalyDetectorFrequency.toValue(),
    };
  }
}

/// Contains information about a detector's configuration.
class AnomalyDetectorConfigSummary {
  /// The interval at which the detector analyzes its source data.
  final Frequency? anomalyDetectorFrequency;

  AnomalyDetectorConfigSummary({
    this.anomalyDetectorFrequency,
  });

  factory AnomalyDetectorConfigSummary.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorConfigSummary(
      anomalyDetectorFrequency:
          (json['AnomalyDetectorFrequency'] as String?)?.toFrequency(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorFrequency = this.anomalyDetectorFrequency;
    return {
      if (anomalyDetectorFrequency != null)
        'AnomalyDetectorFrequency': anomalyDetectorFrequency.toValue(),
    };
  }
}

/// Aggregated details about the data quality metrics collected for the
/// <code>AnomalyDetectorArn</code> provided in the <a>GetDataQualityMetrics</a>
/// object.
class AnomalyDetectorDataQualityMetric {
  /// An array of <code>DataQualityMetricList</code> objects. Each object in the
  /// array contains information about a data quality metric.
  final List<MetricSetDataQualityMetric>? metricSetDataQualityMetricList;

  /// The start time for the data quality metrics collection.
  final DateTime? startTimestamp;

  AnomalyDetectorDataQualityMetric({
    this.metricSetDataQualityMetricList,
    this.startTimestamp,
  });

  factory AnomalyDetectorDataQualityMetric.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorDataQualityMetric(
      metricSetDataQualityMetricList: (json['MetricSetDataQualityMetricList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              MetricSetDataQualityMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTimestamp: timeStampFromJson(json['StartTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final metricSetDataQualityMetricList = this.metricSetDataQualityMetricList;
    final startTimestamp = this.startTimestamp;
    return {
      if (metricSetDataQualityMetricList != null)
        'MetricSetDataQualityMetricList': metricSetDataQualityMetricList,
      if (startTimestamp != null)
        'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

enum AnomalyDetectorFailureType {
  activationFailure,
  backTestActivationFailure,
  deletionFailure,
  deactivationFailure,
}

extension AnomalyDetectorFailureTypeValueExtension
    on AnomalyDetectorFailureType {
  String toValue() {
    switch (this) {
      case AnomalyDetectorFailureType.activationFailure:
        return 'ACTIVATION_FAILURE';
      case AnomalyDetectorFailureType.backTestActivationFailure:
        return 'BACK_TEST_ACTIVATION_FAILURE';
      case AnomalyDetectorFailureType.deletionFailure:
        return 'DELETION_FAILURE';
      case AnomalyDetectorFailureType.deactivationFailure:
        return 'DEACTIVATION_FAILURE';
    }
  }
}

extension AnomalyDetectorFailureTypeFromString on String {
  AnomalyDetectorFailureType toAnomalyDetectorFailureType() {
    switch (this) {
      case 'ACTIVATION_FAILURE':
        return AnomalyDetectorFailureType.activationFailure;
      case 'BACK_TEST_ACTIVATION_FAILURE':
        return AnomalyDetectorFailureType.backTestActivationFailure;
      case 'DELETION_FAILURE':
        return AnomalyDetectorFailureType.deletionFailure;
      case 'DEACTIVATION_FAILURE':
        return AnomalyDetectorFailureType.deactivationFailure;
    }
    throw Exception('$this is not known in enum AnomalyDetectorFailureType');
  }
}

enum AnomalyDetectorStatus {
  active,
  activating,
  deleting,
  failed,
  inactive,
  learning,
  backTestActivating,
  backTestActive,
  backTestComplete,
  deactivated,
  deactivating,
}

extension AnomalyDetectorStatusValueExtension on AnomalyDetectorStatus {
  String toValue() {
    switch (this) {
      case AnomalyDetectorStatus.active:
        return 'ACTIVE';
      case AnomalyDetectorStatus.activating:
        return 'ACTIVATING';
      case AnomalyDetectorStatus.deleting:
        return 'DELETING';
      case AnomalyDetectorStatus.failed:
        return 'FAILED';
      case AnomalyDetectorStatus.inactive:
        return 'INACTIVE';
      case AnomalyDetectorStatus.learning:
        return 'LEARNING';
      case AnomalyDetectorStatus.backTestActivating:
        return 'BACK_TEST_ACTIVATING';
      case AnomalyDetectorStatus.backTestActive:
        return 'BACK_TEST_ACTIVE';
      case AnomalyDetectorStatus.backTestComplete:
        return 'BACK_TEST_COMPLETE';
      case AnomalyDetectorStatus.deactivated:
        return 'DEACTIVATED';
      case AnomalyDetectorStatus.deactivating:
        return 'DEACTIVATING';
    }
  }
}

extension AnomalyDetectorStatusFromString on String {
  AnomalyDetectorStatus toAnomalyDetectorStatus() {
    switch (this) {
      case 'ACTIVE':
        return AnomalyDetectorStatus.active;
      case 'ACTIVATING':
        return AnomalyDetectorStatus.activating;
      case 'DELETING':
        return AnomalyDetectorStatus.deleting;
      case 'FAILED':
        return AnomalyDetectorStatus.failed;
      case 'INACTIVE':
        return AnomalyDetectorStatus.inactive;
      case 'LEARNING':
        return AnomalyDetectorStatus.learning;
      case 'BACK_TEST_ACTIVATING':
        return AnomalyDetectorStatus.backTestActivating;
      case 'BACK_TEST_ACTIVE':
        return AnomalyDetectorStatus.backTestActive;
      case 'BACK_TEST_COMPLETE':
        return AnomalyDetectorStatus.backTestComplete;
      case 'DEACTIVATED':
        return AnomalyDetectorStatus.deactivated;
      case 'DEACTIVATING':
        return AnomalyDetectorStatus.deactivating;
    }
    throw Exception('$this is not known in enum AnomalyDetectorStatus');
  }
}

/// Contains information about an an anomaly detector.
class AnomalyDetectorSummary {
  /// The ARN of the detector.
  final String? anomalyDetectorArn;

  /// A description of the detector.
  final String? anomalyDetectorDescription;

  /// The name of the detector.
  final String? anomalyDetectorName;

  /// The time at which the detector was created.
  final DateTime? creationTime;

  /// The time at which the detector was last modified.
  final DateTime? lastModificationTime;

  /// The status of detector.
  final AnomalyDetectorStatus? status;

  /// The detector's <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>.
  final Map<String, String>? tags;

  AnomalyDetectorSummary({
    this.anomalyDetectorArn,
    this.anomalyDetectorDescription,
    this.anomalyDetectorName,
    this.creationTime,
    this.lastModificationTime,
    this.status,
    this.tags,
  });

  factory AnomalyDetectorSummary.fromJson(Map<String, dynamic> json) {
    return AnomalyDetectorSummary(
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
      anomalyDetectorDescription: json['AnomalyDetectorDescription'] as String?,
      anomalyDetectorName: json['AnomalyDetectorName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      status: (json['Status'] as String?)?.toAnomalyDetectorStatus(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final anomalyDetectorDescription = this.anomalyDetectorDescription;
    final anomalyDetectorName = this.anomalyDetectorName;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final status = this.status;
    final tags = this.tags;
    return {
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (anomalyDetectorDescription != null)
        'AnomalyDetectorDescription': anomalyDetectorDescription,
      if (anomalyDetectorName != null)
        'AnomalyDetectorName': anomalyDetectorName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (status != null) 'Status': status.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A group of anomalous metrics
class AnomalyGroup {
  /// The ID of the anomaly group.
  final String? anomalyGroupId;

  /// The severity score of the group.
  final double? anomalyGroupScore;

  /// The end time for the group.
  final String? endTime;

  /// A list of measures affected by the anomaly.
  final List<MetricLevelImpact>? metricLevelImpactList;

  /// The name of the primary affected measure for the group.
  final String? primaryMetricName;

  /// The start time for the group.
  final String? startTime;

  AnomalyGroup({
    this.anomalyGroupId,
    this.anomalyGroupScore,
    this.endTime,
    this.metricLevelImpactList,
    this.primaryMetricName,
    this.startTime,
  });

  factory AnomalyGroup.fromJson(Map<String, dynamic> json) {
    return AnomalyGroup(
      anomalyGroupId: json['AnomalyGroupId'] as String?,
      anomalyGroupScore: json['AnomalyGroupScore'] as double?,
      endTime: json['EndTime'] as String?,
      metricLevelImpactList: (json['MetricLevelImpactList'] as List?)
          ?.whereNotNull()
          .map((e) => MetricLevelImpact.fromJson(e as Map<String, dynamic>))
          .toList(),
      primaryMetricName: json['PrimaryMetricName'] as String?,
      startTime: json['StartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroupId = this.anomalyGroupId;
    final anomalyGroupScore = this.anomalyGroupScore;
    final endTime = this.endTime;
    final metricLevelImpactList = this.metricLevelImpactList;
    final primaryMetricName = this.primaryMetricName;
    final startTime = this.startTime;
    return {
      if (anomalyGroupId != null) 'AnomalyGroupId': anomalyGroupId,
      if (anomalyGroupScore != null) 'AnomalyGroupScore': anomalyGroupScore,
      if (endTime != null) 'EndTime': endTime,
      if (metricLevelImpactList != null)
        'MetricLevelImpactList': metricLevelImpactList,
      if (primaryMetricName != null) 'PrimaryMetricName': primaryMetricName,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// Aggregated statistics for a group of anomalous metrics.
class AnomalyGroupStatistics {
  /// The start of the time range that was searched.
  final String? evaluationStartDate;

  /// Statistics for individual metrics within the group.
  final List<ItemizedMetricStats>? itemizedMetricStatsList;

  /// The number of groups found.
  final int? totalCount;

  AnomalyGroupStatistics({
    this.evaluationStartDate,
    this.itemizedMetricStatsList,
    this.totalCount,
  });

  factory AnomalyGroupStatistics.fromJson(Map<String, dynamic> json) {
    return AnomalyGroupStatistics(
      evaluationStartDate: json['EvaluationStartDate'] as String?,
      itemizedMetricStatsList: (json['ItemizedMetricStatsList'] as List?)
          ?.whereNotNull()
          .map((e) => ItemizedMetricStats.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final evaluationStartDate = this.evaluationStartDate;
    final itemizedMetricStatsList = this.itemizedMetricStatsList;
    final totalCount = this.totalCount;
    return {
      if (evaluationStartDate != null)
        'EvaluationStartDate': evaluationStartDate,
      if (itemizedMetricStatsList != null)
        'ItemizedMetricStatsList': itemizedMetricStatsList,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

/// Details about a group of anomalous metrics.
class AnomalyGroupSummary {
  /// The ID of the anomaly group.
  final String? anomalyGroupId;

  /// The severity score of the group.
  final double? anomalyGroupScore;

  /// The end time for the group.
  final String? endTime;

  /// The name of the primary affected measure for the group.
  final String? primaryMetricName;

  /// The start time for the group.
  final String? startTime;

  AnomalyGroupSummary({
    this.anomalyGroupId,
    this.anomalyGroupScore,
    this.endTime,
    this.primaryMetricName,
    this.startTime,
  });

  factory AnomalyGroupSummary.fromJson(Map<String, dynamic> json) {
    return AnomalyGroupSummary(
      anomalyGroupId: json['AnomalyGroupId'] as String?,
      anomalyGroupScore: json['AnomalyGroupScore'] as double?,
      endTime: json['EndTime'] as String?,
      primaryMetricName: json['PrimaryMetricName'] as String?,
      startTime: json['StartTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroupId = this.anomalyGroupId;
    final anomalyGroupScore = this.anomalyGroupScore;
    final endTime = this.endTime;
    final primaryMetricName = this.primaryMetricName;
    final startTime = this.startTime;
    return {
      if (anomalyGroupId != null) 'AnomalyGroupId': anomalyGroupId,
      if (anomalyGroupScore != null) 'AnomalyGroupScore': anomalyGroupScore,
      if (endTime != null) 'EndTime': endTime,
      if (primaryMetricName != null) 'PrimaryMetricName': primaryMetricName,
      if (startTime != null) 'StartTime': startTime,
    };
  }
}

/// An anomalous metric in an anomaly group.
class AnomalyGroupTimeSeries {
  /// The ID of the anomaly group.
  final String anomalyGroupId;

  /// The ID of the metric.
  final String? timeSeriesId;

  AnomalyGroupTimeSeries({
    required this.anomalyGroupId,
    this.timeSeriesId,
  });

  Map<String, dynamic> toJson() {
    final anomalyGroupId = this.anomalyGroupId;
    final timeSeriesId = this.timeSeriesId;
    return {
      'AnomalyGroupId': anomalyGroupId,
      if (timeSeriesId != null) 'TimeSeriesId': timeSeriesId,
    };
  }
}

/// Feedback for an anomalous metric.
class AnomalyGroupTimeSeriesFeedback {
  /// The ID of the anomaly group.
  final String anomalyGroupId;

  /// Feedback on whether the metric is a legitimate anomaly.
  final bool isAnomaly;

  /// The ID of the metric.
  final String timeSeriesId;

  AnomalyGroupTimeSeriesFeedback({
    required this.anomalyGroupId,
    required this.isAnomaly,
    required this.timeSeriesId,
  });

  Map<String, dynamic> toJson() {
    final anomalyGroupId = this.anomalyGroupId;
    final isAnomaly = this.isAnomaly;
    final timeSeriesId = this.timeSeriesId;
    return {
      'AnomalyGroupId': anomalyGroupId,
      'IsAnomaly': isAnomaly,
      'TimeSeriesId': timeSeriesId,
    };
  }
}

/// Details about an Amazon AppFlow flow datasource.
class AppFlowConfig {
  /// name of the flow.
  final String? flowName;

  /// An IAM role that gives Amazon Lookout for Metrics permission to access the
  /// flow.
  final String? roleArn;

  AppFlowConfig({
    this.flowName,
    this.roleArn,
  });

  factory AppFlowConfig.fromJson(Map<String, dynamic> json) {
    return AppFlowConfig(
      flowName: json['FlowName'] as String?,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final flowName = this.flowName;
    final roleArn = this.roleArn;
    return {
      if (flowName != null) 'FlowName': flowName,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

/// Details about an Amazon Athena datasource.
class AthenaSourceConfig {
  /// Settings for backtest mode.
  final BackTestConfiguration? backTestConfiguration;

  /// The database's data catalog.
  final String? dataCatalog;

  /// The database's name.
  final String? databaseName;

  /// An IAM role that gives Amazon Lookout for Metrics permission to access the
  /// data.
  final String? roleArn;

  /// The database's results path.
  final String? s3ResultsPath;

  /// The database's table name.
  final String? tableName;

  /// The database's work group name.
  final String? workGroupName;

  AthenaSourceConfig({
    this.backTestConfiguration,
    this.dataCatalog,
    this.databaseName,
    this.roleArn,
    this.s3ResultsPath,
    this.tableName,
    this.workGroupName,
  });

  factory AthenaSourceConfig.fromJson(Map<String, dynamic> json) {
    return AthenaSourceConfig(
      backTestConfiguration: json['BackTestConfiguration'] != null
          ? BackTestConfiguration.fromJson(
              json['BackTestConfiguration'] as Map<String, dynamic>)
          : null,
      dataCatalog: json['DataCatalog'] as String?,
      databaseName: json['DatabaseName'] as String?,
      roleArn: json['RoleArn'] as String?,
      s3ResultsPath: json['S3ResultsPath'] as String?,
      tableName: json['TableName'] as String?,
      workGroupName: json['WorkGroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backTestConfiguration = this.backTestConfiguration;
    final dataCatalog = this.dataCatalog;
    final databaseName = this.databaseName;
    final roleArn = this.roleArn;
    final s3ResultsPath = this.s3ResultsPath;
    final tableName = this.tableName;
    final workGroupName = this.workGroupName;
    return {
      if (backTestConfiguration != null)
        'BackTestConfiguration': backTestConfiguration,
      if (dataCatalog != null) 'DataCatalog': dataCatalog,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (roleArn != null) 'RoleArn': roleArn,
      if (s3ResultsPath != null) 'S3ResultsPath': s3ResultsPath,
      if (tableName != null) 'TableName': tableName,
      if (workGroupName != null) 'WorkGroupName': workGroupName,
    };
  }
}

/// An attribute value.
class AttributeValue {
  /// A binary value.
  final String? b;

  /// A list of binary values.
  final List<String>? bs;

  /// A number.
  final String? n;

  /// A list of numbers.
  final List<String>? ns;

  /// A string.
  final String? s;

  /// A list of strings.
  final List<String>? ss;

  AttributeValue({
    this.b,
    this.bs,
    this.n,
    this.ns,
    this.s,
    this.ss,
  });

  factory AttributeValue.fromJson(Map<String, dynamic> json) {
    return AttributeValue(
      b: json['B'] as String?,
      bs: (json['BS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      n: json['N'] as String?,
      ns: (json['NS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      s: json['S'] as String?,
      ss: (json['SS'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final b = this.b;
    final bs = this.bs;
    final n = this.n;
    final ns = this.ns;
    final s = this.s;
    final ss = this.ss;
    return {
      if (b != null) 'B': b,
      if (bs != null) 'BS': bs,
      if (n != null) 'N': n,
      if (ns != null) 'NS': ns,
      if (s != null) 'S': s,
      if (ss != null) 'SS': ss,
    };
  }
}

/// An auto detection metric source.
class AutoDetectionMetricSource {
  /// The source's source config.
  final AutoDetectionS3SourceConfig? s3SourceConfig;

  AutoDetectionMetricSource({
    this.s3SourceConfig,
  });

  Map<String, dynamic> toJson() {
    final s3SourceConfig = this.s3SourceConfig;
    return {
      if (s3SourceConfig != null) 'S3SourceConfig': s3SourceConfig,
    };
  }
}

/// An auto detection source config.
class AutoDetectionS3SourceConfig {
  /// The config's historical data path list.
  final List<String>? historicalDataPathList;

  /// The config's templated path list.
  final List<String>? templatedPathList;

  AutoDetectionS3SourceConfig({
    this.historicalDataPathList,
    this.templatedPathList,
  });

  Map<String, dynamic> toJson() {
    final historicalDataPathList = this.historicalDataPathList;
    final templatedPathList = this.templatedPathList;
    return {
      if (historicalDataPathList != null)
        'HistoricalDataPathList': historicalDataPathList,
      if (templatedPathList != null) 'TemplatedPathList': templatedPathList,
    };
  }
}

class BackTestAnomalyDetectorResponse {
  BackTestAnomalyDetectorResponse();

  factory BackTestAnomalyDetectorResponse.fromJson(Map<String, dynamic> _) {
    return BackTestAnomalyDetectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Settings for backtest mode.
class BackTestConfiguration {
  /// Run a backtest instead of monitoring new data.
  final bool runBackTestMode;

  BackTestConfiguration({
    required this.runBackTestMode,
  });

  factory BackTestConfiguration.fromJson(Map<String, dynamic> json) {
    return BackTestConfiguration(
      runBackTestMode: json['RunBackTestMode'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final runBackTestMode = this.runBackTestMode;
    return {
      'RunBackTestMode': runBackTestMode,
    };
  }
}

enum CSVFileCompression {
  none,
  gzip,
}

extension CSVFileCompressionValueExtension on CSVFileCompression {
  String toValue() {
    switch (this) {
      case CSVFileCompression.none:
        return 'NONE';
      case CSVFileCompression.gzip:
        return 'GZIP';
    }
  }
}

extension CSVFileCompressionFromString on String {
  CSVFileCompression toCSVFileCompression() {
    switch (this) {
      case 'NONE':
        return CSVFileCompression.none;
      case 'GZIP':
        return CSVFileCompression.gzip;
    }
    throw Exception('$this is not known in enum CSVFileCompression');
  }
}

/// Details about an Amazon CloudWatch datasource.
class CloudWatchConfig {
  /// Settings for backtest mode.
  final BackTestConfiguration? backTestConfiguration;

  /// An IAM role that gives Amazon Lookout for Metrics permission to access data
  /// in Amazon CloudWatch.
  final String? roleArn;

  CloudWatchConfig({
    this.backTestConfiguration,
    this.roleArn,
  });

  factory CloudWatchConfig.fromJson(Map<String, dynamic> json) {
    return CloudWatchConfig(
      backTestConfiguration: json['BackTestConfiguration'] != null
          ? BackTestConfiguration.fromJson(
              json['BackTestConfiguration'] as Map<String, dynamic>)
          : null,
      roleArn: json['RoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final backTestConfiguration = this.backTestConfiguration;
    final roleArn = this.roleArn;
    return {
      if (backTestConfiguration != null)
        'BackTestConfiguration': backTestConfiguration,
      if (roleArn != null) 'RoleArn': roleArn,
    };
  }
}

enum Confidence {
  high,
  low,
  none,
}

extension ConfidenceValueExtension on Confidence {
  String toValue() {
    switch (this) {
      case Confidence.high:
        return 'HIGH';
      case Confidence.low:
        return 'LOW';
      case Confidence.none:
        return 'NONE';
    }
  }
}

extension ConfidenceFromString on String {
  Confidence toConfidence() {
    switch (this) {
      case 'HIGH':
        return Confidence.high;
      case 'LOW':
        return Confidence.low;
      case 'NONE':
        return Confidence.none;
    }
    throw Exception('$this is not known in enum Confidence');
  }
}

/// Details about dimensions that contributed to an anomaly.
class ContributionMatrix {
  /// A list of contributing dimensions.
  final List<DimensionContribution>? dimensionContributionList;

  ContributionMatrix({
    this.dimensionContributionList,
  });

  factory ContributionMatrix.fromJson(Map<String, dynamic> json) {
    return ContributionMatrix(
      dimensionContributionList: (json['DimensionContributionList'] as List?)
          ?.whereNotNull()
          .map((e) => DimensionContribution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionContributionList = this.dimensionContributionList;
    return {
      if (dimensionContributionList != null)
        'DimensionContributionList': dimensionContributionList,
    };
  }
}

class CreateAlertResponse {
  /// The ARN of the alert.
  final String? alertArn;

  CreateAlertResponse({
    this.alertArn,
  });

  factory CreateAlertResponse.fromJson(Map<String, dynamic> json) {
    return CreateAlertResponse(
      alertArn: json['AlertArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alertArn = this.alertArn;
    return {
      if (alertArn != null) 'AlertArn': alertArn,
    };
  }
}

class CreateAnomalyDetectorResponse {
  /// The ARN of the detector.
  final String? anomalyDetectorArn;

  CreateAnomalyDetectorResponse({
    this.anomalyDetectorArn,
  });

  factory CreateAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateAnomalyDetectorResponse(
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    return {
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
    };
  }
}

class CreateMetricSetResponse {
  /// The ARN of the dataset.
  final String? metricSetArn;

  CreateMetricSetResponse({
    this.metricSetArn,
  });

  factory CreateMetricSetResponse.fromJson(Map<String, dynamic> json) {
    return CreateMetricSetResponse(
      metricSetArn: json['MetricSetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricSetArn = this.metricSetArn;
    return {
      if (metricSetArn != null) 'MetricSetArn': metricSetArn,
    };
  }
}

/// Contains information about how a source CSV data file should be analyzed.
class CsvFormatDescriptor {
  /// The character set in which the source CSV file is written.
  final String? charset;

  /// Whether or not the source CSV file contains a header.
  final bool? containsHeader;

  /// The character used to delimit the source CSV file.
  final String? delimiter;

  /// The level of compression of the source CSV file.
  final CSVFileCompression? fileCompression;

  /// A list of the source CSV file's headers, if any.
  final List<String>? headerList;

  /// The character used as a quote character.
  final String? quoteSymbol;

  CsvFormatDescriptor({
    this.charset,
    this.containsHeader,
    this.delimiter,
    this.fileCompression,
    this.headerList,
    this.quoteSymbol,
  });

  factory CsvFormatDescriptor.fromJson(Map<String, dynamic> json) {
    return CsvFormatDescriptor(
      charset: json['Charset'] as String?,
      containsHeader: json['ContainsHeader'] as bool?,
      delimiter: json['Delimiter'] as String?,
      fileCompression:
          (json['FileCompression'] as String?)?.toCSVFileCompression(),
      headerList: (json['HeaderList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      quoteSymbol: json['QuoteSymbol'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final charset = this.charset;
    final containsHeader = this.containsHeader;
    final delimiter = this.delimiter;
    final fileCompression = this.fileCompression;
    final headerList = this.headerList;
    final quoteSymbol = this.quoteSymbol;
    return {
      if (charset != null) 'Charset': charset,
      if (containsHeader != null) 'ContainsHeader': containsHeader,
      if (delimiter != null) 'Delimiter': delimiter,
      if (fileCompression != null) 'FileCompression': fileCompression.toValue(),
      if (headerList != null) 'HeaderList': headerList,
      if (quoteSymbol != null) 'QuoteSymbol': quoteSymbol,
    };
  }
}

/// An array that describes a data quality metric. Each
/// <code>DataQualityMetric</code> object contains the data quality metric name,
/// its value, a description of the metric, and the affected column.
class DataQualityMetric {
  /// A description of the data quality metric.
  final String? metricDescription;

  /// The name of the data quality metric.
  final DataQualityMetricType? metricType;

  /// The value of the data quality metric.
  final double? metricValue;

  /// The column that is being monitored.
  final String? relatedColumnName;

  DataQualityMetric({
    this.metricDescription,
    this.metricType,
    this.metricValue,
    this.relatedColumnName,
  });

  factory DataQualityMetric.fromJson(Map<String, dynamic> json) {
    return DataQualityMetric(
      metricDescription: json['MetricDescription'] as String?,
      metricType: (json['MetricType'] as String?)?.toDataQualityMetricType(),
      metricValue: json['MetricValue'] as double?,
      relatedColumnName: json['RelatedColumnName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDescription = this.metricDescription;
    final metricType = this.metricType;
    final metricValue = this.metricValue;
    final relatedColumnName = this.relatedColumnName;
    return {
      if (metricDescription != null) 'MetricDescription': metricDescription,
      if (metricType != null) 'MetricType': metricType.toValue(),
      if (metricValue != null) 'MetricValue': metricValue,
      if (relatedColumnName != null) 'RelatedColumnName': relatedColumnName,
    };
  }
}

enum DataQualityMetricType {
  columnCompleteness,
  dimensionUniqueness,
  timeSeriesCount,
  rowsProcessed,
  rowsPartialCompliance,
  invalidRowsCompliance,
  backtestTrainingDataStartTimeStamp,
  backtestTrainingDataEndTimeStamp,
  backtestInferenceDataStartTimeStamp,
  backtestInferenceDataEndTimeStamp,
}

extension DataQualityMetricTypeValueExtension on DataQualityMetricType {
  String toValue() {
    switch (this) {
      case DataQualityMetricType.columnCompleteness:
        return 'COLUMN_COMPLETENESS';
      case DataQualityMetricType.dimensionUniqueness:
        return 'DIMENSION_UNIQUENESS';
      case DataQualityMetricType.timeSeriesCount:
        return 'TIME_SERIES_COUNT';
      case DataQualityMetricType.rowsProcessed:
        return 'ROWS_PROCESSED';
      case DataQualityMetricType.rowsPartialCompliance:
        return 'ROWS_PARTIAL_COMPLIANCE';
      case DataQualityMetricType.invalidRowsCompliance:
        return 'INVALID_ROWS_COMPLIANCE';
      case DataQualityMetricType.backtestTrainingDataStartTimeStamp:
        return 'BACKTEST_TRAINING_DATA_START_TIME_STAMP';
      case DataQualityMetricType.backtestTrainingDataEndTimeStamp:
        return 'BACKTEST_TRAINING_DATA_END_TIME_STAMP';
      case DataQualityMetricType.backtestInferenceDataStartTimeStamp:
        return 'BACKTEST_INFERENCE_DATA_START_TIME_STAMP';
      case DataQualityMetricType.backtestInferenceDataEndTimeStamp:
        return 'BACKTEST_INFERENCE_DATA_END_TIME_STAMP';
    }
  }
}

extension DataQualityMetricTypeFromString on String {
  DataQualityMetricType toDataQualityMetricType() {
    switch (this) {
      case 'COLUMN_COMPLETENESS':
        return DataQualityMetricType.columnCompleteness;
      case 'DIMENSION_UNIQUENESS':
        return DataQualityMetricType.dimensionUniqueness;
      case 'TIME_SERIES_COUNT':
        return DataQualityMetricType.timeSeriesCount;
      case 'ROWS_PROCESSED':
        return DataQualityMetricType.rowsProcessed;
      case 'ROWS_PARTIAL_COMPLIANCE':
        return DataQualityMetricType.rowsPartialCompliance;
      case 'INVALID_ROWS_COMPLIANCE':
        return DataQualityMetricType.invalidRowsCompliance;
      case 'BACKTEST_TRAINING_DATA_START_TIME_STAMP':
        return DataQualityMetricType.backtestTrainingDataStartTimeStamp;
      case 'BACKTEST_TRAINING_DATA_END_TIME_STAMP':
        return DataQualityMetricType.backtestTrainingDataEndTimeStamp;
      case 'BACKTEST_INFERENCE_DATA_START_TIME_STAMP':
        return DataQualityMetricType.backtestInferenceDataStartTimeStamp;
      case 'BACKTEST_INFERENCE_DATA_END_TIME_STAMP':
        return DataQualityMetricType.backtestInferenceDataEndTimeStamp;
    }
    throw Exception('$this is not known in enum DataQualityMetricType');
  }
}

class DeactivateAnomalyDetectorResponse {
  DeactivateAnomalyDetectorResponse();

  factory DeactivateAnomalyDetectorResponse.fromJson(Map<String, dynamic> _) {
    return DeactivateAnomalyDetectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAlertResponse {
  DeleteAlertResponse();

  factory DeleteAlertResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAlertResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAnomalyDetectorResponse {
  DeleteAnomalyDetectorResponse();

  factory DeleteAnomalyDetectorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAnomalyDetectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAlertResponse {
  /// Contains information about an alert.
  final Alert? alert;

  DescribeAlertResponse({
    this.alert,
  });

  factory DescribeAlertResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAlertResponse(
      alert: json['Alert'] != null
          ? Alert.fromJson(json['Alert'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final alert = this.alert;
    return {
      if (alert != null) 'Alert': alert,
    };
  }
}

class DescribeAnomalyDetectionExecutionsResponse {
  /// A list of detection jobs.
  final List<ExecutionStatus>? executionList;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  DescribeAnomalyDetectionExecutionsResponse({
    this.executionList,
    this.nextToken,
  });

  factory DescribeAnomalyDetectionExecutionsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAnomalyDetectionExecutionsResponse(
      executionList: (json['ExecutionList'] as List?)
          ?.whereNotNull()
          .map((e) => ExecutionStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final executionList = this.executionList;
    final nextToken = this.nextToken;
    return {
      if (executionList != null) 'ExecutionList': executionList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class DescribeAnomalyDetectorResponse {
  /// The ARN of the detector.
  final String? anomalyDetectorArn;

  /// Contains information about the detector's configuration.
  final AnomalyDetectorConfigSummary? anomalyDetectorConfig;

  /// A description of the detector.
  final String? anomalyDetectorDescription;

  /// The name of the detector.
  final String? anomalyDetectorName;

  /// The time at which the detector was created.
  final DateTime? creationTime;

  /// The reason that the detector failed.
  final String? failureReason;

  /// The process that caused the detector to fail.
  final AnomalyDetectorFailureType? failureType;

  /// The ARN of the KMS key to use to encrypt your data.
  final String? kmsKeyArn;

  /// The time at which the detector was last modified.
  final DateTime? lastModificationTime;

  /// The status of the detector.
  final AnomalyDetectorStatus? status;

  DescribeAnomalyDetectorResponse({
    this.anomalyDetectorArn,
    this.anomalyDetectorConfig,
    this.anomalyDetectorDescription,
    this.anomalyDetectorName,
    this.creationTime,
    this.failureReason,
    this.failureType,
    this.kmsKeyArn,
    this.lastModificationTime,
    this.status,
  });

  factory DescribeAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAnomalyDetectorResponse(
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
      anomalyDetectorConfig: json['AnomalyDetectorConfig'] != null
          ? AnomalyDetectorConfigSummary.fromJson(
              json['AnomalyDetectorConfig'] as Map<String, dynamic>)
          : null,
      anomalyDetectorDescription: json['AnomalyDetectorDescription'] as String?,
      anomalyDetectorName: json['AnomalyDetectorName'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      failureReason: json['FailureReason'] as String?,
      failureType:
          (json['FailureType'] as String?)?.toAnomalyDetectorFailureType(),
      kmsKeyArn: json['KmsKeyArn'] as String?,
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      status: (json['Status'] as String?)?.toAnomalyDetectorStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final anomalyDetectorConfig = this.anomalyDetectorConfig;
    final anomalyDetectorDescription = this.anomalyDetectorDescription;
    final anomalyDetectorName = this.anomalyDetectorName;
    final creationTime = this.creationTime;
    final failureReason = this.failureReason;
    final failureType = this.failureType;
    final kmsKeyArn = this.kmsKeyArn;
    final lastModificationTime = this.lastModificationTime;
    final status = this.status;
    return {
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (anomalyDetectorConfig != null)
        'AnomalyDetectorConfig': anomalyDetectorConfig,
      if (anomalyDetectorDescription != null)
        'AnomalyDetectorDescription': anomalyDetectorDescription,
      if (anomalyDetectorName != null)
        'AnomalyDetectorName': anomalyDetectorName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (failureReason != null) 'FailureReason': failureReason,
      if (failureType != null) 'FailureType': failureType.toValue(),
      if (kmsKeyArn != null) 'KmsKeyArn': kmsKeyArn,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (status != null) 'Status': status.toValue(),
    };
  }
}

class DescribeMetricSetResponse {
  /// The ARN of the detector that contains the dataset.
  final String? anomalyDetectorArn;

  /// The time at which the dataset was created.
  final DateTime? creationTime;

  /// The dimensions and their values that were used to filter the dataset.
  final List<MetricSetDimensionFilter>? dimensionFilterList;

  /// A list of the dimensions chosen for analysis.
  final List<String>? dimensionList;

  /// The time at which the dataset was last modified.
  final DateTime? lastModificationTime;

  /// A list of the metrics defined by the dataset.
  final List<Metric>? metricList;

  /// The ARN of the dataset.
  final String? metricSetArn;

  /// The dataset's description.
  final String? metricSetDescription;

  /// The interval at which the data will be analyzed for anomalies.
  final Frequency? metricSetFrequency;

  /// The name of the dataset.
  final String? metricSetName;

  /// Contains information about the dataset's source data.
  final MetricSource? metricSource;

  /// After an interval ends, the amount of seconds that the detector waits before
  /// importing data. Offset is only supported for S3, Redshift, Athena and
  /// datasources.
  final int? offset;

  /// Contains information about the column used for tracking time in your source
  /// data.
  final TimestampColumn? timestampColumn;

  /// The time zone in which the dataset's data was recorded.
  final String? timezone;

  DescribeMetricSetResponse({
    this.anomalyDetectorArn,
    this.creationTime,
    this.dimensionFilterList,
    this.dimensionList,
    this.lastModificationTime,
    this.metricList,
    this.metricSetArn,
    this.metricSetDescription,
    this.metricSetFrequency,
    this.metricSetName,
    this.metricSource,
    this.offset,
    this.timestampColumn,
    this.timezone,
  });

  factory DescribeMetricSetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeMetricSetResponse(
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      dimensionFilterList: (json['DimensionFilterList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MetricSetDimensionFilter.fromJson(e as Map<String, dynamic>))
          .toList(),
      dimensionList: (json['DimensionList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      metricList: (json['MetricList'] as List?)
          ?.whereNotNull()
          .map((e) => Metric.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricSetArn: json['MetricSetArn'] as String?,
      metricSetDescription: json['MetricSetDescription'] as String?,
      metricSetFrequency:
          (json['MetricSetFrequency'] as String?)?.toFrequency(),
      metricSetName: json['MetricSetName'] as String?,
      metricSource: json['MetricSource'] != null
          ? MetricSource.fromJson(json['MetricSource'] as Map<String, dynamic>)
          : null,
      offset: json['Offset'] as int?,
      timestampColumn: json['TimestampColumn'] != null
          ? TimestampColumn.fromJson(
              json['TimestampColumn'] as Map<String, dynamic>)
          : null,
      timezone: json['Timezone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final creationTime = this.creationTime;
    final dimensionFilterList = this.dimensionFilterList;
    final dimensionList = this.dimensionList;
    final lastModificationTime = this.lastModificationTime;
    final metricList = this.metricList;
    final metricSetArn = this.metricSetArn;
    final metricSetDescription = this.metricSetDescription;
    final metricSetFrequency = this.metricSetFrequency;
    final metricSetName = this.metricSetName;
    final metricSource = this.metricSource;
    final offset = this.offset;
    final timestampColumn = this.timestampColumn;
    final timezone = this.timezone;
    return {
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (dimensionFilterList != null)
        'DimensionFilterList': dimensionFilterList,
      if (dimensionList != null) 'DimensionList': dimensionList,
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (metricList != null) 'MetricList': metricList,
      if (metricSetArn != null) 'MetricSetArn': metricSetArn,
      if (metricSetDescription != null)
        'MetricSetDescription': metricSetDescription,
      if (metricSetFrequency != null)
        'MetricSetFrequency': metricSetFrequency.toValue(),
      if (metricSetName != null) 'MetricSetName': metricSetName,
      if (metricSource != null) 'MetricSource': metricSource,
      if (offset != null) 'Offset': offset,
      if (timestampColumn != null) 'TimestampColumn': timestampColumn,
      if (timezone != null) 'Timezone': timezone,
    };
  }
}

class DetectMetricSetConfigResponse {
  /// The inferred dataset configuration for the datasource.
  final DetectedMetricSetConfig? detectedMetricSetConfig;

  DetectMetricSetConfigResponse({
    this.detectedMetricSetConfig,
  });

  factory DetectMetricSetConfigResponse.fromJson(Map<String, dynamic> json) {
    return DetectMetricSetConfigResponse(
      detectedMetricSetConfig: json['DetectedMetricSetConfig'] != null
          ? DetectedMetricSetConfig.fromJson(
              json['DetectedMetricSetConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final detectedMetricSetConfig = this.detectedMetricSetConfig;
    return {
      if (detectedMetricSetConfig != null)
        'DetectedMetricSetConfig': detectedMetricSetConfig,
    };
  }
}

/// Properties of an inferred CSV format.
class DetectedCsvFormatDescriptor {
  /// The format's charset.
  final DetectedField? charset;

  /// Whether the format includes a header.
  final DetectedField? containsHeader;

  /// The format's delimiter.
  final DetectedField? delimiter;

  /// The format's file compression.
  final DetectedField? fileCompression;

  /// The format's header list.
  final DetectedField? headerList;

  /// The format's quote symbol.
  final DetectedField? quoteSymbol;

  DetectedCsvFormatDescriptor({
    this.charset,
    this.containsHeader,
    this.delimiter,
    this.fileCompression,
    this.headerList,
    this.quoteSymbol,
  });

  factory DetectedCsvFormatDescriptor.fromJson(Map<String, dynamic> json) {
    return DetectedCsvFormatDescriptor(
      charset: json['Charset'] != null
          ? DetectedField.fromJson(json['Charset'] as Map<String, dynamic>)
          : null,
      containsHeader: json['ContainsHeader'] != null
          ? DetectedField.fromJson(
              json['ContainsHeader'] as Map<String, dynamic>)
          : null,
      delimiter: json['Delimiter'] != null
          ? DetectedField.fromJson(json['Delimiter'] as Map<String, dynamic>)
          : null,
      fileCompression: json['FileCompression'] != null
          ? DetectedField.fromJson(
              json['FileCompression'] as Map<String, dynamic>)
          : null,
      headerList: json['HeaderList'] != null
          ? DetectedField.fromJson(json['HeaderList'] as Map<String, dynamic>)
          : null,
      quoteSymbol: json['QuoteSymbol'] != null
          ? DetectedField.fromJson(json['QuoteSymbol'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final charset = this.charset;
    final containsHeader = this.containsHeader;
    final delimiter = this.delimiter;
    final fileCompression = this.fileCompression;
    final headerList = this.headerList;
    final quoteSymbol = this.quoteSymbol;
    return {
      if (charset != null) 'Charset': charset,
      if (containsHeader != null) 'ContainsHeader': containsHeader,
      if (delimiter != null) 'Delimiter': delimiter,
      if (fileCompression != null) 'FileCompression': fileCompression,
      if (headerList != null) 'HeaderList': headerList,
      if (quoteSymbol != null) 'QuoteSymbol': quoteSymbol,
    };
  }
}

/// An inferred field.
class DetectedField {
  /// The field's confidence.
  final Confidence? confidence;

  /// The field's message.
  final String? message;

  /// The field's value.
  final AttributeValue? value;

  DetectedField({
    this.confidence,
    this.message,
    this.value,
  });

  factory DetectedField.fromJson(Map<String, dynamic> json) {
    return DetectedField(
      confidence: (json['Confidence'] as String?)?.toConfidence(),
      message: json['Message'] as String?,
      value: json['Value'] != null
          ? AttributeValue.fromJson(json['Value'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final confidence = this.confidence;
    final message = this.message;
    final value = this.value;
    return {
      if (confidence != null) 'Confidence': confidence.toValue(),
      if (message != null) 'Message': message,
      if (value != null) 'Value': value,
    };
  }
}

/// Properties of an inferred data format.
class DetectedFileFormatDescriptor {
  /// Details about a CSV format.
  final DetectedCsvFormatDescriptor? csvFormatDescriptor;

  /// Details about a JSON format.
  final DetectedJsonFormatDescriptor? jsonFormatDescriptor;

  DetectedFileFormatDescriptor({
    this.csvFormatDescriptor,
    this.jsonFormatDescriptor,
  });

  factory DetectedFileFormatDescriptor.fromJson(Map<String, dynamic> json) {
    return DetectedFileFormatDescriptor(
      csvFormatDescriptor: json['CsvFormatDescriptor'] != null
          ? DetectedCsvFormatDescriptor.fromJson(
              json['CsvFormatDescriptor'] as Map<String, dynamic>)
          : null,
      jsonFormatDescriptor: json['JsonFormatDescriptor'] != null
          ? DetectedJsonFormatDescriptor.fromJson(
              json['JsonFormatDescriptor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csvFormatDescriptor = this.csvFormatDescriptor;
    final jsonFormatDescriptor = this.jsonFormatDescriptor;
    return {
      if (csvFormatDescriptor != null)
        'CsvFormatDescriptor': csvFormatDescriptor,
      if (jsonFormatDescriptor != null)
        'JsonFormatDescriptor': jsonFormatDescriptor,
    };
  }
}

/// A detected JSON format descriptor.
class DetectedJsonFormatDescriptor {
  /// The format's character set.
  final DetectedField? charset;

  /// The format's file compression.
  final DetectedField? fileCompression;

  DetectedJsonFormatDescriptor({
    this.charset,
    this.fileCompression,
  });

  factory DetectedJsonFormatDescriptor.fromJson(Map<String, dynamic> json) {
    return DetectedJsonFormatDescriptor(
      charset: json['Charset'] != null
          ? DetectedField.fromJson(json['Charset'] as Map<String, dynamic>)
          : null,
      fileCompression: json['FileCompression'] != null
          ? DetectedField.fromJson(
              json['FileCompression'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final charset = this.charset;
    final fileCompression = this.fileCompression;
    return {
      if (charset != null) 'Charset': charset,
      if (fileCompression != null) 'FileCompression': fileCompression,
    };
  }
}

/// An inferred dataset configuration.
class DetectedMetricSetConfig {
  /// The dataset's interval.
  final DetectedField? metricSetFrequency;

  /// The dataset's data source.
  final DetectedMetricSource? metricSource;

  /// The dataset's offset.
  final DetectedField? offset;

  DetectedMetricSetConfig({
    this.metricSetFrequency,
    this.metricSource,
    this.offset,
  });

  factory DetectedMetricSetConfig.fromJson(Map<String, dynamic> json) {
    return DetectedMetricSetConfig(
      metricSetFrequency: json['MetricSetFrequency'] != null
          ? DetectedField.fromJson(
              json['MetricSetFrequency'] as Map<String, dynamic>)
          : null,
      metricSource: json['MetricSource'] != null
          ? DetectedMetricSource.fromJson(
              json['MetricSource'] as Map<String, dynamic>)
          : null,
      offset: json['Offset'] != null
          ? DetectedField.fromJson(json['Offset'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final metricSetFrequency = this.metricSetFrequency;
    final metricSource = this.metricSource;
    final offset = this.offset;
    return {
      if (metricSetFrequency != null) 'MetricSetFrequency': metricSetFrequency,
      if (metricSource != null) 'MetricSource': metricSource,
      if (offset != null) 'Offset': offset,
    };
  }
}

/// An inferred data source.
class DetectedMetricSource {
  /// The data source's source configuration.
  final DetectedS3SourceConfig? s3SourceConfig;

  DetectedMetricSource({
    this.s3SourceConfig,
  });

  factory DetectedMetricSource.fromJson(Map<String, dynamic> json) {
    return DetectedMetricSource(
      s3SourceConfig: json['S3SourceConfig'] != null
          ? DetectedS3SourceConfig.fromJson(
              json['S3SourceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3SourceConfig = this.s3SourceConfig;
    return {
      if (s3SourceConfig != null) 'S3SourceConfig': s3SourceConfig,
    };
  }
}

/// An inferred source configuration.
class DetectedS3SourceConfig {
  /// The source's file format descriptor.
  final DetectedFileFormatDescriptor? fileFormatDescriptor;

  DetectedS3SourceConfig({
    this.fileFormatDescriptor,
  });

  factory DetectedS3SourceConfig.fromJson(Map<String, dynamic> json) {
    return DetectedS3SourceConfig(
      fileFormatDescriptor: json['FileFormatDescriptor'] != null
          ? DetectedFileFormatDescriptor.fromJson(
              json['FileFormatDescriptor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileFormatDescriptor = this.fileFormatDescriptor;
    return {
      if (fileFormatDescriptor != null)
        'FileFormatDescriptor': fileFormatDescriptor,
    };
  }
}

/// Details about a dimension that contributed to an anomaly.
class DimensionContribution {
  /// The name of the dimension.
  final String? dimensionName;

  /// A list of dimension values that contributed to the anomaly.
  final List<DimensionValueContribution>? dimensionValueContributionList;

  DimensionContribution({
    this.dimensionName,
    this.dimensionValueContributionList,
  });

  factory DimensionContribution.fromJson(Map<String, dynamic> json) {
    return DimensionContribution(
      dimensionName: json['DimensionName'] as String?,
      dimensionValueContributionList: (json['DimensionValueContributionList']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DimensionValueContribution.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionName = this.dimensionName;
    final dimensionValueContributionList = this.dimensionValueContributionList;
    return {
      if (dimensionName != null) 'DimensionName': dimensionName,
      if (dimensionValueContributionList != null)
        'DimensionValueContributionList': dimensionValueContributionList,
    };
  }
}

/// The dimension filter, containing DimensionName and DimensionValueList.
class DimensionFilter {
  /// The name of the dimension to filter on.
  final String? dimensionName;

  /// The list of values for the dimension specified in DimensionName that you
  /// want to filter on.
  final List<String>? dimensionValueList;

  DimensionFilter({
    this.dimensionName,
    this.dimensionValueList,
  });

  factory DimensionFilter.fromJson(Map<String, dynamic> json) {
    return DimensionFilter(
      dimensionName: json['DimensionName'] as String?,
      dimensionValueList: (json['DimensionValueList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionName = this.dimensionName;
    final dimensionValueList = this.dimensionValueList;
    return {
      if (dimensionName != null) 'DimensionName': dimensionName,
      if (dimensionValueList != null) 'DimensionValueList': dimensionValueList,
    };
  }
}

/// A dimension name and value.
class DimensionNameValue {
  /// The name of the dimension.
  final String dimensionName;

  /// The value of the dimension.
  final String dimensionValue;

  DimensionNameValue({
    required this.dimensionName,
    required this.dimensionValue,
  });

  factory DimensionNameValue.fromJson(Map<String, dynamic> json) {
    return DimensionNameValue(
      dimensionName: json['DimensionName'] as String,
      dimensionValue: json['DimensionValue'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionName = this.dimensionName;
    final dimensionValue = this.dimensionValue;
    return {
      'DimensionName': dimensionName,
      'DimensionValue': dimensionValue,
    };
  }
}

/// The severity of a value of a dimension that contributed to an anomaly.
class DimensionValueContribution {
  /// The severity score of the value.
  final double? contributionScore;

  /// The value of the dimension.
  final String? dimensionValue;

  DimensionValueContribution({
    this.contributionScore,
    this.dimensionValue,
  });

  factory DimensionValueContribution.fromJson(Map<String, dynamic> json) {
    return DimensionValueContribution(
      contributionScore: json['ContributionScore'] as double?,
      dimensionValue: json['DimensionValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contributionScore = this.contributionScore;
    final dimensionValue = this.dimensionValue;
    return {
      if (contributionScore != null) 'ContributionScore': contributionScore,
      if (dimensionValue != null) 'DimensionValue': dimensionValue,
    };
  }
}

/// The status of an anomaly detector run.
class ExecutionStatus {
  /// The reason that the run failed, if applicable.
  final String? failureReason;

  /// The run's status.
  final AnomalyDetectionTaskStatus? status;

  /// The run's timestamp.
  final String? timestamp;

  ExecutionStatus({
    this.failureReason,
    this.status,
    this.timestamp,
  });

  factory ExecutionStatus.fromJson(Map<String, dynamic> json) {
    return ExecutionStatus(
      failureReason: json['FailureReason'] as String?,
      status: (json['Status'] as String?)?.toAnomalyDetectionTaskStatus(),
      timestamp: json['Timestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureReason = this.failureReason;
    final status = this.status;
    final timestamp = this.timestamp;
    return {
      if (failureReason != null) 'FailureReason': failureReason,
      if (status != null) 'Status': status.toValue(),
      if (timestamp != null) 'Timestamp': timestamp,
    };
  }
}

/// Contains information about a source file's formatting.
class FileFormatDescriptor {
  /// Contains information about how a source CSV data file should be analyzed.
  final CsvFormatDescriptor? csvFormatDescriptor;

  /// Contains information about how a source JSON data file should be analyzed.
  final JsonFormatDescriptor? jsonFormatDescriptor;

  FileFormatDescriptor({
    this.csvFormatDescriptor,
    this.jsonFormatDescriptor,
  });

  factory FileFormatDescriptor.fromJson(Map<String, dynamic> json) {
    return FileFormatDescriptor(
      csvFormatDescriptor: json['CsvFormatDescriptor'] != null
          ? CsvFormatDescriptor.fromJson(
              json['CsvFormatDescriptor'] as Map<String, dynamic>)
          : null,
      jsonFormatDescriptor: json['JsonFormatDescriptor'] != null
          ? JsonFormatDescriptor.fromJson(
              json['JsonFormatDescriptor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final csvFormatDescriptor = this.csvFormatDescriptor;
    final jsonFormatDescriptor = this.jsonFormatDescriptor;
    return {
      if (csvFormatDescriptor != null)
        'CsvFormatDescriptor': csvFormatDescriptor,
      if (jsonFormatDescriptor != null)
        'JsonFormatDescriptor': jsonFormatDescriptor,
    };
  }
}

/// Describes a filter for choosing a subset of dimension values. Each filter
/// consists of the dimension that you want to include and the condition
/// statement. The condition statement is specified in the
/// <code>FilterOperation</code> object.
class Filter {
  /// The value that you want to include in the filter.
  final String? dimensionValue;

  /// The condition to apply.
  final FilterOperation? filterOperation;

  Filter({
    this.dimensionValue,
    this.filterOperation,
  });

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
      dimensionValue: json['DimensionValue'] as String?,
      filterOperation:
          (json['FilterOperation'] as String?)?.toFilterOperation(),
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionValue = this.dimensionValue;
    final filterOperation = this.filterOperation;
    return {
      if (dimensionValue != null) 'DimensionValue': dimensionValue,
      if (filterOperation != null) 'FilterOperation': filterOperation.toValue(),
    };
  }
}

enum FilterOperation {
  equals,
}

extension FilterOperationValueExtension on FilterOperation {
  String toValue() {
    switch (this) {
      case FilterOperation.equals:
        return 'EQUALS';
    }
  }
}

extension FilterOperationFromString on String {
  FilterOperation toFilterOperation() {
    switch (this) {
      case 'EQUALS':
        return FilterOperation.equals;
    }
    throw Exception('$this is not known in enum FilterOperation');
  }
}

enum Frequency {
  p1d,
  pt1h,
  pt10m,
  pt5m,
}

extension FrequencyValueExtension on Frequency {
  String toValue() {
    switch (this) {
      case Frequency.p1d:
        return 'P1D';
      case Frequency.pt1h:
        return 'PT1H';
      case Frequency.pt10m:
        return 'PT10M';
      case Frequency.pt5m:
        return 'PT5M';
    }
  }
}

extension FrequencyFromString on String {
  Frequency toFrequency() {
    switch (this) {
      case 'P1D':
        return Frequency.p1d;
      case 'PT1H':
        return Frequency.pt1h;
      case 'PT10M':
        return Frequency.pt10m;
      case 'PT5M':
        return Frequency.pt5m;
    }
    throw Exception('$this is not known in enum Frequency');
  }
}

class GetAnomalyGroupResponse {
  /// Details about the anomaly group.
  final AnomalyGroup? anomalyGroup;

  GetAnomalyGroupResponse({
    this.anomalyGroup,
  });

  factory GetAnomalyGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetAnomalyGroupResponse(
      anomalyGroup: json['AnomalyGroup'] != null
          ? AnomalyGroup.fromJson(json['AnomalyGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroup = this.anomalyGroup;
    return {
      if (anomalyGroup != null) 'AnomalyGroup': anomalyGroup,
    };
  }
}

class GetDataQualityMetricsResponse {
  /// A list of the data quality metrics for the <code>AnomalyDetectorArn</code>
  /// that you requested.
  final List<AnomalyDetectorDataQualityMetric>?
      anomalyDetectorDataQualityMetricList;

  GetDataQualityMetricsResponse({
    this.anomalyDetectorDataQualityMetricList,
  });

  factory GetDataQualityMetricsResponse.fromJson(Map<String, dynamic> json) {
    return GetDataQualityMetricsResponse(
      anomalyDetectorDataQualityMetricList:
          (json['AnomalyDetectorDataQualityMetricList'] as List?)
              ?.whereNotNull()
              .map((e) => AnomalyDetectorDataQualityMetric.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorDataQualityMetricList =
        this.anomalyDetectorDataQualityMetricList;
    return {
      if (anomalyDetectorDataQualityMetricList != null)
        'AnomalyDetectorDataQualityMetricList':
            anomalyDetectorDataQualityMetricList,
    };
  }
}

class GetFeedbackResponse {
  /// Feedback for an anomalous metric.
  final List<TimeSeriesFeedback>? anomalyGroupTimeSeriesFeedback;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  GetFeedbackResponse({
    this.anomalyGroupTimeSeriesFeedback,
    this.nextToken,
  });

  factory GetFeedbackResponse.fromJson(Map<String, dynamic> json) {
    return GetFeedbackResponse(
      anomalyGroupTimeSeriesFeedback: (json['AnomalyGroupTimeSeriesFeedback']
              as List?)
          ?.whereNotNull()
          .map((e) => TimeSeriesFeedback.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroupTimeSeriesFeedback = this.anomalyGroupTimeSeriesFeedback;
    final nextToken = this.nextToken;
    return {
      if (anomalyGroupTimeSeriesFeedback != null)
        'AnomalyGroupTimeSeriesFeedback': anomalyGroupTimeSeriesFeedback,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetSampleDataResponse {
  /// A list of header labels for the records.
  final List<String>? headerValues;

  /// A list of records.
  final List<List<String>>? sampleRows;

  GetSampleDataResponse({
    this.headerValues,
    this.sampleRows,
  });

  factory GetSampleDataResponse.fromJson(Map<String, dynamic> json) {
    return GetSampleDataResponse(
      headerValues: (json['HeaderValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sampleRows: (json['SampleRows'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final headerValues = this.headerValues;
    final sampleRows = this.sampleRows;
    return {
      if (headerValues != null) 'HeaderValues': headerValues,
      if (sampleRows != null) 'SampleRows': sampleRows,
    };
  }
}

/// Aggregated details about the measures contributing to the anomaly group, and
/// the measures potentially impacted by the anomaly group.
/// <p/>
class InterMetricImpactDetails {
  /// The ID of the anomaly group.
  final String? anomalyGroupId;

  /// For potential causes (<code>CAUSE_OF_INPUT_ANOMALY_GROUP</code>), the
  /// percentage contribution the measure has in causing the anomalies.
  final double? contributionPercentage;

  /// The name of the measure.
  final String? metricName;

  /// Whether a measure is a potential cause of the anomaly group
  /// (<code>CAUSE_OF_INPUT_ANOMALY_GROUP</code>), or whether the measure is
  /// impacted by the anomaly group (<code>EFFECT_OF_INPUT_ANOMALY_GROUP</code>).
  final RelationshipType? relationshipType;

  InterMetricImpactDetails({
    this.anomalyGroupId,
    this.contributionPercentage,
    this.metricName,
    this.relationshipType,
  });

  factory InterMetricImpactDetails.fromJson(Map<String, dynamic> json) {
    return InterMetricImpactDetails(
      anomalyGroupId: json['AnomalyGroupId'] as String?,
      contributionPercentage: json['ContributionPercentage'] as double?,
      metricName: json['MetricName'] as String?,
      relationshipType:
          (json['RelationshipType'] as String?)?.toRelationshipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroupId = this.anomalyGroupId;
    final contributionPercentage = this.contributionPercentage;
    final metricName = this.metricName;
    final relationshipType = this.relationshipType;
    return {
      if (anomalyGroupId != null) 'AnomalyGroupId': anomalyGroupId,
      if (contributionPercentage != null)
        'ContributionPercentage': contributionPercentage,
      if (metricName != null) 'MetricName': metricName,
      if (relationshipType != null)
        'RelationshipType': relationshipType.toValue(),
    };
  }
}

/// Aggregated statistics about a measure affected by an anomaly.
class ItemizedMetricStats {
  /// The name of the measure.
  final String? metricName;

  /// The number of times that the measure appears.
  final int? occurrenceCount;

  ItemizedMetricStats({
    this.metricName,
    this.occurrenceCount,
  });

  factory ItemizedMetricStats.fromJson(Map<String, dynamic> json) {
    return ItemizedMetricStats(
      metricName: json['MetricName'] as String?,
      occurrenceCount: json['OccurrenceCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricName = this.metricName;
    final occurrenceCount = this.occurrenceCount;
    return {
      if (metricName != null) 'MetricName': metricName,
      if (occurrenceCount != null) 'OccurrenceCount': occurrenceCount,
    };
  }
}

enum JsonFileCompression {
  none,
  gzip,
}

extension JsonFileCompressionValueExtension on JsonFileCompression {
  String toValue() {
    switch (this) {
      case JsonFileCompression.none:
        return 'NONE';
      case JsonFileCompression.gzip:
        return 'GZIP';
    }
  }
}

extension JsonFileCompressionFromString on String {
  JsonFileCompression toJsonFileCompression() {
    switch (this) {
      case 'NONE':
        return JsonFileCompression.none;
      case 'GZIP':
        return JsonFileCompression.gzip;
    }
    throw Exception('$this is not known in enum JsonFileCompression');
  }
}

/// Contains information about how a source JSON data file should be analyzed.
class JsonFormatDescriptor {
  /// The character set in which the source JSON file is written.
  final String? charset;

  /// The level of compression of the source CSV file.
  final JsonFileCompression? fileCompression;

  JsonFormatDescriptor({
    this.charset,
    this.fileCompression,
  });

  factory JsonFormatDescriptor.fromJson(Map<String, dynamic> json) {
    return JsonFormatDescriptor(
      charset: json['Charset'] as String?,
      fileCompression:
          (json['FileCompression'] as String?)?.toJsonFileCompression(),
    );
  }

  Map<String, dynamic> toJson() {
    final charset = this.charset;
    final fileCompression = this.fileCompression;
    return {
      if (charset != null) 'Charset': charset,
      if (fileCompression != null) 'FileCompression': fileCompression.toValue(),
    };
  }
}

/// Contains information about a Lambda configuration.
class LambdaConfiguration {
  /// The ARN of the Lambda function.
  final String lambdaArn;

  /// The ARN of an IAM role that has permission to invoke the Lambda function.
  final String roleArn;

  LambdaConfiguration({
    required this.lambdaArn,
    required this.roleArn,
  });

  factory LambdaConfiguration.fromJson(Map<String, dynamic> json) {
    return LambdaConfiguration(
      lambdaArn: json['LambdaArn'] as String,
      roleArn: json['RoleArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    final roleArn = this.roleArn;
    return {
      'LambdaArn': lambdaArn,
      'RoleArn': roleArn,
    };
  }
}

class ListAlertsResponse {
  /// Contains information about an alert.
  final List<AlertSummary>? alertSummaryList;

  /// If the response is truncated, the service returns this token. To retrieve
  /// the next set of results, use this token in the next request.
  final String? nextToken;

  ListAlertsResponse({
    this.alertSummaryList,
    this.nextToken,
  });

  factory ListAlertsResponse.fromJson(Map<String, dynamic> json) {
    return ListAlertsResponse(
      alertSummaryList: (json['AlertSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => AlertSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alertSummaryList = this.alertSummaryList;
    final nextToken = this.nextToken;
    return {
      if (alertSummaryList != null) 'AlertSummaryList': alertSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAnomalyDetectorsResponse {
  /// A list of anomaly detectors in the account in the current region.
  final List<AnomalyDetectorSummary>? anomalyDetectorSummaryList;

  /// If the response is truncated, the service returns this token. To retrieve
  /// the next set of results, use the token in the next request.
  final String? nextToken;

  ListAnomalyDetectorsResponse({
    this.anomalyDetectorSummaryList,
    this.nextToken,
  });

  factory ListAnomalyDetectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListAnomalyDetectorsResponse(
      anomalyDetectorSummaryList: (json['AnomalyDetectorSummaryList'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AnomalyDetectorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorSummaryList = this.anomalyDetectorSummaryList;
    final nextToken = this.nextToken;
    return {
      if (anomalyDetectorSummaryList != null)
        'AnomalyDetectorSummaryList': anomalyDetectorSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAnomalyGroupRelatedMetricsResponse {
  /// Aggregated details about the measures contributing to the anomaly group, and
  /// the measures potentially impacted by the anomaly group.
  final List<InterMetricImpactDetails>? interMetricImpactList;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ListAnomalyGroupRelatedMetricsResponse({
    this.interMetricImpactList,
    this.nextToken,
  });

  factory ListAnomalyGroupRelatedMetricsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAnomalyGroupRelatedMetricsResponse(
      interMetricImpactList: (json['InterMetricImpactList'] as List?)
          ?.whereNotNull()
          .map((e) =>
              InterMetricImpactDetails.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final interMetricImpactList = this.interMetricImpactList;
    final nextToken = this.nextToken;
    return {
      if (interMetricImpactList != null)
        'InterMetricImpactList': interMetricImpactList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAnomalyGroupSummariesResponse {
  /// Aggregated details about the anomaly groups.
  final AnomalyGroupStatistics? anomalyGroupStatistics;

  /// A list of anomaly group summaries.
  final List<AnomalyGroupSummary>? anomalyGroupSummaryList;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  ListAnomalyGroupSummariesResponse({
    this.anomalyGroupStatistics,
    this.anomalyGroupSummaryList,
    this.nextToken,
  });

  factory ListAnomalyGroupSummariesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAnomalyGroupSummariesResponse(
      anomalyGroupStatistics: json['AnomalyGroupStatistics'] != null
          ? AnomalyGroupStatistics.fromJson(
              json['AnomalyGroupStatistics'] as Map<String, dynamic>)
          : null,
      anomalyGroupSummaryList: (json['AnomalyGroupSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalyGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroupStatistics = this.anomalyGroupStatistics;
    final anomalyGroupSummaryList = this.anomalyGroupSummaryList;
    final nextToken = this.nextToken;
    return {
      if (anomalyGroupStatistics != null)
        'AnomalyGroupStatistics': anomalyGroupStatistics,
      if (anomalyGroupSummaryList != null)
        'AnomalyGroupSummaryList': anomalyGroupSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAnomalyGroupTimeSeriesResponse {
  /// The ID of the anomaly group.
  final String? anomalyGroupId;

  /// The name of the measure field.
  final String? metricName;

  /// The pagination token that's included if more results are available.
  final String? nextToken;

  /// A list of anomalous metrics.
  final List<TimeSeries>? timeSeriesList;

  /// Timestamps for the anomalous metrics.
  final List<String>? timestampList;

  ListAnomalyGroupTimeSeriesResponse({
    this.anomalyGroupId,
    this.metricName,
    this.nextToken,
    this.timeSeriesList,
    this.timestampList,
  });

  factory ListAnomalyGroupTimeSeriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAnomalyGroupTimeSeriesResponse(
      anomalyGroupId: json['AnomalyGroupId'] as String?,
      metricName: json['MetricName'] as String?,
      nextToken: json['NextToken'] as String?,
      timeSeriesList: (json['TimeSeriesList'] as List?)
          ?.whereNotNull()
          .map((e) => TimeSeries.fromJson(e as Map<String, dynamic>))
          .toList(),
      timestampList: (json['TimestampList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyGroupId = this.anomalyGroupId;
    final metricName = this.metricName;
    final nextToken = this.nextToken;
    final timeSeriesList = this.timeSeriesList;
    final timestampList = this.timestampList;
    return {
      if (anomalyGroupId != null) 'AnomalyGroupId': anomalyGroupId,
      if (metricName != null) 'MetricName': metricName,
      if (nextToken != null) 'NextToken': nextToken,
      if (timeSeriesList != null) 'TimeSeriesList': timeSeriesList,
      if (timestampList != null) 'TimestampList': timestampList,
    };
  }
}

class ListMetricSetsResponse {
  /// A list of the datasets in the AWS Region, with configuration details for
  /// each.
  final List<MetricSetSummary>? metricSetSummaryList;

  /// If the response is truncated, the list call returns this token. To retrieve
  /// the next set of results, use the token in the next list request.
  final String? nextToken;

  ListMetricSetsResponse({
    this.metricSetSummaryList,
    this.nextToken,
  });

  factory ListMetricSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListMetricSetsResponse(
      metricSetSummaryList: (json['MetricSetSummaryList'] as List?)
          ?.whereNotNull()
          .map((e) => MetricSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricSetSummaryList = this.metricSetSummaryList;
    final nextToken = this.nextToken;
    return {
      if (metricSetSummaryList != null)
        'MetricSetSummaryList': metricSetSummaryList,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The resource's tags.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A calculation made by contrasting a measure and a dimension from your source
/// data.
class Metric {
  /// The function with which the metric is calculated.
  final AggregationFunction aggregationFunction;

  /// The name of the metric.
  final String metricName;

  /// The namespace for the metric.
  final String? namespace;

  Metric({
    required this.aggregationFunction,
    required this.metricName,
    this.namespace,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      aggregationFunction:
          (json['AggregationFunction'] as String).toAggregationFunction(),
      metricName: json['MetricName'] as String,
      namespace: json['Namespace'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationFunction = this.aggregationFunction;
    final metricName = this.metricName;
    final namespace = this.namespace;
    return {
      'AggregationFunction': aggregationFunction.toValue(),
      'MetricName': metricName,
      if (namespace != null) 'Namespace': namespace,
    };
  }
}

/// Details about a measure affected by an anomaly.
class MetricLevelImpact {
  /// Details about the dimensions that contributed to the anomaly.
  final ContributionMatrix? contributionMatrix;

  /// The name of the measure.
  final String? metricName;

  /// The number of anomalous metrics for the measure.
  final int? numTimeSeries;

  MetricLevelImpact({
    this.contributionMatrix,
    this.metricName,
    this.numTimeSeries,
  });

  factory MetricLevelImpact.fromJson(Map<String, dynamic> json) {
    return MetricLevelImpact(
      contributionMatrix: json['ContributionMatrix'] != null
          ? ContributionMatrix.fromJson(
              json['ContributionMatrix'] as Map<String, dynamic>)
          : null,
      metricName: json['MetricName'] as String?,
      numTimeSeries: json['NumTimeSeries'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final contributionMatrix = this.contributionMatrix;
    final metricName = this.metricName;
    final numTimeSeries = this.numTimeSeries;
    return {
      if (contributionMatrix != null) 'ContributionMatrix': contributionMatrix,
      if (metricName != null) 'MetricName': metricName,
      if (numTimeSeries != null) 'NumTimeSeries': numTimeSeries,
    };
  }
}

/// An array of <code>DataQualityMetric</code> objects that describes one or
/// more data quality metrics.
class MetricSetDataQualityMetric {
  /// The array of data quality metrics contained in the data quality metric set.
  final List<DataQualityMetric>? dataQualityMetricList;

  /// The Amazon Resource Name (ARN) of the data quality metric array.
  final String? metricSetArn;

  MetricSetDataQualityMetric({
    this.dataQualityMetricList,
    this.metricSetArn,
  });

  factory MetricSetDataQualityMetric.fromJson(Map<String, dynamic> json) {
    return MetricSetDataQualityMetric(
      dataQualityMetricList: (json['DataQualityMetricList'] as List?)
          ?.whereNotNull()
          .map((e) => DataQualityMetric.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricSetArn: json['MetricSetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataQualityMetricList = this.dataQualityMetricList;
    final metricSetArn = this.metricSetArn;
    return {
      if (dataQualityMetricList != null)
        'DataQualityMetricList': dataQualityMetricList,
      if (metricSetArn != null) 'MetricSetArn': metricSetArn,
    };
  }
}

/// Describes a list of filters for choosing a subset of dimension values. Each
/// filter consists of the dimension and one of its values that you want to
/// include. When multiple dimensions or values are specified, the dimensions
/// are joined with an AND operation and the values are joined with an OR
/// operation.
class MetricSetDimensionFilter {
  /// The list of filters that you are applying.
  final List<Filter>? filterList;

  /// The dimension that you want to filter on.
  final String? name;

  MetricSetDimensionFilter({
    this.filterList,
    this.name,
  });

  factory MetricSetDimensionFilter.fromJson(Map<String, dynamic> json) {
    return MetricSetDimensionFilter(
      filterList: (json['FilterList'] as List?)
          ?.whereNotNull()
          .map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final filterList = this.filterList;
    final name = this.name;
    return {
      if (filterList != null) 'FilterList': filterList,
      if (name != null) 'Name': name,
    };
  }
}

/// Contains information about a dataset.
class MetricSetSummary {
  /// The ARN of the detector to which the dataset belongs.
  final String? anomalyDetectorArn;

  /// The time at which the dataset was created.
  final DateTime? creationTime;

  /// The time at which the dataset was last modified.
  final DateTime? lastModificationTime;

  /// The ARN of the dataset.
  final String? metricSetArn;

  /// The description of the dataset.
  final String? metricSetDescription;

  /// The name of the dataset.
  final String? metricSetName;

  /// The dataset's <a
  /// href="https://docs.aws.amazon.com/lookoutmetrics/latest/dev/detectors-tags.html">tags</a>.
  final Map<String, String>? tags;

  MetricSetSummary({
    this.anomalyDetectorArn,
    this.creationTime,
    this.lastModificationTime,
    this.metricSetArn,
    this.metricSetDescription,
    this.metricSetName,
    this.tags,
  });

  factory MetricSetSummary.fromJson(Map<String, dynamic> json) {
    return MetricSetSummary(
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModificationTime: timeStampFromJson(json['LastModificationTime']),
      metricSetArn: json['MetricSetArn'] as String?,
      metricSetDescription: json['MetricSetDescription'] as String?,
      metricSetName: json['MetricSetName'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    final creationTime = this.creationTime;
    final lastModificationTime = this.lastModificationTime;
    final metricSetArn = this.metricSetArn;
    final metricSetDescription = this.metricSetDescription;
    final metricSetName = this.metricSetName;
    final tags = this.tags;
    return {
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModificationTime != null)
        'LastModificationTime': unixTimestampToJson(lastModificationTime),
      if (metricSetArn != null) 'MetricSetArn': metricSetArn,
      if (metricSetDescription != null)
        'MetricSetDescription': metricSetDescription,
      if (metricSetName != null) 'MetricSetName': metricSetName,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// Contains information about source data used to generate metrics.
class MetricSource {
  /// Details about an AppFlow datasource.
  final AppFlowConfig? appFlowConfig;

  /// Details about an Amazon Athena datasource.
  final AthenaSourceConfig? athenaSourceConfig;

  /// Details about an Amazon CloudWatch monitoring datasource.
  final CloudWatchConfig? cloudWatchConfig;

  /// Details about an Amazon Relational Database Service (RDS) datasource.
  final RDSSourceConfig? rDSSourceConfig;

  /// Details about an Amazon Redshift database datasource.
  final RedshiftSourceConfig? redshiftSourceConfig;
  final S3SourceConfig? s3SourceConfig;

  MetricSource({
    this.appFlowConfig,
    this.athenaSourceConfig,
    this.cloudWatchConfig,
    this.rDSSourceConfig,
    this.redshiftSourceConfig,
    this.s3SourceConfig,
  });

  factory MetricSource.fromJson(Map<String, dynamic> json) {
    return MetricSource(
      appFlowConfig: json['AppFlowConfig'] != null
          ? AppFlowConfig.fromJson(
              json['AppFlowConfig'] as Map<String, dynamic>)
          : null,
      athenaSourceConfig: json['AthenaSourceConfig'] != null
          ? AthenaSourceConfig.fromJson(
              json['AthenaSourceConfig'] as Map<String, dynamic>)
          : null,
      cloudWatchConfig: json['CloudWatchConfig'] != null
          ? CloudWatchConfig.fromJson(
              json['CloudWatchConfig'] as Map<String, dynamic>)
          : null,
      rDSSourceConfig: json['RDSSourceConfig'] != null
          ? RDSSourceConfig.fromJson(
              json['RDSSourceConfig'] as Map<String, dynamic>)
          : null,
      redshiftSourceConfig: json['RedshiftSourceConfig'] != null
          ? RedshiftSourceConfig.fromJson(
              json['RedshiftSourceConfig'] as Map<String, dynamic>)
          : null,
      s3SourceConfig: json['S3SourceConfig'] != null
          ? S3SourceConfig.fromJson(
              json['S3SourceConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appFlowConfig = this.appFlowConfig;
    final athenaSourceConfig = this.athenaSourceConfig;
    final cloudWatchConfig = this.cloudWatchConfig;
    final rDSSourceConfig = this.rDSSourceConfig;
    final redshiftSourceConfig = this.redshiftSourceConfig;
    final s3SourceConfig = this.s3SourceConfig;
    return {
      if (appFlowConfig != null) 'AppFlowConfig': appFlowConfig,
      if (athenaSourceConfig != null) 'AthenaSourceConfig': athenaSourceConfig,
      if (cloudWatchConfig != null) 'CloudWatchConfig': cloudWatchConfig,
      if (rDSSourceConfig != null) 'RDSSourceConfig': rDSSourceConfig,
      if (redshiftSourceConfig != null)
        'RedshiftSourceConfig': redshiftSourceConfig,
      if (s3SourceConfig != null) 'S3SourceConfig': s3SourceConfig,
    };
  }
}

class PutFeedbackResponse {
  PutFeedbackResponse();

  factory PutFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return PutFeedbackResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains information about the Amazon Relational Database Service (RDS)
/// configuration.
class RDSSourceConfig {
  /// A string identifying the database instance.
  final String? dBInstanceIdentifier;

  /// The host name of the database.
  final String? databaseHost;

  /// The name of the RDS database.
  final String? databaseName;

  /// The port number where the database can be accessed.
  final int? databasePort;

  /// The Amazon Resource Name (ARN) of the role.
  final String? roleArn;

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager role.
  final String? secretManagerArn;

  /// The name of the table in the database.
  final String? tableName;

  /// An object containing information about the Amazon Virtual Private Cloud
  /// (VPC) configuration.
  final VpcConfiguration? vpcConfiguration;

  RDSSourceConfig({
    this.dBInstanceIdentifier,
    this.databaseHost,
    this.databaseName,
    this.databasePort,
    this.roleArn,
    this.secretManagerArn,
    this.tableName,
    this.vpcConfiguration,
  });

  factory RDSSourceConfig.fromJson(Map<String, dynamic> json) {
    return RDSSourceConfig(
      dBInstanceIdentifier: json['DBInstanceIdentifier'] as String?,
      databaseHost: json['DatabaseHost'] as String?,
      databaseName: json['DatabaseName'] as String?,
      databasePort: json['DatabasePort'] as int?,
      roleArn: json['RoleArn'] as String?,
      secretManagerArn: json['SecretManagerArn'] as String?,
      tableName: json['TableName'] as String?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final databaseHost = this.databaseHost;
    final databaseName = this.databaseName;
    final databasePort = this.databasePort;
    final roleArn = this.roleArn;
    final secretManagerArn = this.secretManagerArn;
    final tableName = this.tableName;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (databaseHost != null) 'DatabaseHost': databaseHost,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (databasePort != null) 'DatabasePort': databasePort,
      if (roleArn != null) 'RoleArn': roleArn,
      if (secretManagerArn != null) 'SecretManagerArn': secretManagerArn,
      if (tableName != null) 'TableName': tableName,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

/// Provides information about the Amazon Redshift database configuration.
class RedshiftSourceConfig {
  /// A string identifying the Redshift cluster.
  final String? clusterIdentifier;

  /// The name of the database host.
  final String? databaseHost;

  /// The Redshift database name.
  final String? databaseName;

  /// The port number where the database can be accessed.
  final int? databasePort;

  /// The Amazon Resource Name (ARN) of the role providing access to the database.
  final String? roleArn;

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager role.
  final String? secretManagerArn;

  /// The table name of the Redshift database.
  final String? tableName;

  /// Contains information about the Amazon Virtual Private Cloud (VPC)
  /// configuration.
  final VpcConfiguration? vpcConfiguration;

  RedshiftSourceConfig({
    this.clusterIdentifier,
    this.databaseHost,
    this.databaseName,
    this.databasePort,
    this.roleArn,
    this.secretManagerArn,
    this.tableName,
    this.vpcConfiguration,
  });

  factory RedshiftSourceConfig.fromJson(Map<String, dynamic> json) {
    return RedshiftSourceConfig(
      clusterIdentifier: json['ClusterIdentifier'] as String?,
      databaseHost: json['DatabaseHost'] as String?,
      databaseName: json['DatabaseName'] as String?,
      databasePort: json['DatabasePort'] as int?,
      roleArn: json['RoleArn'] as String?,
      secretManagerArn: json['SecretManagerArn'] as String?,
      tableName: json['TableName'] as String?,
      vpcConfiguration: json['VpcConfiguration'] != null
          ? VpcConfiguration.fromJson(
              json['VpcConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterIdentifier = this.clusterIdentifier;
    final databaseHost = this.databaseHost;
    final databaseName = this.databaseName;
    final databasePort = this.databasePort;
    final roleArn = this.roleArn;
    final secretManagerArn = this.secretManagerArn;
    final tableName = this.tableName;
    final vpcConfiguration = this.vpcConfiguration;
    return {
      if (clusterIdentifier != null) 'ClusterIdentifier': clusterIdentifier,
      if (databaseHost != null) 'DatabaseHost': databaseHost,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (databasePort != null) 'DatabasePort': databasePort,
      if (roleArn != null) 'RoleArn': roleArn,
      if (secretManagerArn != null) 'SecretManagerArn': secretManagerArn,
      if (tableName != null) 'TableName': tableName,
      if (vpcConfiguration != null) 'VpcConfiguration': vpcConfiguration,
    };
  }
}

enum RelationshipType {
  causeOfInputAnomalyGroup,
  effectOfInputAnomalyGroup,
}

extension RelationshipTypeValueExtension on RelationshipType {
  String toValue() {
    switch (this) {
      case RelationshipType.causeOfInputAnomalyGroup:
        return 'CAUSE_OF_INPUT_ANOMALY_GROUP';
      case RelationshipType.effectOfInputAnomalyGroup:
        return 'EFFECT_OF_INPUT_ANOMALY_GROUP';
    }
  }
}

extension RelationshipTypeFromString on String {
  RelationshipType toRelationshipType() {
    switch (this) {
      case 'CAUSE_OF_INPUT_ANOMALY_GROUP':
        return RelationshipType.causeOfInputAnomalyGroup;
      case 'EFFECT_OF_INPUT_ANOMALY_GROUP':
        return RelationshipType.effectOfInputAnomalyGroup;
    }
    throw Exception('$this is not known in enum RelationshipType');
  }
}

/// Contains information about the configuration of the S3 bucket that contains
/// source files.
class S3SourceConfig {
  /// Contains information about a source file's formatting.
  final FileFormatDescriptor? fileFormatDescriptor;

  /// A list of paths to the historical data files.
  final List<String>? historicalDataPathList;

  /// The ARN of an IAM role that has read and write access permissions to the
  /// source S3 bucket.
  final String? roleArn;

  /// A list of templated paths to the source files.
  final List<String>? templatedPathList;

  S3SourceConfig({
    this.fileFormatDescriptor,
    this.historicalDataPathList,
    this.roleArn,
    this.templatedPathList,
  });

  factory S3SourceConfig.fromJson(Map<String, dynamic> json) {
    return S3SourceConfig(
      fileFormatDescriptor: json['FileFormatDescriptor'] != null
          ? FileFormatDescriptor.fromJson(
              json['FileFormatDescriptor'] as Map<String, dynamic>)
          : null,
      historicalDataPathList: (json['HistoricalDataPathList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      roleArn: json['RoleArn'] as String?,
      templatedPathList: (json['TemplatedPathList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fileFormatDescriptor = this.fileFormatDescriptor;
    final historicalDataPathList = this.historicalDataPathList;
    final roleArn = this.roleArn;
    final templatedPathList = this.templatedPathList;
    return {
      if (fileFormatDescriptor != null)
        'FileFormatDescriptor': fileFormatDescriptor,
      if (historicalDataPathList != null)
        'HistoricalDataPathList': historicalDataPathList,
      if (roleArn != null) 'RoleArn': roleArn,
      if (templatedPathList != null) 'TemplatedPathList': templatedPathList,
    };
  }
}

/// Contains information about the SNS topic to which you want to send your
/// alerts and the IAM role that has access to that topic.
class SNSConfiguration {
  /// The ARN of the IAM role that has access to the target SNS topic.
  final String roleArn;

  /// The ARN of the target SNS topic.
  final String snsTopicArn;

  /// The format of the SNS topic.
  ///
  /// <ul>
  /// <li>
  /// <code>JSON</code> – Send JSON alerts with an anomaly ID and a link to the
  /// anomaly detail page. This is the default.
  /// </li>
  /// <li>
  /// <code>LONG_TEXT</code> – Send human-readable alerts with information about
  /// the impacted timeseries and a link to the anomaly detail page. We recommend
  /// this for email.
  /// </li>
  /// <li>
  /// <code>SHORT_TEXT</code> – Send human-readable alerts with a link to the
  /// anomaly detail page. We recommend this for SMS.
  /// </li>
  /// </ul>
  final SnsFormat? snsFormat;

  SNSConfiguration({
    required this.roleArn,
    required this.snsTopicArn,
    this.snsFormat,
  });

  factory SNSConfiguration.fromJson(Map<String, dynamic> json) {
    return SNSConfiguration(
      roleArn: json['RoleArn'] as String,
      snsTopicArn: json['SnsTopicArn'] as String,
      snsFormat: (json['SnsFormat'] as String?)?.toSnsFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final roleArn = this.roleArn;
    final snsTopicArn = this.snsTopicArn;
    final snsFormat = this.snsFormat;
    return {
      'RoleArn': roleArn,
      'SnsTopicArn': snsTopicArn,
      if (snsFormat != null) 'SnsFormat': snsFormat.toValue(),
    };
  }
}

/// Contains information about the source configuration in Amazon S3.
class SampleDataS3SourceConfig {
  final FileFormatDescriptor fileFormatDescriptor;

  /// The Amazon Resource Name (ARN) of the role.
  final String roleArn;

  /// An array of strings containing the historical set of data paths.
  final List<String>? historicalDataPathList;

  /// An array of strings containing the list of templated paths.
  final List<String>? templatedPathList;

  SampleDataS3SourceConfig({
    required this.fileFormatDescriptor,
    required this.roleArn,
    this.historicalDataPathList,
    this.templatedPathList,
  });

  Map<String, dynamic> toJson() {
    final fileFormatDescriptor = this.fileFormatDescriptor;
    final roleArn = this.roleArn;
    final historicalDataPathList = this.historicalDataPathList;
    final templatedPathList = this.templatedPathList;
    return {
      'FileFormatDescriptor': fileFormatDescriptor,
      'RoleArn': roleArn,
      if (historicalDataPathList != null)
        'HistoricalDataPathList': historicalDataPathList,
      if (templatedPathList != null) 'TemplatedPathList': templatedPathList,
    };
  }
}

enum SnsFormat {
  longText,
  shortText,
  json,
}

extension SnsFormatValueExtension on SnsFormat {
  String toValue() {
    switch (this) {
      case SnsFormat.longText:
        return 'LONG_TEXT';
      case SnsFormat.shortText:
        return 'SHORT_TEXT';
      case SnsFormat.json:
        return 'JSON';
    }
  }
}

extension SnsFormatFromString on String {
  SnsFormat toSnsFormat() {
    switch (this) {
      case 'LONG_TEXT':
        return SnsFormat.longText;
      case 'SHORT_TEXT':
        return SnsFormat.shortText;
      case 'JSON':
        return SnsFormat.json;
    }
    throw Exception('$this is not known in enum SnsFormat');
  }
}

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about a metric. A metric is an aggregation of the values of a
/// measure for a dimension value, such as <i>availability</i> in the
/// <i>us-east-1</i> Region.
class TimeSeries {
  /// The dimensions of the metric.
  final List<DimensionNameValue> dimensionList;

  /// The values for the metric.
  final List<double> metricValueList;

  /// The ID of the metric.
  final String timeSeriesId;

  TimeSeries({
    required this.dimensionList,
    required this.metricValueList,
    required this.timeSeriesId,
  });

  factory TimeSeries.fromJson(Map<String, dynamic> json) {
    return TimeSeries(
      dimensionList: (json['DimensionList'] as List)
          .whereNotNull()
          .map((e) => DimensionNameValue.fromJson(e as Map<String, dynamic>))
          .toList(),
      metricValueList: (json['MetricValueList'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
      timeSeriesId: json['TimeSeriesId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dimensionList = this.dimensionList;
    final metricValueList = this.metricValueList;
    final timeSeriesId = this.timeSeriesId;
    return {
      'DimensionList': dimensionList,
      'MetricValueList': metricValueList,
      'TimeSeriesId': timeSeriesId,
    };
  }
}

/// Details about feedback submitted for an anomalous metric.
class TimeSeriesFeedback {
  /// Feedback on whether the metric is a legitimate anomaly.
  final bool? isAnomaly;

  /// The ID of the metric.
  final String? timeSeriesId;

  TimeSeriesFeedback({
    this.isAnomaly,
    this.timeSeriesId,
  });

  factory TimeSeriesFeedback.fromJson(Map<String, dynamic> json) {
    return TimeSeriesFeedback(
      isAnomaly: json['IsAnomaly'] as bool?,
      timeSeriesId: json['TimeSeriesId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final isAnomaly = this.isAnomaly;
    final timeSeriesId = this.timeSeriesId;
    return {
      if (isAnomaly != null) 'IsAnomaly': isAnomaly,
      if (timeSeriesId != null) 'TimeSeriesId': timeSeriesId,
    };
  }
}

/// Contains information about the column used to track time in a source data
/// file.
class TimestampColumn {
  /// The format of the timestamp column.
  final String? columnFormat;

  /// The name of the timestamp column.
  final String? columnName;

  TimestampColumn({
    this.columnFormat,
    this.columnName,
  });

  factory TimestampColumn.fromJson(Map<String, dynamic> json) {
    return TimestampColumn(
      columnFormat: json['ColumnFormat'] as String?,
      columnName: json['ColumnName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final columnFormat = this.columnFormat;
    final columnName = this.columnName;
    return {
      if (columnFormat != null) 'ColumnFormat': columnFormat,
      if (columnName != null) 'ColumnName': columnName,
    };
  }
}

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAlertResponse {
  /// The ARN of the updated alert.
  final String? alertArn;

  UpdateAlertResponse({
    this.alertArn,
  });

  factory UpdateAlertResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAlertResponse(
      alertArn: json['AlertArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alertArn = this.alertArn;
    return {
      if (alertArn != null) 'AlertArn': alertArn,
    };
  }
}

class UpdateAnomalyDetectorResponse {
  /// The ARN of the updated detector.
  final String? anomalyDetectorArn;

  UpdateAnomalyDetectorResponse({
    this.anomalyDetectorArn,
  });

  factory UpdateAnomalyDetectorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAnomalyDetectorResponse(
      anomalyDetectorArn: json['AnomalyDetectorArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final anomalyDetectorArn = this.anomalyDetectorArn;
    return {
      if (anomalyDetectorArn != null) 'AnomalyDetectorArn': anomalyDetectorArn,
    };
  }
}

class UpdateMetricSetResponse {
  /// The ARN of the dataset.
  final String? metricSetArn;

  UpdateMetricSetResponse({
    this.metricSetArn,
  });

  factory UpdateMetricSetResponse.fromJson(Map<String, dynamic> json) {
    return UpdateMetricSetResponse(
      metricSetArn: json['MetricSetArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricSetArn = this.metricSetArn;
    return {
      if (metricSetArn != null) 'MetricSetArn': metricSetArn,
    };
  }
}

/// Contains configuration information about the Amazon Virtual Private Cloud
/// (VPC).
class VpcConfiguration {
  /// An array of strings containing the list of security groups.
  final List<String> securityGroupIdList;

  /// An array of strings containing the Amazon VPC subnet IDs (e.g.,
  /// <code>subnet-0bb1c79de3EXAMPLE</code>.
  final List<String> subnetIdList;

  VpcConfiguration({
    required this.securityGroupIdList,
    required this.subnetIdList,
  });

  factory VpcConfiguration.fromJson(Map<String, dynamic> json) {
    return VpcConfiguration(
      securityGroupIdList: (json['SecurityGroupIdList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIdList: (json['SubnetIdList'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIdList = this.securityGroupIdList;
    final subnetIdList = this.subnetIdList;
    return {
      'SecurityGroupIdList': securityGroupIdList,
      'SubnetIdList': subnetIdList,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class TooManyRequestsException extends _s.GenericAwsException {
  TooManyRequestsException({String? type, String? message})
      : super(type: type, code: 'TooManyRequestsException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'TooManyRequestsException': (type, message) =>
      TooManyRequestsException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
