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

/// With Amazon CloudWatch RUM, you can perform real-user monitoring to collect
/// client-side data about your web application performance from actual user
/// sessions in real time. The data collected includes page load times,
/// client-side errors, and user behavior. When you view this data, you can see
/// it all aggregated together and also see breakdowns by the browsers and
/// devices that your customers use.
///
/// You can use the collected data to quickly identify and debug client-side
/// performance issues. CloudWatch RUM helps you visualize anomalies in your
/// application performance and find relevant debugging data such as error
/// messages, stack traces, and user sessions. You can also use RUM to
/// understand the range of end-user impact including the number of users,
/// geolocations, and browsers used.
class CloudWatchRum {
  final _s.RestJsonProtocol _protocol;
  CloudWatchRum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rum',
            signingName: 'rum',
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

  /// Specifies the extended metrics and custom metrics that you want a
  /// CloudWatch RUM app monitor to send to a destination. Valid destinations
  /// include CloudWatch and Evidently.
  ///
  /// By default, RUM app monitors send some metrics to CloudWatch. These
  /// default metrics are listed in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-metrics.html">CloudWatch
  /// metrics that you can collect with CloudWatch RUM</a>.
  ///
  /// In addition to these default metrics, you can choose to send extended
  /// metrics, custom metrics, or both.
  ///
  /// <ul>
  /// <li>
  /// Extended metrics let you send metrics with additional dimensions that
  /// aren't included in the default metrics. You can also send extended metrics
  /// to both Evidently and CloudWatch. The valid dimension names for the
  /// additional dimensions for extended metrics are <code>BrowserName</code>,
  /// <code>CountryCode</code>, <code>DeviceType</code>, <code>FileType</code>,
  /// <code>OSName</code>, and <code>PageId</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-vended-metrics.html">
  /// Extended metrics that you can send to CloudWatch and CloudWatch
  /// Evidently</a>.
  /// </li>
  /// <li>
  /// Custom metrics are metrics that you define. You can send custom metrics to
  /// CloudWatch. CloudWatch Evidently, or both. With custom metrics, you can
  /// use any metric name and namespace. To derive the metrics, you can use any
  /// custom events, built-in events, custom attributes, or default attributes.
  ///
  /// You can't send custom metrics to the <code>AWS/RUM</code> namespace. You
  /// must send custom metrics to a custom namespace that you define. The
  /// namespace that you use can't start with <code>AWS/</code>. CloudWatch RUM
  /// prepends <code>RUM/CustomMetrics/</code> to the custom namespace that you
  /// define, so the final namespace for your metrics in CloudWatch is
  /// <code>RUM/CustomMetrics/<i>your-custom-namespace</i> </code>.
  /// </li>
  /// </ul>
  /// The maximum number of metric definitions that you can specify in one
  /// <code>BatchCreateRumMetricDefinitions</code> operation is 200.
  ///
  /// The maximum number of metric definitions that one destination can contain
  /// is 2000.
  ///
  /// Extended metrics sent to CloudWatch and RUM custom metrics are charged as
  /// CloudWatch custom metrics. Each combination of additional dimension name
  /// and dimension value counts as a custom metric. For more information, see
  /// <a href="https://aws.amazon.com/cloudwatch/pricing/">Amazon CloudWatch
  /// Pricing</a>.
  ///
  /// You must have already created a destination for the metrics before you
  /// send them. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_PutRumMetricsDestination.html">PutRumMetricsDestination</a>.
  ///
  /// If some metric definitions specified in a
  /// <code>BatchCreateRumMetricDefinitions</code> operations are not valid,
  /// those metric definitions fail and return errors, but all valid metric
  /// definitions in the same operation still succeed.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the CloudWatch RUM app monitor that is to send the metrics.
  ///
  /// Parameter [destination] :
  /// The destination to send the metrics to. Valid values are
  /// <code>CloudWatch</code> and <code>Evidently</code>. If you specify
  /// <code>Evidently</code>, you must also specify the Amazon Resource Name
  /// (ARN) of the CloudWatchEvidently experiment that will receive the metrics
  /// and an IAM role that has permission to write to the experiment.
  ///
  /// Parameter [metricDefinitions] :
  /// An array of structures which define the metrics that you want to send.
  ///
  /// Parameter [destinationArn] :
  /// This parameter is required if <code>Destination</code> is
  /// <code>Evidently</code>. If <code>Destination</code> is
  /// <code>CloudWatch</code>, do not use this parameter.
  ///
  /// This parameter specifies the ARN of the Evidently experiment that is to
  /// receive the metrics. You must have already defined this experiment as a
  /// valid destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_PutRumMetricsDestination.html">PutRumMetricsDestination</a>.
  Future<BatchCreateRumMetricDefinitionsResponse>
      batchCreateRumMetricDefinitions({
    required String appMonitorName,
    required MetricDestination destination,
    required List<MetricDefinitionRequest> metricDefinitions,
    String? destinationArn,
  }) async {
    final $payload = <String, dynamic>{
      'Destination': destination.toValue(),
      'MetricDefinitions': metricDefinitions,
      if (destinationArn != null) 'DestinationArn': destinationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metrics',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateRumMetricDefinitionsResponse.fromJson(response);
  }

  /// Removes the specified metrics from being sent to an extended metrics
  /// destination.
  ///
  /// If some metric definition IDs specified in a
  /// <code>BatchDeleteRumMetricDefinitions</code> operations are not valid,
  /// those metric definitions fail and return errors, but all valid metric
  /// definition IDs in the same operation are still deleted.
  ///
  /// The maximum number of metric definitions that you can specify in one
  /// <code>BatchDeleteRumMetricDefinitions</code> operation is 200.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the CloudWatch RUM app monitor that is sending these metrics.
  ///
  /// Parameter [destination] :
  /// Defines the destination where you want to stop sending the specified
  /// metrics. Valid values are <code>CloudWatch</code> and
  /// <code>Evidently</code>. If you specify <code>Evidently</code>, you must
  /// also specify the ARN of the CloudWatchEvidently experiment that is to be
  /// the destination and an IAM role that has permission to write to the
  /// experiment.
  ///
  /// Parameter [metricDefinitionIds] :
  /// An array of structures which define the metrics that you want to stop
  /// sending.
  ///
  /// Parameter [destinationArn] :
  /// This parameter is required if <code>Destination</code> is
  /// <code>Evidently</code>. If <code>Destination</code> is
  /// <code>CloudWatch</code>, do not use this parameter.
  ///
  /// This parameter specifies the ARN of the Evidently experiment that was
  /// receiving the metrics that are being deleted.
  Future<BatchDeleteRumMetricDefinitionsResponse>
      batchDeleteRumMetricDefinitions({
    required String appMonitorName,
    required MetricDestination destination,
    required List<String> metricDefinitionIds,
    String? destinationArn,
  }) async {
    final $query = <String, List<String>>{
      'destination': [destination.toValue()],
      'metricDefinitionIds': metricDefinitionIds,
      if (destinationArn != null) 'destinationArn': [destinationArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteRumMetricDefinitionsResponse.fromJson(response);
  }

  /// Retrieves the list of metrics and dimensions that a RUM app monitor is
  /// sending to a single destination.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the CloudWatch RUM app monitor that is sending the metrics.
  ///
  /// Parameter [destination] :
  /// The type of destination that you want to view metrics for. Valid values
  /// are <code>CloudWatch</code> and <code>Evidently</code>.
  ///
  /// Parameter [destinationArn] :
  /// This parameter is required if <code>Destination</code> is
  /// <code>Evidently</code>. If <code>Destination</code> is
  /// <code>CloudWatch</code>, do not use this parameter.
  ///
  /// This parameter specifies the ARN of the Evidently experiment that
  /// corresponds to the destination.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. The default is
  /// 50. The maximum that you can specify is 100.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<BatchGetRumMetricDefinitionsResponse> batchGetRumMetricDefinitions({
    required String appMonitorName,
    required MetricDestination destination,
    String? destinationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'destination': [destination.toValue()],
      if (destinationArn != null) 'destinationArn': [destinationArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetRumMetricDefinitionsResponse.fromJson(response);
  }

  /// Creates a Amazon CloudWatch RUM app monitor, which collects telemetry data
  /// from your application and sends that data to RUM. The data includes
  /// performance and reliability information such as page load time,
  /// client-side errors, and user behavior.
  ///
  /// You use this operation only to create a new app monitor. To update an
  /// existing app monitor, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_UpdateAppMonitor.html">UpdateAppMonitor</a>
  /// instead.
  ///
  /// After you create an app monitor, sign in to the CloudWatch RUM console to
  /// get the JavaScript code snippet to add to your web application. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-find-code-snippet.html">How
  /// do I find a code snippet that I've already generated?</a>
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [domain] :
  /// The top-level internet domain name for which your application has
  /// administrative authority.
  ///
  /// Parameter [name] :
  /// A name for the app monitor.
  ///
  /// Parameter [appMonitorConfiguration] :
  /// A structure that contains much of the configuration data for the app
  /// monitor. If you are using Amazon Cognito for authorization, you must
  /// include this structure in your request, and it must include the ID of the
  /// Amazon Cognito identity pool to use for authorization. If you don't
  /// include <code>AppMonitorConfiguration</code>, you must set up your own
  /// authorization method. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-get-started-authorization.html">Authorize
  /// your application to send data to Amazon Web Services</a>.
  ///
  /// If you omit this argument, the sample rate used for RUM is set to 10% of
  /// the user sessions.
  ///
  /// Parameter [customEvents] :
  /// Specifies whether this app monitor allows the web client to define and
  /// send custom events. If you omit this parameter, custom events are
  /// <code>DISABLED</code>.
  ///
  /// For more information about custom events, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-custom-events.html">Send
  /// custom events</a>.
  ///
  /// Parameter [cwLogEnabled] :
  /// Data collected by RUM is kept by RUM for 30 days and then deleted. This
  /// parameter specifies whether RUM sends a copy of this telemetry data to
  /// Amazon CloudWatch Logs in your account. This enables you to keep the
  /// telemetry data for more than 30 days, but it does incur Amazon CloudWatch
  /// Logs charges.
  ///
  /// If you omit this parameter, the default is <code>false</code>.
  ///
  /// Parameter [tags] :
  /// Assigns one or more tags (key-value pairs) to the app monitor.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can associate as many as 50 tags with an app monitor.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  Future<CreateAppMonitorResponse> createAppMonitor({
    required String domain,
    required String name,
    AppMonitorConfiguration? appMonitorConfiguration,
    CustomEvents? customEvents,
    bool? cwLogEnabled,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Domain': domain,
      'Name': name,
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (customEvents != null) 'CustomEvents': customEvents,
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitor',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppMonitorResponse.fromJson(response);
  }

  /// Deletes an existing app monitor. This immediately stops the collection of
  /// data.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor to delete.
  Future<void> deleteAppMonitor({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a destination for CloudWatch RUM extended metrics, so that the
  /// specified app monitor stops sending extended metrics to that destination.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the app monitor that is sending metrics to the destination
  /// that you want to delete.
  ///
  /// Parameter [destination] :
  /// The type of destination to delete. Valid values are
  /// <code>CloudWatch</code> and <code>Evidently</code>.
  ///
  /// Parameter [destinationArn] :
  /// This parameter is required if <code>Destination</code> is
  /// <code>Evidently</code>. If <code>Destination</code> is
  /// <code>CloudWatch</code>, do not use this parameter. This parameter
  /// specifies the ARN of the Evidently experiment that corresponds to the
  /// destination to delete.
  Future<void> deleteRumMetricsDestination({
    required String appMonitorName,
    required MetricDestination destination,
    String? destinationArn,
  }) async {
    final $query = <String, List<String>>{
      'destination': [destination.toValue()],
      if (destinationArn != null) 'destinationArn': [destinationArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metricsdestination',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves the complete configuration information for one app monitor.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The app monitor to retrieve information for.
  Future<GetAppMonitorResponse> getAppMonitor({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppMonitorResponse.fromJson(response);
  }

  /// Retrieves the raw performance events that RUM has collected from your web
  /// application, so that you can do your own processing or analysis of this
  /// data.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor that collected the data that you want to
  /// retrieve.
  ///
  /// Parameter [timeRange] :
  /// A structure that defines the time range that you want to retrieve results
  /// from.
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<GetAppMonitorDataResponse> getAppMonitorData({
    required String name,
    required TimeRange timeRange,
    List<QueryFilter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      0,
      100,
    );
    final $payload = <String, dynamic>{
      'TimeRange': timeRange,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}/data',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppMonitorDataResponse.fromJson(response);
  }

  /// Returns a list of the Amazon CloudWatch RUM app monitors in the account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. The default is
  /// 50. The maximum that you can specify is 100.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<ListAppMonitorsResponse> listAppMonitors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/appmonitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppMonitorsResponse.fromJson(response);
  }

  /// Returns a list of destinations that you have created to receive RUM
  /// extended metrics, for the specified app monitor.
  ///
  /// For more information about extended metrics, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_AddRumMetrcs.html">AddRumMetrics</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the app monitor associated with the destinations that you want
  /// to retrieve.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in one operation. The default is
  /// 50. The maximum that you can specify is 100.
  ///
  /// To retrieve the remaining results, make another call with the returned
  /// <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Use the token returned by the previous operation to request the next page
  /// of results.
  Future<ListRumMetricsDestinationsResponse> listRumMetricsDestinations({
    required String appMonitorName,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metricsdestination',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRumMetricsDestinationsResponse.fromJson(response);
  }

  /// Displays the tags associated with a CloudWatch RUM resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that you want to see the tags of.
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

  /// Sends telemetry events about your application performance and user
  /// behavior to CloudWatch RUM. The code snippet that RUM generates for you to
  /// add to your application includes <code>PutRumEvents</code> operations to
  /// send this data to RUM.
  ///
  /// Each <code>PutRumEvents</code> operation can send a batch of events from
  /// one user session.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorDetails] :
  /// A structure that contains information about the app monitor that collected
  /// this telemetry information.
  ///
  /// Parameter [batchId] :
  /// A unique identifier for this batch of RUM event data.
  ///
  /// Parameter [id] :
  /// The ID of the app monitor that is sending this data.
  ///
  /// Parameter [rumEvents] :
  /// An array of structures that contain the telemetry event data.
  ///
  /// Parameter [userDetails] :
  /// A structure that contains information about the user session that this
  /// batch of events was collected from.
  Future<void> putRumEvents({
    required AppMonitorDetails appMonitorDetails,
    required String batchId,
    required String id,
    required List<RumEvent> rumEvents,
    required UserDetails userDetails,
  }) async {
    final $payload = <String, dynamic>{
      'AppMonitorDetails': appMonitorDetails,
      'BatchId': batchId,
      'RumEvents': rumEvents,
      'UserDetails': userDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitors/${Uri.encodeComponent(id)}/',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates a destination to receive extended metrics from
  /// CloudWatch RUM. You can send extended metrics to CloudWatch or to a
  /// CloudWatch Evidently experiment.
  ///
  /// For more information about extended metrics, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchCreateRumMetricDefinitions.html">BatchCreateRumMetricDefinitions</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the CloudWatch RUM app monitor that will send the metrics.
  ///
  /// Parameter [destination] :
  /// Defines the destination to send the metrics to. Valid values are
  /// <code>CloudWatch</code> and <code>Evidently</code>. If you specify
  /// <code>Evidently</code>, you must also specify the ARN of the
  /// CloudWatchEvidently experiment that is to be the destination and an IAM
  /// role that has permission to write to the experiment.
  ///
  /// Parameter [destinationArn] :
  /// Use this parameter only if <code>Destination</code> is
  /// <code>Evidently</code>. This parameter specifies the ARN of the Evidently
  /// experiment that will receive the extended metrics.
  ///
  /// Parameter [iamRoleArn] :
  /// This parameter is required if <code>Destination</code> is
  /// <code>Evidently</code>. If <code>Destination</code> is
  /// <code>CloudWatch</code>, don't use this parameter.
  ///
  /// This parameter specifies the ARN of an IAM role that RUM will assume to
  /// write to the Evidently experiment that you are sending metrics to. This
  /// role must have permission to write to that experiment.
  ///
  /// If you specify this parameter, you must be signed on to a role that has <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_passrole.html">PassRole</a>
  /// permissions attached to it, to allow the role to be passed. The <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/auth-and-access-control-cw.html#managed-policies-cloudwatch-RUM">
  /// CloudWatchAmazonCloudWatchRUMFullAccess</a> policy doesn't include
  /// <code>PassRole</code> permissions.
  Future<void> putRumMetricsDestination({
    required String appMonitorName,
    required MetricDestination destination,
    String? destinationArn,
    String? iamRoleArn,
  }) async {
    final $payload = <String, dynamic>{
      'Destination': destination.toValue(),
      if (destinationArn != null) 'DestinationArn': destinationArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metricsdestination',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns one or more tags (key-value pairs) to the specified CloudWatch RUM
  /// resource. Currently, the only resources that can be tagged app monitors.
  ///
  /// Tags can help you organize and categorize your resources. You can also use
  /// them to scope user permissions by granting a user permission to access or
  /// change only resources with certain tag values.
  ///
  /// Tags don't have any semantic meaning to Amazon Web Services and are
  /// interpreted strictly as strings of characters.
  ///
  /// You can use the <code>TagResource</code> action with a resource that
  /// already has tags. If you specify a new tag key for the resource, this tag
  /// is appended to the list of tags associated with the alarm. If you specify
  /// a tag key that is already associated with the resource, the new tag value
  /// that you specify replaces the previous value for that tag.
  ///
  /// You can associate as many as 50 tags with a resource.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch RUM resource that you're adding tags to.
  ///
  /// Parameter [tags] :
  /// The list of key-value pairs to associate with the resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the CloudWatch RUM resource that you're removing tags from.
  ///
  /// Parameter [tagKeys] :
  /// The list of tag keys to remove from the resource.
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

  /// Updates the configuration of an existing app monitor. When you use this
  /// operation, only the parts of the app monitor configuration that you
  /// specify in this operation are changed. For any parameters that you omit,
  /// the existing values are kept.
  ///
  /// You can't use this operation to change the tags of an existing app
  /// monitor. To change the tags of an existing app monitor, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_TagResource.html">TagResource</a>.
  ///
  /// To create a new app monitor, use <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_CreateAppMonitor.html">CreateAppMonitor</a>.
  ///
  /// After you update an app monitor, sign in to the CloudWatch RUM console to
  /// get the updated JavaScript code snippet to add to your web application.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-find-code-snippet.html">How
  /// do I find a code snippet that I've already generated?</a>
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor to update.
  ///
  /// Parameter [appMonitorConfiguration] :
  /// A structure that contains much of the configuration data for the app
  /// monitor. If you are using Amazon Cognito for authorization, you must
  /// include this structure in your request, and it must include the ID of the
  /// Amazon Cognito identity pool to use for authorization. If you don't
  /// include <code>AppMonitorConfiguration</code>, you must set up your own
  /// authorization method. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-get-started-authorization.html">Authorize
  /// your application to send data to Amazon Web Services</a>.
  ///
  /// Parameter [customEvents] :
  /// Specifies whether this app monitor allows the web client to define and
  /// send custom events. The default is for custom events to be
  /// <code>DISABLED</code>.
  ///
  /// For more information about custom events, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-custom-events.html">Send
  /// custom events</a>.
  ///
  /// Parameter [cwLogEnabled] :
  /// Data collected by RUM is kept by RUM for 30 days and then deleted. This
  /// parameter specifies whether RUM sends a copy of this telemetry data to
  /// Amazon CloudWatch Logs in your account. This enables you to keep the
  /// telemetry data for more than 30 days, but it does incur Amazon CloudWatch
  /// Logs charges.
  ///
  /// Parameter [domain] :
  /// The top-level internet domain name for which your application has
  /// administrative authority.
  Future<void> updateAppMonitor({
    required String name,
    AppMonitorConfiguration? appMonitorConfiguration,
    CustomEvents? customEvents,
    bool? cwLogEnabled,
    String? domain,
  }) async {
    final $payload = <String, dynamic>{
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (customEvents != null) 'CustomEvents': customEvents,
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Modifies one existing metric definition for CloudWatch RUM extended
  /// metrics. For more information about extended metrics, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchCreateRumMetricsDefinitions.html">BatchCreateRumMetricsDefinitions</a>.
  ///
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [appMonitorName] :
  /// The name of the CloudWatch RUM app monitor that sends these metrics.
  ///
  /// Parameter [destination] :
  /// The destination to send the metrics to. Valid values are
  /// <code>CloudWatch</code> and <code>Evidently</code>. If you specify
  /// <code>Evidently</code>, you must also specify the ARN of the
  /// CloudWatchEvidently experiment that will receive the metrics and an IAM
  /// role that has permission to write to the experiment.
  ///
  /// Parameter [metricDefinition] :
  /// A structure that contains the new definition that you want to use for this
  /// metric.
  ///
  /// Parameter [metricDefinitionId] :
  /// The ID of the metric definition to update.
  ///
  /// Parameter [destinationArn] :
  /// This parameter is required if <code>Destination</code> is
  /// <code>Evidently</code>. If <code>Destination</code> is
  /// <code>CloudWatch</code>, do not use this parameter.
  ///
  /// This parameter specifies the ARN of the Evidently experiment that is to
  /// receive the metrics. You must have already defined this experiment as a
  /// valid destination. For more information, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_PutRumMetricsDestination.html">PutRumMetricsDestination</a>.
  Future<void> updateRumMetricDefinition({
    required String appMonitorName,
    required MetricDestination destination,
    required MetricDefinitionRequest metricDefinition,
    required String metricDefinitionId,
    String? destinationArn,
  }) async {
    final $payload = <String, dynamic>{
      'Destination': destination.toValue(),
      'MetricDefinition': metricDefinition,
      'MetricDefinitionId': metricDefinitionId,
      if (destinationArn != null) 'DestinationArn': destinationArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/rummetrics/${Uri.encodeComponent(appMonitorName)}/metrics',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// A RUM app monitor collects telemetry data from your application and sends
/// that data to RUM. The data includes performance and reliability information
/// such as page load time, client-side errors, and user behavior.
class AppMonitor {
  /// A structure that contains much of the configuration data for the app
  /// monitor.
  final AppMonitorConfiguration? appMonitorConfiguration;

  /// The date and time that this app monitor was created.
  final String? created;

  /// Specifies whether this app monitor allows the web client to define and send
  /// custom events.
  ///
  /// For more information about custom events, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-custom-events.html">Send
  /// custom events</a>.
  final CustomEvents? customEvents;

  /// A structure that contains information about whether this app monitor stores
  /// a copy of the telemetry data that RUM collects using CloudWatch Logs.
  final DataStorage? dataStorage;

  /// The top-level internet domain name for which your application has
  /// administrative authority.
  final String? domain;

  /// The unique ID of this app monitor.
  final String? id;

  /// The date and time of the most recent changes to this app monitor's
  /// configuration.
  final String? lastModified;

  /// The name of the app monitor.
  final String? name;

  /// The current state of the app monitor.
  final StateEnum? state;

  /// The list of tag keys and values associated with this app monitor.
  final Map<String, String>? tags;

  AppMonitor({
    this.appMonitorConfiguration,
    this.created,
    this.customEvents,
    this.dataStorage,
    this.domain,
    this.id,
    this.lastModified,
    this.name,
    this.state,
    this.tags,
  });

  factory AppMonitor.fromJson(Map<String, dynamic> json) {
    return AppMonitor(
      appMonitorConfiguration: json['AppMonitorConfiguration'] != null
          ? AppMonitorConfiguration.fromJson(
              json['AppMonitorConfiguration'] as Map<String, dynamic>)
          : null,
      created: json['Created'] as String?,
      customEvents: json['CustomEvents'] != null
          ? CustomEvents.fromJson(json['CustomEvents'] as Map<String, dynamic>)
          : null,
      dataStorage: json['DataStorage'] != null
          ? DataStorage.fromJson(json['DataStorage'] as Map<String, dynamic>)
          : null,
      domain: json['Domain'] as String?,
      id: json['Id'] as String?,
      lastModified: json['LastModified'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toStateEnum(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitorConfiguration = this.appMonitorConfiguration;
    final created = this.created;
    final customEvents = this.customEvents;
    final dataStorage = this.dataStorage;
    final domain = this.domain;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final state = this.state;
    final tags = this.tags;
    return {
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (created != null) 'Created': created,
      if (customEvents != null) 'CustomEvents': customEvents,
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (domain != null) 'Domain': domain,
      if (id != null) 'Id': id,
      if (lastModified != null) 'LastModified': lastModified,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

/// This structure contains much of the configuration data for the app monitor.
class AppMonitorConfiguration {
  /// If you set this to <code>true</code>, the RUM web client sets two cookies, a
  /// session cookie and a user cookie. The cookies allow the RUM web client to
  /// collect data relating to the number of users an application has and the
  /// behavior of the application across a sequence of events. Cookies are stored
  /// in the top-level domain of the current page.
  final bool? allowCookies;

  /// If you set this to <code>true</code>, RUM enables X-Ray tracing for the user
  /// sessions that RUM samples. RUM adds an X-Ray trace header to allowed HTTP
  /// requests. It also records an X-Ray segment for allowed HTTP requests. You
  /// can see traces and segments from these user sessions in the X-Ray console
  /// and the CloudWatch ServiceLens console. For more information, see <a
  /// href="https://docs.aws.amazon.com/xray/latest/devguide/aws-xray.html">What
  /// is X-Ray?</a>
  final bool? enableXRay;

  /// A list of URLs in your website or application to exclude from RUM data
  /// collection.
  ///
  /// You can't include both <code>ExcludedPages</code> and
  /// <code>IncludedPages</code> in the same operation.
  final List<String>? excludedPages;

  /// A list of pages in your application that are to be displayed with a
  /// "favorite" icon in the CloudWatch RUM console.
  final List<String>? favoritePages;

  /// The ARN of the guest IAM role that is attached to the Amazon Cognito
  /// identity pool that is used to authorize the sending of data to RUM.
  /// <note>
  /// It is possible that an app monitor does not have a value for
  /// <code>GuestRoleArn</code>. For example, this can happen when you use the
  /// console to create an app monitor and you allow CloudWatch RUM to create a
  /// new identity pool for Authorization. In this case, <code>GuestRoleArn</code>
  /// is not present in the <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_GetAppMonitor.html">GetAppMonitor</a>
  /// response because it is not stored by the service.
  ///
  /// If this issue affects you, you can take one of the following steps:
  ///
  /// <ul>
  /// <li>
  /// Use the Cloud Development Kit (CDK) to create an identity pool and the
  /// associated IAM role, and use that for your app monitor.
  /// </li>
  /// <li>
  /// Make a separate <a
  /// href="https://docs.aws.amazon.com/cognitoidentity/latest/APIReference/API_GetIdentityPoolRoles.html">GetIdentityPoolRoles</a>
  /// call to Amazon Cognito to retrieve the <code>GuestRoleArn</code>.
  /// </li>
  /// </ul> </note>
  final String? guestRoleArn;

  /// The ID of the Amazon Cognito identity pool that is used to authorize the
  /// sending of data to RUM.
  final String? identityPoolId;

  /// If this app monitor is to collect data from only certain pages in your
  /// application, this structure lists those pages.
  ///
  /// You can't include both <code>ExcludedPages</code> and
  /// <code>IncludedPages</code> in the same operation.
  final List<String>? includedPages;

  /// Specifies the portion of user sessions to use for RUM data collection.
  /// Choosing a higher portion gives you more data but also incurs more costs.
  ///
  /// The range for this value is 0 to 1 inclusive. Setting this to 1 means that
  /// 100% of user sessions are sampled, and setting it to 0.1 means that 10% of
  /// user sessions are sampled.
  ///
  /// If you omit this parameter, the default of 0.1 is used, and 10% of sessions
  /// will be sampled.
  final double? sessionSampleRate;

  /// An array that lists the types of telemetry data that this app monitor is to
  /// collect.
  ///
  /// <ul>
  /// <li>
  /// <code>errors</code> indicates that RUM collects data about unhandled
  /// JavaScript errors raised by your application.
  /// </li>
  /// <li>
  /// <code>performance</code> indicates that RUM collects performance data about
  /// how your application and its resources are loaded and rendered. This
  /// includes Core Web Vitals.
  /// </li>
  /// <li>
  /// <code>http</code> indicates that RUM collects data about HTTP errors thrown
  /// by your application.
  /// </li>
  /// </ul>
  final List<Telemetry>? telemetries;

  AppMonitorConfiguration({
    this.allowCookies,
    this.enableXRay,
    this.excludedPages,
    this.favoritePages,
    this.guestRoleArn,
    this.identityPoolId,
    this.includedPages,
    this.sessionSampleRate,
    this.telemetries,
  });

  factory AppMonitorConfiguration.fromJson(Map<String, dynamic> json) {
    return AppMonitorConfiguration(
      allowCookies: json['AllowCookies'] as bool?,
      enableXRay: json['EnableXRay'] as bool?,
      excludedPages: (json['ExcludedPages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      favoritePages: (json['FavoritePages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      guestRoleArn: json['GuestRoleArn'] as String?,
      identityPoolId: json['IdentityPoolId'] as String?,
      includedPages: (json['IncludedPages'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sessionSampleRate: json['SessionSampleRate'] as double?,
      telemetries: (json['Telemetries'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toTelemetry())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowCookies = this.allowCookies;
    final enableXRay = this.enableXRay;
    final excludedPages = this.excludedPages;
    final favoritePages = this.favoritePages;
    final guestRoleArn = this.guestRoleArn;
    final identityPoolId = this.identityPoolId;
    final includedPages = this.includedPages;
    final sessionSampleRate = this.sessionSampleRate;
    final telemetries = this.telemetries;
    return {
      if (allowCookies != null) 'AllowCookies': allowCookies,
      if (enableXRay != null) 'EnableXRay': enableXRay,
      if (excludedPages != null) 'ExcludedPages': excludedPages,
      if (favoritePages != null) 'FavoritePages': favoritePages,
      if (guestRoleArn != null) 'GuestRoleArn': guestRoleArn,
      if (identityPoolId != null) 'IdentityPoolId': identityPoolId,
      if (includedPages != null) 'IncludedPages': includedPages,
      if (sessionSampleRate != null) 'SessionSampleRate': sessionSampleRate,
      if (telemetries != null)
        'Telemetries': telemetries.map((e) => e.toValue()).toList(),
    };
  }
}

/// A structure that contains information about the RUM app monitor.
class AppMonitorDetails {
  /// The unique ID of the app monitor.
  final String? id;

  /// The name of the app monitor.
  final String? name;

  /// The version of the app monitor.
  final String? version;

  AppMonitorDetails({
    this.id,
    this.name,
    this.version,
  });

  Map<String, dynamic> toJson() {
    final id = this.id;
    final name = this.name;
    final version = this.version;
    return {
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// A structure that includes some data about app monitors and their settings.
class AppMonitorSummary {
  /// The date and time that the app monitor was created.
  final String? created;

  /// The unique ID of this app monitor.
  final String? id;

  /// The date and time of the most recent changes to this app monitor's
  /// configuration.
  final String? lastModified;

  /// The name of this app monitor.
  final String? name;

  /// The current state of this app monitor.
  final StateEnum? state;

  AppMonitorSummary({
    this.created,
    this.id,
    this.lastModified,
    this.name,
    this.state,
  });

  factory AppMonitorSummary.fromJson(Map<String, dynamic> json) {
    return AppMonitorSummary(
      created: json['Created'] as String?,
      id: json['Id'] as String?,
      lastModified: json['LastModified'] as String?,
      name: json['Name'] as String?,
      state: (json['State'] as String?)?.toStateEnum(),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final state = this.state;
    return {
      if (created != null) 'Created': created,
      if (id != null) 'Id': id,
      if (lastModified != null) 'LastModified': lastModified,
      if (name != null) 'Name': name,
      if (state != null) 'State': state.toValue(),
    };
  }
}

/// A structure that defines one error caused by a <a
/// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchCreateRumMetricsDefinitions.html">BatchCreateRumMetricsDefinitions</a>
/// operation.
class BatchCreateRumMetricDefinitionsError {
  /// The error code.
  final String errorCode;

  /// The error message for this metric definition.
  final String errorMessage;

  /// The metric definition that caused this error.
  final MetricDefinitionRequest metricDefinition;

  BatchCreateRumMetricDefinitionsError({
    required this.errorCode,
    required this.errorMessage,
    required this.metricDefinition,
  });

  factory BatchCreateRumMetricDefinitionsError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateRumMetricDefinitionsError(
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      metricDefinition: MetricDefinitionRequest.fromJson(
          json['MetricDefinition'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final metricDefinition = this.metricDefinition;
    return {
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'MetricDefinition': metricDefinition,
    };
  }
}

class BatchCreateRumMetricDefinitionsResponse {
  /// An array of error objects, if the operation caused any errors.
  final List<BatchCreateRumMetricDefinitionsError> errors;

  /// An array of structures that define the extended metrics.
  final List<MetricDefinition>? metricDefinitions;

  BatchCreateRumMetricDefinitionsResponse({
    required this.errors,
    this.metricDefinitions,
  });

  factory BatchCreateRumMetricDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateRumMetricDefinitionsResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchCreateRumMetricDefinitionsError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      metricDefinitions: (json['MetricDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final metricDefinitions = this.metricDefinitions;
    return {
      'Errors': errors,
      if (metricDefinitions != null) 'MetricDefinitions': metricDefinitions,
    };
  }
}

/// A structure that defines one error caused by a <a
/// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchDeleteRumMetricsDefinitions.html">BatchCreateRumMetricsDefinitions</a>
/// operation.
class BatchDeleteRumMetricDefinitionsError {
  /// The error code.
  final String errorCode;

  /// The error message for this metric definition.
  final String errorMessage;

  /// The ID of the metric definition that caused this error.
  final String metricDefinitionId;

  BatchDeleteRumMetricDefinitionsError({
    required this.errorCode,
    required this.errorMessage,
    required this.metricDefinitionId,
  });

  factory BatchDeleteRumMetricDefinitionsError.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteRumMetricDefinitionsError(
      errorCode: json['ErrorCode'] as String,
      errorMessage: json['ErrorMessage'] as String,
      metricDefinitionId: json['MetricDefinitionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final metricDefinitionId = this.metricDefinitionId;
    return {
      'ErrorCode': errorCode,
      'ErrorMessage': errorMessage,
      'MetricDefinitionId': metricDefinitionId,
    };
  }
}

class BatchDeleteRumMetricDefinitionsResponse {
  /// An array of error objects, if the operation caused any errors.
  final List<BatchDeleteRumMetricDefinitionsError> errors;

  /// The IDs of the metric definitions that were deleted.
  final List<String>? metricDefinitionIds;

  BatchDeleteRumMetricDefinitionsResponse({
    required this.errors,
    this.metricDefinitionIds,
  });

  factory BatchDeleteRumMetricDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDeleteRumMetricDefinitionsResponse(
      errors: (json['Errors'] as List)
          .whereNotNull()
          .map((e) => BatchDeleteRumMetricDefinitionsError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      metricDefinitionIds: (json['MetricDefinitionIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final metricDefinitionIds = this.metricDefinitionIds;
    return {
      'Errors': errors,
      if (metricDefinitionIds != null)
        'MetricDefinitionIds': metricDefinitionIds,
    };
  }
}

class BatchGetRumMetricDefinitionsResponse {
  /// An array of structures that display information about the metrics that are
  /// sent by the specified app monitor to the specified destination.
  final List<MetricDefinition>? metricDefinitions;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  BatchGetRumMetricDefinitionsResponse({
    this.metricDefinitions,
    this.nextToken,
  });

  factory BatchGetRumMetricDefinitionsResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchGetRumMetricDefinitionsResponse(
      metricDefinitions: (json['MetricDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => MetricDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDefinitions = this.metricDefinitions;
    final nextToken = this.nextToken;
    return {
      if (metricDefinitions != null) 'MetricDefinitions': metricDefinitions,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class CreateAppMonitorResponse {
  /// The unique ID of the new app monitor.
  final String? id;

  CreateAppMonitorResponse({
    this.id,
  });

  factory CreateAppMonitorResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppMonitorResponse(
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    return {
      if (id != null) 'Id': id,
    };
  }
}

/// A structure that contains information about custom events for this app
/// monitor.
class CustomEvents {
  /// Specifies whether this app monitor allows the web client to define and send
  /// custom events. The default is for custom events to be <code>DISABLED</code>.
  final CustomEventsStatus? status;

  CustomEvents({
    this.status,
  });

  factory CustomEvents.fromJson(Map<String, dynamic> json) {
    return CustomEvents(
      status: (json['Status'] as String?)?.toCustomEventsStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum CustomEventsStatus {
  enabled,
  disabled,
}

extension CustomEventsStatusValueExtension on CustomEventsStatus {
  String toValue() {
    switch (this) {
      case CustomEventsStatus.enabled:
        return 'ENABLED';
      case CustomEventsStatus.disabled:
        return 'DISABLED';
    }
  }
}

extension CustomEventsStatusFromString on String {
  CustomEventsStatus toCustomEventsStatus() {
    switch (this) {
      case 'ENABLED':
        return CustomEventsStatus.enabled;
      case 'DISABLED':
        return CustomEventsStatus.disabled;
    }
    throw Exception('$this is not known in enum CustomEventsStatus');
  }
}

/// A structure that contains the information about whether the app monitor
/// stores copies of the data that RUM collects in CloudWatch Logs. If it does,
/// this structure also contains the name of the log group.
class CwLog {
  /// Indicated whether the app monitor stores copies of the data that RUM
  /// collects in CloudWatch Logs.
  final bool? cwLogEnabled;

  /// The name of the log group where the copies are stored.
  final String? cwLogGroup;

  CwLog({
    this.cwLogEnabled,
    this.cwLogGroup,
  });

  factory CwLog.fromJson(Map<String, dynamic> json) {
    return CwLog(
      cwLogEnabled: json['CwLogEnabled'] as bool?,
      cwLogGroup: json['CwLogGroup'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cwLogEnabled = this.cwLogEnabled;
    final cwLogGroup = this.cwLogGroup;
    return {
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (cwLogGroup != null) 'CwLogGroup': cwLogGroup,
    };
  }
}

/// A structure that contains information about whether this app monitor stores
/// a copy of the telemetry data that RUM collects using CloudWatch Logs.
class DataStorage {
  /// A structure that contains the information about whether the app monitor
  /// stores copies of the data that RUM collects in CloudWatch Logs. If it does,
  /// this structure also contains the name of the log group.
  final CwLog? cwLog;

  DataStorage({
    this.cwLog,
  });

  factory DataStorage.fromJson(Map<String, dynamic> json) {
    return DataStorage(
      cwLog: json['CwLog'] != null
          ? CwLog.fromJson(json['CwLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cwLog = this.cwLog;
    return {
      if (cwLog != null) 'CwLog': cwLog,
    };
  }
}

class DeleteAppMonitorResponse {
  DeleteAppMonitorResponse();

  factory DeleteAppMonitorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAppMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRumMetricsDestinationResponse {
  DeleteRumMetricsDestinationResponse();

  factory DeleteRumMetricsDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRumMetricsDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GetAppMonitorDataResponse {
  /// The events that RUM collected that match your request.
  final List<String>? events;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  GetAppMonitorDataResponse({
    this.events,
    this.nextToken,
  });

  factory GetAppMonitorDataResponse.fromJson(Map<String, dynamic> json) {
    return GetAppMonitorDataResponse(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      if (events != null) 'Events': events,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetAppMonitorResponse {
  /// A structure containing all the configuration information for the app
  /// monitor.
  final AppMonitor? appMonitor;

  GetAppMonitorResponse({
    this.appMonitor,
  });

  factory GetAppMonitorResponse.fromJson(Map<String, dynamic> json) {
    return GetAppMonitorResponse(
      appMonitor: json['AppMonitor'] != null
          ? AppMonitor.fromJson(json['AppMonitor'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitor = this.appMonitor;
    return {
      if (appMonitor != null) 'AppMonitor': appMonitor,
    };
  }
}

class ListAppMonitorsResponse {
  /// An array of structures that contain information about the returned app
  /// monitors.
  final List<AppMonitorSummary>? appMonitorSummaries;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  ListAppMonitorsResponse({
    this.appMonitorSummaries,
    this.nextToken,
  });

  factory ListAppMonitorsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppMonitorsResponse(
      appMonitorSummaries: (json['AppMonitorSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => AppMonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitorSummaries = this.appMonitorSummaries;
    final nextToken = this.nextToken;
    return {
      if (appMonitorSummaries != null)
        'AppMonitorSummaries': appMonitorSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListRumMetricsDestinationsResponse {
  /// The list of CloudWatch RUM extended metrics destinations associated with the
  /// app monitor that you specified.
  final List<MetricDestinationSummary>? destinations;

  /// A token that you can use in a subsequent operation to retrieve the next set
  /// of results.
  final String? nextToken;

  ListRumMetricsDestinationsResponse({
    this.destinations,
    this.nextToken,
  });

  factory ListRumMetricsDestinationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRumMetricsDestinationsResponse(
      destinations: (json['Destinations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MetricDestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinations = this.destinations;
    final nextToken = this.nextToken;
    return {
      if (destinations != null) 'Destinations': destinations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The ARN of the resource that you are viewing.
  final String resourceArn;

  /// The list of tag keys and values associated with the resource you specified.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.resourceArn,
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      resourceArn: json['ResourceArn'] as String,
      tags: (json['Tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final tags = this.tags;
    return {
      'ResourceArn': resourceArn,
      'Tags': tags,
    };
  }
}

/// A structure that displays the definition of one extended metric that RUM
/// sends to CloudWatch or CloudWatch Evidently. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-vended-metrics.html">
/// Additional metrics that you can send to CloudWatch and CloudWatch
/// Evidently</a>.
class MetricDefinition {
  /// The ID of this metric definition.
  final String metricDefinitionId;

  /// The name of the metric that is defined in this structure.
  final String name;

  /// This field is a map of field paths to dimension names. It defines the
  /// dimensions to associate with this metric in CloudWatch The value of this
  /// field is used only if the metric destination is <code>CloudWatch</code>. If
  /// the metric destination is <code>Evidently</code>, the value of
  /// <code>DimensionKeys</code> is ignored.
  final Map<String, String>? dimensionKeys;

  /// The pattern that defines the metric. RUM checks events that happen in a
  /// user's session against the pattern, and events that match the pattern are
  /// sent to the metric destination.
  ///
  /// If the metrics destination is <code>CloudWatch</code> and the event also
  /// matches a value in <code>DimensionKeys</code>, then the metric is published
  /// with the specified dimensions.
  final String? eventPattern;

  /// If this metric definition is for a custom metric instead of an extended
  /// metric, this field displays the metric namespace that the custom metric is
  /// published to.
  final String? namespace;

  /// Use this field only if you are sending this metric to CloudWatch. It defines
  /// the CloudWatch metric unit that this metric is measured in.
  final String? unitLabel;

  /// The field within the event object that the metric value is sourced from.
  final String? valueKey;

  MetricDefinition({
    required this.metricDefinitionId,
    required this.name,
    this.dimensionKeys,
    this.eventPattern,
    this.namespace,
    this.unitLabel,
    this.valueKey,
  });

  factory MetricDefinition.fromJson(Map<String, dynamic> json) {
    return MetricDefinition(
      metricDefinitionId: json['MetricDefinitionId'] as String,
      name: json['Name'] as String,
      dimensionKeys: (json['DimensionKeys'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      eventPattern: json['EventPattern'] as String?,
      namespace: json['Namespace'] as String?,
      unitLabel: json['UnitLabel'] as String?,
      valueKey: json['ValueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final metricDefinitionId = this.metricDefinitionId;
    final name = this.name;
    final dimensionKeys = this.dimensionKeys;
    final eventPattern = this.eventPattern;
    final namespace = this.namespace;
    final unitLabel = this.unitLabel;
    final valueKey = this.valueKey;
    return {
      'MetricDefinitionId': metricDefinitionId,
      'Name': name,
      if (dimensionKeys != null) 'DimensionKeys': dimensionKeys,
      if (eventPattern != null) 'EventPattern': eventPattern,
      if (namespace != null) 'Namespace': namespace,
      if (unitLabel != null) 'UnitLabel': unitLabel,
      if (valueKey != null) 'ValueKey': valueKey,
    };
  }
}

/// Use this structure to define one extended metric or custom metric that RUM
/// will send to CloudWatch or CloudWatch Evidently. For more information, see
/// <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-custom-and-extended-metrics.html">
/// Custom metrics and extended metrics that you can send to CloudWatch and
/// CloudWatch Evidently</a>.
///
/// This structure is validated differently for extended metrics and custom
/// metrics. For extended metrics that are sent to the <code>AWS/RUM</code>
/// namespace, the following validations apply:
///
/// <ul>
/// <li>
/// The <code>Namespace</code> parameter must be omitted or set to
/// <code>AWS/RUM</code>.
/// </li>
/// <li>
/// Only certain combinations of values for <code>Name</code>,
/// <code>ValueKey</code>, and <code>EventPattern</code> are valid. In addition
/// to what is displayed in the following list, the <code>EventPattern</code>
/// can also include information used by the <code>DimensionKeys</code> field.
///
/// <ul>
/// <li>
/// If <code>Name</code> is <code>PerformanceNavigationDuration</code>, then
/// <code>ValueKey</code>must be <code>event_details.duration</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":["com.amazon.rum.performance_navigation_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>PerformanceResourceDuration</code>, then
/// <code>ValueKey</code>must be <code>event_details.duration</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":["com.amazon.rum.performance_resource_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>NavigationSatisfiedTransaction</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{ "event_type":
/// ["com.amazon.rum.performance_navigation_event"], "event_details": {
/// "duration": [{ "numeric": ["&gt;",2000] }] } }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>NavigationToleratedTransaction</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{ "event_type":
/// ["com.amazon.rum.performance_navigation_event"], "event_details": {
/// "duration": [{ "numeric": ["&gt;=",2000,"&lt;"8000] }] } }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>NavigationFrustratedTransaction</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{ "event_type":
/// ["com.amazon.rum.performance_navigation_event"], "event_details": {
/// "duration": [{ "numeric": ["&gt;=",8000] }] } }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>WebVitalsCumulativeLayoutShift</code>, then
/// <code>ValueKey</code>must be <code>event_details.value</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":["com.amazon.rum.cumulative_layout_shift_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>WebVitalsFirstInputDelay</code>, then
/// <code>ValueKey</code>must be <code>event_details.value</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":["com.amazon.rum.first_input_delay_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>WebVitalsLargestContentfulPaint</code>, then
/// <code>ValueKey</code>must be <code>event_details.value</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":["com.amazon.rum.largest_contentful_paint_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>JsErrorCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":["com.amazon.rum.js_error_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>HttpErrorCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":["com.amazon.rum.http_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>SessionCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":["com.amazon.rum.session_start_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>PageViewCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":["com.amazon.rum.page_view_event"]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>Http4xxCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":
/// ["com.amazon.rum.http_event"],"event_details":{"response":{"status":[{"numeric":["&gt;=",400,"&lt;",500]}]}}}
/// }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>Http5xxCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":
/// ["com.amazon.rum.http_event"],"event_details":{"response":{"status":[{"numeric":["&gt;=",500,"&lt;=",599]}]}}}
/// }</code>
/// </li>
/// </ul> </li>
/// </ul>
/// For custom metrics, the following validation rules apply:
///
/// <ul>
/// <li>
/// The namespace can't be omitted and can't be <code>AWS/RUM</code>. You can
/// use the <code>AWS/RUM</code> namespace only for extended metrics.
/// </li>
/// <li>
/// All dimensions listed in the <code>DimensionKeys</code> field must be
/// present in the value of <code>EventPattern</code>.
/// </li>
/// <li>
/// The values that you specify for <code>ValueKey</code>,
/// <code>EventPattern</code>, and <code>DimensionKeys</code> must be fields in
/// RUM events, so all first-level keys in these fields must be one of the keys
/// in the list later in this section.
/// </li>
/// <li>
/// If you set a value for <code>EventPattern</code>, it must be a JSON object.
/// </li>
/// <li>
/// For every non-empty <code>event_details</code>, there must be a non-empty
/// <code>event_type</code>.
/// </li>
/// <li>
/// If <code>EventPattern</code> contains an <code>event_details</code> field,
/// it must also contain an <code>event_type</code>. For every built-in
/// <code>event_type</code> that you use, you must use a value for
/// <code>event_details</code> that corresponds to that <code>event_type</code>.
/// For information about event details that correspond to event types, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-datacollected.html#CloudWatch-RUM-datacollected-eventDetails">
/// RUM event details</a>.
/// </li>
/// <li>
/// In <code>EventPattern</code>, any JSON array must contain only one value.
/// </li>
/// </ul>
/// Valid key values for first-level keys in the <code>ValueKey</code>,
/// <code>EventPattern</code>, and <code>DimensionKeys</code> fields:
///
/// <ul>
/// <li>
/// <code>account_id</code>
/// </li>
/// <li>
/// <code>application_Id</code>
/// </li>
/// <li>
/// <code>application_version</code>
/// </li>
/// <li>
/// <code>application_name</code>
/// </li>
/// <li>
/// <code>batch_id</code>
/// </li>
/// <li>
/// <code>event_details</code>
/// </li>
/// <li>
/// <code>event_id</code>
/// </li>
/// <li>
/// <code>event_interaction</code>
/// </li>
/// <li>
/// <code>event_timestamp</code>
/// </li>
/// <li>
/// <code>event_type</code>
/// </li>
/// <li>
/// <code>event_version</code>
/// </li>
/// <li>
/// <code>log_stream</code>
/// </li>
/// <li>
/// <code>metadata</code>
/// </li>
/// <li>
/// <code>sessionId</code>
/// </li>
/// <li>
/// <code>user_details</code>
/// </li>
/// <li>
/// <code>userId</code>
/// </li>
/// </ul>
class MetricDefinitionRequest {
  /// The name for the metric that is defined in this structure. For custom
  /// metrics, you can specify any name that you like. For extended metrics, valid
  /// values are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>PerformanceNavigationDuration</code>
  /// </li>
  /// <li>
  /// <code>PerformanceResourceDuration </code>
  /// </li>
  /// <li>
  /// <code>NavigationSatisfiedTransaction</code>
  /// </li>
  /// <li>
  /// <code>NavigationToleratedTransaction</code>
  /// </li>
  /// <li>
  /// <code>NavigationFrustratedTransaction</code>
  /// </li>
  /// <li>
  /// <code>WebVitalsCumulativeLayoutShift</code>
  /// </li>
  /// <li>
  /// <code>WebVitalsFirstInputDelay</code>
  /// </li>
  /// <li>
  /// <code>WebVitalsLargestContentfulPaint</code>
  /// </li>
  /// <li>
  /// <code>JsErrorCount</code>
  /// </li>
  /// <li>
  /// <code>HttpErrorCount</code>
  /// </li>
  /// <li>
  /// <code>SessionCount</code>
  /// </li>
  /// </ul>
  final String name;

  /// Use this field only if you are sending the metric to CloudWatch.
  ///
  /// This field is a map of field paths to dimension names. It defines the
  /// dimensions to associate with this metric in CloudWatch. For extended
  /// metrics, valid values for the entries in this field are the following:
  ///
  /// <ul>
  /// <li>
  /// <code>"metadata.pageId": "PageId"</code>
  /// </li>
  /// <li>
  /// <code>"metadata.browserName": "BrowserName"</code>
  /// </li>
  /// <li>
  /// <code>"metadata.deviceType": "DeviceType"</code>
  /// </li>
  /// <li>
  /// <code>"metadata.osName": "OSName"</code>
  /// </li>
  /// <li>
  /// <code>"metadata.countryCode": "CountryCode"</code>
  /// </li>
  /// <li>
  /// <code>"event_details.fileType": "FileType"</code>
  /// </li>
  /// </ul>
  /// For both extended metrics and custom metrics, all dimensions listed in this
  /// field must also be included in <code>EventPattern</code>.
  final Map<String, String>? dimensionKeys;

  /// The pattern that defines the metric, specified as a JSON object. RUM checks
  /// events that happen in a user's session against the pattern, and events that
  /// match the pattern are sent to the metric destination.
  ///
  /// When you define extended metrics, the metric definition is not valid if
  /// <code>EventPattern</code> is omitted.
  ///
  /// Example event patterns:
  ///
  /// <ul>
  /// <li>
  /// <code>'{ "event_type": ["com.amazon.rum.js_error_event"], "metadata": {
  /// "browserName": [ "Chrome", "Safari" ], } }'</code>
  /// </li>
  /// <li>
  /// <code>'{ "event_type": ["com.amazon.rum.performance_navigation_event"],
  /// "metadata": { "browserName": [ "Chrome", "Firefox" ] }, "event_details": {
  /// "duration": [{ "numeric": [ "&lt;", 2000 ] }] } }'</code>
  /// </li>
  /// <li>
  /// <code>'{ "event_type": ["com.amazon.rum.performance_navigation_event"],
  /// "metadata": { "browserName": [ "Chrome", "Safari" ], "countryCode": [ "US" ]
  /// }, "event_details": { "duration": [{ "numeric": [ "&gt;=", 2000, "&lt;",
  /// 8000 ] }] } }'</code>
  /// </li>
  /// </ul>
  /// If the metrics destination is <code>CloudWatch</code> and the event also
  /// matches a value in <code>DimensionKeys</code>, then the metric is published
  /// with the specified dimensions.
  final String? eventPattern;

  /// If this structure is for a custom metric instead of an extended metrics, use
  /// this parameter to define the metric namespace for that custom metric. Do not
  /// specify this parameter if this structure is for an extended metric.
  ///
  /// You cannot use any string that starts with <code>AWS/</code> for your
  /// namespace.
  final String? namespace;

  /// The CloudWatch metric unit to use for this metric. If you omit this field,
  /// the metric is recorded with no unit.
  final String? unitLabel;

  /// The field within the event object that the metric value is sourced from.
  ///
  /// If you omit this field, a hardcoded value of 1 is pushed as the metric
  /// value. This is useful if you want to count the number of events that the
  /// filter catches.
  ///
  /// If this metric is sent to CloudWatch Evidently, this field will be passed to
  /// Evidently raw. Evidently will handle data extraction from the event.
  final String? valueKey;

  MetricDefinitionRequest({
    required this.name,
    this.dimensionKeys,
    this.eventPattern,
    this.namespace,
    this.unitLabel,
    this.valueKey,
  });

  factory MetricDefinitionRequest.fromJson(Map<String, dynamic> json) {
    return MetricDefinitionRequest(
      name: json['Name'] as String,
      dimensionKeys: (json['DimensionKeys'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      eventPattern: json['EventPattern'] as String?,
      namespace: json['Namespace'] as String?,
      unitLabel: json['UnitLabel'] as String?,
      valueKey: json['ValueKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final dimensionKeys = this.dimensionKeys;
    final eventPattern = this.eventPattern;
    final namespace = this.namespace;
    final unitLabel = this.unitLabel;
    final valueKey = this.valueKey;
    return {
      'Name': name,
      if (dimensionKeys != null) 'DimensionKeys': dimensionKeys,
      if (eventPattern != null) 'EventPattern': eventPattern,
      if (namespace != null) 'Namespace': namespace,
      if (unitLabel != null) 'UnitLabel': unitLabel,
      if (valueKey != null) 'ValueKey': valueKey,
    };
  }
}

enum MetricDestination {
  cloudWatch,
  evidently,
}

extension MetricDestinationValueExtension on MetricDestination {
  String toValue() {
    switch (this) {
      case MetricDestination.cloudWatch:
        return 'CloudWatch';
      case MetricDestination.evidently:
        return 'Evidently';
    }
  }
}

extension MetricDestinationFromString on String {
  MetricDestination toMetricDestination() {
    switch (this) {
      case 'CloudWatch':
        return MetricDestination.cloudWatch;
      case 'Evidently':
        return MetricDestination.evidently;
    }
    throw Exception('$this is not known in enum MetricDestination');
  }
}

/// A structure that displays information about one destination that CloudWatch
/// RUM sends extended metrics to.
class MetricDestinationSummary {
  /// Specifies whether the destination is <code>CloudWatch</code> or
  /// <code>Evidently</code>.
  final MetricDestination? destination;

  /// If the destination is <code>Evidently</code>, this specifies the ARN of the
  /// Evidently experiment that receives the metrics.
  final String? destinationArn;

  /// This field appears only when the destination is <code>Evidently</code>. It
  /// specifies the ARN of the IAM role that is used to write to the Evidently
  /// experiment that receives the metrics.
  final String? iamRoleArn;

  MetricDestinationSummary({
    this.destination,
    this.destinationArn,
    this.iamRoleArn,
  });

  factory MetricDestinationSummary.fromJson(Map<String, dynamic> json) {
    return MetricDestinationSummary(
      destination: (json['Destination'] as String?)?.toMetricDestination(),
      destinationArn: json['DestinationArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationArn = this.destinationArn;
    final iamRoleArn = this.iamRoleArn;
    return {
      if (destination != null) 'Destination': destination.toValue(),
      if (destinationArn != null) 'DestinationArn': destinationArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
  }
}

class PutRumEventsResponse {
  PutRumEventsResponse();

  factory PutRumEventsResponse.fromJson(Map<String, dynamic> _) {
    return PutRumEventsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutRumMetricsDestinationResponse {
  PutRumMetricsDestinationResponse();

  factory PutRumMetricsDestinationResponse.fromJson(Map<String, dynamic> _) {
    return PutRumMetricsDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that defines a key and values that you can use to filter the
/// results. The only performance events that are returned are those that have
/// values matching the ones that you specify in one of your
/// <code>QueryFilter</code> structures.
///
/// For example, you could specify <code>Browser</code> as the <code>Name</code>
/// and specify <code>Chrome,Firefox</code> as the <code>Values</code> to return
/// events generated only from those browsers.
///
/// Specifying <code>Invert</code> as the <code>Name</code> works as a "not
/// equal to" filter. For example, specify <code>Invert</code> as the
/// <code>Name</code> and specify <code>Chrome</code> as the value to return all
/// events except events from user sessions with the Chrome browser.
class QueryFilter {
  /// The name of a key to search for. The filter returns only the events that
  /// match the <code>Name</code> and <code>Values</code> that you specify.
  ///
  /// Valid values for <code>Name</code> are <code>Browser</code> |
  /// <code>Device</code> | <code>Country</code> | <code>Page</code> |
  /// <code>OS</code> | <code>EventType</code> | <code>Invert</code>
  final String? name;

  /// The values of the <code>Name</code> that are to be be included in the
  /// returned results.
  final List<String>? values;

  QueryFilter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (values != null) 'Values': values,
    };
  }
}

/// A structure that contains the information for one performance event that RUM
/// collects from a user session with your application.
class RumEvent {
  /// A string containing details about the event.
  final Object details;

  /// A unique ID for this event.
  final String id;

  /// The exact time that this event occurred.
  final DateTime timestamp;

  /// The JSON schema that denotes the type of event this is, such as a page load
  /// or a new session.
  final String type;

  /// Metadata about this event, which contains a JSON serialization of the
  /// identity of the user for this session. The user information comes from
  /// information such as the HTTP user-agent request header and document
  /// interface.
  final Object? metadata;

  RumEvent({
    required this.details,
    required this.id,
    required this.timestamp,
    required this.type,
    this.metadata,
  });

  Map<String, dynamic> toJson() {
    final details = this.details;
    final id = this.id;
    final timestamp = this.timestamp;
    final type = this.type;
    final metadata = this.metadata;
    return {
      'details': jsonEncode(details),
      'id': id,
      'timestamp': unixTimestampToJson(timestamp),
      'type': type,
      if (metadata != null) 'metadata': jsonEncode(metadata),
    };
  }
}

enum StateEnum {
  created,
  deleting,
  active,
}

extension StateEnumValueExtension on StateEnum {
  String toValue() {
    switch (this) {
      case StateEnum.created:
        return 'CREATED';
      case StateEnum.deleting:
        return 'DELETING';
      case StateEnum.active:
        return 'ACTIVE';
    }
  }
}

extension StateEnumFromString on String {
  StateEnum toStateEnum() {
    switch (this) {
      case 'CREATED':
        return StateEnum.created;
      case 'DELETING':
        return StateEnum.deleting;
      case 'ACTIVE':
        return StateEnum.active;
    }
    throw Exception('$this is not known in enum StateEnum');
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

enum Telemetry {
  errors,
  performance,
  http,
}

extension TelemetryValueExtension on Telemetry {
  String toValue() {
    switch (this) {
      case Telemetry.errors:
        return 'errors';
      case Telemetry.performance:
        return 'performance';
      case Telemetry.http:
        return 'http';
    }
  }
}

extension TelemetryFromString on String {
  Telemetry toTelemetry() {
    switch (this) {
      case 'errors':
        return Telemetry.errors;
      case 'performance':
        return Telemetry.performance;
      case 'http':
        return Telemetry.http;
    }
    throw Exception('$this is not known in enum Telemetry');
  }
}

/// A structure that defines the time range that you want to retrieve results
/// from.
class TimeRange {
  /// The beginning of the time range to retrieve performance events from.
  final int after;

  /// The end of the time range to retrieve performance events from. If you omit
  /// this, the time range extends to the time that this operation is performed.
  final int? before;

  TimeRange({
    required this.after,
    this.before,
  });

  Map<String, dynamic> toJson() {
    final after = this.after;
    final before = this.before;
    return {
      'After': after,
      if (before != null) 'Before': before,
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

class UpdateAppMonitorResponse {
  UpdateAppMonitorResponse();

  factory UpdateAppMonitorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAppMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateRumMetricDefinitionResponse {
  UpdateRumMetricDefinitionResponse();

  factory UpdateRumMetricDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRumMetricDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A structure that contains information about the user session that this batch
/// of events was collected from.
class UserDetails {
  /// The session ID that the performance events are from.
  final String? sessionId;

  /// The ID of the user for this user session. This ID is generated by RUM and
  /// does not include any personally identifiable information about the user.
  final String? userId;

  UserDetails({
    this.sessionId,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    final sessionId = this.sessionId;
    final userId = this.userId;
    return {
      if (sessionId != null) 'sessionId': sessionId,
      if (userId != null) 'userId': userId,
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
