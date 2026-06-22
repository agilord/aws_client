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
class Rum {
  final _s.RestJsonProtocol _protocol;
  factory Rum({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
    bool disableHostPrefix = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'rum',
    );
    return Rum._(
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
        disableHostPrefix: disableHostPrefix,
      ),
    );
  }
  Rum._({
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

  /// Displays the tags associated with a CloudWatch RUM resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  ///
  /// Parameter [alias] :
  /// If the app monitor uses a resource-based policy that requires
  /// <code>PutRumEvents</code> requests to specify a certain alias, specify
  /// that alias here. This alias will be compared to the <code>rum:alias</code>
  /// context key in the resource-based policy. For more information, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-resource-policies.html">Using
  /// resource-based policies with CloudWatch RUM</a>.
  Future<void> putRumEvents({
    required AppMonitorDetails appMonitorDetails,
    required String batchId,
    required String id,
    required List<RumEvent> rumEvents,
    required UserDetails userDetails,
    String? alias,
  }) async {
    final $payload = <String, dynamic>{
      'AppMonitorDetails': appMonitorDetails,
      'BatchId': batchId,
      'RumEvents': rumEvents,
      'UserDetails': userDetails,
      if (alias != null) 'Alias': alias,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/appmonitors/${Uri.encodeComponent(id)}/',
      hostPrefix: 'dataplane.',
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
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

  /// Retrieves the complete configuration information for one app monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [deobfuscationConfiguration] :
  /// A structure that contains the configuration for how an app monitor can
  /// deobfuscate stack traces.
  ///
  /// Parameter [domain] :
  /// The top-level internet domain name for which your application has
  /// administrative authority.
  ///
  /// Parameter [domainList] :
  /// List the domain names for which your application has administrative
  /// authority. The <code>UpdateAppMonitor</code> allows either the domain or
  /// the domain list.
  Future<void> updateAppMonitor({
    required String name,
    AppMonitorConfiguration? appMonitorConfiguration,
    CustomEvents? customEvents,
    bool? cwLogEnabled,
    DeobfuscationConfiguration? deobfuscationConfiguration,
    String? domain,
    List<String>? domainList,
  }) async {
    final $payload = <String, dynamic>{
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (customEvents != null) 'CustomEvents': customEvents,
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (deobfuscationConfiguration != null)
        'DeobfuscationConfiguration': deobfuscationConfiguration,
      if (domain != null) 'Domain': domain,
      if (domainList != null) 'DomainList': domainList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an existing app monitor. This immediately stops the collection of
  /// data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Returns a list of the Amazon CloudWatch RUM app monitors in the account.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'Destination': destination.value,
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'destination': [destination.value],
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
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
      'destination': [destination.value],
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
  /// Parameter [deobfuscationConfiguration] :
  /// A structure that contains the configuration for how an app monitor can
  /// deobfuscate stack traces.
  ///
  /// Parameter [domain] :
  /// The top-level internet domain name for which your application has
  /// administrative authority.
  ///
  /// Parameter [domainList] :
  /// List the domain names for which your application has administrative
  /// authority. The <code>CreateAppMonitor</code> requires either the domain or
  /// the domain list.
  ///
  /// Parameter [platform] :
  /// The platform type for the app monitor. Valid values are <code>Web</code>
  /// for web applications, <code>Android</code> for Android applications, and
  /// <code>iOS</code> for IOS applications. If you omit this parameter, the
  /// default is <code>Web</code>.
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
    required String name,
    AppMonitorConfiguration? appMonitorConfiguration,
    CustomEvents? customEvents,
    bool? cwLogEnabled,
    DeobfuscationConfiguration? deobfuscationConfiguration,
    String? domain,
    List<String>? domainList,
    AppMonitorPlatform? platform,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (customEvents != null) 'CustomEvents': customEvents,
      if (cwLogEnabled != null) 'CwLogEnabled': cwLogEnabled,
      if (deobfuscationConfiguration != null)
        'DeobfuscationConfiguration': deobfuscationConfiguration,
      if (domain != null) 'Domain': domain,
      if (domainList != null) 'DomainList': domainList,
      if (platform != null) 'Platform': platform.value,
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

  /// Removes the association of a resource-based policy from an app monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidPolicyRevisionIdException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The app monitor that you want to remove the resource policy from.
  ///
  /// Parameter [policyRevisionId] :
  /// Specifies a specific policy revision to delete. Provide a
  /// <code>PolicyRevisionId</code> to ensure an atomic delete operation. If the
  /// revision ID that you provide doesn't match the latest policy revision ID,
  /// the request will be rejected with an
  /// <code>InvalidPolicyRevisionIdException</code> error.
  Future<DeleteResourcePolicyResponse> deleteResourcePolicy({
    required String name,
    String? policyRevisionId,
  }) async {
    final $query = <String, List<String>>{
      if (policyRevisionId != null) 'policyRevisionId': [policyRevisionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}/policy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourcePolicyResponse.fromJson(response);
  }

  /// Deletes a destination for CloudWatch RUM extended metrics, so that the
  /// specified app monitor stops sending extended metrics to that destination.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'destination': [destination.value],
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

  /// Retrieves the raw performance events that RUM has collected from your web
  /// application, so that you can do your own processing or analysis of this
  /// data.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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

  /// Use this operation to retrieve information about a resource-based policy
  /// that is attached to an app monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PolicyNotFoundException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor that is associated with the resource-based
  /// policy that you want to view.
  Future<GetResourcePolicyResponse> getResourcePolicy({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePolicyResponse.fromJson(response);
  }

  /// Returns a list of destinations that you have created to receive RUM
  /// extended metrics, for the specified app monitor.
  ///
  /// For more information about extended metrics, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_AddRumMetrcs.html">AddRumMetrics</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Use this operation to assign a resource-based policy to a CloudWatch RUM
  /// app monitor to control access to it. Each app monitor can have one
  /// resource-based policy. The maximum size of the policy is 4 KB. To learn
  /// more about using resource policies with RUM, see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-resource-policies.html">Using
  /// resource-based policies with CloudWatch RUM</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [InvalidPolicyRevisionIdException].
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [PolicySizeLimitExceededException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name of the app monitor that you want to apply this resource-based
  /// policy to. To find the names of your app monitors, you can use the <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_ListAppMonitors.html">ListAppMonitors</a>
  /// operation.
  ///
  /// Parameter [policyDocument] :
  /// The JSON to use as the resource policy. The document can be up to 4 KB in
  /// size. For more information about the contents and syntax for this policy,
  /// see <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-resource-policies.html">Using
  /// resource-based policies with CloudWatch RUM</a>.
  ///
  /// Parameter [policyRevisionId] :
  /// A string value that you can use to conditionally update your policy. You
  /// can provide the revision ID of your existing policy to make mutating
  /// requests against that policy.
  ///
  /// When you assign a policy revision ID, then later requests about that
  /// policy will be rejected with an
  /// <code>InvalidPolicyRevisionIdException</code> error if they don't provide
  /// the correct current revision ID.
  Future<PutResourcePolicyResponse> putResourcePolicy({
    required String name,
    required String policyDocument,
    String? policyRevisionId,
  }) async {
    final $payload = <String, dynamic>{
      'PolicyDocument': policyDocument,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/appmonitor/${Uri.encodeComponent(name)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyResponse.fromJson(response);
  }

  /// Creates or updates a destination to receive extended metrics from
  /// CloudWatch RUM. You can send extended metrics to CloudWatch or to a
  /// CloudWatch Evidently experiment.
  ///
  /// For more information about extended metrics, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchCreateRumMetricDefinitions.html">BatchCreateRumMetricDefinitions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'Destination': destination.value,
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

  /// Modifies one existing metric definition for CloudWatch RUM extended
  /// metrics. For more information about extended metrics, see <a
  /// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchCreateRumMetricsDefinitions.html">BatchCreateRumMetricsDefinitions</a>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
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
      'Destination': destination.value,
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

/// @nodoc
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
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      tags:
          ((json['Tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
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

/// @nodoc
class PutRumEventsResponse {
  PutRumEventsResponse();

  factory PutRumEventsResponse.fromJson(Map<String, dynamic> _) {
    return PutRumEventsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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

/// @nodoc
class UpdateAppMonitorResponse {
  UpdateAppMonitorResponse();

  factory UpdateAppMonitorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAppMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class DeleteAppMonitorResponse {
  DeleteAppMonitorResponse();

  factory DeleteAppMonitorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAppMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchCreateRumMetricDefinitionsError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      metricDefinitions: (json['MetricDefinitions'] as List?)
          ?.nonNulls
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

/// @nodoc
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
      errors: ((json['Errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchDeleteRumMetricDefinitionsError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      metricDefinitionIds: (json['MetricDefinitionIds'] as List?)
          ?.nonNulls
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

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
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

/// @nodoc
class DeleteResourcePolicyResponse {
  /// The revision ID of the policy that was removed, if it had one.
  final String? policyRevisionId;

  DeleteResourcePolicyResponse({
    this.policyRevisionId,
  });

  factory DeleteResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePolicyResponse(
      policyRevisionId: json['PolicyRevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyRevisionId = this.policyRevisionId;
    return {
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
  }
}

/// @nodoc
class DeleteRumMetricsDestinationResponse {
  DeleteRumMetricsDestinationResponse();

  factory DeleteRumMetricsDestinationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRumMetricsDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
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
      events:
          (json['Events'] as List?)?.nonNulls.map((e) => e as String).toList(),
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

/// @nodoc
class GetResourcePolicyResponse {
  /// The JSON policy document that you requested.
  final String? policyDocument;

  /// The revision ID information for this version of the policy document that you
  /// requested.
  final String? policyRevisionId;

  GetResourcePolicyResponse({
    this.policyDocument,
    this.policyRevisionId,
  });

  factory GetResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePolicyResponse(
      policyDocument: json['PolicyDocument'] as String?,
      policyRevisionId: json['PolicyRevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyRevisionId = this.policyRevisionId;
    return {
      if (policyDocument != null) 'PolicyDocument': policyDocument,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
  }
}

/// @nodoc
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
          ?.nonNulls
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

/// @nodoc
class PutResourcePolicyResponse {
  /// The JSON policy document that you specified.
  final String? policyDocument;

  /// The policy revision ID information that you specified.
  final String? policyRevisionId;

  PutResourcePolicyResponse({
    this.policyDocument,
    this.policyRevisionId,
  });

  factory PutResourcePolicyResponse.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResponse(
      policyDocument: json['PolicyDocument'] as String?,
      policyRevisionId: json['PolicyRevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policyDocument = this.policyDocument;
    final policyRevisionId = this.policyRevisionId;
    return {
      if (policyDocument != null) 'PolicyDocument': policyDocument,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
  }
}

/// @nodoc
class PutRumMetricsDestinationResponse {
  PutRumMetricsDestinationResponse();

  factory PutRumMetricsDestinationResponse.fromJson(Map<String, dynamic> _) {
    return PutRumMetricsDestinationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateRumMetricDefinitionResponse {
  UpdateRumMetricDefinitionResponse();

  factory UpdateRumMetricDefinitionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateRumMetricDefinitionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class MetricDestination {
  static const cloudWatch = MetricDestination._('CloudWatch');
  static const evidently = MetricDestination._('Evidently');

  final String value;

  const MetricDestination._(this.value);

  static const values = [cloudWatch, evidently];

  static MetricDestination fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => MetricDestination._(value));

  @override
  bool operator ==(other) => other is MetricDestination && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
/// <code>{"event_type":\["com.amazon.rum.performance_navigation_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>PerformanceResourceDuration</code>, then
/// <code>ValueKey</code>must be <code>event_details.duration</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":\["com.amazon.rum.performance_resource_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>NavigationSatisfiedTransaction</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{ "event_type":
/// \["com.amazon.rum.performance_navigation_event"\], "event_details": {
/// "duration": \[{ "numeric": \["&gt;",2000\] }\] } }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>NavigationToleratedTransaction</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{ "event_type":
/// \["com.amazon.rum.performance_navigation_event"\], "event_details": {
/// "duration": \[{ "numeric": \["&gt;=",2000,"&lt;"8000\] }\] } }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>NavigationFrustratedTransaction</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{ "event_type":
/// \["com.amazon.rum.performance_navigation_event"\], "event_details": {
/// "duration": \[{ "numeric": \["&gt;=",8000\] }\] } }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>WebVitalsCumulativeLayoutShift</code>, then
/// <code>ValueKey</code>must be <code>event_details.value</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":\["com.amazon.rum.cumulative_layout_shift_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>WebVitalsFirstInputDelay</code>, then
/// <code>ValueKey</code>must be <code>event_details.value</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":\["com.amazon.rum.first_input_delay_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>WebVitalsLargestContentfulPaint</code>, then
/// <code>ValueKey</code>must be <code>event_details.value</code> and the
/// <code>EventPattern</code> must include
/// <code>{"event_type":\["com.amazon.rum.largest_contentful_paint_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>JsErrorCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":\["com.amazon.rum.js_error_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>HttpErrorCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":\["com.amazon.rum.http_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>SessionCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":\["com.amazon.rum.session_start_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>PageViewCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":\["com.amazon.rum.page_view_event"\]}</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>Http4xxCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":
/// \["com.amazon.rum.http_event"\],"event_details":{"response":{"status":\[{"numeric":\["&gt;=",400,"&lt;",500\]}\]}}}
/// }</code>
/// </li>
/// <li>
/// If <code>Name</code> is <code>Http5xxCount</code>, then
/// <code>ValueKey</code>must be null and the <code>EventPattern</code> must
/// include <code>{"event_type":
/// \["com.amazon.rum.http_event"\],"event_details":{"response":{"status":\[{"numeric":\["&gt;=",500,"&lt;=",599\]}\]}}}
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
///
/// @nodoc
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
  /// <code>'{ "event_type": \["com.amazon.rum.js_error_event"\], "metadata": {
  /// "browserName": \[ "Chrome", "Safari" \], } }'</code>
  /// </li>
  /// <li>
  /// <code>'{ "event_type": \["com.amazon.rum.performance_navigation_event"\],
  /// "metadata": { "browserName": \[ "Chrome", "Firefox" \] }, "event_details": {
  /// "duration": \[{ "numeric": \[ "&lt;", 2000 \] }\] } }'</code>
  /// </li>
  /// <li>
  /// <code>'{ "event_type": \["com.amazon.rum.performance_navigation_event"\],
  /// "metadata": { "browserName": \[ "Chrome", "Safari" \], "countryCode": \[
  /// "US" \] }, "event_details": { "duration": \[{ "numeric": \[ "&gt;=", 2000,
  /// "&lt;", 8000 \] }\] } }'</code>
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
      name: (json['Name'] as String?) ?? '',
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

/// A structure that displays information about one destination that CloudWatch
/// RUM sends extended metrics to.
///
/// @nodoc
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
      destination:
          (json['Destination'] as String?)?.let(MetricDestination.fromString),
      destinationArn: json['DestinationArn'] as String?,
      iamRoleArn: json['IamRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final destinationArn = this.destinationArn;
    final iamRoleArn = this.iamRoleArn;
    return {
      if (destination != null) 'Destination': destination.value,
      if (destinationArn != null) 'DestinationArn': destinationArn,
      if (iamRoleArn != null) 'IamRoleArn': iamRoleArn,
    };
  }
}

/// A structure that defines the time range that you want to retrieve results
/// from.
///
/// @nodoc
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
///
/// @nodoc
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

/// This structure contains much of the configuration data for the app monitor.
///
/// @nodoc
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      favoritePages: (json['FavoritePages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      guestRoleArn: json['GuestRoleArn'] as String?,
      identityPoolId: json['IdentityPoolId'] as String?,
      includedPages: (json['IncludedPages'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      sessionSampleRate: _s.parseJsonDouble(json['SessionSampleRate']),
      telemetries: (json['Telemetries'] as List?)
          ?.nonNulls
          .map((e) => Telemetry.fromString((e as String)))
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
      if (sessionSampleRate != null)
        'SessionSampleRate': _s.encodeJsonDouble(sessionSampleRate),
      if (telemetries != null)
        'Telemetries': telemetries.map((e) => e.value).toList(),
    };
  }
}

/// A structure that contains information about custom events for this app
/// monitor.
///
/// @nodoc
class CustomEvents {
  /// Specifies whether this app monitor allows the web client to define and send
  /// custom events. The default is for custom events to be <code>DISABLED</code>.
  final CustomEventsStatus? status;

  CustomEvents({
    this.status,
  });

  factory CustomEvents.fromJson(Map<String, dynamic> json) {
    return CustomEvents(
      status: (json['Status'] as String?)?.let(CustomEventsStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status.value,
    };
  }
}

/// A structure that contains the configuration for how an app monitor can
/// deobfuscate stack traces.
///
/// @nodoc
class DeobfuscationConfiguration {
  /// A structure that contains the configuration for how an app monitor can
  /// unminify JavaScript error stack traces using source maps.
  final JavaScriptSourceMaps? javaScriptSourceMaps;

  DeobfuscationConfiguration({
    this.javaScriptSourceMaps,
  });

  factory DeobfuscationConfiguration.fromJson(Map<String, dynamic> json) {
    return DeobfuscationConfiguration(
      javaScriptSourceMaps: json['JavaScriptSourceMaps'] != null
          ? JavaScriptSourceMaps.fromJson(
              json['JavaScriptSourceMaps'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final javaScriptSourceMaps = this.javaScriptSourceMaps;
    return {
      if (javaScriptSourceMaps != null)
        'JavaScriptSourceMaps': javaScriptSourceMaps,
    };
  }
}

/// @nodoc
class AppMonitorPlatform {
  static const web = AppMonitorPlatform._('Web');
  static const android = AppMonitorPlatform._('Android');
  static const ios = AppMonitorPlatform._('iOS');

  final String value;

  const AppMonitorPlatform._(this.value);

  static const values = [web, android, ios];

  static AppMonitorPlatform fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AppMonitorPlatform._(value));

  @override
  bool operator ==(other) =>
      other is AppMonitorPlatform && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains the configuration for how an app monitor can
/// unminify JavaScript error stack traces using source maps.
///
/// @nodoc
class JavaScriptSourceMaps {
  /// Specifies whether JavaScript error stack traces should be unminified for
  /// this app monitor. The default is for JavaScript error stack trace
  /// unminification to be <code>DISABLED</code>.
  final DeobfuscationStatus status;

  /// The S3Uri of the bucket or folder that stores the source map files. It is
  /// required if status is ENABLED.
  final String? s3Uri;

  JavaScriptSourceMaps({
    required this.status,
    this.s3Uri,
  });

  factory JavaScriptSourceMaps.fromJson(Map<String, dynamic> json) {
    return JavaScriptSourceMaps(
      status: DeobfuscationStatus.fromString((json['Status'] as String?) ?? ''),
      s3Uri: json['S3Uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final s3Uri = this.s3Uri;
    return {
      'Status': status.value,
      if (s3Uri != null) 'S3Uri': s3Uri,
    };
  }
}

/// @nodoc
class DeobfuscationStatus {
  static const enabled = DeobfuscationStatus._('ENABLED');
  static const disabled = DeobfuscationStatus._('DISABLED');

  final String value;

  const DeobfuscationStatus._(this.value);

  static const values = [enabled, disabled];

  static DeobfuscationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DeobfuscationStatus._(value));

  @override
  bool operator ==(other) =>
      other is DeobfuscationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CustomEventsStatus {
  static const enabled = CustomEventsStatus._('ENABLED');
  static const disabled = CustomEventsStatus._('DISABLED');

  final String value;

  const CustomEventsStatus._(this.value);

  static const values = [enabled, disabled];

  static CustomEventsStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CustomEventsStatus._(value));

  @override
  bool operator ==(other) =>
      other is CustomEventsStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Telemetry {
  static const errors = Telemetry._('errors');
  static const performance = Telemetry._('performance');
  static const http = Telemetry._('http');

  final String value;

  const Telemetry._(this.value);

  static const values = [errors, performance, http];

  static Telemetry fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Telemetry._(value));

  @override
  bool operator ==(other) => other is Telemetry && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that displays the definition of one extended metric that RUM
/// sends to CloudWatch or CloudWatch Evidently. For more information, see <a
/// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/CloudWatch-RUM-vended-metrics.html">
/// Additional metrics that you can send to CloudWatch and CloudWatch
/// Evidently</a>.
///
/// @nodoc
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
      metricDefinitionId: (json['MetricDefinitionId'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
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

/// A structure that defines one error caused by a <a
/// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchDeleteRumMetricsDefinitions.html">BatchCreateRumMetricsDefinitions</a>
/// operation.
///
/// @nodoc
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
      errorCode: (json['ErrorCode'] as String?) ?? '',
      errorMessage: (json['ErrorMessage'] as String?) ?? '',
      metricDefinitionId: (json['MetricDefinitionId'] as String?) ?? '',
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

/// A structure that defines one error caused by a <a
/// href="https://docs.aws.amazon.com/cloudwatchrum/latest/APIReference/API_BatchCreateRumMetricsDefinitions.html">BatchCreateRumMetricsDefinitions</a>
/// operation.
///
/// @nodoc
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
      errorCode: (json['ErrorCode'] as String?) ?? '',
      errorMessage: (json['ErrorMessage'] as String?) ?? '',
      metricDefinition: MetricDefinitionRequest.fromJson(
          (json['MetricDefinition'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
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

/// A structure that includes some data about app monitors and their settings.
///
/// @nodoc
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

  /// The platform type for this app monitor. Valid values are <code>Web</code>
  /// for web applications, <code>Android</code> for Android applications, and
  /// <code>iOS</code> for IOS applications.
  final AppMonitorPlatform? platform;

  /// The current state of this app monitor.
  final StateEnum? state;

  AppMonitorSummary({
    this.created,
    this.id,
    this.lastModified,
    this.name,
    this.platform,
    this.state,
  });

  factory AppMonitorSummary.fromJson(Map<String, dynamic> json) {
    return AppMonitorSummary(
      created: json['Created'] as String?,
      id: json['Id'] as String?,
      lastModified: json['LastModified'] as String?,
      name: json['Name'] as String?,
      platform:
          (json['Platform'] as String?)?.let(AppMonitorPlatform.fromString),
      state: (json['State'] as String?)?.let(StateEnum.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final created = this.created;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final platform = this.platform;
    final state = this.state;
    return {
      if (created != null) 'Created': created,
      if (id != null) 'Id': id,
      if (lastModified != null) 'LastModified': lastModified,
      if (name != null) 'Name': name,
      if (platform != null) 'Platform': platform.value,
      if (state != null) 'State': state.value,
    };
  }
}

/// @nodoc
class StateEnum {
  static const created = StateEnum._('CREATED');
  static const deleting = StateEnum._('DELETING');
  static const active = StateEnum._('ACTIVE');

  final String value;

  const StateEnum._(this.value);

  static const values = [created, deleting, active];

  static StateEnum fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => StateEnum._(value));

  @override
  bool operator ==(other) => other is StateEnum && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A RUM app monitor collects telemetry data from your application and sends
/// that data to RUM. The data includes performance and reliability information
/// such as page load time, client-side errors, and user behavior.
///
/// @nodoc
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

  /// A structure that contains the configuration for how an app monitor can
  /// deobfuscate stack traces.
  final DeobfuscationConfiguration? deobfuscationConfiguration;

  /// The top-level internet domain name for which your application has
  /// administrative authority.
  final String? domain;

  /// List the domain names for which your application has administrative
  /// authority.
  final List<String>? domainList;

  /// The unique ID of this app monitor.
  final String? id;

  /// The date and time of the most recent changes to this app monitor's
  /// configuration.
  final String? lastModified;

  /// The name of the app monitor.
  final String? name;

  /// The platform type for this app monitor. Valid values are <code>Web</code>
  /// for web applications , <code>Android</code> for Android applications, and
  /// <code>iOS</code> for IOS applications.
  final AppMonitorPlatform? platform;

  /// The current state of the app monitor.
  final StateEnum? state;

  /// The list of tag keys and values associated with this app monitor.
  final Map<String, String>? tags;

  AppMonitor({
    this.appMonitorConfiguration,
    this.created,
    this.customEvents,
    this.dataStorage,
    this.deobfuscationConfiguration,
    this.domain,
    this.domainList,
    this.id,
    this.lastModified,
    this.name,
    this.platform,
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
      deobfuscationConfiguration: json['DeobfuscationConfiguration'] != null
          ? DeobfuscationConfiguration.fromJson(
              json['DeobfuscationConfiguration'] as Map<String, dynamic>)
          : null,
      domain: json['Domain'] as String?,
      domainList: (json['DomainList'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      id: json['Id'] as String?,
      lastModified: json['LastModified'] as String?,
      name: json['Name'] as String?,
      platform:
          (json['Platform'] as String?)?.let(AppMonitorPlatform.fromString),
      state: (json['State'] as String?)?.let(StateEnum.fromString),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final appMonitorConfiguration = this.appMonitorConfiguration;
    final created = this.created;
    final customEvents = this.customEvents;
    final dataStorage = this.dataStorage;
    final deobfuscationConfiguration = this.deobfuscationConfiguration;
    final domain = this.domain;
    final domainList = this.domainList;
    final id = this.id;
    final lastModified = this.lastModified;
    final name = this.name;
    final platform = this.platform;
    final state = this.state;
    final tags = this.tags;
    return {
      if (appMonitorConfiguration != null)
        'AppMonitorConfiguration': appMonitorConfiguration,
      if (created != null) 'Created': created,
      if (customEvents != null) 'CustomEvents': customEvents,
      if (dataStorage != null) 'DataStorage': dataStorage,
      if (deobfuscationConfiguration != null)
        'DeobfuscationConfiguration': deobfuscationConfiguration,
      if (domain != null) 'Domain': domain,
      if (domainList != null) 'DomainList': domainList,
      if (id != null) 'Id': id,
      if (lastModified != null) 'LastModified': lastModified,
      if (name != null) 'Name': name,
      if (platform != null) 'Platform': platform.value,
      if (state != null) 'State': state.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

/// A structure that contains information about whether this app monitor stores
/// a copy of the telemetry data that RUM collects using CloudWatch Logs.
///
/// @nodoc
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

/// A structure that contains the information about whether the app monitor
/// stores copies of the data that RUM collects in CloudWatch Logs. If it does,
/// this structure also contains the name of the log group.
///
/// @nodoc
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

/// A structure that contains information about the RUM app monitor.
///
/// @nodoc
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

/// A structure that contains information about the user session that this batch
/// of events was collected from.
///
/// @nodoc
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

/// A structure that contains the information for one performance event that RUM
/// collects from a user session with your application.
///
/// @nodoc
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

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class InvalidPolicyRevisionIdException extends _s.GenericAwsException {
  InvalidPolicyRevisionIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPolicyRevisionIdException',
            message: message);
}

/// @nodoc
class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

/// @nodoc
class PolicyNotFoundException extends _s.GenericAwsException {
  PolicyNotFoundException({String? type, String? message})
      : super(type: type, code: 'PolicyNotFoundException', message: message);
}

/// @nodoc
class PolicySizeLimitExceededException extends _s.GenericAwsException {
  PolicySizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicySizeLimitExceededException',
            message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidPolicyRevisionIdException': (type, message) =>
      InvalidPolicyRevisionIdException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'PolicyNotFoundException': (type, message) =>
      PolicyNotFoundException(type: type, message: message),
  'PolicySizeLimitExceededException': (type, message) =>
      PolicySizeLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
