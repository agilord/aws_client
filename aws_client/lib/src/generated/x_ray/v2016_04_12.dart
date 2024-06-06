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

/// Amazon Web Services X-Ray provides APIs for managing debug traces and
/// retrieving service maps and other data created by processing those traces.
class XRay {
  final _s.RestJsonProtocol _protocol;
  XRay({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'xray',
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

  /// Retrieves a list of traces specified by ID. Each trace is a collection of
  /// segment documents that originates from a single request. Use
  /// <code>GetTraceSummaries</code> to get a list of trace IDs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [traceIds] :
  /// Specify the trace IDs of requests for which to retrieve segments.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<BatchGetTracesResult> batchGetTraces({
    required List<String> traceIds,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'TraceIds': traceIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Traces',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetTracesResult.fromJson(response);
  }

  /// Creates a group resource with a name and a filter expression.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [groupName] :
  /// The case-sensitive name of the new group. Default is a reserved name and
  /// names must be unique.
  ///
  /// Parameter [filterExpression] :
  /// The filter expression defining criteria by which to group traces.
  ///
  /// Parameter [insightsConfiguration] :
  /// The structure containing configurations related to insights.
  ///
  /// <ul>
  /// <li>
  /// The InsightsEnabled boolean can be set to true to enable insights for the
  /// new group or false to disable insights for the new group.
  /// </li>
  /// <li>
  /// The NotificationsEnabled boolean can be set to true to enable insights
  /// notifications for the new group. Notifications may only be enabled on a
  /// group with InsightsEnabled set to true.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A map that contains one or more tag keys and tag values to attach to an
  /// X-Ray group. For more information about ways to use tags, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of user-applied tags per resource: 50
  /// </li>
  /// <li>
  /// Maximum tag key length: 128 Unicode characters
  /// </li>
  /// <li>
  /// Maximum tag value length: 256 Unicode characters
  /// </li>
  /// <li>
  /// Valid values for key and value: a-z, A-Z, 0-9, space, and the following
  /// characters: _ . : / = + - and @
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Don't use <code>aws:</code> as a prefix for keys; it's reserved for Amazon
  /// Web Services use.
  /// </li>
  /// </ul>
  Future<CreateGroupResult> createGroup({
    required String groupName,
    String? filterExpression,
    InsightsConfiguration? insightsConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'GroupName': groupName,
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (insightsConfiguration != null)
        'InsightsConfiguration': insightsConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateGroup',
      exceptionFnMap: _exceptionFns,
    );
    return CreateGroupResult.fromJson(response);
  }

  /// Creates a rule to control sampling behavior for instrumented applications.
  /// Services retrieve rules with <a
  /// href="https://docs.aws.amazon.com/xray/latest/api/API_GetSamplingRules.html">GetSamplingRules</a>,
  /// and evaluate each rule in ascending order of <i>priority</i> for each
  /// request. If a rule matches, the service records a trace, borrowing it from
  /// the reservoir size. After 10 seconds, the service reports back to X-Ray
  /// with <a
  /// href="https://docs.aws.amazon.com/xray/latest/api/API_GetSamplingTargets.html">GetSamplingTargets</a>
  /// to get updated versions of each in-use rule. The updated rule contains a
  /// trace quota that the service can use instead of borrowing from the
  /// reservoir.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  /// May throw [RuleLimitExceededException].
  ///
  /// Parameter [samplingRule] :
  /// The rule definition.
  ///
  /// Parameter [tags] :
  /// A map that contains one or more tag keys and tag values to attach to an
  /// X-Ray sampling rule. For more information about ways to use tags, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of user-applied tags per resource: 50
  /// </li>
  /// <li>
  /// Maximum tag key length: 128 Unicode characters
  /// </li>
  /// <li>
  /// Maximum tag value length: 256 Unicode characters
  /// </li>
  /// <li>
  /// Valid values for key and value: a-z, A-Z, 0-9, space, and the following
  /// characters: _ . : / = + - and @
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Don't use <code>aws:</code> as a prefix for keys; it's reserved for Amazon
  /// Web Services use.
  /// </li>
  /// </ul>
  Future<CreateSamplingRuleResult> createSamplingRule({
    required SamplingRule samplingRule,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'SamplingRule': samplingRule,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateSamplingRule',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSamplingRuleResult.fromJson(response);
  }

  /// Deletes a group resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [groupARN] :
  /// The ARN of the group that was generated on creation.
  ///
  /// Parameter [groupName] :
  /// The case-sensitive name of the group.
  Future<void> deleteGroup({
    String? groupARN,
    String? groupName,
  }) async {
    final $payload = <String, dynamic>{
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteGroup',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a resource policy from the target Amazon Web Services account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [InvalidPolicyRevisionIdException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [policyName] :
  /// The name of the resource policy to delete.
  ///
  /// Parameter [policyRevisionId] :
  /// Specifies a specific policy revision to delete. Provide a
  /// <code>PolicyRevisionId</code> to ensure an atomic delete operation. If the
  /// provided revision id does not match the latest policy revision id, an
  /// <code>InvalidPolicyRevisionIdException</code> exception is returned.
  Future<void> deleteResourcePolicy({
    required String policyName,
    String? policyRevisionId,
  }) async {
    final $payload = <String, dynamic>{
      'PolicyName': policyName,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteResourcePolicy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a sampling rule.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [ruleARN] :
  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but
  /// not both.
  ///
  /// Parameter [ruleName] :
  /// The name of the sampling rule. Specify a rule by either name or ARN, but
  /// not both.
  Future<DeleteSamplingRuleResult> deleteSamplingRule({
    String? ruleARN,
    String? ruleName,
  }) async {
    final $payload = <String, dynamic>{
      if (ruleARN != null) 'RuleARN': ruleARN,
      if (ruleName != null) 'RuleName': ruleName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteSamplingRule',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSamplingRuleResult.fromJson(response);
  }

  /// Retrieves the current encryption configuration for X-Ray data.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  Future<GetEncryptionConfigResult> getEncryptionConfig() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/EncryptionConfig',
      exceptionFnMap: _exceptionFns,
    );
    return GetEncryptionConfigResult.fromJson(response);
  }

  /// Retrieves group resource details.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [groupARN] :
  /// The ARN of the group that was generated on creation.
  ///
  /// Parameter [groupName] :
  /// The case-sensitive name of the group.
  Future<GetGroupResult> getGroup({
    String? groupARN,
    String? groupName,
  }) async {
    final $payload = <String, dynamic>{
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetGroup',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupResult.fromJson(response);
  }

  /// Retrieves all active group details.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<GetGroupsResult> getGroups({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Groups',
      exceptionFnMap: _exceptionFns,
    );
    return GetGroupsResult.fromJson(response);
  }

  /// Retrieves the summary information of an insight. This includes impact to
  /// clients and root cause services, the top anomalous services, the category,
  /// the state of the insight, and the start and end time of the insight.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [insightId] :
  /// The insight's unique identifier. Use the GetInsightSummaries action to
  /// retrieve an InsightId.
  Future<GetInsightResult> getInsight({
    required String insightId,
  }) async {
    final $payload = <String, dynamic>{
      'InsightId': insightId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/Insight',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightResult.fromJson(response);
  }

  /// X-Ray reevaluates insights periodically until they're resolved, and
  /// records each intermediate state as an event. You can review an insight's
  /// events in the Impact Timeline on the Inspect page in the X-Ray console.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [insightId] :
  /// The insight's unique identifier. Use the GetInsightSummaries action to
  /// retrieve an InsightId.
  ///
  /// Parameter [maxResults] :
  /// Used to retrieve at most the specified value of events.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token returned by a previous request to retrieve
  /// the next page of events.
  Future<GetInsightEventsResult> getInsightEvents({
    required String insightId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'InsightId': insightId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/InsightEvents',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightEventsResult.fromJson(response);
  }

  /// Retrieves a service graph structure filtered by the specified insight. The
  /// service graph is limited to only structural information. For a complete
  /// service graph, use this API with the GetServiceGraph API.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [endTime] :
  /// The estimated end time of the insight, in Unix time seconds. The EndTime
  /// is exclusive of the value provided. The time range between the start time
  /// and end time can't be more than six hours.
  ///
  /// Parameter [insightId] :
  /// The insight's unique identifier. Use the GetInsightSummaries action to
  /// retrieve an InsightId.
  ///
  /// Parameter [startTime] :
  /// The estimated start time of the insight, in Unix time seconds. The
  /// StartTime is inclusive of the value provided and can't be more than 30
  /// days old.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token returned by a previous request to retrieve
  /// the next page of results.
  Future<GetInsightImpactGraphResult> getInsightImpactGraph({
    required DateTime endTime,
    required String insightId,
    required DateTime startTime,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'InsightId': insightId,
      'StartTime': unixTimestampToJson(startTime),
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/InsightImpactGraph',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightImpactGraphResult.fromJson(response);
  }

  /// Retrieves the summaries of all insights in the specified group matching
  /// the provided filter values.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [endTime] :
  /// The end of the time frame in which the insights ended. The end time can't
  /// be more than 30 days old.
  ///
  /// Parameter [startTime] :
  /// The beginning of the time frame in which the insights started. The start
  /// time can't be more than 30 days old.
  ///
  /// Parameter [groupARN] :
  /// The Amazon Resource Name (ARN) of the group. Required if the GroupName
  /// isn't provided.
  ///
  /// Parameter [groupName] :
  /// The name of the group. Required if the GroupARN isn't provided.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to display.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  ///
  /// Parameter [states] :
  /// The list of insight states.
  Future<GetInsightSummariesResult> getInsightSummaries({
    required DateTime endTime,
    required DateTime startTime,
    String? groupARN,
    String? groupName,
    int? maxResults,
    String? nextToken,
    List<InsightState>? states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (states != null) 'States': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/InsightSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return GetInsightSummariesResult.fromJson(response);
  }

  /// Retrieves all sampling rules.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<GetSamplingRulesResult> getSamplingRules({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetSamplingRules',
      exceptionFnMap: _exceptionFns,
    );
    return GetSamplingRulesResult.fromJson(response);
  }

  /// Retrieves information about recent sampling results for all sampling
  /// rules.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<GetSamplingStatisticSummariesResult> getSamplingStatisticSummaries({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SamplingStatisticSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return GetSamplingStatisticSummariesResult.fromJson(response);
  }

  /// Requests a sampling quota for rules that the service is using to sample
  /// requests.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [samplingStatisticsDocuments] :
  /// Information about rules that the service is using to sample requests.
  Future<GetSamplingTargetsResult> getSamplingTargets({
    required List<SamplingStatisticsDocument> samplingStatisticsDocuments,
  }) async {
    final $payload = <String, dynamic>{
      'SamplingStatisticsDocuments': samplingStatisticsDocuments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/SamplingTargets',
      exceptionFnMap: _exceptionFns,
    );
    return GetSamplingTargetsResult.fromJson(response);
  }

  /// Retrieves a document that describes services that process incoming
  /// requests, and downstream services that they call as a result. Root
  /// services process incoming requests and make calls to downstream services.
  /// Root services are applications that use the <a
  /// href="https://docs.aws.amazon.com/xray/index.html">Amazon Web Services
  /// X-Ray SDK</a>. Downstream services can be other applications, Amazon Web
  /// Services resources, HTTP web APIs, or SQL databases.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [endTime] :
  /// The end of the timeframe for which to generate a graph.
  ///
  /// Parameter [startTime] :
  /// The start of the time frame for which to generate a graph.
  ///
  /// Parameter [groupARN] :
  /// The Amazon Resource Name (ARN) of a group based on which you want to
  /// generate a graph.
  ///
  /// Parameter [groupName] :
  /// The name of a group based on which you want to generate a graph.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<GetServiceGraphResult> getServiceGraph({
    required DateTime endTime,
    required DateTime startTime,
    String? groupARN,
    String? groupName,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ServiceGraph',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceGraphResult.fromJson(response);
  }

  /// Get an aggregation of service statistics defined by a specific time range.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [endTime] :
  /// The end of the time frame for which to aggregate statistics.
  ///
  /// Parameter [startTime] :
  /// The start of the time frame for which to aggregate statistics.
  ///
  /// Parameter [entitySelectorExpression] :
  /// A filter expression defining entities that will be aggregated for
  /// statistics. Supports ID, service, and edge functions. If no selector
  /// expression is specified, edge statistics are returned.
  ///
  /// Parameter [forecastStatistics] :
  /// The forecasted high and low fault count values. Forecast enabled requests
  /// require the EntitySelectorExpression ID be provided.
  ///
  /// Parameter [groupARN] :
  /// The Amazon Resource Name (ARN) of the group for which to pull statistics
  /// from.
  ///
  /// Parameter [groupName] :
  /// The case-sensitive name of the group for which to pull statistics from.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  ///
  /// Parameter [period] :
  /// Aggregation period in seconds.
  Future<GetTimeSeriesServiceStatisticsResult> getTimeSeriesServiceStatistics({
    required DateTime endTime,
    required DateTime startTime,
    String? entitySelectorExpression,
    bool? forecastStatistics,
    String? groupARN,
    String? groupName,
    String? nextToken,
    int? period,
  }) async {
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (entitySelectorExpression != null)
        'EntitySelectorExpression': entitySelectorExpression,
      if (forecastStatistics != null) 'ForecastStatistics': forecastStatistics,
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (nextToken != null) 'NextToken': nextToken,
      if (period != null) 'Period': period,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TimeSeriesServiceStatistics',
      exceptionFnMap: _exceptionFns,
    );
    return GetTimeSeriesServiceStatisticsResult.fromJson(response);
  }

  /// Retrieves a service graph for one or more specific trace IDs.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [traceIds] :
  /// Trace IDs of requests for which to generate a service graph.
  ///
  /// Parameter [nextToken] :
  /// Pagination token.
  Future<GetTraceGraphResult> getTraceGraph({
    required List<String> traceIds,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'TraceIds': traceIds,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TraceGraph',
      exceptionFnMap: _exceptionFns,
    );
    return GetTraceGraphResult.fromJson(response);
  }

  /// Retrieves IDs and annotations for traces available for a specified time
  /// frame using an optional filter. To get the full traces, pass the trace IDs
  /// to <code>BatchGetTraces</code>.
  ///
  /// A filter expression can target traced requests that hit specific service
  /// nodes or edges, have errors, or come from a known user. For example, the
  /// following filter expression targets traces that pass through
  /// <code>api.example.com</code>:
  ///
  /// <code>service("api.example.com")</code>
  ///
  /// This filter expression finds traces that have an annotation named
  /// <code>account</code> with the value <code>12345</code>:
  ///
  /// <code>annotation.account = "12345"</code>
  ///
  /// For a full list of indexed fields and keywords that you can use in filter
  /// expressions, see <a
  /// href="https://docs.aws.amazon.com/xray/latest/devguide/xray-console-filters.html">Using
  /// Filter Expressions</a> in the <i>Amazon Web Services X-Ray Developer
  /// Guide</i>.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [endTime] :
  /// The end of the time frame for which to retrieve traces.
  ///
  /// Parameter [startTime] :
  /// The start of the time frame for which to retrieve traces.
  ///
  /// Parameter [filterExpression] :
  /// Specify a filter expression to retrieve trace summaries for services or
  /// requests that meet certain requirements.
  ///
  /// Parameter [nextToken] :
  /// Specify the pagination token returned by a previous request to retrieve
  /// the next page of results.
  ///
  /// Parameter [sampling] :
  /// Set to <code>true</code> to get summaries for only a subset of available
  /// traces.
  ///
  /// Parameter [samplingStrategy] :
  /// A parameter to indicate whether to enable sampling on trace summaries.
  /// Input parameters are Name and Value.
  ///
  /// Parameter [timeRangeType] :
  /// A parameter to indicate whether to query trace summaries by TraceId, Event
  /// (trace update time), or Service (segment end time).
  Future<GetTraceSummariesResult> getTraceSummaries({
    required DateTime endTime,
    required DateTime startTime,
    String? filterExpression,
    String? nextToken,
    bool? sampling,
    SamplingStrategy? samplingStrategy,
    TimeRangeType? timeRangeType,
  }) async {
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (nextToken != null) 'NextToken': nextToken,
      if (sampling != null) 'Sampling': sampling,
      if (samplingStrategy != null) 'SamplingStrategy': samplingStrategy,
      if (timeRangeType != null) 'TimeRangeType': timeRangeType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TraceSummaries',
      exceptionFnMap: _exceptionFns,
    );
    return GetTraceSummariesResult.fromJson(response);
  }

  /// Returns the list of resource policies in the target Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [nextToken] :
  /// Not currently supported.
  Future<ListResourcePoliciesResult> listResourcePolicies({
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListResourcePolicies',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcePoliciesResult.fromJson(response);
  }

  /// Returns a list of tags that are applied to the specified Amazon Web
  /// Services X-Ray group or sampling rule.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
  ///
  /// Parameter [nextToken] :
  /// A pagination token. If multiple pages of results are returned, use the
  /// <code>NextToken</code> value returned with the current page of results as
  /// the value of this parameter to get the next page of results.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTagsForResource',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Updates the encryption configuration for X-Ray data.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [type] :
  /// The type of encryption. Set to <code>KMS</code> to use your own key for
  /// encryption. Set to <code>NONE</code> for default encryption.
  ///
  /// Parameter [keyId] :
  /// An Amazon Web Services KMS key in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// <b>Alias</b> - The name of the key. For example, <code>alias/MyKey</code>.
  /// </li>
  /// <li>
  /// <b>Key ID</b> - The KMS key ID of the key. For example,
  /// <code>ae4aa6d49-a4d8-9df9-a475-4ff6d7898456</code>. Amazon Web Services
  /// X-Ray does not support asymmetric KMS keys.
  /// </li>
  /// <li>
  /// <b>ARN</b> - The full Amazon Resource Name of the key ID or alias. For
  /// example,
  /// <code>arn:aws:kms:us-east-2:123456789012:key/ae4aa6d49-a4d8-9df9-a475-4ff6d7898456</code>.
  /// Use this format to specify a key in a different account.
  /// </li>
  /// </ul>
  /// Omit this key if you set <code>Type</code> to <code>NONE</code>.
  Future<PutEncryptionConfigResult> putEncryptionConfig({
    required EncryptionType type,
    String? keyId,
  }) async {
    final $payload = <String, dynamic>{
      'Type': type.toValue(),
      if (keyId != null) 'KeyId': keyId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutEncryptionConfig',
      exceptionFnMap: _exceptionFns,
    );
    return PutEncryptionConfigResult.fromJson(response);
  }

  /// Sets the resource policy to grant one or more Amazon Web Services services
  /// and accounts permissions to access X-Ray. Each resource policy will be
  /// associated with a specific Amazon Web Services account. Each Amazon Web
  /// Services account can have a maximum of 5 resource policies, and each
  /// policy name must be unique within that account. The maximum size of each
  /// resource policy is 5KB.
  ///
  /// May throw [MalformedPolicyDocumentException].
  /// May throw [LockoutPreventionException].
  /// May throw [InvalidPolicyRevisionIdException].
  /// May throw [PolicySizeLimitExceededException].
  /// May throw [PolicyCountLimitExceededException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [policyDocument] :
  /// The resource policy document, which can be up to 5kb in size.
  ///
  /// Parameter [policyName] :
  /// The name of the resource policy. Must be unique within a specific Amazon
  /// Web Services account.
  ///
  /// Parameter [bypassPolicyLockoutCheck] :
  /// A flag to indicate whether to bypass the resource policy lockout safety
  /// check.
  /// <important>
  /// Setting this value to true increases the risk that the policy becomes
  /// unmanageable. Do not set this value to true indiscriminately.
  /// </important>
  /// Use this parameter only when you include a policy in the request and you
  /// intend to prevent the principal that is making the request from making a
  /// subsequent <code>PutResourcePolicy</code> request.
  ///
  /// The default value is false.
  ///
  /// Parameter [policyRevisionId] :
  /// Specifies a specific policy revision, to ensure an atomic create
  /// operation. By default the resource policy is created if it does not exist,
  /// or updated with an incremented revision id. The revision id is unique to
  /// each policy in the account.
  ///
  /// If the policy revision id does not match the latest revision id, the
  /// operation will fail with an <code>InvalidPolicyRevisionIdException</code>
  /// exception. You can also provide a <code>PolicyRevisionId</code> of 0. In
  /// this case, the operation will fail with an
  /// <code>InvalidPolicyRevisionIdException</code> exception if a resource
  /// policy with the same name already exists.
  Future<PutResourcePolicyResult> putResourcePolicy({
    required String policyDocument,
    required String policyName,
    bool? bypassPolicyLockoutCheck,
    String? policyRevisionId,
  }) async {
    final $payload = <String, dynamic>{
      'PolicyDocument': policyDocument,
      'PolicyName': policyName,
      if (bypassPolicyLockoutCheck != null)
        'BypassPolicyLockoutCheck': bypassPolicyLockoutCheck,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutResourcePolicy',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePolicyResult.fromJson(response);
  }

  /// Used by the Amazon Web Services X-Ray daemon to upload telemetry.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [telemetryRecords] :
  /// <p/>
  ///
  /// Parameter [eC2InstanceId] :
  /// <p/>
  ///
  /// Parameter [hostname] :
  /// <p/>
  ///
  /// Parameter [resourceARN] :
  /// <p/>
  Future<void> putTelemetryRecords({
    required List<TelemetryRecord> telemetryRecords,
    String? eC2InstanceId,
    String? hostname,
    String? resourceARN,
  }) async {
    final $payload = <String, dynamic>{
      'TelemetryRecords': telemetryRecords,
      if (eC2InstanceId != null) 'EC2InstanceId': eC2InstanceId,
      if (hostname != null) 'Hostname': hostname,
      if (resourceARN != null) 'ResourceARN': resourceARN,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TelemetryRecords',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Uploads segment documents to Amazon Web Services X-Ray. The <a
  /// href="https://docs.aws.amazon.com/xray/index.html">X-Ray SDK</a> generates
  /// segment documents and sends them to the X-Ray daemon, which uploads them
  /// in batches. A segment document can be a completed segment, an in-progress
  /// segment, or an array of subsegments.
  ///
  /// Segments must include the following fields. For the full segment document
  /// schema, see <a
  /// href="https://docs.aws.amazon.com/xray/latest/devguide/xray-api-segmentdocuments.html">Amazon
  /// Web Services X-Ray Segment Documents</a> in the <i>Amazon Web Services
  /// X-Ray Developer Guide</i>.
  /// <p class="title"> <b>Required segment document fields</b>
  ///
  /// <ul>
  /// <li>
  /// <code>name</code> - The name of the service that handled the request.
  /// </li>
  /// <li>
  /// <code>id</code> - A 64-bit identifier for the segment, unique among
  /// segments in the same trace, in 16 hexadecimal digits.
  /// </li>
  /// <li>
  /// <code>trace_id</code> - A unique identifier that connects all segments and
  /// subsegments originating from a single client request.
  /// </li>
  /// <li>
  /// <code>start_time</code> - Time the segment or subsegment was created, in
  /// floating point seconds in epoch time, accurate to milliseconds. For
  /// example, <code>1480615200.010</code> or <code>1.480615200010E9</code>.
  /// </li>
  /// <li>
  /// <code>end_time</code> - Time the segment or subsegment was closed. For
  /// example, <code>1480615200.090</code> or <code>1.480615200090E9</code>.
  /// Specify either an <code>end_time</code> or <code>in_progress</code>.
  /// </li>
  /// <li>
  /// <code>in_progress</code> - Set to <code>true</code> instead of specifying
  /// an <code>end_time</code> to record that a segment has been started, but is
  /// not complete. Send an in-progress segment when your application receives a
  /// request that will take a long time to serve, to trace that the request was
  /// received. When the response is sent, send the complete segment to
  /// overwrite the in-progress segment.
  /// </li>
  /// </ul>
  /// A <code>trace_id</code> consists of three numbers separated by hyphens.
  /// For example, 1-58406520-a006649127e371903a2de979. This includes:
  /// <p class="title"> <b>Trace ID Format</b>
  ///
  /// <ul>
  /// <li>
  /// The version number, for instance, <code>1</code>.
  /// </li>
  /// <li>
  /// The time of the original request, in Unix epoch time, in 8 hexadecimal
  /// digits. For example, 10:00AM December 2nd, 2016 PST in epoch time is
  /// <code>1480615200</code> seconds, or <code>58406520</code> in hexadecimal.
  /// </li>
  /// <li>
  /// A 96-bit identifier for the trace, globally unique, in 24 hexadecimal
  /// digits.
  /// </li>
  /// </ul>
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [traceSegmentDocuments] :
  /// A string containing a JSON document defining one or more segments or
  /// subsegments.
  Future<PutTraceSegmentsResult> putTraceSegments({
    required List<String> traceSegmentDocuments,
  }) async {
    final $payload = <String, dynamic>{
      'TraceSegmentDocuments': traceSegmentDocuments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TraceSegments',
      exceptionFnMap: _exceptionFns,
    );
    return PutTraceSegmentsResult.fromJson(response);
  }

  /// Applies tags to an existing Amazon Web Services X-Ray group or sampling
  /// rule.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  /// May throw [ResourceNotFoundException].
  /// May throw [TooManyTagsException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
  ///
  /// Parameter [tags] :
  /// A map that contains one or more tag keys and tag values to attach to an
  /// X-Ray group or sampling rule. For more information about ways to use tags,
  /// see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// Amazon Web Services resources</a> in the <i>Amazon Web Services General
  /// Reference</i>.
  ///
  /// The following restrictions apply to tags:
  ///
  /// <ul>
  /// <li>
  /// Maximum number of user-applied tags per resource: 50
  /// </li>
  /// <li>
  /// Maximum tag key length: 128 Unicode characters
  /// </li>
  /// <li>
  /// Maximum tag value length: 256 Unicode characters
  /// </li>
  /// <li>
  /// Valid values for key and value: a-z, A-Z, 0-9, space, and the following
  /// characters: _ . : / = + - and @
  /// </li>
  /// <li>
  /// Tag keys and values are case sensitive.
  /// </li>
  /// <li>
  /// Don't use <code>aws:</code> as a prefix for keys; it's reserved for Amazon
  /// Web Services use. You cannot edit or delete system tags.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from an Amazon Web Services X-Ray group or sampling rule. You
  /// cannot edit or delete system tags (those with an <code>aws:</code>
  /// prefix).
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceARN] :
  /// The Amazon Resource Number (ARN) of an X-Ray group or sampling rule.
  ///
  /// Parameter [tagKeys] :
  /// Keys for one or more tags that you want to remove from an X-Ray group or
  /// sampling rule.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UntagResource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a group resource.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [filterExpression] :
  /// The updated filter expression defining criteria by which to group traces.
  ///
  /// Parameter [groupARN] :
  /// The ARN that was generated upon creation.
  ///
  /// Parameter [groupName] :
  /// The case-sensitive name of the group.
  ///
  /// Parameter [insightsConfiguration] :
  /// The structure containing configurations related to insights.
  ///
  /// <ul>
  /// <li>
  /// The InsightsEnabled boolean can be set to true to enable insights for the
  /// group or false to disable insights for the group.
  /// </li>
  /// <li>
  /// The NotificationsEnabled boolean can be set to true to enable insights
  /// notifications for the group. Notifications can only be enabled on a group
  /// with InsightsEnabled set to true.
  /// </li>
  /// </ul>
  Future<UpdateGroupResult> updateGroup({
    String? filterExpression,
    String? groupARN,
    String? groupName,
    InsightsConfiguration? insightsConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (insightsConfiguration != null)
        'InsightsConfiguration': insightsConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateGroup',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGroupResult.fromJson(response);
  }

  /// Modifies a sampling rule's configuration.
  ///
  /// May throw [InvalidRequestException].
  /// May throw [ThrottledException].
  ///
  /// Parameter [samplingRuleUpdate] :
  /// The rule and fields to change.
  Future<UpdateSamplingRuleResult> updateSamplingRule({
    required SamplingRuleUpdate samplingRuleUpdate,
  }) async {
    final $payload = <String, dynamic>{
      'SamplingRuleUpdate': samplingRuleUpdate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateSamplingRule',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSamplingRuleResult.fromJson(response);
  }
}

/// An alias for an edge.
class Alias {
  /// The canonical name of the alias.
  final String? name;

  /// A list of names for the alias, including the canonical name.
  final List<String>? names;

  /// The type of the alias.
  final String? type;

  Alias({
    this.name,
    this.names,
    this.type,
  });

  factory Alias.fromJson(Map<String, dynamic> json) {
    return Alias(
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final names = this.names;
    final type = this.type;
    return {
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (type != null) 'Type': type,
    };
  }
}

/// Value of a segment annotation. Has one of three value types: Number,
/// Boolean, or String.
class AnnotationValue {
  /// Value for a Boolean annotation.
  final bool? booleanValue;

  /// Value for a Number annotation.
  final double? numberValue;

  /// Value for a String annotation.
  final String? stringValue;

  AnnotationValue({
    this.booleanValue,
    this.numberValue,
    this.stringValue,
  });

  factory AnnotationValue.fromJson(Map<String, dynamic> json) {
    return AnnotationValue(
      booleanValue: json['BooleanValue'] as bool?,
      numberValue: json['NumberValue'] as double?,
      stringValue: json['StringValue'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final booleanValue = this.booleanValue;
    final numberValue = this.numberValue;
    final stringValue = this.stringValue;
    return {
      if (booleanValue != null) 'BooleanValue': booleanValue,
      if (numberValue != null) 'NumberValue': numberValue,
      if (stringValue != null) 'StringValue': stringValue,
    };
  }
}

/// The service within the service graph that has anomalously high fault rates.
class AnomalousService {
  final ServiceId? serviceId;

  AnomalousService({
    this.serviceId,
  });

  factory AnomalousService.fromJson(Map<String, dynamic> json) {
    return AnomalousService(
      serviceId: json['ServiceId'] != null
          ? ServiceId.fromJson(json['ServiceId'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceId = this.serviceId;
    return {
      if (serviceId != null) 'ServiceId': serviceId,
    };
  }
}

/// A list of Availability Zones corresponding to the segments in a trace.
class AvailabilityZoneDetail {
  /// The name of a corresponding Availability Zone.
  final String? name;

  AvailabilityZoneDetail({
    this.name,
  });

  factory AvailabilityZoneDetail.fromJson(Map<String, dynamic> json) {
    return AvailabilityZoneDetail(
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    return {
      if (name != null) 'Name': name,
    };
  }
}

/// <p/>
class BackendConnectionErrors {
  /// <p/>
  final int? connectionRefusedCount;

  /// <p/>
  final int? hTTPCode4XXCount;

  /// <p/>
  final int? hTTPCode5XXCount;

  /// <p/>
  final int? otherCount;

  /// <p/>
  final int? timeoutCount;

  /// <p/>
  final int? unknownHostCount;

  BackendConnectionErrors({
    this.connectionRefusedCount,
    this.hTTPCode4XXCount,
    this.hTTPCode5XXCount,
    this.otherCount,
    this.timeoutCount,
    this.unknownHostCount,
  });

  Map<String, dynamic> toJson() {
    final connectionRefusedCount = this.connectionRefusedCount;
    final hTTPCode4XXCount = this.hTTPCode4XXCount;
    final hTTPCode5XXCount = this.hTTPCode5XXCount;
    final otherCount = this.otherCount;
    final timeoutCount = this.timeoutCount;
    final unknownHostCount = this.unknownHostCount;
    return {
      if (connectionRefusedCount != null)
        'ConnectionRefusedCount': connectionRefusedCount,
      if (hTTPCode4XXCount != null) 'HTTPCode4XXCount': hTTPCode4XXCount,
      if (hTTPCode5XXCount != null) 'HTTPCode5XXCount': hTTPCode5XXCount,
      if (otherCount != null) 'OtherCount': otherCount,
      if (timeoutCount != null) 'TimeoutCount': timeoutCount,
      if (unknownHostCount != null) 'UnknownHostCount': unknownHostCount,
    };
  }
}

class BatchGetTracesResult {
  /// Pagination token.
  final String? nextToken;

  /// Full traces for the specified requests.
  final List<Trace>? traces;

  /// Trace IDs of requests that haven't been processed.
  final List<String>? unprocessedTraceIds;

  BatchGetTracesResult({
    this.nextToken,
    this.traces,
    this.unprocessedTraceIds,
  });

  factory BatchGetTracesResult.fromJson(Map<String, dynamic> json) {
    return BatchGetTracesResult(
      nextToken: json['NextToken'] as String?,
      traces: (json['Traces'] as List?)
          ?.whereNotNull()
          .map((e) => Trace.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedTraceIds: (json['UnprocessedTraceIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final traces = this.traces;
    final unprocessedTraceIds = this.unprocessedTraceIds;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (traces != null) 'Traces': traces,
      if (unprocessedTraceIds != null)
        'UnprocessedTraceIds': unprocessedTraceIds,
    };
  }
}

class CreateGroupResult {
  /// The group that was created. Contains the name of the group that was created,
  /// the Amazon Resource Name (ARN) of the group that was generated based on the
  /// group name, the filter expression, and the insight configuration that was
  /// assigned to the group.
  final Group? group;

  CreateGroupResult({
    this.group,
  });

  factory CreateGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateGroupResult(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

class CreateSamplingRuleResult {
  /// The saved rule definition and metadata.
  final SamplingRuleRecord? samplingRuleRecord;

  CreateSamplingRuleResult({
    this.samplingRuleRecord,
  });

  factory CreateSamplingRuleResult.fromJson(Map<String, dynamic> json) {
    return CreateSamplingRuleResult(
      samplingRuleRecord: json['SamplingRuleRecord'] != null
          ? SamplingRuleRecord.fromJson(
              json['SamplingRuleRecord'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final samplingRuleRecord = this.samplingRuleRecord;
    return {
      if (samplingRuleRecord != null) 'SamplingRuleRecord': samplingRuleRecord,
    };
  }
}

class DeleteGroupResult {
  DeleteGroupResult();

  factory DeleteGroupResult.fromJson(Map<String, dynamic> _) {
    return DeleteGroupResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteResourcePolicyResult {
  DeleteResourcePolicyResult();

  factory DeleteResourcePolicyResult.fromJson(Map<String, dynamic> _) {
    return DeleteResourcePolicyResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSamplingRuleResult {
  /// The deleted rule definition and metadata.
  final SamplingRuleRecord? samplingRuleRecord;

  DeleteSamplingRuleResult({
    this.samplingRuleRecord,
  });

  factory DeleteSamplingRuleResult.fromJson(Map<String, dynamic> json) {
    return DeleteSamplingRuleResult(
      samplingRuleRecord: json['SamplingRuleRecord'] != null
          ? SamplingRuleRecord.fromJson(
              json['SamplingRuleRecord'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final samplingRuleRecord = this.samplingRuleRecord;
    return {
      if (samplingRuleRecord != null) 'SamplingRuleRecord': samplingRuleRecord,
    };
  }
}

/// Information about a connection between two services. An edge can be a
/// synchronous connection, such as typical call between client and service, or
/// an asynchronous link, such as a Lambda function which retrieves an event
/// from an SNS queue.
class Edge {
  /// Aliases for the edge.
  final List<Alias>? aliases;

  /// Describes an asynchronous connection, with a value of <code>link</code>.
  final String? edgeType;

  /// The end time of the last segment on the edge.
  final DateTime? endTime;

  /// A histogram that maps the spread of event age when received by consumers.
  /// Age is calculated each time an event is received. Only populated when
  /// <i>EdgeType</i> is <code>link</code>.
  final List<HistogramEntry>? receivedEventAgeHistogram;

  /// Identifier of the edge. Unique within a service map.
  final int? referenceId;

  /// A histogram that maps the spread of client response times on an edge. Only
  /// populated for synchronous edges.
  final List<HistogramEntry>? responseTimeHistogram;

  /// The start time of the first segment on the edge.
  final DateTime? startTime;

  /// Response statistics for segments on the edge.
  final EdgeStatistics? summaryStatistics;

  Edge({
    this.aliases,
    this.edgeType,
    this.endTime,
    this.receivedEventAgeHistogram,
    this.referenceId,
    this.responseTimeHistogram,
    this.startTime,
    this.summaryStatistics,
  });

  factory Edge.fromJson(Map<String, dynamic> json) {
    return Edge(
      aliases: (json['Aliases'] as List?)
          ?.whereNotNull()
          .map((e) => Alias.fromJson(e as Map<String, dynamic>))
          .toList(),
      edgeType: json['EdgeType'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      receivedEventAgeHistogram: (json['ReceivedEventAgeHistogram'] as List?)
          ?.whereNotNull()
          .map((e) => HistogramEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      referenceId: json['ReferenceId'] as int?,
      responseTimeHistogram: (json['ResponseTimeHistogram'] as List?)
          ?.whereNotNull()
          .map((e) => HistogramEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      summaryStatistics: json['SummaryStatistics'] != null
          ? EdgeStatistics.fromJson(
              json['SummaryStatistics'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final aliases = this.aliases;
    final edgeType = this.edgeType;
    final endTime = this.endTime;
    final receivedEventAgeHistogram = this.receivedEventAgeHistogram;
    final referenceId = this.referenceId;
    final responseTimeHistogram = this.responseTimeHistogram;
    final startTime = this.startTime;
    final summaryStatistics = this.summaryStatistics;
    return {
      if (aliases != null) 'Aliases': aliases,
      if (edgeType != null) 'EdgeType': edgeType,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (receivedEventAgeHistogram != null)
        'ReceivedEventAgeHistogram': receivedEventAgeHistogram,
      if (referenceId != null) 'ReferenceId': referenceId,
      if (responseTimeHistogram != null)
        'ResponseTimeHistogram': responseTimeHistogram,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (summaryStatistics != null) 'SummaryStatistics': summaryStatistics,
    };
  }
}

/// Response statistics for an edge.
class EdgeStatistics {
  /// Information about requests that failed with a 4xx Client Error status code.
  final ErrorStatistics? errorStatistics;

  /// Information about requests that failed with a 5xx Server Error status code.
  final FaultStatistics? faultStatistics;

  /// The number of requests that completed with a 2xx Success status code.
  final int? okCount;

  /// The total number of completed requests.
  final int? totalCount;

  /// The aggregate response time of completed requests.
  final double? totalResponseTime;

  EdgeStatistics({
    this.errorStatistics,
    this.faultStatistics,
    this.okCount,
    this.totalCount,
    this.totalResponseTime,
  });

  factory EdgeStatistics.fromJson(Map<String, dynamic> json) {
    return EdgeStatistics(
      errorStatistics: json['ErrorStatistics'] != null
          ? ErrorStatistics.fromJson(
              json['ErrorStatistics'] as Map<String, dynamic>)
          : null,
      faultStatistics: json['FaultStatistics'] != null
          ? FaultStatistics.fromJson(
              json['FaultStatistics'] as Map<String, dynamic>)
          : null,
      okCount: json['OkCount'] as int?,
      totalCount: json['TotalCount'] as int?,
      totalResponseTime: json['TotalResponseTime'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorStatistics = this.errorStatistics;
    final faultStatistics = this.faultStatistics;
    final okCount = this.okCount;
    final totalCount = this.totalCount;
    final totalResponseTime = this.totalResponseTime;
    return {
      if (errorStatistics != null) 'ErrorStatistics': errorStatistics,
      if (faultStatistics != null) 'FaultStatistics': faultStatistics,
      if (okCount != null) 'OkCount': okCount,
      if (totalCount != null) 'TotalCount': totalCount,
      if (totalResponseTime != null) 'TotalResponseTime': totalResponseTime,
    };
  }
}

/// A configuration document that specifies encryption configuration settings.
class EncryptionConfig {
  /// The ID of the KMS key used for encryption, if applicable.
  final String? keyId;

  /// The encryption status. While the status is <code>UPDATING</code>, X-Ray may
  /// encrypt data with a combination of the new and old settings.
  final EncryptionStatus? status;

  /// The type of encryption. Set to <code>KMS</code> for encryption with KMS
  /// keys. Set to <code>NONE</code> for default encryption.
  final EncryptionType? type;

  EncryptionConfig({
    this.keyId,
    this.status,
    this.type,
  });

  factory EncryptionConfig.fromJson(Map<String, dynamic> json) {
    return EncryptionConfig(
      keyId: json['KeyId'] as String?,
      status: (json['Status'] as String?)?.toEncryptionStatus(),
      type: (json['Type'] as String?)?.toEncryptionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final keyId = this.keyId;
    final status = this.status;
    final type = this.type;
    return {
      if (keyId != null) 'KeyId': keyId,
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum EncryptionStatus {
  updating,
  active,
}

extension EncryptionStatusValueExtension on EncryptionStatus {
  String toValue() {
    switch (this) {
      case EncryptionStatus.updating:
        return 'UPDATING';
      case EncryptionStatus.active:
        return 'ACTIVE';
    }
  }
}

extension EncryptionStatusFromString on String {
  EncryptionStatus toEncryptionStatus() {
    switch (this) {
      case 'UPDATING':
        return EncryptionStatus.updating;
      case 'ACTIVE':
        return EncryptionStatus.active;
    }
    throw Exception('$this is not known in enum EncryptionStatus');
  }
}

enum EncryptionType {
  none,
  kms,
}

extension EncryptionTypeValueExtension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.none:
        return 'NONE';
      case EncryptionType.kms:
        return 'KMS';
    }
  }
}

extension EncryptionTypeFromString on String {
  EncryptionType toEncryptionType() {
    switch (this) {
      case 'NONE':
        return EncryptionType.none;
      case 'KMS':
        return EncryptionType.kms;
    }
    throw Exception('$this is not known in enum EncryptionType');
  }
}

/// The root cause of a trace summary error.
class ErrorRootCause {
  /// A flag that denotes that the root cause impacts the trace client.
  final bool? clientImpacting;

  /// A list of services corresponding to an error. A service identifies a segment
  /// and it contains a name, account ID, type, and inferred flag.
  final List<ErrorRootCauseService>? services;

  ErrorRootCause({
    this.clientImpacting,
    this.services,
  });

  factory ErrorRootCause.fromJson(Map<String, dynamic> json) {
    return ErrorRootCause(
      clientImpacting: json['ClientImpacting'] as bool?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorRootCauseService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientImpacting = this.clientImpacting;
    final services = this.services;
    return {
      if (clientImpacting != null) 'ClientImpacting': clientImpacting,
      if (services != null) 'Services': services,
    };
  }
}

/// A collection of segments and corresponding subsegments associated to a trace
/// summary error.
class ErrorRootCauseEntity {
  /// The types and messages of the exceptions.
  final List<RootCauseException>? exceptions;

  /// The name of the entity.
  final String? name;

  /// A flag that denotes a remote subsegment.
  final bool? remote;

  ErrorRootCauseEntity({
    this.exceptions,
    this.name,
    this.remote,
  });

  factory ErrorRootCauseEntity.fromJson(Map<String, dynamic> json) {
    return ErrorRootCauseEntity(
      exceptions: (json['Exceptions'] as List?)
          ?.whereNotNull()
          .map((e) => RootCauseException.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      remote: json['Remote'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptions = this.exceptions;
    final name = this.name;
    final remote = this.remote;
    return {
      if (exceptions != null) 'Exceptions': exceptions,
      if (name != null) 'Name': name,
      if (remote != null) 'Remote': remote,
    };
  }
}

/// A collection of fields identifying the services in a trace summary error.
class ErrorRootCauseService {
  /// The account ID associated to the service.
  final String? accountId;

  /// The path of root cause entities found on the service.
  final List<ErrorRootCauseEntity>? entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  final bool? inferred;

  /// The service name.
  final String? name;

  /// A collection of associated service names.
  final List<String>? names;

  /// The type associated to the service.
  final String? type;

  ErrorRootCauseService({
    this.accountId,
    this.entityPath,
    this.inferred,
    this.name,
    this.names,
    this.type,
  });

  factory ErrorRootCauseService.fromJson(Map<String, dynamic> json) {
    return ErrorRootCauseService(
      accountId: json['AccountId'] as String?,
      entityPath: (json['EntityPath'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorRootCauseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      inferred: json['Inferred'] as bool?,
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final entityPath = this.entityPath;
    final inferred = this.inferred;
    final name = this.name;
    final names = this.names;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (entityPath != null) 'EntityPath': entityPath,
      if (inferred != null) 'Inferred': inferred,
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (type != null) 'Type': type,
    };
  }
}

/// Information about requests that failed with a 4xx Client Error status code.
class ErrorStatistics {
  /// The number of requests that failed with untracked 4xx Client Error status
  /// codes.
  final int? otherCount;

  /// The number of requests that failed with a 419 throttling status code.
  final int? throttleCount;

  /// The total number of requests that failed with a 4xx Client Error status
  /// code.
  final int? totalCount;

  ErrorStatistics({
    this.otherCount,
    this.throttleCount,
    this.totalCount,
  });

  factory ErrorStatistics.fromJson(Map<String, dynamic> json) {
    return ErrorStatistics(
      otherCount: json['OtherCount'] as int?,
      throttleCount: json['ThrottleCount'] as int?,
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final otherCount = this.otherCount;
    final throttleCount = this.throttleCount;
    final totalCount = this.totalCount;
    return {
      if (otherCount != null) 'OtherCount': otherCount,
      if (throttleCount != null) 'ThrottleCount': throttleCount,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

/// The root cause information for a trace summary fault.
class FaultRootCause {
  /// A flag that denotes that the root cause impacts the trace client.
  final bool? clientImpacting;

  /// A list of corresponding services. A service identifies a segment and it
  /// contains a name, account ID, type, and inferred flag.
  final List<FaultRootCauseService>? services;

  FaultRootCause({
    this.clientImpacting,
    this.services,
  });

  factory FaultRootCause.fromJson(Map<String, dynamic> json) {
    return FaultRootCause(
      clientImpacting: json['ClientImpacting'] as bool?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) => FaultRootCauseService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientImpacting = this.clientImpacting;
    final services = this.services;
    return {
      if (clientImpacting != null) 'ClientImpacting': clientImpacting,
      if (services != null) 'Services': services,
    };
  }
}

/// A collection of segments and corresponding subsegments associated to a trace
/// summary fault error.
class FaultRootCauseEntity {
  /// The types and messages of the exceptions.
  final List<RootCauseException>? exceptions;

  /// The name of the entity.
  final String? name;

  /// A flag that denotes a remote subsegment.
  final bool? remote;

  FaultRootCauseEntity({
    this.exceptions,
    this.name,
    this.remote,
  });

  factory FaultRootCauseEntity.fromJson(Map<String, dynamic> json) {
    return FaultRootCauseEntity(
      exceptions: (json['Exceptions'] as List?)
          ?.whereNotNull()
          .map((e) => RootCauseException.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      remote: json['Remote'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final exceptions = this.exceptions;
    final name = this.name;
    final remote = this.remote;
    return {
      if (exceptions != null) 'Exceptions': exceptions,
      if (name != null) 'Name': name,
      if (remote != null) 'Remote': remote,
    };
  }
}

/// A collection of fields identifying the services in a trace summary fault.
class FaultRootCauseService {
  /// The account ID associated to the service.
  final String? accountId;

  /// The path of root cause entities found on the service.
  final List<FaultRootCauseEntity>? entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  final bool? inferred;

  /// The service name.
  final String? name;

  /// A collection of associated service names.
  final List<String>? names;

  /// The type associated to the service.
  final String? type;

  FaultRootCauseService({
    this.accountId,
    this.entityPath,
    this.inferred,
    this.name,
    this.names,
    this.type,
  });

  factory FaultRootCauseService.fromJson(Map<String, dynamic> json) {
    return FaultRootCauseService(
      accountId: json['AccountId'] as String?,
      entityPath: (json['EntityPath'] as List?)
          ?.whereNotNull()
          .map((e) => FaultRootCauseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      inferred: json['Inferred'] as bool?,
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final entityPath = this.entityPath;
    final inferred = this.inferred;
    final name = this.name;
    final names = this.names;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (entityPath != null) 'EntityPath': entityPath,
      if (inferred != null) 'Inferred': inferred,
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (type != null) 'Type': type,
    };
  }
}

/// Information about requests that failed with a 5xx Server Error status code.
class FaultStatistics {
  /// The number of requests that failed with untracked 5xx Server Error status
  /// codes.
  final int? otherCount;

  /// The total number of requests that failed with a 5xx Server Error status
  /// code.
  final int? totalCount;

  FaultStatistics({
    this.otherCount,
    this.totalCount,
  });

  factory FaultStatistics.fromJson(Map<String, dynamic> json) {
    return FaultStatistics(
      otherCount: json['OtherCount'] as int?,
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final otherCount = this.otherCount;
    final totalCount = this.totalCount;
    return {
      if (otherCount != null) 'OtherCount': otherCount,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

/// The predicted high and low fault count. This is used to determine if a
/// service has become anomalous and if an insight should be created.
class ForecastStatistics {
  /// The upper limit of fault counts for a service.
  final int? faultCountHigh;

  /// The lower limit of fault counts for a service.
  final int? faultCountLow;

  ForecastStatistics({
    this.faultCountHigh,
    this.faultCountLow,
  });

  factory ForecastStatistics.fromJson(Map<String, dynamic> json) {
    return ForecastStatistics(
      faultCountHigh: json['FaultCountHigh'] as int?,
      faultCountLow: json['FaultCountLow'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final faultCountHigh = this.faultCountHigh;
    final faultCountLow = this.faultCountLow;
    return {
      if (faultCountHigh != null) 'FaultCountHigh': faultCountHigh,
      if (faultCountLow != null) 'FaultCountLow': faultCountLow,
    };
  }
}

class GetEncryptionConfigResult {
  /// The encryption configuration document.
  final EncryptionConfig? encryptionConfig;

  GetEncryptionConfigResult({
    this.encryptionConfig,
  });

  factory GetEncryptionConfigResult.fromJson(Map<String, dynamic> json) {
    return GetEncryptionConfigResult(
      encryptionConfig: json['EncryptionConfig'] != null
          ? EncryptionConfig.fromJson(
              json['EncryptionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfig = this.encryptionConfig;
    return {
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
    };
  }
}

class GetGroupResult {
  /// The group that was requested. Contains the name of the group, the ARN of the
  /// group, the filter expression, and the insight configuration assigned to the
  /// group.
  final Group? group;

  GetGroupResult({
    this.group,
  });

  factory GetGroupResult.fromJson(Map<String, dynamic> json) {
    return GetGroupResult(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

class GetGroupsResult {
  /// The collection of all active groups.
  final List<GroupSummary>? groups;

  /// Pagination token.
  final String? nextToken;

  GetGroupsResult({
    this.groups,
    this.nextToken,
  });

  factory GetGroupsResult.fromJson(Map<String, dynamic> json) {
    return GetGroupsResult(
      groups: (json['Groups'] as List?)
          ?.whereNotNull()
          .map((e) => GroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groups = this.groups;
    final nextToken = this.nextToken;
    return {
      if (groups != null) 'Groups': groups,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetInsightEventsResult {
  /// A detailed description of the event. This includes the time of the event,
  /// client and root cause impact statistics, and the top anomalous service at
  /// the time of the event.
  final List<InsightEvent>? insightEvents;

  /// Use this token to retrieve the next page of insight events.
  final String? nextToken;

  GetInsightEventsResult({
    this.insightEvents,
    this.nextToken,
  });

  factory GetInsightEventsResult.fromJson(Map<String, dynamic> json) {
    return GetInsightEventsResult(
      insightEvents: (json['InsightEvents'] as List?)
          ?.whereNotNull()
          .map((e) => InsightEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightEvents = this.insightEvents;
    final nextToken = this.nextToken;
    return {
      if (insightEvents != null) 'InsightEvents': insightEvents,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetInsightImpactGraphResult {
  /// The provided end time.
  final DateTime? endTime;

  /// The insight's unique identifier.
  final String? insightId;

  /// Pagination token.
  final String? nextToken;

  /// The time, in Unix seconds, at which the service graph ended.
  final DateTime? serviceGraphEndTime;

  /// The time, in Unix seconds, at which the service graph started.
  final DateTime? serviceGraphStartTime;

  /// The Amazon Web Services instrumented services related to the insight.
  final List<InsightImpactGraphService>? services;

  /// The provided start time.
  final DateTime? startTime;

  GetInsightImpactGraphResult({
    this.endTime,
    this.insightId,
    this.nextToken,
    this.serviceGraphEndTime,
    this.serviceGraphStartTime,
    this.services,
    this.startTime,
  });

  factory GetInsightImpactGraphResult.fromJson(Map<String, dynamic> json) {
    return GetInsightImpactGraphResult(
      endTime: timeStampFromJson(json['EndTime']),
      insightId: json['InsightId'] as String?,
      nextToken: json['NextToken'] as String?,
      serviceGraphEndTime: timeStampFromJson(json['ServiceGraphEndTime']),
      serviceGraphStartTime: timeStampFromJson(json['ServiceGraphStartTime']),
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) =>
              InsightImpactGraphService.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final insightId = this.insightId;
    final nextToken = this.nextToken;
    final serviceGraphEndTime = this.serviceGraphEndTime;
    final serviceGraphStartTime = this.serviceGraphStartTime;
    final services = this.services;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (insightId != null) 'InsightId': insightId,
      if (nextToken != null) 'NextToken': nextToken,
      if (serviceGraphEndTime != null)
        'ServiceGraphEndTime': unixTimestampToJson(serviceGraphEndTime),
      if (serviceGraphStartTime != null)
        'ServiceGraphStartTime': unixTimestampToJson(serviceGraphStartTime),
      if (services != null) 'Services': services,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class GetInsightResult {
  /// The summary information of an insight.
  final Insight? insight;

  GetInsightResult({
    this.insight,
  });

  factory GetInsightResult.fromJson(Map<String, dynamic> json) {
    return GetInsightResult(
      insight: json['Insight'] != null
          ? Insight.fromJson(json['Insight'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final insight = this.insight;
    return {
      if (insight != null) 'Insight': insight,
    };
  }
}

class GetInsightSummariesResult {
  /// The summary of each insight within the group matching the provided filters.
  /// The summary contains the InsightID, start and end time, the root cause
  /// service, the root cause and client impact statistics, the top anomalous
  /// services, and the status of the insight.
  final List<InsightSummary>? insightSummaries;

  /// Pagination token.
  final String? nextToken;

  GetInsightSummariesResult({
    this.insightSummaries,
    this.nextToken,
  });

  factory GetInsightSummariesResult.fromJson(Map<String, dynamic> json) {
    return GetInsightSummariesResult(
      insightSummaries: (json['InsightSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => InsightSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightSummaries = this.insightSummaries;
    final nextToken = this.nextToken;
    return {
      if (insightSummaries != null) 'InsightSummaries': insightSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class GetSamplingRulesResult {
  /// Pagination token.
  final String? nextToken;

  /// Rule definitions and metadata.
  final List<SamplingRuleRecord>? samplingRuleRecords;

  GetSamplingRulesResult({
    this.nextToken,
    this.samplingRuleRecords,
  });

  factory GetSamplingRulesResult.fromJson(Map<String, dynamic> json) {
    return GetSamplingRulesResult(
      nextToken: json['NextToken'] as String?,
      samplingRuleRecords: (json['SamplingRuleRecords'] as List?)
          ?.whereNotNull()
          .map((e) => SamplingRuleRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final samplingRuleRecords = this.samplingRuleRecords;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (samplingRuleRecords != null)
        'SamplingRuleRecords': samplingRuleRecords,
    };
  }
}

class GetSamplingStatisticSummariesResult {
  /// Pagination token.
  final String? nextToken;

  /// Information about the number of requests instrumented for each sampling
  /// rule.
  final List<SamplingStatisticSummary>? samplingStatisticSummaries;

  GetSamplingStatisticSummariesResult({
    this.nextToken,
    this.samplingStatisticSummaries,
  });

  factory GetSamplingStatisticSummariesResult.fromJson(
      Map<String, dynamic> json) {
    return GetSamplingStatisticSummariesResult(
      nextToken: json['NextToken'] as String?,
      samplingStatisticSummaries: (json['SamplingStatisticSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SamplingStatisticSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final samplingStatisticSummaries = this.samplingStatisticSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (samplingStatisticSummaries != null)
        'SamplingStatisticSummaries': samplingStatisticSummaries,
    };
  }
}

class GetSamplingTargetsResult {
  /// The last time a user changed the sampling rule configuration. If the
  /// sampling rule configuration changed since the service last retrieved it, the
  /// service should call <a
  /// href="https://docs.aws.amazon.com/xray/latest/api/API_GetSamplingRules.html">GetSamplingRules</a>
  /// to get the latest version.
  final DateTime? lastRuleModification;

  /// Updated rules that the service should use to sample requests.
  final List<SamplingTargetDocument>? samplingTargetDocuments;

  /// Information about <a
  /// href="https://docs.aws.amazon.com/xray/latest/api/API_SamplingStatisticsDocument.html">SamplingStatisticsDocument</a>
  /// that X-Ray could not process.
  final List<UnprocessedStatistics>? unprocessedStatistics;

  GetSamplingTargetsResult({
    this.lastRuleModification,
    this.samplingTargetDocuments,
    this.unprocessedStatistics,
  });

  factory GetSamplingTargetsResult.fromJson(Map<String, dynamic> json) {
    return GetSamplingTargetsResult(
      lastRuleModification: timeStampFromJson(json['LastRuleModification']),
      samplingTargetDocuments: (json['SamplingTargetDocuments'] as List?)
          ?.whereNotNull()
          .map(
              (e) => SamplingTargetDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedStatistics: (json['UnprocessedStatistics'] as List?)
          ?.whereNotNull()
          .map((e) => UnprocessedStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastRuleModification = this.lastRuleModification;
    final samplingTargetDocuments = this.samplingTargetDocuments;
    final unprocessedStatistics = this.unprocessedStatistics;
    return {
      if (lastRuleModification != null)
        'LastRuleModification': unixTimestampToJson(lastRuleModification),
      if (samplingTargetDocuments != null)
        'SamplingTargetDocuments': samplingTargetDocuments,
      if (unprocessedStatistics != null)
        'UnprocessedStatistics': unprocessedStatistics,
    };
  }
}

class GetServiceGraphResult {
  /// A flag indicating whether the group's filter expression has been consistent,
  /// or if the returned service graph may show traces from an older version of
  /// the group's filter expression.
  final bool? containsOldGroupVersions;

  /// The end of the time frame for which the graph was generated.
  final DateTime? endTime;

  /// Pagination token.
  final String? nextToken;

  /// The services that have processed a traced request during the specified time
  /// frame.
  final List<Service>? services;

  /// The start of the time frame for which the graph was generated.
  final DateTime? startTime;

  GetServiceGraphResult({
    this.containsOldGroupVersions,
    this.endTime,
    this.nextToken,
    this.services,
    this.startTime,
  });

  factory GetServiceGraphResult.fromJson(Map<String, dynamic> json) {
    return GetServiceGraphResult(
      containsOldGroupVersions: json['ContainsOldGroupVersions'] as bool?,
      endTime: timeStampFromJson(json['EndTime']),
      nextToken: json['NextToken'] as String?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final containsOldGroupVersions = this.containsOldGroupVersions;
    final endTime = this.endTime;
    final nextToken = this.nextToken;
    final services = this.services;
    final startTime = this.startTime;
    return {
      if (containsOldGroupVersions != null)
        'ContainsOldGroupVersions': containsOldGroupVersions,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (nextToken != null) 'NextToken': nextToken,
      if (services != null) 'Services': services,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

class GetTimeSeriesServiceStatisticsResult {
  /// A flag indicating whether or not a group's filter expression has been
  /// consistent, or if a returned aggregation might show statistics from an older
  /// version of the group's filter expression.
  final bool? containsOldGroupVersions;

  /// Pagination token.
  final String? nextToken;

  /// The collection of statistics.
  final List<TimeSeriesServiceStatistics>? timeSeriesServiceStatistics;

  GetTimeSeriesServiceStatisticsResult({
    this.containsOldGroupVersions,
    this.nextToken,
    this.timeSeriesServiceStatistics,
  });

  factory GetTimeSeriesServiceStatisticsResult.fromJson(
      Map<String, dynamic> json) {
    return GetTimeSeriesServiceStatisticsResult(
      containsOldGroupVersions: json['ContainsOldGroupVersions'] as bool?,
      nextToken: json['NextToken'] as String?,
      timeSeriesServiceStatistics: (json['TimeSeriesServiceStatistics']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              TimeSeriesServiceStatistics.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final containsOldGroupVersions = this.containsOldGroupVersions;
    final nextToken = this.nextToken;
    final timeSeriesServiceStatistics = this.timeSeriesServiceStatistics;
    return {
      if (containsOldGroupVersions != null)
        'ContainsOldGroupVersions': containsOldGroupVersions,
      if (nextToken != null) 'NextToken': nextToken,
      if (timeSeriesServiceStatistics != null)
        'TimeSeriesServiceStatistics': timeSeriesServiceStatistics,
    };
  }
}

class GetTraceGraphResult {
  /// Pagination token.
  final String? nextToken;

  /// The services that have processed one of the specified requests.
  final List<Service>? services;

  GetTraceGraphResult({
    this.nextToken,
    this.services,
  });

  factory GetTraceGraphResult.fromJson(Map<String, dynamic> json) {
    return GetTraceGraphResult(
      nextToken: json['NextToken'] as String?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) => Service.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final services = this.services;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (services != null) 'Services': services,
    };
  }
}

class GetTraceSummariesResult {
  /// The start time of this page of results.
  final DateTime? approximateTime;

  /// If the requested time frame contained more than one page of results, you can
  /// use this token to retrieve the next page. The first page contains the most
  /// recent results, closest to the end of the time frame.
  final String? nextToken;

  /// Trace IDs and annotations for traces that were found in the specified time
  /// frame.
  final List<TraceSummary>? traceSummaries;

  /// The total number of traces processed, including traces that did not match
  /// the specified filter expression.
  final int? tracesProcessedCount;

  GetTraceSummariesResult({
    this.approximateTime,
    this.nextToken,
    this.traceSummaries,
    this.tracesProcessedCount,
  });

  factory GetTraceSummariesResult.fromJson(Map<String, dynamic> json) {
    return GetTraceSummariesResult(
      approximateTime: timeStampFromJson(json['ApproximateTime']),
      nextToken: json['NextToken'] as String?,
      traceSummaries: (json['TraceSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => TraceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracesProcessedCount: json['TracesProcessedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateTime = this.approximateTime;
    final nextToken = this.nextToken;
    final traceSummaries = this.traceSummaries;
    final tracesProcessedCount = this.tracesProcessedCount;
    return {
      if (approximateTime != null)
        'ApproximateTime': unixTimestampToJson(approximateTime),
      if (nextToken != null) 'NextToken': nextToken,
      if (traceSummaries != null) 'TraceSummaries': traceSummaries,
      if (tracesProcessedCount != null)
        'TracesProcessedCount': tracesProcessedCount,
    };
  }
}

/// Details and metadata for a group.
class Group {
  /// The filter expression defining the parameters to include traces.
  final String? filterExpression;

  /// The Amazon Resource Name (ARN) of the group generated based on the
  /// GroupName.
  final String? groupARN;

  /// The unique case-sensitive name of the group.
  final String? groupName;

  /// The structure containing configurations related to insights.
  ///
  /// <ul>
  /// <li>
  /// The InsightsEnabled boolean can be set to true to enable insights for the
  /// group or false to disable insights for the group.
  /// </li>
  /// <li>
  /// The NotificationsEnabled boolean can be set to true to enable insights
  /// notifications through Amazon EventBridge for the group.
  /// </li>
  /// </ul>
  final InsightsConfiguration? insightsConfiguration;

  Group({
    this.filterExpression,
    this.groupARN,
    this.groupName,
    this.insightsConfiguration,
  });

  factory Group.fromJson(Map<String, dynamic> json) {
    return Group(
      filterExpression: json['FilterExpression'] as String?,
      groupARN: json['GroupARN'] as String?,
      groupName: json['GroupName'] as String?,
      insightsConfiguration: json['InsightsConfiguration'] != null
          ? InsightsConfiguration.fromJson(
              json['InsightsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterExpression = this.filterExpression;
    final groupARN = this.groupARN;
    final groupName = this.groupName;
    final insightsConfiguration = this.insightsConfiguration;
    return {
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (insightsConfiguration != null)
        'InsightsConfiguration': insightsConfiguration,
    };
  }
}

/// Details for a group without metadata.
class GroupSummary {
  /// The filter expression defining the parameters to include traces.
  final String? filterExpression;

  /// The ARN of the group generated based on the GroupName.
  final String? groupARN;

  /// The unique case-sensitive name of the group.
  final String? groupName;

  /// The structure containing configurations related to insights.
  ///
  /// <ul>
  /// <li>
  /// The InsightsEnabled boolean can be set to true to enable insights for the
  /// group or false to disable insights for the group.
  /// </li>
  /// <li>
  /// The NotificationsEnabled boolean can be set to true to enable insights
  /// notifications. Notifications can only be enabled on a group with
  /// InsightsEnabled set to true.
  /// </li>
  /// </ul>
  final InsightsConfiguration? insightsConfiguration;

  GroupSummary({
    this.filterExpression,
    this.groupARN,
    this.groupName,
    this.insightsConfiguration,
  });

  factory GroupSummary.fromJson(Map<String, dynamic> json) {
    return GroupSummary(
      filterExpression: json['FilterExpression'] as String?,
      groupARN: json['GroupARN'] as String?,
      groupName: json['GroupName'] as String?,
      insightsConfiguration: json['InsightsConfiguration'] != null
          ? InsightsConfiguration.fromJson(
              json['InsightsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final filterExpression = this.filterExpression;
    final groupARN = this.groupARN;
    final groupName = this.groupName;
    final insightsConfiguration = this.insightsConfiguration;
    return {
      if (filterExpression != null) 'FilterExpression': filterExpression,
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (insightsConfiguration != null)
        'InsightsConfiguration': insightsConfiguration,
    };
  }
}

/// An entry in a histogram for a statistic. A histogram maps the range of
/// observed values on the X axis, and the prevalence of each value on the Y
/// axis.
class HistogramEntry {
  /// The prevalence of the entry.
  final int? count;

  /// The value of the entry.
  final double? value;

  HistogramEntry({
    this.count,
    this.value,
  });

  factory HistogramEntry.fromJson(Map<String, dynamic> json) {
    return HistogramEntry(
      count: json['Count'] as int?,
      value: json['Value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final value = this.value;
    return {
      if (count != null) 'Count': count,
      if (value != null) 'Value': value,
    };
  }
}

/// Information about an HTTP request.
class Http {
  /// The IP address of the requestor.
  final String? clientIp;

  /// The request method.
  final String? httpMethod;

  /// The response status.
  final int? httpStatus;

  /// The request URL.
  final String? httpURL;

  /// The request's user agent string.
  final String? userAgent;

  Http({
    this.clientIp,
    this.httpMethod,
    this.httpStatus,
    this.httpURL,
    this.userAgent,
  });

  factory Http.fromJson(Map<String, dynamic> json) {
    return Http(
      clientIp: json['ClientIp'] as String?,
      httpMethod: json['HttpMethod'] as String?,
      httpStatus: json['HttpStatus'] as int?,
      httpURL: json['HttpURL'] as String?,
      userAgent: json['UserAgent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientIp = this.clientIp;
    final httpMethod = this.httpMethod;
    final httpStatus = this.httpStatus;
    final httpURL = this.httpURL;
    final userAgent = this.userAgent;
    return {
      if (clientIp != null) 'ClientIp': clientIp,
      if (httpMethod != null) 'HttpMethod': httpMethod,
      if (httpStatus != null) 'HttpStatus': httpStatus,
      if (httpURL != null) 'HttpURL': httpURL,
      if (userAgent != null) 'UserAgent': userAgent,
    };
  }
}

/// When fault rates go outside of the expected range, X-Ray creates an insight.
/// Insights tracks emergent issues within your applications.
class Insight {
  /// The categories that label and describe the type of insight.
  final List<InsightCategory>? categories;

  /// The impact statistics of the client side service. This includes the number
  /// of requests to the client service and whether the requests were faults or
  /// okay.
  final RequestImpactStatistics? clientRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight ended.
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) of the group that the insight belongs to.
  final String? groupARN;

  /// The name of the group that the insight belongs to.
  final String? groupName;

  /// The insights unique identifier.
  final String? insightId;
  final ServiceId? rootCauseServiceId;

  /// The impact statistics of the root cause service. This includes the number of
  /// requests to the client service and whether the requests were faults or okay.
  final RequestImpactStatistics? rootCauseServiceRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight began.
  final DateTime? startTime;

  /// The current state of the insight.
  final InsightState? state;

  /// A brief description of the insight.
  final String? summary;

  /// The service within the insight that is most impacted by the incident.
  final List<AnomalousService>? topAnomalousServices;

  Insight({
    this.categories,
    this.clientRequestImpactStatistics,
    this.endTime,
    this.groupARN,
    this.groupName,
    this.insightId,
    this.rootCauseServiceId,
    this.rootCauseServiceRequestImpactStatistics,
    this.startTime,
    this.state,
    this.summary,
    this.topAnomalousServices,
  });

  factory Insight.fromJson(Map<String, dynamic> json) {
    return Insight(
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInsightCategory())
          .toList(),
      clientRequestImpactStatistics:
          json['ClientRequestImpactStatistics'] != null
              ? RequestImpactStatistics.fromJson(
                  json['ClientRequestImpactStatistics'] as Map<String, dynamic>)
              : null,
      endTime: timeStampFromJson(json['EndTime']),
      groupARN: json['GroupARN'] as String?,
      groupName: json['GroupName'] as String?,
      insightId: json['InsightId'] as String?,
      rootCauseServiceId: json['RootCauseServiceId'] != null
          ? ServiceId.fromJson(
              json['RootCauseServiceId'] as Map<String, dynamic>)
          : null,
      rootCauseServiceRequestImpactStatistics:
          json['RootCauseServiceRequestImpactStatistics'] != null
              ? RequestImpactStatistics.fromJson(
                  json['RootCauseServiceRequestImpactStatistics']
                      as Map<String, dynamic>)
              : null,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.toInsightState(),
      summary: json['Summary'] as String?,
      topAnomalousServices: (json['TopAnomalousServices'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalousService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final clientRequestImpactStatistics = this.clientRequestImpactStatistics;
    final endTime = this.endTime;
    final groupARN = this.groupARN;
    final groupName = this.groupName;
    final insightId = this.insightId;
    final rootCauseServiceId = this.rootCauseServiceId;
    final rootCauseServiceRequestImpactStatistics =
        this.rootCauseServiceRequestImpactStatistics;
    final startTime = this.startTime;
    final state = this.state;
    final summary = this.summary;
    final topAnomalousServices = this.topAnomalousServices;
    return {
      if (categories != null)
        'Categories': categories.map((e) => e.toValue()).toList(),
      if (clientRequestImpactStatistics != null)
        'ClientRequestImpactStatistics': clientRequestImpactStatistics,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (insightId != null) 'InsightId': insightId,
      if (rootCauseServiceId != null) 'RootCauseServiceId': rootCauseServiceId,
      if (rootCauseServiceRequestImpactStatistics != null)
        'RootCauseServiceRequestImpactStatistics':
            rootCauseServiceRequestImpactStatistics,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.toValue(),
      if (summary != null) 'Summary': summary,
      if (topAnomalousServices != null)
        'TopAnomalousServices': topAnomalousServices,
    };
  }
}

enum InsightCategory {
  fault,
}

extension InsightCategoryValueExtension on InsightCategory {
  String toValue() {
    switch (this) {
      case InsightCategory.fault:
        return 'FAULT';
    }
  }
}

extension InsightCategoryFromString on String {
  InsightCategory toInsightCategory() {
    switch (this) {
      case 'FAULT':
        return InsightCategory.fault;
    }
    throw Exception('$this is not known in enum InsightCategory');
  }
}

/// X-Ray reevaluates insights periodically until they are resolved, and records
/// each intermediate state in an event. You can review incident events in the
/// Impact Timeline on the Inspect page in the X-Ray console.
class InsightEvent {
  /// The impact statistics of the client side service. This includes the number
  /// of requests to the client service and whether the requests were faults or
  /// okay.
  final RequestImpactStatistics? clientRequestImpactStatistics;

  /// The time, in Unix seconds, at which the event was recorded.
  final DateTime? eventTime;

  /// The impact statistics of the root cause service. This includes the number of
  /// requests to the client service and whether the requests were faults or okay.
  final RequestImpactStatistics? rootCauseServiceRequestImpactStatistics;

  /// A brief description of the event.
  final String? summary;

  /// The service during the event that is most impacted by the incident.
  final List<AnomalousService>? topAnomalousServices;

  InsightEvent({
    this.clientRequestImpactStatistics,
    this.eventTime,
    this.rootCauseServiceRequestImpactStatistics,
    this.summary,
    this.topAnomalousServices,
  });

  factory InsightEvent.fromJson(Map<String, dynamic> json) {
    return InsightEvent(
      clientRequestImpactStatistics:
          json['ClientRequestImpactStatistics'] != null
              ? RequestImpactStatistics.fromJson(
                  json['ClientRequestImpactStatistics'] as Map<String, dynamic>)
              : null,
      eventTime: timeStampFromJson(json['EventTime']),
      rootCauseServiceRequestImpactStatistics:
          json['RootCauseServiceRequestImpactStatistics'] != null
              ? RequestImpactStatistics.fromJson(
                  json['RootCauseServiceRequestImpactStatistics']
                      as Map<String, dynamic>)
              : null,
      summary: json['Summary'] as String?,
      topAnomalousServices: (json['TopAnomalousServices'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalousService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientRequestImpactStatistics = this.clientRequestImpactStatistics;
    final eventTime = this.eventTime;
    final rootCauseServiceRequestImpactStatistics =
        this.rootCauseServiceRequestImpactStatistics;
    final summary = this.summary;
    final topAnomalousServices = this.topAnomalousServices;
    return {
      if (clientRequestImpactStatistics != null)
        'ClientRequestImpactStatistics': clientRequestImpactStatistics,
      if (eventTime != null) 'EventTime': unixTimestampToJson(eventTime),
      if (rootCauseServiceRequestImpactStatistics != null)
        'RootCauseServiceRequestImpactStatistics':
            rootCauseServiceRequestImpactStatistics,
      if (summary != null) 'Summary': summary,
      if (topAnomalousServices != null)
        'TopAnomalousServices': topAnomalousServices,
    };
  }
}

/// The connection between two service in an insight impact graph.
class InsightImpactGraphEdge {
  /// Identifier of the edge. Unique within a service map.
  final int? referenceId;

  InsightImpactGraphEdge({
    this.referenceId,
  });

  factory InsightImpactGraphEdge.fromJson(Map<String, dynamic> json) {
    return InsightImpactGraphEdge(
      referenceId: json['ReferenceId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final referenceId = this.referenceId;
    return {
      if (referenceId != null) 'ReferenceId': referenceId,
    };
  }
}

/// Information about an application that processed requests, users that made
/// requests, or downstream services, resources, and applications that an
/// application used.
class InsightImpactGraphService {
  /// Identifier of the Amazon Web Services account in which the service runs.
  final String? accountId;

  /// Connections to downstream services.
  final List<InsightImpactGraphEdge>? edges;

  /// The canonical name of the service.
  final String? name;

  /// A list of names for the service, including the canonical name.
  final List<String>? names;

  /// Identifier for the service. Unique within the service map.
  final int? referenceId;

  /// Identifier for the service. Unique within the service map.
  ///
  /// <ul>
  /// <li>
  /// Amazon Web Services Resource - The type of an Amazon Web Services resource.
  /// For example, AWS::EC2::Instance for an application running on Amazon EC2 or
  /// AWS::DynamoDB::Table for an Amazon DynamoDB table that the application used.
  /// </li>
  /// <li>
  /// Amazon Web Services Service - The type of an Amazon Web Services service.
  /// For example, AWS::DynamoDB for downstream calls to Amazon DynamoDB that
  /// didn't target a specific table.
  /// </li>
  /// <li>
  /// Amazon Web Services Service - The type of an Amazon Web Services service.
  /// For example, AWS::DynamoDB for downstream calls to Amazon DynamoDB that
  /// didn't target a specific table.
  /// </li>
  /// <li>
  /// remote - A downstream service of indeterminate type.
  /// </li>
  /// </ul>
  final String? type;

  InsightImpactGraphService({
    this.accountId,
    this.edges,
    this.name,
    this.names,
    this.referenceId,
    this.type,
  });

  factory InsightImpactGraphService.fromJson(Map<String, dynamic> json) {
    return InsightImpactGraphService(
      accountId: json['AccountId'] as String?,
      edges: (json['Edges'] as List?)
          ?.whereNotNull()
          .map(
              (e) => InsightImpactGraphEdge.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      referenceId: json['ReferenceId'] as int?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final edges = this.edges;
    final name = this.name;
    final names = this.names;
    final referenceId = this.referenceId;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (edges != null) 'Edges': edges,
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (referenceId != null) 'ReferenceId': referenceId,
      if (type != null) 'Type': type,
    };
  }
}

enum InsightState {
  active,
  closed,
}

extension InsightStateValueExtension on InsightState {
  String toValue() {
    switch (this) {
      case InsightState.active:
        return 'ACTIVE';
      case InsightState.closed:
        return 'CLOSED';
    }
  }
}

extension InsightStateFromString on String {
  InsightState toInsightState() {
    switch (this) {
      case 'ACTIVE':
        return InsightState.active;
      case 'CLOSED':
        return InsightState.closed;
    }
    throw Exception('$this is not known in enum InsightState');
  }
}

/// Information that describes an insight.
class InsightSummary {
  /// Categories The categories that label and describe the type of insight.
  final List<InsightCategory>? categories;

  /// The impact statistics of the client side service. This includes the number
  /// of requests to the client service and whether the requests were faults or
  /// okay.
  final RequestImpactStatistics? clientRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight ended.
  final DateTime? endTime;

  /// The Amazon Resource Name (ARN) of the group that the insight belongs to.
  final String? groupARN;

  /// The name of the group that the insight belongs to.
  final String? groupName;

  /// The insights unique identifier.
  final String? insightId;

  /// The time, in Unix seconds, that the insight was last updated.
  final DateTime? lastUpdateTime;
  final ServiceId? rootCauseServiceId;

  /// The impact statistics of the root cause service. This includes the number of
  /// requests to the client service and whether the requests were faults or okay.
  final RequestImpactStatistics? rootCauseServiceRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight began.
  final DateTime? startTime;

  /// The current state of the insight.
  final InsightState? state;

  /// A brief description of the insight.
  final String? summary;

  /// The service within the insight that is most impacted by the incident.
  final List<AnomalousService>? topAnomalousServices;

  InsightSummary({
    this.categories,
    this.clientRequestImpactStatistics,
    this.endTime,
    this.groupARN,
    this.groupName,
    this.insightId,
    this.lastUpdateTime,
    this.rootCauseServiceId,
    this.rootCauseServiceRequestImpactStatistics,
    this.startTime,
    this.state,
    this.summary,
    this.topAnomalousServices,
  });

  factory InsightSummary.fromJson(Map<String, dynamic> json) {
    return InsightSummary(
      categories: (json['Categories'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toInsightCategory())
          .toList(),
      clientRequestImpactStatistics:
          json['ClientRequestImpactStatistics'] != null
              ? RequestImpactStatistics.fromJson(
                  json['ClientRequestImpactStatistics'] as Map<String, dynamic>)
              : null,
      endTime: timeStampFromJson(json['EndTime']),
      groupARN: json['GroupARN'] as String?,
      groupName: json['GroupName'] as String?,
      insightId: json['InsightId'] as String?,
      lastUpdateTime: timeStampFromJson(json['LastUpdateTime']),
      rootCauseServiceId: json['RootCauseServiceId'] != null
          ? ServiceId.fromJson(
              json['RootCauseServiceId'] as Map<String, dynamic>)
          : null,
      rootCauseServiceRequestImpactStatistics:
          json['RootCauseServiceRequestImpactStatistics'] != null
              ? RequestImpactStatistics.fromJson(
                  json['RootCauseServiceRequestImpactStatistics']
                      as Map<String, dynamic>)
              : null,
      startTime: timeStampFromJson(json['StartTime']),
      state: (json['State'] as String?)?.toInsightState(),
      summary: json['Summary'] as String?,
      topAnomalousServices: (json['TopAnomalousServices'] as List?)
          ?.whereNotNull()
          .map((e) => AnomalousService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final categories = this.categories;
    final clientRequestImpactStatistics = this.clientRequestImpactStatistics;
    final endTime = this.endTime;
    final groupARN = this.groupARN;
    final groupName = this.groupName;
    final insightId = this.insightId;
    final lastUpdateTime = this.lastUpdateTime;
    final rootCauseServiceId = this.rootCauseServiceId;
    final rootCauseServiceRequestImpactStatistics =
        this.rootCauseServiceRequestImpactStatistics;
    final startTime = this.startTime;
    final state = this.state;
    final summary = this.summary;
    final topAnomalousServices = this.topAnomalousServices;
    return {
      if (categories != null)
        'Categories': categories.map((e) => e.toValue()).toList(),
      if (clientRequestImpactStatistics != null)
        'ClientRequestImpactStatistics': clientRequestImpactStatistics,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (insightId != null) 'InsightId': insightId,
      if (lastUpdateTime != null)
        'LastUpdateTime': unixTimestampToJson(lastUpdateTime),
      if (rootCauseServiceId != null) 'RootCauseServiceId': rootCauseServiceId,
      if (rootCauseServiceRequestImpactStatistics != null)
        'RootCauseServiceRequestImpactStatistics':
            rootCauseServiceRequestImpactStatistics,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state.toValue(),
      if (summary != null) 'Summary': summary,
      if (topAnomalousServices != null)
        'TopAnomalousServices': topAnomalousServices,
    };
  }
}

/// The structure containing configurations related to insights.
class InsightsConfiguration {
  /// Set the InsightsEnabled value to true to enable insights or false to disable
  /// insights.
  final bool? insightsEnabled;

  /// Set the NotificationsEnabled value to true to enable insights notifications.
  /// Notifications can only be enabled on a group with InsightsEnabled set to
  /// true.
  final bool? notificationsEnabled;

  InsightsConfiguration({
    this.insightsEnabled,
    this.notificationsEnabled,
  });

  factory InsightsConfiguration.fromJson(Map<String, dynamic> json) {
    return InsightsConfiguration(
      insightsEnabled: json['InsightsEnabled'] as bool?,
      notificationsEnabled: json['NotificationsEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightsEnabled = this.insightsEnabled;
    final notificationsEnabled = this.notificationsEnabled;
    return {
      if (insightsEnabled != null) 'InsightsEnabled': insightsEnabled,
      if (notificationsEnabled != null)
        'NotificationsEnabled': notificationsEnabled,
    };
  }
}

/// A list of EC2 instance IDs corresponding to the segments in a trace.
class InstanceIdDetail {
  /// The ID of a corresponding EC2 instance.
  final String? id;

  InstanceIdDetail({
    this.id,
  });

  factory InstanceIdDetail.fromJson(Map<String, dynamic> json) {
    return InstanceIdDetail(
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

class ListResourcePoliciesResult {
  /// Pagination token. Not currently supported.
  final String? nextToken;

  /// The list of resource policies in the target Amazon Web Services account.
  final List<ResourcePolicy>? resourcePolicies;

  ListResourcePoliciesResult({
    this.nextToken,
    this.resourcePolicies,
  });

  factory ListResourcePoliciesResult.fromJson(Map<String, dynamic> json) {
    return ListResourcePoliciesResult(
      nextToken: json['NextToken'] as String?,
      resourcePolicies: (json['ResourcePolicies'] as List?)
          ?.whereNotNull()
          .map((e) => ResourcePolicy.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourcePolicies = this.resourcePolicies;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (resourcePolicies != null) 'ResourcePolicies': resourcePolicies,
    };
  }
}

class ListTagsForResourceResponse {
  /// A pagination token. If multiple pages of results are returned, use the
  /// <code>NextToken</code> value returned with the current page of results to
  /// get the next page of results.
  final String? nextToken;

  /// A list of tags, as key and value pairs, that is associated with the
  /// specified X-Ray group or sampling rule.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      nextToken: json['NextToken'] as String?,
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final tags = this.tags;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (tags != null) 'Tags': tags,
    };
  }
}

class PutEncryptionConfigResult {
  /// The new encryption configuration.
  final EncryptionConfig? encryptionConfig;

  PutEncryptionConfigResult({
    this.encryptionConfig,
  });

  factory PutEncryptionConfigResult.fromJson(Map<String, dynamic> json) {
    return PutEncryptionConfigResult(
      encryptionConfig: json['EncryptionConfig'] != null
          ? EncryptionConfig.fromJson(
              json['EncryptionConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionConfig = this.encryptionConfig;
    return {
      if (encryptionConfig != null) 'EncryptionConfig': encryptionConfig,
    };
  }
}

class PutResourcePolicyResult {
  /// The resource policy document, as provided in the
  /// <code>PutResourcePolicyRequest</code>.
  final ResourcePolicy? resourcePolicy;

  PutResourcePolicyResult({
    this.resourcePolicy,
  });

  factory PutResourcePolicyResult.fromJson(Map<String, dynamic> json) {
    return PutResourcePolicyResult(
      resourcePolicy: json['ResourcePolicy'] != null
          ? ResourcePolicy.fromJson(
              json['ResourcePolicy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final resourcePolicy = this.resourcePolicy;
    return {
      if (resourcePolicy != null) 'ResourcePolicy': resourcePolicy,
    };
  }
}

class PutTelemetryRecordsResult {
  PutTelemetryRecordsResult();

  factory PutTelemetryRecordsResult.fromJson(Map<String, dynamic> _) {
    return PutTelemetryRecordsResult();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutTraceSegmentsResult {
  /// Segments that failed processing.
  final List<UnprocessedTraceSegment>? unprocessedTraceSegments;

  PutTraceSegmentsResult({
    this.unprocessedTraceSegments,
  });

  factory PutTraceSegmentsResult.fromJson(Map<String, dynamic> json) {
    return PutTraceSegmentsResult(
      unprocessedTraceSegments: (json['UnprocessedTraceSegments'] as List?)
          ?.whereNotNull()
          .map((e) =>
              UnprocessedTraceSegment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedTraceSegments = this.unprocessedTraceSegments;
    return {
      if (unprocessedTraceSegments != null)
        'UnprocessedTraceSegments': unprocessedTraceSegments,
    };
  }
}

/// Statistics that describe how the incident has impacted a service.
class RequestImpactStatistics {
  /// The number of requests that have resulted in a fault,
  final int? faultCount;

  /// The number of successful requests.
  final int? okCount;

  /// The total number of requests to the service.
  final int? totalCount;

  RequestImpactStatistics({
    this.faultCount,
    this.okCount,
    this.totalCount,
  });

  factory RequestImpactStatistics.fromJson(Map<String, dynamic> json) {
    return RequestImpactStatistics(
      faultCount: json['FaultCount'] as int?,
      okCount: json['OkCount'] as int?,
      totalCount: json['TotalCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final faultCount = this.faultCount;
    final okCount = this.okCount;
    final totalCount = this.totalCount;
    return {
      if (faultCount != null) 'FaultCount': faultCount,
      if (okCount != null) 'OkCount': okCount,
      if (totalCount != null) 'TotalCount': totalCount,
    };
  }
}

/// A list of resources ARNs corresponding to the segments in a trace.
class ResourceARNDetail {
  /// The ARN of a corresponding resource.
  final String? arn;

  ResourceARNDetail({
    this.arn,
  });

  factory ResourceARNDetail.fromJson(Map<String, dynamic> json) {
    return ResourceARNDetail(
      arn: json['ARN'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    return {
      if (arn != null) 'ARN': arn,
    };
  }
}

/// A resource policy grants one or more Amazon Web Services services and
/// accounts permissions to access X-Ray. Each resource policy is associated
/// with a specific Amazon Web Services account.
class ResourcePolicy {
  /// When the policy was last updated, in Unix time seconds.
  final DateTime? lastUpdatedTime;

  /// The resource policy document, which can be up to 5kb in size.
  final String? policyDocument;

  /// The name of the resource policy. Must be unique within a specific Amazon Web
  /// Services account.
  final String? policyName;

  /// Returns the current policy revision id for this policy name.
  final String? policyRevisionId;

  ResourcePolicy({
    this.lastUpdatedTime,
    this.policyDocument,
    this.policyName,
    this.policyRevisionId,
  });

  factory ResourcePolicy.fromJson(Map<String, dynamic> json) {
    return ResourcePolicy(
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      policyDocument: json['PolicyDocument'] as String?,
      policyName: json['PolicyName'] as String?,
      policyRevisionId: json['PolicyRevisionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastUpdatedTime = this.lastUpdatedTime;
    final policyDocument = this.policyDocument;
    final policyName = this.policyName;
    final policyRevisionId = this.policyRevisionId;
    return {
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (policyDocument != null) 'PolicyDocument': policyDocument,
      if (policyName != null) 'PolicyName': policyName,
      if (policyRevisionId != null) 'PolicyRevisionId': policyRevisionId,
    };
  }
}

/// The root cause information for a response time warning.
class ResponseTimeRootCause {
  /// A flag that denotes that the root cause impacts the trace client.
  final bool? clientImpacting;

  /// A list of corresponding services. A service identifies a segment and
  /// contains a name, account ID, type, and inferred flag.
  final List<ResponseTimeRootCauseService>? services;

  ResponseTimeRootCause({
    this.clientImpacting,
    this.services,
  });

  factory ResponseTimeRootCause.fromJson(Map<String, dynamic> json) {
    return ResponseTimeRootCause(
      clientImpacting: json['ClientImpacting'] as bool?,
      services: (json['Services'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResponseTimeRootCauseService.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientImpacting = this.clientImpacting;
    final services = this.services;
    return {
      if (clientImpacting != null) 'ClientImpacting': clientImpacting,
      if (services != null) 'Services': services,
    };
  }
}

/// A collection of segments and corresponding subsegments associated to a
/// response time warning.
class ResponseTimeRootCauseEntity {
  /// The type and messages of the exceptions.
  final double? coverage;

  /// The name of the entity.
  final String? name;

  /// A flag that denotes a remote subsegment.
  final bool? remote;

  ResponseTimeRootCauseEntity({
    this.coverage,
    this.name,
    this.remote,
  });

  factory ResponseTimeRootCauseEntity.fromJson(Map<String, dynamic> json) {
    return ResponseTimeRootCauseEntity(
      coverage: json['Coverage'] as double?,
      name: json['Name'] as String?,
      remote: json['Remote'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final coverage = this.coverage;
    final name = this.name;
    final remote = this.remote;
    return {
      if (coverage != null) 'Coverage': coverage,
      if (name != null) 'Name': name,
      if (remote != null) 'Remote': remote,
    };
  }
}

/// A collection of fields identifying the service in a response time warning.
class ResponseTimeRootCauseService {
  /// The account ID associated to the service.
  final String? accountId;

  /// The path of root cause entities found on the service.
  final List<ResponseTimeRootCauseEntity>? entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  final bool? inferred;

  /// The service name.
  final String? name;

  /// A collection of associated service names.
  final List<String>? names;

  /// The type associated to the service.
  final String? type;

  ResponseTimeRootCauseService({
    this.accountId,
    this.entityPath,
    this.inferred,
    this.name,
    this.names,
    this.type,
  });

  factory ResponseTimeRootCauseService.fromJson(Map<String, dynamic> json) {
    return ResponseTimeRootCauseService(
      accountId: json['AccountId'] as String?,
      entityPath: (json['EntityPath'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResponseTimeRootCauseEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      inferred: json['Inferred'] as bool?,
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final entityPath = this.entityPath;
    final inferred = this.inferred;
    final name = this.name;
    final names = this.names;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (entityPath != null) 'EntityPath': entityPath,
      if (inferred != null) 'Inferred': inferred,
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (type != null) 'Type': type,
    };
  }
}

/// The exception associated with a root cause.
class RootCauseException {
  /// The message of the exception.
  final String? message;

  /// The name of the exception.
  final String? name;

  RootCauseException({
    this.message,
    this.name,
  });

  factory RootCauseException.fromJson(Map<String, dynamic> json) {
    return RootCauseException(
      message: json['Message'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final name = this.name;
    return {
      if (message != null) 'Message': message,
      if (name != null) 'Name': name,
    };
  }
}

/// A sampling rule that services use to decide whether to instrument a request.
/// Rule fields can match properties of the service, or properties of a request.
/// The service can ignore rules that don't match its properties.
class SamplingRule {
  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  final double fixedRate;

  /// Matches the HTTP method of a request.
  final String hTTPMethod;

  /// Matches the hostname from a request URL.
  final String host;

  /// The priority of the sampling rule.
  final int priority;

  /// A fixed number of matching requests to instrument per second, prior to
  /// applying the fixed rate. The reservoir is not used directly by services, but
  /// applies to all services using the rule collectively.
  final int reservoirSize;

  /// Matches the ARN of the Amazon Web Services resource on which the service
  /// runs.
  final String resourceARN;

  /// Matches the <code>name</code> that the service uses to identify itself in
  /// segments.
  final String serviceName;

  /// Matches the <code>origin</code> that the service uses to identify its type
  /// in segments.
  final String serviceType;

  /// Matches the path from a request URL.
  final String uRLPath;

  /// The version of the sampling rule format (<code>1</code>).
  final int version;

  /// Matches attributes derived from the request.
  final Map<String, String>? attributes;

  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  final String? ruleARN;

  /// The name of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  final String? ruleName;

  SamplingRule({
    required this.fixedRate,
    required this.hTTPMethod,
    required this.host,
    required this.priority,
    required this.reservoirSize,
    required this.resourceARN,
    required this.serviceName,
    required this.serviceType,
    required this.uRLPath,
    required this.version,
    this.attributes,
    this.ruleARN,
    this.ruleName,
  });

  factory SamplingRule.fromJson(Map<String, dynamic> json) {
    return SamplingRule(
      fixedRate: json['FixedRate'] as double,
      hTTPMethod: json['HTTPMethod'] as String,
      host: json['Host'] as String,
      priority: json['Priority'] as int,
      reservoirSize: json['ReservoirSize'] as int,
      resourceARN: json['ResourceARN'] as String,
      serviceName: json['ServiceName'] as String,
      serviceType: json['ServiceType'] as String,
      uRLPath: json['URLPath'] as String,
      version: json['Version'] as int,
      attributes: (json['Attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      ruleARN: json['RuleARN'] as String?,
      ruleName: json['RuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fixedRate = this.fixedRate;
    final hTTPMethod = this.hTTPMethod;
    final host = this.host;
    final priority = this.priority;
    final reservoirSize = this.reservoirSize;
    final resourceARN = this.resourceARN;
    final serviceName = this.serviceName;
    final serviceType = this.serviceType;
    final uRLPath = this.uRLPath;
    final version = this.version;
    final attributes = this.attributes;
    final ruleARN = this.ruleARN;
    final ruleName = this.ruleName;
    return {
      'FixedRate': fixedRate,
      'HTTPMethod': hTTPMethod,
      'Host': host,
      'Priority': priority,
      'ReservoirSize': reservoirSize,
      'ResourceARN': resourceARN,
      'ServiceName': serviceName,
      'ServiceType': serviceType,
      'URLPath': uRLPath,
      'Version': version,
      if (attributes != null) 'Attributes': attributes,
      if (ruleARN != null) 'RuleARN': ruleARN,
      if (ruleName != null) 'RuleName': ruleName,
    };
  }
}

/// A <a
/// href="https://docs.aws.amazon.com/xray/latest/api/API_SamplingRule.html">SamplingRule</a>
/// and its metadata.
class SamplingRuleRecord {
  /// When the rule was created.
  final DateTime? createdAt;

  /// When the rule was last modified.
  final DateTime? modifiedAt;

  /// The sampling rule.
  final SamplingRule? samplingRule;

  SamplingRuleRecord({
    this.createdAt,
    this.modifiedAt,
    this.samplingRule,
  });

  factory SamplingRuleRecord.fromJson(Map<String, dynamic> json) {
    return SamplingRuleRecord(
      createdAt: timeStampFromJson(json['CreatedAt']),
      modifiedAt: timeStampFromJson(json['ModifiedAt']),
      samplingRule: json['SamplingRule'] != null
          ? SamplingRule.fromJson(json['SamplingRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final modifiedAt = this.modifiedAt;
    final samplingRule = this.samplingRule;
    return {
      if (createdAt != null) 'CreatedAt': unixTimestampToJson(createdAt),
      if (modifiedAt != null) 'ModifiedAt': unixTimestampToJson(modifiedAt),
      if (samplingRule != null) 'SamplingRule': samplingRule,
    };
  }
}

/// A document specifying changes to a sampling rule's configuration.
class SamplingRuleUpdate {
  /// Matches attributes derived from the request.
  final Map<String, String>? attributes;

  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  final double? fixedRate;

  /// Matches the HTTP method of a request.
  final String? hTTPMethod;

  /// Matches the hostname from a request URL.
  final String? host;

  /// The priority of the sampling rule.
  final int? priority;

  /// A fixed number of matching requests to instrument per second, prior to
  /// applying the fixed rate. The reservoir is not used directly by services, but
  /// applies to all services using the rule collectively.
  final int? reservoirSize;

  /// Matches the ARN of the Amazon Web Services resource on which the service
  /// runs.
  final String? resourceARN;

  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  final String? ruleARN;

  /// The name of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  final String? ruleName;

  /// Matches the <code>name</code> that the service uses to identify itself in
  /// segments.
  final String? serviceName;

  /// Matches the <code>origin</code> that the service uses to identify its type
  /// in segments.
  final String? serviceType;

  /// Matches the path from a request URL.
  final String? uRLPath;

  SamplingRuleUpdate({
    this.attributes,
    this.fixedRate,
    this.hTTPMethod,
    this.host,
    this.priority,
    this.reservoirSize,
    this.resourceARN,
    this.ruleARN,
    this.ruleName,
    this.serviceName,
    this.serviceType,
    this.uRLPath,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final fixedRate = this.fixedRate;
    final hTTPMethod = this.hTTPMethod;
    final host = this.host;
    final priority = this.priority;
    final reservoirSize = this.reservoirSize;
    final resourceARN = this.resourceARN;
    final ruleARN = this.ruleARN;
    final ruleName = this.ruleName;
    final serviceName = this.serviceName;
    final serviceType = this.serviceType;
    final uRLPath = this.uRLPath;
    return {
      if (attributes != null) 'Attributes': attributes,
      if (fixedRate != null) 'FixedRate': fixedRate,
      if (hTTPMethod != null) 'HTTPMethod': hTTPMethod,
      if (host != null) 'Host': host,
      if (priority != null) 'Priority': priority,
      if (reservoirSize != null) 'ReservoirSize': reservoirSize,
      if (resourceARN != null) 'ResourceARN': resourceARN,
      if (ruleARN != null) 'RuleARN': ruleARN,
      if (ruleName != null) 'RuleName': ruleName,
      if (serviceName != null) 'ServiceName': serviceName,
      if (serviceType != null) 'ServiceType': serviceType,
      if (uRLPath != null) 'URLPath': uRLPath,
    };
  }
}

/// Aggregated request sampling data for a sampling rule across all services for
/// a 10-second window.
class SamplingStatisticSummary {
  /// The number of requests recorded with borrowed reservoir quota.
  final int? borrowCount;

  /// The number of requests that matched the rule.
  final int? requestCount;

  /// The name of the sampling rule.
  final String? ruleName;

  /// The number of requests recorded.
  final int? sampledCount;

  /// The start time of the reporting window.
  final DateTime? timestamp;

  SamplingStatisticSummary({
    this.borrowCount,
    this.requestCount,
    this.ruleName,
    this.sampledCount,
    this.timestamp,
  });

  factory SamplingStatisticSummary.fromJson(Map<String, dynamic> json) {
    return SamplingStatisticSummary(
      borrowCount: json['BorrowCount'] as int?,
      requestCount: json['RequestCount'] as int?,
      ruleName: json['RuleName'] as String?,
      sampledCount: json['SampledCount'] as int?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final borrowCount = this.borrowCount;
    final requestCount = this.requestCount;
    final ruleName = this.ruleName;
    final sampledCount = this.sampledCount;
    final timestamp = this.timestamp;
    return {
      if (borrowCount != null) 'BorrowCount': borrowCount,
      if (requestCount != null) 'RequestCount': requestCount,
      if (ruleName != null) 'RuleName': ruleName,
      if (sampledCount != null) 'SampledCount': sampledCount,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// Request sampling results for a single rule from a service. Results are for
/// the last 10 seconds unless the service has been assigned a longer reporting
/// interval after a previous call to <a
/// href="https://docs.aws.amazon.com/xray/latest/api/API_GetSamplingTargets.html">GetSamplingTargets</a>.
class SamplingStatisticsDocument {
  /// A unique identifier for the service in hexadecimal.
  final String clientID;

  /// The number of requests that matched the rule.
  final int requestCount;

  /// The name of the sampling rule.
  final String ruleName;

  /// The number of requests recorded.
  final int sampledCount;

  /// The current time.
  final DateTime timestamp;

  /// The number of requests recorded with borrowed reservoir quota.
  final int? borrowCount;

  SamplingStatisticsDocument({
    required this.clientID,
    required this.requestCount,
    required this.ruleName,
    required this.sampledCount,
    required this.timestamp,
    this.borrowCount,
  });

  Map<String, dynamic> toJson() {
    final clientID = this.clientID;
    final requestCount = this.requestCount;
    final ruleName = this.ruleName;
    final sampledCount = this.sampledCount;
    final timestamp = this.timestamp;
    final borrowCount = this.borrowCount;
    return {
      'ClientID': clientID,
      'RequestCount': requestCount,
      'RuleName': ruleName,
      'SampledCount': sampledCount,
      'Timestamp': unixTimestampToJson(timestamp),
      if (borrowCount != null) 'BorrowCount': borrowCount,
    };
  }
}

/// The name and value of a sampling rule to apply to a trace summary.
class SamplingStrategy {
  /// The name of a sampling rule.
  final SamplingStrategyName? name;

  /// The value of a sampling rule.
  final double? value;

  SamplingStrategy({
    this.name,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      if (name != null) 'Name': name.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum SamplingStrategyName {
  partialScan,
  fixedRate,
}

extension SamplingStrategyNameValueExtension on SamplingStrategyName {
  String toValue() {
    switch (this) {
      case SamplingStrategyName.partialScan:
        return 'PartialScan';
      case SamplingStrategyName.fixedRate:
        return 'FixedRate';
    }
  }
}

extension SamplingStrategyNameFromString on String {
  SamplingStrategyName toSamplingStrategyName() {
    switch (this) {
      case 'PartialScan':
        return SamplingStrategyName.partialScan;
      case 'FixedRate':
        return SamplingStrategyName.fixedRate;
    }
    throw Exception('$this is not known in enum SamplingStrategyName');
  }
}

/// Temporary changes to a sampling rule configuration. To meet the global
/// sampling target for a rule, X-Ray calculates a new reservoir for each
/// service based on the recent sampling results of all services that called <a
/// href="https://docs.aws.amazon.com/xray/latest/api/API_GetSamplingTargets.html">GetSamplingTargets</a>.
class SamplingTargetDocument {
  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  final double? fixedRate;

  /// The number of seconds for the service to wait before getting sampling
  /// targets again.
  final int? interval;

  /// The number of requests per second that X-Ray allocated for this service.
  final int? reservoirQuota;

  /// When the reservoir quota expires.
  final DateTime? reservoirQuotaTTL;

  /// The name of the sampling rule.
  final String? ruleName;

  SamplingTargetDocument({
    this.fixedRate,
    this.interval,
    this.reservoirQuota,
    this.reservoirQuotaTTL,
    this.ruleName,
  });

  factory SamplingTargetDocument.fromJson(Map<String, dynamic> json) {
    return SamplingTargetDocument(
      fixedRate: json['FixedRate'] as double?,
      interval: json['Interval'] as int?,
      reservoirQuota: json['ReservoirQuota'] as int?,
      reservoirQuotaTTL: timeStampFromJson(json['ReservoirQuotaTTL']),
      ruleName: json['RuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fixedRate = this.fixedRate;
    final interval = this.interval;
    final reservoirQuota = this.reservoirQuota;
    final reservoirQuotaTTL = this.reservoirQuotaTTL;
    final ruleName = this.ruleName;
    return {
      if (fixedRate != null) 'FixedRate': fixedRate,
      if (interval != null) 'Interval': interval,
      if (reservoirQuota != null) 'ReservoirQuota': reservoirQuota,
      if (reservoirQuotaTTL != null)
        'ReservoirQuotaTTL': unixTimestampToJson(reservoirQuotaTTL),
      if (ruleName != null) 'RuleName': ruleName,
    };
  }
}

/// A segment from a trace that has been ingested by the X-Ray service. The
/// segment can be compiled from documents uploaded with <a
/// href="https://docs.aws.amazon.com/xray/latest/api/API_PutTraceSegments.html">PutTraceSegments</a>,
/// or an <code>inferred</code> segment for a downstream service, generated from
/// a subsegment sent by the service that called it.
///
/// For the full segment document schema, see <a
/// href="https://docs.aws.amazon.com/xray/latest/devguide/xray-api-segmentdocuments.html">Amazon
/// Web Services X-Ray Segment Documents</a> in the <i>Amazon Web Services X-Ray
/// Developer Guide</i>.
class Segment {
  /// The segment document.
  final String? document;

  /// The segment's ID.
  final String? id;

  Segment({
    this.document,
    this.id,
  });

  factory Segment.fromJson(Map<String, dynamic> json) {
    return Segment(
      document: json['Document'] as String?,
      id: json['Id'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final document = this.document;
    final id = this.id;
    return {
      if (document != null) 'Document': document,
      if (id != null) 'Id': id,
    };
  }
}

/// Information about an application that processed requests, users that made
/// requests, or downstream services, resources, and applications that an
/// application used.
class Service {
  /// Identifier of the Amazon Web Services account in which the service runs.
  final String? accountId;

  /// A histogram that maps the spread of service durations.
  final List<HistogramEntry>? durationHistogram;

  /// Connections to downstream services.
  final List<Edge>? edges;

  /// The end time of the last segment that the service generated.
  final DateTime? endTime;

  /// The canonical name of the service.
  final String? name;

  /// A list of names for the service, including the canonical name.
  final List<String>? names;

  /// Identifier for the service. Unique within the service map.
  final int? referenceId;

  /// A histogram that maps the spread of service response times.
  final List<HistogramEntry>? responseTimeHistogram;

  /// Indicates that the service was the first service to process a request.
  final bool? root;

  /// The start time of the first segment that the service generated.
  final DateTime? startTime;

  /// The service's state.
  final String? state;

  /// Aggregated statistics for the service.
  final ServiceStatistics? summaryStatistics;

  /// The type of service.
  ///
  /// <ul>
  /// <li>
  /// Amazon Web Services Resource - The type of an Amazon Web Services resource.
  /// For example, <code>AWS::EC2::Instance</code> for an application running on
  /// Amazon EC2 or <code>AWS::DynamoDB::Table</code> for an Amazon DynamoDB table
  /// that the application used.
  /// </li>
  /// <li>
  /// Amazon Web Services Service - The type of an Amazon Web Services service.
  /// For example, <code>AWS::DynamoDB</code> for downstream calls to Amazon
  /// DynamoDB that didn't target a specific table.
  /// </li>
  /// <li>
  /// <code>client</code> - Represents the clients that sent requests to a root
  /// service.
  /// </li>
  /// <li>
  /// <code>remote</code> - A downstream service of indeterminate type.
  /// </li>
  /// </ul>
  final String? type;

  Service({
    this.accountId,
    this.durationHistogram,
    this.edges,
    this.endTime,
    this.name,
    this.names,
    this.referenceId,
    this.responseTimeHistogram,
    this.root,
    this.startTime,
    this.state,
    this.summaryStatistics,
    this.type,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      accountId: json['AccountId'] as String?,
      durationHistogram: (json['DurationHistogram'] as List?)
          ?.whereNotNull()
          .map((e) => HistogramEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      edges: (json['Edges'] as List?)
          ?.whereNotNull()
          .map((e) => Edge.fromJson(e as Map<String, dynamic>))
          .toList(),
      endTime: timeStampFromJson(json['EndTime']),
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      referenceId: json['ReferenceId'] as int?,
      responseTimeHistogram: (json['ResponseTimeHistogram'] as List?)
          ?.whereNotNull()
          .map((e) => HistogramEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      root: json['Root'] as bool?,
      startTime: timeStampFromJson(json['StartTime']),
      state: json['State'] as String?,
      summaryStatistics: json['SummaryStatistics'] != null
          ? ServiceStatistics.fromJson(
              json['SummaryStatistics'] as Map<String, dynamic>)
          : null,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final durationHistogram = this.durationHistogram;
    final edges = this.edges;
    final endTime = this.endTime;
    final name = this.name;
    final names = this.names;
    final referenceId = this.referenceId;
    final responseTimeHistogram = this.responseTimeHistogram;
    final root = this.root;
    final startTime = this.startTime;
    final state = this.state;
    final summaryStatistics = this.summaryStatistics;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (durationHistogram != null) 'DurationHistogram': durationHistogram,
      if (edges != null) 'Edges': edges,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (referenceId != null) 'ReferenceId': referenceId,
      if (responseTimeHistogram != null)
        'ResponseTimeHistogram': responseTimeHistogram,
      if (root != null) 'Root': root,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state,
      if (summaryStatistics != null) 'SummaryStatistics': summaryStatistics,
      if (type != null) 'Type': type,
    };
  }
}

/// <p/>
class ServiceId {
  /// <p/>
  final String? accountId;

  /// <p/>
  final String? name;

  /// <p/>
  final List<String>? names;

  /// <p/>
  final String? type;

  ServiceId({
    this.accountId,
    this.name,
    this.names,
    this.type,
  });

  factory ServiceId.fromJson(Map<String, dynamic> json) {
    return ServiceId(
      accountId: json['AccountId'] as String?,
      name: json['Name'] as String?,
      names: (json['Names'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final name = this.name;
    final names = this.names;
    final type = this.type;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (name != null) 'Name': name,
      if (names != null) 'Names': names,
      if (type != null) 'Type': type,
    };
  }
}

/// Response statistics for a service.
class ServiceStatistics {
  /// Information about requests that failed with a 4xx Client Error status code.
  final ErrorStatistics? errorStatistics;

  /// Information about requests that failed with a 5xx Server Error status code.
  final FaultStatistics? faultStatistics;

  /// The number of requests that completed with a 2xx Success status code.
  final int? okCount;

  /// The total number of completed requests.
  final int? totalCount;

  /// The aggregate response time of completed requests.
  final double? totalResponseTime;

  ServiceStatistics({
    this.errorStatistics,
    this.faultStatistics,
    this.okCount,
    this.totalCount,
    this.totalResponseTime,
  });

  factory ServiceStatistics.fromJson(Map<String, dynamic> json) {
    return ServiceStatistics(
      errorStatistics: json['ErrorStatistics'] != null
          ? ErrorStatistics.fromJson(
              json['ErrorStatistics'] as Map<String, dynamic>)
          : null,
      faultStatistics: json['FaultStatistics'] != null
          ? FaultStatistics.fromJson(
              json['FaultStatistics'] as Map<String, dynamic>)
          : null,
      okCount: json['OkCount'] as int?,
      totalCount: json['TotalCount'] as int?,
      totalResponseTime: json['TotalResponseTime'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorStatistics = this.errorStatistics;
    final faultStatistics = this.faultStatistics;
    final okCount = this.okCount;
    final totalCount = this.totalCount;
    final totalResponseTime = this.totalResponseTime;
    return {
      if (errorStatistics != null) 'ErrorStatistics': errorStatistics,
      if (faultStatistics != null) 'FaultStatistics': faultStatistics,
      if (okCount != null) 'OkCount': okCount,
      if (totalCount != null) 'TotalCount': totalCount,
      if (totalResponseTime != null) 'TotalResponseTime': totalResponseTime,
    };
  }
}

/// A map that contains tag keys and tag values to attach to an Amazon Web
/// Services X-Ray group or sampling rule. For more information about ways to
/// use tags, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// Amazon Web Services resources</a> in the <i>Amazon Web Services General
/// Reference</i>.
///
/// The following restrictions apply to tags:
///
/// <ul>
/// <li>
/// Maximum number of user-applied tags per resource: 50
/// </li>
/// <li>
/// Tag keys and values are case sensitive.
/// </li>
/// <li>
/// Don't use <code>aws:</code> as a prefix for keys; it's reserved for Amazon
/// Web Services use. You cannot edit or delete system tags.
/// </li>
/// </ul>
class Tag {
  /// A tag key, such as <code>Stage</code> or <code>Name</code>. A tag key cannot
  /// be empty. The key can be a maximum of 128 characters, and can contain only
  /// Unicode letters, numbers, or separators, or the following special
  /// characters: <code>+ - = . _ : /</code>
  final String key;

  /// An optional tag value, such as <code>Production</code> or
  /// <code>test-only</code>. The value can be a maximum of 255 characters, and
  /// contain only Unicode letters, numbers, or separators, or the following
  /// special characters: <code>+ - = . _ : /</code>
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String,
      value: json['Value'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
    };
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

/// <p/>
class TelemetryRecord {
  /// <p/>
  final DateTime timestamp;

  /// <p/>
  final BackendConnectionErrors? backendConnectionErrors;

  /// <p/>
  final int? segmentsReceivedCount;

  /// <p/>
  final int? segmentsRejectedCount;

  /// <p/>
  final int? segmentsSentCount;

  /// <p/>
  final int? segmentsSpilloverCount;

  TelemetryRecord({
    required this.timestamp,
    this.backendConnectionErrors,
    this.segmentsReceivedCount,
    this.segmentsRejectedCount,
    this.segmentsSentCount,
    this.segmentsSpilloverCount,
  });

  Map<String, dynamic> toJson() {
    final timestamp = this.timestamp;
    final backendConnectionErrors = this.backendConnectionErrors;
    final segmentsReceivedCount = this.segmentsReceivedCount;
    final segmentsRejectedCount = this.segmentsRejectedCount;
    final segmentsSentCount = this.segmentsSentCount;
    final segmentsSpilloverCount = this.segmentsSpilloverCount;
    return {
      'Timestamp': unixTimestampToJson(timestamp),
      if (backendConnectionErrors != null)
        'BackendConnectionErrors': backendConnectionErrors,
      if (segmentsReceivedCount != null)
        'SegmentsReceivedCount': segmentsReceivedCount,
      if (segmentsRejectedCount != null)
        'SegmentsRejectedCount': segmentsRejectedCount,
      if (segmentsSentCount != null) 'SegmentsSentCount': segmentsSentCount,
      if (segmentsSpilloverCount != null)
        'SegmentsSpilloverCount': segmentsSpilloverCount,
    };
  }
}

enum TimeRangeType {
  traceId,
  event,
  service,
}

extension TimeRangeTypeValueExtension on TimeRangeType {
  String toValue() {
    switch (this) {
      case TimeRangeType.traceId:
        return 'TraceId';
      case TimeRangeType.event:
        return 'Event';
      case TimeRangeType.service:
        return 'Service';
    }
  }
}

extension TimeRangeTypeFromString on String {
  TimeRangeType toTimeRangeType() {
    switch (this) {
      case 'TraceId':
        return TimeRangeType.traceId;
      case 'Event':
        return TimeRangeType.event;
      case 'Service':
        return TimeRangeType.service;
    }
    throw Exception('$this is not known in enum TimeRangeType');
  }
}

/// A list of TimeSeriesStatistic structures.
class TimeSeriesServiceStatistics {
  final EdgeStatistics? edgeSummaryStatistics;

  /// The response time histogram for the selected entities.
  final List<HistogramEntry>? responseTimeHistogram;

  /// The forecasted high and low fault count values.
  final ForecastStatistics? serviceForecastStatistics;
  final ServiceStatistics? serviceSummaryStatistics;

  /// Timestamp of the window for which statistics are aggregated.
  final DateTime? timestamp;

  TimeSeriesServiceStatistics({
    this.edgeSummaryStatistics,
    this.responseTimeHistogram,
    this.serviceForecastStatistics,
    this.serviceSummaryStatistics,
    this.timestamp,
  });

  factory TimeSeriesServiceStatistics.fromJson(Map<String, dynamic> json) {
    return TimeSeriesServiceStatistics(
      edgeSummaryStatistics: json['EdgeSummaryStatistics'] != null
          ? EdgeStatistics.fromJson(
              json['EdgeSummaryStatistics'] as Map<String, dynamic>)
          : null,
      responseTimeHistogram: (json['ResponseTimeHistogram'] as List?)
          ?.whereNotNull()
          .map((e) => HistogramEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      serviceForecastStatistics: json['ServiceForecastStatistics'] != null
          ? ForecastStatistics.fromJson(
              json['ServiceForecastStatistics'] as Map<String, dynamic>)
          : null,
      serviceSummaryStatistics: json['ServiceSummaryStatistics'] != null
          ? ServiceStatistics.fromJson(
              json['ServiceSummaryStatistics'] as Map<String, dynamic>)
          : null,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final edgeSummaryStatistics = this.edgeSummaryStatistics;
    final responseTimeHistogram = this.responseTimeHistogram;
    final serviceForecastStatistics = this.serviceForecastStatistics;
    final serviceSummaryStatistics = this.serviceSummaryStatistics;
    final timestamp = this.timestamp;
    return {
      if (edgeSummaryStatistics != null)
        'EdgeSummaryStatistics': edgeSummaryStatistics,
      if (responseTimeHistogram != null)
        'ResponseTimeHistogram': responseTimeHistogram,
      if (serviceForecastStatistics != null)
        'ServiceForecastStatistics': serviceForecastStatistics,
      if (serviceSummaryStatistics != null)
        'ServiceSummaryStatistics': serviceSummaryStatistics,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

/// A collection of segment documents with matching trace IDs.
class Trace {
  /// The length of time in seconds between the start time of the root segment and
  /// the end time of the last segment that completed.
  final double? duration;

  /// The unique identifier for the request that generated the trace's segments
  /// and subsegments.
  final String? id;

  /// LimitExceeded is set to true when the trace has exceeded the <code>Trace
  /// document size</code> limit. For more information about this limit and other
  /// X-Ray limits and quotas, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/xray.html">Amazon Web
  /// Services X-Ray endpoints and quotas</a>.
  final bool? limitExceeded;

  /// Segment documents for the segments and subsegments that comprise the trace.
  final List<Segment>? segments;

  Trace({
    this.duration,
    this.id,
    this.limitExceeded,
    this.segments,
  });

  factory Trace.fromJson(Map<String, dynamic> json) {
    return Trace(
      duration: json['Duration'] as double?,
      id: json['Id'] as String?,
      limitExceeded: json['LimitExceeded'] as bool?,
      segments: (json['Segments'] as List?)
          ?.whereNotNull()
          .map((e) => Segment.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final duration = this.duration;
    final id = this.id;
    final limitExceeded = this.limitExceeded;
    final segments = this.segments;
    return {
      if (duration != null) 'Duration': duration,
      if (id != null) 'Id': id,
      if (limitExceeded != null) 'LimitExceeded': limitExceeded,
      if (segments != null) 'Segments': segments,
    };
  }
}

/// Metadata generated from the segment documents in a trace.
class TraceSummary {
  /// Annotations from the trace's segment documents.
  final Map<String, List<ValueWithServiceIds>>? annotations;

  /// A list of Availability Zones for any zone corresponding to the trace
  /// segments.
  final List<AvailabilityZoneDetail>? availabilityZones;

  /// The length of time in seconds between the start time of the root segment and
  /// the end time of the last segment that completed.
  final double? duration;

  /// The root of a trace.
  final ServiceId? entryPoint;

  /// A collection of ErrorRootCause structures corresponding to the trace
  /// segments.
  final List<ErrorRootCause>? errorRootCauses;

  /// A collection of FaultRootCause structures corresponding to the trace
  /// segments.
  final List<FaultRootCause>? faultRootCauses;

  /// The root segment document has a 400 series error.
  final bool? hasError;

  /// The root segment document has a 500 series error.
  final bool? hasFault;

  /// One or more of the segment documents has a 429 throttling error.
  final bool? hasThrottle;

  /// Information about the HTTP request served by the trace.
  final Http? http;

  /// The unique identifier for the request that generated the trace's segments
  /// and subsegments.
  final String? id;

  /// A list of EC2 instance IDs for any instance corresponding to the trace
  /// segments.
  final List<InstanceIdDetail>? instanceIds;

  /// One or more of the segment documents is in progress.
  final bool? isPartial;

  /// The matched time stamp of a defined event.
  final DateTime? matchedEventTime;

  /// A list of resource ARNs for any resource corresponding to the trace
  /// segments.
  final List<ResourceARNDetail>? resourceARNs;

  /// The length of time in seconds between the start and end times of the root
  /// segment. If the service performs work asynchronously, the response time
  /// measures the time before the response is sent to the user, while the
  /// duration measures the amount of time before the last traced activity
  /// completes.
  final double? responseTime;

  /// A collection of ResponseTimeRootCause structures corresponding to the trace
  /// segments.
  final List<ResponseTimeRootCause>? responseTimeRootCauses;

  /// The revision number of a trace.
  final int? revision;

  /// Service IDs from the trace's segment documents.
  final List<ServiceId>? serviceIds;

  /// The start time of a trace, based on the earliest trace segment start time.
  final DateTime? startTime;

  /// Users from the trace's segment documents.
  final List<TraceUser>? users;

  TraceSummary({
    this.annotations,
    this.availabilityZones,
    this.duration,
    this.entryPoint,
    this.errorRootCauses,
    this.faultRootCauses,
    this.hasError,
    this.hasFault,
    this.hasThrottle,
    this.http,
    this.id,
    this.instanceIds,
    this.isPartial,
    this.matchedEventTime,
    this.resourceARNs,
    this.responseTime,
    this.responseTimeRootCauses,
    this.revision,
    this.serviceIds,
    this.startTime,
    this.users,
  });

  factory TraceSummary.fromJson(Map<String, dynamic> json) {
    return TraceSummary(
      annotations: (json['Annotations'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) =>
                      ValueWithServiceIds.fromJson(e as Map<String, dynamic>))
                  .toList())),
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AvailabilityZoneDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['Duration'] as double?,
      entryPoint: json['EntryPoint'] != null
          ? ServiceId.fromJson(json['EntryPoint'] as Map<String, dynamic>)
          : null,
      errorRootCauses: (json['ErrorRootCauses'] as List?)
          ?.whereNotNull()
          .map((e) => ErrorRootCause.fromJson(e as Map<String, dynamic>))
          .toList(),
      faultRootCauses: (json['FaultRootCauses'] as List?)
          ?.whereNotNull()
          .map((e) => FaultRootCause.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasError: json['HasError'] as bool?,
      hasFault: json['HasFault'] as bool?,
      hasThrottle: json['HasThrottle'] as bool?,
      http: json['Http'] != null
          ? Http.fromJson(json['Http'] as Map<String, dynamic>)
          : null,
      id: json['Id'] as String?,
      instanceIds: (json['InstanceIds'] as List?)
          ?.whereNotNull()
          .map((e) => InstanceIdDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      isPartial: json['IsPartial'] as bool?,
      matchedEventTime: timeStampFromJson(json['MatchedEventTime']),
      resourceARNs: (json['ResourceARNs'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceARNDetail.fromJson(e as Map<String, dynamic>))
          .toList(),
      responseTime: json['ResponseTime'] as double?,
      responseTimeRootCauses: (json['ResponseTimeRootCauses'] as List?)
          ?.whereNotNull()
          .map((e) => ResponseTimeRootCause.fromJson(e as Map<String, dynamic>))
          .toList(),
      revision: json['Revision'] as int?,
      serviceIds: (json['ServiceIds'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceId.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => TraceUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final annotations = this.annotations;
    final availabilityZones = this.availabilityZones;
    final duration = this.duration;
    final entryPoint = this.entryPoint;
    final errorRootCauses = this.errorRootCauses;
    final faultRootCauses = this.faultRootCauses;
    final hasError = this.hasError;
    final hasFault = this.hasFault;
    final hasThrottle = this.hasThrottle;
    final http = this.http;
    final id = this.id;
    final instanceIds = this.instanceIds;
    final isPartial = this.isPartial;
    final matchedEventTime = this.matchedEventTime;
    final resourceARNs = this.resourceARNs;
    final responseTime = this.responseTime;
    final responseTimeRootCauses = this.responseTimeRootCauses;
    final revision = this.revision;
    final serviceIds = this.serviceIds;
    final startTime = this.startTime;
    final users = this.users;
    return {
      if (annotations != null) 'Annotations': annotations,
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (duration != null) 'Duration': duration,
      if (entryPoint != null) 'EntryPoint': entryPoint,
      if (errorRootCauses != null) 'ErrorRootCauses': errorRootCauses,
      if (faultRootCauses != null) 'FaultRootCauses': faultRootCauses,
      if (hasError != null) 'HasError': hasError,
      if (hasFault != null) 'HasFault': hasFault,
      if (hasThrottle != null) 'HasThrottle': hasThrottle,
      if (http != null) 'Http': http,
      if (id != null) 'Id': id,
      if (instanceIds != null) 'InstanceIds': instanceIds,
      if (isPartial != null) 'IsPartial': isPartial,
      if (matchedEventTime != null)
        'MatchedEventTime': unixTimestampToJson(matchedEventTime),
      if (resourceARNs != null) 'ResourceARNs': resourceARNs,
      if (responseTime != null) 'ResponseTime': responseTime,
      if (responseTimeRootCauses != null)
        'ResponseTimeRootCauses': responseTimeRootCauses,
      if (revision != null) 'Revision': revision,
      if (serviceIds != null) 'ServiceIds': serviceIds,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (users != null) 'Users': users,
    };
  }
}

/// Information about a user recorded in segment documents.
class TraceUser {
  /// Services that the user's request hit.
  final List<ServiceId>? serviceIds;

  /// The user's name.
  final String? userName;

  TraceUser({
    this.serviceIds,
    this.userName,
  });

  factory TraceUser.fromJson(Map<String, dynamic> json) {
    return TraceUser(
      serviceIds: (json['ServiceIds'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceId.fromJson(e as Map<String, dynamic>))
          .toList(),
      userName: json['UserName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final serviceIds = this.serviceIds;
    final userName = this.userName;
    return {
      if (serviceIds != null) 'ServiceIds': serviceIds,
      if (userName != null) 'UserName': userName,
    };
  }
}

/// Sampling statistics from a call to <a
/// href="https://docs.aws.amazon.com/xray/latest/api/API_GetSamplingTargets.html">GetSamplingTargets</a>
/// that X-Ray could not process.
class UnprocessedStatistics {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? message;

  /// The name of the sampling rule.
  final String? ruleName;

  UnprocessedStatistics({
    this.errorCode,
    this.message,
    this.ruleName,
  });

  factory UnprocessedStatistics.fromJson(Map<String, dynamic> json) {
    return UnprocessedStatistics(
      errorCode: json['ErrorCode'] as String?,
      message: json['Message'] as String?,
      ruleName: json['RuleName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final message = this.message;
    final ruleName = this.ruleName;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (message != null) 'Message': message,
      if (ruleName != null) 'RuleName': ruleName,
    };
  }
}

/// Information about a segment that failed processing.
class UnprocessedTraceSegment {
  /// The error that caused processing to fail.
  final String? errorCode;

  /// The segment's ID.
  final String? id;

  /// The error message.
  final String? message;

  UnprocessedTraceSegment({
    this.errorCode,
    this.id,
    this.message,
  });

  factory UnprocessedTraceSegment.fromJson(Map<String, dynamic> json) {
    return UnprocessedTraceSegment(
      errorCode: json['ErrorCode'] as String?,
      id: json['Id'] as String?,
      message: json['Message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final id = this.id;
    final message = this.message;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (id != null) 'Id': id,
      if (message != null) 'Message': message,
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

class UpdateGroupResult {
  /// The group that was updated. Contains the name of the group that was updated,
  /// the ARN of the group that was updated, the updated filter expression, and
  /// the updated insight configuration assigned to the group.
  final Group? group;

  UpdateGroupResult({
    this.group,
  });

  factory UpdateGroupResult.fromJson(Map<String, dynamic> json) {
    return UpdateGroupResult(
      group: json['Group'] != null
          ? Group.fromJson(json['Group'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    return {
      if (group != null) 'Group': group,
    };
  }
}

class UpdateSamplingRuleResult {
  /// The updated rule definition and metadata.
  final SamplingRuleRecord? samplingRuleRecord;

  UpdateSamplingRuleResult({
    this.samplingRuleRecord,
  });

  factory UpdateSamplingRuleResult.fromJson(Map<String, dynamic> json) {
    return UpdateSamplingRuleResult(
      samplingRuleRecord: json['SamplingRuleRecord'] != null
          ? SamplingRuleRecord.fromJson(
              json['SamplingRuleRecord'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final samplingRuleRecord = this.samplingRuleRecord;
    return {
      if (samplingRuleRecord != null) 'SamplingRuleRecord': samplingRuleRecord,
    };
  }
}

/// Information about a segment annotation.
class ValueWithServiceIds {
  /// Values of the annotation.
  final AnnotationValue? annotationValue;

  /// Services to which the annotation applies.
  final List<ServiceId>? serviceIds;

  ValueWithServiceIds({
    this.annotationValue,
    this.serviceIds,
  });

  factory ValueWithServiceIds.fromJson(Map<String, dynamic> json) {
    return ValueWithServiceIds(
      annotationValue: json['AnnotationValue'] != null
          ? AnnotationValue.fromJson(
              json['AnnotationValue'] as Map<String, dynamic>)
          : null,
      serviceIds: (json['ServiceIds'] as List?)
          ?.whereNotNull()
          .map((e) => ServiceId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final annotationValue = this.annotationValue;
    final serviceIds = this.serviceIds;
    return {
      if (annotationValue != null) 'AnnotationValue': annotationValue,
      if (serviceIds != null) 'ServiceIds': serviceIds,
    };
  }
}

class InvalidPolicyRevisionIdException extends _s.GenericAwsException {
  InvalidPolicyRevisionIdException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidPolicyRevisionIdException',
            message: message);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String? type, String? message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class LockoutPreventionException extends _s.GenericAwsException {
  LockoutPreventionException({String? type, String? message})
      : super(type: type, code: 'LockoutPreventionException', message: message);
}

class MalformedPolicyDocumentException extends _s.GenericAwsException {
  MalformedPolicyDocumentException({String? type, String? message})
      : super(
            type: type,
            code: 'MalformedPolicyDocumentException',
            message: message);
}

class PolicyCountLimitExceededException extends _s.GenericAwsException {
  PolicyCountLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicyCountLimitExceededException',
            message: message);
}

class PolicySizeLimitExceededException extends _s.GenericAwsException {
  PolicySizeLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'PolicySizeLimitExceededException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class RuleLimitExceededException extends _s.GenericAwsException {
  RuleLimitExceededException({String? type, String? message})
      : super(type: type, code: 'RuleLimitExceededException', message: message);
}

class ThrottledException extends _s.GenericAwsException {
  ThrottledException({String? type, String? message})
      : super(type: type, code: 'ThrottledException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String? type, String? message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidPolicyRevisionIdException': (type, message) =>
      InvalidPolicyRevisionIdException(type: type, message: message),
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'LockoutPreventionException': (type, message) =>
      LockoutPreventionException(type: type, message: message),
  'MalformedPolicyDocumentException': (type, message) =>
      MalformedPolicyDocumentException(type: type, message: message),
  'PolicyCountLimitExceededException': (type, message) =>
      PolicyCountLimitExceededException(type: type, message: message),
  'PolicySizeLimitExceededException': (type, message) =>
      PolicySizeLimitExceededException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'RuleLimitExceededException': (type, message) =>
      RuleLimitExceededException(type: type, message: message),
  'ThrottledException': (type, message) =>
      ThrottledException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
