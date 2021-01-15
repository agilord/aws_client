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

part '2016-04-12.g.dart';

/// AWS X-Ray provides APIs for managing debug traces and retrieving service
/// maps and other data created by processing those traces.
class XRay {
  final _s.RestJsonProtocol _protocol;
  XRay({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'xray',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required List<String> traceIds,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(traceIds, 'traceIds');
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
  /// The NotifcationsEnabled boolean can be set to true to enable insights
  /// notifications for the new group. Notifications may only be enabled on a
  /// group with InsightsEnabled set to true.
  /// </li>
  /// </ul>
  ///
  /// Parameter [tags] :
  /// A map that contains one or more tag keys and tag values to attach to an
  /// X-Ray group. For more information about ways to use tags, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS resources</a> in the <i>AWS General Reference</i>.
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
  /// Don't use <code>aws:</code> as a prefix for keys; it's reserved for AWS
  /// use.
  /// </li>
  /// </ul>
  Future<CreateGroupResult> createGroup({
    @_s.required String groupName,
    String filterExpression,
    InsightsConfiguration insightsConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(groupName, 'groupName');
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
      isRequired: true,
    );
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
  /// Services retrieve rules with <a>GetSamplingRules</a>, and evaluate each
  /// rule in ascending order of <i>priority</i> for each request. If a rule
  /// matches, the service records a trace, borrowing it from the reservoir
  /// size. After 10 seconds, the service reports back to X-Ray with
  /// <a>GetSamplingTargets</a> to get updated versions of each in-use rule. The
  /// updated rule contains a trace quota that the service can use instead of
  /// borrowing from the reservoir.
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
  /// AWS resources</a> in the <i>AWS General Reference</i>.
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
  /// Don't use <code>aws:</code> as a prefix for keys; it's reserved for AWS
  /// use.
  /// </li>
  /// </ul>
  Future<CreateSamplingRuleResult> createSamplingRule({
    @_s.required SamplingRule samplingRule,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(samplingRule, 'samplingRule');
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
    String groupARN,
    String groupName,
  }) async {
    _s.validateStringLength(
      'groupARN',
      groupARN,
      1,
      400,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
    );
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
    return DeleteGroupResult.fromJson(response);
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
    String ruleARN,
    String ruleName,
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
    String groupARN,
    String groupName,
  }) async {
    _s.validateStringLength(
      'groupARN',
      groupARN,
      1,
      400,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
    );
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
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      100,
    );
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
    @_s.required String insightId,
  }) async {
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringPattern(
      'insightId',
      insightId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
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
    @_s.required String insightId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringPattern(
      'insightId',
      insightId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
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
    @_s.required DateTime endTime,
    @_s.required String insightId,
    @_s.required DateTime startTime,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(insightId, 'insightId');
    _s.validateStringPattern(
      'insightId',
      insightId,
      r'''[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
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
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    String groupARN,
    String groupName,
    int maxResults,
    String nextToken,
    List<InsightState> states,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateStringLength(
      'groupARN',
      groupARN,
      1,
      400,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2000,
    );
    final $payload = <String, dynamic>{
      'EndTime': unixTimestampToJson(endTime),
      'StartTime': unixTimestampToJson(startTime),
      if (groupARN != null) 'GroupARN': groupARN,
      if (groupName != null) 'GroupName': groupName,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (states != null)
        'States': states.map((e) => e?.toValue() ?? '').toList(),
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
    String nextToken,
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
    String nextToken,
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
    @_s.required List<SamplingStatisticsDocument> samplingStatisticsDocuments,
  }) async {
    ArgumentError.checkNotNull(
        samplingStatisticsDocuments, 'samplingStatisticsDocuments');
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
  /// href="https://docs.aws.amazon.com/xray/index.html">AWS X-Ray SDK</a>.
  /// Downstream services can be other applications, AWS resources, HTTP web
  /// APIs, or SQL databases.
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
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    String groupARN,
    String groupName,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateStringLength(
      'groupARN',
      groupARN,
      1,
      400,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
    );
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
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    String entitySelectorExpression,
    bool forecastStatistics,
    String groupARN,
    String groupName,
    String nextToken,
    int period,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
    _s.validateStringLength(
      'entitySelectorExpression',
      entitySelectorExpression,
      1,
      500,
    );
    _s.validateStringLength(
      'groupARN',
      groupARN,
      1,
      400,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
    );
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
    @_s.required List<String> traceIds,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(traceIds, 'traceIds');
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
  /// Filter Expressions</a> in the <i>AWS X-Ray Developer Guide</i>.
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
  /// A parameter to indicate whether to query trace summaries by TraceId or
  /// Event time.
  Future<GetTraceSummariesResult> getTraceSummaries({
    @_s.required DateTime endTime,
    @_s.required DateTime startTime,
    String filterExpression,
    String nextToken,
    bool sampling,
    SamplingStrategy samplingStrategy,
    TimeRangeType timeRangeType,
  }) async {
    ArgumentError.checkNotNull(endTime, 'endTime');
    ArgumentError.checkNotNull(startTime, 'startTime');
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

  /// Returns a list of tags that are applied to the specified AWS X-Ray group
  /// or sampling rule.
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
    @_s.required String resourceARN,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
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
  /// An AWS KMS customer master key (CMK) in one of the following formats:
  ///
  /// <ul>
  /// <li>
  /// <b>Alias</b> - The name of the key. For example, <code>alias/MyKey</code>.
  /// </li>
  /// <li>
  /// <b>Key ID</b> - The KMS key ID of the key. For example,
  /// <code>ae4aa6d49-a4d8-9df9-a475-4ff6d7898456</code>. AWS X-Ray does not
  /// support asymmetric CMKs.
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
    @_s.required EncryptionType type,
    String keyId,
  }) async {
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'keyId',
      keyId,
      1,
      3000,
    );
    final $payload = <String, dynamic>{
      'Type': type?.toValue() ?? '',
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

  /// Used by the AWS X-Ray daemon to upload telemetry.
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
    @_s.required List<TelemetryRecord> telemetryRecords,
    String eC2InstanceId,
    String hostname,
    String resourceARN,
  }) async {
    ArgumentError.checkNotNull(telemetryRecords, 'telemetryRecords');
    _s.validateStringLength(
      'eC2InstanceId',
      eC2InstanceId,
      0,
      20,
    );
    _s.validateStringLength(
      'hostname',
      hostname,
      0,
      255,
    );
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      0,
      500,
    );
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
    return PutTelemetryRecordsResult.fromJson(response);
  }

  /// Uploads segment documents to AWS X-Ray. The <a
  /// href="https://docs.aws.amazon.com/xray/index.html">X-Ray SDK</a> generates
  /// segment documents and sends them to the X-Ray daemon, which uploads them
  /// in batches. A segment document can be a completed segment, an in-progress
  /// segment, or an array of subsegments.
  ///
  /// Segments must include the following fields. For the full segment document
  /// schema, see <a
  /// href="https://docs.aws.amazon.com/xray/latest/devguide/xray-api-segmentdocuments.html">AWS
  /// X-Ray Segment Documents</a> in the <i>AWS X-Ray Developer Guide</i>.
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
    @_s.required List<String> traceSegmentDocuments,
  }) async {
    ArgumentError.checkNotNull(traceSegmentDocuments, 'traceSegmentDocuments');
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

  /// Applies tags to an existing AWS X-Ray group or sampling rule.
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
  /// AWS resources</a> in the <i>AWS General Reference</i>.
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
  /// Don't use <code>aws:</code> as a prefix for keys; it's reserved for AWS
  /// use. You cannot edit or delete system tags.
  /// </li>
  /// </ul>
  Future<void> tagResource({
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
    return TagResourceResponse.fromJson(response);
  }

  /// Removes tags from an AWS X-Ray group or sampling rule. You cannot edit or
  /// delete system tags (those with an <code>aws:</code> prefix).
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1011,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
    return UntagResourceResponse.fromJson(response);
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
  /// The NotifcationsEnabled boolean can be set to true to enable insights
  /// notifications for the group. Notifications can only be enabled on a group
  /// with InsightsEnabled set to true.
  /// </li>
  /// </ul>
  Future<UpdateGroupResult> updateGroup({
    String filterExpression,
    String groupARN,
    String groupName,
    InsightsConfiguration insightsConfiguration,
  }) async {
    _s.validateStringLength(
      'groupARN',
      groupARN,
      1,
      400,
    );
    _s.validateStringLength(
      'groupName',
      groupName,
      1,
      32,
    );
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
    @_s.required SamplingRuleUpdate samplingRuleUpdate,
  }) async {
    ArgumentError.checkNotNull(samplingRuleUpdate, 'samplingRuleUpdate');
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Alias {
  /// The canonical name of the alias.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of names for the alias, including the canonical name.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// The type of the alias.
  @_s.JsonKey(name: 'Type')
  final String type;

  Alias({
    this.name,
    this.names,
    this.type,
  });
  factory Alias.fromJson(Map<String, dynamic> json) => _$AliasFromJson(json);
}

/// Value of a segment annotation. Has one of three value types: Number,
/// Boolean, or String.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnnotationValue {
  /// Value for a Boolean annotation.
  @_s.JsonKey(name: 'BooleanValue')
  final bool booleanValue;

  /// Value for a Number annotation.
  @_s.JsonKey(name: 'NumberValue')
  final double numberValue;

  /// Value for a String annotation.
  @_s.JsonKey(name: 'StringValue')
  final String stringValue;

  AnnotationValue({
    this.booleanValue,
    this.numberValue,
    this.stringValue,
  });
  factory AnnotationValue.fromJson(Map<String, dynamic> json) =>
      _$AnnotationValueFromJson(json);
}

/// The service within the service graph that has anomalously high fault rates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AnomalousService {
  @_s.JsonKey(name: 'ServiceId')
  final ServiceId serviceId;

  AnomalousService({
    this.serviceId,
  });
  factory AnomalousService.fromJson(Map<String, dynamic> json) =>
      _$AnomalousServiceFromJson(json);
}

/// A list of Availability Zones corresponding to the segments in a trace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AvailabilityZoneDetail {
  /// The name of a corresponding Availability Zone.
  @_s.JsonKey(name: 'Name')
  final String name;

  AvailabilityZoneDetail({
    this.name,
  });
  factory AvailabilityZoneDetail.fromJson(Map<String, dynamic> json) =>
      _$AvailabilityZoneDetailFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class BackendConnectionErrors {
  /// <p/>
  @_s.JsonKey(name: 'ConnectionRefusedCount')
  final int connectionRefusedCount;

  /// <p/>
  @_s.JsonKey(name: 'HTTPCode4XXCount')
  final int hTTPCode4XXCount;

  /// <p/>
  @_s.JsonKey(name: 'HTTPCode5XXCount')
  final int hTTPCode5XXCount;

  /// <p/>
  @_s.JsonKey(name: 'OtherCount')
  final int otherCount;

  /// <p/>
  @_s.JsonKey(name: 'TimeoutCount')
  final int timeoutCount;

  /// <p/>
  @_s.JsonKey(name: 'UnknownHostCount')
  final int unknownHostCount;

  BackendConnectionErrors({
    this.connectionRefusedCount,
    this.hTTPCode4XXCount,
    this.hTTPCode5XXCount,
    this.otherCount,
    this.timeoutCount,
    this.unknownHostCount,
  });
  Map<String, dynamic> toJson() => _$BackendConnectionErrorsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchGetTracesResult {
  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Full traces for the specified requests.
  @_s.JsonKey(name: 'Traces')
  final List<Trace> traces;

  /// Trace IDs of requests that haven't been processed.
  @_s.JsonKey(name: 'UnprocessedTraceIds')
  final List<String> unprocessedTraceIds;

  BatchGetTracesResult({
    this.nextToken,
    this.traces,
    this.unprocessedTraceIds,
  });
  factory BatchGetTracesResult.fromJson(Map<String, dynamic> json) =>
      _$BatchGetTracesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateGroupResult {
  /// The group that was created. Contains the name of the group that was created,
  /// the Amazon Resource Name (ARN) of the group that was generated based on the
  /// group name, the filter expression, and the insight configuration that was
  /// assigned to the group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  CreateGroupResult({
    this.group,
  });
  factory CreateGroupResult.fromJson(Map<String, dynamic> json) =>
      _$CreateGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSamplingRuleResult {
  /// The saved rule definition and metadata.
  @_s.JsonKey(name: 'SamplingRuleRecord')
  final SamplingRuleRecord samplingRuleRecord;

  CreateSamplingRuleResult({
    this.samplingRuleRecord,
  });
  factory CreateSamplingRuleResult.fromJson(Map<String, dynamic> json) =>
      _$CreateSamplingRuleResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteGroupResult {
  DeleteGroupResult();
  factory DeleteGroupResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSamplingRuleResult {
  /// The deleted rule definition and metadata.
  @_s.JsonKey(name: 'SamplingRuleRecord')
  final SamplingRuleRecord samplingRuleRecord;

  DeleteSamplingRuleResult({
    this.samplingRuleRecord,
  });
  factory DeleteSamplingRuleResult.fromJson(Map<String, dynamic> json) =>
      _$DeleteSamplingRuleResultFromJson(json);
}

/// Information about a connection between two services.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Edge {
  /// Aliases for the edge.
  @_s.JsonKey(name: 'Aliases')
  final List<Alias> aliases;

  /// The end time of the last segment on the edge.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// Identifier of the edge. Unique within a service map.
  @_s.JsonKey(name: 'ReferenceId')
  final int referenceId;

  /// A histogram that maps the spread of client response times on an edge.
  @_s.JsonKey(name: 'ResponseTimeHistogram')
  final List<HistogramEntry> responseTimeHistogram;

  /// The start time of the first segment on the edge.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// Response statistics for segments on the edge.
  @_s.JsonKey(name: 'SummaryStatistics')
  final EdgeStatistics summaryStatistics;

  Edge({
    this.aliases,
    this.endTime,
    this.referenceId,
    this.responseTimeHistogram,
    this.startTime,
    this.summaryStatistics,
  });
  factory Edge.fromJson(Map<String, dynamic> json) => _$EdgeFromJson(json);
}

/// Response statistics for an edge.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EdgeStatistics {
  /// Information about requests that failed with a 4xx Client Error status code.
  @_s.JsonKey(name: 'ErrorStatistics')
  final ErrorStatistics errorStatistics;

  /// Information about requests that failed with a 5xx Server Error status code.
  @_s.JsonKey(name: 'FaultStatistics')
  final FaultStatistics faultStatistics;

  /// The number of requests that completed with a 2xx Success status code.
  @_s.JsonKey(name: 'OkCount')
  final int okCount;

  /// The total number of completed requests.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  /// The aggregate response time of completed requests.
  @_s.JsonKey(name: 'TotalResponseTime')
  final double totalResponseTime;

  EdgeStatistics({
    this.errorStatistics,
    this.faultStatistics,
    this.okCount,
    this.totalCount,
    this.totalResponseTime,
  });
  factory EdgeStatistics.fromJson(Map<String, dynamic> json) =>
      _$EdgeStatisticsFromJson(json);
}

/// A configuration document that specifies encryption configuration settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EncryptionConfig {
  /// The ID of the customer master key (CMK) used for encryption, if applicable.
  @_s.JsonKey(name: 'KeyId')
  final String keyId;

  /// The encryption status. While the status is <code>UPDATING</code>, X-Ray may
  /// encrypt data with a combination of the new and old settings.
  @_s.JsonKey(name: 'Status')
  final EncryptionStatus status;

  /// The type of encryption. Set to <code>KMS</code> for encryption with CMKs.
  /// Set to <code>NONE</code> for default encryption.
  @_s.JsonKey(name: 'Type')
  final EncryptionType type;

  EncryptionConfig({
    this.keyId,
    this.status,
    this.type,
  });
  factory EncryptionConfig.fromJson(Map<String, dynamic> json) =>
      _$EncryptionConfigFromJson(json);
}

enum EncryptionStatus {
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('ACTIVE')
  active,
}

enum EncryptionType {
  @_s.JsonValue('NONE')
  none,
  @_s.JsonValue('KMS')
  kms,
}

extension on EncryptionType {
  String toValue() {
    switch (this) {
      case EncryptionType.none:
        return 'NONE';
      case EncryptionType.kms:
        return 'KMS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The root cause of a trace summary error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorRootCause {
  /// A flag that denotes that the root cause impacts the trace client.
  @_s.JsonKey(name: 'ClientImpacting')
  final bool clientImpacting;

  /// A list of services corresponding to an error. A service identifies a segment
  /// and it contains a name, account ID, type, and inferred flag.
  @_s.JsonKey(name: 'Services')
  final List<ErrorRootCauseService> services;

  ErrorRootCause({
    this.clientImpacting,
    this.services,
  });
  factory ErrorRootCause.fromJson(Map<String, dynamic> json) =>
      _$ErrorRootCauseFromJson(json);
}

/// A collection of segments and corresponding subsegments associated to a trace
/// summary error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorRootCauseEntity {
  /// The types and messages of the exceptions.
  @_s.JsonKey(name: 'Exceptions')
  final List<RootCauseException> exceptions;

  /// The name of the entity.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A flag that denotes a remote subsegment.
  @_s.JsonKey(name: 'Remote')
  final bool remote;

  ErrorRootCauseEntity({
    this.exceptions,
    this.name,
    this.remote,
  });
  factory ErrorRootCauseEntity.fromJson(Map<String, dynamic> json) =>
      _$ErrorRootCauseEntityFromJson(json);
}

/// A collection of fields identifying the services in a trace summary error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorRootCauseService {
  /// The account ID associated to the service.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The path of root cause entities found on the service.
  @_s.JsonKey(name: 'EntityPath')
  final List<ErrorRootCauseEntity> entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  @_s.JsonKey(name: 'Inferred')
  final bool inferred;

  /// The service name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A collection of associated service names.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// The type associated to the service.
  @_s.JsonKey(name: 'Type')
  final String type;

  ErrorRootCauseService({
    this.accountId,
    this.entityPath,
    this.inferred,
    this.name,
    this.names,
    this.type,
  });
  factory ErrorRootCauseService.fromJson(Map<String, dynamic> json) =>
      _$ErrorRootCauseServiceFromJson(json);
}

/// Information about requests that failed with a 4xx Client Error status code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ErrorStatistics {
  /// The number of requests that failed with untracked 4xx Client Error status
  /// codes.
  @_s.JsonKey(name: 'OtherCount')
  final int otherCount;

  /// The number of requests that failed with a 419 throttling status code.
  @_s.JsonKey(name: 'ThrottleCount')
  final int throttleCount;

  /// The total number of requests that failed with a 4xx Client Error status
  /// code.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  ErrorStatistics({
    this.otherCount,
    this.throttleCount,
    this.totalCount,
  });
  factory ErrorStatistics.fromJson(Map<String, dynamic> json) =>
      _$ErrorStatisticsFromJson(json);
}

/// The root cause information for a trace summary fault.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaultRootCause {
  /// A flag that denotes that the root cause impacts the trace client.
  @_s.JsonKey(name: 'ClientImpacting')
  final bool clientImpacting;

  /// A list of corresponding services. A service identifies a segment and it
  /// contains a name, account ID, type, and inferred flag.
  @_s.JsonKey(name: 'Services')
  final List<FaultRootCauseService> services;

  FaultRootCause({
    this.clientImpacting,
    this.services,
  });
  factory FaultRootCause.fromJson(Map<String, dynamic> json) =>
      _$FaultRootCauseFromJson(json);
}

/// A collection of segments and corresponding subsegments associated to a trace
/// summary fault error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaultRootCauseEntity {
  /// The types and messages of the exceptions.
  @_s.JsonKey(name: 'Exceptions')
  final List<RootCauseException> exceptions;

  /// The name of the entity.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A flag that denotes a remote subsegment.
  @_s.JsonKey(name: 'Remote')
  final bool remote;

  FaultRootCauseEntity({
    this.exceptions,
    this.name,
    this.remote,
  });
  factory FaultRootCauseEntity.fromJson(Map<String, dynamic> json) =>
      _$FaultRootCauseEntityFromJson(json);
}

/// A collection of fields identifying the services in a trace summary fault.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaultRootCauseService {
  /// The account ID associated to the service.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The path of root cause entities found on the service.
  @_s.JsonKey(name: 'EntityPath')
  final List<FaultRootCauseEntity> entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  @_s.JsonKey(name: 'Inferred')
  final bool inferred;

  /// The service name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A collection of associated service names.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// The type associated to the service.
  @_s.JsonKey(name: 'Type')
  final String type;

  FaultRootCauseService({
    this.accountId,
    this.entityPath,
    this.inferred,
    this.name,
    this.names,
    this.type,
  });
  factory FaultRootCauseService.fromJson(Map<String, dynamic> json) =>
      _$FaultRootCauseServiceFromJson(json);
}

/// Information about requests that failed with a 5xx Server Error status code.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FaultStatistics {
  /// The number of requests that failed with untracked 5xx Server Error status
  /// codes.
  @_s.JsonKey(name: 'OtherCount')
  final int otherCount;

  /// The total number of requests that failed with a 5xx Server Error status
  /// code.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  FaultStatistics({
    this.otherCount,
    this.totalCount,
  });
  factory FaultStatistics.fromJson(Map<String, dynamic> json) =>
      _$FaultStatisticsFromJson(json);
}

/// The predicted high and low fault count. This is used to determine if a
/// service has become anomalous and if an insight should be created.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ForecastStatistics {
  /// The upper limit of fault counts for a service.
  @_s.JsonKey(name: 'FaultCountHigh')
  final int faultCountHigh;

  /// The lower limit of fault counts for a service.
  @_s.JsonKey(name: 'FaultCountLow')
  final int faultCountLow;

  ForecastStatistics({
    this.faultCountHigh,
    this.faultCountLow,
  });
  factory ForecastStatistics.fromJson(Map<String, dynamic> json) =>
      _$ForecastStatisticsFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEncryptionConfigResult {
  /// The encryption configuration document.
  @_s.JsonKey(name: 'EncryptionConfig')
  final EncryptionConfig encryptionConfig;

  GetEncryptionConfigResult({
    this.encryptionConfig,
  });
  factory GetEncryptionConfigResult.fromJson(Map<String, dynamic> json) =>
      _$GetEncryptionConfigResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupResult {
  /// The group that was requested. Contains the name of the group, the ARN of the
  /// group, the filter expression, and the insight configuration assigned to the
  /// group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  GetGroupResult({
    this.group,
  });
  factory GetGroupResult.fromJson(Map<String, dynamic> json) =>
      _$GetGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGroupsResult {
  /// The collection of all active groups.
  @_s.JsonKey(name: 'Groups')
  final List<GroupSummary> groups;

  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetGroupsResult({
    this.groups,
    this.nextToken,
  });
  factory GetGroupsResult.fromJson(Map<String, dynamic> json) =>
      _$GetGroupsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInsightEventsResult {
  /// A detailed description of the event. This includes the time of the event,
  /// client and root cause impact statistics, and the top anomalous service at
  /// the time of the event.
  @_s.JsonKey(name: 'InsightEvents')
  final List<InsightEvent> insightEvents;

  /// Use this token to retrieve the next page of insight events.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetInsightEventsResult({
    this.insightEvents,
    this.nextToken,
  });
  factory GetInsightEventsResult.fromJson(Map<String, dynamic> json) =>
      _$GetInsightEventsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInsightImpactGraphResult {
  /// The provided end time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The insight's unique identifier.
  @_s.JsonKey(name: 'InsightId')
  final String insightId;

  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The time, in Unix seconds, at which the service graph ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ServiceGraphEndTime')
  final DateTime serviceGraphEndTime;

  /// The time, in Unix seconds, at which the service graph started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ServiceGraphStartTime')
  final DateTime serviceGraphStartTime;

  /// The AWS instrumented services related to the insight.
  @_s.JsonKey(name: 'Services')
  final List<InsightImpactGraphService> services;

  /// The provided start time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  GetInsightImpactGraphResult({
    this.endTime,
    this.insightId,
    this.nextToken,
    this.serviceGraphEndTime,
    this.serviceGraphStartTime,
    this.services,
    this.startTime,
  });
  factory GetInsightImpactGraphResult.fromJson(Map<String, dynamic> json) =>
      _$GetInsightImpactGraphResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInsightResult {
  /// The summary information of an insight.
  @_s.JsonKey(name: 'Insight')
  final Insight insight;

  GetInsightResult({
    this.insight,
  });
  factory GetInsightResult.fromJson(Map<String, dynamic> json) =>
      _$GetInsightResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetInsightSummariesResult {
  /// The summary of each insight within the group matching the provided filters.
  /// The summary contains the InsightID, start and end time, the root cause
  /// service, the root cause and client impact statistics, the top anomalous
  /// services, and the status of the insight.
  @_s.JsonKey(name: 'InsightSummaries')
  final List<InsightSummary> insightSummaries;

  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  GetInsightSummariesResult({
    this.insightSummaries,
    this.nextToken,
  });
  factory GetInsightSummariesResult.fromJson(Map<String, dynamic> json) =>
      _$GetInsightSummariesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSamplingRulesResult {
  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Rule definitions and metadata.
  @_s.JsonKey(name: 'SamplingRuleRecords')
  final List<SamplingRuleRecord> samplingRuleRecords;

  GetSamplingRulesResult({
    this.nextToken,
    this.samplingRuleRecords,
  });
  factory GetSamplingRulesResult.fromJson(Map<String, dynamic> json) =>
      _$GetSamplingRulesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSamplingStatisticSummariesResult {
  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Information about the number of requests instrumented for each sampling
  /// rule.
  @_s.JsonKey(name: 'SamplingStatisticSummaries')
  final List<SamplingStatisticSummary> samplingStatisticSummaries;

  GetSamplingStatisticSummariesResult({
    this.nextToken,
    this.samplingStatisticSummaries,
  });
  factory GetSamplingStatisticSummariesResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetSamplingStatisticSummariesResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSamplingTargetsResult {
  /// The last time a user changed the sampling rule configuration. If the
  /// sampling rule configuration changed since the service last retrieved it, the
  /// service should call <a>GetSamplingRules</a> to get the latest version.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastRuleModification')
  final DateTime lastRuleModification;

  /// Updated rules that the service should use to sample requests.
  @_s.JsonKey(name: 'SamplingTargetDocuments')
  final List<SamplingTargetDocument> samplingTargetDocuments;

  /// Information about <a>SamplingStatisticsDocument</a> that X-Ray could not
  /// process.
  @_s.JsonKey(name: 'UnprocessedStatistics')
  final List<UnprocessedStatistics> unprocessedStatistics;

  GetSamplingTargetsResult({
    this.lastRuleModification,
    this.samplingTargetDocuments,
    this.unprocessedStatistics,
  });
  factory GetSamplingTargetsResult.fromJson(Map<String, dynamic> json) =>
      _$GetSamplingTargetsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServiceGraphResult {
  /// A flag indicating whether the group's filter expression has been consistent,
  /// or if the returned service graph may show traces from an older version of
  /// the group's filter expression.
  @_s.JsonKey(name: 'ContainsOldGroupVersions')
  final bool containsOldGroupVersions;

  /// The end of the time frame for which the graph was generated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The services that have processed a traced request during the specified time
  /// frame.
  @_s.JsonKey(name: 'Services')
  final List<Service> services;

  /// The start of the time frame for which the graph was generated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  GetServiceGraphResult({
    this.containsOldGroupVersions,
    this.endTime,
    this.nextToken,
    this.services,
    this.startTime,
  });
  factory GetServiceGraphResult.fromJson(Map<String, dynamic> json) =>
      _$GetServiceGraphResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTimeSeriesServiceStatisticsResult {
  /// A flag indicating whether or not a group's filter expression has been
  /// consistent, or if a returned aggregation might show statistics from an older
  /// version of the group's filter expression.
  @_s.JsonKey(name: 'ContainsOldGroupVersions')
  final bool containsOldGroupVersions;

  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The collection of statistics.
  @_s.JsonKey(name: 'TimeSeriesServiceStatistics')
  final List<TimeSeriesServiceStatistics> timeSeriesServiceStatistics;

  GetTimeSeriesServiceStatisticsResult({
    this.containsOldGroupVersions,
    this.nextToken,
    this.timeSeriesServiceStatistics,
  });
  factory GetTimeSeriesServiceStatisticsResult.fromJson(
          Map<String, dynamic> json) =>
      _$GetTimeSeriesServiceStatisticsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTraceGraphResult {
  /// Pagination token.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The services that have processed one of the specified requests.
  @_s.JsonKey(name: 'Services')
  final List<Service> services;

  GetTraceGraphResult({
    this.nextToken,
    this.services,
  });
  factory GetTraceGraphResult.fromJson(Map<String, dynamic> json) =>
      _$GetTraceGraphResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetTraceSummariesResult {
  /// The start time of this page of results.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ApproximateTime')
  final DateTime approximateTime;

  /// If the requested time frame contained more than one page of results, you can
  /// use this token to retrieve the next page. The first page contains the most
  /// recent results, closest to the end of the time frame.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// Trace IDs and annotations for traces that were found in the specified time
  /// frame.
  @_s.JsonKey(name: 'TraceSummaries')
  final List<TraceSummary> traceSummaries;

  /// The total number of traces processed, including traces that did not match
  /// the specified filter expression.
  @_s.JsonKey(name: 'TracesProcessedCount')
  final int tracesProcessedCount;

  GetTraceSummariesResult({
    this.approximateTime,
    this.nextToken,
    this.traceSummaries,
    this.tracesProcessedCount,
  });
  factory GetTraceSummariesResult.fromJson(Map<String, dynamic> json) =>
      _$GetTraceSummariesResultFromJson(json);
}

/// Details and metadata for a group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Group {
  /// The filter expression defining the parameters to include traces.
  @_s.JsonKey(name: 'FilterExpression')
  final String filterExpression;

  /// The Amazon Resource Name (ARN) of the group generated based on the
  /// GroupName.
  @_s.JsonKey(name: 'GroupARN')
  final String groupARN;

  /// The unique case-sensitive name of the group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The structure containing configurations related to insights.
  ///
  /// <ul>
  /// <li>
  /// The InsightsEnabled boolean can be set to true to enable insights for the
  /// group or false to disable insights for the group.
  /// </li>
  /// <li>
  /// The NotifcationsEnabled boolean can be set to true to enable insights
  /// notifications through Amazon EventBridge for the group.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'InsightsConfiguration')
  final InsightsConfiguration insightsConfiguration;

  Group({
    this.filterExpression,
    this.groupARN,
    this.groupName,
    this.insightsConfiguration,
  });
  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

/// Details for a group without metadata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GroupSummary {
  /// The filter expression defining the parameters to include traces.
  @_s.JsonKey(name: 'FilterExpression')
  final String filterExpression;

  /// The ARN of the group generated based on the GroupName.
  @_s.JsonKey(name: 'GroupARN')
  final String groupARN;

  /// The unique case-sensitive name of the group.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

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
  @_s.JsonKey(name: 'InsightsConfiguration')
  final InsightsConfiguration insightsConfiguration;

  GroupSummary({
    this.filterExpression,
    this.groupARN,
    this.groupName,
    this.insightsConfiguration,
  });
  factory GroupSummary.fromJson(Map<String, dynamic> json) =>
      _$GroupSummaryFromJson(json);
}

/// An entry in a histogram for a statistic. A histogram maps the range of
/// observed values on the X axis, and the prevalence of each value on the Y
/// axis.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class HistogramEntry {
  /// The prevalence of the entry.
  @_s.JsonKey(name: 'Count')
  final int count;

  /// The value of the entry.
  @_s.JsonKey(name: 'Value')
  final double value;

  HistogramEntry({
    this.count,
    this.value,
  });
  factory HistogramEntry.fromJson(Map<String, dynamic> json) =>
      _$HistogramEntryFromJson(json);
}

/// Information about an HTTP request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Http {
  /// The IP address of the requestor.
  @_s.JsonKey(name: 'ClientIp')
  final String clientIp;

  /// The request method.
  @_s.JsonKey(name: 'HttpMethod')
  final String httpMethod;

  /// The response status.
  @_s.JsonKey(name: 'HttpStatus')
  final int httpStatus;

  /// The request URL.
  @_s.JsonKey(name: 'HttpURL')
  final String httpURL;

  /// The request's user agent string.
  @_s.JsonKey(name: 'UserAgent')
  final String userAgent;

  Http({
    this.clientIp,
    this.httpMethod,
    this.httpStatus,
    this.httpURL,
    this.userAgent,
  });
  factory Http.fromJson(Map<String, dynamic> json) => _$HttpFromJson(json);
}

/// When fault rates go outside of the expected range, X-Ray creates an insight.
/// Insights tracks emergent issues within your applications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Insight {
  /// The categories that label and describe the type of insight.
  @_s.JsonKey(name: 'Categories')
  final List<InsightCategory> categories;

  /// The impact statistics of the client side service. This includes the number
  /// of requests to the client service and whether the requests were faults or
  /// okay.
  @_s.JsonKey(name: 'ClientRequestImpactStatistics')
  final RequestImpactStatistics clientRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The Amazon Resource Name (ARN) of the group that the insight belongs to.
  @_s.JsonKey(name: 'GroupARN')
  final String groupARN;

  /// The name of the group that the insight belongs to.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The insights unique identifier.
  @_s.JsonKey(name: 'InsightId')
  final String insightId;
  @_s.JsonKey(name: 'RootCauseServiceId')
  final ServiceId rootCauseServiceId;

  /// The impact statistics of the root cause service. This includes the number of
  /// requests to the client service and whether the requests were faults or okay.
  @_s.JsonKey(name: 'RootCauseServiceRequestImpactStatistics')
  final RequestImpactStatistics rootCauseServiceRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight began.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The current state of the insight.
  @_s.JsonKey(name: 'State')
  final InsightState state;

  /// A brief description of the insight.
  @_s.JsonKey(name: 'Summary')
  final String summary;

  /// The service within the insight that is most impacted by the incident.
  @_s.JsonKey(name: 'TopAnomalousServices')
  final List<AnomalousService> topAnomalousServices;

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
  factory Insight.fromJson(Map<String, dynamic> json) =>
      _$InsightFromJson(json);
}

enum InsightCategory {
  @_s.JsonValue('FAULT')
  fault,
}

/// X-Ray reevaluates insights periodically until they are resolved, and records
/// each intermediate state in an event. You can review incident events in the
/// Impact Timeline on the Inspect page in the X-Ray console.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightEvent {
  /// The impact statistics of the client side service. This includes the number
  /// of requests to the client service and whether the requests were faults or
  /// okay.
  @_s.JsonKey(name: 'ClientRequestImpactStatistics')
  final RequestImpactStatistics clientRequestImpactStatistics;

  /// The time, in Unix seconds, at which the event was recorded.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EventTime')
  final DateTime eventTime;

  /// The impact statistics of the root cause service. This includes the number of
  /// requests to the client service and whether the requests were faults or okay.
  @_s.JsonKey(name: 'RootCauseServiceRequestImpactStatistics')
  final RequestImpactStatistics rootCauseServiceRequestImpactStatistics;

  /// A brief description of the event.
  @_s.JsonKey(name: 'Summary')
  final String summary;

  /// The service during the event that is most impacted by the incident.
  @_s.JsonKey(name: 'TopAnomalousServices')
  final List<AnomalousService> topAnomalousServices;

  InsightEvent({
    this.clientRequestImpactStatistics,
    this.eventTime,
    this.rootCauseServiceRequestImpactStatistics,
    this.summary,
    this.topAnomalousServices,
  });
  factory InsightEvent.fromJson(Map<String, dynamic> json) =>
      _$InsightEventFromJson(json);
}

/// The connection between two service in an insight impact graph.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightImpactGraphEdge {
  /// Identifier of the edge. Unique within a service map.
  @_s.JsonKey(name: 'ReferenceId')
  final int referenceId;

  InsightImpactGraphEdge({
    this.referenceId,
  });
  factory InsightImpactGraphEdge.fromJson(Map<String, dynamic> json) =>
      _$InsightImpactGraphEdgeFromJson(json);
}

/// Information about an application that processed requests, users that made
/// requests, or downstream services, resources, and applications that an
/// application used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightImpactGraphService {
  /// Identifier of the AWS account in which the service runs.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// Connections to downstream services.
  @_s.JsonKey(name: 'Edges')
  final List<InsightImpactGraphEdge> edges;

  /// The canonical name of the service.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of names for the service, including the canonical name.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// Identifier for the service. Unique within the service map.
  @_s.JsonKey(name: 'ReferenceId')
  final int referenceId;

  /// Identifier for the service. Unique within the service map.
  ///
  /// <ul>
  /// <li>
  /// AWS Resource - The type of an AWS resource. For example, AWS::EC2::Instance
  /// for an application running on Amazon EC2 or AWS::DynamoDB::Table for an
  /// Amazon DynamoDB table that the application used.
  /// </li>
  /// <li>
  /// AWS Service - The type of an AWS service. For example, AWS::DynamoDB for
  /// downstream calls to Amazon DynamoDB that didn't target a specific table.
  /// </li>
  /// <li>
  /// AWS Service - The type of an AWS service. For example, AWS::DynamoDB for
  /// downstream calls to Amazon DynamoDB that didn't target a specific table.
  /// </li>
  /// <li>
  /// remote - A downstream service of indeterminate type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final String type;

  InsightImpactGraphService({
    this.accountId,
    this.edges,
    this.name,
    this.names,
    this.referenceId,
    this.type,
  });
  factory InsightImpactGraphService.fromJson(Map<String, dynamic> json) =>
      _$InsightImpactGraphServiceFromJson(json);
}

enum InsightState {
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('CLOSED')
  closed,
}

extension on InsightState {
  String toValue() {
    switch (this) {
      case InsightState.active:
        return 'ACTIVE';
      case InsightState.closed:
        return 'CLOSED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information that describes an insight.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InsightSummary {
  /// Categories The categories that label and describe the type of insight.
  @_s.JsonKey(name: 'Categories')
  final List<InsightCategory> categories;

  /// The impact statistics of the client side service. This includes the number
  /// of requests to the client service and whether the requests were faults or
  /// okay.
  @_s.JsonKey(name: 'ClientRequestImpactStatistics')
  final RequestImpactStatistics clientRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight ended.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The Amazon Resource Name (ARN) of the group that the insight belongs to.
  @_s.JsonKey(name: 'GroupARN')
  final String groupARN;

  /// The name of the group that the insight belongs to.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  /// The insights unique identifier.
  @_s.JsonKey(name: 'InsightId')
  final String insightId;

  /// The time, in Unix seconds, that the insight was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdateTime')
  final DateTime lastUpdateTime;
  @_s.JsonKey(name: 'RootCauseServiceId')
  final ServiceId rootCauseServiceId;

  /// The impact statistics of the root cause service. This includes the number of
  /// requests to the client service and whether the requests were faults or okay.
  @_s.JsonKey(name: 'RootCauseServiceRequestImpactStatistics')
  final RequestImpactStatistics rootCauseServiceRequestImpactStatistics;

  /// The time, in Unix seconds, at which the insight began.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The current state of the insight.
  @_s.JsonKey(name: 'State')
  final InsightState state;

  /// A brief description of the insight.
  @_s.JsonKey(name: 'Summary')
  final String summary;

  /// The service within the insight that is most impacted by the incident.
  @_s.JsonKey(name: 'TopAnomalousServices')
  final List<AnomalousService> topAnomalousServices;

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
  factory InsightSummary.fromJson(Map<String, dynamic> json) =>
      _$InsightSummaryFromJson(json);
}

/// The structure containing configurations related to insights.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class InsightsConfiguration {
  /// Set the InsightsEnabled value to true to enable insights or false to disable
  /// insights.
  @_s.JsonKey(name: 'InsightsEnabled')
  final bool insightsEnabled;

  /// Set the NotificationsEnabled value to true to enable insights notifications.
  /// Notifications can only be enabled on a group with InsightsEnabled set to
  /// true.
  @_s.JsonKey(name: 'NotificationsEnabled')
  final bool notificationsEnabled;

  InsightsConfiguration({
    this.insightsEnabled,
    this.notificationsEnabled,
  });
  factory InsightsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$InsightsConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$InsightsConfigurationToJson(this);
}

/// A list of EC2 instance IDs corresponding to the segments in a trace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InstanceIdDetail {
  /// The ID of a corresponding EC2 instance.
  @_s.JsonKey(name: 'Id')
  final String id;

  InstanceIdDetail({
    this.id,
  });
  factory InstanceIdDetail.fromJson(Map<String, dynamic> json) =>
      _$InstanceIdDetailFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A pagination token. If multiple pages of results are returned, use the
  /// <code>NextToken</code> value returned with the current page of results to
  /// get the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// A list of tags, as key and value pairs, that is associated with the
  /// specified X-Ray group or sampling rule.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.nextToken,
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEncryptionConfigResult {
  /// The new encryption configuration.
  @_s.JsonKey(name: 'EncryptionConfig')
  final EncryptionConfig encryptionConfig;

  PutEncryptionConfigResult({
    this.encryptionConfig,
  });
  factory PutEncryptionConfigResult.fromJson(Map<String, dynamic> json) =>
      _$PutEncryptionConfigResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutTelemetryRecordsResult {
  PutTelemetryRecordsResult();
  factory PutTelemetryRecordsResult.fromJson(Map<String, dynamic> json) =>
      _$PutTelemetryRecordsResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutTraceSegmentsResult {
  /// Segments that failed processing.
  @_s.JsonKey(name: 'UnprocessedTraceSegments')
  final List<UnprocessedTraceSegment> unprocessedTraceSegments;

  PutTraceSegmentsResult({
    this.unprocessedTraceSegments,
  });
  factory PutTraceSegmentsResult.fromJson(Map<String, dynamic> json) =>
      _$PutTraceSegmentsResultFromJson(json);
}

/// Statistics that describe how the incident has impacted a service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RequestImpactStatistics {
  /// The number of requests that have resulted in a fault,
  @_s.JsonKey(name: 'FaultCount')
  final int faultCount;

  /// The number of successful requests.
  @_s.JsonKey(name: 'OkCount')
  final int okCount;

  /// The total number of requests to the service.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  RequestImpactStatistics({
    this.faultCount,
    this.okCount,
    this.totalCount,
  });
  factory RequestImpactStatistics.fromJson(Map<String, dynamic> json) =>
      _$RequestImpactStatisticsFromJson(json);
}

/// A list of resources ARNs corresponding to the segments in a trace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceARNDetail {
  /// The ARN of a corresponding resource.
  @_s.JsonKey(name: 'ARN')
  final String arn;

  ResourceARNDetail({
    this.arn,
  });
  factory ResourceARNDetail.fromJson(Map<String, dynamic> json) =>
      _$ResourceARNDetailFromJson(json);
}

/// The root cause information for a response time warning.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResponseTimeRootCause {
  /// A flag that denotes that the root cause impacts the trace client.
  @_s.JsonKey(name: 'ClientImpacting')
  final bool clientImpacting;

  /// A list of corresponding services. A service identifies a segment and
  /// contains a name, account ID, type, and inferred flag.
  @_s.JsonKey(name: 'Services')
  final List<ResponseTimeRootCauseService> services;

  ResponseTimeRootCause({
    this.clientImpacting,
    this.services,
  });
  factory ResponseTimeRootCause.fromJson(Map<String, dynamic> json) =>
      _$ResponseTimeRootCauseFromJson(json);
}

/// A collection of segments and corresponding subsegments associated to a
/// response time warning.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResponseTimeRootCauseEntity {
  /// The type and messages of the exceptions.
  @_s.JsonKey(name: 'Coverage')
  final double coverage;

  /// The name of the entity.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A flag that denotes a remote subsegment.
  @_s.JsonKey(name: 'Remote')
  final bool remote;

  ResponseTimeRootCauseEntity({
    this.coverage,
    this.name,
    this.remote,
  });
  factory ResponseTimeRootCauseEntity.fromJson(Map<String, dynamic> json) =>
      _$ResponseTimeRootCauseEntityFromJson(json);
}

/// A collection of fields identifying the service in a response time warning.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResponseTimeRootCauseService {
  /// The account ID associated to the service.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The path of root cause entities found on the service.
  @_s.JsonKey(name: 'EntityPath')
  final List<ResponseTimeRootCauseEntity> entityPath;

  /// A Boolean value indicating if the service is inferred from the trace.
  @_s.JsonKey(name: 'Inferred')
  final bool inferred;

  /// The service name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A collection of associated service names.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// The type associated to the service.
  @_s.JsonKey(name: 'Type')
  final String type;

  ResponseTimeRootCauseService({
    this.accountId,
    this.entityPath,
    this.inferred,
    this.name,
    this.names,
    this.type,
  });
  factory ResponseTimeRootCauseService.fromJson(Map<String, dynamic> json) =>
      _$ResponseTimeRootCauseServiceFromJson(json);
}

/// The exception associated with a root cause.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RootCauseException {
  /// The message of the exception.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The name of the exception.
  @_s.JsonKey(name: 'Name')
  final String name;

  RootCauseException({
    this.message,
    this.name,
  });
  factory RootCauseException.fromJson(Map<String, dynamic> json) =>
      _$RootCauseExceptionFromJson(json);
}

/// A sampling rule that services use to decide whether to instrument a request.
/// Rule fields can match properties of the service, or properties of a request.
/// The service can ignore rules that don't match its properties.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SamplingRule {
  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  @_s.JsonKey(name: 'FixedRate')
  final double fixedRate;

  /// Matches the HTTP method of a request.
  @_s.JsonKey(name: 'HTTPMethod')
  final String hTTPMethod;

  /// Matches the hostname from a request URL.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// The priority of the sampling rule.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// A fixed number of matching requests to instrument per second, prior to
  /// applying the fixed rate. The reservoir is not used directly by services, but
  /// applies to all services using the rule collectively.
  @_s.JsonKey(name: 'ReservoirSize')
  final int reservoirSize;

  /// Matches the ARN of the AWS resource on which the service runs.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// Matches the <code>name</code> that the service uses to identify itself in
  /// segments.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// Matches the <code>origin</code> that the service uses to identify its type
  /// in segments.
  @_s.JsonKey(name: 'ServiceType')
  final String serviceType;

  /// Matches the path from a request URL.
  @_s.JsonKey(name: 'URLPath')
  final String uRLPath;

  /// The version of the sampling rule format (<code>1</code>).
  @_s.JsonKey(name: 'Version')
  final int version;

  /// Matches attributes derived from the request.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  @_s.JsonKey(name: 'RuleARN')
  final String ruleARN;

  /// The name of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  SamplingRule({
    @_s.required this.fixedRate,
    @_s.required this.hTTPMethod,
    @_s.required this.host,
    @_s.required this.priority,
    @_s.required this.reservoirSize,
    @_s.required this.resourceARN,
    @_s.required this.serviceName,
    @_s.required this.serviceType,
    @_s.required this.uRLPath,
    @_s.required this.version,
    this.attributes,
    this.ruleARN,
    this.ruleName,
  });
  factory SamplingRule.fromJson(Map<String, dynamic> json) =>
      _$SamplingRuleFromJson(json);

  Map<String, dynamic> toJson() => _$SamplingRuleToJson(this);
}

/// A <a>SamplingRule</a> and its metadata.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SamplingRuleRecord {
  /// When the rule was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedAt')
  final DateTime createdAt;

  /// When the rule was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ModifiedAt')
  final DateTime modifiedAt;

  /// The sampling rule.
  @_s.JsonKey(name: 'SamplingRule')
  final SamplingRule samplingRule;

  SamplingRuleRecord({
    this.createdAt,
    this.modifiedAt,
    this.samplingRule,
  });
  factory SamplingRuleRecord.fromJson(Map<String, dynamic> json) =>
      _$SamplingRuleRecordFromJson(json);
}

/// A document specifying changes to a sampling rule's configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SamplingRuleUpdate {
  /// Matches attributes derived from the request.
  @_s.JsonKey(name: 'Attributes')
  final Map<String, String> attributes;

  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  @_s.JsonKey(name: 'FixedRate')
  final double fixedRate;

  /// Matches the HTTP method of a request.
  @_s.JsonKey(name: 'HTTPMethod')
  final String hTTPMethod;

  /// Matches the hostname from a request URL.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// The priority of the sampling rule.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// A fixed number of matching requests to instrument per second, prior to
  /// applying the fixed rate. The reservoir is not used directly by services, but
  /// applies to all services using the rule collectively.
  @_s.JsonKey(name: 'ReservoirSize')
  final int reservoirSize;

  /// Matches the ARN of the AWS resource on which the service runs.
  @_s.JsonKey(name: 'ResourceARN')
  final String resourceARN;

  /// The ARN of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  @_s.JsonKey(name: 'RuleARN')
  final String ruleARN;

  /// The name of the sampling rule. Specify a rule by either name or ARN, but not
  /// both.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  /// Matches the <code>name</code> that the service uses to identify itself in
  /// segments.
  @_s.JsonKey(name: 'ServiceName')
  final String serviceName;

  /// Matches the <code>origin</code> that the service uses to identify its type
  /// in segments.
  @_s.JsonKey(name: 'ServiceType')
  final String serviceType;

  /// Matches the path from a request URL.
  @_s.JsonKey(name: 'URLPath')
  final String uRLPath;

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
  Map<String, dynamic> toJson() => _$SamplingRuleUpdateToJson(this);
}

/// Aggregated request sampling data for a sampling rule across all services for
/// a 10-second window.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SamplingStatisticSummary {
  /// The number of requests recorded with borrowed reservoir quota.
  @_s.JsonKey(name: 'BorrowCount')
  final int borrowCount;

  /// The number of requests that matched the rule.
  @_s.JsonKey(name: 'RequestCount')
  final int requestCount;

  /// The name of the sampling rule.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  /// The number of requests recorded.
  @_s.JsonKey(name: 'SampledCount')
  final int sampledCount;

  /// The start time of the reporting window.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  SamplingStatisticSummary({
    this.borrowCount,
    this.requestCount,
    this.ruleName,
    this.sampledCount,
    this.timestamp,
  });
  factory SamplingStatisticSummary.fromJson(Map<String, dynamic> json) =>
      _$SamplingStatisticSummaryFromJson(json);
}

/// Request sampling results for a single rule from a service. Results are for
/// the last 10 seconds unless the service has been assigned a longer reporting
/// interval after a previous call to <a>GetSamplingTargets</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SamplingStatisticsDocument {
  /// A unique identifier for the service in hexadecimal.
  @_s.JsonKey(name: 'ClientID')
  final String clientID;

  /// The number of requests that matched the rule.
  @_s.JsonKey(name: 'RequestCount')
  final int requestCount;

  /// The name of the sampling rule.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  /// The number of requests recorded.
  @_s.JsonKey(name: 'SampledCount')
  final int sampledCount;

  /// The current time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// The number of requests recorded with borrowed reservoir quota.
  @_s.JsonKey(name: 'BorrowCount')
  final int borrowCount;

  SamplingStatisticsDocument({
    @_s.required this.clientID,
    @_s.required this.requestCount,
    @_s.required this.ruleName,
    @_s.required this.sampledCount,
    @_s.required this.timestamp,
    this.borrowCount,
  });
  Map<String, dynamic> toJson() => _$SamplingStatisticsDocumentToJson(this);
}

/// The name and value of a sampling rule to apply to a trace summary.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SamplingStrategy {
  /// The name of a sampling rule.
  @_s.JsonKey(name: 'Name')
  final SamplingStrategyName name;

  /// The value of a sampling rule.
  @_s.JsonKey(name: 'Value')
  final double value;

  SamplingStrategy({
    this.name,
    this.value,
  });
  Map<String, dynamic> toJson() => _$SamplingStrategyToJson(this);
}

enum SamplingStrategyName {
  @_s.JsonValue('PartialScan')
  partialScan,
  @_s.JsonValue('FixedRate')
  fixedRate,
}

/// Temporary changes to a sampling rule configuration. To meet the global
/// sampling target for a rule, X-Ray calculates a new reservoir for each
/// service based on the recent sampling results of all services that called
/// <a>GetSamplingTargets</a>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SamplingTargetDocument {
  /// The percentage of matching requests to instrument, after the reservoir is
  /// exhausted.
  @_s.JsonKey(name: 'FixedRate')
  final double fixedRate;

  /// The number of seconds for the service to wait before getting sampling
  /// targets again.
  @_s.JsonKey(name: 'Interval')
  final int interval;

  /// The number of requests per second that X-Ray allocated for this service.
  @_s.JsonKey(name: 'ReservoirQuota')
  final int reservoirQuota;

  /// When the reservoir quota expires.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReservoirQuotaTTL')
  final DateTime reservoirQuotaTTL;

  /// The name of the sampling rule.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  SamplingTargetDocument({
    this.fixedRate,
    this.interval,
    this.reservoirQuota,
    this.reservoirQuotaTTL,
    this.ruleName,
  });
  factory SamplingTargetDocument.fromJson(Map<String, dynamic> json) =>
      _$SamplingTargetDocumentFromJson(json);
}

/// A segment from a trace that has been ingested by the X-Ray service. The
/// segment can be compiled from documents uploaded with
/// <a>PutTraceSegments</a>, or an <code>inferred</code> segment for a
/// downstream service, generated from a subsegment sent by the service that
/// called it.
///
/// For the full segment document schema, see <a
/// href="https://docs.aws.amazon.com/xray/latest/devguide/xray-api-segmentdocuments.html">AWS
/// X-Ray Segment Documents</a> in the <i>AWS X-Ray Developer Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Segment {
  /// The segment document.
  @_s.JsonKey(name: 'Document')
  final String document;

  /// The segment's ID.
  @_s.JsonKey(name: 'Id')
  final String id;

  Segment({
    this.document,
    this.id,
  });
  factory Segment.fromJson(Map<String, dynamic> json) =>
      _$SegmentFromJson(json);
}

/// Information about an application that processed requests, users that made
/// requests, or downstream services, resources, and applications that an
/// application used.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Service {
  /// Identifier of the AWS account in which the service runs.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// A histogram that maps the spread of service durations.
  @_s.JsonKey(name: 'DurationHistogram')
  final List<HistogramEntry> durationHistogram;

  /// Connections to downstream services.
  @_s.JsonKey(name: 'Edges')
  final List<Edge> edges;

  /// The end time of the last segment that the service generated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'EndTime')
  final DateTime endTime;

  /// The canonical name of the service.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// A list of names for the service, including the canonical name.
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// Identifier for the service. Unique within the service map.
  @_s.JsonKey(name: 'ReferenceId')
  final int referenceId;

  /// A histogram that maps the spread of service response times.
  @_s.JsonKey(name: 'ResponseTimeHistogram')
  final List<HistogramEntry> responseTimeHistogram;

  /// Indicates that the service was the first service to process a request.
  @_s.JsonKey(name: 'Root')
  final bool root;

  /// The start time of the first segment that the service generated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'StartTime')
  final DateTime startTime;

  /// The service's state.
  @_s.JsonKey(name: 'State')
  final String state;

  /// Aggregated statistics for the service.
  @_s.JsonKey(name: 'SummaryStatistics')
  final ServiceStatistics summaryStatistics;

  /// The type of service.
  ///
  /// <ul>
  /// <li>
  /// AWS Resource - The type of an AWS resource. For example,
  /// <code>AWS::EC2::Instance</code> for an application running on Amazon EC2 or
  /// <code>AWS::DynamoDB::Table</code> for an Amazon DynamoDB table that the
  /// application used.
  /// </li>
  /// <li>
  /// AWS Service - The type of an AWS service. For example,
  /// <code>AWS::DynamoDB</code> for downstream calls to Amazon DynamoDB that
  /// didn't target a specific table.
  /// </li>
  /// <li>
  /// <code>client</code> - Represents the clients that sent requests to a root
  /// service.
  /// </li>
  /// <li>
  /// <code>remote</code> - A downstream service of indeterminate type.
  /// </li>
  /// </ul>
  @_s.JsonKey(name: 'Type')
  final String type;

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
  factory Service.fromJson(Map<String, dynamic> json) =>
      _$ServiceFromJson(json);
}

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceId {
  /// <p/>
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// <p/>
  @_s.JsonKey(name: 'Name')
  final String name;

  /// <p/>
  @_s.JsonKey(name: 'Names')
  final List<String> names;

  /// <p/>
  @_s.JsonKey(name: 'Type')
  final String type;

  ServiceId({
    this.accountId,
    this.name,
    this.names,
    this.type,
  });
  factory ServiceId.fromJson(Map<String, dynamic> json) =>
      _$ServiceIdFromJson(json);
}

/// Response statistics for a service.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceStatistics {
  /// Information about requests that failed with a 4xx Client Error status code.
  @_s.JsonKey(name: 'ErrorStatistics')
  final ErrorStatistics errorStatistics;

  /// Information about requests that failed with a 5xx Server Error status code.
  @_s.JsonKey(name: 'FaultStatistics')
  final FaultStatistics faultStatistics;

  /// The number of requests that completed with a 2xx Success status code.
  @_s.JsonKey(name: 'OkCount')
  final int okCount;

  /// The total number of completed requests.
  @_s.JsonKey(name: 'TotalCount')
  final int totalCount;

  /// The aggregate response time of completed requests.
  @_s.JsonKey(name: 'TotalResponseTime')
  final double totalResponseTime;

  ServiceStatistics({
    this.errorStatistics,
    this.faultStatistics,
    this.okCount,
    this.totalCount,
    this.totalResponseTime,
  });
  factory ServiceStatistics.fromJson(Map<String, dynamic> json) =>
      _$ServiceStatisticsFromJson(json);
}

/// A map that contains tag keys and tag values to attach to an AWS X-Ray group
/// or sampling rule. For more information about ways to use tags, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// AWS resources</a> in the <i>AWS General Reference</i>.
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
/// Don't use <code>aws:</code> as a prefix for keys; it's reserved for AWS use.
/// You cannot edit or delete system tags.
/// </li>
/// </ul>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// A tag key, such as <code>Stage</code> or <code>Name</code>. A tag key cannot
  /// be empty. The key can be a maximum of 128 characters, and can contain only
  /// Unicode letters, numbers, or separators, or the following special
  /// characters: <code>+ - = . _ : /</code>
  @_s.JsonKey(name: 'Key')
  final String key;

  /// An optional tag value, such as <code>Production</code> or
  /// <code>test-only</code>. The value can be a maximum of 255 characters, and
  /// contain only Unicode letters, numbers, or separators, or the following
  /// special characters: <code>+ - = . _ : /</code>
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
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

/// <p/>
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TelemetryRecord {
  /// <p/>
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  /// <p/>
  @_s.JsonKey(name: 'BackendConnectionErrors')
  final BackendConnectionErrors backendConnectionErrors;

  /// <p/>
  @_s.JsonKey(name: 'SegmentsReceivedCount')
  final int segmentsReceivedCount;

  /// <p/>
  @_s.JsonKey(name: 'SegmentsRejectedCount')
  final int segmentsRejectedCount;

  /// <p/>
  @_s.JsonKey(name: 'SegmentsSentCount')
  final int segmentsSentCount;

  /// <p/>
  @_s.JsonKey(name: 'SegmentsSpilloverCount')
  final int segmentsSpilloverCount;

  TelemetryRecord({
    @_s.required this.timestamp,
    this.backendConnectionErrors,
    this.segmentsReceivedCount,
    this.segmentsRejectedCount,
    this.segmentsSentCount,
    this.segmentsSpilloverCount,
  });
  Map<String, dynamic> toJson() => _$TelemetryRecordToJson(this);
}

enum TimeRangeType {
  @_s.JsonValue('TraceId')
  traceId,
  @_s.JsonValue('Event')
  event,
}

extension on TimeRangeType {
  String toValue() {
    switch (this) {
      case TimeRangeType.traceId:
        return 'TraceId';
      case TimeRangeType.event:
        return 'Event';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A list of TimeSeriesStatistic structures.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TimeSeriesServiceStatistics {
  @_s.JsonKey(name: 'EdgeSummaryStatistics')
  final EdgeStatistics edgeSummaryStatistics;

  /// The response time histogram for the selected entities.
  @_s.JsonKey(name: 'ResponseTimeHistogram')
  final List<HistogramEntry> responseTimeHistogram;

  /// The forecasted high and low fault count values.
  @_s.JsonKey(name: 'ServiceForecastStatistics')
  final ForecastStatistics serviceForecastStatistics;
  @_s.JsonKey(name: 'ServiceSummaryStatistics')
  final ServiceStatistics serviceSummaryStatistics;

  /// Timestamp of the window for which statistics are aggregated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
  final DateTime timestamp;

  TimeSeriesServiceStatistics({
    this.edgeSummaryStatistics,
    this.responseTimeHistogram,
    this.serviceForecastStatistics,
    this.serviceSummaryStatistics,
    this.timestamp,
  });
  factory TimeSeriesServiceStatistics.fromJson(Map<String, dynamic> json) =>
      _$TimeSeriesServiceStatisticsFromJson(json);
}

/// A collection of segment documents with matching trace IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Trace {
  /// The length of time in seconds between the start time of the root segment and
  /// the end time of the last segment that completed.
  @_s.JsonKey(name: 'Duration')
  final double duration;

  /// The unique identifier for the request that generated the trace's segments
  /// and subsegments.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// LimitExceeded is set to true when the trace has exceeded one of the defined
  /// quotas. For more information about quotas, see <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/xray.html">AWS X-Ray
  /// endpoints and quotas</a>.
  @_s.JsonKey(name: 'LimitExceeded')
  final bool limitExceeded;

  /// Segment documents for the segments and subsegments that comprise the trace.
  @_s.JsonKey(name: 'Segments')
  final List<Segment> segments;

  Trace({
    this.duration,
    this.id,
    this.limitExceeded,
    this.segments,
  });
  factory Trace.fromJson(Map<String, dynamic> json) => _$TraceFromJson(json);
}

/// Metadata generated from the segment documents in a trace.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TraceSummary {
  /// Annotations from the trace's segment documents.
  @_s.JsonKey(name: 'Annotations')
  final Map<String, List<ValueWithServiceIds>> annotations;

  /// A list of Availability Zones for any zone corresponding to the trace
  /// segments.
  @_s.JsonKey(name: 'AvailabilityZones')
  final List<AvailabilityZoneDetail> availabilityZones;

  /// The length of time in seconds between the start time of the root segment and
  /// the end time of the last segment that completed.
  @_s.JsonKey(name: 'Duration')
  final double duration;

  /// The root of a trace.
  @_s.JsonKey(name: 'EntryPoint')
  final ServiceId entryPoint;

  /// A collection of ErrorRootCause structures corresponding to the trace
  /// segments.
  @_s.JsonKey(name: 'ErrorRootCauses')
  final List<ErrorRootCause> errorRootCauses;

  /// A collection of FaultRootCause structures corresponding to the trace
  /// segments.
  @_s.JsonKey(name: 'FaultRootCauses')
  final List<FaultRootCause> faultRootCauses;

  /// The root segment document has a 400 series error.
  @_s.JsonKey(name: 'HasError')
  final bool hasError;

  /// The root segment document has a 500 series error.
  @_s.JsonKey(name: 'HasFault')
  final bool hasFault;

  /// One or more of the segment documents has a 429 throttling error.
  @_s.JsonKey(name: 'HasThrottle')
  final bool hasThrottle;

  /// Information about the HTTP request served by the trace.
  @_s.JsonKey(name: 'Http')
  final Http http;

  /// The unique identifier for the request that generated the trace's segments
  /// and subsegments.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// A list of EC2 instance IDs for any instance corresponding to the trace
  /// segments.
  @_s.JsonKey(name: 'InstanceIds')
  final List<InstanceIdDetail> instanceIds;

  /// One or more of the segment documents is in progress.
  @_s.JsonKey(name: 'IsPartial')
  final bool isPartial;

  /// The matched time stamp of a defined event.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'MatchedEventTime')
  final DateTime matchedEventTime;

  /// A list of resource ARNs for any resource corresponding to the trace
  /// segments.
  @_s.JsonKey(name: 'ResourceARNs')
  final List<ResourceARNDetail> resourceARNs;

  /// The length of time in seconds between the start and end times of the root
  /// segment. If the service performs work asynchronously, the response time
  /// measures the time before the response is sent to the user, while the
  /// duration measures the amount of time before the last traced activity
  /// completes.
  @_s.JsonKey(name: 'ResponseTime')
  final double responseTime;

  /// A collection of ResponseTimeRootCause structures corresponding to the trace
  /// segments.
  @_s.JsonKey(name: 'ResponseTimeRootCauses')
  final List<ResponseTimeRootCause> responseTimeRootCauses;

  /// The revision number of a trace.
  @_s.JsonKey(name: 'Revision')
  final int revision;

  /// Service IDs from the trace's segment documents.
  @_s.JsonKey(name: 'ServiceIds')
  final List<ServiceId> serviceIds;

  /// Users from the trace's segment documents.
  @_s.JsonKey(name: 'Users')
  final List<TraceUser> users;

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
    this.users,
  });
  factory TraceSummary.fromJson(Map<String, dynamic> json) =>
      _$TraceSummaryFromJson(json);
}

/// Information about a user recorded in segment documents.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TraceUser {
  /// Services that the user's request hit.
  @_s.JsonKey(name: 'ServiceIds')
  final List<ServiceId> serviceIds;

  /// The user's name.
  @_s.JsonKey(name: 'UserName')
  final String userName;

  TraceUser({
    this.serviceIds,
    this.userName,
  });
  factory TraceUser.fromJson(Map<String, dynamic> json) =>
      _$TraceUserFromJson(json);
}

/// Sampling statistics from a call to <a>GetSamplingTargets</a> that X-Ray
/// could not process.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedStatistics {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  /// The name of the sampling rule.
  @_s.JsonKey(name: 'RuleName')
  final String ruleName;

  UnprocessedStatistics({
    this.errorCode,
    this.message,
    this.ruleName,
  });
  factory UnprocessedStatistics.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedStatisticsFromJson(json);
}

/// Information about a segment that failed processing.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UnprocessedTraceSegment {
  /// The error that caused processing to fail.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The segment's ID.
  @_s.JsonKey(name: 'Id')
  final String id;

  /// The error message.
  @_s.JsonKey(name: 'Message')
  final String message;

  UnprocessedTraceSegment({
    this.errorCode,
    this.id,
    this.message,
  });
  factory UnprocessedTraceSegment.fromJson(Map<String, dynamic> json) =>
      _$UnprocessedTraceSegmentFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateGroupResult {
  /// The group that was updated. Contains the name of the group that was updated,
  /// the ARN of the group that was updated, the updated filter expression, and
  /// the updated insight configuration assigned to the group.
  @_s.JsonKey(name: 'Group')
  final Group group;

  UpdateGroupResult({
    this.group,
  });
  factory UpdateGroupResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateGroupResultFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSamplingRuleResult {
  /// The updated rule definition and metadata.
  @_s.JsonKey(name: 'SamplingRuleRecord')
  final SamplingRuleRecord samplingRuleRecord;

  UpdateSamplingRuleResult({
    this.samplingRuleRecord,
  });
  factory UpdateSamplingRuleResult.fromJson(Map<String, dynamic> json) =>
      _$UpdateSamplingRuleResultFromJson(json);
}

/// Information about a segment annotation.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValueWithServiceIds {
  /// Values of the annotation.
  @_s.JsonKey(name: 'AnnotationValue')
  final AnnotationValue annotationValue;

  /// Services to which the annotation applies.
  @_s.JsonKey(name: 'ServiceIds')
  final List<ServiceId> serviceIds;

  ValueWithServiceIds({
    this.annotationValue,
    this.serviceIds,
  });
  factory ValueWithServiceIds.fromJson(Map<String, dynamic> json) =>
      _$ValueWithServiceIdsFromJson(json);
}

class InvalidRequestException extends _s.GenericAwsException {
  InvalidRequestException({String type, String message})
      : super(type: type, code: 'InvalidRequestException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class RuleLimitExceededException extends _s.GenericAwsException {
  RuleLimitExceededException({String type, String message})
      : super(type: type, code: 'RuleLimitExceededException', message: message);
}

class ThrottledException extends _s.GenericAwsException {
  ThrottledException({String type, String message})
      : super(type: type, code: 'ThrottledException', message: message);
}

class TooManyTagsException extends _s.GenericAwsException {
  TooManyTagsException({String type, String message})
      : super(type: type, code: 'TooManyTagsException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'InvalidRequestException': (type, message) =>
      InvalidRequestException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'RuleLimitExceededException': (type, message) =>
      RuleLimitExceededException(type: type, message: message),
  'ThrottledException': (type, message) =>
      ThrottledException(type: type, message: message),
  'TooManyTagsException': (type, message) =>
      TooManyTagsException(type: type, message: message),
};
