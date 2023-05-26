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

/// This section provides documentation for the Amazon CodeGuru Profiler API
/// operations.
///
/// Amazon CodeGuru Profiler collects runtime performance data from your live
/// applications, and provides recommendations that can help you fine-tune your
/// application performance. Using machine learning algorithms, CodeGuru
/// Profiler can help you find your most expensive lines of code and suggest
/// ways you can improve efficiency and remove CPU bottlenecks.
///
/// Amazon CodeGuru Profiler provides different visualizations of profiling data
/// to help you identify what code is running on the CPU, see how much time is
/// consumed, and suggest ways to reduce CPU utilization.
/// <note>
/// Amazon CodeGuru Profiler currently supports applications written in all Java
/// virtual machine (JVM) languages and Python. While CodeGuru Profiler supports
/// both visualizations and recommendations for applications written in Java, it
/// can also generate visualizations and a subset of recommendations for
/// applications written in other JVM languages and Python.
/// </note>
/// For more information, see <a
/// href="https://docs.aws.amazon.com/codeguru/latest/profiler-ug/what-is-codeguru-profiler.html">What
/// is Amazon CodeGuru Profiler</a> in the <i>Amazon CodeGuru Profiler User
/// Guide</i>.
class CodeGuruProfiler {
  final _s.RestJsonProtocol _protocol;
  CodeGuruProfiler({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-profiler',
            signingName: 'codeguru-profiler',
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

  /// Add up to 2 anomaly notifications channels for a profiling group.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channels] :
  /// One or 2 channels to report to when anomalies are detected.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group that we are setting up notifications for.
  Future<AddNotificationChannelsResponse> addNotificationChannels({
    required List<Channel> channels,
    required String profilingGroupName,
  }) async {
    final $payload = <String, dynamic>{
      'channels': channels,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/notificationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return AddNotificationChannelsResponse.fromJson(response);
  }

  /// Returns the time series of values for a requested list of frame metrics
  /// from a time period.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group associated with the the frame metrics used
  /// to return the time series values.
  ///
  /// Parameter [endTime] :
  /// The end time of the time period for the returned time series values. This
  /// is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
  /// 1:15:02 PM UTC.
  ///
  /// Parameter [frameMetrics] :
  /// The details of the metrics that are used to request a time series of
  /// values. The metric includes the name of the frame, the aggregation type to
  /// calculate the metric value for the frame, and the thread states to use to
  /// get the count for the metric value of the frame.
  ///
  /// Parameter [period] :
  /// The duration of the frame metrics used to return the time series values.
  /// Specify using the ISO 8601 format. The maximum period duration is one day
  /// (<code>PT24H</code> or <code>P1D</code>).
  ///
  /// Parameter [startTime] :
  /// The start time of the time period for the frame metrics used to return the
  /// time series values. This is specified using the ISO 8601 format. For
  /// example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1,
  /// 2020 1:15:02 PM UTC.
  ///
  /// Parameter [targetResolution] :
  /// The requested resolution of time steps for the returned time series of
  /// values. If the requested target resolution is not available due to data
  /// not being retained we provide a best effort result by falling back to the
  /// most granular available resolution after the target resolution. There are
  /// 3 valid values.
  ///
  /// <ul>
  /// <li>
  /// <code>P1D</code> — 1 day
  /// </li>
  /// <li>
  /// <code>PT1H</code> — 1 hour
  /// </li>
  /// <li>
  /// <code>PT5M</code> — 5 minutes
  /// </li>
  /// </ul>
  Future<BatchGetFrameMetricDataResponse> batchGetFrameMetricData({
    required String profilingGroupName,
    DateTime? endTime,
    List<FrameMetric>? frameMetrics,
    String? period,
    DateTime? startTime,
    AggregationPeriod? targetResolution,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (period != null) 'period': [period],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (targetResolution != null)
        'targetResolution': [targetResolution.toValue()],
    };
    final $payload = <String, dynamic>{
      if (frameMetrics != null) 'frameMetrics': frameMetrics,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/frames/-/metrics',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetFrameMetricDataResponse.fromJson(response);
  }

  /// Used by profiler agents to report their current state and to receive
  /// remote configuration updates. For example, <code>ConfigureAgent</code> can
  /// be used to tell an agent whether to profile or not and for how long to
  /// return profiling data.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group for which the configured agent is
  /// collecting profiling data.
  ///
  /// Parameter [fleetInstanceId] :
  /// A universally unique identifier (UUID) for a profiling instance. For
  /// example, if the profiling instance is an Amazon EC2 instance, it is the
  /// instance ID. If it is an AWS Fargate container, it is the container's task
  /// ID.
  ///
  /// Parameter [metadata] :
  /// Metadata captured about the compute platform the agent is running on. It
  /// includes information about sampling and reporting. The valid fields are:
  ///
  /// <ul>
  /// <li>
  /// <code>COMPUTE_PLATFORM</code> - The compute platform on which the agent is
  /// running
  /// </li>
  /// <li>
  /// <code>AGENT_ID</code> - The ID for an agent instance.
  /// </li>
  /// <li>
  /// <code>AWS_REQUEST_ID</code> - The AWS request ID of a Lambda invocation.
  /// </li>
  /// <li>
  /// <code>EXECUTION_ENVIRONMENT</code> - The execution environment a Lambda
  /// function is running on.
  /// </li>
  /// <li>
  /// <code>LAMBDA_FUNCTION_ARN</code> - The Amazon Resource Name (ARN) that is
  /// used to invoke a Lambda function.
  /// </li>
  /// <li>
  /// <code>LAMBDA_MEMORY_LIMIT_IN_MB</code> - The memory allocated to a Lambda
  /// function.
  /// </li>
  /// <li>
  /// <code>LAMBDA_REMAINING_TIME_IN_MILLISECONDS</code> - The time in
  /// milliseconds before execution of a Lambda function times out.
  /// </li>
  /// <li>
  /// <code>LAMBDA_TIME_GAP_BETWEEN_INVOKES_IN_MILLISECONDS</code> - The time in
  /// milliseconds between two invocations of a Lambda function.
  /// </li>
  /// <li>
  /// <code>LAMBDA_PREVIOUS_EXECUTION_TIME_IN_MILLISECONDS</code> - The time in
  /// milliseconds for the previous Lambda invocation.
  /// </li>
  /// </ul>
  Future<ConfigureAgentResponse> configureAgent({
    required String profilingGroupName,
    String? fleetInstanceId,
    Map<MetadataField, String>? metadata,
  }) async {
    final $payload = <String, dynamic>{
      if (fleetInstanceId != null) 'fleetInstanceId': fleetInstanceId,
      if (metadata != null)
        'metadata': metadata.map((k, e) => MapEntry(k.toValue(), e)),
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/configureAgent',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return ConfigureAgentResponse(
      configuration: AgentConfiguration.fromJson($json),
    );
  }

  /// Creates a profiling group.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to create.
  ///
  /// Parameter [agentOrchestrationConfig] :
  /// Specifies whether profiling is enabled or disabled for the created
  /// profiling group.
  ///
  /// Parameter [clientToken] :
  /// Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to
  /// prevent the accidental creation of duplicate profiling groups if there are
  /// failures and retries.
  ///
  /// Parameter [computePlatform] :
  /// The compute platform of the profiling group. Use <code>AWSLambda</code> if
  /// your application runs on AWS Lambda. Use <code>Default</code> if your
  /// application runs on a compute platform that is not AWS Lambda, such an
  /// Amazon EC2 instance, an on-premises server, or a different platform. If
  /// not specified, <code>Default</code> is used.
  ///
  /// Parameter [tags] :
  /// A list of tags to add to the created profiling group.
  Future<CreateProfilingGroupResponse> createProfilingGroup({
    required String profilingGroupName,
    AgentOrchestrationConfig? agentOrchestrationConfig,
    String? clientToken,
    ComputePlatform? computePlatform,
    Map<String, String>? tags,
  }) async {
    final $query = <String, List<String>>{
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final $payload = <String, dynamic>{
      'profilingGroupName': profilingGroupName,
      if (agentOrchestrationConfig != null)
        'agentOrchestrationConfig': agentOrchestrationConfig,
      if (computePlatform != null) 'computePlatform': computePlatform.toValue(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/profilingGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return CreateProfilingGroupResponse(
      profilingGroup: ProfilingGroupDescription.fromJson($json),
    );
  }

  /// Deletes a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to delete.
  Future<void> deleteProfilingGroup({
    required String profilingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> object that contains
  /// information about the requested profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to get information about.
  Future<DescribeProfilingGroupResponse> describeProfilingGroup({
    required String profilingGroupName,
  }) async {
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri: '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return DescribeProfilingGroupResponse(
      profilingGroup: ProfilingGroupDescription.fromJson($json),
    );
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_FindingsReportSummary.html">
  /// <code>FindingsReportSummary</code> </a> objects that contain analysis
  /// results for all profiling groups in your AWS account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [dailyReportsOnly] :
  /// A <code>Boolean</code> value indicating whether to only return reports
  /// from daily profiles. If set to <code>True</code>, only analysis data from
  /// daily profiles is returned. If set to <code>False</code>, analysis data is
  /// returned from smaller time windows (for example, one hour).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results returned by <code>
  /// GetFindingsReportAccountSummary</code> in paginated output. When this
  /// parameter is used, <code>GetFindingsReportAccountSummary</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>GetFindingsReportAccountSummary</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>GetFindingsReportAccountSummary</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<GetFindingsReportAccountSummaryResponse>
      getFindingsReportAccountSummary({
    bool? dailyReportsOnly,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (dailyReportsOnly != null)
        'dailyReportsOnly': [dailyReportsOnly.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/internal/findingsReports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetFindingsReportAccountSummaryResponse.fromJson(response);
  }

  /// Get the current configuration for anomaly notifications for a profiling
  /// group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group we want to get the notification
  /// configuration for.
  Future<GetNotificationConfigurationResponse> getNotificationConfiguration({
    required String profilingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/notificationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetNotificationConfigurationResponse.fromJson(response);
  }

  /// Returns the JSON-formatted resource-based policy on a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  Future<GetPolicyResponse> getPolicy({
    required String profilingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetPolicyResponse.fromJson(response);
  }

  /// Gets the aggregated profile of a profiling group for a specified time
  /// range. Amazon CodeGuru Profiler collects posted agent profiles for a
  /// profiling group into aggregated profiles.
  /// <pre><code> &lt;note&gt; &lt;p&gt; Because aggregated profiles expire over
  /// time &lt;code&gt;GetProfile&lt;/code&gt; is not idempotent. &lt;/p&gt;
  /// &lt;/note&gt; &lt;p&gt; Specify the time range for the requested
  /// aggregated profile using 1 or 2 of the following parameters:
  /// &lt;code&gt;startTime&lt;/code&gt;, &lt;code&gt;endTime&lt;/code&gt;,
  /// &lt;code&gt;period&lt;/code&gt;. The maximum time range allowed is 7 days.
  /// If you specify all 3 parameters, an exception is thrown. If you specify
  /// only &lt;code&gt;period&lt;/code&gt;, the latest aggregated profile is
  /// returned. &lt;/p&gt; &lt;p&gt; Aggregated profiles are available with
  /// aggregation periods of 5 minutes, 1 hour, and 1 day, aligned to UTC. The
  /// aggregation period of an aggregated profile determines how long it is
  /// retained. For more information, see &lt;a
  /// href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html&quot;&gt;
  /// &lt;code&gt;AggregatedProfileTime&lt;/code&gt; &lt;/a&gt;. The aggregated
  /// profile's aggregation period determines how long it is retained by
  /// CodeGuru Profiler. &lt;/p&gt; &lt;ul&gt; &lt;li&gt; &lt;p&gt; If the
  /// aggregation period is 5 minutes, the aggregated profile is retained for 15
  /// days. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation
  /// period is 1 hour, the aggregated profile is retained for 60 days.
  /// &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If the aggregation period is 1
  /// day, the aggregated profile is retained for 3 years. &lt;/p&gt;
  /// &lt;/li&gt; &lt;/ul&gt; &lt;p&gt;There are two use cases for calling
  /// &lt;code&gt;GetProfile&lt;/code&gt;.&lt;/p&gt; &lt;ol&gt; &lt;li&gt;
  /// &lt;p&gt; If you want to return an aggregated profile that already exists,
  /// use &lt;a
  /// href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ListProfileTimes.html&quot;&gt;
  /// &lt;code&gt;ListProfileTimes&lt;/code&gt; &lt;/a&gt; to view the time
  /// ranges of existing aggregated profiles. Use them in a
  /// &lt;code&gt;GetProfile&lt;/code&gt; request to return a specific, existing
  /// aggregated profile. &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt; If you
  /// want to return an aggregated profile for a time range that doesn't align
  /// with an existing aggregated profile, then CodeGuru Profiler makes a best
  /// effort to combine existing aggregated profiles from the requested time
  /// range and return them as one aggregated profile. &lt;/p&gt; &lt;p&gt; If
  /// aggregated profiles do not exist for the full time range requested, then
  /// aggregated profiles for a smaller time range are returned. For example, if
  /// the requested time range is from 00:00 to 00:20, and the existing
  /// aggregated profiles are from 00:15 and 00:25, then the aggregated profiles
  /// from 00:15 to 00:20 are returned. &lt;/p&gt; &lt;/li&gt; &lt;/ol&gt;
  /// </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to get.
  ///
  /// Parameter [accept] :
  /// The format of the returned profiling data. The format maps to the
  /// <code>Accept</code> and <code>Content-Type</code> headers of the HTTP
  /// request. You can specify one of the following: or the default .
  /// <pre><code> &lt;ul&gt; &lt;li&gt; &lt;p&gt;
  /// &lt;code&gt;application/json&lt;/code&gt; — standard JSON format
  /// &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;
  /// &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data
  /// format. For more information, see &lt;a
  /// href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon Ion&lt;/a&gt;.
  /// &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; </code></pre>
  ///
  /// Parameter [endTime] :
  /// The end time of the requested profile. Specify using the ISO 8601 format.
  /// For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June
  /// 1, 2020 1:15:02 PM UTC.
  ///
  /// If you specify <code>endTime</code>, then you must also specify
  /// <code>period</code> or <code>startTime</code>, but not both.
  ///
  /// Parameter [maxDepth] :
  /// The maximum depth of the stacks in the code that is represented in the
  /// aggregated profile. For example, if CodeGuru Profiler finds a method
  /// <code>A</code>, which calls method <code>B</code>, which calls method
  /// <code>C</code>, which calls method <code>D</code>, then the depth is 4. If
  /// the <code>maxDepth</code> is set to 2, then the aggregated profile
  /// contains representations of methods <code>A</code> and <code>B</code>.
  ///
  /// Parameter [period] :
  /// Used with <code>startTime</code> or <code>endTime</code> to specify the
  /// time range for the returned aggregated profile. Specify using the ISO 8601
  /// format. For example, <code>P1DT1H1M1S</code>.
  /// <pre><code> &lt;p&gt; To get the latest aggregated profile, specify only
  /// &lt;code&gt;period&lt;/code&gt;. &lt;/p&gt; </code></pre>
  ///
  /// Parameter [startTime] :
  /// The start time of the profile to get. Specify using the ISO 8601 format.
  /// For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June
  /// 1, 2020 1:15:02 PM UTC.
  /// <pre><code> &lt;p&gt; If you specify &lt;code&gt;startTime&lt;/code&gt;,
  /// then you must also specify &lt;code&gt;period&lt;/code&gt; or
  /// &lt;code&gt;endTime&lt;/code&gt;, but not both. &lt;/p&gt; </code></pre>
  Future<GetProfileResponse> getProfile({
    required String profilingGroupName,
    String? accept,
    DateTime? endTime,
    int? maxDepth,
    String? period,
    DateTime? startTime,
  }) async {
    _s.validateNumRange(
      'maxDepth',
      maxDepth,
      1,
      10000,
    );
    final headers = <String, String>{
      if (accept != null) 'Accept': accept.toString(),
    };
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (maxDepth != null) 'maxDepth': [maxDepth.toString()],
      if (period != null) 'period': [period],
      if (startTime != null)
        'startTime': [_s.iso8601ToJson(startTime).toString()],
    };
    final response = await _protocol.sendRaw(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/profile',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileResponse(
      profile: await response.stream.toBytes(),
      contentType:
          _s.extractHeaderStringValue(response.headers, 'Content-Type')!,
      contentEncoding:
          _s.extractHeaderStringValue(response.headers, 'Content-Encoding'),
    );
  }

  /// Returns a list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_Recommendation.html">
  /// <code>Recommendation</code> </a> objects that contain recommendations for
  /// a profiling group for a given time period. A list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_Anomaly.html">
  /// <code>Anomaly</code> </a> objects that contains details about anomalies
  /// detected in the profiling group for the same time period is also returned.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The start time of the profile to get analysis data about. You must specify
  /// <code>startTime</code> and <code>endTime</code>. This is specified using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to get analysis data about.
  ///
  /// Parameter [startTime] :
  /// The end time of the profile to get analysis data about. You must specify
  /// <code>startTime</code> and <code>endTime</code>. This is specified using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  ///
  /// Parameter [locale] :
  /// The language used to provide analysis. Specify using a string that is one
  /// of the following <code>BCP 47</code> language codes.
  ///
  /// <ul>
  /// <li>
  /// <code>de-DE</code> - German, Germany
  /// </li>
  /// <li>
  /// <code>en-GB</code> - English, United Kingdom
  /// </li>
  /// <li>
  /// <code>en-US</code> - English, United States
  /// </li>
  /// <li>
  /// <code>es-ES</code> - Spanish, Spain
  /// </li>
  /// <li>
  /// <code>fr-FR</code> - French, France
  /// </li>
  /// <li>
  /// <code>it-IT</code> - Italian, Italy
  /// </li>
  /// <li>
  /// <code>ja-JP</code> - Japanese, Japan
  /// </li>
  /// <li>
  /// <code>ko-KR</code> - Korean, Republic of Korea
  /// </li>
  /// <li>
  /// <code>pt-BR</code> - Portugese, Brazil
  /// </li>
  /// <li>
  /// <code>zh-CN</code> - Chinese, China
  /// </li>
  /// <li>
  /// <code>zh-TW</code> - Chinese, Taiwan
  /// </li>
  /// </ul>
  Future<GetRecommendationsResponse> getRecommendations({
    required DateTime endTime,
    required String profilingGroupName,
    required DateTime startTime,
    String? locale,
  }) async {
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (locale != null) 'locale': [locale],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/internal/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/recommendations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetRecommendationsResponse.fromJson(response);
  }

  /// List the available reports for a given profiling group and time range.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The end time of the profile to get analysis data about. You must specify
  /// <code>startTime</code> and <code>endTime</code>. This is specified using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group from which to search for analysis data.
  ///
  /// Parameter [startTime] :
  /// The start time of the profile to get analysis data about. You must specify
  /// <code>startTime</code> and <code>endTime</code>. This is specified using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  ///
  /// Parameter [dailyReportsOnly] :
  /// A <code>Boolean</code> value indicating whether to only return reports
  /// from daily profiles. If set to <code>True</code>, only analysis data from
  /// daily profiles is returned. If set to <code>False</code>, analysis data is
  /// returned from smaller time windows (for example, one hour).
  ///
  /// Parameter [maxResults] :
  /// The maximum number of report results returned by
  /// <code>ListFindingsReports</code> in paginated output. When this parameter
  /// is used, <code>ListFindingsReports</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListFindingsReports</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListFindingsReportsRequest</code> request where
  /// <code>maxResults</code> was used and the results exceeded the value of
  /// that parameter. Pagination continues from the end of the previous results
  /// that returned the <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListFindingsReportsResponse> listFindingsReports({
    required DateTime endTime,
    required String profilingGroupName,
    required DateTime startTime,
    bool? dailyReportsOnly,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (dailyReportsOnly != null)
        'dailyReportsOnly': [dailyReportsOnly.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/internal/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/findingsReports',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFindingsReportsResponse.fromJson(response);
  }

  /// Lists the start times of the available aggregated profiles of a profiling
  /// group for an aggregation period within the specified time range.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [endTime] :
  /// The end time of the time range from which to list the profiles.
  ///
  /// Parameter [period] :
  /// The aggregation period. This specifies the period during which an
  /// aggregation profile collects posted agent profiles for a profiling group.
  /// There are 3 valid values.
  ///
  /// <ul>
  /// <li>
  /// <code>P1D</code> — 1 day
  /// </li>
  /// <li>
  /// <code>PT1H</code> — 1 hour
  /// </li>
  /// <li>
  /// <code>PT5M</code> — 5 minutes
  /// </li>
  /// </ul>
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  ///
  /// Parameter [startTime] :
  /// The start time of the time range from which to list the profiles.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profile time results returned by
  /// <code>ListProfileTimes</code> in paginated output. When this parameter is
  /// used, <code>ListProfileTimes</code> only returns <code>maxResults</code>
  /// results in a single page with a <code>nextToken</code> response element.
  /// The remaining results of the initial request can be seen by sending
  /// another <code>ListProfileTimes</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListProfileTimes</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  ///
  /// Parameter [orderBy] :
  /// The order (ascending or descending by start time of the profile) to use
  /// when listing profiles. Defaults to <code>TIMESTAMP_DESCENDING</code>.
  Future<ListProfileTimesResponse> listProfileTimes({
    required DateTime endTime,
    required AggregationPeriod period,
    required String profilingGroupName,
    required DateTime startTime,
    int? maxResults,
    String? nextToken,
    OrderBy? orderBy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      'endTime': [_s.iso8601ToJson(endTime).toString()],
      'period': [period.toValue()],
      'startTime': [_s.iso8601ToJson(startTime).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (orderBy != null) 'orderBy': [orderBy.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/profileTimes',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileTimesResponse.fromJson(response);
  }

  /// Returns a list of profiling groups. The profiling groups are returned as
  /// <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [includeDescription] :
  /// A <code>Boolean</code> value indicating whether to include a description.
  /// If <code>true</code>, then a list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects that contain detailed
  /// information about profiling groups is returned. If <code>false</code>,
  /// then a list of profiling group names is returned.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of profiling groups results returned by
  /// <code>ListProfilingGroups</code> in paginated output. When this parameter
  /// is used, <code>ListProfilingGroups</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListProfilingGroups</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The <code>nextToken</code> value returned from a previous paginated
  /// <code>ListProfilingGroups</code> request where <code>maxResults</code> was
  /// used and the results exceeded the value of that parameter. Pagination
  /// continues from the end of the previous results that returned the
  /// <code>nextToken</code> value.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  Future<ListProfilingGroupsResponse> listProfilingGroups({
    bool? includeDescription,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (includeDescription != null)
        'includeDescription': [includeDescription.toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/profilingGroups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfilingGroupsResponse.fromJson(response);
  }

  /// Returns a list of the tags that are assigned to a specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that contains the tags to
  /// return.
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

  /// Submits profiling data to an aggregated profile of a profiling group. To
  /// get an aggregated profile that is created with this profiling data, use <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_GetProfile.html">
  /// <code>GetProfile</code> </a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentProfile] :
  /// The submitted profiling data.
  ///
  /// Parameter [contentType] :
  /// The format of the submitted profiling data. The format maps to the
  /// <code>Accept</code> and <code>Content-Type</code> headers of the HTTP
  /// request. You can specify one of the following: or the default .
  /// <pre><code> &lt;ul&gt; &lt;li&gt; &lt;p&gt;
  /// &lt;code&gt;application/json&lt;/code&gt; — standard JSON format
  /// &lt;/p&gt; &lt;/li&gt; &lt;li&gt; &lt;p&gt;
  /// &lt;code&gt;application/x-amzn-ion&lt;/code&gt; — the Amazon Ion data
  /// format. For more information, see &lt;a
  /// href=&quot;http://amzn.github.io/ion-docs/&quot;&gt;Amazon Ion&lt;/a&gt;.
  /// &lt;/p&gt; &lt;/li&gt; &lt;/ul&gt; </code></pre>
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group with the aggregated profile that receives
  /// the submitted profiling data.
  ///
  /// Parameter [profileToken] :
  /// Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to
  /// prevent the accidental submission of duplicate profiling data if there are
  /// failures and retries.
  Future<void> postAgentProfile({
    required Uint8List agentProfile,
    required String contentType,
    required String profilingGroupName,
    String? profileToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': contentType.toString(),
    };
    final $query = <String, List<String>>{
      if (profileToken != null) 'profileToken': [profileToken],
    };
    final response = await _protocol.send(
      payload: agentProfile,
      method: 'POST',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/agentProfile',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds permissions to a profiling group's resource-based policy that are
  /// provided using an action group. If a profiling group doesn't have a
  /// resource-based policy, one is created for it using the permissions in the
  /// action group and the roles and users in the <code>principals</code>
  /// parameter.
  /// <pre><code> &lt;p&gt; The one supported action group that can be added is
  /// &lt;code&gt;agentPermission&lt;/code&gt; which grants
  /// &lt;code&gt;ConfigureAgent&lt;/code&gt; and
  /// &lt;code&gt;PostAgent&lt;/code&gt; permissions. For more information, see
  /// &lt;a
  /// href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html&quot;&gt;Resource-based
  /// policies in CodeGuru Profiler&lt;/a&gt; in the &lt;i&gt;Amazon CodeGuru
  /// Profiler User Guide&lt;/i&gt;, &lt;a
  /// href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html&quot;&gt;
  /// &lt;code&gt;ConfigureAgent&lt;/code&gt; &lt;/a&gt;, and &lt;a
  /// href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html&quot;&gt;
  /// &lt;code&gt;PostAgentProfile&lt;/code&gt; &lt;/a&gt;. &lt;/p&gt; &lt;p&gt;
  /// The first time you call &lt;code&gt;PutPermission&lt;/code&gt; on a
  /// profiling group, do not specify a &lt;code&gt;revisionId&lt;/code&gt;
  /// because it doesn't have a resource-based policy. Subsequent calls must
  /// provide a &lt;code&gt;revisionId&lt;/code&gt; to specify which revision of
  /// the resource-based policy to add the permissions to. &lt;/p&gt; &lt;p&gt;
  /// The response contains the profiling group's JSON-formatted resource
  /// policy. &lt;/p&gt; </code></pre>
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionGroup] :
  /// Specifies an action group that contains permissions to add to a profiling
  /// group resource. One action group is supported,
  /// <code>agentPermissions</code>, which grants permission to perform actions
  /// required by the profiling agent, <code>ConfigureAgent</code> and
  /// <code>PostAgentProfile</code> permissions.
  ///
  /// Parameter [principals] :
  /// A list ARNs for the roles and users you want to grant access to the
  /// profiling group. Wildcards are not are supported in the ARNs.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to grant access to.
  ///
  /// Parameter [revisionId] :
  /// A universally unique identifier (UUID) for the revision of the policy you
  /// are adding to the profiling group. Do not specify this when you add
  /// permissions to a profiling group for the first time. If a policy already
  /// exists on the profiling group, you must specify the
  /// <code>revisionId</code>.
  Future<PutPermissionResponse> putPermission({
    required ActionGroup actionGroup,
    required List<String> principals,
    required String profilingGroupName,
    String? revisionId,
  }) async {
    final $payload = <String, dynamic>{
      'principals': principals,
      if (revisionId != null) 'revisionId': revisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/policy/${Uri.encodeComponent(actionGroup.toValue())}',
      exceptionFnMap: _exceptionFns,
    );
    return PutPermissionResponse.fromJson(response);
  }

  /// Remove one anomaly notifications channel for a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [channelId] :
  /// The id of the channel that we want to stop receiving notifications.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group we want to change notification
  /// configuration for.
  Future<RemoveNotificationChannelResponse> removeNotificationChannel({
    required String channelId,
    required String profilingGroupName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/notificationConfiguration/${Uri.encodeComponent(channelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return RemoveNotificationChannelResponse.fromJson(response);
  }

  /// Removes permissions from a profiling group's resource-based policy that
  /// are provided using an action group. The one supported action group that
  /// can be removed is <code>agentPermission</code> which grants
  /// <code>ConfigureAgent</code> and <code>PostAgent</code> permissions. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-ug/resource-based-policies.html">Resource-based
  /// policies in CodeGuru Profiler</a> in the <i>Amazon CodeGuru Profiler User
  /// Guide</i>, <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
  /// <code>ConfigureAgent</code> </a>, and <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_PostAgentProfile.html">
  /// <code>PostAgentProfile</code> </a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [actionGroup] :
  /// Specifies an action group that contains the permissions to remove from a
  /// profiling group's resource-based policy. One action group is supported,
  /// <code>agentPermissions</code>, which grants <code>ConfigureAgent</code>
  /// and <code>PostAgentProfile</code> permissions.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group.
  ///
  /// Parameter [revisionId] :
  /// A universally unique identifier (UUID) for the revision of the
  /// resource-based policy from which you want to remove permissions.
  Future<RemovePermissionResponse> removePermission({
    required ActionGroup actionGroup,
    required String profilingGroupName,
    required String revisionId,
  }) async {
    final $query = <String, List<String>>{
      'revisionId': [revisionId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/policy/${Uri.encodeComponent(actionGroup.toValue())}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RemovePermissionResponse.fromJson(response);
  }

  /// Sends feedback to CodeGuru Profiler about whether the anomaly detected by
  /// the analysis is useful or not.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [anomalyInstanceId] :
  /// The universally unique identifier (UUID) of the <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AnomalyInstance.html">
  /// <code>AnomalyInstance</code> </a> object that is included in the analysis
  /// data.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group that is associated with the analysis data.
  ///
  /// Parameter [type] :
  /// The feedback tpye. Thee are two valid values, <code>Positive</code> and
  /// <code>Negative</code>.
  ///
  /// Parameter [comment] :
  /// Optional feedback about this anomaly.
  Future<void> submitFeedback({
    required String anomalyInstanceId,
    required String profilingGroupName,
    required FeedbackType type,
    String? comment,
  }) async {
    final $payload = <String, dynamic>{
      'type': type.toValue(),
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/internal/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/anomalies/${Uri.encodeComponent(anomalyInstanceId)}/feedback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Use to assign one or more tags to a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that the tags are added to.
  ///
  /// Parameter [tags] :
  /// The list of tags that are added to the specified resource.
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

  /// Use to remove one or more tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that contains the tags to
  /// remove.
  ///
  /// Parameter [tagKeys] :
  /// A list of tag keys. Existing tags of resources with keys in this list are
  /// removed from the specified resource.
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

  /// Updates a profiling group.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [agentOrchestrationConfig] :
  /// Specifies whether profiling is enabled or disabled for a profiling group.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to update.
  Future<UpdateProfilingGroupResponse> updateProfilingGroup({
    required AgentOrchestrationConfig agentOrchestrationConfig,
    required String profilingGroupName,
  }) async {
    final $payload = <String, dynamic>{
      'agentOrchestrationConfig': agentOrchestrationConfig,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'PUT',
      requestUri: '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return UpdateProfilingGroupResponse(
      profilingGroup: ProfilingGroupDescription.fromJson($json),
    );
  }
}

enum ActionGroup {
  agentPermissions,
}

extension ActionGroupValueExtension on ActionGroup {
  String toValue() {
    switch (this) {
      case ActionGroup.agentPermissions:
        return 'agentPermissions';
    }
  }
}

extension ActionGroupFromString on String {
  ActionGroup toActionGroup() {
    switch (this) {
      case 'agentPermissions':
        return ActionGroup.agentPermissions;
    }
    throw Exception('$this is not known in enum ActionGroup');
  }
}

/// The structure representing the AddNotificationChannelsResponse.
class AddNotificationChannelsResponse {
  /// The new notification configuration for this profiling group.
  final NotificationConfiguration? notificationConfiguration;

  AddNotificationChannelsResponse({
    this.notificationConfiguration,
  });

  factory AddNotificationChannelsResponse.fromJson(Map<String, dynamic> json) {
    return AddNotificationChannelsResponse(
      notificationConfiguration: json['notificationConfiguration'] != null
          ? NotificationConfiguration.fromJson(
              json['notificationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final notificationConfiguration = this.notificationConfiguration;
    return {
      if (notificationConfiguration != null)
        'notificationConfiguration': notificationConfiguration,
    };
  }
}

/// The response of <a
/// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
/// <code>ConfigureAgent</code> </a> that specifies if an agent profiles or not
/// and for how long to return profiling data.
class AgentConfiguration {
  /// How long a profiling agent should send profiling data using <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
  /// <code>ConfigureAgent</code> </a>. For example, if this is set to 300, the
  /// profiling agent calls <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
  /// <code>ConfigureAgent</code> </a> every 5 minutes to submit the profiled data
  /// collected during that period.
  final int periodInSeconds;

  /// A <code>Boolean</code> that specifies whether the profiling agent collects
  /// profiling data or not. Set to <code>true</code> to enable profiling.
  final bool shouldProfile;

  /// Parameters used by the profiler. The valid parameters are:
  ///
  /// <ul>
  /// <li>
  /// <code>MaxStackDepth</code> - The maximum depth of the stacks in the code
  /// that is represented in the profile. For example, if CodeGuru Profiler finds
  /// a method <code>A</code>, which calls method <code>B</code>, which calls
  /// method <code>C</code>, which calls method <code>D</code>, then the depth is
  /// 4. If the <code>maxDepth</code> is set to 2, then the profiler evaluates
  /// <code>A</code> and <code>B</code>.
  /// </li>
  /// <li>
  /// <code>MemoryUsageLimitPercent</code> - The percentage of memory that is used
  /// by the profiler.
  /// </li>
  /// <li>
  /// <code>MinimumTimeForReportingInMilliseconds</code> - The minimum time in
  /// milliseconds between sending reports.
  /// </li>
  /// <li>
  /// <code>ReportingIntervalInMilliseconds</code> - The reporting interval in
  /// milliseconds used to report profiles.
  /// </li>
  /// <li>
  /// <code>SamplingIntervalInMilliseconds</code> - The sampling interval in
  /// milliseconds that is used to profile samples.
  /// </li>
  /// </ul>
  final Map<AgentParameterField, String>? agentParameters;

  AgentConfiguration({
    required this.periodInSeconds,
    required this.shouldProfile,
    this.agentParameters,
  });

  factory AgentConfiguration.fromJson(Map<String, dynamic> json) {
    return AgentConfiguration(
      periodInSeconds: json['periodInSeconds'] as int,
      shouldProfile: json['shouldProfile'] as bool,
      agentParameters: (json['agentParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k.toAgentParameterField(), e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final periodInSeconds = this.periodInSeconds;
    final shouldProfile = this.shouldProfile;
    final agentParameters = this.agentParameters;
    return {
      'periodInSeconds': periodInSeconds,
      'shouldProfile': shouldProfile,
      if (agentParameters != null)
        'agentParameters':
            agentParameters.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// Specifies whether profiling is enabled or disabled for a profiling group. It
/// is used by <a
/// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
/// <code>ConfigureAgent</code> </a> to enable or disable profiling for a
/// profiling group.
class AgentOrchestrationConfig {
  /// A <code>Boolean</code> that specifies whether the profiling agent collects
  /// profiling data or not. Set to <code>true</code> to enable profiling.
  final bool profilingEnabled;

  AgentOrchestrationConfig({
    required this.profilingEnabled,
  });

  factory AgentOrchestrationConfig.fromJson(Map<String, dynamic> json) {
    return AgentOrchestrationConfig(
      profilingEnabled: json['profilingEnabled'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final profilingEnabled = this.profilingEnabled;
    return {
      'profilingEnabled': profilingEnabled,
    };
  }
}

enum AgentParameterField {
  samplingIntervalInMilliseconds,
  reportingIntervalInMilliseconds,
  minimumTimeForReportingInMilliseconds,
  memoryUsageLimitPercent,
  maxStackDepth,
}

extension AgentParameterFieldValueExtension on AgentParameterField {
  String toValue() {
    switch (this) {
      case AgentParameterField.samplingIntervalInMilliseconds:
        return 'SamplingIntervalInMilliseconds';
      case AgentParameterField.reportingIntervalInMilliseconds:
        return 'ReportingIntervalInMilliseconds';
      case AgentParameterField.minimumTimeForReportingInMilliseconds:
        return 'MinimumTimeForReportingInMilliseconds';
      case AgentParameterField.memoryUsageLimitPercent:
        return 'MemoryUsageLimitPercent';
      case AgentParameterField.maxStackDepth:
        return 'MaxStackDepth';
    }
  }
}

extension AgentParameterFieldFromString on String {
  AgentParameterField toAgentParameterField() {
    switch (this) {
      case 'SamplingIntervalInMilliseconds':
        return AgentParameterField.samplingIntervalInMilliseconds;
      case 'ReportingIntervalInMilliseconds':
        return AgentParameterField.reportingIntervalInMilliseconds;
      case 'MinimumTimeForReportingInMilliseconds':
        return AgentParameterField.minimumTimeForReportingInMilliseconds;
      case 'MemoryUsageLimitPercent':
        return AgentParameterField.memoryUsageLimitPercent;
      case 'MaxStackDepth':
        return AgentParameterField.maxStackDepth;
    }
    throw Exception('$this is not known in enum AgentParameterField');
  }
}

/// Specifies the aggregation period and aggregation start time for an
/// aggregated profile. An aggregated profile is used to collect posted agent
/// profiles during an aggregation period. There are three possible aggregation
/// periods (1 day, 1 hour, or 5 minutes).
class AggregatedProfileTime {
  /// The aggregation period. This indicates the period during which an
  /// aggregation profile collects posted agent profiles for a profiling group.
  /// Use one of three valid durations that are specified using the ISO 8601
  /// format.
  ///
  /// <ul>
  /// <li>
  /// <code>P1D</code> — 1 day
  /// </li>
  /// <li>
  /// <code>PT1H</code> — 1 hour
  /// </li>
  /// <li>
  /// <code>PT5M</code> — 5 minutes
  /// </li>
  /// </ul>
  final AggregationPeriod? period;

  /// The time that aggregation of posted agent profiles for a profiling group
  /// starts. The aggregation profile contains profiles posted by the agent
  /// starting at this time for an aggregation period specified by the
  /// <code>period</code> property of the <code>AggregatedProfileTime</code>
  /// object.
  ///
  /// Specify <code>start</code> using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  final DateTime? start;

  AggregatedProfileTime({
    this.period,
    this.start,
  });

  factory AggregatedProfileTime.fromJson(Map<String, dynamic> json) {
    return AggregatedProfileTime(
      period: (json['period'] as String?)?.toAggregationPeriod(),
      start: timeStampFromJson(json['start']),
    );
  }

  Map<String, dynamic> toJson() {
    final period = this.period;
    final start = this.start;
    return {
      if (period != null) 'period': period.toValue(),
      if (start != null) 'start': iso8601ToJson(start),
    };
  }
}

enum AggregationPeriod {
  pt5m,
  pt1h,
  p1d,
}

extension AggregationPeriodValueExtension on AggregationPeriod {
  String toValue() {
    switch (this) {
      case AggregationPeriod.pt5m:
        return 'PT5M';
      case AggregationPeriod.pt1h:
        return 'PT1H';
      case AggregationPeriod.p1d:
        return 'P1D';
    }
  }
}

extension AggregationPeriodFromString on String {
  AggregationPeriod toAggregationPeriod() {
    switch (this) {
      case 'PT5M':
        return AggregationPeriod.pt5m;
      case 'PT1H':
        return AggregationPeriod.pt1h;
      case 'P1D':
        return AggregationPeriod.p1d;
    }
    throw Exception('$this is not known in enum AggregationPeriod');
  }
}

/// Details about an anomaly in a specific metric of application profile. The
/// anomaly is detected using analysis of the metric data over a period of time.
class Anomaly {
  /// A list of the instances of the detected anomalies during the requested
  /// period.
  final List<AnomalyInstance> instances;

  /// Details about the metric that the analysis used when it detected the
  /// anomaly. The metric includes the name of the frame that was analyzed with
  /// the type and thread states used to derive the metric value for that frame.
  final Metric metric;

  /// The reason for which metric was flagged as anomalous.
  final String reason;

  Anomaly({
    required this.instances,
    required this.metric,
    required this.reason,
  });

  factory Anomaly.fromJson(Map<String, dynamic> json) {
    return Anomaly(
      instances: (json['instances'] as List)
          .whereNotNull()
          .map((e) => AnomalyInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      metric: Metric.fromJson(json['metric'] as Map<String, dynamic>),
      reason: json['reason'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final metric = this.metric;
    final reason = this.reason;
    return {
      'instances': instances,
      'metric': metric,
      'reason': reason,
    };
  }
}

/// The specific duration in which the metric is flagged as anomalous.
class AnomalyInstance {
  /// The universally unique identifier (UUID) of an instance of an anomaly in a
  /// metric.
  final String id;

  /// The start time of the period during which the metric is flagged as
  /// anomalous. This is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  final DateTime startTime;

  /// The end time of the period during which the metric is flagged as anomalous.
  /// This is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  final DateTime? endTime;

  /// Feedback type on a specific instance of anomaly submitted by the user.
  final UserFeedback? userFeedback;

  AnomalyInstance({
    required this.id,
    required this.startTime,
    this.endTime,
    this.userFeedback,
  });

  factory AnomalyInstance.fromJson(Map<String, dynamic> json) {
    return AnomalyInstance(
      id: json['id'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      endTime: timeStampFromJson(json['endTime']),
      userFeedback: json['userFeedback'] != null
          ? UserFeedback.fromJson(json['userFeedback'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final startTime = this.startTime;
    final endTime = this.endTime;
    final userFeedback = this.userFeedback;
    return {
      'id': id,
      'startTime': iso8601ToJson(startTime),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (userFeedback != null) 'userFeedback': userFeedback,
    };
  }
}

/// The structure representing the BatchGetFrameMetricDataResponse.
class BatchGetFrameMetricDataResponse {
  /// The end time of the time period for the returned time series values. This is
  /// specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
  /// represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime endTime;

  /// List of instances, or time steps, in the time series. For example, if the
  /// <code>period</code> is one day (<code>PT24H)</code>), and the
  /// <code>resolution</code> is five minutes (<code>PT5M</code>), then there are
  /// 288 <code>endTimes</code> in the list that are each five minutes appart.
  final List<TimestampStructure> endTimes;

  /// Details of the metrics to request a time series of values. The metric
  /// includes the name of the frame, the aggregation type to calculate the metric
  /// value for the frame, and the thread states to use to get the count for the
  /// metric value of the frame.
  final List<FrameMetricDatum> frameMetricData;

  /// Resolution or granularity of the profile data used to generate the time
  /// series. This is the value used to jump through time steps in a time series.
  /// There are 3 valid values.
  ///
  /// <ul>
  /// <li>
  /// <code>P1D</code> — 1 day
  /// </li>
  /// <li>
  /// <code>PT1H</code> — 1 hour
  /// </li>
  /// <li>
  /// <code>PT5M</code> — 5 minutes
  /// </li>
  /// </ul>
  final AggregationPeriod resolution;

  /// The start time of the time period for the returned time series values. This
  /// is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  final DateTime startTime;

  /// List of instances which remained unprocessed. This will create a missing
  /// time step in the list of end times.
  final Map<String, List<TimestampStructure>> unprocessedEndTimes;

  BatchGetFrameMetricDataResponse({
    required this.endTime,
    required this.endTimes,
    required this.frameMetricData,
    required this.resolution,
    required this.startTime,
    required this.unprocessedEndTimes,
  });

  factory BatchGetFrameMetricDataResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetFrameMetricDataResponse(
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      endTimes: (json['endTimes'] as List)
          .whereNotNull()
          .map((e) => TimestampStructure.fromJson(e as Map<String, dynamic>))
          .toList(),
      frameMetricData: (json['frameMetricData'] as List)
          .whereNotNull()
          .map((e) => FrameMetricDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
      resolution: (json['resolution'] as String).toAggregationPeriod(),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      unprocessedEndTimes: (json['unprocessedEndTimes'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) =>
                      TimestampStructure.fromJson(e as Map<String, dynamic>))
                  .toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final endTimes = this.endTimes;
    final frameMetricData = this.frameMetricData;
    final resolution = this.resolution;
    final startTime = this.startTime;
    final unprocessedEndTimes = this.unprocessedEndTimes;
    return {
      'endTime': iso8601ToJson(endTime),
      'endTimes': endTimes,
      'frameMetricData': frameMetricData,
      'resolution': resolution.toValue(),
      'startTime': iso8601ToJson(startTime),
      'unprocessedEndTimes': unprocessedEndTimes,
    };
  }
}

/// Notification medium for users to get alerted for events that occur in
/// application profile. We support SNS topic as a notification channel.
class Channel {
  /// List of publishers for different type of events that may be detected in an
  /// application from the profile. Anomaly detection is the only event publisher
  /// in Profiler.
  final List<EventPublisher> eventPublishers;

  /// Unique arn of the resource to be used for notifications. We support a valid
  /// SNS topic arn as a channel uri.
  final String uri;

  /// Unique identifier for each <code>Channel</code> in the notification
  /// configuration of a Profiling Group. A random UUID for channelId is used when
  /// adding a channel to the notification configuration if not specified in the
  /// request.
  final String? id;

  Channel({
    required this.eventPublishers,
    required this.uri,
    this.id,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      eventPublishers: (json['eventPublishers'] as List)
          .whereNotNull()
          .map((e) => (e as String).toEventPublisher())
          .toList(),
      uri: json['uri'] as String,
      id: json['id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eventPublishers = this.eventPublishers;
    final uri = this.uri;
    final id = this.id;
    return {
      'eventPublishers': eventPublishers.map((e) => e.toValue()).toList(),
      'uri': uri,
      if (id != null) 'id': id,
    };
  }
}

enum ComputePlatform {
  $default,
  awsLambda,
}

extension ComputePlatformValueExtension on ComputePlatform {
  String toValue() {
    switch (this) {
      case ComputePlatform.$default:
        return 'Default';
      case ComputePlatform.awsLambda:
        return 'AWSLambda';
    }
  }
}

extension ComputePlatformFromString on String {
  ComputePlatform toComputePlatform() {
    switch (this) {
      case 'Default':
        return ComputePlatform.$default;
      case 'AWSLambda':
        return ComputePlatform.awsLambda;
    }
    throw Exception('$this is not known in enum ComputePlatform');
  }
}

/// The structure representing the configureAgentResponse.
class ConfigureAgentResponse {
  /// An <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AgentConfiguration.html">
  /// <code>AgentConfiguration</code> </a> object that specifies if an agent
  /// profiles or not and for how long to return profiling data.
  final AgentConfiguration configuration;

  ConfigureAgentResponse({
    required this.configuration,
  });

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    return {
      'configuration': configuration,
    };
  }
}

/// The structure representing the createProfilingGroupResponse.
class CreateProfilingGroupResponse {
  /// The returned <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> object that contains information
  /// about the created profiling group.
  final ProfilingGroupDescription profilingGroup;

  CreateProfilingGroupResponse({
    required this.profilingGroup,
  });

  Map<String, dynamic> toJson() {
    final profilingGroup = this.profilingGroup;
    return {
      'profilingGroup': profilingGroup,
    };
  }
}

/// The structure representing the deleteProfilingGroupResponse.
class DeleteProfilingGroupResponse {
  DeleteProfilingGroupResponse();

  factory DeleteProfilingGroupResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProfilingGroupResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The structure representing the describeProfilingGroupResponse.
class DescribeProfilingGroupResponse {
  /// The returned <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> object that contains information
  /// about the requested profiling group.
  final ProfilingGroupDescription profilingGroup;

  DescribeProfilingGroupResponse({
    required this.profilingGroup,
  });

  Map<String, dynamic> toJson() {
    final profilingGroup = this.profilingGroup;
    return {
      'profilingGroup': profilingGroup,
    };
  }
}

enum EventPublisher {
  anomalyDetection,
}

extension EventPublisherValueExtension on EventPublisher {
  String toValue() {
    switch (this) {
      case EventPublisher.anomalyDetection:
        return 'AnomalyDetection';
    }
  }
}

extension EventPublisherFromString on String {
  EventPublisher toEventPublisher() {
    switch (this) {
      case 'AnomalyDetection':
        return EventPublisher.anomalyDetection;
    }
    throw Exception('$this is not known in enum EventPublisher');
  }
}

enum FeedbackType {
  positive,
  negative,
}

extension FeedbackTypeValueExtension on FeedbackType {
  String toValue() {
    switch (this) {
      case FeedbackType.positive:
        return 'Positive';
      case FeedbackType.negative:
        return 'Negative';
    }
  }
}

extension FeedbackTypeFromString on String {
  FeedbackType toFeedbackType() {
    switch (this) {
      case 'Positive':
        return FeedbackType.positive;
      case 'Negative':
        return FeedbackType.negative;
    }
    throw Exception('$this is not known in enum FeedbackType');
  }
}

/// Information about potential recommendations that might be created from the
/// analysis of profiling data.
class FindingsReportSummary {
  /// The universally unique identifier (UUID) of the recommendation report.
  final String? id;

  /// The end time of the period during which the metric is flagged as anomalous.
  /// This is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  final DateTime? profileEndTime;

  /// The start time of the profile the analysis data is about. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime? profileStartTime;

  /// The name of the profiling group that is associated with the analysis data.
  final String? profilingGroupName;

  /// The total number of different recommendations that were found by the
  /// analysis.
  final int? totalNumberOfFindings;

  FindingsReportSummary({
    this.id,
    this.profileEndTime,
    this.profileStartTime,
    this.profilingGroupName,
    this.totalNumberOfFindings,
  });

  factory FindingsReportSummary.fromJson(Map<String, dynamic> json) {
    return FindingsReportSummary(
      id: json['id'] as String?,
      profileEndTime: timeStampFromJson(json['profileEndTime']),
      profileStartTime: timeStampFromJson(json['profileStartTime']),
      profilingGroupName: json['profilingGroupName'] as String?,
      totalNumberOfFindings: json['totalNumberOfFindings'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final profileEndTime = this.profileEndTime;
    final profileStartTime = this.profileStartTime;
    final profilingGroupName = this.profilingGroupName;
    final totalNumberOfFindings = this.totalNumberOfFindings;
    return {
      if (id != null) 'id': id,
      if (profileEndTime != null)
        'profileEndTime': iso8601ToJson(profileEndTime),
      if (profileStartTime != null)
        'profileStartTime': iso8601ToJson(profileStartTime),
      if (profilingGroupName != null) 'profilingGroupName': profilingGroupName,
      if (totalNumberOfFindings != null)
        'totalNumberOfFindings': totalNumberOfFindings,
    };
  }
}

/// The frame name, metric type, and thread states. These are used to derive the
/// value of the metric for the frame.
class FrameMetric {
  /// Name of the method common across the multiple occurrences of a frame in an
  /// application profile.
  final String frameName;

  /// List of application runtime thread states used to get the counts for a frame
  /// a derive a metric value.
  final List<String> threadStates;

  /// A type of aggregation that specifies how a metric for a frame is analyzed.
  /// The supported value <code>AggregatedRelativeTotalTime</code> is an
  /// aggregation of the metric value for one frame that is calculated across the
  /// occurrences of all frames in a profile.
  final MetricType type;

  FrameMetric({
    required this.frameName,
    required this.threadStates,
    required this.type,
  });

  factory FrameMetric.fromJson(Map<String, dynamic> json) {
    return FrameMetric(
      frameName: json['frameName'] as String,
      threadStates: (json['threadStates'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String).toMetricType(),
    );
  }

  Map<String, dynamic> toJson() {
    final frameName = this.frameName;
    final threadStates = this.threadStates;
    final type = this.type;
    return {
      'frameName': frameName,
      'threadStates': threadStates,
      'type': type.toValue(),
    };
  }
}

/// Information about a frame metric and its values.
class FrameMetricDatum {
  final FrameMetric frameMetric;

  /// A list of values that are associated with a frame metric.
  final List<double> values;

  FrameMetricDatum({
    required this.frameMetric,
    required this.values,
  });

  factory FrameMetricDatum.fromJson(Map<String, dynamic> json) {
    return FrameMetricDatum(
      frameMetric:
          FrameMetric.fromJson(json['frameMetric'] as Map<String, dynamic>),
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as double)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final frameMetric = this.frameMetric;
    final values = this.values;
    return {
      'frameMetric': frameMetric,
      'values': values,
    };
  }
}

/// The structure representing the GetFindingsReportAccountSummaryResponse.
class GetFindingsReportAccountSummaryResponse {
  /// The return list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_FindingsReportSummary.html">
  /// <code>FindingsReportSummary</code> </a> objects taht contain summaries of
  /// analysis results for all profiling groups in your AWS account.
  final List<FindingsReportSummary> reportSummaries;

  /// The <code>nextToken</code> value to include in a future
  /// <code>GetFindingsReportAccountSummary</code> request. When the results of a
  /// <code>GetFindingsReportAccountSummary</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  final String? nextToken;

  GetFindingsReportAccountSummaryResponse({
    required this.reportSummaries,
    this.nextToken,
  });

  factory GetFindingsReportAccountSummaryResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFindingsReportAccountSummaryResponse(
      reportSummaries: (json['reportSummaries'] as List)
          .whereNotNull()
          .map((e) => FindingsReportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reportSummaries = this.reportSummaries;
    final nextToken = this.nextToken;
    return {
      'reportSummaries': reportSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The structure representing the GetNotificationConfigurationResponse.
class GetNotificationConfigurationResponse {
  /// The current notification configuration for this profiling group.
  final NotificationConfiguration notificationConfiguration;

  GetNotificationConfigurationResponse({
    required this.notificationConfiguration,
  });

  factory GetNotificationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetNotificationConfigurationResponse(
      notificationConfiguration: NotificationConfiguration.fromJson(
          json['notificationConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationConfiguration = this.notificationConfiguration;
    return {
      'notificationConfiguration': notificationConfiguration,
    };
  }
}

/// The structure representing the <code>getPolicyResponse</code>.
class GetPolicyResponse {
  /// The JSON-formatted resource-based policy attached to the
  /// <code>ProfilingGroup</code>.
  final String policy;

  /// A unique identifier for the current revision of the returned policy.
  final String revisionId;

  GetPolicyResponse({
    required this.policy,
    required this.revisionId,
  });

  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetPolicyResponse(
      policy: json['policy'] as String,
      revisionId: json['revisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      'policy': policy,
      'revisionId': revisionId,
    };
  }
}

/// The structure representing the getProfileResponse.
class GetProfileResponse {
  /// The content type of the profile in the payload. It is either
  /// <code>application/json</code> or the default
  /// <code>application/x-amzn-ion</code>.
  final String contentType;

  /// Information about the profile.
  final Uint8List profile;

  /// The content encoding of the profile.
  final String? contentEncoding;

  GetProfileResponse({
    required this.contentType,
    required this.profile,
    this.contentEncoding,
  });

  Map<String, dynamic> toJson() {
    final contentType = this.contentType;
    final profile = this.profile;
    final contentEncoding = this.contentEncoding;
    return {
      'profile': base64Encode(profile),
    };
  }
}

/// The structure representing the GetRecommendationsResponse.
class GetRecommendationsResponse {
  /// The list of anomalies that the analysis has found for this profile.
  final List<Anomaly> anomalies;

  /// The end time of the profile the analysis data is about. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime profileEndTime;

  /// The start time of the profile the analysis data is about. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime profileStartTime;

  /// The name of the profiling group the analysis data is about.
  final String profilingGroupName;

  /// The list of recommendations that the analysis found for this profile.
  final List<Recommendation> recommendations;

  GetRecommendationsResponse({
    required this.anomalies,
    required this.profileEndTime,
    required this.profileStartTime,
    required this.profilingGroupName,
    required this.recommendations,
  });

  factory GetRecommendationsResponse.fromJson(Map<String, dynamic> json) {
    return GetRecommendationsResponse(
      anomalies: (json['anomalies'] as List)
          .whereNotNull()
          .map((e) => Anomaly.fromJson(e as Map<String, dynamic>))
          .toList(),
      profileEndTime:
          nonNullableTimeStampFromJson(json['profileEndTime'] as Object),
      profileStartTime:
          nonNullableTimeStampFromJson(json['profileStartTime'] as Object),
      profilingGroupName: json['profilingGroupName'] as String,
      recommendations: (json['recommendations'] as List)
          .whereNotNull()
          .map((e) => Recommendation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final anomalies = this.anomalies;
    final profileEndTime = this.profileEndTime;
    final profileStartTime = this.profileStartTime;
    final profilingGroupName = this.profilingGroupName;
    final recommendations = this.recommendations;
    return {
      'anomalies': anomalies,
      'profileEndTime': iso8601ToJson(profileEndTime),
      'profileStartTime': iso8601ToJson(profileStartTime),
      'profilingGroupName': profilingGroupName,
      'recommendations': recommendations,
    };
  }
}

/// The structure representing the ListFindingsReportsResponse.
class ListFindingsReportsResponse {
  /// The list of analysis results summaries.
  final List<FindingsReportSummary> findingsReportSummaries;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListFindingsReports</code> request. When the results of a
  /// <code>ListFindingsReports</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListFindingsReportsResponse({
    required this.findingsReportSummaries,
    this.nextToken,
  });

  factory ListFindingsReportsResponse.fromJson(Map<String, dynamic> json) {
    return ListFindingsReportsResponse(
      findingsReportSummaries: (json['findingsReportSummaries'] as List)
          .whereNotNull()
          .map((e) => FindingsReportSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final findingsReportSummaries = this.findingsReportSummaries;
    final nextToken = this.nextToken;
    return {
      'findingsReportSummaries': findingsReportSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The structure representing the listProfileTimesResponse.
class ListProfileTimesResponse {
  /// The list of start times of the available profiles for the aggregation period
  /// in the specified time range.
  final List<ProfileTime> profileTimes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListProfileTimes</code> request. When the results of a
  /// <code>ListProfileTimes</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  ListProfileTimesResponse({
    required this.profileTimes,
    this.nextToken,
  });

  factory ListProfileTimesResponse.fromJson(Map<String, dynamic> json) {
    return ListProfileTimesResponse(
      profileTimes: (json['profileTimes'] as List)
          .whereNotNull()
          .map((e) => ProfileTime.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final profileTimes = this.profileTimes;
    final nextToken = this.nextToken;
    return {
      'profileTimes': profileTimes,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// The structure representing the listProfilingGroupsResponse.
class ListProfilingGroupsResponse {
  /// A returned list of profiling group names. A list of the names is returned
  /// only if <code>includeDescription</code> is <code>false</code>, otherwise a
  /// list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects is returned.
  final List<String> profilingGroupNames;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListProfilingGroups</code> request. When the results of a
  /// <code>ListProfilingGroups</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A returned list <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects. A list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects is returned only if
  /// <code>includeDescription</code> is <code>true</code>, otherwise a list of
  /// profiling group names is returned.
  final List<ProfilingGroupDescription>? profilingGroups;

  ListProfilingGroupsResponse({
    required this.profilingGroupNames,
    this.nextToken,
    this.profilingGroups,
  });

  factory ListProfilingGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListProfilingGroupsResponse(
      profilingGroupNames: (json['profilingGroupNames'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['nextToken'] as String?,
      profilingGroups: (json['profilingGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ProfilingGroupDescription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final profilingGroupNames = this.profilingGroupNames;
    final nextToken = this.nextToken;
    final profilingGroups = this.profilingGroups;
    return {
      'profilingGroupNames': profilingGroupNames,
      if (nextToken != null) 'nextToken': nextToken,
      if (profilingGroups != null) 'profilingGroups': profilingGroups,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of tags assigned to the specified resource. This is the list of
  /// tags returned in the response.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// The part of a profile that contains a recommendation found during analysis.
class Match {
  /// The location in the profiling graph that contains a recommendation found
  /// during analysis.
  final String? frameAddress;

  /// The target frame that triggered a match.
  final int? targetFramesIndex;

  /// The value in the profile data that exceeded the recommendation threshold.
  final double? thresholdBreachValue;

  Match({
    this.frameAddress,
    this.targetFramesIndex,
    this.thresholdBreachValue,
  });

  factory Match.fromJson(Map<String, dynamic> json) {
    return Match(
      frameAddress: json['frameAddress'] as String?,
      targetFramesIndex: json['targetFramesIndex'] as int?,
      thresholdBreachValue: json['thresholdBreachValue'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final frameAddress = this.frameAddress;
    final targetFramesIndex = this.targetFramesIndex;
    final thresholdBreachValue = this.thresholdBreachValue;
    return {
      if (frameAddress != null) 'frameAddress': frameAddress,
      if (targetFramesIndex != null) 'targetFramesIndex': targetFramesIndex,
      if (thresholdBreachValue != null)
        'thresholdBreachValue': thresholdBreachValue,
    };
  }
}

enum MetadataField {
  computePlatform,
  agentId,
  awsRequestId,
  executionEnvironment,
  lambdaFunctionArn,
  lambdaMemoryLimitInMB,
  lambdaRemainingTimeInMilliseconds,
  lambdaTimeGapBetweenInvokesInMilliseconds,
  lambdaPreviousExecutionTimeInMilliseconds,
}

extension MetadataFieldValueExtension on MetadataField {
  String toValue() {
    switch (this) {
      case MetadataField.computePlatform:
        return 'ComputePlatform';
      case MetadataField.agentId:
        return 'AgentId';
      case MetadataField.awsRequestId:
        return 'AwsRequestId';
      case MetadataField.executionEnvironment:
        return 'ExecutionEnvironment';
      case MetadataField.lambdaFunctionArn:
        return 'LambdaFunctionArn';
      case MetadataField.lambdaMemoryLimitInMB:
        return 'LambdaMemoryLimitInMB';
      case MetadataField.lambdaRemainingTimeInMilliseconds:
        return 'LambdaRemainingTimeInMilliseconds';
      case MetadataField.lambdaTimeGapBetweenInvokesInMilliseconds:
        return 'LambdaTimeGapBetweenInvokesInMilliseconds';
      case MetadataField.lambdaPreviousExecutionTimeInMilliseconds:
        return 'LambdaPreviousExecutionTimeInMilliseconds';
    }
  }
}

extension MetadataFieldFromString on String {
  MetadataField toMetadataField() {
    switch (this) {
      case 'ComputePlatform':
        return MetadataField.computePlatform;
      case 'AgentId':
        return MetadataField.agentId;
      case 'AwsRequestId':
        return MetadataField.awsRequestId;
      case 'ExecutionEnvironment':
        return MetadataField.executionEnvironment;
      case 'LambdaFunctionArn':
        return MetadataField.lambdaFunctionArn;
      case 'LambdaMemoryLimitInMB':
        return MetadataField.lambdaMemoryLimitInMB;
      case 'LambdaRemainingTimeInMilliseconds':
        return MetadataField.lambdaRemainingTimeInMilliseconds;
      case 'LambdaTimeGapBetweenInvokesInMilliseconds':
        return MetadataField.lambdaTimeGapBetweenInvokesInMilliseconds;
      case 'LambdaPreviousExecutionTimeInMilliseconds':
        return MetadataField.lambdaPreviousExecutionTimeInMilliseconds;
    }
    throw Exception('$this is not known in enum MetadataField');
  }
}

/// Details about the metric that the analysis used when it detected the
/// anomaly. The metric what is analyzed to create recommendations. It includes
/// the name of the frame that was analyzed and the type and thread states used
/// to derive the metric value for that frame.
class Metric {
  /// The name of the method that appears as a frame in any stack in a profile.
  final String frameName;

  /// The list of application runtime thread states that is used to calculate the
  /// metric value for the frame.
  final List<String> threadStates;

  /// A type that specifies how a metric for a frame is analyzed. The supported
  /// value <code>AggregatedRelativeTotalTime</code> is an aggregation of the
  /// metric value for one frame that is calculated across the occurences of all
  /// frames in a profile.
  final MetricType type;

  Metric({
    required this.frameName,
    required this.threadStates,
    required this.type,
  });

  factory Metric.fromJson(Map<String, dynamic> json) {
    return Metric(
      frameName: json['frameName'] as String,
      threadStates: (json['threadStates'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: (json['type'] as String).toMetricType(),
    );
  }

  Map<String, dynamic> toJson() {
    final frameName = this.frameName;
    final threadStates = this.threadStates;
    final type = this.type;
    return {
      'frameName': frameName,
      'threadStates': threadStates,
      'type': type.toValue(),
    };
  }
}

enum MetricType {
  aggregatedRelativeTotalTime,
}

extension MetricTypeValueExtension on MetricType {
  String toValue() {
    switch (this) {
      case MetricType.aggregatedRelativeTotalTime:
        return 'AggregatedRelativeTotalTime';
    }
  }
}

extension MetricTypeFromString on String {
  MetricType toMetricType() {
    switch (this) {
      case 'AggregatedRelativeTotalTime':
        return MetricType.aggregatedRelativeTotalTime;
    }
    throw Exception('$this is not known in enum MetricType');
  }
}

/// The configuration for notifications stored for each profiling group. This
/// includes up to to two channels and a list of event publishers associated
/// with each channel.
class NotificationConfiguration {
  /// List of up to two channels to be used for sending notifications for events
  /// detected from the application profile.
  final List<Channel>? channels;

  NotificationConfiguration({
    this.channels,
  });

  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) {
    return NotificationConfiguration(
      channels: (json['channels'] as List?)
          ?.whereNotNull()
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    return {
      if (channels != null) 'channels': channels,
    };
  }
}

enum OrderBy {
  timestampDescending,
  timestampAscending,
}

extension OrderByValueExtension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.timestampDescending:
        return 'TimestampDescending';
      case OrderBy.timestampAscending:
        return 'TimestampAscending';
    }
  }
}

extension OrderByFromString on String {
  OrderBy toOrderBy() {
    switch (this) {
      case 'TimestampDescending':
        return OrderBy.timestampDescending;
      case 'TimestampAscending':
        return OrderBy.timestampAscending;
    }
    throw Exception('$this is not known in enum OrderBy');
  }
}

/// A set of rules used to make a recommendation during an analysis.
class Pattern {
  /// A list of the different counters used to determine if there is a match.
  final List<String>? countersToAggregate;

  /// The description of the recommendation. This explains a potential
  /// inefficiency in a profiled application.
  final String? description;

  /// The universally unique identifier (UUID) of this pattern.
  final String? id;

  /// The name for this pattern.
  final String? name;

  /// A string that contains the steps recommended to address the potential
  /// inefficiency.
  final String? resolutionSteps;

  /// A list of frame names that were searched during the analysis that generated
  /// a recommendation.
  final List<List<String>>? targetFrames;

  /// The percentage of time an application spends in one method that triggers a
  /// recommendation. The percentage of time is the same as the percentage of the
  /// total gathered sample counts during analysis.
  final double? thresholdPercent;

  Pattern({
    this.countersToAggregate,
    this.description,
    this.id,
    this.name,
    this.resolutionSteps,
    this.targetFrames,
    this.thresholdPercent,
  });

  factory Pattern.fromJson(Map<String, dynamic> json) {
    return Pattern(
      countersToAggregate: (json['countersToAggregate'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      resolutionSteps: json['resolutionSteps'] as String?,
      targetFrames: (json['targetFrames'] as List?)
          ?.whereNotNull()
          .map((e) =>
              (e as List).whereNotNull().map((e) => e as String).toList())
          .toList(),
      thresholdPercent: json['thresholdPercent'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final countersToAggregate = this.countersToAggregate;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final resolutionSteps = this.resolutionSteps;
    final targetFrames = this.targetFrames;
    final thresholdPercent = this.thresholdPercent;
    return {
      if (countersToAggregate != null)
        'countersToAggregate': countersToAggregate,
      if (description != null) 'description': description,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (resolutionSteps != null) 'resolutionSteps': resolutionSteps,
      if (targetFrames != null) 'targetFrames': targetFrames,
      if (thresholdPercent != null) 'thresholdPercent': thresholdPercent,
    };
  }
}

/// The structure representing the postAgentProfileResponse.
class PostAgentProfileResponse {
  PostAgentProfileResponse();

  factory PostAgentProfileResponse.fromJson(Map<String, dynamic> _) {
    return PostAgentProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains the start time of a profile.
class ProfileTime {
  /// The start time of a profile. It is specified using the ISO 8601 format. For
  /// example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
  /// 1:15:02 PM UTC.
  final DateTime? start;

  ProfileTime({
    this.start,
  });

  factory ProfileTime.fromJson(Map<String, dynamic> json) {
    return ProfileTime(
      start: timeStampFromJson(json['start']),
    );
  }

  Map<String, dynamic> toJson() {
    final start = this.start;
    return {
      if (start != null) 'start': iso8601ToJson(start),
    };
  }
}

/// Contains information about a profiling group.
class ProfilingGroupDescription {
  /// An <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AgentOrchestrationConfig.html">
  /// <code>AgentOrchestrationConfig</code> </a> object that indicates if the
  /// profiling group is enabled for profiled or not.
  final AgentOrchestrationConfig? agentOrchestrationConfig;

  /// The Amazon Resource Name (ARN) identifying the profiling group resource.
  final String? arn;

  /// The compute platform of the profiling group. If it is set to
  /// <code>AWSLambda</code>, then the profiled application runs on AWS Lambda. If
  /// it is set to <code>Default</code>, then the profiled application runs on a
  /// compute platform that is not AWS Lambda, such an Amazon EC2 instance, an
  /// on-premises server, or a different platform. The default is
  /// <code>Default</code>.
  final ComputePlatform? computePlatform;

  /// The time when the profiling group was created. Specify using the ISO 8601
  /// format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past
  /// June 1, 2020 1:15:02 PM UTC.
  final DateTime? createdAt;

  /// The name of the profiling group.
  final String? name;

  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingStatus.html">
  /// <code>ProfilingStatus</code> </a> object that includes information about the
  /// last time a profile agent pinged back, the last time a profile was received,
  /// and the aggregation period and start time for the most recent aggregated
  /// profile.
  final ProfilingStatus? profilingStatus;

  /// A list of the tags that belong to this profiling group.
  final Map<String, String>? tags;

  /// The date and time when the profiling group was last updated. Specify using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime? updatedAt;

  ProfilingGroupDescription({
    this.agentOrchestrationConfig,
    this.arn,
    this.computePlatform,
    this.createdAt,
    this.name,
    this.profilingStatus,
    this.tags,
    this.updatedAt,
  });

  factory ProfilingGroupDescription.fromJson(Map<String, dynamic> json) {
    return ProfilingGroupDescription(
      agentOrchestrationConfig: json['agentOrchestrationConfig'] != null
          ? AgentOrchestrationConfig.fromJson(
              json['agentOrchestrationConfig'] as Map<String, dynamic>)
          : null,
      arn: json['arn'] as String?,
      computePlatform:
          (json['computePlatform'] as String?)?.toComputePlatform(),
      createdAt: timeStampFromJson(json['createdAt']),
      name: json['name'] as String?,
      profilingStatus: json['profilingStatus'] != null
          ? ProfilingStatus.fromJson(
              json['profilingStatus'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      updatedAt: timeStampFromJson(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final agentOrchestrationConfig = this.agentOrchestrationConfig;
    final arn = this.arn;
    final computePlatform = this.computePlatform;
    final createdAt = this.createdAt;
    final name = this.name;
    final profilingStatus = this.profilingStatus;
    final tags = this.tags;
    final updatedAt = this.updatedAt;
    return {
      if (agentOrchestrationConfig != null)
        'agentOrchestrationConfig': agentOrchestrationConfig,
      if (arn != null) 'arn': arn,
      if (computePlatform != null) 'computePlatform': computePlatform.toValue(),
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (name != null) 'name': name,
      if (profilingStatus != null) 'profilingStatus': profilingStatus,
      if (tags != null) 'tags': tags,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

/// Profiling status includes information about the last time a profile agent
/// pinged back, the last time a profile was received, and the aggregation
/// period and start time for the most recent aggregated profile.
class ProfilingStatus {
  /// The date and time when the profiling agent most recently pinged back.
  /// Specify using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
  /// represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime? latestAgentOrchestratedAt;

  /// The date and time when the most recent profile was received. Specify using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime? latestAgentProfileReportedAt;

  /// An <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html">
  /// <code>AggregatedProfileTime</code> </a> object that contains the aggregation
  /// period and start time for an aggregated profile.
  final AggregatedProfileTime? latestAggregatedProfile;

  ProfilingStatus({
    this.latestAgentOrchestratedAt,
    this.latestAgentProfileReportedAt,
    this.latestAggregatedProfile,
  });

  factory ProfilingStatus.fromJson(Map<String, dynamic> json) {
    return ProfilingStatus(
      latestAgentOrchestratedAt:
          timeStampFromJson(json['latestAgentOrchestratedAt']),
      latestAgentProfileReportedAt:
          timeStampFromJson(json['latestAgentProfileReportedAt']),
      latestAggregatedProfile: json['latestAggregatedProfile'] != null
          ? AggregatedProfileTime.fromJson(
              json['latestAggregatedProfile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final latestAgentOrchestratedAt = this.latestAgentOrchestratedAt;
    final latestAgentProfileReportedAt = this.latestAgentProfileReportedAt;
    final latestAggregatedProfile = this.latestAggregatedProfile;
    return {
      if (latestAgentOrchestratedAt != null)
        'latestAgentOrchestratedAt': iso8601ToJson(latestAgentOrchestratedAt),
      if (latestAgentProfileReportedAt != null)
        'latestAgentProfileReportedAt':
            iso8601ToJson(latestAgentProfileReportedAt),
      if (latestAggregatedProfile != null)
        'latestAggregatedProfile': latestAggregatedProfile,
    };
  }
}

/// The structure representing the <code>putPermissionResponse</code>.
class PutPermissionResponse {
  /// The JSON-formatted resource-based policy on the profiling group that
  /// includes the added permissions.
  final String policy;

  /// A universally unique identifier (UUID) for the revision of the
  /// resource-based policy that includes the added permissions. The
  /// JSON-formatted policy is in the <code>policy</code> element of the response.
  final String revisionId;

  PutPermissionResponse({
    required this.policy,
    required this.revisionId,
  });

  factory PutPermissionResponse.fromJson(Map<String, dynamic> json) {
    return PutPermissionResponse(
      policy: json['policy'] as String,
      revisionId: json['revisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      'policy': policy,
      'revisionId': revisionId,
    };
  }
}

/// A potential improvement that was found from analyzing the profiling data.
class Recommendation {
  /// How many different places in the profile graph triggered a match.
  final int allMatchesCount;

  /// How much of the total sample count is potentially affected.
  final double allMatchesSum;

  /// End time of the profile that was used by this analysis. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime endTime;

  /// The pattern that analysis recognized in the profile to make this
  /// recommendation.
  final Pattern pattern;

  /// The start time of the profile that was used by this analysis. This is
  /// specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
  /// represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  final DateTime startTime;

  /// List of the matches with most impact.
  final List<Match> topMatches;

  Recommendation({
    required this.allMatchesCount,
    required this.allMatchesSum,
    required this.endTime,
    required this.pattern,
    required this.startTime,
    required this.topMatches,
  });

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
      allMatchesCount: json['allMatchesCount'] as int,
      allMatchesSum: json['allMatchesSum'] as double,
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      pattern: Pattern.fromJson(json['pattern'] as Map<String, dynamic>),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      topMatches: (json['topMatches'] as List)
          .whereNotNull()
          .map((e) => Match.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allMatchesCount = this.allMatchesCount;
    final allMatchesSum = this.allMatchesSum;
    final endTime = this.endTime;
    final pattern = this.pattern;
    final startTime = this.startTime;
    final topMatches = this.topMatches;
    return {
      'allMatchesCount': allMatchesCount,
      'allMatchesSum': allMatchesSum,
      'endTime': iso8601ToJson(endTime),
      'pattern': pattern,
      'startTime': iso8601ToJson(startTime),
      'topMatches': topMatches,
    };
  }
}

/// The structure representing the RemoveNotificationChannelResponse.
class RemoveNotificationChannelResponse {
  /// The new notification configuration for this profiling group.
  final NotificationConfiguration? notificationConfiguration;

  RemoveNotificationChannelResponse({
    this.notificationConfiguration,
  });

  factory RemoveNotificationChannelResponse.fromJson(
      Map<String, dynamic> json) {
    return RemoveNotificationChannelResponse(
      notificationConfiguration: json['notificationConfiguration'] != null
          ? NotificationConfiguration.fromJson(
              json['notificationConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final notificationConfiguration = this.notificationConfiguration;
    return {
      if (notificationConfiguration != null)
        'notificationConfiguration': notificationConfiguration,
    };
  }
}

/// The structure representing the <code>removePermissionResponse</code>.
class RemovePermissionResponse {
  /// The JSON-formatted resource-based policy on the profiling group after the
  /// specified permissions were removed.
  final String policy;

  /// A universally unique identifier (UUID) for the revision of the
  /// resource-based policy after the specified permissions were removed. The
  /// updated JSON-formatted policy is in the <code>policy</code> element of the
  /// response.
  final String revisionId;

  RemovePermissionResponse({
    required this.policy,
    required this.revisionId,
  });

  factory RemovePermissionResponse.fromJson(Map<String, dynamic> json) {
    return RemovePermissionResponse(
      policy: json['policy'] as String,
      revisionId: json['revisionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    final revisionId = this.revisionId;
    return {
      'policy': policy,
      'revisionId': revisionId,
    };
  }
}

/// The structure representing the SubmitFeedbackResponse.
class SubmitFeedbackResponse {
  SubmitFeedbackResponse();

  factory SubmitFeedbackResponse.fromJson(Map<String, dynamic> _) {
    return SubmitFeedbackResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// A data type that contains a <code>Timestamp</code> object. This is specified
/// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
/// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
class TimestampStructure {
  /// A <code>Timestamp</code>. This is specified using the ISO 8601 format. For
  /// example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
  /// 1:15:02 PM UTC.
  final DateTime value;

  TimestampStructure({
    required this.value,
  });

  factory TimestampStructure.fromJson(Map<String, dynamic> json) {
    return TimestampStructure(
      value: nonNullableTimeStampFromJson(json['value'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final value = this.value;
    return {
      'value': iso8601ToJson(value),
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

/// The structure representing the updateProfilingGroupResponse.
class UpdateProfilingGroupResponse {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> that contains information about
  /// the returned updated profiling group.
  final ProfilingGroupDescription profilingGroup;

  UpdateProfilingGroupResponse({
    required this.profilingGroup,
  });

  Map<String, dynamic> toJson() {
    final profilingGroup = this.profilingGroup;
    return {
      'profilingGroup': profilingGroup,
    };
  }
}

/// Feedback that can be submitted for each instance of an anomaly by the user.
/// Feedback is be used for improvements in generating recommendations for the
/// application.
class UserFeedback {
  /// Optional <code>Positive</code> or <code>Negative</code> feedback submitted
  /// by the user about whether the recommendation is useful or not.
  final FeedbackType type;

  UserFeedback({
    required this.type,
  });

  factory UserFeedback.fromJson(Map<String, dynamic> json) {
    return UserFeedback(
      type: (json['type'] as String).toFeedbackType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.toValue(),
    };
  }
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
