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

part '2019-07-18.g.dart';

/// This section provides documentation for the Amazon CodeGuru Profiler API
/// operations.
/// <pre><code> &lt;p&gt;Amazon CodeGuru Profiler collects runtime performance
/// data from your live applications, and provides recommendations that can help
/// you fine-tune your application performance. Using machine learning
/// algorithms, CodeGuru Profiler can help you find your most expensive lines of
/// code and suggest ways you can improve efficiency and remove CPU bottlenecks.
/// &lt;/p&gt; &lt;p&gt;Amazon CodeGuru Profiler provides different
/// visualizations of profiling data to help you identify what code is running
/// on the CPU, see how much time is consumed, and suggest ways to reduce CPU
/// utilization. &lt;/p&gt; &lt;note&gt; &lt;p&gt;Amazon CodeGuru Profiler
/// currently supports applications written in all Java virtual machine (JVM)
/// languages. While CodeGuru Profiler supports both visualizations and
/// recommendations for applications written in Java, it can also generate
/// visualizations and a subset of recommendations for applications written in
/// other JVM languages.&lt;/p&gt; &lt;/note&gt; &lt;p&gt; For more information,
/// see &lt;a
/// href=&quot;https://docs.aws.amazon.com/codeguru/latest/profiler-ug/what-is-codeguru-profiler.html&quot;&gt;What
/// is Amazon CodeGuru Profiler&lt;/a&gt; in the &lt;i&gt;Amazon CodeGuru
/// Profiler User Guide&lt;/i&gt;. &lt;/p&gt; </code></pre>
class CodeGuruProfiler {
  final _s.RestJsonProtocol _protocol;
  CodeGuruProfiler({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'codeguru-profiler',
            signingName: 'codeguru-profiler',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required List<Channel> channels,
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(channels, 'channels');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
    @_s.required String profilingGroupName,
    DateTime endTime,
    List<FrameMetric> frameMetrics,
    String period,
    DateTime startTime,
    AggregationPeriod targetResolution,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'period',
      period,
      1,
      64,
    );
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
  /// be used to tell and agent whether to profile or not and for how long to
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
    @_s.required String profilingGroupName,
    String fleetInstanceId,
    Map<MetadataField, String> metadata,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'fleetInstanceId',
      fleetInstanceId,
      1,
      255,
    );
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
  /// Parameter [clientToken] :
  /// Amazon CodeGuru Profiler uses this universally unique identifier (UUID) to
  /// prevent the accidental creation of duplicate profiling groups if there are
  /// failures and retries.
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to create.
  ///
  /// Parameter [agentOrchestrationConfig] :
  /// Specifies whether profiling is enabled or disabled for the created
  /// profiling group.
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
    @_s.required String clientToken,
    @_s.required String profilingGroupName,
    AgentOrchestrationConfig agentOrchestrationConfig,
    ComputePlatform computePlatform,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientToken, 'clientToken');
    _s.validateStringLength(
      'clientToken',
      clientToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientToken',
      clientToken,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [profilingGroupName] :
  /// The name of the profiling group to delete.
  Future<void> deleteProfilingGroup({
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/profilingGroups/${Uri.encodeComponent(profilingGroupName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfilingGroupResponse.fromJson(response);
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
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
    bool dailyReportsOnly,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w-]+$''',
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
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
    @_s.required String profilingGroupName,
    String accept,
    DateTime endTime,
    int maxDepth,
    String period,
    DateTime startTime,
  }) async {
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxDepth',
      maxDepth,
      1,
      10000,
    );
    _s.validateStringLength(
      'period',
      period,
      1,
      64,
    );
    final headers = <String, String>{};
    accept?.let((v) => headers['Accept'] = v.toString());
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
          _s.extractHeaderStringValue(response.headers, 'Content-Type'),
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
    @_s.required DateTime endTime,
    @_s.required String profilingGroupName,
    @_s.required DateTime startTime,
    String locale,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (startTime != null)
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
    @_s.required DateTime endTime,
    @_s.required String profilingGroupName,
    @_s.required DateTime startTime,
    bool dailyReportsOnly,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w-]+$''',
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (startTime != null)
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
    @_s.required DateTime endTime,
    @_s.required AggregationPeriod period,
    @_s.required String profilingGroupName,
    @_s.required DateTime startTime,
    int maxResults,
    String nextToken,
    OrderBy orderBy,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(period, 'period');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w-]+$''',
    );
    final $query = <String, List<String>>{
      if (endTime != null) 'endTime': [_s.iso8601ToJson(endTime).toString()],
      if (period != null) 'period': [period.toValue()],
      if (startTime != null)
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
    bool includeDescription,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''^[\w-]+$''',
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
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
    @_s.required Uint8List agentProfile,
    @_s.required String contentType,
    @_s.required String profilingGroupName,
    String profileToken,
  }) async {
    ArgumentError.checkNotNull(agentProfile, 'agentProfile');
    ArgumentError.checkNotNull(contentType, 'contentType');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringLength(
      'profileToken',
      profileToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'profileToken',
      profileToken,
      r'''^[\w-]+$''',
    );
    final headers = <String, String>{};
    contentType?.let((v) => headers['Content-Type'] = v.toString());
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
    return PostAgentProfileResponse.fromJson(response);
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
    @_s.required ActionGroup actionGroup,
    @_s.required List<String> principals,
    @_s.required String profilingGroupName,
    String revisionId,
  }) async {
    ArgumentError.checkNotNull(actionGroup, 'actionGroup');
    ArgumentError.checkNotNull(principals, 'principals');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'revisionId',
      revisionId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
    );
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
    @_s.required String channelId,
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(channelId, 'channelId');
    _s.validateStringPattern(
      'channelId',
      channelId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
    @_s.required ActionGroup actionGroup,
    @_s.required String profilingGroupName,
    @_s.required String revisionId,
  }) async {
    ArgumentError.checkNotNull(actionGroup, 'actionGroup');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(revisionId, 'revisionId');
    _s.validateStringPattern(
      'revisionId',
      revisionId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (revisionId != null) 'revisionId': [revisionId],
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
    @_s.required String anomalyInstanceId,
    @_s.required String profilingGroupName,
    @_s.required FeedbackType type,
    String comment,
  }) async {
    ArgumentError.checkNotNull(anomalyInstanceId, 'anomalyInstanceId');
    _s.validateStringPattern(
      'anomalyInstanceId',
      anomalyInstanceId,
      r'''[a-f0-9]{8}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{4}-[a-f0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'type': type?.toValue() ?? '',
      if (comment != null) 'comment': comment,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/internal/profilingGroups/${Uri.encodeComponent(profilingGroupName)}/anomalies/${Uri.encodeComponent(anomalyInstanceId)}/feedback',
      exceptionFnMap: _exceptionFns,
    );
    return SubmitFeedbackResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
    @_s.required AgentOrchestrationConfig agentOrchestrationConfig,
    @_s.required String profilingGroupName,
  }) async {
    ArgumentError.checkNotNull(
        agentOrchestrationConfig, 'agentOrchestrationConfig');
    ArgumentError.checkNotNull(profilingGroupName, 'profilingGroupName');
    _s.validateStringLength(
      'profilingGroupName',
      profilingGroupName,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'profilingGroupName',
      profilingGroupName,
      r'''^[\w-]+$''',
      isRequired: true,
    );
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
  @_s.JsonValue('agentPermissions')
  agentPermissions,
}

extension on ActionGroup {
  String toValue() {
    switch (this) {
      case ActionGroup.agentPermissions:
        return 'agentPermissions';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure representing the AddNotificationChannelsResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AddNotificationChannelsResponse {
  /// The new notification configuration for this profiling group.
  @_s.JsonKey(name: 'notificationConfiguration')
  final NotificationConfiguration notificationConfiguration;

  AddNotificationChannelsResponse({
    this.notificationConfiguration,
  });
  factory AddNotificationChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$AddNotificationChannelsResponseFromJson(json);
}

/// The response of <a
/// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
/// <code>ConfigureAgent</code> </a> that specifies if an agent profiles or not
/// and for how long to return profiling data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AgentConfiguration {
  /// How long a profiling agent should send profiling data using <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
  /// <code>ConfigureAgent</code> </a>. For example, if this is set to 300, the
  /// profiling agent calls <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
  /// <code>ConfigureAgent</code> </a> every 5 minutes to submit the profiled data
  /// collected during that period.
  @_s.JsonKey(name: 'periodInSeconds')
  final int periodInSeconds;

  /// A <code>Boolean</code> that specifies whether the profiling agent collects
  /// profiling data or not. Set to <code>true</code> to enable profiling.
  @_s.JsonKey(name: 'shouldProfile')
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
  @_s.JsonKey(name: 'agentParameters')
  final Map<AgentParameterField, String> agentParameters;

  AgentConfiguration({
    @_s.required this.periodInSeconds,
    @_s.required this.shouldProfile,
    this.agentParameters,
  });
  factory AgentConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AgentConfigurationFromJson(json);
}

/// Specifies whether profiling is enabled or disabled for a profiling group. It
/// is used by <a
/// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ConfigureAgent.html">
/// <code>ConfigureAgent</code> </a> to enable or disable profiling for a
/// profiling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AgentOrchestrationConfig {
  /// A <code>Boolean</code> that specifies whether the profiling agent collects
  /// profiling data or not. Set to <code>true</code> to enable profiling.
  @_s.JsonKey(name: 'profilingEnabled')
  final bool profilingEnabled;

  AgentOrchestrationConfig({
    @_s.required this.profilingEnabled,
  });
  factory AgentOrchestrationConfig.fromJson(Map<String, dynamic> json) =>
      _$AgentOrchestrationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AgentOrchestrationConfigToJson(this);
}

enum AgentParameterField {
  @_s.JsonValue('MaxStackDepth')
  maxStackDepth,
  @_s.JsonValue('MemoryUsageLimitPercent')
  memoryUsageLimitPercent,
  @_s.JsonValue('MinimumTimeForReportingInMilliseconds')
  minimumTimeForReportingInMilliseconds,
  @_s.JsonValue('ReportingIntervalInMilliseconds')
  reportingIntervalInMilliseconds,
  @_s.JsonValue('SamplingIntervalInMilliseconds')
  samplingIntervalInMilliseconds,
}

/// Specifies the aggregation period and aggregation start time for an
/// aggregated profile. An aggregated profile is used to collect posted agent
/// profiles during an aggregation period. There are three possible aggregation
/// periods (1 day, 1 hour, or 5 minutes).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'period')
  final AggregationPeriod period;

  /// The time that aggregation of posted agent profiles for a profiling group
  /// starts. The aggregation profile contains profiles posted by the agent
  /// starting at this time for an aggregation period specified by the
  /// <code>period</code> property of the <code>AggregatedProfileTime</code>
  /// object.
  ///
  /// Specify <code>start</code> using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'start')
  final DateTime start;

  AggregatedProfileTime({
    this.period,
    this.start,
  });
  factory AggregatedProfileTime.fromJson(Map<String, dynamic> json) =>
      _$AggregatedProfileTimeFromJson(json);
}

enum AggregationPeriod {
  @_s.JsonValue('P1D')
  p1d,
  @_s.JsonValue('PT1H')
  pt1h,
  @_s.JsonValue('PT5M')
  pt5m,
}

extension on AggregationPeriod {
  String toValue() {
    switch (this) {
      case AggregationPeriod.p1d:
        return 'P1D';
      case AggregationPeriod.pt1h:
        return 'PT1H';
      case AggregationPeriod.pt5m:
        return 'PT5M';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about an anomaly in a specific metric of application profile. The
/// anomaly is detected using analysis of the metric data over a period of time.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Anomaly {
  /// A list of the instances of the detected anomalies during the requested
  /// period.
  @_s.JsonKey(name: 'instances')
  final List<AnomalyInstance> instances;

  /// Details about the metric that the analysis used when it detected the
  /// anomaly. The metric includes the name of the frame that was analyzed with
  /// the type and thread states used to derive the metric value for that frame.
  @_s.JsonKey(name: 'metric')
  final Metric metric;

  /// The reason for which metric was flagged as anomalous.
  @_s.JsonKey(name: 'reason')
  final String reason;

  Anomaly({
    @_s.required this.instances,
    @_s.required this.metric,
    @_s.required this.reason,
  });
  factory Anomaly.fromJson(Map<String, dynamic> json) =>
      _$AnomalyFromJson(json);
}

/// The specific duration in which the metric is flagged as anomalous.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnomalyInstance {
  /// The universally unique identifier (UUID) of an instance of an anomaly in a
  /// metric.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The start time of the period during which the metric is flagged as
  /// anomalous. This is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// The end time of the period during which the metric is flagged as anomalous.
  /// This is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// Feedback type on a specific instance of anomaly submitted by the user.
  @_s.JsonKey(name: 'userFeedback')
  final UserFeedback userFeedback;

  AnomalyInstance({
    @_s.required this.id,
    @_s.required this.startTime,
    this.endTime,
    this.userFeedback,
  });
  factory AnomalyInstance.fromJson(Map<String, dynamic> json) =>
      _$AnomalyInstanceFromJson(json);
}

/// The structure representing the BatchGetFrameMetricDataResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetFrameMetricDataResponse {
  /// The end time of the time period for the returned time series values. This is
  /// specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
  /// represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// List of instances, or time steps, in the time series. For example, if the
  /// <code>period</code> is one day (<code>PT24H)</code>), and the
  /// <code>resolution</code> is five minutes (<code>PT5M</code>), then there are
  /// 288 <code>endTimes</code> in the list that are each five minutes appart.
  @_s.JsonKey(name: 'endTimes')
  final List<TimestampStructure> endTimes;

  /// Details of the metrics to request a time series of values. The metric
  /// includes the name of the frame, the aggregation type to calculate the metric
  /// value for the frame, and the thread states to use to get the count for the
  /// metric value of the frame.
  @_s.JsonKey(name: 'frameMetricData')
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
  @_s.JsonKey(name: 'resolution')
  final AggregationPeriod resolution;

  /// The start time of the time period for the returned time series values. This
  /// is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// List of instances which remained unprocessed. This will create a missing
  /// time step in the list of end times.
  @_s.JsonKey(name: 'unprocessedEndTimes')
  final Map<String, List<TimestampStructure>> unprocessedEndTimes;

  BatchGetFrameMetricDataResponse({
    @_s.required this.endTime,
    @_s.required this.endTimes,
    @_s.required this.frameMetricData,
    @_s.required this.resolution,
    @_s.required this.startTime,
    @_s.required this.unprocessedEndTimes,
  });
  factory BatchGetFrameMetricDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchGetFrameMetricDataResponseFromJson(json);
}

/// Notification medium for users to get alerted for events that occur in
/// application profile. We support SNS topic as a notification channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Channel {
  /// List of publishers for different type of events that may be detected in an
  /// application from the profile. Anomaly detection is the only event publisher
  /// in Profiler.
  @_s.JsonKey(name: 'eventPublishers')
  final List<EventPublisher> eventPublishers;

  /// Unique arn of the resource to be used for notifications. We support a valid
  /// SNS topic arn as a channel uri.
  @_s.JsonKey(name: 'uri')
  final String uri;

  /// Unique identifier for each <code>Channel</code> in the notification
  /// configuration of a Profiling Group. A random UUID for channelId is used when
  /// adding a channel to the notification configuration if not specified in the
  /// request.
  @_s.JsonKey(name: 'id')
  final String id;

  Channel({
    @_s.required this.eventPublishers,
    @_s.required this.uri,
    this.id,
  });
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelToJson(this);
}

enum ComputePlatform {
  @_s.JsonValue('AWSLambda')
  awsLambda,
  @_s.JsonValue('Default')
  $default,
}

extension on ComputePlatform {
  String toValue() {
    switch (this) {
      case ComputePlatform.awsLambda:
        return 'AWSLambda';
      case ComputePlatform.$default:
        return 'Default';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The structure representing the configureAgentResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ConfigureAgentResponse {
  /// An <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AgentConfiguration.html">
  /// <code>AgentConfiguration</code> </a> object that specifies if an agent
  /// profiles or not and for how long to return profiling data.
  @_s.JsonKey(name: 'configuration')
  final AgentConfiguration configuration;

  ConfigureAgentResponse({
    @_s.required this.configuration,
  });
  factory ConfigureAgentResponse.fromJson(Map<String, dynamic> json) =>
      _$ConfigureAgentResponseFromJson(json);
}

/// The structure representing the createProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProfilingGroupResponse {
  /// The returned <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> object that contains information
  /// about the created profiling group.
  @_s.JsonKey(name: 'profilingGroup')
  final ProfilingGroupDescription profilingGroup;

  CreateProfilingGroupResponse({
    @_s.required this.profilingGroup,
  });
  factory CreateProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProfilingGroupResponseFromJson(json);
}

/// The structure representing the deleteProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteProfilingGroupResponse {
  DeleteProfilingGroupResponse();
  factory DeleteProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteProfilingGroupResponseFromJson(json);
}

/// The structure representing the describeProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeProfilingGroupResponse {
  /// The returned <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> object that contains information
  /// about the requested profiling group.
  @_s.JsonKey(name: 'profilingGroup')
  final ProfilingGroupDescription profilingGroup;

  DescribeProfilingGroupResponse({
    @_s.required this.profilingGroup,
  });
  factory DescribeProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeProfilingGroupResponseFromJson(json);
}

enum EventPublisher {
  @_s.JsonValue('AnomalyDetection')
  anomalyDetection,
}

enum FeedbackType {
  @_s.JsonValue('Negative')
  negative,
  @_s.JsonValue('Positive')
  positive,
}

extension on FeedbackType {
  String toValue() {
    switch (this) {
      case FeedbackType.negative:
        return 'Negative';
      case FeedbackType.positive:
        return 'Positive';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about potential recommendations that might be created from the
/// analysis of profiling data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FindingsReportSummary {
  /// The universally unique identifier (UUID) of the recommendation report.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The end time of the period during which the metric is flagged as anomalous.
  /// This is specified using the ISO 8601 format. For example,
  /// 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020 1:15:02
  /// PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'profileEndTime')
  final DateTime profileEndTime;

  /// The start time of the profile the analysis data is about. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'profileStartTime')
  final DateTime profileStartTime;

  /// The name of the profiling group that is associated with the analysis data.
  @_s.JsonKey(name: 'profilingGroupName')
  final String profilingGroupName;

  /// The total number of different recommendations that were found by the
  /// analysis.
  @_s.JsonKey(name: 'totalNumberOfFindings')
  final int totalNumberOfFindings;

  FindingsReportSummary({
    this.id,
    this.profileEndTime,
    this.profileStartTime,
    this.profilingGroupName,
    this.totalNumberOfFindings,
  });
  factory FindingsReportSummary.fromJson(Map<String, dynamic> json) =>
      _$FindingsReportSummaryFromJson(json);
}

/// The frame name, metric type, and thread states. These are used to derive the
/// value of the metric for the frame.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class FrameMetric {
  /// Name of the method common across the multiple occurrences of a frame in an
  /// application profile.
  @_s.JsonKey(name: 'frameName')
  final String frameName;

  /// List of application runtime thread states used to get the counts for a frame
  /// a derive a metric value.
  @_s.JsonKey(name: 'threadStates')
  final List<String> threadStates;

  /// A type of aggregation that specifies how a metric for a frame is analyzed.
  /// The supported value <code>AggregatedRelativeTotalTime</code> is an
  /// aggregation of the metric value for one frame that is calculated across the
  /// occurrences of all frames in a profile.
  @_s.JsonKey(name: 'type')
  final MetricType type;

  FrameMetric({
    @_s.required this.frameName,
    @_s.required this.threadStates,
    @_s.required this.type,
  });
  factory FrameMetric.fromJson(Map<String, dynamic> json) =>
      _$FrameMetricFromJson(json);

  Map<String, dynamic> toJson() => _$FrameMetricToJson(this);
}

/// Information about a frame metric and its values.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FrameMetricDatum {
  @_s.JsonKey(name: 'frameMetric')
  final FrameMetric frameMetric;

  /// A list of values that are associated with a frame metric.
  @_s.JsonKey(name: 'values')
  final List<double> values;

  FrameMetricDatum({
    @_s.required this.frameMetric,
    @_s.required this.values,
  });
  factory FrameMetricDatum.fromJson(Map<String, dynamic> json) =>
      _$FrameMetricDatumFromJson(json);
}

/// The structure representing the GetFindingsReportAccountSummaryResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetFindingsReportAccountSummaryResponse {
  /// The return list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_FindingsReportSummary.html">
  /// <code>FindingsReportSummary</code> </a> objects taht contain summaries of
  /// analysis results for all profiling groups in your AWS account.
  @_s.JsonKey(name: 'reportSummaries')
  final List<FindingsReportSummary> reportSummaries;

  /// The <code>nextToken</code> value to include in a future
  /// <code>GetFindingsReportAccountSummary</code> request. When the results of a
  /// <code>GetFindingsReportAccountSummary</code> request exceed
  /// <code>maxResults</code>, this value can be used to retrieve the next page of
  /// results. This value is <code>null</code> when there are no more results to
  /// return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetFindingsReportAccountSummaryResponse({
    @_s.required this.reportSummaries,
    this.nextToken,
  });
  factory GetFindingsReportAccountSummaryResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetFindingsReportAccountSummaryResponseFromJson(json);
}

/// The structure representing the GetNotificationConfigurationResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetNotificationConfigurationResponse {
  /// The current notification configuration for this profiling group.
  @_s.JsonKey(name: 'notificationConfiguration')
  final NotificationConfiguration notificationConfiguration;

  GetNotificationConfigurationResponse({
    @_s.required this.notificationConfiguration,
  });
  factory GetNotificationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetNotificationConfigurationResponseFromJson(json);
}

/// The structure representing the <code>getPolicyResponse</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPolicyResponse {
  /// The JSON-formatted resource-based policy attached to the
  /// <code>ProfilingGroup</code>.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// A unique identifier for the current revision of the returned policy.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  GetPolicyResponse({
    @_s.required this.policy,
    @_s.required this.revisionId,
  });
  factory GetPolicyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPolicyResponseFromJson(json);
}

/// The structure representing the getProfileResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProfileResponse {
  /// The content type of the profile in the payload. It is either
  /// <code>application/json</code> or the default
  /// <code>application/x-amzn-ion</code>.
  @_s.JsonKey(name: 'Content-Type')
  final String contentType;

  /// Information about the profile.
  @Uint8ListConverter()
  @_s.JsonKey(name: 'profile')
  final Uint8List profile;

  /// The content encoding of the profile.
  @_s.JsonKey(name: 'Content-Encoding')
  final String contentEncoding;

  GetProfileResponse({
    @_s.required this.contentType,
    @_s.required this.profile,
    this.contentEncoding,
  });
  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProfileResponseFromJson(json);
}

/// The structure representing the GetRecommendationsResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRecommendationsResponse {
  /// The list of anomalies that the analysis has found for this profile.
  @_s.JsonKey(name: 'anomalies')
  final List<Anomaly> anomalies;

  /// The end time of the profile the analysis data is about. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'profileEndTime')
  final DateTime profileEndTime;

  /// The start time of the profile the analysis data is about. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'profileStartTime')
  final DateTime profileStartTime;

  /// The name of the profiling group the analysis data is about.
  @_s.JsonKey(name: 'profilingGroupName')
  final String profilingGroupName;

  /// The list of recommendations that the analysis found for this profile.
  @_s.JsonKey(name: 'recommendations')
  final List<Recommendation> recommendations;

  GetRecommendationsResponse({
    @_s.required this.anomalies,
    @_s.required this.profileEndTime,
    @_s.required this.profileStartTime,
    @_s.required this.profilingGroupName,
    @_s.required this.recommendations,
  });
  factory GetRecommendationsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRecommendationsResponseFromJson(json);
}

/// The structure representing the ListFindingsReportsResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFindingsReportsResponse {
  /// The list of analysis results summaries.
  @_s.JsonKey(name: 'findingsReportSummaries')
  final List<FindingsReportSummary> findingsReportSummaries;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListFindingsReports</code> request. When the results of a
  /// <code>ListFindingsReports</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFindingsReportsResponse({
    @_s.required this.findingsReportSummaries,
    this.nextToken,
  });
  factory ListFindingsReportsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFindingsReportsResponseFromJson(json);
}

/// The structure representing the listProfileTimesResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfileTimesResponse {
  /// The list of start times of the available profiles for the aggregation period
  /// in the specified time range.
  @_s.JsonKey(name: 'profileTimes')
  final List<ProfileTime> profileTimes;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListProfileTimes</code> request. When the results of a
  /// <code>ListProfileTimes</code> request exceed <code>maxResults</code>, this
  /// value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListProfileTimesResponse({
    @_s.required this.profileTimes,
    this.nextToken,
  });
  factory ListProfileTimesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfileTimesResponseFromJson(json);
}

/// The structure representing the listProfilingGroupsResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProfilingGroupsResponse {
  /// A returned list of profiling group names. A list of the names is returned
  /// only if <code>includeDescription</code> is <code>false</code>, otherwise a
  /// list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects is returned.
  @_s.JsonKey(name: 'profilingGroupNames')
  final List<String> profilingGroupNames;

  /// The <code>nextToken</code> value to include in a future
  /// <code>ListProfilingGroups</code> request. When the results of a
  /// <code>ListProfilingGroups</code> request exceed <code>maxResults</code>,
  /// this value can be used to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A returned list <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects. A list of <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> objects is returned only if
  /// <code>includeDescription</code> is <code>true</code>, otherwise a list of
  /// profiling group names is returned.
  @_s.JsonKey(name: 'profilingGroups')
  final List<ProfilingGroupDescription> profilingGroups;

  ListProfilingGroupsResponse({
    @_s.required this.profilingGroupNames,
    this.nextToken,
    this.profilingGroups,
  });
  factory ListProfilingGroupsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProfilingGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of tags assigned to the specified resource. This is the list of
  /// tags returned in the response.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

/// The part of a profile that contains a recommendation found during analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Match {
  /// The location in the profiling graph that contains a recommendation found
  /// during analysis.
  @_s.JsonKey(name: 'frameAddress')
  final String frameAddress;

  /// The target frame that triggered a match.
  @_s.JsonKey(name: 'targetFramesIndex')
  final int targetFramesIndex;

  /// The value in the profile data that exceeded the recommendation threshold.
  @_s.JsonKey(name: 'thresholdBreachValue')
  final double thresholdBreachValue;

  Match({
    this.frameAddress,
    this.targetFramesIndex,
    this.thresholdBreachValue,
  });
  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);
}

enum MetadataField {
  @_s.JsonValue('AgentId')
  agentId,
  @_s.JsonValue('AwsRequestId')
  awsRequestId,
  @_s.JsonValue('ComputePlatform')
  computePlatform,
  @_s.JsonValue('ExecutionEnvironment')
  executionEnvironment,
  @_s.JsonValue('LambdaFunctionArn')
  lambdaFunctionArn,
  @_s.JsonValue('LambdaMemoryLimitInMB')
  lambdaMemoryLimitInMB,
  @_s.JsonValue('LambdaPreviousExecutionTimeInMilliseconds')
  lambdaPreviousExecutionTimeInMilliseconds,
  @_s.JsonValue('LambdaRemainingTimeInMilliseconds')
  lambdaRemainingTimeInMilliseconds,
  @_s.JsonValue('LambdaTimeGapBetweenInvokesInMilliseconds')
  lambdaTimeGapBetweenInvokesInMilliseconds,
}

extension on MetadataField {
  String toValue() {
    switch (this) {
      case MetadataField.agentId:
        return 'AgentId';
      case MetadataField.awsRequestId:
        return 'AwsRequestId';
      case MetadataField.computePlatform:
        return 'ComputePlatform';
      case MetadataField.executionEnvironment:
        return 'ExecutionEnvironment';
      case MetadataField.lambdaFunctionArn:
        return 'LambdaFunctionArn';
      case MetadataField.lambdaMemoryLimitInMB:
        return 'LambdaMemoryLimitInMB';
      case MetadataField.lambdaPreviousExecutionTimeInMilliseconds:
        return 'LambdaPreviousExecutionTimeInMilliseconds';
      case MetadataField.lambdaRemainingTimeInMilliseconds:
        return 'LambdaRemainingTimeInMilliseconds';
      case MetadataField.lambdaTimeGapBetweenInvokesInMilliseconds:
        return 'LambdaTimeGapBetweenInvokesInMilliseconds';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Details about the metric that the analysis used when it detected the
/// anomaly. The metric what is analyzed to create recommendations. It includes
/// the name of the frame that was analyzed and the type and thread states used
/// to derive the metric value for that frame.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Metric {
  /// The name of the method that appears as a frame in any stack in a profile.
  @_s.JsonKey(name: 'frameName')
  final String frameName;

  /// The list of application runtime thread states that is used to calculate the
  /// metric value for the frame.
  @_s.JsonKey(name: 'threadStates')
  final List<String> threadStates;

  /// A type that specifies how a metric for a frame is analyzed. The supported
  /// value <code>AggregatedRelativeTotalTime</code> is an aggregation of the
  /// metric value for one frame that is calculated across the occurences of all
  /// frames in a profile.
  @_s.JsonKey(name: 'type')
  final MetricType type;

  Metric({
    @_s.required this.frameName,
    @_s.required this.threadStates,
    @_s.required this.type,
  });
  factory Metric.fromJson(Map<String, dynamic> json) => _$MetricFromJson(json);
}

enum MetricType {
  @_s.JsonValue('AggregatedRelativeTotalTime')
  aggregatedRelativeTotalTime,
}

/// The configuration for notifications stored for each profiling group. This
/// includes up to to two channels and a list of event publishers associated
/// with each channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotificationConfiguration {
  /// List of up to two channels to be used for sending notifications for events
  /// detected from the application profile.
  @_s.JsonKey(name: 'channels')
  final List<Channel> channels;

  NotificationConfiguration({
    this.channels,
  });
  factory NotificationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$NotificationConfigurationFromJson(json);
}

enum OrderBy {
  @_s.JsonValue('TimestampAscending')
  timestampAscending,
  @_s.JsonValue('TimestampDescending')
  timestampDescending,
}

extension on OrderBy {
  String toValue() {
    switch (this) {
      case OrderBy.timestampAscending:
        return 'TimestampAscending';
      case OrderBy.timestampDescending:
        return 'TimestampDescending';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A set of rules used to make a recommendation during an analysis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Pattern {
  /// A list of the different counters used to determine if there is a match.
  @_s.JsonKey(name: 'countersToAggregate')
  final List<String> countersToAggregate;

  /// The description of the recommendation. This explains a potential
  /// inefficiency in a profiled application.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The universally unique identifier (UUID) of this pattern.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The name for this pattern.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A string that contains the steps recommended to address the potential
  /// inefficiency.
  @_s.JsonKey(name: 'resolutionSteps')
  final String resolutionSteps;

  /// A list of frame names that were searched during the analysis that generated
  /// a recommendation.
  @_s.JsonKey(name: 'targetFrames')
  final List<List<String>> targetFrames;

  /// The percentage of time an application spends in one method that triggers a
  /// recommendation. The percentage of time is the same as the percentage of the
  /// total gathered sample counts during analysis.
  @_s.JsonKey(name: 'thresholdPercent')
  final double thresholdPercent;

  Pattern({
    this.countersToAggregate,
    this.description,
    this.id,
    this.name,
    this.resolutionSteps,
    this.targetFrames,
    this.thresholdPercent,
  });
  factory Pattern.fromJson(Map<String, dynamic> json) =>
      _$PatternFromJson(json);
}

/// The structure representing the postAgentProfileResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PostAgentProfileResponse {
  PostAgentProfileResponse();
  factory PostAgentProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$PostAgentProfileResponseFromJson(json);
}

/// Contains the start time of a profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfileTime {
  /// The start time of a profile. It is specified using the ISO 8601 format. For
  /// example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
  /// 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'start')
  final DateTime start;

  ProfileTime({
    this.start,
  });
  factory ProfileTime.fromJson(Map<String, dynamic> json) =>
      _$ProfileTimeFromJson(json);
}

/// Contains information about a profiling group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfilingGroupDescription {
  /// An <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AgentOrchestrationConfig.html">
  /// <code>AgentOrchestrationConfig</code> </a> object that indicates if the
  /// profiling group is enabled for profiled or not.
  @_s.JsonKey(name: 'agentOrchestrationConfig')
  final AgentOrchestrationConfig agentOrchestrationConfig;

  /// The Amazon Resource Name (ARN) identifying the profiling group resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The compute platform of the profiling group. If it is set to
  /// <code>AWSLambda</code>, then the profiled application runs on AWS Lambda. If
  /// it is set to <code>Default</code>, then the profiled application runs on a
  /// compute platform that is not AWS Lambda, such an Amazon EC2 instance, an
  /// on-premises server, or a different platform. The default is
  /// <code>Default</code>.
  @_s.JsonKey(name: 'computePlatform')
  final ComputePlatform computePlatform;

  /// The time when the profiling group was created. Specify using the ISO 8601
  /// format. For example, 2020-06-01T13:15:02.001Z represents 1 millisecond past
  /// June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The name of the profiling group.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingStatus.html">
  /// <code>ProfilingStatus</code> </a> object that includes information about the
  /// last time a profile agent pinged back, the last time a profile was received,
  /// and the aggregation period and start time for the most recent aggregated
  /// profile.
  @_s.JsonKey(name: 'profilingStatus')
  final ProfilingStatus profilingStatus;

  /// A list of the tags that belong to this profiling group.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The date and time when the profiling group was last updated. Specify using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'updatedAt')
  final DateTime updatedAt;

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
  factory ProfilingGroupDescription.fromJson(Map<String, dynamic> json) =>
      _$ProfilingGroupDescriptionFromJson(json);
}

/// Profiling status includes information about the last time a profile agent
/// pinged back, the last time a profile was received, and the aggregation
/// period and start time for the most recent aggregated profile.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProfilingStatus {
  /// The date and time when the profiling agent most recently pinged back.
  /// Specify using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
  /// represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'latestAgentOrchestratedAt')
  final DateTime latestAgentOrchestratedAt;

  /// The date and time when the most recent profile was received. Specify using
  /// the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents 1
  /// millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'latestAgentProfileReportedAt')
  final DateTime latestAgentProfileReportedAt;

  /// An <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_AggregatedProfileTime.html">
  /// <code>AggregatedProfileTime</code> </a> object that contains the aggregation
  /// period and start time for an aggregated profile.
  @_s.JsonKey(name: 'latestAggregatedProfile')
  final AggregatedProfileTime latestAggregatedProfile;

  ProfilingStatus({
    this.latestAgentOrchestratedAt,
    this.latestAgentProfileReportedAt,
    this.latestAggregatedProfile,
  });
  factory ProfilingStatus.fromJson(Map<String, dynamic> json) =>
      _$ProfilingStatusFromJson(json);
}

/// The structure representing the <code>putPermissionResponse</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutPermissionResponse {
  /// The JSON-formatted resource-based policy on the profiling group that
  /// includes the added permissions.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// A universally unique identifier (UUID) for the revision of the
  /// resource-based policy that includes the added permissions. The
  /// JSON-formatted policy is in the <code>policy</code> element of the response.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  PutPermissionResponse({
    @_s.required this.policy,
    @_s.required this.revisionId,
  });
  factory PutPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$PutPermissionResponseFromJson(json);
}

/// A potential improvement that was found from analyzing the profiling data.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Recommendation {
  /// How many different places in the profile graph triggered a match.
  @_s.JsonKey(name: 'allMatchesCount')
  final int allMatchesCount;

  /// How much of the total sample count is potentially affected.
  @_s.JsonKey(name: 'allMatchesSum')
  final double allMatchesSum;

  /// End time of the profile that was used by this analysis. This is specified
  /// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
  /// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'endTime')
  final DateTime endTime;

  /// The pattern that analysis recognized in the profile to make this
  /// recommendation.
  @_s.JsonKey(name: 'pattern')
  final Pattern pattern;

  /// The start time of the profile that was used by this analysis. This is
  /// specified using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z
  /// represents 1 millisecond past June 1, 2020 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'startTime')
  final DateTime startTime;

  /// List of the matches with most impact.
  @_s.JsonKey(name: 'topMatches')
  final List<Match> topMatches;

  Recommendation({
    @_s.required this.allMatchesCount,
    @_s.required this.allMatchesSum,
    @_s.required this.endTime,
    @_s.required this.pattern,
    @_s.required this.startTime,
    @_s.required this.topMatches,
  });
  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}

/// The structure representing the RemoveNotificationChannelResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemoveNotificationChannelResponse {
  /// The new notification configuration for this profiling group.
  @_s.JsonKey(name: 'notificationConfiguration')
  final NotificationConfiguration notificationConfiguration;

  RemoveNotificationChannelResponse({
    this.notificationConfiguration,
  });
  factory RemoveNotificationChannelResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RemoveNotificationChannelResponseFromJson(json);
}

/// The structure representing the <code>removePermissionResponse</code>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RemovePermissionResponse {
  /// The JSON-formatted resource-based policy on the profiling group after the
  /// specified permissions were removed.
  @_s.JsonKey(name: 'policy')
  final String policy;

  /// A universally unique identifier (UUID) for the revision of the
  /// resource-based policy after the specified permissions were removed. The
  /// updated JSON-formatted policy is in the <code>policy</code> element of the
  /// response.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  RemovePermissionResponse({
    @_s.required this.policy,
    @_s.required this.revisionId,
  });
  factory RemovePermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$RemovePermissionResponseFromJson(json);
}

/// The structure representing the SubmitFeedbackResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SubmitFeedbackResponse {
  SubmitFeedbackResponse();
  factory SubmitFeedbackResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitFeedbackResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// A data type that contains a <code>Timestamp</code> object. This is specified
/// using the ISO 8601 format. For example, 2020-06-01T13:15:02.001Z represents
/// 1 millisecond past June 1, 2020 1:15:02 PM UTC.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimestampStructure {
  /// A <code>Timestamp</code>. This is specified using the ISO 8601 format. For
  /// example, 2020-06-01T13:15:02.001Z represents 1 millisecond past June 1, 2020
  /// 1:15:02 PM UTC.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'value')
  final DateTime value;

  TimestampStructure({
    @_s.required this.value,
  });
  factory TimestampStructure.fromJson(Map<String, dynamic> json) =>
      _$TimestampStructureFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

/// The structure representing the updateProfilingGroupResponse.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProfilingGroupResponse {
  /// A <a
  /// href="https://docs.aws.amazon.com/codeguru/latest/profiler-api/API_ProfilingGroupDescription.html">
  /// <code>ProfilingGroupDescription</code> </a> that contains information about
  /// the returned updated profiling group.
  @_s.JsonKey(name: 'profilingGroup')
  final ProfilingGroupDescription profilingGroup;

  UpdateProfilingGroupResponse({
    @_s.required this.profilingGroup,
  });
  factory UpdateProfilingGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProfilingGroupResponseFromJson(json);
}

/// Feedback that can be submitted for each instance of an anomaly by the user.
/// Feedback is be used for improvements in generating recommendations for the
/// application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserFeedback {
  /// Optional <code>Positive</code> or <code>Negative</code> feedback submitted
  /// by the user about whether the recommendation is useful or not.
  @_s.JsonKey(name: 'type')
  final FeedbackType type;

  UserFeedback({
    @_s.required this.type,
  });
  factory UserFeedback.fromJson(Map<String, dynamic> json) =>
      _$UserFeedbackFromJson(json);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String type, String message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class ValidationException extends _s.GenericAwsException {
  ValidationException({String type, String message})
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
