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

import 'v2018_04_23.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// Use the AWS Elemental MediaTailor SDKs and CLI to configure scalable ad
/// insertion and linear channels. With MediaTailor, you can assemble existing
/// content into a linear stream and serve targeted ads to viewers while
/// maintaining broadcast quality in over-the-top (OTT) video applications. For
/// information about using the service, including detailed information about
/// the settings covered in this guide, see the <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/">AWS Elemental
/// MediaTailor User Guide</a>.
///
/// Through the SDKs and the CLI you manage AWS Elemental MediaTailor
/// configurations and channels the same as you do through the console. For
/// example, you specify ad insertion behavior and mapping information for the
/// origin server and the ad decision server (ADS).
class MediaTailor {
  final _s.RestJsonProtocol _protocol;
  factory MediaTailor({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'api.mediatailor',
      signingName: 'mediatailor',
    );
    return MediaTailor._(
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
  MediaTailor._({
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

  /// Defines where AWS Elemental MediaTailor sends logs for the playback
  /// configuration.
  ///
  /// Parameter [percentEnabled] :
  /// The percentage of session logs that MediaTailor sends to your CloudWatch
  /// Logs account. For example, if your playback configuration has 1000
  /// sessions and percentEnabled is set to <code>60</code>, MediaTailor sends
  /// logs for 600 of the sessions to CloudWatch Logs. MediaTailor decides at
  /// random which of the playback configuration sessions to send logs for. If
  /// you want to view logs for a specific session, you can use the <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/debug-log-mode.html">debug
  /// log mode</a>.
  ///
  /// Valid values: <code>0</code> - <code>100</code>
  ///
  /// Parameter [playbackConfigurationName] :
  /// The name of the playback configuration.
  ///
  /// Parameter [adsInteractionLog] :
  /// The event types that MediaTailor emits in logs for interactions with the
  /// ADS.
  ///
  /// Parameter [enabledLoggingStrategies] :
  /// The method used for collecting logs from AWS Elemental MediaTailor. To
  /// configure MediaTailor to send logs directly to Amazon CloudWatch Logs,
  /// choose <code>LEGACY_CLOUDWATCH</code>. To configure MediaTailor to send
  /// logs to CloudWatch, which then vends the logs to your destination of
  /// choice, choose <code>VENDED_LOGS</code>. Supported destinations are
  /// CloudWatch Logs log group, Amazon S3 bucket, and Amazon Data Firehose
  /// stream.
  ///
  /// To use vended logs, you must configure the delivery destination in Amazon
  /// CloudWatch, as described in <a
  /// href="https://docs.aws.amazon.com/AmazonCloudWatch/latest/logs/AWS-logs-and-resource-policy.html#AWS-vended-logs-permissions-V2">Enable
  /// logging from AWS services, Logging that requires additional permissions
  /// \[V2\]</a>.
  ///
  /// Parameter [manifestServiceInteractionLog] :
  /// The event types that MediaTailor emits in logs for interactions with the
  /// origin server.
  Future<ConfigureLogsForPlaybackConfigurationResponse>
      configureLogsForPlaybackConfiguration({
    required int percentEnabled,
    required String playbackConfigurationName,
    AdsInteractionLog? adsInteractionLog,
    List<LoggingStrategy>? enabledLoggingStrategies,
    ManifestServiceInteractionLog? manifestServiceInteractionLog,
  }) async {
    final $payload = <String, dynamic>{
      'PercentEnabled': percentEnabled,
      'PlaybackConfigurationName': playbackConfigurationName,
      if (adsInteractionLog != null) 'AdsInteractionLog': adsInteractionLog,
      if (enabledLoggingStrategies != null)
        'EnabledLoggingStrategies':
            enabledLoggingStrategies.map((e) => e.value).toList(),
      if (manifestServiceInteractionLog != null)
        'ManifestServiceInteractionLog': manifestServiceInteractionLog,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/configureLogs/playbackConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigureLogsForPlaybackConfigurationResponse.fromJson(response);
  }

  /// Lists the alerts that are associated with a MediaTailor channel assembly
  /// resource.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of alerts that you want MediaTailor to return in
  /// response to the current request. If there are more than
  /// <code>MaxResults</code> alerts, use the value of <code>NextToken</code> in
  /// the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListAlerts</code> request, omit this value. For
  /// subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  Future<ListAlertsResponse> listAlerts({
    required String resourceArn,
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
      'resourceArn': [resourceArn],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/alerts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAlertsResponse.fromJson(response);
  }

  /// A list of tags that are associated with this resource. Tags are key-value
  /// pairs that you can associate with Amazon resources to help with
  /// organization, access control, and cost tracking. For more information, see
  /// <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with this resource.
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

  /// The resource to tag. Tags are key-value pairs that you can associate with
  /// Amazon resources to help with organization, access control, and cost
  /// tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) associated with the resource.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the resource. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The resource to untag.
  ///
  /// May throw [BadRequestException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource to untag.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys associated with the resource.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a channel. For information about MediaTailor channels, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
  /// with channels</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  ///
  /// Parameter [outputs] :
  /// The channel's output properties.
  ///
  /// Parameter [playbackMode] :
  /// The type of playback mode to use for this channel.
  ///
  /// <code>LINEAR</code> - The programs in the schedule play once back-to-back
  /// in the schedule.
  ///
  /// <code>LOOP</code> - The programs in the schedule play back-to-back in an
  /// endless loop. When the last program in the schedule stops playing,
  /// playback loops back to the first program in the schedule.
  ///
  /// Parameter [audiences] :
  /// The list of audiences defined in channel.
  ///
  /// Parameter [fillerSlate] :
  /// The slate used to fill gaps between programs in the schedule. You must
  /// configure filler slate if your channel uses the <code>LINEAR</code>
  /// <code>PlaybackMode</code>. MediaTailor doesn't support filler slate for
  /// channels using the <code>LOOP</code> <code>PlaybackMode</code>.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the channel. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  ///
  /// Parameter [tier] :
  /// The tier of the channel.
  ///
  /// Parameter [timeShiftConfiguration] :
  /// The time-shifted viewing configuration you want to associate to the
  /// channel.
  Future<CreateChannelResponse> createChannel({
    required String channelName,
    required List<RequestOutputItem> outputs,
    required PlaybackMode playbackMode,
    List<String>? audiences,
    SlateSource? fillerSlate,
    Map<String, String>? tags,
    Tier? tier,
    TimeShiftConfiguration? timeShiftConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'Outputs': outputs,
      'PlaybackMode': playbackMode.value,
      if (audiences != null) 'Audiences': audiences,
      if (fillerSlate != null) 'FillerSlate': fillerSlate,
      if (tags != null) 'tags': tags,
      if (tier != null) 'Tier': tier.value,
      if (timeShiftConfiguration != null)
        'TimeShiftConfiguration': timeShiftConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Describes a channel. For information about MediaTailor channels, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
  /// with channels</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  Future<DescribeChannelResponse> describeChannel({
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelResponse.fromJson(response);
  }

  /// Updates a channel. For information about MediaTailor channels, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
  /// with channels</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  ///
  /// Parameter [outputs] :
  /// The channel's output properties.
  ///
  /// Parameter [audiences] :
  /// The list of audiences defined in channel.
  ///
  /// Parameter [fillerSlate] :
  /// The slate used to fill gaps between programs in the schedule. You must
  /// configure filler slate if your channel uses the <code>LINEAR</code>
  /// <code>PlaybackMode</code>. MediaTailor doesn't support filler slate for
  /// channels using the <code>LOOP</code> <code>PlaybackMode</code>.
  ///
  /// Parameter [timeShiftConfiguration] :
  /// The time-shifted viewing configuration you want to associate to the
  /// channel.
  Future<UpdateChannelResponse> updateChannel({
    required String channelName,
    required List<RequestOutputItem> outputs,
    List<String>? audiences,
    SlateSource? fillerSlate,
    TimeShiftConfiguration? timeShiftConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'Outputs': outputs,
      if (audiences != null) 'Audiences': audiences,
      if (fillerSlate != null) 'FillerSlate': fillerSlate,
      if (timeShiftConfiguration != null)
        'TimeShiftConfiguration': timeShiftConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Deletes a channel. For information about MediaTailor channels, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
  /// with channels</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  Future<void> deleteChannel({
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves information about the channels that are associated with the
  /// current AWS account.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels that you want MediaTailor to return in
  /// response to the current request. If there are more than
  /// <code>MaxResults</code> channels, use the value of <code>NextToken</code>
  /// in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListChannels</code> request, omit this value. For
  /// subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  Future<ListChannelsResponse> listChannels({
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
      requestUri: '/channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Configures Amazon CloudWatch log settings for a channel.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  ///
  /// Parameter [logTypes] :
  /// The types of logs to collect.
  Future<ConfigureLogsForChannelResponse> configureLogsForChannel({
    required String channelName,
    required List<LogType> logTypes,
  }) async {
    final $payload = <String, dynamic>{
      'ChannelName': channelName,
      'LogTypes': logTypes.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/configureLogs/channel',
      exceptionFnMap: _exceptionFns,
    );
    return ConfigureLogsForChannelResponse.fromJson(response);
  }

  /// Retrieves information about your channel's schedule.
  ///
  /// Parameter [channelName] :
  /// The name of the channel associated with this Channel Schedule.
  ///
  /// Parameter [audience] :
  /// The single audience for GetChannelScheduleRequest.
  ///
  /// Parameter [durationMinutes] :
  /// The duration in minutes of the channel schedule.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channel schedules that you want MediaTailor to
  /// return in response to the current request. If there are more than
  /// <code>MaxResults</code> channel schedules, use the value of
  /// <code>NextToken</code> in the response to get the next page of results.
  ///
  /// Parameter [nextToken] :
  /// (Optional) If the playback configuration has more than
  /// <code>MaxResults</code> channel schedules, use <code>NextToken</code> to
  /// get the second and subsequent pages of results.
  ///
  /// For the first <code>GetChannelScheduleRequest</code> request, omit this
  /// value.
  ///
  /// For the second and subsequent requests, get the value of
  /// <code>NextToken</code> from the previous response and specify that value
  /// for <code>NextToken</code> in the request.
  ///
  /// If the previous response didn't include a <code>NextToken</code> element,
  /// there are no more channel schedules to get.
  Future<GetChannelScheduleResponse> getChannelSchedule({
    required String channelName,
    String? audience,
    String? durationMinutes,
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
      if (audience != null) 'audience': [audience],
      if (durationMinutes != null) 'durationMinutes': [durationMinutes],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}/schedule',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelScheduleResponse.fromJson(response);
  }

  /// Starts a channel. For information about MediaTailor channels, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
  /// with channels</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  Future<void> startChannel({
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops a channel. For information about MediaTailor channels, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
  /// with channels</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  Future<void> stopChannel({
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates an IAM policy for the channel. IAM policies are used to control
  /// access to your channel.
  ///
  /// Parameter [channelName] :
  /// The channel name associated with this Channel Policy.
  ///
  /// Parameter [policy] :
  /// Adds an IAM role that determines the permissions of your channel.
  Future<void> putChannelPolicy({
    required String channelName,
    required String policy,
  }) async {
    final $payload = <String, dynamic>{
      'Policy': policy,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the channel's IAM policy. IAM policies are used to control access
  /// to your channel.
  ///
  /// Parameter [channelName] :
  /// The name of the channel associated with this Channel Policy.
  Future<GetChannelPolicyResponse> getChannelPolicy({
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelPolicyResponse.fromJson(response);
  }

  /// The channel policy to delete.
  ///
  /// Parameter [channelName] :
  /// The name of the channel associated with this channel policy.
  Future<void> deleteChannelPolicy({
    required String channelName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channel/${Uri.encodeComponent(channelName)}/policy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a program within a channel. For information about programs, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-programs.html">Working
  /// with programs</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel for this Program.
  ///
  /// Parameter [programName] :
  /// The name of the Program.
  ///
  /// Parameter [scheduleConfiguration] :
  /// The schedule configuration settings.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location.
  ///
  /// Parameter [adBreaks] :
  /// The ad break configuration settings.
  ///
  /// Parameter [audienceMedia] :
  /// The list of AudienceMedia defined in program.
  ///
  /// Parameter [liveSourceName] :
  /// The name of the LiveSource for this Program.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the program. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  ///
  /// Parameter [vodSourceName] :
  /// The name that's used to refer to a VOD source.
  Future<CreateProgramResponse> createProgram({
    required String channelName,
    required String programName,
    required ScheduleConfiguration scheduleConfiguration,
    required String sourceLocationName,
    List<AdBreak>? adBreaks,
    List<AudienceMedia>? audienceMedia,
    String? liveSourceName,
    Map<String, String>? tags,
    String? vodSourceName,
  }) async {
    final $payload = <String, dynamic>{
      'ScheduleConfiguration': scheduleConfiguration,
      'SourceLocationName': sourceLocationName,
      if (adBreaks != null) 'AdBreaks': adBreaks,
      if (audienceMedia != null) 'AudienceMedia': audienceMedia,
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channel/${Uri.encodeComponent(channelName)}/program/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProgramResponse.fromJson(response);
  }

  /// Describes a program within a channel. For information about programs, see
  /// <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-programs.html">Working
  /// with programs</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel associated with this Program.
  ///
  /// Parameter [programName] :
  /// The name of the program.
  Future<DescribeProgramResponse> describeProgram({
    required String channelName,
    required String programName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channel/${Uri.encodeComponent(channelName)}/program/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeProgramResponse.fromJson(response);
  }

  /// Updates a program within a channel.
  ///
  /// Parameter [channelName] :
  /// The name of the channel for this Program.
  ///
  /// Parameter [programName] :
  /// The name of the Program.
  ///
  /// Parameter [scheduleConfiguration] :
  /// The schedule configuration settings.
  ///
  /// Parameter [adBreaks] :
  /// The ad break configuration settings.
  ///
  /// Parameter [audienceMedia] :
  /// The list of AudienceMedia defined in program.
  Future<UpdateProgramResponse> updateProgram({
    required String channelName,
    required String programName,
    required UpdateProgramScheduleConfiguration scheduleConfiguration,
    List<AdBreak>? adBreaks,
    List<AudienceMedia>? audienceMedia,
  }) async {
    final $payload = <String, dynamic>{
      'ScheduleConfiguration': scheduleConfiguration,
      if (adBreaks != null) 'AdBreaks': adBreaks,
      if (audienceMedia != null) 'AudienceMedia': audienceMedia,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channel/${Uri.encodeComponent(channelName)}/program/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProgramResponse.fromJson(response);
  }

  /// Deletes a program within a channel. For information about programs, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-programs.html">Working
  /// with programs</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [channelName] :
  /// The name of the channel.
  ///
  /// Parameter [programName] :
  /// The name of the program.
  Future<void> deleteProgram({
    required String channelName,
    required String programName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channel/${Uri.encodeComponent(channelName)}/program/${Uri.encodeComponent(programName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates or updates a function. A function defines reusable logic that
  /// MediaTailor executes at lifecycle hooks during ad insertion. For more
  /// information about functions, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions.html">Working
  /// with functions</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [functionId] :
  /// The identifier of the function. The identifier must be unique within your
  /// account.
  ///
  /// Parameter [functionType] :
  /// The type of the function. The function type determines what the function
  /// can do at runtime. Valid values: <code>CUSTOM_OUTPUT</code> evaluates
  /// expressions and produces output bindings with no external calls.
  /// <code>HTTP_REQUEST</code> makes an HTTP call to an external service and
  /// evaluates output expressions that can reference the response.
  /// <code>SEQUENTIAL_EXECUTOR</code> runs a sequence of child functions in
  /// order, passing data between steps through temporary data. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-types.html">Function
  /// types and composition</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [customOutputConfiguration] :
  /// The configuration for a <code>CUSTOM_OUTPUT</code> function. Specifies the
  /// runtime and output expressions. Required when <code>FunctionType</code> is
  /// <code>CUSTOM_OUTPUT</code>.
  ///
  /// Parameter [description] :
  /// A description of the function.
  ///
  /// Parameter [httpRequestConfiguration] :
  /// The configuration for an <code>HTTP_REQUEST</code> function. Specifies the
  /// HTTP method, URL, headers, body, timeout, and output expressions. Required
  /// when <code>FunctionType</code> is <code>HTTP_REQUEST</code>.
  ///
  /// Parameter [sequentialExecutorConfiguration] :
  /// The configuration for a <code>SEQUENTIAL_EXECUTOR</code> function.
  /// Specifies the ordered list of child functions to execute, an optional
  /// output block, and a timeout. Required when <code>FunctionType</code> is
  /// <code>SEQUENTIAL_EXECUTOR</code>.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the function. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  Future<PutFunctionResponse> putFunction({
    required String functionId,
    required FunctionType functionType,
    CustomOutputConfiguration? customOutputConfiguration,
    String? description,
    HttpRequestConfiguration? httpRequestConfiguration,
    SequentialExecutorConfiguration? sequentialExecutorConfiguration,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'FunctionType': functionType.value,
      if (customOutputConfiguration != null)
        'CustomOutputConfiguration': customOutputConfiguration,
      if (description != null) 'Description': description,
      if (httpRequestConfiguration != null)
        'HttpRequestConfiguration': httpRequestConfiguration,
      if (sequentialExecutorConfiguration != null)
        'SequentialExecutorConfiguration': sequentialExecutorConfiguration,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/function/${Uri.encodeComponent(functionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return PutFunctionResponse.fromJson(response);
  }

  /// Retrieves the configuration and metadata for a function. For more
  /// information about functions, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions.html">Working
  /// with functions</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [functionId] :
  /// The identifier of the function.
  Future<GetFunctionResponse> getFunction({
    required String functionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/function/${Uri.encodeComponent(functionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFunctionResponse.fromJson(response);
  }

  /// Deletes a function. MediaTailor prevents deletion of a function that is
  /// still referenced by a playback configuration or by another function.
  /// Remove all references before deleting. For more information about
  /// functions, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions.html">Working
  /// with functions</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [functionId] :
  /// The identifier of the function to delete.
  Future<void> deleteFunction({
    required String functionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/function/${Uri.encodeComponent(functionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves all functions associated with your AWS account in the current
  /// Region. For more information about functions, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions.html">Working
  /// with functions</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of functions that you want MediaTailor to return in
  /// response to the current request. If there are more than
  /// <code>MaxResults</code> functions, use the value of <code>NextToken</code>
  /// in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses token-based pagination, which
  /// means that a response might contain fewer than <code>MaxResults</code>
  /// items, including 0 items, even when more results are available. To
  /// retrieve all results, you must continue making requests using the
  /// <code>NextToken</code> value from each response until the response no
  /// longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListFunctions</code> request, omit this value. For
  /// subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  Future<ListFunctionsResponse> listFunctions({
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/functions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFunctionsResponse.fromJson(response);
  }

  /// The live source configuration.
  ///
  /// Parameter [httpPackageConfigurations] :
  /// A list of HTTP package configuration parameters for this live source.
  ///
  /// Parameter [liveSourceName] :
  /// The name of the live source.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the live source. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  Future<CreateLiveSourceResponse> createLiveSource({
    required List<HttpPackageConfiguration> httpPackageConfigurations,
    required String liveSourceName,
    required String sourceLocationName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'HttpPackageConfigurations': httpPackageConfigurations,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/liveSource/${Uri.encodeComponent(liveSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLiveSourceResponse.fromJson(response);
  }

  /// The live source to describe.
  ///
  /// Parameter [liveSourceName] :
  /// The name of the live source.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this Live Source.
  Future<DescribeLiveSourceResponse> describeLiveSource({
    required String liveSourceName,
    required String sourceLocationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/liveSource/${Uri.encodeComponent(liveSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLiveSourceResponse.fromJson(response);
  }

  /// Updates a live source's configuration.
  ///
  /// Parameter [httpPackageConfigurations] :
  /// A list of HTTP package configurations for the live source on this account.
  ///
  /// Parameter [liveSourceName] :
  /// The name of the live source.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this Live Source.
  Future<UpdateLiveSourceResponse> updateLiveSource({
    required List<HttpPackageConfiguration> httpPackageConfigurations,
    required String liveSourceName,
    required String sourceLocationName,
  }) async {
    final $payload = <String, dynamic>{
      'HttpPackageConfigurations': httpPackageConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/liveSource/${Uri.encodeComponent(liveSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLiveSourceResponse.fromJson(response);
  }

  /// The live source to delete.
  ///
  /// Parameter [liveSourceName] :
  /// The name of the live source.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this Live Source.
  Future<void> deleteLiveSource({
    required String liveSourceName,
    required String sourceLocationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/liveSource/${Uri.encodeComponent(liveSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the live sources contained in a source location. A source represents
  /// a piece of content.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this Live Sources list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of live sources that you want MediaTailor to return in
  /// response to the current request. If there are more than
  /// <code>MaxResults</code> live sources, use the value of
  /// <code>NextToken</code> in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListLiveSources</code> request, omit this value. For
  /// subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  Future<ListLiveSourcesResponse> listLiveSources({
    required String sourceLocationName,
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
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/liveSources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLiveSourcesResponse.fromJson(response);
  }

  /// Creates a playback configuration. For information about MediaTailor
  /// configurations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
  /// with configurations in AWS Elemental MediaTailor</a>.
  ///
  /// Parameter [name] :
  /// The identifier for the playback configuration.
  ///
  /// Parameter [adConditioningConfiguration] :
  /// The setting that indicates what conditioning MediaTailor will perform on
  /// ads that the ad decision server (ADS) returns, and what priority
  /// MediaTailor uses when inserting ads.
  ///
  /// Parameter [adDecisionServerConfiguration] :
  /// The configuration for customizing HTTP requests to the ad decision server
  /// (ADS). This includes settings for request method, headers, body content,
  /// and compression options.
  ///
  /// Parameter [adDecisionServerUrl] :
  /// The URL for the ad decision server (ADS). This includes the specification
  /// of static parameters and placeholders for dynamic parameters. AWS
  /// Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing you
  /// can provide a static VAST URL. The maximum length is 25,000 characters.
  ///
  /// Parameter [availSuppression] :
  /// The configuration for avail suppression, also known as ad suppression. For
  /// more information about ad suppression, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Suppression</a>.
  ///
  /// Parameter [bumper] :
  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break. To learn more about
  /// bumpers, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/bumpers.html">Bumpers</a>.
  ///
  /// Parameter [cdnConfiguration] :
  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  ///
  /// Parameter [configurationAliases] :
  /// The player parameters and aliases used as dynamic variables during session
  /// initialization. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/variables-domains.html">Domain
  /// Variables</a>.
  ///
  /// Parameter [dashConfiguration] :
  /// The configuration for DASH content.
  ///
  /// Parameter [functionMapping] :
  /// A map of lifecycle hook event names to function identifiers. The function
  /// mapping specifies which function MediaTailor executes at each lifecycle
  /// hook during ad insertion. Valid keys are
  /// <code>PRE_SESSION_INITIALIZATION</code> and <code>PRE_ADS_REQUEST</code>.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-hooks.html">Functions
  /// lifecycle hooks</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [insertionMode] :
  /// The setting that controls whether players can use stitched or guided ad
  /// insertion. The default, <code>STITCHED_ONLY</code>, forces all player
  /// sessions to use stitched (server-side) ad insertion. Choosing
  /// <code>PLAYER_SELECT</code> allows players to select either stitched or
  /// guided ad insertion at session-initialization time. The default for
  /// players that do not specify an insertion mode is stitched.
  ///
  /// Parameter [livePreRollConfiguration] :
  /// The configuration for pre-roll ad insertion.
  ///
  /// Parameter [manifestProcessingRules] :
  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  ///
  /// Parameter [personalizationThresholdSeconds] :
  /// Defines the maximum duration of underfilled ad time (in seconds) allowed
  /// in an ad break. If the duration of underfilled ad time exceeds the
  /// personalization threshold, then the personalization of the ad break is
  /// abandoned and the underlying content is shown. This feature applies to
  /// <i>ad replacement</i> in live and VOD streams, rather than ad insertion,
  /// because it relies on an underlying content stream. For more information
  /// about ad break behavior, including ad replacement and insertion, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Behavior in AWS Elemental MediaTailor</a>.
  ///
  /// Parameter [slateAdUrl] :
  /// The URL for a high-quality video asset to transcode and use to fill in
  /// time that's not used by ads. AWS Elemental MediaTailor shows the slate to
  /// fill in gaps in media content. Configuring the slate is optional for
  /// non-VPAID configurations. For VPAID, the slate is required because
  /// MediaTailor provides it in the slots that are designated for dynamic ad
  /// content. The slate must be a high-quality asset that contains both audio
  /// and video.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the playback configuration. Tags are key-value pairs
  /// that you can associate with Amazon resources to help with organization,
  /// access control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  ///
  /// Parameter [transcodeProfileName] :
  /// The name that is used to associate this playback configuration with a
  /// custom transcode profile. This overrides the dynamic transcoding defaults
  /// of MediaTailor. Use this only if you have already set up custom profiles
  /// with the help of AWS Support.
  ///
  /// Parameter [videoContentSourceUrl] :
  /// The URL prefix for the parent manifest for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  Future<PutPlaybackConfigurationResponse> putPlaybackConfiguration({
    required String name,
    AdConditioningConfiguration? adConditioningConfiguration,
    AdDecisionServerConfiguration? adDecisionServerConfiguration,
    String? adDecisionServerUrl,
    AvailSuppression? availSuppression,
    Bumper? bumper,
    CdnConfiguration? cdnConfiguration,
    Map<String, Map<String, String>>? configurationAliases,
    DashConfigurationForPut? dashConfiguration,
    Map<EventName, String>? functionMapping,
    InsertionMode? insertionMode,
    LivePreRollConfiguration? livePreRollConfiguration,
    ManifestProcessingRules? manifestProcessingRules,
    int? personalizationThresholdSeconds,
    String? slateAdUrl,
    Map<String, String>? tags,
    String? transcodeProfileName,
    String? videoContentSourceUrl,
  }) async {
    _s.validateNumRange(
      'personalizationThresholdSeconds',
      personalizationThresholdSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      if (adConditioningConfiguration != null)
        'AdConditioningConfiguration': adConditioningConfiguration,
      if (adDecisionServerConfiguration != null)
        'AdDecisionServerConfiguration': adDecisionServerConfiguration,
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (availSuppression != null) 'AvailSuppression': availSuppression,
      if (bumper != null) 'Bumper': bumper,
      if (cdnConfiguration != null) 'CdnConfiguration': cdnConfiguration,
      if (configurationAliases != null)
        'ConfigurationAliases': configurationAliases,
      if (dashConfiguration != null) 'DashConfiguration': dashConfiguration,
      if (functionMapping != null)
        'FunctionMapping': functionMapping.map((k, e) => MapEntry(k.value, e)),
      if (insertionMode != null) 'InsertionMode': insertionMode.value,
      if (livePreRollConfiguration != null)
        'LivePreRollConfiguration': livePreRollConfiguration,
      if (manifestProcessingRules != null)
        'ManifestProcessingRules': manifestProcessingRules,
      if (personalizationThresholdSeconds != null)
        'PersonalizationThresholdSeconds': personalizationThresholdSeconds,
      if (slateAdUrl != null) 'SlateAdUrl': slateAdUrl,
      if (tags != null) 'tags': tags,
      if (transcodeProfileName != null)
        'TranscodeProfileName': transcodeProfileName,
      if (videoContentSourceUrl != null)
        'VideoContentSourceUrl': videoContentSourceUrl,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/playbackConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return PutPlaybackConfigurationResponse.fromJson(response);
  }

  /// Retrieves a playback configuration. For information about MediaTailor
  /// configurations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
  /// with configurations in AWS Elemental MediaTailor</a>.
  ///
  /// Parameter [name] :
  /// The identifier for the playback configuration.
  Future<GetPlaybackConfigurationResponse> getPlaybackConfiguration({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/playbackConfiguration/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPlaybackConfigurationResponse.fromJson(response);
  }

  /// Deletes a playback configuration. For information about MediaTailor
  /// configurations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
  /// with configurations in AWS Elemental MediaTailor</a>.
  ///
  /// Parameter [name] :
  /// The name of the playback configuration.
  Future<void> deletePlaybackConfiguration({
    required String name,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/playbackConfiguration/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves existing playback configurations. For information about
  /// MediaTailor configurations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
  /// with Configurations in AWS Elemental MediaTailor</a>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of playback configurations that you want MediaTailor to
  /// return in response to the current request. If there are more than
  /// <code>MaxResults</code> playback configurations, use the value of
  /// <code>NextToken</code> in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListPlaybackConfigurations</code> request, omit this
  /// value. For subsequent requests, get the value of <code>NextToken</code>
  /// from the previous response and specify that value for
  /// <code>NextToken</code> in the request. Continue making requests until the
  /// response no longer includes a <code>NextToken</code> value, which
  /// indicates that all results have been retrieved.
  Future<ListPlaybackConfigurationsResponse> listPlaybackConfigurations({
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
      if (maxResults != null) 'MaxResults': [maxResults.toString()],
      if (nextToken != null) 'NextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/playbackConfigurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPlaybackConfigurationsResponse.fromJson(response);
  }

  /// Creates a prefetch schedule for a playback configuration. A prefetch
  /// schedule allows you to tell MediaTailor to fetch and prepare certain ads
  /// before an ad break happens. For more information about ad prefetching, see
  /// <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/prefetching-ads.html">Using
  /// ad prefetching</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [name] :
  /// The name to assign to the schedule request.
  ///
  /// Parameter [playbackConfigurationName] :
  /// The name to assign to the playback configuration.
  ///
  /// Parameter [consumption] :
  /// The configuration settings for how and when MediaTailor consumes
  /// prefetched ads from the ad decision server for single prefetch schedules.
  /// Each consumption configuration contains an end time and an optional start
  /// time that define the <i>consumption window</i>. Prefetch schedules
  /// automatically expire no earlier than seven days after the end time.
  ///
  /// Parameter [recurringPrefetchConfiguration] :
  /// The configuration that defines how and when MediaTailor performs ad
  /// prefetching in a live event.
  ///
  /// Parameter [retrieval] :
  /// The configuration settings for retrieval of prefetched ads from the ad
  /// decision server. Only one set of prefetched ads will be retrieved and
  /// subsequently consumed for each ad break.
  ///
  /// Parameter [scheduleType] :
  /// The frequency that MediaTailor creates prefetch schedules.
  /// <code>SINGLE</code> indicates that this schedule applies to one ad break.
  /// <code>RECURRING</code> indicates that MediaTailor automatically creates a
  /// schedule for each ad avail in a live event.
  ///
  /// For more information about the prefetch types and when you might use each,
  /// see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/prefetching-ads.html">Prefetching
  /// ads in Elemental MediaTailor.</a>
  ///
  /// Parameter [streamId] :
  /// An optional stream identifier that MediaTailor uses to prefetch ads for
  /// multiple streams that use the same playback configuration. If
  /// <code>StreamId</code> is specified, MediaTailor returns all of the
  /// prefetch schedules with an exact match on <code>StreamId</code>. If not
  /// specified, MediaTailor returns all of the prefetch schedules for the
  /// playback configuration, regardless of <code>StreamId</code>.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the prefetch schedule. Tags are key-value pairs that
  /// you can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  Future<CreatePrefetchScheduleResponse> createPrefetchSchedule({
    required String name,
    required String playbackConfigurationName,
    PrefetchConsumption? consumption,
    RecurringPrefetchConfiguration? recurringPrefetchConfiguration,
    PrefetchRetrieval? retrieval,
    PrefetchScheduleType? scheduleType,
    String? streamId,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (consumption != null) 'Consumption': consumption,
      if (recurringPrefetchConfiguration != null)
        'RecurringPrefetchConfiguration': recurringPrefetchConfiguration,
      if (retrieval != null) 'Retrieval': retrieval,
      if (scheduleType != null) 'ScheduleType': scheduleType.value,
      if (streamId != null) 'StreamId': streamId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/prefetchSchedule/${Uri.encodeComponent(playbackConfigurationName)}/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePrefetchScheduleResponse.fromJson(response);
  }

  /// Retrieves a prefetch schedule for a playback configuration. A prefetch
  /// schedule allows you to tell MediaTailor to fetch and prepare certain ads
  /// before an ad break happens. For more information about ad prefetching, see
  /// <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/prefetching-ads.html">Using
  /// ad prefetching</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the prefetch schedule. The name must be unique among all
  /// prefetch schedules that are associated with the specified playback
  /// configuration.
  ///
  /// Parameter [playbackConfigurationName] :
  /// Returns information about the prefetch schedule for a specific playback
  /// configuration. If you call <code>GetPrefetchSchedule</code> on an expired
  /// prefetch schedule, MediaTailor returns an HTTP 404 status code.
  Future<GetPrefetchScheduleResponse> getPrefetchSchedule({
    required String name,
    required String playbackConfigurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/prefetchSchedule/${Uri.encodeComponent(playbackConfigurationName)}/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPrefetchScheduleResponse.fromJson(response);
  }

  /// Deletes a prefetch schedule for a specific playback configuration. If you
  /// call <code>DeletePrefetchSchedule</code> on an expired prefetch schedule,
  /// MediaTailor returns an HTTP 404 status code. For more information about ad
  /// prefetching, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/prefetching-ads.html">Using
  /// ad prefetching</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [name] :
  /// The name of the prefetch schedule. If the action is successful, the
  /// service sends back an HTTP 204 response with an empty HTTP body.
  ///
  /// Parameter [playbackConfigurationName] :
  /// The name of the playback configuration for this prefetch schedule.
  Future<void> deletePrefetchSchedule({
    required String name,
    required String playbackConfigurationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/prefetchSchedule/${Uri.encodeComponent(playbackConfigurationName)}/${Uri.encodeComponent(name)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the prefetch schedules for a playback configuration.
  ///
  /// Parameter [playbackConfigurationName] :
  /// Retrieves the prefetch schedule(s) for a specific playback configuration.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of prefetch schedules that you want MediaTailor to
  /// return in response to the current request. If there are more than
  /// <code>MaxResults</code> prefetch schedules, use the value of
  /// <code>NextToken</code> in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListPrefetchSchedules</code> request, omit this value.
  /// For subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  ///
  /// Parameter [scheduleType] :
  /// The type of prefetch schedules that you want to list. <code>SINGLE</code>
  /// indicates that you want to list the configured single prefetch schedules.
  /// <code>RECURRING</code> indicates that you want to list the configured
  /// recurring prefetch schedules. <code>ALL</code> indicates that you want to
  /// list all configured prefetch schedules.
  ///
  /// Parameter [streamId] :
  /// An optional filtering parameter whereby MediaTailor filters the prefetch
  /// schedules to include only specific streams.
  Future<ListPrefetchSchedulesResponse> listPrefetchSchedules({
    required String playbackConfigurationName,
    int? maxResults,
    String? nextToken,
    ListPrefetchScheduleType? scheduleType,
    String? streamId,
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
      if (scheduleType != null) 'ScheduleType': scheduleType.value,
      if (streamId != null) 'StreamId': streamId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/prefetchSchedule/${Uri.encodeComponent(playbackConfigurationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListPrefetchSchedulesResponse.fromJson(response);
  }

  /// Creates a source location. A source location is a container for sources.
  /// For more information about source locations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-source-locations.html">Working
  /// with source locations</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [httpConfiguration] :
  /// The source's HTTP package configurations.
  ///
  /// Parameter [sourceLocationName] :
  /// The name associated with the source location.
  ///
  /// Parameter [accessConfiguration] :
  /// Access configuration parameters. Configures the type of authentication
  /// used to access content from your source location.
  ///
  /// Parameter [defaultSegmentDeliveryConfiguration] :
  /// The optional configuration for the server that serves segments.
  ///
  /// Parameter [segmentDeliveryConfigurations] :
  /// A list of the segment delivery configurations associated with this
  /// resource.
  ///
  /// Parameter [tags] :
  /// The tags to assign to the source location. Tags are key-value pairs that
  /// you can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  Future<CreateSourceLocationResponse> createSourceLocation({
    required HttpConfiguration httpConfiguration,
    required String sourceLocationName,
    AccessConfiguration? accessConfiguration,
    DefaultSegmentDeliveryConfiguration? defaultSegmentDeliveryConfiguration,
    List<SegmentDeliveryConfiguration>? segmentDeliveryConfigurations,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'HttpConfiguration': httpConfiguration,
      if (accessConfiguration != null)
        'AccessConfiguration': accessConfiguration,
      if (defaultSegmentDeliveryConfiguration != null)
        'DefaultSegmentDeliveryConfiguration':
            defaultSegmentDeliveryConfiguration,
      if (segmentDeliveryConfigurations != null)
        'SegmentDeliveryConfigurations': segmentDeliveryConfigurations,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSourceLocationResponse.fromJson(response);
  }

  /// Describes a source location. A source location is a container for sources.
  /// For more information about source locations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-source-locations.html">Working
  /// with source locations</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location.
  Future<DescribeSourceLocationResponse> describeSourceLocation({
    required String sourceLocationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSourceLocationResponse.fromJson(response);
  }

  /// Updates a source location. A source location is a container for sources.
  /// For more information about source locations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-source-locations.html">Working
  /// with source locations</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [httpConfiguration] :
  /// The HTTP configuration for the source location.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location.
  ///
  /// Parameter [accessConfiguration] :
  /// Access configuration parameters. Configures the type of authentication
  /// used to access content from your source location.
  ///
  /// Parameter [defaultSegmentDeliveryConfiguration] :
  /// The optional configuration for the host server that serves segments.
  ///
  /// Parameter [segmentDeliveryConfigurations] :
  /// A list of the segment delivery configurations associated with this
  /// resource.
  Future<UpdateSourceLocationResponse> updateSourceLocation({
    required HttpConfiguration httpConfiguration,
    required String sourceLocationName,
    AccessConfiguration? accessConfiguration,
    DefaultSegmentDeliveryConfiguration? defaultSegmentDeliveryConfiguration,
    List<SegmentDeliveryConfiguration>? segmentDeliveryConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      'HttpConfiguration': httpConfiguration,
      if (accessConfiguration != null)
        'AccessConfiguration': accessConfiguration,
      if (defaultSegmentDeliveryConfiguration != null)
        'DefaultSegmentDeliveryConfiguration':
            defaultSegmentDeliveryConfiguration,
      if (segmentDeliveryConfigurations != null)
        'SegmentDeliveryConfigurations': segmentDeliveryConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSourceLocationResponse.fromJson(response);
  }

  /// Deletes a source location. A source location is a container for sources.
  /// For more information about source locations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-source-locations.html">Working
  /// with source locations</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location.
  Future<void> deleteSourceLocation({
    required String sourceLocationName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the source locations for a channel. A source location defines the
  /// host server URL, and contains a list of sources.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of source locations that you want MediaTailor to return
  /// in response to the current request. If there are more than
  /// <code>MaxResults</code> source locations, use the value of
  /// <code>NextToken</code> in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListSourceLocations</code> request, omit this value.
  /// For subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  Future<ListSourceLocationsResponse> listSourceLocations({
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
      requestUri: '/sourceLocations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSourceLocationsResponse.fromJson(response);
  }

  /// The VOD source configuration parameters.
  ///
  /// Parameter [httpPackageConfigurations] :
  /// A list of HTTP package configuration parameters for this VOD source.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location for this VOD source.
  ///
  /// Parameter [vodSourceName] :
  /// The name associated with the VOD source.&gt;
  ///
  /// Parameter [tags] :
  /// The tags to assign to the VOD source. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  Future<CreateVodSourceResponse> createVodSource({
    required List<HttpPackageConfiguration> httpPackageConfigurations,
    required String sourceLocationName,
    required String vodSourceName,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'HttpPackageConfigurations': httpPackageConfigurations,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/vodSource/${Uri.encodeComponent(vodSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVodSourceResponse.fromJson(response);
  }

  /// Provides details about a specific video on demand (VOD) source in a
  /// specific source location.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this VOD Source.
  ///
  /// Parameter [vodSourceName] :
  /// The name of the VOD Source.
  Future<DescribeVodSourceResponse> describeVodSource({
    required String sourceLocationName,
    required String vodSourceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/vodSource/${Uri.encodeComponent(vodSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVodSourceResponse.fromJson(response);
  }

  /// Updates a VOD source's configuration.
  ///
  /// Parameter [httpPackageConfigurations] :
  /// A list of HTTP package configurations for the VOD source on this account.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this VOD Source.
  ///
  /// Parameter [vodSourceName] :
  /// The name of the VOD source.
  Future<UpdateVodSourceResponse> updateVodSource({
    required List<HttpPackageConfiguration> httpPackageConfigurations,
    required String sourceLocationName,
    required String vodSourceName,
  }) async {
    final $payload = <String, dynamic>{
      'HttpPackageConfigurations': httpPackageConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/vodSource/${Uri.encodeComponent(vodSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVodSourceResponse.fromJson(response);
  }

  /// The video on demand (VOD) source to delete.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this VOD Source.
  ///
  /// Parameter [vodSourceName] :
  /// The name of the VOD source.
  Future<void> deleteVodSource({
    required String sourceLocationName,
    required String vodSourceName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/vodSource/${Uri.encodeComponent(vodSourceName)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Lists the VOD sources contained in a source location. A source represents
  /// a piece of content.
  ///
  /// Parameter [sourceLocationName] :
  /// The name of the source location associated with this VOD Source list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of VOD sources that you want MediaTailor to return in
  /// response to the current request. If there are more than
  /// <code>MaxResults</code> VOD sources, use the value of
  /// <code>NextToken</code> in the response to get the next page of results.
  ///
  /// The default value is 100. MediaTailor uses DynamoDB-based pagination,
  /// which means that a response might contain fewer than
  /// <code>MaxResults</code> items, including 0 items, even when more results
  /// are available. To retrieve all results, you must continue making requests
  /// using the <code>NextToken</code> value from each response until the
  /// response no longer includes a <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListVodSources</code> request, omit this value. For
  /// subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  Future<ListVodSourcesResponse> listVodSources({
    required String sourceLocationName,
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
          '/sourceLocation/${Uri.encodeComponent(sourceLocationName)}/vodSources',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVodSourcesResponse.fromJson(response);
  }
}

/// @nodoc
class ConfigureLogsForPlaybackConfigurationResponse {
  /// The percentage of session logs that MediaTailor sends to your Cloudwatch
  /// Logs account.
  final int percentEnabled;

  /// The event types that MediaTailor emits in logs for interactions with the
  /// ADS.
  final AdsInteractionLog? adsInteractionLog;

  /// The method used for collecting logs from AWS Elemental MediaTailor.
  /// <code>LEGACY_CLOUDWATCH</code> indicates that MediaTailor is sending logs
  /// directly to Amazon CloudWatch Logs. <code>VENDED_LOGS</code> indicates that
  /// MediaTailor is sending logs to CloudWatch, which then vends the logs to your
  /// destination of choice. Supported destinations are CloudWatch Logs log group,
  /// Amazon S3 bucket, and Amazon Data Firehose stream.
  final List<LoggingStrategy>? enabledLoggingStrategies;

  /// The event types that MediaTailor emits in logs for interactions with the
  /// origin server.
  final ManifestServiceInteractionLog? manifestServiceInteractionLog;

  /// The name of the playback configuration.
  final String? playbackConfigurationName;

  ConfigureLogsForPlaybackConfigurationResponse({
    required this.percentEnabled,
    this.adsInteractionLog,
    this.enabledLoggingStrategies,
    this.manifestServiceInteractionLog,
    this.playbackConfigurationName,
  });

  factory ConfigureLogsForPlaybackConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return ConfigureLogsForPlaybackConfigurationResponse(
      percentEnabled: (json['PercentEnabled'] as int?) ?? 0,
      adsInteractionLog: json['AdsInteractionLog'] != null
          ? AdsInteractionLog.fromJson(
              json['AdsInteractionLog'] as Map<String, dynamic>)
          : null,
      enabledLoggingStrategies: (json['EnabledLoggingStrategies'] as List?)
          ?.nonNulls
          .map((e) => LoggingStrategy.fromString((e as String)))
          .toList(),
      manifestServiceInteractionLog:
          json['ManifestServiceInteractionLog'] != null
              ? ManifestServiceInteractionLog.fromJson(
                  json['ManifestServiceInteractionLog'] as Map<String, dynamic>)
              : null,
      playbackConfigurationName: json['PlaybackConfigurationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final percentEnabled = this.percentEnabled;
    final adsInteractionLog = this.adsInteractionLog;
    final enabledLoggingStrategies = this.enabledLoggingStrategies;
    final manifestServiceInteractionLog = this.manifestServiceInteractionLog;
    final playbackConfigurationName = this.playbackConfigurationName;
    return {
      'PercentEnabled': percentEnabled,
      if (adsInteractionLog != null) 'AdsInteractionLog': adsInteractionLog,
      if (enabledLoggingStrategies != null)
        'EnabledLoggingStrategies':
            enabledLoggingStrategies.map((e) => e.value).toList(),
      if (manifestServiceInteractionLog != null)
        'ManifestServiceInteractionLog': manifestServiceInteractionLog,
      if (playbackConfigurationName != null)
        'PlaybackConfigurationName': playbackConfigurationName,
    };
  }
}

/// @nodoc
class ListAlertsResponse {
  /// A list of alerts that are associated with this resource.
  final List<Alert>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListAlertsResponse({
    this.items,
    this.nextToken,
  });

  factory ListAlertsResponse.fromJson(Map<String, dynamic> json) {
    return ListAlertsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => Alert.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags associated with this resource. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
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

/// @nodoc
class CreateChannelResponse {
  /// The Amazon Resource Name (ARN) to assign to the channel.
  final String? arn;

  /// The list of audiences defined in channel.
  final List<String>? audiences;

  /// The name to assign to the channel.
  final String? channelName;

  /// Indicates whether the channel is in a running state or not.
  final ChannelState? channelState;

  /// The timestamp of when the channel was created.
  final DateTime? creationTime;

  /// Contains information about the slate used to fill gaps between programs in
  /// the schedule.
  final SlateSource? fillerSlate;

  /// The timestamp of when the channel was last modified.
  final DateTime? lastModifiedTime;

  /// The output properties to assign to the channel.
  final List<ResponseOutputItem>? outputs;

  /// The playback mode to assign to the channel.
  final String? playbackMode;

  /// The tags to assign to the channel. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The tier of the channel.
  final String? tier;

  /// The time-shifted viewing configuration assigned to the channel.
  final TimeShiftConfiguration? timeShiftConfiguration;

  CreateChannelResponse({
    this.arn,
    this.audiences,
    this.channelName,
    this.channelState,
    this.creationTime,
    this.fillerSlate,
    this.lastModifiedTime,
    this.outputs,
    this.playbackMode,
    this.tags,
    this.tier,
    this.timeShiftConfiguration,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      arn: json['Arn'] as String?,
      audiences: (json['Audiences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      channelName: json['ChannelName'] as String?,
      channelState:
          (json['ChannelState'] as String?)?.let(ChannelState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      fillerSlate: json['FillerSlate'] != null
          ? SlateSource.fromJson(json['FillerSlate'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      outputs: (json['Outputs'] as List?)
          ?.nonNulls
          .map((e) => ResponseOutputItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      playbackMode: json['PlaybackMode'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tier: json['Tier'] as String?,
      timeShiftConfiguration: json['TimeShiftConfiguration'] != null
          ? TimeShiftConfiguration.fromJson(
              json['TimeShiftConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final audiences = this.audiences;
    final channelName = this.channelName;
    final channelState = this.channelState;
    final creationTime = this.creationTime;
    final fillerSlate = this.fillerSlate;
    final lastModifiedTime = this.lastModifiedTime;
    final outputs = this.outputs;
    final playbackMode = this.playbackMode;
    final tags = this.tags;
    final tier = this.tier;
    final timeShiftConfiguration = this.timeShiftConfiguration;
    return {
      if (arn != null) 'Arn': arn,
      if (audiences != null) 'Audiences': audiences,
      if (channelName != null) 'ChannelName': channelName,
      if (channelState != null) 'ChannelState': channelState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (fillerSlate != null) 'FillerSlate': fillerSlate,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (outputs != null) 'Outputs': outputs,
      if (playbackMode != null) 'PlaybackMode': playbackMode,
      if (tags != null) 'tags': tags,
      if (tier != null) 'Tier': tier,
      if (timeShiftConfiguration != null)
        'TimeShiftConfiguration': timeShiftConfiguration,
    };
  }
}

/// @nodoc
class DescribeChannelResponse {
  /// The log configuration for the channel.
  final LogConfigurationForChannel logConfiguration;

  /// The ARN of the channel.
  final String? arn;

  /// The list of audiences defined in channel.
  final List<String>? audiences;

  /// The name of the channel.
  final String? channelName;

  /// Indicates whether the channel is in a running state or not.
  final ChannelState? channelState;

  /// The timestamp of when the channel was created.
  final DateTime? creationTime;

  /// Contains information about the slate used to fill gaps between programs in
  /// the schedule.
  final SlateSource? fillerSlate;

  /// The timestamp of when the channel was last modified.
  final DateTime? lastModifiedTime;

  /// The channel's output properties.
  final List<ResponseOutputItem>? outputs;

  /// The channel's playback mode.
  final String? playbackMode;

  /// The tags assigned to the channel. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The channel's tier.
  final String? tier;

  /// The time-shifted viewing configuration for the channel.
  final TimeShiftConfiguration? timeShiftConfiguration;

  DescribeChannelResponse({
    required this.logConfiguration,
    this.arn,
    this.audiences,
    this.channelName,
    this.channelState,
    this.creationTime,
    this.fillerSlate,
    this.lastModifiedTime,
    this.outputs,
    this.playbackMode,
    this.tags,
    this.tier,
    this.timeShiftConfiguration,
  });

  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelResponse(
      logConfiguration: LogConfigurationForChannel.fromJson(
          (json['LogConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      arn: json['Arn'] as String?,
      audiences: (json['Audiences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      channelName: json['ChannelName'] as String?,
      channelState:
          (json['ChannelState'] as String?)?.let(ChannelState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      fillerSlate: json['FillerSlate'] != null
          ? SlateSource.fromJson(json['FillerSlate'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      outputs: (json['Outputs'] as List?)
          ?.nonNulls
          .map((e) => ResponseOutputItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      playbackMode: json['PlaybackMode'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tier: json['Tier'] as String?,
      timeShiftConfiguration: json['TimeShiftConfiguration'] != null
          ? TimeShiftConfiguration.fromJson(
              json['TimeShiftConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final logConfiguration = this.logConfiguration;
    final arn = this.arn;
    final audiences = this.audiences;
    final channelName = this.channelName;
    final channelState = this.channelState;
    final creationTime = this.creationTime;
    final fillerSlate = this.fillerSlate;
    final lastModifiedTime = this.lastModifiedTime;
    final outputs = this.outputs;
    final playbackMode = this.playbackMode;
    final tags = this.tags;
    final tier = this.tier;
    final timeShiftConfiguration = this.timeShiftConfiguration;
    return {
      'LogConfiguration': logConfiguration,
      if (arn != null) 'Arn': arn,
      if (audiences != null) 'Audiences': audiences,
      if (channelName != null) 'ChannelName': channelName,
      if (channelState != null) 'ChannelState': channelState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (fillerSlate != null) 'FillerSlate': fillerSlate,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (outputs != null) 'Outputs': outputs,
      if (playbackMode != null) 'PlaybackMode': playbackMode,
      if (tags != null) 'tags': tags,
      if (tier != null) 'Tier': tier,
      if (timeShiftConfiguration != null)
        'TimeShiftConfiguration': timeShiftConfiguration,
    };
  }
}

/// @nodoc
class UpdateChannelResponse {
  /// The Amazon Resource Name (ARN) associated with the channel.
  final String? arn;

  /// The list of audiences defined in channel.
  final List<String>? audiences;

  /// The name of the channel.
  final String? channelName;

  /// Returns the state whether the channel is running or not.
  final ChannelState? channelState;

  /// The timestamp of when the channel was created.
  final DateTime? creationTime;

  /// The slate used to fill gaps between programs in the schedule. You must
  /// configure filler slate if your channel uses the <code>LINEAR</code>
  /// <code>PlaybackMode</code>. MediaTailor doesn't support filler slate for
  /// channels using the <code>LOOP</code> <code>PlaybackMode</code>.
  final SlateSource? fillerSlate;

  /// The timestamp that indicates when the channel was last modified.
  final DateTime? lastModifiedTime;

  /// The channel's output properties.
  final List<ResponseOutputItem>? outputs;

  /// The type of playback mode for this channel.
  ///
  /// <code>LINEAR</code> - Programs play back-to-back only once.
  ///
  /// <code>LOOP</code> - Programs play back-to-back in an endless loop. When the
  /// last program in the schedule plays, playback loops back to the first program
  /// in the schedule.
  final String? playbackMode;

  /// The tags to assign to the channel. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The tier associated with this Channel.
  final String? tier;

  /// The time-shifted viewing configuration for the channel.
  final TimeShiftConfiguration? timeShiftConfiguration;

  UpdateChannelResponse({
    this.arn,
    this.audiences,
    this.channelName,
    this.channelState,
    this.creationTime,
    this.fillerSlate,
    this.lastModifiedTime,
    this.outputs,
    this.playbackMode,
    this.tags,
    this.tier,
    this.timeShiftConfiguration,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      arn: json['Arn'] as String?,
      audiences: (json['Audiences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      channelName: json['ChannelName'] as String?,
      channelState:
          (json['ChannelState'] as String?)?.let(ChannelState.fromString),
      creationTime: timeStampFromJson(json['CreationTime']),
      fillerSlate: json['FillerSlate'] != null
          ? SlateSource.fromJson(json['FillerSlate'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      outputs: (json['Outputs'] as List?)
          ?.nonNulls
          .map((e) => ResponseOutputItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      playbackMode: json['PlaybackMode'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tier: json['Tier'] as String?,
      timeShiftConfiguration: json['TimeShiftConfiguration'] != null
          ? TimeShiftConfiguration.fromJson(
              json['TimeShiftConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final audiences = this.audiences;
    final channelName = this.channelName;
    final channelState = this.channelState;
    final creationTime = this.creationTime;
    final fillerSlate = this.fillerSlate;
    final lastModifiedTime = this.lastModifiedTime;
    final outputs = this.outputs;
    final playbackMode = this.playbackMode;
    final tags = this.tags;
    final tier = this.tier;
    final timeShiftConfiguration = this.timeShiftConfiguration;
    return {
      if (arn != null) 'Arn': arn,
      if (audiences != null) 'Audiences': audiences,
      if (channelName != null) 'ChannelName': channelName,
      if (channelState != null) 'ChannelState': channelState.value,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (fillerSlate != null) 'FillerSlate': fillerSlate,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (outputs != null) 'Outputs': outputs,
      if (playbackMode != null) 'PlaybackMode': playbackMode,
      if (tags != null) 'tags': tags,
      if (tier != null) 'Tier': tier,
      if (timeShiftConfiguration != null)
        'TimeShiftConfiguration': timeShiftConfiguration,
    };
  }
}

/// @nodoc
class DeleteChannelResponse {
  DeleteChannelResponse();

  factory DeleteChannelResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListChannelsResponse {
  /// A list of channels that are associated with this account.
  final List<Channel>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListChannelsResponse({
    this.items,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => Channel.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ConfigureLogsForChannelResponse {
  /// The name of the channel.
  final String? channelName;

  /// The types of logs collected.
  final List<LogType>? logTypes;

  ConfigureLogsForChannelResponse({
    this.channelName,
    this.logTypes,
  });

  factory ConfigureLogsForChannelResponse.fromJson(Map<String, dynamic> json) {
    return ConfigureLogsForChannelResponse(
      channelName: json['ChannelName'] as String?,
      logTypes: (json['LogTypes'] as List?)
          ?.nonNulls
          .map((e) => LogType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelName = this.channelName;
    final logTypes = this.logTypes;
    return {
      if (channelName != null) 'ChannelName': channelName,
      if (logTypes != null) 'LogTypes': logTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class GetChannelScheduleResponse {
  /// A list of schedule entries for the channel.
  final List<ScheduleEntry>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  GetChannelScheduleResponse({
    this.items,
    this.nextToken,
  });

  factory GetChannelScheduleResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelScheduleResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => ScheduleEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class StartChannelResponse {
  StartChannelResponse();

  factory StartChannelResponse.fromJson(Map<String, dynamic> _) {
    return StartChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class StopChannelResponse {
  StopChannelResponse();

  factory StopChannelResponse.fromJson(Map<String, dynamic> _) {
    return StopChannelResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class PutChannelPolicyResponse {
  PutChannelPolicyResponse();

  factory PutChannelPolicyResponse.fromJson(Map<String, dynamic> _) {
    return PutChannelPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class GetChannelPolicyResponse {
  /// The IAM policy for the channel. IAM policies are used to control access to
  /// your channel.
  final String? policy;

  GetChannelPolicyResponse({
    this.policy,
  });

  factory GetChannelPolicyResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelPolicyResponse(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

/// @nodoc
class DeleteChannelPolicyResponse {
  DeleteChannelPolicyResponse();

  factory DeleteChannelPolicyResponse.fromJson(Map<String, dynamic> _) {
    return DeleteChannelPolicyResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class CreateProgramResponse {
  /// The ad break configuration settings.
  final List<AdBreak>? adBreaks;

  /// The ARN to assign to the program.
  final String? arn;

  /// The list of AudienceMedia defined in program.
  final List<AudienceMedia>? audienceMedia;

  /// The name to assign to the channel for this program.
  final String? channelName;

  /// The clip range configuration settings.
  final ClipRange? clipRange;

  /// The time the program was created.
  final DateTime? creationTime;

  /// The duration of the live program in milliseconds.
  final int? durationMillis;

  /// The name of the LiveSource for this Program.
  final String? liveSourceName;

  /// The name to assign to this program.
  final String? programName;

  /// The scheduled start time for this Program.
  final DateTime? scheduledStartTime;

  /// The name to assign to the source location for this program.
  final String? sourceLocationName;

  /// The tags assigned to the program. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name that's used to refer to a VOD source.
  final String? vodSourceName;

  CreateProgramResponse({
    this.adBreaks,
    this.arn,
    this.audienceMedia,
    this.channelName,
    this.clipRange,
    this.creationTime,
    this.durationMillis,
    this.liveSourceName,
    this.programName,
    this.scheduledStartTime,
    this.sourceLocationName,
    this.tags,
    this.vodSourceName,
  });

  factory CreateProgramResponse.fromJson(Map<String, dynamic> json) {
    return CreateProgramResponse(
      adBreaks: (json['AdBreaks'] as List?)
          ?.nonNulls
          .map((e) => AdBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      audienceMedia: (json['AudienceMedia'] as List?)
          ?.nonNulls
          .map((e) => AudienceMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelName: json['ChannelName'] as String?,
      clipRange: json['ClipRange'] != null
          ? ClipRange.fromJson(json['ClipRange'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      durationMillis: json['DurationMillis'] as int?,
      liveSourceName: json['LiveSourceName'] as String?,
      programName: json['ProgramName'] as String?,
      scheduledStartTime: timeStampFromJson(json['ScheduledStartTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adBreaks = this.adBreaks;
    final arn = this.arn;
    final audienceMedia = this.audienceMedia;
    final channelName = this.channelName;
    final clipRange = this.clipRange;
    final creationTime = this.creationTime;
    final durationMillis = this.durationMillis;
    final liveSourceName = this.liveSourceName;
    final programName = this.programName;
    final scheduledStartTime = this.scheduledStartTime;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    final vodSourceName = this.vodSourceName;
    return {
      if (adBreaks != null) 'AdBreaks': adBreaks,
      if (arn != null) 'Arn': arn,
      if (audienceMedia != null) 'AudienceMedia': audienceMedia,
      if (channelName != null) 'ChannelName': channelName,
      if (clipRange != null) 'ClipRange': clipRange,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (programName != null) 'ProgramName': programName,
      if (scheduledStartTime != null)
        'ScheduledStartTime': unixTimestampToJson(scheduledStartTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class DescribeProgramResponse {
  /// The ad break configuration settings.
  final List<AdBreak>? adBreaks;

  /// The ARN of the program.
  final String? arn;

  /// The list of AudienceMedia defined in program.
  final List<AudienceMedia>? audienceMedia;

  /// The name of the channel that the program belongs to.
  final String? channelName;

  /// The clip range configuration settings.
  final ClipRange? clipRange;

  /// The timestamp of when the program was created.
  final DateTime? creationTime;

  /// The duration of the live program in milliseconds.
  final int? durationMillis;

  /// The name of the LiveSource for this Program.
  final String? liveSourceName;

  /// The name of the program.
  final String? programName;

  /// The date and time that the program is scheduled to start in ISO 8601 format
  /// and Coordinated Universal Time (UTC). For example, the value
  /// 2021-03-27T17:48:16.751Z represents March 27, 2021 at 17:48:16.751 UTC.
  final DateTime? scheduledStartTime;

  /// The source location name.
  final String? sourceLocationName;

  /// The tags assigned to the program. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name that's used to refer to a VOD source.
  final String? vodSourceName;

  DescribeProgramResponse({
    this.adBreaks,
    this.arn,
    this.audienceMedia,
    this.channelName,
    this.clipRange,
    this.creationTime,
    this.durationMillis,
    this.liveSourceName,
    this.programName,
    this.scheduledStartTime,
    this.sourceLocationName,
    this.tags,
    this.vodSourceName,
  });

  factory DescribeProgramResponse.fromJson(Map<String, dynamic> json) {
    return DescribeProgramResponse(
      adBreaks: (json['AdBreaks'] as List?)
          ?.nonNulls
          .map((e) => AdBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      audienceMedia: (json['AudienceMedia'] as List?)
          ?.nonNulls
          .map((e) => AudienceMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelName: json['ChannelName'] as String?,
      clipRange: json['ClipRange'] != null
          ? ClipRange.fromJson(json['ClipRange'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      durationMillis: json['DurationMillis'] as int?,
      liveSourceName: json['LiveSourceName'] as String?,
      programName: json['ProgramName'] as String?,
      scheduledStartTime: timeStampFromJson(json['ScheduledStartTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adBreaks = this.adBreaks;
    final arn = this.arn;
    final audienceMedia = this.audienceMedia;
    final channelName = this.channelName;
    final clipRange = this.clipRange;
    final creationTime = this.creationTime;
    final durationMillis = this.durationMillis;
    final liveSourceName = this.liveSourceName;
    final programName = this.programName;
    final scheduledStartTime = this.scheduledStartTime;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    final vodSourceName = this.vodSourceName;
    return {
      if (adBreaks != null) 'AdBreaks': adBreaks,
      if (arn != null) 'Arn': arn,
      if (audienceMedia != null) 'AudienceMedia': audienceMedia,
      if (channelName != null) 'ChannelName': channelName,
      if (clipRange != null) 'ClipRange': clipRange,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (programName != null) 'ProgramName': programName,
      if (scheduledStartTime != null)
        'ScheduledStartTime': unixTimestampToJson(scheduledStartTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class UpdateProgramResponse {
  /// The ad break configuration settings.
  final List<AdBreak>? adBreaks;

  /// The ARN to assign to the program.
  final String? arn;

  /// The list of AudienceMedia defined in program.
  final List<AudienceMedia>? audienceMedia;

  /// The name to assign to the channel for this program.
  final String? channelName;

  /// The clip range configuration settings.
  final ClipRange? clipRange;

  /// The time the program was created.
  final DateTime? creationTime;

  /// The duration of the live program in milliseconds.
  final int? durationMillis;

  /// The name of the LiveSource for this Program.
  final String? liveSourceName;

  /// The name to assign to this program.
  final String? programName;

  /// The scheduled start time for this Program.
  final DateTime? scheduledStartTime;

  /// The name to assign to the source location for this program.
  final String? sourceLocationName;

  /// The tags assigned to the program. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name that's used to refer to a VOD source.
  final String? vodSourceName;

  UpdateProgramResponse({
    this.adBreaks,
    this.arn,
    this.audienceMedia,
    this.channelName,
    this.clipRange,
    this.creationTime,
    this.durationMillis,
    this.liveSourceName,
    this.programName,
    this.scheduledStartTime,
    this.sourceLocationName,
    this.tags,
    this.vodSourceName,
  });

  factory UpdateProgramResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProgramResponse(
      adBreaks: (json['AdBreaks'] as List?)
          ?.nonNulls
          .map((e) => AdBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      audienceMedia: (json['AudienceMedia'] as List?)
          ?.nonNulls
          .map((e) => AudienceMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      channelName: json['ChannelName'] as String?,
      clipRange: json['ClipRange'] != null
          ? ClipRange.fromJson(json['ClipRange'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      durationMillis: json['DurationMillis'] as int?,
      liveSourceName: json['LiveSourceName'] as String?,
      programName: json['ProgramName'] as String?,
      scheduledStartTime: timeStampFromJson(json['ScheduledStartTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adBreaks = this.adBreaks;
    final arn = this.arn;
    final audienceMedia = this.audienceMedia;
    final channelName = this.channelName;
    final clipRange = this.clipRange;
    final creationTime = this.creationTime;
    final durationMillis = this.durationMillis;
    final liveSourceName = this.liveSourceName;
    final programName = this.programName;
    final scheduledStartTime = this.scheduledStartTime;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    final vodSourceName = this.vodSourceName;
    return {
      if (adBreaks != null) 'AdBreaks': adBreaks,
      if (arn != null) 'Arn': arn,
      if (audienceMedia != null) 'AudienceMedia': audienceMedia,
      if (channelName != null) 'ChannelName': channelName,
      if (clipRange != null) 'ClipRange': clipRange,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (programName != null) 'ProgramName': programName,
      if (scheduledStartTime != null)
        'ScheduledStartTime': unixTimestampToJson(scheduledStartTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class DeleteProgramResponse {
  DeleteProgramResponse();

  factory DeleteProgramResponse.fromJson(Map<String, dynamic> _) {
    return DeleteProgramResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// -- Define Mixin --
///
/// @nodoc
class PutFunctionResponse {
  /// The identifier of the function.
  final String functionId;

  /// The type of the function.
  final FunctionType functionType;

  /// The Amazon Resource Name (ARN) of the function.
  final String? arn;

  /// The configuration for a <code>CUSTOM_OUTPUT</code> function.
  final CustomOutputConfiguration? customOutputConfiguration;

  /// A description of the function.
  final String? description;

  /// The configuration for an <code>HTTP_REQUEST</code> function.
  final HttpRequestConfiguration? httpRequestConfiguration;

  /// The configuration for a <code>SEQUENTIAL_EXECUTOR</code> function.
  final SequentialExecutorConfiguration? sequentialExecutorConfiguration;

  /// The tags assigned to the function. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  PutFunctionResponse({
    required this.functionId,
    required this.functionType,
    this.arn,
    this.customOutputConfiguration,
    this.description,
    this.httpRequestConfiguration,
    this.sequentialExecutorConfiguration,
    this.tags,
  });

  factory PutFunctionResponse.fromJson(Map<String, dynamic> json) {
    return PutFunctionResponse(
      functionId: (json['FunctionId'] as String?) ?? '',
      functionType:
          FunctionType.fromString((json['FunctionType'] as String?) ?? ''),
      arn: json['Arn'] as String?,
      customOutputConfiguration: json['CustomOutputConfiguration'] != null
          ? CustomOutputConfiguration.fromJson(
              json['CustomOutputConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      httpRequestConfiguration: json['HttpRequestConfiguration'] != null
          ? HttpRequestConfiguration.fromJson(
              json['HttpRequestConfiguration'] as Map<String, dynamic>)
          : null,
      sequentialExecutorConfiguration:
          json['SequentialExecutorConfiguration'] != null
              ? SequentialExecutorConfiguration.fromJson(
                  json['SequentialExecutorConfiguration']
                      as Map<String, dynamic>)
              : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final functionId = this.functionId;
    final functionType = this.functionType;
    final arn = this.arn;
    final customOutputConfiguration = this.customOutputConfiguration;
    final description = this.description;
    final httpRequestConfiguration = this.httpRequestConfiguration;
    final sequentialExecutorConfiguration =
        this.sequentialExecutorConfiguration;
    final tags = this.tags;
    return {
      'FunctionId': functionId,
      'FunctionType': functionType.value,
      if (arn != null) 'Arn': arn,
      if (customOutputConfiguration != null)
        'CustomOutputConfiguration': customOutputConfiguration,
      if (description != null) 'Description': description,
      if (httpRequestConfiguration != null)
        'HttpRequestConfiguration': httpRequestConfiguration,
      if (sequentialExecutorConfiguration != null)
        'SequentialExecutorConfiguration': sequentialExecutorConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// -- Define Mixin --
///
/// @nodoc
class GetFunctionResponse {
  /// The identifier of the function.
  final String functionId;

  /// The type of the function.
  final FunctionType functionType;

  /// The Amazon Resource Name (ARN) of the function.
  final String? arn;

  /// The configuration for a <code>CUSTOM_OUTPUT</code> function.
  final CustomOutputConfiguration? customOutputConfiguration;

  /// A description of the function.
  final String? description;

  /// The configuration for an <code>HTTP_REQUEST</code> function.
  final HttpRequestConfiguration? httpRequestConfiguration;

  /// The configuration for a <code>SEQUENTIAL_EXECUTOR</code> function.
  final SequentialExecutorConfiguration? sequentialExecutorConfiguration;

  /// The tags assigned to the function. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  GetFunctionResponse({
    required this.functionId,
    required this.functionType,
    this.arn,
    this.customOutputConfiguration,
    this.description,
    this.httpRequestConfiguration,
    this.sequentialExecutorConfiguration,
    this.tags,
  });

  factory GetFunctionResponse.fromJson(Map<String, dynamic> json) {
    return GetFunctionResponse(
      functionId: (json['FunctionId'] as String?) ?? '',
      functionType:
          FunctionType.fromString((json['FunctionType'] as String?) ?? ''),
      arn: json['Arn'] as String?,
      customOutputConfiguration: json['CustomOutputConfiguration'] != null
          ? CustomOutputConfiguration.fromJson(
              json['CustomOutputConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      httpRequestConfiguration: json['HttpRequestConfiguration'] != null
          ? HttpRequestConfiguration.fromJson(
              json['HttpRequestConfiguration'] as Map<String, dynamic>)
          : null,
      sequentialExecutorConfiguration:
          json['SequentialExecutorConfiguration'] != null
              ? SequentialExecutorConfiguration.fromJson(
                  json['SequentialExecutorConfiguration']
                      as Map<String, dynamic>)
              : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final functionId = this.functionId;
    final functionType = this.functionType;
    final arn = this.arn;
    final customOutputConfiguration = this.customOutputConfiguration;
    final description = this.description;
    final httpRequestConfiguration = this.httpRequestConfiguration;
    final sequentialExecutorConfiguration =
        this.sequentialExecutorConfiguration;
    final tags = this.tags;
    return {
      'FunctionId': functionId,
      'FunctionType': functionType.value,
      if (arn != null) 'Arn': arn,
      if (customOutputConfiguration != null)
        'CustomOutputConfiguration': customOutputConfiguration,
      if (description != null) 'Description': description,
      if (httpRequestConfiguration != null)
        'HttpRequestConfiguration': httpRequestConfiguration,
      if (sequentialExecutorConfiguration != null)
        'SequentialExecutorConfiguration': sequentialExecutorConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteFunctionResponse {
  DeleteFunctionResponse();

  factory DeleteFunctionResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFunctionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListFunctionsResponse {
  /// A list of functions associated with your account in the current Region.
  final List<$Function>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  ///
  /// For the first <code>ListFunctions</code> request, omit this value. For
  /// subsequent requests, get the value of <code>NextToken</code> from the
  /// previous response and specify that value for <code>NextToken</code> in the
  /// request. Continue making requests until the response no longer includes a
  /// <code>NextToken</code> value, which indicates that all results have been
  /// retrieved.
  final String? nextToken;

  ListFunctionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListFunctionsResponse.fromJson(Map<String, dynamic> json) {
    return ListFunctionsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => $Function.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateLiveSourceResponse {
  /// The ARN to assign to the live source.
  final String? arn;

  /// The time the live source was created.
  final DateTime? creationTime;

  /// A list of HTTP package configuration parameters for this live source.
  final List<HttpPackageConfiguration>? httpPackageConfigurations;

  /// The time the live source was last modified.
  final DateTime? lastModifiedTime;

  /// The name to assign to the live source.
  final String? liveSourceName;

  /// The name to assign to the source location of the live source.
  final String? sourceLocationName;

  /// The tags to assign to the live source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  CreateLiveSourceResponse({
    this.arn,
    this.creationTime,
    this.httpPackageConfigurations,
    this.lastModifiedTime,
    this.liveSourceName,
    this.sourceLocationName,
    this.tags,
  });

  factory CreateLiveSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateLiveSourceResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpPackageConfigurations: (json['HttpPackageConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      liveSourceName: json['LiveSourceName'] as String?,
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final lastModifiedTime = this.lastModifiedTime;
    final liveSourceName = this.liveSourceName;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpPackageConfigurations != null)
        'HttpPackageConfigurations': httpPackageConfigurations,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DescribeLiveSourceResponse {
  /// The ARN of the live source.
  final String? arn;

  /// The timestamp that indicates when the live source was created.
  final DateTime? creationTime;

  /// The HTTP package configurations.
  final List<HttpPackageConfiguration>? httpPackageConfigurations;

  /// The timestamp that indicates when the live source was modified.
  final DateTime? lastModifiedTime;

  /// The name of the live source.
  final String? liveSourceName;

  /// The name of the source location associated with the live source.
  final String? sourceLocationName;

  /// The tags assigned to the live source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  DescribeLiveSourceResponse({
    this.arn,
    this.creationTime,
    this.httpPackageConfigurations,
    this.lastModifiedTime,
    this.liveSourceName,
    this.sourceLocationName,
    this.tags,
  });

  factory DescribeLiveSourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeLiveSourceResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpPackageConfigurations: (json['HttpPackageConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      liveSourceName: json['LiveSourceName'] as String?,
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final lastModifiedTime = this.lastModifiedTime;
    final liveSourceName = this.liveSourceName;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpPackageConfigurations != null)
        'HttpPackageConfigurations': httpPackageConfigurations,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateLiveSourceResponse {
  /// The Amazon Resource Name (ARN) associated with this live source.
  final String? arn;

  /// The timestamp that indicates when the live source was created.
  final DateTime? creationTime;

  /// A list of HTTP package configurations for the live source on this account.
  final List<HttpPackageConfiguration>? httpPackageConfigurations;

  /// The timestamp that indicates when the live source was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the live source.
  final String? liveSourceName;

  /// The name of the source location associated with the live source.
  final String? sourceLocationName;

  /// The tags to assign to the live source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  UpdateLiveSourceResponse({
    this.arn,
    this.creationTime,
    this.httpPackageConfigurations,
    this.lastModifiedTime,
    this.liveSourceName,
    this.sourceLocationName,
    this.tags,
  });

  factory UpdateLiveSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateLiveSourceResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpPackageConfigurations: (json['HttpPackageConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      liveSourceName: json['LiveSourceName'] as String?,
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final lastModifiedTime = this.lastModifiedTime;
    final liveSourceName = this.liveSourceName;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpPackageConfigurations != null)
        'HttpPackageConfigurations': httpPackageConfigurations,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteLiveSourceResponse {
  DeleteLiveSourceResponse();

  factory DeleteLiveSourceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLiveSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListLiveSourcesResponse {
  /// Lists the live sources.
  final List<LiveSource>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListLiveSourcesResponse({
    this.items,
    this.nextToken,
  });

  factory ListLiveSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListLiveSourcesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => LiveSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class PutPlaybackConfigurationResponse {
  /// The setting that indicates what conditioning MediaTailor will perform on ads
  /// that the ad decision server (ADS) returns, and what priority MediaTailor
  /// uses when inserting ads.
  final AdConditioningConfiguration? adConditioningConfiguration;

  /// The configuration for customizing HTTP requests to the ad decision server
  /// (ADS). This includes settings for request method, headers, body content, and
  /// compression options.
  final AdDecisionServerConfiguration? adDecisionServerConfiguration;

  /// The URL for the ad decision server (ADS). This includes the specification of
  /// static parameters and placeholders for dynamic parameters. AWS Elemental
  /// MediaTailor substitutes player-specific and session-specific parameters as
  /// needed when calling the ADS. Alternately, for testing you can provide a
  /// static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The configuration for avail suppression, also known as ad suppression. For
  /// more information about ad suppression, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Suppression</a>.
  final AvailSuppression? availSuppression;

  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break. To learn more about
  /// bumpers, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/bumpers.html">Bumpers</a>.
  final Bumper? bumper;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration? cdnConfiguration;

  /// The player parameters and aliases used as dynamic variables during session
  /// initialization. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/variables-domains.html">Domain
  /// Variables</a>.
  final Map<String, Map<String, String>>? configurationAliases;

  /// The configuration for DASH content.
  final DashConfiguration? dashConfiguration;

  /// A map of lifecycle hook event names to function identifiers. The function
  /// mapping specifies which function MediaTailor executes at each lifecycle hook
  /// during ad insertion. Valid keys are <code>PRE_SESSION_INITIALIZATION</code>
  /// and <code>PRE_ADS_REQUEST</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-hooks.html">Functions
  /// lifecycle hooks</a> in the <i>MediaTailor User Guide</i>.
  final Map<EventName, String>? functionMapping;

  /// The configuration for HLS content.
  final HlsConfiguration? hlsConfiguration;

  /// The setting that controls whether players can use stitched or guided ad
  /// insertion. The default, <code>STITCHED_ONLY</code>, forces all player
  /// sessions to use stitched (server-side) ad insertion. Choosing
  /// <code>PLAYER_SELECT</code> allows players to select either stitched or
  /// guided ad insertion at session-initialization time. The default for players
  /// that do not specify an insertion mode is stitched.
  final InsertionMode? insertionMode;

  /// The configuration for pre-roll ad insertion.
  final LivePreRollConfiguration? livePreRollConfiguration;

  /// The configuration that defines where AWS Elemental MediaTailor sends logs
  /// for the playback configuration.
  final LogConfiguration? logConfiguration;

  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  final ManifestProcessingRules? manifestProcessingRules;

  /// The identifier for the playback configuration.
  final String? name;

  /// Defines the maximum duration of underfilled ad time (in seconds) allowed in
  /// an ad break. If the duration of underfilled ad time exceeds the
  /// personalization threshold, then the personalization of the ad break is
  /// abandoned and the underlying content is shown. This feature applies to <i>ad
  /// replacement</i> in live and VOD streams, rather than ad insertion, because
  /// it relies on an underlying content stream. For more information about ad
  /// break behavior, including ad replacement and insertion, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Behavior in AWS Elemental MediaTailor</a>.
  final int? personalizationThresholdSeconds;

  /// The Amazon Resource Name (ARN) associated with the playback configuration.
  final String? playbackConfigurationArn;

  /// The playback endpoint prefix associated with the playback configuration.
  final String? playbackEndpointPrefix;

  /// The session initialization endpoint prefix associated with the playback
  /// configuration.
  final String? sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in time
  /// that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in
  /// gaps in media content. Configuring the slate is optional for non-VPAID
  /// configurations. For VPAID, the slate is required because MediaTailor
  /// provides it in the slots that are designated for dynamic ad content. The
  /// slate must be a high-quality asset that contains both audio and video.
  final String? slateAdUrl;

  /// The tags to assign to the playback configuration. Tags are key-value pairs
  /// that you can associate with Amazon resources to help with organization,
  /// access control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name that is used to associate this playback configuration with a custom
  /// transcode profile. This overrides the dynamic transcoding defaults of
  /// MediaTailor. Use this only if you have already set up custom profiles with
  /// the help of AWS Support.
  final String? transcodeProfileName;

  /// The URL prefix for the parent manifest for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String? videoContentSourceUrl;

  PutPlaybackConfigurationResponse({
    this.adConditioningConfiguration,
    this.adDecisionServerConfiguration,
    this.adDecisionServerUrl,
    this.availSuppression,
    this.bumper,
    this.cdnConfiguration,
    this.configurationAliases,
    this.dashConfiguration,
    this.functionMapping,
    this.hlsConfiguration,
    this.insertionMode,
    this.livePreRollConfiguration,
    this.logConfiguration,
    this.manifestProcessingRules,
    this.name,
    this.personalizationThresholdSeconds,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });

  factory PutPlaybackConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutPlaybackConfigurationResponse(
      adConditioningConfiguration: json['AdConditioningConfiguration'] != null
          ? AdConditioningConfiguration.fromJson(
              json['AdConditioningConfiguration'] as Map<String, dynamic>)
          : null,
      adDecisionServerConfiguration:
          json['AdDecisionServerConfiguration'] != null
              ? AdDecisionServerConfiguration.fromJson(
                  json['AdDecisionServerConfiguration'] as Map<String, dynamic>)
              : null,
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      availSuppression: json['AvailSuppression'] != null
          ? AvailSuppression.fromJson(
              json['AvailSuppression'] as Map<String, dynamic>)
          : null,
      bumper: json['Bumper'] != null
          ? Bumper.fromJson(json['Bumper'] as Map<String, dynamic>)
          : null,
      cdnConfiguration: json['CdnConfiguration'] != null
          ? CdnConfiguration.fromJson(
              json['CdnConfiguration'] as Map<String, dynamic>)
          : null,
      configurationAliases:
          (json['ConfigurationAliases'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  (e as Map<String, dynamic>)
                      .map((k, e) => MapEntry(k, e as String)))),
      dashConfiguration: json['DashConfiguration'] != null
          ? DashConfiguration.fromJson(
              json['DashConfiguration'] as Map<String, dynamic>)
          : null,
      functionMapping: (json['FunctionMapping'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(EventName.fromString(k), e as String)),
      hlsConfiguration: json['HlsConfiguration'] != null
          ? HlsConfiguration.fromJson(
              json['HlsConfiguration'] as Map<String, dynamic>)
          : null,
      insertionMode:
          (json['InsertionMode'] as String?)?.let(InsertionMode.fromString),
      livePreRollConfiguration: json['LivePreRollConfiguration'] != null
          ? LivePreRollConfiguration.fromJson(
              json['LivePreRollConfiguration'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['LogConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      manifestProcessingRules: json['ManifestProcessingRules'] != null
          ? ManifestProcessingRules.fromJson(
              json['ManifestProcessingRules'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      personalizationThresholdSeconds:
          json['PersonalizationThresholdSeconds'] as int?,
      playbackConfigurationArn: json['PlaybackConfigurationArn'] as String?,
      playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String?,
      sessionInitializationEndpointPrefix:
          json['SessionInitializationEndpointPrefix'] as String?,
      slateAdUrl: json['SlateAdUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transcodeProfileName: json['TranscodeProfileName'] as String?,
      videoContentSourceUrl: json['VideoContentSourceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adConditioningConfiguration = this.adConditioningConfiguration;
    final adDecisionServerConfiguration = this.adDecisionServerConfiguration;
    final adDecisionServerUrl = this.adDecisionServerUrl;
    final availSuppression = this.availSuppression;
    final bumper = this.bumper;
    final cdnConfiguration = this.cdnConfiguration;
    final configurationAliases = this.configurationAliases;
    final dashConfiguration = this.dashConfiguration;
    final functionMapping = this.functionMapping;
    final hlsConfiguration = this.hlsConfiguration;
    final insertionMode = this.insertionMode;
    final livePreRollConfiguration = this.livePreRollConfiguration;
    final logConfiguration = this.logConfiguration;
    final manifestProcessingRules = this.manifestProcessingRules;
    final name = this.name;
    final personalizationThresholdSeconds =
        this.personalizationThresholdSeconds;
    final playbackConfigurationArn = this.playbackConfigurationArn;
    final playbackEndpointPrefix = this.playbackEndpointPrefix;
    final sessionInitializationEndpointPrefix =
        this.sessionInitializationEndpointPrefix;
    final slateAdUrl = this.slateAdUrl;
    final tags = this.tags;
    final transcodeProfileName = this.transcodeProfileName;
    final videoContentSourceUrl = this.videoContentSourceUrl;
    return {
      if (adConditioningConfiguration != null)
        'AdConditioningConfiguration': adConditioningConfiguration,
      if (adDecisionServerConfiguration != null)
        'AdDecisionServerConfiguration': adDecisionServerConfiguration,
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (availSuppression != null) 'AvailSuppression': availSuppression,
      if (bumper != null) 'Bumper': bumper,
      if (cdnConfiguration != null) 'CdnConfiguration': cdnConfiguration,
      if (configurationAliases != null)
        'ConfigurationAliases': configurationAliases,
      if (dashConfiguration != null) 'DashConfiguration': dashConfiguration,
      if (functionMapping != null)
        'FunctionMapping': functionMapping.map((k, e) => MapEntry(k.value, e)),
      if (hlsConfiguration != null) 'HlsConfiguration': hlsConfiguration,
      if (insertionMode != null) 'InsertionMode': insertionMode.value,
      if (livePreRollConfiguration != null)
        'LivePreRollConfiguration': livePreRollConfiguration,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (manifestProcessingRules != null)
        'ManifestProcessingRules': manifestProcessingRules,
      if (name != null) 'Name': name,
      if (personalizationThresholdSeconds != null)
        'PersonalizationThresholdSeconds': personalizationThresholdSeconds,
      if (playbackConfigurationArn != null)
        'PlaybackConfigurationArn': playbackConfigurationArn,
      if (playbackEndpointPrefix != null)
        'PlaybackEndpointPrefix': playbackEndpointPrefix,
      if (sessionInitializationEndpointPrefix != null)
        'SessionInitializationEndpointPrefix':
            sessionInitializationEndpointPrefix,
      if (slateAdUrl != null) 'SlateAdUrl': slateAdUrl,
      if (tags != null) 'tags': tags,
      if (transcodeProfileName != null)
        'TranscodeProfileName': transcodeProfileName,
      if (videoContentSourceUrl != null)
        'VideoContentSourceUrl': videoContentSourceUrl,
    };
  }
}

/// @nodoc
class GetPlaybackConfigurationResponse {
  /// The setting that indicates what conditioning MediaTailor will perform on ads
  /// that the ad decision server (ADS) returns, and what priority MediaTailor
  /// uses when inserting ads.
  final AdConditioningConfiguration? adConditioningConfiguration;

  /// The configuration for customizing HTTP requests to the ad decision server
  /// (ADS). This includes settings for request method, headers, body content, and
  /// compression options.
  final AdDecisionServerConfiguration? adDecisionServerConfiguration;

  /// The URL for the ad decision server (ADS). This includes the specification of
  /// static parameters and placeholders for dynamic parameters. AWS Elemental
  /// MediaTailor substitutes player-specific and session-specific parameters as
  /// needed when calling the ADS. Alternately, for testing, you can provide a
  /// static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The configuration for avail suppression, also known as ad suppression. For
  /// more information about ad suppression, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Suppression</a>.
  final AvailSuppression? availSuppression;

  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break. To learn more about
  /// bumpers, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/bumpers.html">Bumpers</a>.
  final Bumper? bumper;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration? cdnConfiguration;

  /// The player parameters and aliases used as dynamic variables during session
  /// initialization. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/variables-domains.html">Domain
  /// Variables</a>.
  final Map<String, Map<String, String>>? configurationAliases;

  /// The configuration for DASH content.
  final DashConfiguration? dashConfiguration;

  /// A map of lifecycle hook event names to function identifiers. The function
  /// mapping specifies which function MediaTailor executes at each lifecycle hook
  /// during ad insertion. Valid keys are <code>PRE_SESSION_INITIALIZATION</code>
  /// and <code>PRE_ADS_REQUEST</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-hooks.html">Functions
  /// lifecycle hooks</a> in the <i>MediaTailor User Guide</i>.
  final Map<EventName, String>? functionMapping;

  /// The configuration for HLS content.
  final HlsConfiguration? hlsConfiguration;

  /// The setting that controls whether players can use stitched or guided ad
  /// insertion. The default, <code>STITCHED_ONLY</code>, forces all player
  /// sessions to use stitched (server-side) ad insertion. Choosing
  /// <code>PLAYER_SELECT</code> allows players to select either stitched or
  /// guided ad insertion at session-initialization time. The default for players
  /// that do not specify an insertion mode is stitched.
  final InsertionMode? insertionMode;

  /// The configuration for pre-roll ad insertion.
  final LivePreRollConfiguration? livePreRollConfiguration;

  /// The configuration that defines where AWS Elemental MediaTailor sends logs
  /// for the playback configuration.
  final LogConfiguration? logConfiguration;

  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  final ManifestProcessingRules? manifestProcessingRules;

  /// The identifier for the playback configuration.
  final String? name;

  /// Defines the maximum duration of underfilled ad time (in seconds) allowed in
  /// an ad break. If the duration of underfilled ad time exceeds the
  /// personalization threshold, then the personalization of the ad break is
  /// abandoned and the underlying content is shown. This feature applies to <i>ad
  /// replacement</i> in live and VOD streams, rather than ad insertion, because
  /// it relies on an underlying content stream. For more information about ad
  /// break behavior, including ad replacement and insertion, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Behavior in AWS Elemental MediaTailor</a>.
  final int? personalizationThresholdSeconds;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String? playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor. This session will use server-side reporting.
  final String? playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String? sessionInitializationEndpointPrefix;

  /// The URL for a high-quality video asset to transcode and use to fill in time
  /// that's not used by ads. AWS Elemental MediaTailor shows the slate to fill in
  /// gaps in media content. Configuring the slate is optional for non-VPAID
  /// playback configurations. For VPAID, the slate is required because
  /// MediaTailor provides it in the slots designated for dynamic ad content. The
  /// slate must be a high-quality asset that contains both audio and video.
  final String? slateAdUrl;

  /// The tags assigned to the playback configuration. Tags are key-value pairs
  /// that you can associate with Amazon resources to help with organization,
  /// access control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name that is used to associate this playback configuration with a custom
  /// transcode profile. This overrides the dynamic transcoding defaults of
  /// MediaTailor. Use this only if you have already set up custom profiles with
  /// the help of AWS Support.
  final String? transcodeProfileName;

  /// The URL prefix for the parent manifest for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String? videoContentSourceUrl;

  GetPlaybackConfigurationResponse({
    this.adConditioningConfiguration,
    this.adDecisionServerConfiguration,
    this.adDecisionServerUrl,
    this.availSuppression,
    this.bumper,
    this.cdnConfiguration,
    this.configurationAliases,
    this.dashConfiguration,
    this.functionMapping,
    this.hlsConfiguration,
    this.insertionMode,
    this.livePreRollConfiguration,
    this.logConfiguration,
    this.manifestProcessingRules,
    this.name,
    this.personalizationThresholdSeconds,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });

  factory GetPlaybackConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetPlaybackConfigurationResponse(
      adConditioningConfiguration: json['AdConditioningConfiguration'] != null
          ? AdConditioningConfiguration.fromJson(
              json['AdConditioningConfiguration'] as Map<String, dynamic>)
          : null,
      adDecisionServerConfiguration:
          json['AdDecisionServerConfiguration'] != null
              ? AdDecisionServerConfiguration.fromJson(
                  json['AdDecisionServerConfiguration'] as Map<String, dynamic>)
              : null,
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      availSuppression: json['AvailSuppression'] != null
          ? AvailSuppression.fromJson(
              json['AvailSuppression'] as Map<String, dynamic>)
          : null,
      bumper: json['Bumper'] != null
          ? Bumper.fromJson(json['Bumper'] as Map<String, dynamic>)
          : null,
      cdnConfiguration: json['CdnConfiguration'] != null
          ? CdnConfiguration.fromJson(
              json['CdnConfiguration'] as Map<String, dynamic>)
          : null,
      configurationAliases:
          (json['ConfigurationAliases'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  (e as Map<String, dynamic>)
                      .map((k, e) => MapEntry(k, e as String)))),
      dashConfiguration: json['DashConfiguration'] != null
          ? DashConfiguration.fromJson(
              json['DashConfiguration'] as Map<String, dynamic>)
          : null,
      functionMapping: (json['FunctionMapping'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(EventName.fromString(k), e as String)),
      hlsConfiguration: json['HlsConfiguration'] != null
          ? HlsConfiguration.fromJson(
              json['HlsConfiguration'] as Map<String, dynamic>)
          : null,
      insertionMode:
          (json['InsertionMode'] as String?)?.let(InsertionMode.fromString),
      livePreRollConfiguration: json['LivePreRollConfiguration'] != null
          ? LivePreRollConfiguration.fromJson(
              json['LivePreRollConfiguration'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['LogConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      manifestProcessingRules: json['ManifestProcessingRules'] != null
          ? ManifestProcessingRules.fromJson(
              json['ManifestProcessingRules'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      personalizationThresholdSeconds:
          json['PersonalizationThresholdSeconds'] as int?,
      playbackConfigurationArn: json['PlaybackConfigurationArn'] as String?,
      playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String?,
      sessionInitializationEndpointPrefix:
          json['SessionInitializationEndpointPrefix'] as String?,
      slateAdUrl: json['SlateAdUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transcodeProfileName: json['TranscodeProfileName'] as String?,
      videoContentSourceUrl: json['VideoContentSourceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adConditioningConfiguration = this.adConditioningConfiguration;
    final adDecisionServerConfiguration = this.adDecisionServerConfiguration;
    final adDecisionServerUrl = this.adDecisionServerUrl;
    final availSuppression = this.availSuppression;
    final bumper = this.bumper;
    final cdnConfiguration = this.cdnConfiguration;
    final configurationAliases = this.configurationAliases;
    final dashConfiguration = this.dashConfiguration;
    final functionMapping = this.functionMapping;
    final hlsConfiguration = this.hlsConfiguration;
    final insertionMode = this.insertionMode;
    final livePreRollConfiguration = this.livePreRollConfiguration;
    final logConfiguration = this.logConfiguration;
    final manifestProcessingRules = this.manifestProcessingRules;
    final name = this.name;
    final personalizationThresholdSeconds =
        this.personalizationThresholdSeconds;
    final playbackConfigurationArn = this.playbackConfigurationArn;
    final playbackEndpointPrefix = this.playbackEndpointPrefix;
    final sessionInitializationEndpointPrefix =
        this.sessionInitializationEndpointPrefix;
    final slateAdUrl = this.slateAdUrl;
    final tags = this.tags;
    final transcodeProfileName = this.transcodeProfileName;
    final videoContentSourceUrl = this.videoContentSourceUrl;
    return {
      if (adConditioningConfiguration != null)
        'AdConditioningConfiguration': adConditioningConfiguration,
      if (adDecisionServerConfiguration != null)
        'AdDecisionServerConfiguration': adDecisionServerConfiguration,
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (availSuppression != null) 'AvailSuppression': availSuppression,
      if (bumper != null) 'Bumper': bumper,
      if (cdnConfiguration != null) 'CdnConfiguration': cdnConfiguration,
      if (configurationAliases != null)
        'ConfigurationAliases': configurationAliases,
      if (dashConfiguration != null) 'DashConfiguration': dashConfiguration,
      if (functionMapping != null)
        'FunctionMapping': functionMapping.map((k, e) => MapEntry(k.value, e)),
      if (hlsConfiguration != null) 'HlsConfiguration': hlsConfiguration,
      if (insertionMode != null) 'InsertionMode': insertionMode.value,
      if (livePreRollConfiguration != null)
        'LivePreRollConfiguration': livePreRollConfiguration,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (manifestProcessingRules != null)
        'ManifestProcessingRules': manifestProcessingRules,
      if (name != null) 'Name': name,
      if (personalizationThresholdSeconds != null)
        'PersonalizationThresholdSeconds': personalizationThresholdSeconds,
      if (playbackConfigurationArn != null)
        'PlaybackConfigurationArn': playbackConfigurationArn,
      if (playbackEndpointPrefix != null)
        'PlaybackEndpointPrefix': playbackEndpointPrefix,
      if (sessionInitializationEndpointPrefix != null)
        'SessionInitializationEndpointPrefix':
            sessionInitializationEndpointPrefix,
      if (slateAdUrl != null) 'SlateAdUrl': slateAdUrl,
      if (tags != null) 'tags': tags,
      if (transcodeProfileName != null)
        'TranscodeProfileName': transcodeProfileName,
      if (videoContentSourceUrl != null)
        'VideoContentSourceUrl': videoContentSourceUrl,
    };
  }
}

/// @nodoc
class DeletePlaybackConfigurationResponse {
  DeletePlaybackConfigurationResponse();

  factory DeletePlaybackConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeletePlaybackConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListPlaybackConfigurationsResponse {
  /// Array of playback configurations. This might be all the available
  /// configurations or a subset, depending on the settings that you provide and
  /// the total number of configurations stored.
  final List<PlaybackConfiguration>? items;

  /// Pagination token returned by the GET list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListPlaybackConfigurationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListPlaybackConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPlaybackConfigurationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => PlaybackConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreatePrefetchScheduleResponse {
  /// The ARN to assign to the prefetch schedule.
  final String? arn;

  /// The configuration settings for how and when MediaTailor consumes prefetched
  /// ads from the ad decision server for single prefetch schedules. Each
  /// consumption configuration contains an end time and an optional start time
  /// that define the <i>consumption window</i>. Prefetch schedules automatically
  /// expire no earlier than seven days after the end time.
  final PrefetchConsumption? consumption;

  /// The name to assign to the prefetch schedule.
  final String? name;

  /// The name to assign to the playback configuration.
  final String? playbackConfigurationName;

  /// The configuration that defines how MediaTailor performs recurring prefetch.
  final RecurringPrefetchConfiguration? recurringPrefetchConfiguration;

  /// The configuration settings for retrieval of prefetched ads from the ad
  /// decision server. Only one set of prefetched ads will be retrieved and
  /// subsequently consumed for each ad break.
  final PrefetchRetrieval? retrieval;

  /// The frequency that MediaTailor creates prefetch schedules.
  /// <code>SINGLE</code> indicates that this schedule applies to one ad break.
  /// <code>RECURRING</code> indicates that MediaTailor automatically creates a
  /// schedule for each ad avail in a live event.
  final PrefetchScheduleType? scheduleType;

  /// An optional stream identifier that MediaTailor uses to prefetch ads for
  /// multiple streams that use the same playback configuration. If
  /// <code>StreamId</code> is specified, MediaTailor returns all of the prefetch
  /// schedules with an exact match on <code>StreamId</code>. If not specified,
  /// MediaTailor returns all of the prefetch schedules for the playback
  /// configuration, regardless of <code>StreamId</code>.
  final String? streamId;

  /// The tags assigned to the prefetch schedule. Tags are key-value pairs that
  /// you can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  CreatePrefetchScheduleResponse({
    this.arn,
    this.consumption,
    this.name,
    this.playbackConfigurationName,
    this.recurringPrefetchConfiguration,
    this.retrieval,
    this.scheduleType,
    this.streamId,
    this.tags,
  });

  factory CreatePrefetchScheduleResponse.fromJson(Map<String, dynamic> json) {
    return CreatePrefetchScheduleResponse(
      arn: json['Arn'] as String?,
      consumption: json['Consumption'] != null
          ? PrefetchConsumption.fromJson(
              json['Consumption'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      playbackConfigurationName: json['PlaybackConfigurationName'] as String?,
      recurringPrefetchConfiguration: json['RecurringPrefetchConfiguration'] !=
              null
          ? RecurringPrefetchConfiguration.fromJson(
              json['RecurringPrefetchConfiguration'] as Map<String, dynamic>)
          : null,
      retrieval: json['Retrieval'] != null
          ? PrefetchRetrieval.fromJson(
              json['Retrieval'] as Map<String, dynamic>)
          : null,
      scheduleType: (json['ScheduleType'] as String?)
          ?.let(PrefetchScheduleType.fromString),
      streamId: json['StreamId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final consumption = this.consumption;
    final name = this.name;
    final playbackConfigurationName = this.playbackConfigurationName;
    final recurringPrefetchConfiguration = this.recurringPrefetchConfiguration;
    final retrieval = this.retrieval;
    final scheduleType = this.scheduleType;
    final streamId = this.streamId;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (consumption != null) 'Consumption': consumption,
      if (name != null) 'Name': name,
      if (playbackConfigurationName != null)
        'PlaybackConfigurationName': playbackConfigurationName,
      if (recurringPrefetchConfiguration != null)
        'RecurringPrefetchConfiguration': recurringPrefetchConfiguration,
      if (retrieval != null) 'Retrieval': retrieval,
      if (scheduleType != null) 'ScheduleType': scheduleType.value,
      if (streamId != null) 'StreamId': streamId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class GetPrefetchScheduleResponse {
  /// The Amazon Resource Name (ARN) of the prefetch schedule.
  final String? arn;

  /// The configuration settings for how and when MediaTailor consumes prefetched
  /// ads from the ad decision server for single prefetch schedules. Each
  /// consumption configuration contains an end time and an optional start time
  /// that define the <i>consumption window</i>. Prefetch schedules automatically
  /// expire no earlier than seven days after the end time.
  final PrefetchConsumption? consumption;

  /// The name of the prefetch schedule. The name must be unique among all
  /// prefetch schedules that are associated with the specified playback
  /// configuration.
  final String? name;

  /// The name of the playback configuration to create the prefetch schedule for.
  final String? playbackConfigurationName;

  /// The configuration that defines how and when MediaTailor performs ad
  /// prefetching in a live event.
  final RecurringPrefetchConfiguration? recurringPrefetchConfiguration;

  /// A complex type that contains settings for prefetch retrieval from the ad
  /// decision server (ADS).
  final PrefetchRetrieval? retrieval;

  /// The frequency that MediaTailor creates prefetch schedules.
  /// <code>SINGLE</code> indicates that this schedule applies to one ad break.
  /// <code>RECURRING</code> indicates that MediaTailor automatically creates a
  /// schedule for each ad avail in a live event.
  final PrefetchScheduleType? scheduleType;

  /// An optional stream identifier that you can specify in order to prefetch for
  /// multiple streams that use the same playback configuration.
  final String? streamId;

  /// The tags assigned to the prefetch schedule. Tags are key-value pairs that
  /// you can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  GetPrefetchScheduleResponse({
    this.arn,
    this.consumption,
    this.name,
    this.playbackConfigurationName,
    this.recurringPrefetchConfiguration,
    this.retrieval,
    this.scheduleType,
    this.streamId,
    this.tags,
  });

  factory GetPrefetchScheduleResponse.fromJson(Map<String, dynamic> json) {
    return GetPrefetchScheduleResponse(
      arn: json['Arn'] as String?,
      consumption: json['Consumption'] != null
          ? PrefetchConsumption.fromJson(
              json['Consumption'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      playbackConfigurationName: json['PlaybackConfigurationName'] as String?,
      recurringPrefetchConfiguration: json['RecurringPrefetchConfiguration'] !=
              null
          ? RecurringPrefetchConfiguration.fromJson(
              json['RecurringPrefetchConfiguration'] as Map<String, dynamic>)
          : null,
      retrieval: json['Retrieval'] != null
          ? PrefetchRetrieval.fromJson(
              json['Retrieval'] as Map<String, dynamic>)
          : null,
      scheduleType: (json['ScheduleType'] as String?)
          ?.let(PrefetchScheduleType.fromString),
      streamId: json['StreamId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final consumption = this.consumption;
    final name = this.name;
    final playbackConfigurationName = this.playbackConfigurationName;
    final recurringPrefetchConfiguration = this.recurringPrefetchConfiguration;
    final retrieval = this.retrieval;
    final scheduleType = this.scheduleType;
    final streamId = this.streamId;
    final tags = this.tags;
    return {
      if (arn != null) 'Arn': arn,
      if (consumption != null) 'Consumption': consumption,
      if (name != null) 'Name': name,
      if (playbackConfigurationName != null)
        'PlaybackConfigurationName': playbackConfigurationName,
      if (recurringPrefetchConfiguration != null)
        'RecurringPrefetchConfiguration': recurringPrefetchConfiguration,
      if (retrieval != null) 'Retrieval': retrieval,
      if (scheduleType != null) 'ScheduleType': scheduleType.value,
      if (streamId != null) 'StreamId': streamId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeletePrefetchScheduleResponse {
  DeletePrefetchScheduleResponse();

  factory DeletePrefetchScheduleResponse.fromJson(Map<String, dynamic> _) {
    return DeletePrefetchScheduleResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListPrefetchSchedulesResponse {
  /// Lists the prefetch schedules. An empty <code>Items</code> list doesn't mean
  /// there aren't more items to fetch, just that that page was empty.
  final List<PrefetchSchedule>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListPrefetchSchedulesResponse({
    this.items,
    this.nextToken,
  });

  factory ListPrefetchSchedulesResponse.fromJson(Map<String, dynamic> json) {
    return ListPrefetchSchedulesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => PrefetchSchedule.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateSourceLocationResponse {
  /// Access configuration parameters. Configures the type of authentication used
  /// to access content from your source location.
  final AccessConfiguration? accessConfiguration;

  /// The ARN to assign to the source location.
  final String? arn;

  /// The time the source location was created.
  final DateTime? creationTime;

  /// The optional configuration for the server that serves segments.
  final DefaultSegmentDeliveryConfiguration?
      defaultSegmentDeliveryConfiguration;

  /// The source's HTTP package configurations.
  final HttpConfiguration? httpConfiguration;

  /// The time the source location was last modified.
  final DateTime? lastModifiedTime;

  /// The segment delivery configurations for the source location. For information
  /// about MediaTailor configurations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
  /// with configurations in AWS Elemental MediaTailor</a>.
  final List<SegmentDeliveryConfiguration>? segmentDeliveryConfigurations;

  /// The name to assign to the source location.
  final String? sourceLocationName;

  /// The tags to assign to the source location. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  CreateSourceLocationResponse({
    this.accessConfiguration,
    this.arn,
    this.creationTime,
    this.defaultSegmentDeliveryConfiguration,
    this.httpConfiguration,
    this.lastModifiedTime,
    this.segmentDeliveryConfigurations,
    this.sourceLocationName,
    this.tags,
  });

  factory CreateSourceLocationResponse.fromJson(Map<String, dynamic> json) {
    return CreateSourceLocationResponse(
      accessConfiguration: json['AccessConfiguration'] != null
          ? AccessConfiguration.fromJson(
              json['AccessConfiguration'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      defaultSegmentDeliveryConfiguration:
          json['DefaultSegmentDeliveryConfiguration'] != null
              ? DefaultSegmentDeliveryConfiguration.fromJson(
                  json['DefaultSegmentDeliveryConfiguration']
                      as Map<String, dynamic>)
              : null,
      httpConfiguration: json['HttpConfiguration'] != null
          ? HttpConfiguration.fromJson(
              json['HttpConfiguration'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      segmentDeliveryConfigurations: (json['SegmentDeliveryConfigurations']
              as List?)
          ?.nonNulls
          .map((e) =>
              SegmentDeliveryConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessConfiguration = this.accessConfiguration;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultSegmentDeliveryConfiguration =
        this.defaultSegmentDeliveryConfiguration;
    final httpConfiguration = this.httpConfiguration;
    final lastModifiedTime = this.lastModifiedTime;
    final segmentDeliveryConfigurations = this.segmentDeliveryConfigurations;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    return {
      if (accessConfiguration != null)
        'AccessConfiguration': accessConfiguration,
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (defaultSegmentDeliveryConfiguration != null)
        'DefaultSegmentDeliveryConfiguration':
            defaultSegmentDeliveryConfiguration,
      if (httpConfiguration != null) 'HttpConfiguration': httpConfiguration,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (segmentDeliveryConfigurations != null)
        'SegmentDeliveryConfigurations': segmentDeliveryConfigurations,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DescribeSourceLocationResponse {
  /// The access configuration for the source location.
  final AccessConfiguration? accessConfiguration;

  /// The ARN of the source location.
  final String? arn;

  /// The timestamp that indicates when the source location was created.
  final DateTime? creationTime;

  /// The default segment delivery configuration settings.
  final DefaultSegmentDeliveryConfiguration?
      defaultSegmentDeliveryConfiguration;

  /// The HTTP package configuration settings for the source location.
  final HttpConfiguration? httpConfiguration;

  /// The timestamp that indicates when the source location was last modified.
  final DateTime? lastModifiedTime;

  /// A list of the segment delivery configurations associated with this resource.
  final List<SegmentDeliveryConfiguration>? segmentDeliveryConfigurations;

  /// The name of the source location.
  final String? sourceLocationName;

  /// The tags assigned to the source location. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  DescribeSourceLocationResponse({
    this.accessConfiguration,
    this.arn,
    this.creationTime,
    this.defaultSegmentDeliveryConfiguration,
    this.httpConfiguration,
    this.lastModifiedTime,
    this.segmentDeliveryConfigurations,
    this.sourceLocationName,
    this.tags,
  });

  factory DescribeSourceLocationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSourceLocationResponse(
      accessConfiguration: json['AccessConfiguration'] != null
          ? AccessConfiguration.fromJson(
              json['AccessConfiguration'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      defaultSegmentDeliveryConfiguration:
          json['DefaultSegmentDeliveryConfiguration'] != null
              ? DefaultSegmentDeliveryConfiguration.fromJson(
                  json['DefaultSegmentDeliveryConfiguration']
                      as Map<String, dynamic>)
              : null,
      httpConfiguration: json['HttpConfiguration'] != null
          ? HttpConfiguration.fromJson(
              json['HttpConfiguration'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      segmentDeliveryConfigurations: (json['SegmentDeliveryConfigurations']
              as List?)
          ?.nonNulls
          .map((e) =>
              SegmentDeliveryConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessConfiguration = this.accessConfiguration;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultSegmentDeliveryConfiguration =
        this.defaultSegmentDeliveryConfiguration;
    final httpConfiguration = this.httpConfiguration;
    final lastModifiedTime = this.lastModifiedTime;
    final segmentDeliveryConfigurations = this.segmentDeliveryConfigurations;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    return {
      if (accessConfiguration != null)
        'AccessConfiguration': accessConfiguration,
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (defaultSegmentDeliveryConfiguration != null)
        'DefaultSegmentDeliveryConfiguration':
            defaultSegmentDeliveryConfiguration,
      if (httpConfiguration != null) 'HttpConfiguration': httpConfiguration,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (segmentDeliveryConfigurations != null)
        'SegmentDeliveryConfigurations': segmentDeliveryConfigurations,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class UpdateSourceLocationResponse {
  /// Access configuration parameters. Configures the type of authentication used
  /// to access content from your source location.
  final AccessConfiguration? accessConfiguration;

  /// The Amazon Resource Name (ARN) associated with the source location.
  final String? arn;

  /// The timestamp that indicates when the source location was created.
  final DateTime? creationTime;

  /// The optional configuration for the host server that serves segments.
  final DefaultSegmentDeliveryConfiguration?
      defaultSegmentDeliveryConfiguration;

  /// The HTTP configuration for the source location.
  final HttpConfiguration? httpConfiguration;

  /// The timestamp that indicates when the source location was last modified.
  final DateTime? lastModifiedTime;

  /// The segment delivery configurations for the source location. For information
  /// about MediaTailor configurations, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
  /// with configurations in AWS Elemental MediaTailor</a>.
  final List<SegmentDeliveryConfiguration>? segmentDeliveryConfigurations;

  /// The name of the source location.
  final String? sourceLocationName;

  /// The tags to assign to the source location. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  UpdateSourceLocationResponse({
    this.accessConfiguration,
    this.arn,
    this.creationTime,
    this.defaultSegmentDeliveryConfiguration,
    this.httpConfiguration,
    this.lastModifiedTime,
    this.segmentDeliveryConfigurations,
    this.sourceLocationName,
    this.tags,
  });

  factory UpdateSourceLocationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSourceLocationResponse(
      accessConfiguration: json['AccessConfiguration'] != null
          ? AccessConfiguration.fromJson(
              json['AccessConfiguration'] as Map<String, dynamic>)
          : null,
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      defaultSegmentDeliveryConfiguration:
          json['DefaultSegmentDeliveryConfiguration'] != null
              ? DefaultSegmentDeliveryConfiguration.fromJson(
                  json['DefaultSegmentDeliveryConfiguration']
                      as Map<String, dynamic>)
              : null,
      httpConfiguration: json['HttpConfiguration'] != null
          ? HttpConfiguration.fromJson(
              json['HttpConfiguration'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      segmentDeliveryConfigurations: (json['SegmentDeliveryConfigurations']
              as List?)
          ?.nonNulls
          .map((e) =>
              SegmentDeliveryConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final accessConfiguration = this.accessConfiguration;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultSegmentDeliveryConfiguration =
        this.defaultSegmentDeliveryConfiguration;
    final httpConfiguration = this.httpConfiguration;
    final lastModifiedTime = this.lastModifiedTime;
    final segmentDeliveryConfigurations = this.segmentDeliveryConfigurations;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    return {
      if (accessConfiguration != null)
        'AccessConfiguration': accessConfiguration,
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (defaultSegmentDeliveryConfiguration != null)
        'DefaultSegmentDeliveryConfiguration':
            defaultSegmentDeliveryConfiguration,
      if (httpConfiguration != null) 'HttpConfiguration': httpConfiguration,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (segmentDeliveryConfigurations != null)
        'SegmentDeliveryConfigurations': segmentDeliveryConfigurations,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class DeleteSourceLocationResponse {
  DeleteSourceLocationResponse();

  factory DeleteSourceLocationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSourceLocationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListSourceLocationsResponse {
  /// A list of source locations.
  final List<SourceLocation>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListSourceLocationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListSourceLocationsResponse.fromJson(Map<String, dynamic> json) {
    return ListSourceLocationsResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => SourceLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class CreateVodSourceResponse {
  /// The ARN to assign to this VOD source.
  final String? arn;

  /// The time the VOD source was created.
  final DateTime? creationTime;

  /// A list of HTTP package configuration parameters for this VOD source.
  final List<HttpPackageConfiguration>? httpPackageConfigurations;

  /// The time the VOD source was last modified.
  final DateTime? lastModifiedTime;

  /// The name to assign to the source location for this VOD source.
  final String? sourceLocationName;

  /// The tags to assign to the VOD source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name to assign to the VOD source.
  final String? vodSourceName;

  CreateVodSourceResponse({
    this.arn,
    this.creationTime,
    this.httpPackageConfigurations,
    this.lastModifiedTime,
    this.sourceLocationName,
    this.tags,
    this.vodSourceName,
  });

  factory CreateVodSourceResponse.fromJson(Map<String, dynamic> json) {
    return CreateVodSourceResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpPackageConfigurations: (json['HttpPackageConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final lastModifiedTime = this.lastModifiedTime;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    final vodSourceName = this.vodSourceName;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpPackageConfigurations != null)
        'HttpPackageConfigurations': httpPackageConfigurations,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class DescribeVodSourceResponse {
  /// The ad break opportunities within the VOD source.
  final List<AdBreakOpportunity>? adBreakOpportunities;

  /// The ARN of the VOD source.
  final String? arn;

  /// The timestamp that indicates when the VOD source was created.
  final DateTime? creationTime;

  /// The HTTP package configurations.
  final List<HttpPackageConfiguration>? httpPackageConfigurations;

  /// The last modified time of the VOD source.
  final DateTime? lastModifiedTime;

  /// The name of the source location associated with the VOD source.
  final String? sourceLocationName;

  /// The tags assigned to the VOD source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name of the VOD source.
  final String? vodSourceName;

  DescribeVodSourceResponse({
    this.adBreakOpportunities,
    this.arn,
    this.creationTime,
    this.httpPackageConfigurations,
    this.lastModifiedTime,
    this.sourceLocationName,
    this.tags,
    this.vodSourceName,
  });

  factory DescribeVodSourceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVodSourceResponse(
      adBreakOpportunities: (json['AdBreakOpportunities'] as List?)
          ?.nonNulls
          .map((e) => AdBreakOpportunity.fromJson(e as Map<String, dynamic>))
          .toList(),
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpPackageConfigurations: (json['HttpPackageConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adBreakOpportunities = this.adBreakOpportunities;
    final arn = this.arn;
    final creationTime = this.creationTime;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final lastModifiedTime = this.lastModifiedTime;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    final vodSourceName = this.vodSourceName;
    return {
      if (adBreakOpportunities != null)
        'AdBreakOpportunities': adBreakOpportunities,
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpPackageConfigurations != null)
        'HttpPackageConfigurations': httpPackageConfigurations,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class UpdateVodSourceResponse {
  /// The Amazon Resource Name (ARN) associated with the VOD source.
  final String? arn;

  /// The timestamp that indicates when the VOD source was created.
  final DateTime? creationTime;

  /// A list of HTTP package configurations for the VOD source on this account.
  final List<HttpPackageConfiguration>? httpPackageConfigurations;

  /// The timestamp that indicates when the VOD source was last modified.
  final DateTime? lastModifiedTime;

  /// The name of the source location associated with the VOD source.
  final String? sourceLocationName;

  /// The tags to assign to the VOD source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name of the VOD source.
  final String? vodSourceName;

  UpdateVodSourceResponse({
    this.arn,
    this.creationTime,
    this.httpPackageConfigurations,
    this.lastModifiedTime,
    this.sourceLocationName,
    this.tags,
    this.vodSourceName,
  });

  factory UpdateVodSourceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVodSourceResponse(
      arn: json['Arn'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      httpPackageConfigurations: (json['HttpPackageConfigurations'] as List?)
          ?.nonNulls
          .map((e) =>
              HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final lastModifiedTime = this.lastModifiedTime;
    final sourceLocationName = this.sourceLocationName;
    final tags = this.tags;
    final vodSourceName = this.vodSourceName;
    return {
      if (arn != null) 'Arn': arn,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (httpPackageConfigurations != null)
        'HttpPackageConfigurations': httpPackageConfigurations,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (tags != null) 'tags': tags,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class DeleteVodSourceResponse {
  DeleteVodSourceResponse();

  factory DeleteVodSourceResponse.fromJson(Map<String, dynamic> _) {
    return DeleteVodSourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class ListVodSourcesResponse {
  /// Lists the VOD sources.
  final List<VodSource>? items;

  /// Pagination token returned by the list request when results exceed the
  /// maximum allowed. Use the token to fetch the next page of results.
  final String? nextToken;

  ListVodSourcesResponse({
    this.items,
    this.nextToken,
  });

  factory ListVodSourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListVodSourcesResponse(
      items: (json['Items'] as List?)
          ?.nonNulls
          .map((e) => VodSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'Items': items,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// VOD source configuration parameters.
///
/// @nodoc
class VodSource {
  /// The ARN for the VOD source.
  final String arn;

  /// The HTTP package configurations for the VOD source.
  final List<HttpPackageConfiguration> httpPackageConfigurations;

  /// The name of the source location that the VOD source is associated with.
  final String sourceLocationName;

  /// The name of the VOD source.
  final String vodSourceName;

  /// The timestamp that indicates when the VOD source was created.
  final DateTime? creationTime;

  /// The timestamp that indicates when the VOD source was last modified.
  final DateTime? lastModifiedTime;

  /// The tags assigned to the VOD source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  VodSource({
    required this.arn,
    required this.httpPackageConfigurations,
    required this.sourceLocationName,
    required this.vodSourceName,
    this.creationTime,
    this.lastModifiedTime,
    this.tags,
  });

  factory VodSource.fromJson(Map<String, dynamic> json) {
    return VodSource(
      arn: (json['Arn'] as String?) ?? '',
      httpPackageConfigurations:
          ((json['HttpPackageConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
              .toList(),
      sourceLocationName: (json['SourceLocationName'] as String?) ?? '',
      vodSourceName: (json['VodSourceName'] as String?) ?? '',
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final sourceLocationName = this.sourceLocationName;
    final vodSourceName = this.vodSourceName;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'Arn': arn,
      'HttpPackageConfigurations': httpPackageConfigurations,
      'SourceLocationName': sourceLocationName,
      'VodSourceName': vodSourceName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The HTTP package configuration properties for the requested VOD source.
///
/// @nodoc
class HttpPackageConfiguration {
  /// The relative path to the URL for this VOD source. This is combined with
  /// <code>SourceLocation::HttpConfiguration::BaseUrl</code> to form a valid URL.
  final String path;

  /// The name of the source group. This has to match one of the
  /// <code>Channel::Outputs::SourceGroup</code>.
  final String sourceGroup;

  /// The streaming protocol for this package configuration. Supported values are
  /// <code>HLS</code> and <code>DASH</code>.
  final Type type;

  HttpPackageConfiguration({
    required this.path,
    required this.sourceGroup,
    required this.type,
  });

  factory HttpPackageConfiguration.fromJson(Map<String, dynamic> json) {
    return HttpPackageConfiguration(
      path: (json['Path'] as String?) ?? '',
      sourceGroup: (json['SourceGroup'] as String?) ?? '',
      type: Type.fromString((json['Type'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final path = this.path;
    final sourceGroup = this.sourceGroup;
    final type = this.type;
    return {
      'Path': path,
      'SourceGroup': sourceGroup,
      'Type': type.value,
    };
  }
}

/// @nodoc
class Type {
  static const dash = Type._('DASH');
  static const hls = Type._('HLS');

  final String value;

  const Type._(this.value);

  static const values = [dash, hls];

  static Type fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Type._(value));

  @override
  bool operator ==(other) => other is Type && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A location at which a zero-duration ad marker was detected in a VOD source
/// manifest.
///
/// @nodoc
class AdBreakOpportunity {
  /// The offset in milliseconds from the start of the VOD source at which an ad
  /// marker was detected.
  final int offsetMillis;

  AdBreakOpportunity({
    required this.offsetMillis,
  });

  factory AdBreakOpportunity.fromJson(Map<String, dynamic> json) {
    return AdBreakOpportunity(
      offsetMillis: (json['OffsetMillis'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final offsetMillis = this.offsetMillis;
    return {
      'OffsetMillis': offsetMillis,
    };
  }
}

/// A source location is a container for sources. For more information about
/// source locations, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-source-locations.html">Working
/// with source locations</a> in the <i>MediaTailor User Guide</i>.
///
/// @nodoc
class SourceLocation {
  /// The ARN of the SourceLocation.
  final String arn;

  /// The HTTP configuration for the source location.
  final HttpConfiguration httpConfiguration;

  /// The name of the source location.
  final String sourceLocationName;

  /// The access configuration for the source location.
  final AccessConfiguration? accessConfiguration;

  /// The timestamp that indicates when the source location was created.
  final DateTime? creationTime;

  /// The default segment delivery configuration.
  final DefaultSegmentDeliveryConfiguration?
      defaultSegmentDeliveryConfiguration;

  /// The timestamp that indicates when the source location was last modified.
  final DateTime? lastModifiedTime;

  /// The segment delivery configurations for the source location.
  final List<SegmentDeliveryConfiguration>? segmentDeliveryConfigurations;

  /// The tags assigned to the source location. Tags are key-value pairs that you
  /// can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  SourceLocation({
    required this.arn,
    required this.httpConfiguration,
    required this.sourceLocationName,
    this.accessConfiguration,
    this.creationTime,
    this.defaultSegmentDeliveryConfiguration,
    this.lastModifiedTime,
    this.segmentDeliveryConfigurations,
    this.tags,
  });

  factory SourceLocation.fromJson(Map<String, dynamic> json) {
    return SourceLocation(
      arn: (json['Arn'] as String?) ?? '',
      httpConfiguration: HttpConfiguration.fromJson(
          (json['HttpConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      sourceLocationName: (json['SourceLocationName'] as String?) ?? '',
      accessConfiguration: json['AccessConfiguration'] != null
          ? AccessConfiguration.fromJson(
              json['AccessConfiguration'] as Map<String, dynamic>)
          : null,
      creationTime: timeStampFromJson(json['CreationTime']),
      defaultSegmentDeliveryConfiguration:
          json['DefaultSegmentDeliveryConfiguration'] != null
              ? DefaultSegmentDeliveryConfiguration.fromJson(
                  json['DefaultSegmentDeliveryConfiguration']
                      as Map<String, dynamic>)
              : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      segmentDeliveryConfigurations: (json['SegmentDeliveryConfigurations']
              as List?)
          ?.nonNulls
          .map((e) =>
              SegmentDeliveryConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final httpConfiguration = this.httpConfiguration;
    final sourceLocationName = this.sourceLocationName;
    final accessConfiguration = this.accessConfiguration;
    final creationTime = this.creationTime;
    final defaultSegmentDeliveryConfiguration =
        this.defaultSegmentDeliveryConfiguration;
    final lastModifiedTime = this.lastModifiedTime;
    final segmentDeliveryConfigurations = this.segmentDeliveryConfigurations;
    final tags = this.tags;
    return {
      'Arn': arn,
      'HttpConfiguration': httpConfiguration,
      'SourceLocationName': sourceLocationName,
      if (accessConfiguration != null)
        'AccessConfiguration': accessConfiguration,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (defaultSegmentDeliveryConfiguration != null)
        'DefaultSegmentDeliveryConfiguration':
            defaultSegmentDeliveryConfiguration,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (segmentDeliveryConfigurations != null)
        'SegmentDeliveryConfigurations': segmentDeliveryConfigurations,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Access configuration parameters.
///
/// @nodoc
class AccessConfiguration {
  /// The type of authentication used to access content from
  /// <code>HttpConfiguration::BaseUrl</code> on your source location.
  ///
  /// <code>S3_SIGV4</code> - AWS Signature Version 4 authentication for Amazon S3
  /// hosted virtual-style access. If your source location base URL is an Amazon
  /// S3 bucket, MediaTailor can use AWS Signature Version 4 (SigV4)
  /// authentication to access the bucket where your source content is stored.
  /// Your MediaTailor source location baseURL must follow the S3 virtual
  /// hosted-style request URL format. For example,
  /// https://bucket-name.s3.Region.amazonaws.com/key-name.
  ///
  /// Before you can use <code>S3_SIGV4</code>, you must meet these requirements:
  ///
  /// • You must allow MediaTailor to access your S3 bucket by granting
  /// mediatailor.amazonaws.com principal access in IAM. For information about
  /// configuring access in IAM, see Access management in the IAM User Guide.
  ///
  /// • The mediatailor.amazonaws.com service principal must have permissions to
  /// read all top level manifests referenced by the VodSource packaging
  /// configurations.
  ///
  /// • The caller of the API must have s3:GetObject IAM permissions to read all
  /// top level manifests referenced by your MediaTailor VodSource packaging
  /// configurations.
  ///
  /// <code>AUTODETECT_SIGV4</code> - AWS Signature Version 4 authentication for a
  /// set of supported services: MediaPackage Version 2 and Amazon S3 hosted
  /// virtual-style access. If your source location base URL is a MediaPackage
  /// Version 2 endpoint or an Amazon S3 bucket, MediaTailor can use AWS Signature
  /// Version 4 (SigV4) authentication to access the resource where your source
  /// content is stored.
  ///
  /// Before you can use <code>AUTODETECT_SIGV4</code> with a MediaPackage Version
  /// 2 endpoint, you must meet these requirements:
  ///
  /// • You must grant MediaTailor access to your MediaPackage endpoint by
  /// granting <code>mediatailor.amazonaws.com</code> principal access in an
  /// Origin Access policy on the endpoint.
  ///
  /// • Your MediaTailor source location base URL must be a MediaPackage V2
  /// endpoint.
  ///
  /// • The caller of the API must have <code>mediapackagev2:GetObject</code> IAM
  /// permissions to read all top level manifests referenced by the MediaTailor
  /// source packaging configurations.
  ///
  /// Before you can use <code>AUTODETECT_SIGV4</code> with an Amazon S3 bucket,
  /// you must meet these requirements:
  ///
  /// • You must grant MediaTailor access to your S3 bucket by granting
  /// <code>mediatailor.amazonaws.com</code> principal access in IAM. For more
  /// information about configuring access in IAM, see <a
  /// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access.html">Access
  /// management</a> in the <i>IAM User Guide.</i>.
  ///
  /// • The <code>mediatailor.amazonaws.com</code> service principal must have
  /// permissions to read all top-level manifests referenced by the
  /// <code>VodSource</code> packaging configurations.
  ///
  /// • The caller of the API must have <code>s3:GetObject</code> IAM permissions
  /// to read all top level manifests referenced by your MediaTailor
  /// <code>VodSource</code> packaging configurations.
  final AccessType? accessType;

  /// AWS Secrets Manager access token configuration parameters.
  final SecretsManagerAccessTokenConfiguration?
      secretsManagerAccessTokenConfiguration;

  AccessConfiguration({
    this.accessType,
    this.secretsManagerAccessTokenConfiguration,
  });

  factory AccessConfiguration.fromJson(Map<String, dynamic> json) {
    return AccessConfiguration(
      accessType: (json['AccessType'] as String?)?.let(AccessType.fromString),
      secretsManagerAccessTokenConfiguration:
          json['SecretsManagerAccessTokenConfiguration'] != null
              ? SecretsManagerAccessTokenConfiguration.fromJson(
                  json['SecretsManagerAccessTokenConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accessType = this.accessType;
    final secretsManagerAccessTokenConfiguration =
        this.secretsManagerAccessTokenConfiguration;
    return {
      if (accessType != null) 'AccessType': accessType.value,
      if (secretsManagerAccessTokenConfiguration != null)
        'SecretsManagerAccessTokenConfiguration':
            secretsManagerAccessTokenConfiguration,
    };
  }
}

/// The optional configuration for a server that serves segments. Use this if
/// you want the segment delivery server to be different from the source
/// location server. For example, you can configure your source location server
/// to be an origination server, such as MediaPackage, and the segment delivery
/// server to be a content delivery network (CDN), such as CloudFront. If you
/// don't specify a segment delivery server, then the source location server is
/// used.
///
/// @nodoc
class DefaultSegmentDeliveryConfiguration {
  /// The hostname of the server that will be used to serve segments. This string
  /// must include the protocol, such as <b>https://</b>.
  final String? baseUrl;

  DefaultSegmentDeliveryConfiguration({
    this.baseUrl,
  });

  factory DefaultSegmentDeliveryConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DefaultSegmentDeliveryConfiguration(
      baseUrl: json['BaseUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseUrl = this.baseUrl;
    return {
      if (baseUrl != null) 'BaseUrl': baseUrl,
    };
  }
}

/// The HTTP configuration for the source location.
///
/// @nodoc
class HttpConfiguration {
  /// The base URL for the source location host server. This string must include
  /// the protocol, such as <b>https://</b>.
  final String baseUrl;

  HttpConfiguration({
    required this.baseUrl,
  });

  factory HttpConfiguration.fromJson(Map<String, dynamic> json) {
    return HttpConfiguration(
      baseUrl: (json['BaseUrl'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final baseUrl = this.baseUrl;
    return {
      'BaseUrl': baseUrl,
    };
  }
}

/// The segment delivery configuration settings.
///
/// @nodoc
class SegmentDeliveryConfiguration {
  /// The base URL of the host or path of the segment delivery server that you're
  /// using to serve segments. This is typically a content delivery network (CDN).
  /// The URL can be absolute or relative. To use an absolute URL include the
  /// protocol, such as <code>https://example.com/some/path</code>. To use a
  /// relative URL specify the relative path, such as <code>/some/path*</code>.
  final String? baseUrl;

  /// A unique identifier used to distinguish between multiple segment delivery
  /// configurations in a source location.
  final String? name;

  SegmentDeliveryConfiguration({
    this.baseUrl,
    this.name,
  });

  factory SegmentDeliveryConfiguration.fromJson(Map<String, dynamic> json) {
    return SegmentDeliveryConfiguration(
      baseUrl: json['BaseUrl'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final baseUrl = this.baseUrl;
    final name = this.name;
    return {
      if (baseUrl != null) 'BaseUrl': baseUrl,
      if (name != null) 'Name': name,
    };
  }
}

/// @nodoc
class AccessType {
  static const s3Sigv4 = AccessType._('S3_SIGV4');
  static const secretsManagerAccessToken =
      AccessType._('SECRETS_MANAGER_ACCESS_TOKEN');
  static const autodetectSigv4 = AccessType._('AUTODETECT_SIGV4');

  final String value;

  const AccessType._(this.value);

  static const values = [s3Sigv4, secretsManagerAccessToken, autodetectSigv4];

  static AccessType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccessType._(value));

  @override
  bool operator ==(other) => other is AccessType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// AWS Secrets Manager access token configuration parameters. For information
/// about Secrets Manager access token authentication, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-access-configuration-access-token.html">Working
/// with AWS Secrets Manager access token authentication</a>.
///
/// @nodoc
class SecretsManagerAccessTokenConfiguration {
  /// The name of the HTTP header used to supply the access token in requests to
  /// the source location.
  final String? headerName;

  /// The Amazon Resource Name (ARN) of the AWS Secrets Manager secret that
  /// contains the access token.
  final String? secretArn;

  /// The AWS Secrets Manager <a
  /// href="https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_CreateSecret.html#SecretsManager-CreateSecret-request-SecretString.html">SecretString</a>
  /// key associated with the access token. MediaTailor uses the key to look up
  /// SecretString key and value pair containing the access token.
  final String? secretStringKey;

  SecretsManagerAccessTokenConfiguration({
    this.headerName,
    this.secretArn,
    this.secretStringKey,
  });

  factory SecretsManagerAccessTokenConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SecretsManagerAccessTokenConfiguration(
      headerName: json['HeaderName'] as String?,
      secretArn: json['SecretArn'] as String?,
      secretStringKey: json['SecretStringKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final headerName = this.headerName;
    final secretArn = this.secretArn;
    final secretStringKey = this.secretStringKey;
    return {
      if (headerName != null) 'HeaderName': headerName,
      if (secretArn != null) 'SecretArn': secretArn,
      if (secretStringKey != null) 'SecretStringKey': secretStringKey,
    };
  }
}

/// A prefetch schedule allows you to tell MediaTailor to fetch and prepare
/// certain ads before an ad break happens. For more information about ad
/// prefetching, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/prefetching-ads.html">Using
/// ad prefetching</a> in the <i>MediaTailor User Guide</i>.
///
/// @nodoc
class PrefetchSchedule {
  /// The Amazon Resource Name (ARN) of the prefetch schedule.
  final String arn;

  /// The name of the prefetch schedule. The name must be unique among all
  /// prefetch schedules that are associated with the specified playback
  /// configuration.
  final String name;

  /// The name of the playback configuration to create the prefetch schedule for.
  final String playbackConfigurationName;

  /// Consumption settings determine how, and when, MediaTailor places the
  /// prefetched ads into ad breaks for single prefetch schedules. Ad consumption
  /// occurs within a span of time that you define, called a <i>consumption
  /// window</i>. You can designate which ad breaks that MediaTailor fills with
  /// prefetch ads by setting avail matching criteria.
  final PrefetchConsumption? consumption;

  /// The settings that determine how and when MediaTailor prefetches ads and
  /// inserts them into ad breaks.
  final RecurringPrefetchConfiguration? recurringPrefetchConfiguration;

  /// A complex type that contains settings for prefetch retrieval from the ad
  /// decision server (ADS).
  final PrefetchRetrieval? retrieval;

  /// The frequency that MediaTailor creates prefetch schedules.
  /// <code>SINGLE</code> indicates that this schedule applies to one ad break.
  /// <code>RECURRING</code> indicates that MediaTailor automatically creates a
  /// schedule for each ad avail in a live event.
  ///
  /// For more information about the prefetch types and when you might use each,
  /// see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/prefetching-ads.html">Prefetching
  /// ads in Elemental MediaTailor.</a>
  final PrefetchScheduleType? scheduleType;

  /// An optional stream identifier that you can specify in order to prefetch for
  /// multiple streams that use the same playback configuration.
  final String? streamId;

  /// The tags assigned to the prefetch schedule. Tags are key-value pairs that
  /// you can associate with Amazon resources to help with organization, access
  /// control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  PrefetchSchedule({
    required this.arn,
    required this.name,
    required this.playbackConfigurationName,
    this.consumption,
    this.recurringPrefetchConfiguration,
    this.retrieval,
    this.scheduleType,
    this.streamId,
    this.tags,
  });

  factory PrefetchSchedule.fromJson(Map<String, dynamic> json) {
    return PrefetchSchedule(
      arn: (json['Arn'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      playbackConfigurationName:
          (json['PlaybackConfigurationName'] as String?) ?? '',
      consumption: json['Consumption'] != null
          ? PrefetchConsumption.fromJson(
              json['Consumption'] as Map<String, dynamic>)
          : null,
      recurringPrefetchConfiguration: json['RecurringPrefetchConfiguration'] !=
              null
          ? RecurringPrefetchConfiguration.fromJson(
              json['RecurringPrefetchConfiguration'] as Map<String, dynamic>)
          : null,
      retrieval: json['Retrieval'] != null
          ? PrefetchRetrieval.fromJson(
              json['Retrieval'] as Map<String, dynamic>)
          : null,
      scheduleType: (json['ScheduleType'] as String?)
          ?.let(PrefetchScheduleType.fromString),
      streamId: json['StreamId'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final playbackConfigurationName = this.playbackConfigurationName;
    final consumption = this.consumption;
    final recurringPrefetchConfiguration = this.recurringPrefetchConfiguration;
    final retrieval = this.retrieval;
    final scheduleType = this.scheduleType;
    final streamId = this.streamId;
    final tags = this.tags;
    return {
      'Arn': arn,
      'Name': name,
      'PlaybackConfigurationName': playbackConfigurationName,
      if (consumption != null) 'Consumption': consumption,
      if (recurringPrefetchConfiguration != null)
        'RecurringPrefetchConfiguration': recurringPrefetchConfiguration,
      if (retrieval != null) 'Retrieval': retrieval,
      if (scheduleType != null) 'ScheduleType': scheduleType.value,
      if (streamId != null) 'StreamId': streamId,
      if (tags != null) 'tags': tags,
    };
  }
}

/// For single prefetch, describes how and when that MediaTailor places
/// prefetched ads into upcoming ad breaks.
///
/// @nodoc
class PrefetchConsumption {
  /// The time when MediaTailor no longer considers the prefetched ads for use in
  /// an ad break. MediaTailor automatically deletes prefetch schedules no less
  /// than seven days after the end time. If you'd like to manually delete the
  /// prefetch schedule, you can call <code>DeletePrefetchSchedule</code>.
  final DateTime endTime;

  /// If you only want MediaTailor to insert prefetched ads into avails (ad
  /// breaks) that match specific dynamic variables, such as
  /// <code>scte.event_id</code>, set the avail matching criteria.
  final List<AvailMatchingCriteria>? availMatchingCriteria;

  /// The time when prefetched ads are considered for use in an ad break. If you
  /// don't specify <code>StartTime</code>, the prefetched ads are available after
  /// MediaTailor retrieves them from the ad decision server.
  final DateTime? startTime;

  PrefetchConsumption({
    required this.endTime,
    this.availMatchingCriteria,
    this.startTime,
  });

  factory PrefetchConsumption.fromJson(Map<String, dynamic> json) {
    return PrefetchConsumption(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      availMatchingCriteria: (json['AvailMatchingCriteria'] as List?)
          ?.nonNulls
          .map((e) => AvailMatchingCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final availMatchingCriteria = this.availMatchingCriteria;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      if (availMatchingCriteria != null)
        'AvailMatchingCriteria': availMatchingCriteria,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// A complex type that contains settings governing when MediaTailor prefetches
/// ads, and which dynamic variables that MediaTailor includes in the request to
/// the ad decision server.
///
/// @nodoc
class PrefetchRetrieval {
  /// The time when prefetch retrieval ends for the ad break. Prefetching will be
  /// attempted for manifest requests that occur at or before this time.
  final DateTime endTime;

  /// The dynamic variables to use for substitution during prefetch requests to
  /// the ad decision server (ADS).
  ///
  /// You initially configure <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/variables.html">dynamic
  /// variables</a> for the ADS URL when you set up your playback configuration.
  /// When you specify <code>DynamicVariables</code> for prefetch retrieval,
  /// MediaTailor includes the dynamic variables in the request to the ADS.
  final Map<String, String>? dynamicVariables;

  /// The time when prefetch retrievals can start for this break. Ad prefetching
  /// will be attempted for manifest requests that occur at or after this time.
  /// Defaults to the current time. If not specified, the prefetch retrieval
  /// starts as soon as possible.
  final DateTime? startTime;

  /// The configuration that tells Elemental MediaTailor how many seconds to
  /// spread out requests to the ad decision server (ADS). Instead of sending ADS
  /// requests for all sessions at the same time, MediaTailor spreads the requests
  /// across the amount of time specified in the retrieval window.
  final TrafficShapingRetrievalWindow? trafficShapingRetrievalWindow;

  /// The configuration for TPS-based traffic shaping. This approach limits
  /// requests to the ad decision server (ADS) based on transactions per second
  /// and concurrent users.
  final TrafficShapingTpsConfiguration? trafficShapingTpsConfiguration;

  /// Indicates the type of traffic shaping used to limit the number of requests
  /// to the ADS at one time.
  final TrafficShapingType? trafficShapingType;

  PrefetchRetrieval({
    required this.endTime,
    this.dynamicVariables,
    this.startTime,
    this.trafficShapingRetrievalWindow,
    this.trafficShapingTpsConfiguration,
    this.trafficShapingType,
  });

  factory PrefetchRetrieval.fromJson(Map<String, dynamic> json) {
    return PrefetchRetrieval(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      dynamicVariables: (json['DynamicVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      startTime: timeStampFromJson(json['StartTime']),
      trafficShapingRetrievalWindow:
          json['TrafficShapingRetrievalWindow'] != null
              ? TrafficShapingRetrievalWindow.fromJson(
                  json['TrafficShapingRetrievalWindow'] as Map<String, dynamic>)
              : null,
      trafficShapingTpsConfiguration: json['TrafficShapingTpsConfiguration'] !=
              null
          ? TrafficShapingTpsConfiguration.fromJson(
              json['TrafficShapingTpsConfiguration'] as Map<String, dynamic>)
          : null,
      trafficShapingType: (json['TrafficShapingType'] as String?)
          ?.let(TrafficShapingType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final dynamicVariables = this.dynamicVariables;
    final startTime = this.startTime;
    final trafficShapingRetrievalWindow = this.trafficShapingRetrievalWindow;
    final trafficShapingTpsConfiguration = this.trafficShapingTpsConfiguration;
    final trafficShapingType = this.trafficShapingType;
    return {
      'EndTime': unixTimestampToJson(endTime),
      if (dynamicVariables != null) 'DynamicVariables': dynamicVariables,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (trafficShapingRetrievalWindow != null)
        'TrafficShapingRetrievalWindow': trafficShapingRetrievalWindow,
      if (trafficShapingTpsConfiguration != null)
        'TrafficShapingTpsConfiguration': trafficShapingTpsConfiguration,
      if (trafficShapingType != null)
        'TrafficShapingType': trafficShapingType.value,
    };
  }
}

/// @nodoc
class PrefetchScheduleType {
  static const single = PrefetchScheduleType._('SINGLE');
  static const recurring = PrefetchScheduleType._('RECURRING');

  final String value;

  const PrefetchScheduleType._(this.value);

  static const values = [single, recurring];

  static PrefetchScheduleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PrefetchScheduleType._(value));

  @override
  bool operator ==(other) =>
      other is PrefetchScheduleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration that defines how MediaTailor performs recurring prefetch.
///
/// @nodoc
class RecurringPrefetchConfiguration {
  /// The end time for the window that MediaTailor prefetches and inserts ads in a
  /// live event.
  final DateTime endTime;

  /// The settings that determine how and when MediaTailor places prefetched ads
  /// into upcoming ad breaks for recurring prefetch scedules.
  final RecurringConsumption recurringConsumption;

  /// The configuration for prefetch ad retrieval from the ADS.
  final RecurringRetrieval recurringRetrieval;

  /// The start time for the window that MediaTailor prefetches and inserts ads in
  /// a live event.
  final DateTime? startTime;

  RecurringPrefetchConfiguration({
    required this.endTime,
    required this.recurringConsumption,
    required this.recurringRetrieval,
    this.startTime,
  });

  factory RecurringPrefetchConfiguration.fromJson(Map<String, dynamic> json) {
    return RecurringPrefetchConfiguration(
      endTime: nonNullableTimeStampFromJson(json['EndTime'] ?? 0),
      recurringConsumption: RecurringConsumption.fromJson(
          (json['RecurringConsumption'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      recurringRetrieval: RecurringRetrieval.fromJson(
          (json['RecurringRetrieval'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      startTime: timeStampFromJson(json['StartTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final recurringConsumption = this.recurringConsumption;
    final recurringRetrieval = this.recurringRetrieval;
    final startTime = this.startTime;
    return {
      'EndTime': unixTimestampToJson(endTime),
      'RecurringConsumption': recurringConsumption,
      'RecurringRetrieval': recurringRetrieval,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
    };
  }
}

/// The settings that determine how and when MediaTailor places prefetched ads
/// into upcoming ad breaks for recurring prefetch scedules.
///
/// @nodoc
class RecurringConsumption {
  /// The configuration for the dynamic variables that determine which ad breaks
  /// that MediaTailor inserts prefetched ads in.
  final List<AvailMatchingCriteria>? availMatchingCriteria;

  /// The number of seconds that an ad is available for insertion after it was
  /// prefetched.
  final int? retrievedAdExpirationSeconds;

  RecurringConsumption({
    this.availMatchingCriteria,
    this.retrievedAdExpirationSeconds,
  });

  factory RecurringConsumption.fromJson(Map<String, dynamic> json) {
    return RecurringConsumption(
      availMatchingCriteria: (json['AvailMatchingCriteria'] as List?)
          ?.nonNulls
          .map((e) => AvailMatchingCriteria.fromJson(e as Map<String, dynamic>))
          .toList(),
      retrievedAdExpirationSeconds:
          json['RetrievedAdExpirationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final availMatchingCriteria = this.availMatchingCriteria;
    final retrievedAdExpirationSeconds = this.retrievedAdExpirationSeconds;
    return {
      if (availMatchingCriteria != null)
        'AvailMatchingCriteria': availMatchingCriteria,
      if (retrievedAdExpirationSeconds != null)
        'RetrievedAdExpirationSeconds': retrievedAdExpirationSeconds,
    };
  }
}

/// With recurring prefetch, MediaTailor automatically prefetches ads for every
/// avail that occurs during the retrieval window. The following configurations
/// describe the MediaTailor behavior when prefetching ads for a live event.
///
/// @nodoc
class RecurringRetrieval {
  /// The number of seconds that MediaTailor waits after an ad avail before
  /// prefetching ads for the next avail. If not set, the default is 0 (no delay).
  final int? delayAfterAvailEndSeconds;

  /// The dynamic variables to use for substitution during prefetch requests to
  /// the ADS.
  final Map<String, String>? dynamicVariables;

  /// The configuration that tells Elemental MediaTailor how many seconds to
  /// spread out requests to the ad decision server (ADS). Instead of sending ADS
  /// requests for all sessions at the same time, MediaTailor spreads the requests
  /// across the amount of time specified in the retrieval window.
  final TrafficShapingRetrievalWindow? trafficShapingRetrievalWindow;

  /// The configuration for TPS-based traffic shaping. This approach limits
  /// requests to the ad decision server (ADS) based on transactions per second
  /// and concurrent users.
  final TrafficShapingTpsConfiguration? trafficShapingTpsConfiguration;

  /// Indicates the type of traffic shaping used to limit the number of requests
  /// to the ADS at one time.
  final TrafficShapingType? trafficShapingType;

  RecurringRetrieval({
    this.delayAfterAvailEndSeconds,
    this.dynamicVariables,
    this.trafficShapingRetrievalWindow,
    this.trafficShapingTpsConfiguration,
    this.trafficShapingType,
  });

  factory RecurringRetrieval.fromJson(Map<String, dynamic> json) {
    return RecurringRetrieval(
      delayAfterAvailEndSeconds: json['DelayAfterAvailEndSeconds'] as int?,
      dynamicVariables: (json['DynamicVariables'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      trafficShapingRetrievalWindow:
          json['TrafficShapingRetrievalWindow'] != null
              ? TrafficShapingRetrievalWindow.fromJson(
                  json['TrafficShapingRetrievalWindow'] as Map<String, dynamic>)
              : null,
      trafficShapingTpsConfiguration: json['TrafficShapingTpsConfiguration'] !=
              null
          ? TrafficShapingTpsConfiguration.fromJson(
              json['TrafficShapingTpsConfiguration'] as Map<String, dynamic>)
          : null,
      trafficShapingType: (json['TrafficShapingType'] as String?)
          ?.let(TrafficShapingType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final delayAfterAvailEndSeconds = this.delayAfterAvailEndSeconds;
    final dynamicVariables = this.dynamicVariables;
    final trafficShapingRetrievalWindow = this.trafficShapingRetrievalWindow;
    final trafficShapingTpsConfiguration = this.trafficShapingTpsConfiguration;
    final trafficShapingType = this.trafficShapingType;
    return {
      if (delayAfterAvailEndSeconds != null)
        'DelayAfterAvailEndSeconds': delayAfterAvailEndSeconds,
      if (dynamicVariables != null) 'DynamicVariables': dynamicVariables,
      if (trafficShapingRetrievalWindow != null)
        'TrafficShapingRetrievalWindow': trafficShapingRetrievalWindow,
      if (trafficShapingTpsConfiguration != null)
        'TrafficShapingTpsConfiguration': trafficShapingTpsConfiguration,
      if (trafficShapingType != null)
        'TrafficShapingType': trafficShapingType.value,
    };
  }
}

/// @nodoc
class TrafficShapingType {
  static const retrievalWindow = TrafficShapingType._('RETRIEVAL_WINDOW');
  static const tps = TrafficShapingType._('TPS');

  final String value;

  const TrafficShapingType._(this.value);

  static const values = [retrievalWindow, tps];

  static TrafficShapingType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => TrafficShapingType._(value));

  @override
  bool operator ==(other) =>
      other is TrafficShapingType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration that tells Elemental MediaTailor how many seconds to
/// spread out requests to the ad decision server (ADS). Instead of sending ADS
/// requests for all sessions at the same time, MediaTailor spreads the requests
/// across the amount of time specified in the retrieval window.
///
/// @nodoc
class TrafficShapingRetrievalWindow {
  /// The amount of time, in seconds, that MediaTailor spreads prefetch requests
  /// to the ADS.
  final int? retrievalWindowDurationSeconds;

  TrafficShapingRetrievalWindow({
    this.retrievalWindowDurationSeconds,
  });

  factory TrafficShapingRetrievalWindow.fromJson(Map<String, dynamic> json) {
    return TrafficShapingRetrievalWindow(
      retrievalWindowDurationSeconds:
          json['RetrievalWindowDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final retrievalWindowDurationSeconds = this.retrievalWindowDurationSeconds;
    return {
      if (retrievalWindowDurationSeconds != null)
        'RetrievalWindowDurationSeconds': retrievalWindowDurationSeconds,
    };
  }
}

/// The configuration for TPS-based traffic shaping. This approach limits
/// requests to the ad decision server (ADS) based on transactions per second
/// and concurrent users.
///
/// @nodoc
class TrafficShapingTpsConfiguration {
  /// The expected peak number of concurrent viewers for your content. MediaTailor
  /// uses this value along with peak TPS to determine how to distribute prefetch
  /// requests across the available capacity without exceeding your ADS limits.
  final int? peakConcurrentUsers;

  /// The maximum number of transactions per second (TPS) that your ad decision
  /// server (ADS) can handle. MediaTailor uses this value along with concurrent
  /// users and headroom multiplier to calculate optimal traffic distribution and
  /// prevent ADS overload.
  final int? peakTps;

  TrafficShapingTpsConfiguration({
    this.peakConcurrentUsers,
    this.peakTps,
  });

  factory TrafficShapingTpsConfiguration.fromJson(Map<String, dynamic> json) {
    return TrafficShapingTpsConfiguration(
      peakConcurrentUsers: json['PeakConcurrentUsers'] as int?,
      peakTps: json['PeakTps'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final peakConcurrentUsers = this.peakConcurrentUsers;
    final peakTps = this.peakTps;
    return {
      if (peakConcurrentUsers != null)
        'PeakConcurrentUsers': peakConcurrentUsers,
      if (peakTps != null) 'PeakTps': peakTps,
    };
  }
}

/// MediaTailor only places (consumes) prefetched ads if the ad break meets the
/// criteria defined by the dynamic variables. This gives you granular control
/// over which ad break to place the prefetched ads into.
///
/// As an example, let's say that you set <code>DynamicVariable</code> to
/// <code>scte.event_id</code> and <code>Operator</code> to <code>EQUALS</code>,
/// and your playback configuration has an ADS URL of
/// <code>https://my.ads.server.com/path?&amp;podId=\[scte.avail_num\]&amp;event=\[scte.event_id\]&amp;duration=\[session.avail_duration_secs\]</code>.
/// And the prefetch request to the ADS contains these values
/// <code>https://my.ads.server.com/path?&amp;podId=3&amp;event=my-awesome-event&amp;duration=30</code>.
/// MediaTailor will only insert the prefetched ads into the ad break if has a
/// SCTE marker with an event id of <code>my-awesome-event</code>, since it must
/// match the event id that MediaTailor uses to query the ADS.
///
/// You can specify up to five <code>AvailMatchingCriteria</code>. If you
/// specify multiple <code>AvailMatchingCriteria</code>, MediaTailor combines
/// them to match using a logical <code>AND</code>. You can model logical
/// <code>OR</code> combinations by creating multiple prefetch schedules.
///
/// @nodoc
class AvailMatchingCriteria {
  /// The dynamic variable(s) that MediaTailor should use as avail matching
  /// criteria. MediaTailor only places the prefetched ads into the avail if the
  /// avail matches the criteria defined by the dynamic variable. For information
  /// about dynamic variables, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/variables.html">Using
  /// dynamic ad variables</a> in the <i>MediaTailor User Guide</i>.
  ///
  /// You can include up to 100 dynamic variables.
  final String dynamicVariable;

  /// For the <code>DynamicVariable</code> specified in
  /// <code>AvailMatchingCriteria</code>, the Operator that is used for the
  /// comparison.
  final Operator operator;

  AvailMatchingCriteria({
    required this.dynamicVariable,
    required this.operator,
  });

  factory AvailMatchingCriteria.fromJson(Map<String, dynamic> json) {
    return AvailMatchingCriteria(
      dynamicVariable: (json['DynamicVariable'] as String?) ?? '',
      operator: Operator.fromString((json['Operator'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final dynamicVariable = this.dynamicVariable;
    final operator = this.operator;
    return {
      'DynamicVariable': dynamicVariable,
      'Operator': operator.value,
    };
  }
}

/// @nodoc
class Operator {
  static const equals = Operator._('EQUALS');

  final String value;

  const Operator._(this.value);

  static const values = [equals];

  static Operator fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => Operator._(value));

  @override
  bool operator ==(other) => other is Operator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ListPrefetchScheduleType {
  static const single = ListPrefetchScheduleType._('SINGLE');
  static const recurring = ListPrefetchScheduleType._('RECURRING');
  static const all = ListPrefetchScheduleType._('ALL');

  final String value;

  const ListPrefetchScheduleType._(this.value);

  static const values = [single, recurring, all];

  static ListPrefetchScheduleType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ListPrefetchScheduleType._(value));

  @override
  bool operator ==(other) =>
      other is ListPrefetchScheduleType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A playback configuration. For information about MediaTailor configurations,
/// see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/configurations.html">Working
/// with configurations in AWS Elemental MediaTailor</a>.
///
/// @nodoc
class PlaybackConfiguration {
  /// The setting that indicates what conditioning MediaTailor will perform on ads
  /// that the ad decision server (ADS) returns, and what priority MediaTailor
  /// uses when inserting ads.
  final AdConditioningConfiguration? adConditioningConfiguration;
  final AdDecisionServerConfiguration? adDecisionServerConfiguration;

  /// The URL for the ad decision server (ADS). This includes the specification of
  /// static parameters and placeholders for dynamic parameters. AWS Elemental
  /// MediaTailor substitutes player-specific and session-specific parameters as
  /// needed when calling the ADS. Alternately, for testing you can provide a
  /// static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The configuration for avail suppression, also known as ad suppression. For
  /// more information about ad suppression, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Suppression</a>.
  final AvailSuppression? availSuppression;

  /// The configuration for bumpers. Bumpers are short audio or video clips that
  /// play at the start or before the end of an ad break. To learn more about
  /// bumpers, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/bumpers.html">Bumpers</a>.
  final Bumper? bumper;

  /// The configuration for using a content delivery network (CDN), like Amazon
  /// CloudFront, for content and ad segment management.
  final CdnConfiguration? cdnConfiguration;

  /// The player parameters and aliases used as dynamic variables during session
  /// initialization. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/variables-domains.html">Domain
  /// Variables</a>.
  final Map<String, Map<String, String>>? configurationAliases;

  /// The configuration for a DASH source.
  final DashConfiguration? dashConfiguration;

  /// A map of lifecycle hook event names to function identifiers. The function
  /// mapping specifies which function MediaTailor executes at each lifecycle hook
  /// during ad insertion. Valid keys are <code>PRE_SESSION_INITIALIZATION</code>
  /// and <code>PRE_ADS_REQUEST</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-hooks.html">Functions
  /// lifecycle hooks</a> in the <i>MediaTailor User Guide</i>.
  final Map<EventName, String>? functionMapping;

  /// The configuration for HLS content.
  final HlsConfiguration? hlsConfiguration;

  /// The setting that controls whether players can use stitched or guided ad
  /// insertion. The default, <code>STITCHED_ONLY</code>, forces all player
  /// sessions to use stitched (server-side) ad insertion. Choosing
  /// <code>PLAYER_SELECT</code> allows players to select either stitched or
  /// guided ad insertion at session-initialization time. The default for players
  /// that do not specify an insertion mode is stitched.
  final InsertionMode? insertionMode;

  /// The configuration for pre-roll ad insertion.
  final LivePreRollConfiguration? livePreRollConfiguration;

  /// Defines where AWS Elemental MediaTailor sends logs for the playback
  /// configuration.
  final LogConfiguration? logConfiguration;

  /// The configuration for manifest processing rules. Manifest processing rules
  /// enable customization of the personalized manifests created by MediaTailor.
  final ManifestProcessingRules? manifestProcessingRules;

  /// The identifier for the playback configuration.
  final String? name;

  /// Defines the maximum duration of underfilled ad time (in seconds) allowed in
  /// an ad break. If the duration of underfilled ad time exceeds the
  /// personalization threshold, then the personalization of the ad break is
  /// abandoned and the underlying content is shown. This feature applies to <i>ad
  /// replacement</i> in live and VOD streams, rather than ad insertion, because
  /// it relies on an underlying content stream. For more information about ad
  /// break behavior, including ad replacement and insertion, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
  /// Behavior in AWS Elemental MediaTailor</a>.
  final int? personalizationThresholdSeconds;

  /// The Amazon Resource Name (ARN) for the playback configuration.
  final String? playbackConfigurationArn;

  /// The URL that the player accesses to get a manifest from AWS Elemental
  /// MediaTailor.
  final String? playbackEndpointPrefix;

  /// The URL that the player uses to initialize a session that uses client-side
  /// reporting.
  final String? sessionInitializationEndpointPrefix;

  /// The URL for a video asset to transcode and use to fill in time that's not
  /// used by ads. AWS Elemental MediaTailor shows the slate to fill in gaps in
  /// media content. Configuring the slate is optional for non-VPAID playback
  /// configurations. For VPAID, the slate is required because MediaTailor
  /// provides it in the slots designated for dynamic ad content. The slate must
  /// be a high-quality asset that contains both audio and video.
  final String? slateAdUrl;

  /// The tags to assign to the playback configuration. Tags are key-value pairs
  /// that you can associate with Amazon resources to help with organization,
  /// access control, and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  /// The name that is used to associate this playback configuration with a custom
  /// transcode profile. This overrides the dynamic transcoding defaults of
  /// MediaTailor. Use this only if you have already set up custom profiles with
  /// the help of AWS Support.
  final String? transcodeProfileName;

  /// The URL prefix for the parent manifest for the stream, minus the asset ID.
  /// The maximum length is 512 characters.
  final String? videoContentSourceUrl;

  PlaybackConfiguration({
    this.adConditioningConfiguration,
    this.adDecisionServerConfiguration,
    this.adDecisionServerUrl,
    this.availSuppression,
    this.bumper,
    this.cdnConfiguration,
    this.configurationAliases,
    this.dashConfiguration,
    this.functionMapping,
    this.hlsConfiguration,
    this.insertionMode,
    this.livePreRollConfiguration,
    this.logConfiguration,
    this.manifestProcessingRules,
    this.name,
    this.personalizationThresholdSeconds,
    this.playbackConfigurationArn,
    this.playbackEndpointPrefix,
    this.sessionInitializationEndpointPrefix,
    this.slateAdUrl,
    this.tags,
    this.transcodeProfileName,
    this.videoContentSourceUrl,
  });

  factory PlaybackConfiguration.fromJson(Map<String, dynamic> json) {
    return PlaybackConfiguration(
      adConditioningConfiguration: json['AdConditioningConfiguration'] != null
          ? AdConditioningConfiguration.fromJson(
              json['AdConditioningConfiguration'] as Map<String, dynamic>)
          : null,
      adDecisionServerConfiguration:
          json['AdDecisionServerConfiguration'] != null
              ? AdDecisionServerConfiguration.fromJson(
                  json['AdDecisionServerConfiguration'] as Map<String, dynamic>)
              : null,
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      availSuppression: json['AvailSuppression'] != null
          ? AvailSuppression.fromJson(
              json['AvailSuppression'] as Map<String, dynamic>)
          : null,
      bumper: json['Bumper'] != null
          ? Bumper.fromJson(json['Bumper'] as Map<String, dynamic>)
          : null,
      cdnConfiguration: json['CdnConfiguration'] != null
          ? CdnConfiguration.fromJson(
              json['CdnConfiguration'] as Map<String, dynamic>)
          : null,
      configurationAliases:
          (json['ConfigurationAliases'] as Map<String, dynamic>?)?.map((k, e) =>
              MapEntry(
                  k,
                  (e as Map<String, dynamic>)
                      .map((k, e) => MapEntry(k, e as String)))),
      dashConfiguration: json['DashConfiguration'] != null
          ? DashConfiguration.fromJson(
              json['DashConfiguration'] as Map<String, dynamic>)
          : null,
      functionMapping: (json['FunctionMapping'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(EventName.fromString(k), e as String)),
      hlsConfiguration: json['HlsConfiguration'] != null
          ? HlsConfiguration.fromJson(
              json['HlsConfiguration'] as Map<String, dynamic>)
          : null,
      insertionMode:
          (json['InsertionMode'] as String?)?.let(InsertionMode.fromString),
      livePreRollConfiguration: json['LivePreRollConfiguration'] != null
          ? LivePreRollConfiguration.fromJson(
              json['LivePreRollConfiguration'] as Map<String, dynamic>)
          : null,
      logConfiguration: json['LogConfiguration'] != null
          ? LogConfiguration.fromJson(
              json['LogConfiguration'] as Map<String, dynamic>)
          : null,
      manifestProcessingRules: json['ManifestProcessingRules'] != null
          ? ManifestProcessingRules.fromJson(
              json['ManifestProcessingRules'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      personalizationThresholdSeconds:
          json['PersonalizationThresholdSeconds'] as int?,
      playbackConfigurationArn: json['PlaybackConfigurationArn'] as String?,
      playbackEndpointPrefix: json['PlaybackEndpointPrefix'] as String?,
      sessionInitializationEndpointPrefix:
          json['SessionInitializationEndpointPrefix'] as String?,
      slateAdUrl: json['SlateAdUrl'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      transcodeProfileName: json['TranscodeProfileName'] as String?,
      videoContentSourceUrl: json['VideoContentSourceUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adConditioningConfiguration = this.adConditioningConfiguration;
    final adDecisionServerConfiguration = this.adDecisionServerConfiguration;
    final adDecisionServerUrl = this.adDecisionServerUrl;
    final availSuppression = this.availSuppression;
    final bumper = this.bumper;
    final cdnConfiguration = this.cdnConfiguration;
    final configurationAliases = this.configurationAliases;
    final dashConfiguration = this.dashConfiguration;
    final functionMapping = this.functionMapping;
    final hlsConfiguration = this.hlsConfiguration;
    final insertionMode = this.insertionMode;
    final livePreRollConfiguration = this.livePreRollConfiguration;
    final logConfiguration = this.logConfiguration;
    final manifestProcessingRules = this.manifestProcessingRules;
    final name = this.name;
    final personalizationThresholdSeconds =
        this.personalizationThresholdSeconds;
    final playbackConfigurationArn = this.playbackConfigurationArn;
    final playbackEndpointPrefix = this.playbackEndpointPrefix;
    final sessionInitializationEndpointPrefix =
        this.sessionInitializationEndpointPrefix;
    final slateAdUrl = this.slateAdUrl;
    final tags = this.tags;
    final transcodeProfileName = this.transcodeProfileName;
    final videoContentSourceUrl = this.videoContentSourceUrl;
    return {
      if (adConditioningConfiguration != null)
        'AdConditioningConfiguration': adConditioningConfiguration,
      if (adDecisionServerConfiguration != null)
        'AdDecisionServerConfiguration': adDecisionServerConfiguration,
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (availSuppression != null) 'AvailSuppression': availSuppression,
      if (bumper != null) 'Bumper': bumper,
      if (cdnConfiguration != null) 'CdnConfiguration': cdnConfiguration,
      if (configurationAliases != null)
        'ConfigurationAliases': configurationAliases,
      if (dashConfiguration != null) 'DashConfiguration': dashConfiguration,
      if (functionMapping != null)
        'FunctionMapping': functionMapping.map((k, e) => MapEntry(k.value, e)),
      if (hlsConfiguration != null) 'HlsConfiguration': hlsConfiguration,
      if (insertionMode != null) 'InsertionMode': insertionMode.value,
      if (livePreRollConfiguration != null)
        'LivePreRollConfiguration': livePreRollConfiguration,
      if (logConfiguration != null) 'LogConfiguration': logConfiguration,
      if (manifestProcessingRules != null)
        'ManifestProcessingRules': manifestProcessingRules,
      if (name != null) 'Name': name,
      if (personalizationThresholdSeconds != null)
        'PersonalizationThresholdSeconds': personalizationThresholdSeconds,
      if (playbackConfigurationArn != null)
        'PlaybackConfigurationArn': playbackConfigurationArn,
      if (playbackEndpointPrefix != null)
        'PlaybackEndpointPrefix': playbackEndpointPrefix,
      if (sessionInitializationEndpointPrefix != null)
        'SessionInitializationEndpointPrefix':
            sessionInitializationEndpointPrefix,
      if (slateAdUrl != null) 'SlateAdUrl': slateAdUrl,
      if (tags != null) 'tags': tags,
      if (transcodeProfileName != null)
        'TranscodeProfileName': transcodeProfileName,
      if (videoContentSourceUrl != null)
        'VideoContentSourceUrl': videoContentSourceUrl,
    };
  }
}

/// The configuration for avail suppression, also known as ad suppression. For
/// more information about ad suppression, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ad-behavior.html">Ad
/// Suppression</a>.
///
/// @nodoc
class AvailSuppression {
  /// Defines the policy to apply to the avail suppression mode.
  /// <code>BEHIND_LIVE_EDGE</code> will always use the full avail suppression
  /// policy. <code>AFTER_LIVE_EDGE</code> mode can be used to invoke partial ad
  /// break fills when a session starts mid-break.
  final FillPolicy? fillPolicy;

  /// Sets the ad suppression mode. By default, ad suppression is off and all ad
  /// breaks are filled with ads or slate. When Mode is set to
  /// <code>BEHIND_LIVE_EDGE</code>, ad suppression is active and MediaTailor
  /// won't fill ad breaks on or behind the ad suppression Value time in the
  /// manifest lookback window. When Mode is set to <code>AFTER_LIVE_EDGE</code>,
  /// ad suppression is active and MediaTailor won't fill ad breaks that are
  /// within the live edge plus the avail suppression value.
  final Mode? mode;

  /// A live edge offset time in HH:MM:SS. MediaTailor won't fill ad breaks on or
  /// behind this time in the manifest lookback window. If Value is set to
  /// 00:00:00, it is in sync with the live edge, and MediaTailor won't fill any
  /// ad breaks on or behind the live edge. If you set a Value time, MediaTailor
  /// won't fill any ad breaks on or behind this time in the manifest lookback
  /// window. For example, if you set 00:45:00, then MediaTailor will fill ad
  /// breaks that occur within 45 minutes behind the live edge, but won't fill ad
  /// breaks on or behind 45 minutes behind the live edge.
  final String? value;

  AvailSuppression({
    this.fillPolicy,
    this.mode,
    this.value,
  });

  factory AvailSuppression.fromJson(Map<String, dynamic> json) {
    return AvailSuppression(
      fillPolicy: (json['FillPolicy'] as String?)?.let(FillPolicy.fromString),
      mode: (json['Mode'] as String?)?.let(Mode.fromString),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fillPolicy = this.fillPolicy;
    final mode = this.mode;
    final value = this.value;
    return {
      if (fillPolicy != null) 'FillPolicy': fillPolicy.value,
      if (mode != null) 'Mode': mode.value,
      if (value != null) 'Value': value,
    };
  }
}

/// The configuration for bumpers. Bumpers are short audio or video clips that
/// play at the start or before the end of an ad break. To learn more about
/// bumpers, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/bumpers.html">Bumpers</a>.
///
/// @nodoc
class Bumper {
  /// The URL for the end bumper asset.
  final String? endUrl;

  /// The URL for the start bumper asset.
  final String? startUrl;

  Bumper({
    this.endUrl,
    this.startUrl,
  });

  factory Bumper.fromJson(Map<String, dynamic> json) {
    return Bumper(
      endUrl: json['EndUrl'] as String?,
      startUrl: json['StartUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endUrl = this.endUrl;
    final startUrl = this.startUrl;
    return {
      if (endUrl != null) 'EndUrl': endUrl,
      if (startUrl != null) 'StartUrl': startUrl,
    };
  }
}

/// The configuration for using a content delivery network (CDN), like Amazon
/// CloudFront, for content and ad segment management.
///
/// @nodoc
class CdnConfiguration {
  /// A non-default content delivery network (CDN) to serve ad segments. By
  /// default, AWS Elemental MediaTailor uses Amazon CloudFront with default cache
  /// settings as its CDN for ad segments. To set up an alternate CDN, create a
  /// rule in your CDN for the origin
  /// ads.mediatailor.<i>&lt;region&gt;</i>.amazonaws.com. Then specify the rule's
  /// name in this <code>AdSegmentUrlPrefix</code>. When AWS Elemental MediaTailor
  /// serves a manifest, it reports your CDN as the source for ad segments.
  final String? adSegmentUrlPrefix;

  /// A content delivery network (CDN) to cache content segments, so that content
  /// requests don’t always have to go to the origin server. First, create a rule
  /// in your CDN for the content segment origin server. Then specify the rule's
  /// name in this <code>ContentSegmentUrlPrefix</code>. When AWS Elemental
  /// MediaTailor serves a manifest, it reports your CDN as the source for content
  /// segments.
  final String? contentSegmentUrlPrefix;

  CdnConfiguration({
    this.adSegmentUrlPrefix,
    this.contentSegmentUrlPrefix,
  });

  factory CdnConfiguration.fromJson(Map<String, dynamic> json) {
    return CdnConfiguration(
      adSegmentUrlPrefix: json['AdSegmentUrlPrefix'] as String?,
      contentSegmentUrlPrefix: json['ContentSegmentUrlPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adSegmentUrlPrefix = this.adSegmentUrlPrefix;
    final contentSegmentUrlPrefix = this.contentSegmentUrlPrefix;
    return {
      if (adSegmentUrlPrefix != null) 'AdSegmentUrlPrefix': adSegmentUrlPrefix,
      if (contentSegmentUrlPrefix != null)
        'ContentSegmentUrlPrefix': contentSegmentUrlPrefix,
    };
  }
}

/// The configuration for DASH content.
///
/// @nodoc
class DashConfiguration {
  /// The URL generated by MediaTailor to initiate a playback session. The session
  /// uses server-side reporting. This setting is ignored in PUT operations.
  final String? manifestEndpointPrefix;

  /// The setting that controls whether MediaTailor includes the Location tag in
  /// DASH manifests. MediaTailor populates the Location tag with the URL for
  /// manifest update requests, to be used by players that don't support sticky
  /// redirects. Disable this if you have CDN routing rules set up for accessing
  /// MediaTailor manifests, and you are either using client-side reporting or
  /// your players support sticky HTTP redirects. Valid values are
  /// <code>DISABLED</code> and <code>EMT_DEFAULT</code>. The
  /// <code>EMT_DEFAULT</code> setting enables the inclusion of the tag and is the
  /// default value.
  final String? mpdLocation;

  /// The setting that controls whether MediaTailor handles manifests from the
  /// origin server as multi-period manifests or single-period manifests. If your
  /// origin server produces single-period manifests, set this to
  /// <code>SINGLE_PERIOD</code>. The default setting is
  /// <code>MULTI_PERIOD</code>. For multi-period manifests, omit this setting or
  /// set it to <code>MULTI_PERIOD</code>.
  final OriginManifestType? originManifestType;

  DashConfiguration({
    this.manifestEndpointPrefix,
    this.mpdLocation,
    this.originManifestType,
  });

  factory DashConfiguration.fromJson(Map<String, dynamic> json) {
    return DashConfiguration(
      manifestEndpointPrefix: json['ManifestEndpointPrefix'] as String?,
      mpdLocation: json['MpdLocation'] as String?,
      originManifestType: (json['OriginManifestType'] as String?)
          ?.let(OriginManifestType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final manifestEndpointPrefix = this.manifestEndpointPrefix;
    final mpdLocation = this.mpdLocation;
    final originManifestType = this.originManifestType;
    return {
      if (manifestEndpointPrefix != null)
        'ManifestEndpointPrefix': manifestEndpointPrefix,
      if (mpdLocation != null) 'MpdLocation': mpdLocation,
      if (originManifestType != null)
        'OriginManifestType': originManifestType.value,
    };
  }
}

/// The configuration for HLS content.
///
/// @nodoc
class HlsConfiguration {
  /// The URL that is used to initiate a playback session for devices that support
  /// Apple HLS. The session uses server-side reporting.
  final String? manifestEndpointPrefix;

  HlsConfiguration({
    this.manifestEndpointPrefix,
  });

  factory HlsConfiguration.fromJson(Map<String, dynamic> json) {
    return HlsConfiguration(
      manifestEndpointPrefix: json['ManifestEndpointPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestEndpointPrefix = this.manifestEndpointPrefix;
    return {
      if (manifestEndpointPrefix != null)
        'ManifestEndpointPrefix': manifestEndpointPrefix,
    };
  }
}

/// Insertion Mode controls whether players can use stitched or guided ad
/// insertion.
///
/// @nodoc
class InsertionMode {
  static const stitchedOnly = InsertionMode._('STITCHED_ONLY');
  static const playerSelect = InsertionMode._('PLAYER_SELECT');

  final String value;

  const InsertionMode._(this.value);

  static const values = [stitchedOnly, playerSelect];

  static InsertionMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => InsertionMode._(value));

  @override
  bool operator ==(other) => other is InsertionMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for pre-roll ad insertion.
///
/// @nodoc
class LivePreRollConfiguration {
  /// The URL for the ad decision server (ADS) for pre-roll ads. This includes the
  /// specification of static parameters and placeholders for dynamic parameters.
  /// AWS Elemental MediaTailor substitutes player-specific and session-specific
  /// parameters as needed when calling the ADS. Alternately, for testing, you can
  /// provide a static VAST URL. The maximum length is 25,000 characters.
  final String? adDecisionServerUrl;

  /// The maximum allowed duration for the pre-roll ad avail. AWS Elemental
  /// MediaTailor won't play pre-roll ads to exceed this duration, regardless of
  /// the total duration of ads that the ADS returns.
  final int? maxDurationSeconds;

  LivePreRollConfiguration({
    this.adDecisionServerUrl,
    this.maxDurationSeconds,
  });

  factory LivePreRollConfiguration.fromJson(Map<String, dynamic> json) {
    return LivePreRollConfiguration(
      adDecisionServerUrl: json['AdDecisionServerUrl'] as String?,
      maxDurationSeconds: json['MaxDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adDecisionServerUrl = this.adDecisionServerUrl;
    final maxDurationSeconds = this.maxDurationSeconds;
    return {
      if (adDecisionServerUrl != null)
        'AdDecisionServerUrl': adDecisionServerUrl,
      if (maxDurationSeconds != null) 'MaxDurationSeconds': maxDurationSeconds,
    };
  }
}

/// Defines where AWS Elemental MediaTailor sends logs for the playback
/// configuration.
///
/// @nodoc
class LogConfiguration {
  /// The method used for collecting logs from AWS Elemental MediaTailor.
  /// <code>LEGACY_CLOUDWATCH</code> indicates that MediaTailor is sending logs
  /// directly to Amazon CloudWatch Logs. <code>VENDED_LOGS</code> indicates that
  /// MediaTailor is sending logs to CloudWatch, which then vends the logs to your
  /// destination of choice. Supported destinations are CloudWatch Logs log group,
  /// Amazon S3 bucket, and Amazon Data Firehose stream.
  final List<LoggingStrategy> enabledLoggingStrategies;

  /// The percentage of session logs that MediaTailor sends to your configured log
  /// destination. For example, if your playback configuration has 1000 sessions
  /// and <code>percentEnabled</code> is set to <code>60</code>, MediaTailor sends
  /// logs for 600 of the sessions to CloudWatch Logs. MediaTailor decides at
  /// random which of the playback configuration sessions to send logs for. If you
  /// want to view logs for a specific session, you can use the <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/debug-log-mode.html">debug
  /// log mode</a>.
  ///
  /// Valid values: <code>0</code> - <code>100</code>
  final int percentEnabled;

  /// Settings for customizing what events are included in logs for interactions
  /// with the ad decision server (ADS).
  final AdsInteractionLog? adsInteractionLog;

  /// Settings for customizing what events are included in logs for interactions
  /// with the origin server.
  final ManifestServiceInteractionLog? manifestServiceInteractionLog;

  LogConfiguration({
    required this.enabledLoggingStrategies,
    required this.percentEnabled,
    this.adsInteractionLog,
    this.manifestServiceInteractionLog,
  });

  factory LogConfiguration.fromJson(Map<String, dynamic> json) {
    return LogConfiguration(
      enabledLoggingStrategies:
          ((json['EnabledLoggingStrategies'] as List?) ?? const [])
              .nonNulls
              .map((e) => LoggingStrategy.fromString((e as String)))
              .toList(),
      percentEnabled: (json['PercentEnabled'] as int?) ?? 0,
      adsInteractionLog: json['AdsInteractionLog'] != null
          ? AdsInteractionLog.fromJson(
              json['AdsInteractionLog'] as Map<String, dynamic>)
          : null,
      manifestServiceInteractionLog:
          json['ManifestServiceInteractionLog'] != null
              ? ManifestServiceInteractionLog.fromJson(
                  json['ManifestServiceInteractionLog'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final enabledLoggingStrategies = this.enabledLoggingStrategies;
    final percentEnabled = this.percentEnabled;
    final adsInteractionLog = this.adsInteractionLog;
    final manifestServiceInteractionLog = this.manifestServiceInteractionLog;
    return {
      'EnabledLoggingStrategies':
          enabledLoggingStrategies.map((e) => e.value).toList(),
      'PercentEnabled': percentEnabled,
      if (adsInteractionLog != null) 'AdsInteractionLog': adsInteractionLog,
      if (manifestServiceInteractionLog != null)
        'ManifestServiceInteractionLog': manifestServiceInteractionLog,
    };
  }
}

/// The configuration for manifest processing rules. Manifest processing rules
/// enable customization of the personalized manifests created by MediaTailor.
///
/// @nodoc
class ManifestProcessingRules {
  /// For HLS, when set to <code>true</code>, MediaTailor passes through
  /// <code>EXT-X-CUE-IN</code>, <code>EXT-X-CUE-OUT</code>, and
  /// <code>EXT-X-SPLICEPOINT-SCTE35</code> ad markers from the origin manifest to
  /// the MediaTailor personalized manifest.
  ///
  /// No logic is applied to these ad markers. For example, if
  /// <code>EXT-X-CUE-OUT</code> has a value of <code>60</code>, but no ads are
  /// filled for that ad break, MediaTailor will not set the value to
  /// <code>0</code>.
  final AdMarkerPassthrough? adMarkerPassthrough;

  ManifestProcessingRules({
    this.adMarkerPassthrough,
  });

  factory ManifestProcessingRules.fromJson(Map<String, dynamic> json) {
    return ManifestProcessingRules(
      adMarkerPassthrough: json['AdMarkerPassthrough'] != null
          ? AdMarkerPassthrough.fromJson(
              json['AdMarkerPassthrough'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkerPassthrough = this.adMarkerPassthrough;
    return {
      if (adMarkerPassthrough != null)
        'AdMarkerPassthrough': adMarkerPassthrough,
    };
  }
}

/// The setting that indicates what conditioning MediaTailor will perform on ads
/// that the ad decision server (ADS) returns.
///
/// @nodoc
class AdConditioningConfiguration {
  /// For ads that have media files with streaming delivery and supported file
  /// extensions, indicates what transcoding action MediaTailor takes when it
  /// first receives these ads from the ADS. <code>TRANSCODE</code> indicates that
  /// MediaTailor must transcode the ads. <code>NONE</code> indicates that you
  /// have already transcoded the ads outside of MediaTailor and don't need them
  /// transcoded as part of the ad insertion workflow. For more information about
  /// ad conditioning see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/precondition-ads.html">Using
  /// preconditioned ads</a> in the Elemental MediaTailor user guide.
  final StreamingMediaFileConditioning streamingMediaFileConditioning;

  AdConditioningConfiguration({
    required this.streamingMediaFileConditioning,
  });

  factory AdConditioningConfiguration.fromJson(Map<String, dynamic> json) {
    return AdConditioningConfiguration(
      streamingMediaFileConditioning: StreamingMediaFileConditioning.fromString(
          (json['StreamingMediaFileConditioning'] as String?) ?? ''),
    );
  }

  Map<String, dynamic> toJson() {
    final streamingMediaFileConditioning = this.streamingMediaFileConditioning;
    return {
      'StreamingMediaFileConditioning': streamingMediaFileConditioning.value,
    };
  }
}

/// Configuration parameters for customizing HTTP requests sent to the ad
/// decision server (ADS). This allows you to specify the HTTP method, headers,
/// request body, and compression settings for ADS requests.
///
/// @nodoc
class AdDecisionServerConfiguration {
  /// The HTTP request configuration parameters for the ad decision server.
  final HttpRequest? httpRequest;

  AdDecisionServerConfiguration({
    this.httpRequest,
  });

  factory AdDecisionServerConfiguration.fromJson(Map<String, dynamic> json) {
    return AdDecisionServerConfiguration(
      httpRequest: json['HttpRequest'] != null
          ? HttpRequest.fromJson(json['HttpRequest'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final httpRequest = this.httpRequest;
    return {
      if (httpRequest != null) 'HttpRequest': httpRequest,
    };
  }
}

/// @nodoc
class EventName {
  static const preSessionInitialization =
      EventName._('PRE_SESSION_INITIALIZATION');
  static const preAdsRequest = EventName._('PRE_ADS_REQUEST');

  final String value;

  const EventName._(this.value);

  static const values = [preSessionInitialization, preAdsRequest];

  static EventName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventName._(value));

  @override
  bool operator ==(other) => other is EventName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// HTTP request configuration parameters that define how MediaTailor
/// communicates with the ad decision server.
///
/// @nodoc
class HttpRequest {
  /// The request body content to send with HTTP requests to the ad decision
  /// server. This value is only eligible for <code>POST</code> requests.
  final String? body;

  /// The compression method to apply to requests sent to the ad decision server.
  /// Supported values are <code>NONE</code> and <code>GZIP</code>. This value is
  /// only eligible for <code>POST</code> requests.
  final CompressionMethod? compressRequest;

  /// Custom HTTP headers to include in requests to the ad decision server.
  /// Specify headers as key-value pairs. This value is only eligible for
  /// <code>POST</code> requests.
  final Map<String, String>? headers;

  /// The HTTP method to use when making requests to the ad decision server.
  /// Supported values are <code>GET</code> and <code>POST</code>.
  final Method? method;

  HttpRequest({
    this.body,
    this.compressRequest,
    this.headers,
    this.method,
  });

  factory HttpRequest.fromJson(Map<String, dynamic> json) {
    return HttpRequest(
      body: json['Body'] as String?,
      compressRequest: (json['CompressRequest'] as String?)
          ?.let(CompressionMethod.fromString),
      headers: (json['Headers'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      method: (json['Method'] as String?)?.let(Method.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final body = this.body;
    final compressRequest = this.compressRequest;
    final headers = this.headers;
    final method = this.method;
    return {
      if (body != null) 'Body': body,
      if (compressRequest != null) 'CompressRequest': compressRequest.value,
      if (headers != null) 'Headers': headers,
      if (method != null) 'Method': method.value,
    };
  }
}

/// @nodoc
class Method {
  static const get = Method._('GET');
  static const post = Method._('POST');

  final String value;

  const Method._(this.value);

  static const values = [get, post];

  static Method fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Method._(value));

  @override
  bool operator ==(other) => other is Method && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class CompressionMethod {
  static const none = CompressionMethod._('NONE');
  static const gzip = CompressionMethod._('GZIP');

  final String value;

  const CompressionMethod._(this.value);

  static const values = [none, gzip];

  static CompressionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompressionMethod._(value));

  @override
  bool operator ==(other) => other is CompressionMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class StreamingMediaFileConditioning {
  static const transcode = StreamingMediaFileConditioning._('TRANSCODE');
  static const none = StreamingMediaFileConditioning._('NONE');

  final String value;

  const StreamingMediaFileConditioning._(this.value);

  static const values = [transcode, none];

  static StreamingMediaFileConditioning fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => StreamingMediaFileConditioning._(value));

  @override
  bool operator ==(other) =>
      other is StreamingMediaFileConditioning && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// For HLS, when set to <code>true</code>, MediaTailor passes through
/// <code>EXT-X-CUE-IN</code>, <code>EXT-X-CUE-OUT</code>, and
/// <code>EXT-X-SPLICEPOINT-SCTE35</code> ad markers from the origin manifest to
/// the MediaTailor personalized manifest.
///
/// No logic is applied to these ad markers. For example, if
/// <code>EXT-X-CUE-OUT</code> has a value of <code>60</code>, but no ads are
/// filled for that ad break, MediaTailor will not set the value to
/// <code>0</code>.
///
/// @nodoc
class AdMarkerPassthrough {
  /// Enables ad marker passthrough for your configuration.
  final bool? enabled;

  AdMarkerPassthrough({
    this.enabled,
  });

  factory AdMarkerPassthrough.fromJson(Map<String, dynamic> json) {
    return AdMarkerPassthrough(
      enabled: json['Enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'Enabled': enabled,
    };
  }
}

/// Settings for customizing what events are included in logs for interactions
/// with the ad decision server (ADS).
///
/// For more information about ADS logs, inlcuding descriptions of the event
/// types, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/ads-log-format.html">MediaTailor
/// ADS logs description and event types</a> in Elemental MediaTailor User
/// Guide.
///
/// @nodoc
class AdsInteractionLog {
  /// Indicates that MediaTailor won't emit the selected events in the logs for
  /// playback sessions that are initialized with this configuration.
  final List<AdsInteractionExcludeEventType>? excludeEventTypes;

  /// Indicates that MediaTailor emits <code>RAW_ADS_RESPONSE</code> logs for
  /// playback sessions that are initialized with this configuration.
  final List<AdsInteractionPublishOptInEventType>? publishOptInEventTypes;

  AdsInteractionLog({
    this.excludeEventTypes,
    this.publishOptInEventTypes,
  });

  factory AdsInteractionLog.fromJson(Map<String, dynamic> json) {
    return AdsInteractionLog(
      excludeEventTypes: (json['ExcludeEventTypes'] as List?)
          ?.nonNulls
          .map((e) => AdsInteractionExcludeEventType.fromString((e as String)))
          .toList(),
      publishOptInEventTypes: (json['PublishOptInEventTypes'] as List?)
          ?.nonNulls
          .map((e) =>
              AdsInteractionPublishOptInEventType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludeEventTypes = this.excludeEventTypes;
    final publishOptInEventTypes = this.publishOptInEventTypes;
    return {
      if (excludeEventTypes != null)
        'ExcludeEventTypes': excludeEventTypes.map((e) => e.value).toList(),
      if (publishOptInEventTypes != null)
        'PublishOptInEventTypes':
            publishOptInEventTypes.map((e) => e.value).toList(),
    };
  }
}

/// Settings for customizing what events are included in logs for interactions
/// with the origin server.
///
/// For more information about manifest service logs, including descriptions of
/// the event types, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/log-types.html">MediaTailor
/// manifest logs description and event types</a> in Elemental MediaTailor User
/// Guide.
///
/// @nodoc
class ManifestServiceInteractionLog {
  /// Indicates that MediaTailor won't emit the selected events in the logs for
  /// playback sessions that are initialized with this configuration.
  final List<ManifestServiceExcludeEventType>? excludeEventTypes;

  /// Indicates that MediaTailor will emit the selected events in the logs for
  /// playback sessions that are initialized with this configuration. These events
  /// are not emitted by default and must be explicitly opted in.
  final List<ManifestServicePublishOptInEventType>? publishOptInEventTypes;

  ManifestServiceInteractionLog({
    this.excludeEventTypes,
    this.publishOptInEventTypes,
  });

  factory ManifestServiceInteractionLog.fromJson(Map<String, dynamic> json) {
    return ManifestServiceInteractionLog(
      excludeEventTypes: (json['ExcludeEventTypes'] as List?)
          ?.nonNulls
          .map((e) => ManifestServiceExcludeEventType.fromString((e as String)))
          .toList(),
      publishOptInEventTypes: (json['PublishOptInEventTypes'] as List?)
          ?.nonNulls
          .map((e) =>
              ManifestServicePublishOptInEventType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final excludeEventTypes = this.excludeEventTypes;
    final publishOptInEventTypes = this.publishOptInEventTypes;
    return {
      if (excludeEventTypes != null)
        'ExcludeEventTypes': excludeEventTypes.map((e) => e.value).toList(),
      if (publishOptInEventTypes != null)
        'PublishOptInEventTypes':
            publishOptInEventTypes.map((e) => e.value).toList(),
    };
  }
}

/// @nodoc
class ManifestServiceExcludeEventType {
  static const generatedManifest =
      ManifestServiceExcludeEventType._('GENERATED_MANIFEST');
  static const originManifest =
      ManifestServiceExcludeEventType._('ORIGIN_MANIFEST');
  static const sessionInitialized =
      ManifestServiceExcludeEventType._('SESSION_INITIALIZED');
  static const trackingResponse =
      ManifestServiceExcludeEventType._('TRACKING_RESPONSE');
  static const configSyntaxError =
      ManifestServiceExcludeEventType._('CONFIG_SYNTAX_ERROR');
  static const configSecurityError =
      ManifestServiceExcludeEventType._('CONFIG_SECURITY_ERROR');
  static const unknownHost = ManifestServiceExcludeEventType._('UNKNOWN_HOST');
  static const timeoutError =
      ManifestServiceExcludeEventType._('TIMEOUT_ERROR');
  static const connectionError =
      ManifestServiceExcludeEventType._('CONNECTION_ERROR');
  static const ioError = ManifestServiceExcludeEventType._('IO_ERROR');
  static const unknownError =
      ManifestServiceExcludeEventType._('UNKNOWN_ERROR');
  static const hostDisallowed =
      ManifestServiceExcludeEventType._('HOST_DISALLOWED');
  static const parsingError =
      ManifestServiceExcludeEventType._('PARSING_ERROR');
  static const manifestError =
      ManifestServiceExcludeEventType._('MANIFEST_ERROR');
  static const noMasterOrMediaPlaylist =
      ManifestServiceExcludeEventType._('NO_MASTER_OR_MEDIA_PLAYLIST');
  static const noMasterPlaylist =
      ManifestServiceExcludeEventType._('NO_MASTER_PLAYLIST');
  static const noMediaPlaylist =
      ManifestServiceExcludeEventType._('NO_MEDIA_PLAYLIST');
  static const incompatibleHlsVersion =
      ManifestServiceExcludeEventType._('INCOMPATIBLE_HLS_VERSION');
  static const scte35ParsingError =
      ManifestServiceExcludeEventType._('SCTE35_PARSING_ERROR');
  static const invalidSinglePeriodDashManifest =
      ManifestServiceExcludeEventType._('INVALID_SINGLE_PERIOD_DASH_MANIFEST');
  static const unsupportedSinglePeriodDashManifest =
      ManifestServiceExcludeEventType._(
          'UNSUPPORTED_SINGLE_PERIOD_DASH_MANIFEST');
  static const lastPeriodMissingAudio =
      ManifestServiceExcludeEventType._('LAST_PERIOD_MISSING_AUDIO');
  static const lastPeriodMissingAudioWarning =
      ManifestServiceExcludeEventType._('LAST_PERIOD_MISSING_AUDIO_WARNING');
  static const errorOriginPrefixInterpolation =
      ManifestServiceExcludeEventType._('ERROR_ORIGIN_PREFIX_INTERPOLATION');
  static const errorAdsInterpolation =
      ManifestServiceExcludeEventType._('ERROR_ADS_INTERPOLATION');
  static const errorLivePreRollAdsInterpolation =
      ManifestServiceExcludeEventType._(
          'ERROR_LIVE_PRE_ROLL_ADS_INTERPOLATION');
  static const errorCdnAdSegmentInterpolation =
      ManifestServiceExcludeEventType._('ERROR_CDN_AD_SEGMENT_INTERPOLATION');
  static const errorCdnContentSegmentInterpolation =
      ManifestServiceExcludeEventType._(
          'ERROR_CDN_CONTENT_SEGMENT_INTERPOLATION');
  static const errorSlateAdUrlInterpolation =
      ManifestServiceExcludeEventType._('ERROR_SLATE_AD_URL_INTERPOLATION');
  static const errorProfileNameInterpolation =
      ManifestServiceExcludeEventType._('ERROR_PROFILE_NAME_INTERPOLATION');
  static const errorBumperStartInterpolation =
      ManifestServiceExcludeEventType._('ERROR_BUMPER_START_INTERPOLATION');
  static const errorBumperEndInterpolation =
      ManifestServiceExcludeEventType._('ERROR_BUMPER_END_INTERPOLATION');
  static const preSessionInitHookError =
      ManifestServiceExcludeEventType._('PRE_SESSION_INIT_HOOK_ERROR');
  static const preSessionInitFunctionError =
      ManifestServiceExcludeEventType._('PRE_SESSION_INIT_FUNCTION_ERROR');

  final String value;

  const ManifestServiceExcludeEventType._(this.value);

  static const values = [
    generatedManifest,
    originManifest,
    sessionInitialized,
    trackingResponse,
    configSyntaxError,
    configSecurityError,
    unknownHost,
    timeoutError,
    connectionError,
    ioError,
    unknownError,
    hostDisallowed,
    parsingError,
    manifestError,
    noMasterOrMediaPlaylist,
    noMasterPlaylist,
    noMediaPlaylist,
    incompatibleHlsVersion,
    scte35ParsingError,
    invalidSinglePeriodDashManifest,
    unsupportedSinglePeriodDashManifest,
    lastPeriodMissingAudio,
    lastPeriodMissingAudioWarning,
    errorOriginPrefixInterpolation,
    errorAdsInterpolation,
    errorLivePreRollAdsInterpolation,
    errorCdnAdSegmentInterpolation,
    errorCdnContentSegmentInterpolation,
    errorSlateAdUrlInterpolation,
    errorProfileNameInterpolation,
    errorBumperStartInterpolation,
    errorBumperEndInterpolation,
    preSessionInitHookError,
    preSessionInitFunctionError
  ];

  static ManifestServiceExcludeEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ManifestServiceExcludeEventType._(value));

  @override
  bool operator ==(other) =>
      other is ManifestServiceExcludeEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ManifestServicePublishOptInEventType {
  static const preSessionInitHookSummary =
      ManifestServicePublishOptInEventType._('PRE_SESSION_INIT_HOOK_SUMMARY');
  static const preSessionInitFunctionCompleted =
      ManifestServicePublishOptInEventType._(
          'PRE_SESSION_INIT_FUNCTION_COMPLETED');

  final String value;

  const ManifestServicePublishOptInEventType._(this.value);

  static const values = [
    preSessionInitHookSummary,
    preSessionInitFunctionCompleted
  ];

  static ManifestServicePublishOptInEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ManifestServicePublishOptInEventType._(value));

  @override
  bool operator ==(other) =>
      other is ManifestServicePublishOptInEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AdsInteractionExcludeEventType {
  static const adMarkerFound =
      AdsInteractionExcludeEventType._('AD_MARKER_FOUND');
  static const nonAdMarkerFound =
      AdsInteractionExcludeEventType._('NON_AD_MARKER_FOUND');
  static const makingAdsRequest =
      AdsInteractionExcludeEventType._('MAKING_ADS_REQUEST');
  static const modifiedTargetUrl =
      AdsInteractionExcludeEventType._('MODIFIED_TARGET_URL');
  static const vastRedirect = AdsInteractionExcludeEventType._('VAST_REDIRECT');
  static const emptyVastResponse =
      AdsInteractionExcludeEventType._('EMPTY_VAST_RESPONSE');
  static const emptyVmapResponse =
      AdsInteractionExcludeEventType._('EMPTY_VMAP_RESPONSE');
  static const vastResponse = AdsInteractionExcludeEventType._('VAST_RESPONSE');
  static const redirectedVastResponse =
      AdsInteractionExcludeEventType._('REDIRECTED_VAST_RESPONSE');
  static const filledAvail = AdsInteractionExcludeEventType._('FILLED_AVAIL');
  static const filledOverlayAvail =
      AdsInteractionExcludeEventType._('FILLED_OVERLAY_AVAIL');
  static const beaconFired = AdsInteractionExcludeEventType._('BEACON_FIRED');
  static const warningNoAdvertisements =
      AdsInteractionExcludeEventType._('WARNING_NO_ADVERTISEMENTS');
  static const warningVpaidAdDropped =
      AdsInteractionExcludeEventType._('WARNING_VPAID_AD_DROPPED');
  static const warningUrlVariableSubstitutionFailed =
      AdsInteractionExcludeEventType._(
          'WARNING_URL_VARIABLE_SUBSTITUTION_FAILED');
  static const errorUnknown = AdsInteractionExcludeEventType._('ERROR_UNKNOWN');
  static const errorUnknownHost =
      AdsInteractionExcludeEventType._('ERROR_UNKNOWN_HOST');
  static const errorDisallowedHost =
      AdsInteractionExcludeEventType._('ERROR_DISALLOWED_HOST');
  static const errorAdsIo = AdsInteractionExcludeEventType._('ERROR_ADS_IO');
  static const errorAdsTimeout =
      AdsInteractionExcludeEventType._('ERROR_ADS_TIMEOUT');
  static const errorAdsResponseParse =
      AdsInteractionExcludeEventType._('ERROR_ADS_RESPONSE_PARSE');
  static const errorAdsResponseUnknownRootElement =
      AdsInteractionExcludeEventType._(
          'ERROR_ADS_RESPONSE_UNKNOWN_ROOT_ELEMENT');
  static const errorAdsInvalidResponse =
      AdsInteractionExcludeEventType._('ERROR_ADS_INVALID_RESPONSE');
  static const errorVastRedirectEmptyResponse =
      AdsInteractionExcludeEventType._('ERROR_VAST_REDIRECT_EMPTY_RESPONSE');
  static const errorVastRedirectMultipleVast =
      AdsInteractionExcludeEventType._('ERROR_VAST_REDIRECT_MULTIPLE_VAST');
  static const errorVastRedirectFailed =
      AdsInteractionExcludeEventType._('ERROR_VAST_REDIRECT_FAILED');
  static const errorVastMissingMediafiles =
      AdsInteractionExcludeEventType._('ERROR_VAST_MISSING_MEDIAFILES');
  static const errorVastMissingCreatives =
      AdsInteractionExcludeEventType._('ERROR_VAST_MISSING_CREATIVES');
  static const errorVastMissingOverlays =
      AdsInteractionExcludeEventType._('ERROR_VAST_MISSING_OVERLAYS');
  static const errorVastMissingImpression =
      AdsInteractionExcludeEventType._('ERROR_VAST_MISSING_IMPRESSION');
  static const errorVastInvalidVastAdTagUri =
      AdsInteractionExcludeEventType._('ERROR_VAST_INVALID_VAST_AD_TAG_URI');
  static const errorVastMultipleTrackingEvents =
      AdsInteractionExcludeEventType._('ERROR_VAST_MULTIPLE_TRACKING_EVENTS');
  static const errorVastMultipleLinear =
      AdsInteractionExcludeEventType._('ERROR_VAST_MULTIPLE_LINEAR');
  static const errorVastInvalidMediaFile =
      AdsInteractionExcludeEventType._('ERROR_VAST_INVALID_MEDIA_FILE');
  static const errorFiringBeaconFailed =
      AdsInteractionExcludeEventType._('ERROR_FIRING_BEACON_FAILED');
  static const errorPersonalizationDisabled =
      AdsInteractionExcludeEventType._('ERROR_PERSONALIZATION_DISABLED');
  static const vodTimeBasedAvailPlanVastResponseForOffset =
      AdsInteractionExcludeEventType._(
          'VOD_TIME_BASED_AVAIL_PLAN_VAST_RESPONSE_FOR_OFFSET');
  static const vodTimeBasedAvailPlanSuccess =
      AdsInteractionExcludeEventType._('VOD_TIME_BASED_AVAIL_PLAN_SUCCESS');
  static const vodTimeBasedAvailPlanWarningNoAdvertisements =
      AdsInteractionExcludeEventType._(
          'VOD_TIME_BASED_AVAIL_PLAN_WARNING_NO_ADVERTISEMENTS');
  static const interstitialVodSuccess =
      AdsInteractionExcludeEventType._('INTERSTITIAL_VOD_SUCCESS');
  static const interstitialVodFailure =
      AdsInteractionExcludeEventType._('INTERSTITIAL_VOD_FAILURE');
  static const preAdsRequestHookError =
      AdsInteractionExcludeEventType._('PRE_ADS_REQUEST_HOOK_ERROR');
  static const preAdsRequestFunctionError =
      AdsInteractionExcludeEventType._('PRE_ADS_REQUEST_FUNCTION_ERROR');

  final String value;

  const AdsInteractionExcludeEventType._(this.value);

  static const values = [
    adMarkerFound,
    nonAdMarkerFound,
    makingAdsRequest,
    modifiedTargetUrl,
    vastRedirect,
    emptyVastResponse,
    emptyVmapResponse,
    vastResponse,
    redirectedVastResponse,
    filledAvail,
    filledOverlayAvail,
    beaconFired,
    warningNoAdvertisements,
    warningVpaidAdDropped,
    warningUrlVariableSubstitutionFailed,
    errorUnknown,
    errorUnknownHost,
    errorDisallowedHost,
    errorAdsIo,
    errorAdsTimeout,
    errorAdsResponseParse,
    errorAdsResponseUnknownRootElement,
    errorAdsInvalidResponse,
    errorVastRedirectEmptyResponse,
    errorVastRedirectMultipleVast,
    errorVastRedirectFailed,
    errorVastMissingMediafiles,
    errorVastMissingCreatives,
    errorVastMissingOverlays,
    errorVastMissingImpression,
    errorVastInvalidVastAdTagUri,
    errorVastMultipleTrackingEvents,
    errorVastMultipleLinear,
    errorVastInvalidMediaFile,
    errorFiringBeaconFailed,
    errorPersonalizationDisabled,
    vodTimeBasedAvailPlanVastResponseForOffset,
    vodTimeBasedAvailPlanSuccess,
    vodTimeBasedAvailPlanWarningNoAdvertisements,
    interstitialVodSuccess,
    interstitialVodFailure,
    preAdsRequestHookError,
    preAdsRequestFunctionError
  ];

  static AdsInteractionExcludeEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdsInteractionExcludeEventType._(value));

  @override
  bool operator ==(other) =>
      other is AdsInteractionExcludeEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class AdsInteractionPublishOptInEventType {
  static const rawAdsResponse =
      AdsInteractionPublishOptInEventType._('RAW_ADS_RESPONSE');
  static const rawAdsRequest =
      AdsInteractionPublishOptInEventType._('RAW_ADS_REQUEST');
  static const preAdsRequestHookSummary =
      AdsInteractionPublishOptInEventType._('PRE_ADS_REQUEST_HOOK_SUMMARY');
  static const preAdsRequestFunctionCompleted =
      AdsInteractionPublishOptInEventType._(
          'PRE_ADS_REQUEST_FUNCTION_COMPLETED');

  final String value;

  const AdsInteractionPublishOptInEventType._(this.value);

  static const values = [
    rawAdsResponse,
    rawAdsRequest,
    preAdsRequestHookSummary,
    preAdsRequestFunctionCompleted
  ];

  static AdsInteractionPublishOptInEventType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AdsInteractionPublishOptInEventType._(value));

  @override
  bool operator ==(other) =>
      other is AdsInteractionPublishOptInEventType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class LoggingStrategy {
  static const vendedLogs = LoggingStrategy._('VENDED_LOGS');
  static const legacyCloudwatch = LoggingStrategy._('LEGACY_CLOUDWATCH');

  final String value;

  const LoggingStrategy._(this.value);

  static const values = [vendedLogs, legacyCloudwatch];

  static LoggingStrategy fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LoggingStrategy._(value));

  @override
  bool operator ==(other) => other is LoggingStrategy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class OriginManifestType {
  static const singlePeriod = OriginManifestType._('SINGLE_PERIOD');
  static const multiPeriod = OriginManifestType._('MULTI_PERIOD');

  final String value;

  const OriginManifestType._(this.value);

  static const values = [singlePeriod, multiPeriod];

  static OriginManifestType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OriginManifestType._(value));

  @override
  bool operator ==(other) =>
      other is OriginManifestType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Mode {
  static const off = Mode._('OFF');
  static const behindLiveEdge = Mode._('BEHIND_LIVE_EDGE');
  static const afterLiveEdge = Mode._('AFTER_LIVE_EDGE');

  final String value;

  const Mode._(this.value);

  static const values = [off, behindLiveEdge, afterLiveEdge];

  static Mode fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Mode._(value));

  @override
  bool operator ==(other) => other is Mode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class FillPolicy {
  static const fullAvailOnly = FillPolicy._('FULL_AVAIL_ONLY');
  static const partialAvail = FillPolicy._('PARTIAL_AVAIL');

  final String value;

  const FillPolicy._(this.value);

  static const values = [fullAvailOnly, partialAvail];

  static FillPolicy fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FillPolicy._(value));

  @override
  bool operator ==(other) => other is FillPolicy && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for DASH PUT operations.
///
/// @nodoc
class DashConfigurationForPut {
  /// The setting that controls whether MediaTailor includes the Location tag in
  /// DASH manifests. MediaTailor populates the Location tag with the URL for
  /// manifest update requests, to be used by players that don't support sticky
  /// redirects. Disable this if you have CDN routing rules set up for accessing
  /// MediaTailor manifests, and you are either using client-side reporting or
  /// your players support sticky HTTP redirects. Valid values are
  /// <code>DISABLED</code> and <code>EMT_DEFAULT</code>. The
  /// <code>EMT_DEFAULT</code> setting enables the inclusion of the tag and is the
  /// default value.
  final String? mpdLocation;

  /// The setting that controls whether MediaTailor handles manifests from the
  /// origin server as multi-period manifests or single-period manifests. If your
  /// origin server produces single-period manifests, set this to
  /// <code>SINGLE_PERIOD</code>. The default setting is
  /// <code>MULTI_PERIOD</code>. For multi-period manifests, omit this setting or
  /// set it to <code>MULTI_PERIOD</code>.
  final OriginManifestType? originManifestType;

  DashConfigurationForPut({
    this.mpdLocation,
    this.originManifestType,
  });

  Map<String, dynamic> toJson() {
    final mpdLocation = this.mpdLocation;
    final originManifestType = this.originManifestType;
    return {
      if (mpdLocation != null) 'MpdLocation': mpdLocation,
      if (originManifestType != null)
        'OriginManifestType': originManifestType.value,
    };
  }
}

/// Live source configuration parameters.
///
/// @nodoc
class LiveSource {
  /// The ARN for the live source.
  final String arn;

  /// The HTTP package configurations for the live source.
  final List<HttpPackageConfiguration> httpPackageConfigurations;

  /// The name that's used to refer to a live source.
  final String liveSourceName;

  /// The name of the source location.
  final String sourceLocationName;

  /// The timestamp that indicates when the live source was created.
  final DateTime? creationTime;

  /// The timestamp that indicates when the live source was last modified.
  final DateTime? lastModifiedTime;

  /// The tags assigned to the live source. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  LiveSource({
    required this.arn,
    required this.httpPackageConfigurations,
    required this.liveSourceName,
    required this.sourceLocationName,
    this.creationTime,
    this.lastModifiedTime,
    this.tags,
  });

  factory LiveSource.fromJson(Map<String, dynamic> json) {
    return LiveSource(
      arn: (json['Arn'] as String?) ?? '',
      httpPackageConfigurations:
          ((json['HttpPackageConfigurations'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  HttpPackageConfiguration.fromJson(e as Map<String, dynamic>))
              .toList(),
      liveSourceName: (json['LiveSourceName'] as String?) ?? '',
      sourceLocationName: (json['SourceLocationName'] as String?) ?? '',
      creationTime: timeStampFromJson(json['CreationTime']),
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final httpPackageConfigurations = this.httpPackageConfigurations;
    final liveSourceName = this.liveSourceName;
    final sourceLocationName = this.sourceLocationName;
    final creationTime = this.creationTime;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'Arn': arn,
      'HttpPackageConfigurations': httpPackageConfigurations,
      'LiveSourceName': liveSourceName,
      'SourceLocationName': sourceLocationName,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
    };
  }
}

/// -- Define Mixin --
///
/// @nodoc
class $Function {
  /// The identifier of the function.
  final String functionId;

  /// The type of the function.
  final FunctionType functionType;

  /// The Amazon Resource Name (ARN) of the function.
  final String? arn;

  /// The configuration for a <code>CUSTOM_OUTPUT</code> function.
  final CustomOutputConfiguration? customOutputConfiguration;

  /// A description of the function.
  final String? description;

  /// The configuration for an <code>HTTP_REQUEST</code> function.
  final HttpRequestConfiguration? httpRequestConfiguration;

  /// The configuration for a <code>SEQUENTIAL_EXECUTOR</code> function.
  final SequentialExecutorConfiguration? sequentialExecutorConfiguration;

  /// The tags assigned to the function. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  $Function({
    required this.functionId,
    required this.functionType,
    this.arn,
    this.customOutputConfiguration,
    this.description,
    this.httpRequestConfiguration,
    this.sequentialExecutorConfiguration,
    this.tags,
  });

  factory $Function.fromJson(Map<String, dynamic> json) {
    return $Function(
      functionId: (json['FunctionId'] as String?) ?? '',
      functionType:
          FunctionType.fromString((json['FunctionType'] as String?) ?? ''),
      arn: json['Arn'] as String?,
      customOutputConfiguration: json['CustomOutputConfiguration'] != null
          ? CustomOutputConfiguration.fromJson(
              json['CustomOutputConfiguration'] as Map<String, dynamic>)
          : null,
      description: json['Description'] as String?,
      httpRequestConfiguration: json['HttpRequestConfiguration'] != null
          ? HttpRequestConfiguration.fromJson(
              json['HttpRequestConfiguration'] as Map<String, dynamic>)
          : null,
      sequentialExecutorConfiguration:
          json['SequentialExecutorConfiguration'] != null
              ? SequentialExecutorConfiguration.fromJson(
                  json['SequentialExecutorConfiguration']
                      as Map<String, dynamic>)
              : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final functionId = this.functionId;
    final functionType = this.functionType;
    final arn = this.arn;
    final customOutputConfiguration = this.customOutputConfiguration;
    final description = this.description;
    final httpRequestConfiguration = this.httpRequestConfiguration;
    final sequentialExecutorConfiguration =
        this.sequentialExecutorConfiguration;
    final tags = this.tags;
    return {
      'FunctionId': functionId,
      'FunctionType': functionType.value,
      if (arn != null) 'Arn': arn,
      if (customOutputConfiguration != null)
        'CustomOutputConfiguration': customOutputConfiguration,
      if (description != null) 'Description': description,
      if (httpRequestConfiguration != null)
        'HttpRequestConfiguration': httpRequestConfiguration,
      if (sequentialExecutorConfiguration != null)
        'SequentialExecutorConfiguration': sequentialExecutorConfiguration,
      if (tags != null) 'tags': tags,
    };
  }
}

/// -- Define Enums
///
/// @nodoc
class FunctionType {
  static const httpRequest = FunctionType._('HTTP_REQUEST');
  static const customOutput = FunctionType._('CUSTOM_OUTPUT');
  static const sequentialExecutor = FunctionType._('SEQUENTIAL_EXECUTOR');

  final String value;

  const FunctionType._(this.value);

  static const values = [httpRequest, customOutput, sequentialExecutor];

  static FunctionType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => FunctionType._(value));

  @override
  bool operator ==(other) => other is FunctionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// -- Function Configuration DataStructure
///
/// @nodoc
class HttpRequestConfiguration {
  /// The HTTP method for the request. Valid values: <code>GET</code> and
  /// <code>POST</code>.
  final MethodType methodType;

  /// The maximum time, in milliseconds, that MediaTailor waits for a response
  /// from the external service. If the call exceeds this timeout, MediaTailor
  /// sets the response status code to <code>null</code> and proceeds with output
  /// expression evaluation. Valid values: <code>100</code> to <code>2000</code>.
  final int requestTimeoutMilliseconds;

  /// The expression language used to evaluate expressions in the function
  /// configuration. Set this to <code>JSONata</code>.
  final RuntimeType runtime;

  /// An expression that evaluates to the request URL. Use <code>{%...%}</code>
  /// delimiters for dynamic expressions. The maximum length after evaluation is
  /// 2,048 characters.
  final String url;

  /// An expression that evaluates to the request body. Used with
  /// <code>POST</code> requests. The maximum size after evaluation is 64 KB.
  final String? body;

  /// A map of HTTP header names to expression values. MediaTailor evaluates each
  /// header value expression at runtime and includes the result in the outbound
  /// HTTP request. Maximum 50 headers.
  final Map<String, String>? headers;

  /// A map of output bindings. Each key is a namespaced output path (such as
  /// <code>player_params.device_type</code> or <code>temp.identity</code>), and
  /// each value is an expression that MediaTailor evaluates at runtime. Output
  /// expressions in an <code>HTTP_REQUEST</code> function can reference the
  /// <code>response</code> object returned by the HTTP call. For more information
  /// about expression syntax, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-jsonata.html">JSONata
  /// expression reference</a> in the <i>MediaTailor User Guide</i>.
  final Map<String, String>? output;

  HttpRequestConfiguration({
    required this.methodType,
    required this.requestTimeoutMilliseconds,
    required this.runtime,
    required this.url,
    this.body,
    this.headers,
    this.output,
  });

  factory HttpRequestConfiguration.fromJson(Map<String, dynamic> json) {
    return HttpRequestConfiguration(
      methodType: MethodType.fromString((json['MethodType'] as String?) ?? ''),
      requestTimeoutMilliseconds:
          (json['RequestTimeoutMilliseconds'] as int?) ?? 0,
      runtime: RuntimeType.fromString((json['Runtime'] as String?) ?? ''),
      url: (json['Url'] as String?) ?? '',
      body: json['Body'] as String?,
      headers: (json['Headers'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      output: (json['Output'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final methodType = this.methodType;
    final requestTimeoutMilliseconds = this.requestTimeoutMilliseconds;
    final runtime = this.runtime;
    final url = this.url;
    final body = this.body;
    final headers = this.headers;
    final output = this.output;
    return {
      'MethodType': methodType.value,
      'RequestTimeoutMilliseconds': requestTimeoutMilliseconds,
      'Runtime': runtime.value,
      'Url': url,
      if (body != null) 'Body': body,
      if (headers != null) 'Headers': headers,
      if (output != null) 'Output': output,
    };
  }
}

/// The configuration for a <code>CUSTOM_OUTPUT</code> function. MediaTailor
/// evaluates the output expressions against the current session state and
/// commits the results as output bindings. <code>CUSTOM_OUTPUT</code> functions
/// do not make external calls. For more information, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-types-custom-output.html">CUSTOM_OUTPUT</a>
/// in the <i>MediaTailor User Guide</i>.
///
/// @nodoc
class CustomOutputConfiguration {
  /// The expression language used to evaluate expressions in the function
  /// configuration. Set this to <code>JSONata</code>.
  final RuntimeType runtime;

  /// A map of output bindings. Each key is a namespaced output path (such as
  /// <code>player_params.device_type</code> or <code>temp.variant</code>), and
  /// each value is an expression that MediaTailor evaluates at runtime against
  /// the current session state. For more information about expression syntax, see
  /// <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-jsonata.html">JSONata
  /// expression reference</a> in the <i>MediaTailor User Guide</i>.
  final Map<String, String>? output;

  CustomOutputConfiguration({
    required this.runtime,
    this.output,
  });

  factory CustomOutputConfiguration.fromJson(Map<String, dynamic> json) {
    return CustomOutputConfiguration(
      runtime: RuntimeType.fromString((json['Runtime'] as String?) ?? ''),
      output: (json['Output'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final runtime = this.runtime;
    final output = this.output;
    return {
      'Runtime': runtime.value,
      if (output != null) 'Output': output,
    };
  }
}

/// The configuration for a <code>SEQUENTIAL_EXECUTOR</code> function. A
/// <code>SEQUENTIAL_EXECUTOR</code> runs a sequence of child functions in
/// order, passing data between steps through temporary data. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/monetization-functions-types-sequential-executor.html">SEQUENTIAL_EXECUTOR</a>
/// in the <i>MediaTailor User Guide</i>.
///
/// @nodoc
class SequentialExecutorConfiguration {
  /// An ordered list of 1 to 10 steps. Each step specifies a child function to
  /// execute and an optional run condition expression that controls whether the
  /// step runs. MediaTailor executes steps in order, passing data between steps
  /// through temporary data.
  final List<FunctionRef> functionList;

  /// The expression language used to evaluate expressions in the function
  /// configuration. Set this to <code>JSONata</code>.
  final RuntimeType runtime;

  /// The maximum time, in milliseconds, for the entire sequence to complete. This
  /// timeout covers all steps, including any HTTP calls made by child functions.
  /// If the sequence exceeds this timeout, MediaTailor discards all output from
  /// the sequence and proceeds with default behavior.
  final int timeoutMilliseconds;

  /// An optional map of output bindings that controls which bindings the sequence
  /// commits to the session state after all steps complete. If omitted,
  /// MediaTailor commits all accumulated output bindings from all child steps.
  final Map<String, String>? output;

  SequentialExecutorConfiguration({
    required this.functionList,
    required this.runtime,
    required this.timeoutMilliseconds,
    this.output,
  });

  factory SequentialExecutorConfiguration.fromJson(Map<String, dynamic> json) {
    return SequentialExecutorConfiguration(
      functionList: ((json['FunctionList'] as List?) ?? const [])
          .nonNulls
          .map((e) => FunctionRef.fromJson(e as Map<String, dynamic>))
          .toList(),
      runtime: RuntimeType.fromString((json['Runtime'] as String?) ?? ''),
      timeoutMilliseconds: (json['TimeoutMilliseconds'] as int?) ?? 0,
      output: (json['Output'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final functionList = this.functionList;
    final runtime = this.runtime;
    final timeoutMilliseconds = this.timeoutMilliseconds;
    final output = this.output;
    return {
      'FunctionList': functionList,
      'Runtime': runtime.value,
      'TimeoutMilliseconds': timeoutMilliseconds,
      if (output != null) 'Output': output,
    };
  }
}

/// @nodoc
class RuntimeType {
  static const jsonata = RuntimeType._('JSONATA');

  final String value;

  const RuntimeType._(this.value);

  static const values = [jsonata];

  static RuntimeType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => RuntimeType._(value));

  @override
  bool operator ==(other) => other is RuntimeType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A reference to a child function within a <code>SEQUENTIAL_EXECUTOR</code>
/// function.
///
/// @nodoc
class FunctionRef {
  /// The identifier of the child function to execute in this step.
  final String? functionId;

  /// An optional expression that evaluates to a boolean. MediaTailor evaluates
  /// this expression immediately before running the step, using the accumulated
  /// state at that point in the sequence. If the expression evaluates to
  /// <code>false</code>, MediaTailor skips the step and moves to the next one. If
  /// omitted, the step always runs.
  final String? runCondition;

  FunctionRef({
    this.functionId,
    this.runCondition,
  });

  factory FunctionRef.fromJson(Map<String, dynamic> json) {
    return FunctionRef(
      functionId: json['FunctionId'] as String?,
      runCondition: json['RunCondition'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final functionId = this.functionId;
    final runCondition = this.runCondition;
    return {
      if (functionId != null) 'FunctionId': functionId,
      if (runCondition != null) 'RunCondition': runCondition,
    };
  }
}

/// @nodoc
class MethodType {
  static const get = MethodType._('GET');
  static const post = MethodType._('POST');

  final String value;

  const MethodType._(this.value);

  static const values = [get, post];

  static MethodType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MethodType._(value));

  @override
  bool operator ==(other) => other is MethodType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Clip range configuration for the VOD source associated with the program.
///
/// @nodoc
class ClipRange {
  /// The end offset of the clip range, in milliseconds, starting from the
  /// beginning of the VOD source associated with the program.
  final int? endOffsetMillis;

  /// The start offset of the clip range, in milliseconds. This offset truncates
  /// the start at the number of milliseconds into the duration of the VOD source.
  final int? startOffsetMillis;

  ClipRange({
    this.endOffsetMillis,
    this.startOffsetMillis,
  });

  factory ClipRange.fromJson(Map<String, dynamic> json) {
    return ClipRange(
      endOffsetMillis: json['EndOffsetMillis'] as int?,
      startOffsetMillis: json['StartOffsetMillis'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final endOffsetMillis = this.endOffsetMillis;
    final startOffsetMillis = this.startOffsetMillis;
    return {
      if (endOffsetMillis != null) 'EndOffsetMillis': endOffsetMillis,
      if (startOffsetMillis != null) 'StartOffsetMillis': startOffsetMillis,
    };
  }
}

/// An AudienceMedia object contains an Audience and a list of AlternateMedia.
///
/// @nodoc
class AudienceMedia {
  /// The list of AlternateMedia defined in AudienceMedia.
  final List<AlternateMedia>? alternateMedia;

  /// The Audience defined in AudienceMedia.
  final String? audience;

  AudienceMedia({
    this.alternateMedia,
    this.audience,
  });

  factory AudienceMedia.fromJson(Map<String, dynamic> json) {
    return AudienceMedia(
      alternateMedia: (json['AlternateMedia'] as List?)
          ?.nonNulls
          .map((e) => AlternateMedia.fromJson(e as Map<String, dynamic>))
          .toList(),
      audience: json['Audience'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alternateMedia = this.alternateMedia;
    final audience = this.audience;
    return {
      if (alternateMedia != null) 'AlternateMedia': alternateMedia,
      if (audience != null) 'Audience': audience,
    };
  }
}

/// A playlist of media (VOD and/or live) to be played instead of the default
/// media on a particular program.
///
/// @nodoc
class AlternateMedia {
  /// Ad break configuration parameters defined in AlternateMedia.
  final List<AdBreak>? adBreaks;
  final ClipRange? clipRange;

  /// The duration of the alternateMedia in milliseconds.
  final int? durationMillis;

  /// The name of the live source for alternateMedia.
  final String? liveSourceName;

  /// The date and time that the alternateMedia is scheduled to start, in epoch
  /// milliseconds.
  final int? scheduledStartTimeMillis;

  /// The name of the source location for alternateMedia.
  final String? sourceLocationName;

  /// The name of the VOD source for alternateMedia.
  final String? vodSourceName;

  AlternateMedia({
    this.adBreaks,
    this.clipRange,
    this.durationMillis,
    this.liveSourceName,
    this.scheduledStartTimeMillis,
    this.sourceLocationName,
    this.vodSourceName,
  });

  factory AlternateMedia.fromJson(Map<String, dynamic> json) {
    return AlternateMedia(
      adBreaks: (json['AdBreaks'] as List?)
          ?.nonNulls
          .map((e) => AdBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      clipRange: json['ClipRange'] != null
          ? ClipRange.fromJson(json['ClipRange'] as Map<String, dynamic>)
          : null,
      durationMillis: json['DurationMillis'] as int?,
      liveSourceName: json['LiveSourceName'] as String?,
      scheduledStartTimeMillis: json['ScheduledStartTimeMillis'] as int?,
      sourceLocationName: json['SourceLocationName'] as String?,
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final adBreaks = this.adBreaks;
    final clipRange = this.clipRange;
    final durationMillis = this.durationMillis;
    final liveSourceName = this.liveSourceName;
    final scheduledStartTimeMillis = this.scheduledStartTimeMillis;
    final sourceLocationName = this.sourceLocationName;
    final vodSourceName = this.vodSourceName;
    return {
      if (adBreaks != null) 'AdBreaks': adBreaks,
      if (clipRange != null) 'ClipRange': clipRange,
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (scheduledStartTimeMillis != null)
        'ScheduledStartTimeMillis': scheduledStartTimeMillis,
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// Ad break configuration parameters.
///
/// @nodoc
class AdBreak {
  /// How long (in milliseconds) after the beginning of the program that an ad
  /// starts. This value must fall within 100ms of a segment boundary, otherwise
  /// the ad break will be skipped.
  final int offsetMillis;

  /// Defines a list of key/value pairs that MediaTailor generates within the
  /// <code>EXT-X-ASSET</code>tag for <code>SCTE35_ENHANCED</code> output.
  final List<KeyValuePair>? adBreakMetadata;

  /// The SCTE-35 ad insertion type. Accepted value: <code>SPLICE_INSERT</code>,
  /// <code>TIME_SIGNAL</code>.
  final MessageType? messageType;

  /// Ad break slate configuration.
  final SlateSource? slate;

  /// This defines the SCTE-35 <code>splice_insert()</code> message inserted
  /// around the ad. For information about using <code>splice_insert()</code>, see
  /// the SCTE-35 specficiaiton, section 9.7.3.1.
  final SpliceInsertMessage? spliceInsertMessage;

  /// Defines the SCTE-35 <code>time_signal</code> message inserted around the ad.
  ///
  /// Programs on a channel's schedule can be configured with one or more ad
  /// breaks. You can attach a <code>splice_insert</code> SCTE-35 message to the
  /// ad break. This message provides basic metadata about the ad break.
  ///
  /// See section 9.7.4 of the 2022 SCTE-35 specification for more information.
  final TimeSignalMessage? timeSignalMessage;

  AdBreak({
    required this.offsetMillis,
    this.adBreakMetadata,
    this.messageType,
    this.slate,
    this.spliceInsertMessage,
    this.timeSignalMessage,
  });

  factory AdBreak.fromJson(Map<String, dynamic> json) {
    return AdBreak(
      offsetMillis: (json['OffsetMillis'] as int?) ?? 0,
      adBreakMetadata: (json['AdBreakMetadata'] as List?)
          ?.nonNulls
          .map((e) => KeyValuePair.fromJson(e as Map<String, dynamic>))
          .toList(),
      messageType:
          (json['MessageType'] as String?)?.let(MessageType.fromString),
      slate: json['Slate'] != null
          ? SlateSource.fromJson(json['Slate'] as Map<String, dynamic>)
          : null,
      spliceInsertMessage: json['SpliceInsertMessage'] != null
          ? SpliceInsertMessage.fromJson(
              json['SpliceInsertMessage'] as Map<String, dynamic>)
          : null,
      timeSignalMessage: json['TimeSignalMessage'] != null
          ? TimeSignalMessage.fromJson(
              json['TimeSignalMessage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final offsetMillis = this.offsetMillis;
    final adBreakMetadata = this.adBreakMetadata;
    final messageType = this.messageType;
    final slate = this.slate;
    final spliceInsertMessage = this.spliceInsertMessage;
    final timeSignalMessage = this.timeSignalMessage;
    return {
      'OffsetMillis': offsetMillis,
      if (adBreakMetadata != null) 'AdBreakMetadata': adBreakMetadata,
      if (messageType != null) 'MessageType': messageType.value,
      if (slate != null) 'Slate': slate,
      if (spliceInsertMessage != null)
        'SpliceInsertMessage': spliceInsertMessage,
      if (timeSignalMessage != null) 'TimeSignalMessage': timeSignalMessage,
    };
  }
}

/// @nodoc
class MessageType {
  static const spliceInsert = MessageType._('SPLICE_INSERT');
  static const timeSignal = MessageType._('TIME_SIGNAL');

  final String value;

  const MessageType._(this.value);

  static const values = [spliceInsert, timeSignal];

  static MessageType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MessageType._(value));

  @override
  bool operator ==(other) => other is MessageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Slate VOD source configuration.
///
/// @nodoc
class SlateSource {
  /// The name of the source location where the slate VOD source is stored.
  final String? sourceLocationName;

  /// The slate VOD source name. The VOD source must already exist in a source
  /// location before it can be used for slate.
  final String? vodSourceName;

  SlateSource({
    this.sourceLocationName,
    this.vodSourceName,
  });

  factory SlateSource.fromJson(Map<String, dynamic> json) {
    return SlateSource(
      sourceLocationName: json['SourceLocationName'] as String?,
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceLocationName = this.sourceLocationName;
    final vodSourceName = this.vodSourceName;
    return {
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// Splice insert message configuration.
///
/// @nodoc
class SpliceInsertMessage {
  /// This is written to <code>splice_insert.avail_num</code>, as defined in
  /// section 9.7.3.1 of the SCTE-35 specification. The default value is
  /// <code>0</code>. Values must be between <code>0</code> and <code>256</code>,
  /// inclusive.
  final int? availNum;

  /// This is written to <code>splice_insert.avails_expected</code>, as defined in
  /// section 9.7.3.1 of the SCTE-35 specification. The default value is
  /// <code>0</code>. Values must be between <code>0</code> and <code>256</code>,
  /// inclusive.
  final int? availsExpected;

  /// This is written to <code>splice_insert.splice_event_id</code>, as defined in
  /// section 9.7.3.1 of the SCTE-35 specification. The default value is
  /// <code>1</code>.
  final int? spliceEventId;

  /// This is written to <code>splice_insert.unique_program_id</code>, as defined
  /// in section 9.7.3.1 of the SCTE-35 specification. The default value is
  /// <code>0</code>. Values must be between <code>0</code> and <code>256</code>,
  /// inclusive.
  final int? uniqueProgramId;

  SpliceInsertMessage({
    this.availNum,
    this.availsExpected,
    this.spliceEventId,
    this.uniqueProgramId,
  });

  factory SpliceInsertMessage.fromJson(Map<String, dynamic> json) {
    return SpliceInsertMessage(
      availNum: json['AvailNum'] as int?,
      availsExpected: json['AvailsExpected'] as int?,
      spliceEventId: json['SpliceEventId'] as int?,
      uniqueProgramId: json['UniqueProgramId'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final availNum = this.availNum;
    final availsExpected = this.availsExpected;
    final spliceEventId = this.spliceEventId;
    final uniqueProgramId = this.uniqueProgramId;
    return {
      if (availNum != null) 'AvailNum': availNum,
      if (availsExpected != null) 'AvailsExpected': availsExpected,
      if (spliceEventId != null) 'SpliceEventId': spliceEventId,
      if (uniqueProgramId != null) 'UniqueProgramId': uniqueProgramId,
    };
  }
}

/// The SCTE-35 <code>time_signal</code> message can be sent with one or more
/// <code>segmentation_descriptor</code> messages. A <code>time_signal</code>
/// message can be sent only if a single <code>segmentation_descriptor</code>
/// message is sent.
///
/// The <code>time_signal</code> message contains only the
/// <code>splice_time</code> field which is constructed using a given
/// presentation timestamp. When sending a <code>time_signal</code> message, the
/// <code>splice_command_type</code> field in the
/// <code>splice_info_section</code> message is set to 6 (0x06).
///
/// See the <code>time_signal()</code> table of the 2022 SCTE-35 specification
/// for more information.
///
/// @nodoc
class TimeSignalMessage {
  /// The configurations for the SCTE-35 <code>segmentation_descriptor</code>
  /// message(s) sent with the <code>time_signal</code> message.
  final List<SegmentationDescriptor>? segmentationDescriptors;

  TimeSignalMessage({
    this.segmentationDescriptors,
  });

  factory TimeSignalMessage.fromJson(Map<String, dynamic> json) {
    return TimeSignalMessage(
      segmentationDescriptors: (json['SegmentationDescriptors'] as List?)
          ?.nonNulls
          .map(
              (e) => SegmentationDescriptor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final segmentationDescriptors = this.segmentationDescriptors;
    return {
      if (segmentationDescriptors != null)
        'SegmentationDescriptors': segmentationDescriptors,
    };
  }
}

/// For <code>SCTE35_ENHANCED</code> output, defines a key and corresponding
/// value. MediaTailor generates these pairs within the
/// <code>EXT-X-ASSET</code>tag.
///
/// @nodoc
class KeyValuePair {
  /// For <code>SCTE35_ENHANCED</code> output, defines a key. MediaTailor takes
  /// this key, and its associated value, and generates the key/value pair within
  /// the <code>EXT-X-ASSET</code>tag. If you specify a key, you must also specify
  /// a corresponding value.
  final String key;

  /// For <code>SCTE35_ENHANCED</code> output, defines a value. MediaTailor; takes
  /// this value, and its associated key, and generates the key/value pair within
  /// the <code>EXT-X-ASSET</code>tag. If you specify a value, you must also
  /// specify a corresponding key.
  final String value;

  KeyValuePair({
    required this.key,
    required this.value,
  });

  factory KeyValuePair.fromJson(Map<String, dynamic> json) {
    return KeyValuePair(
      key: (json['Key'] as String?) ?? '',
      value: (json['Value'] as String?) ?? '',
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

/// The <code>segmentation_descriptor</code> message can contain advanced
/// metadata fields, like content identifiers, to convey a wide range of
/// information about the ad break. MediaTailor writes the ad metadata in the
/// egress manifest as part of the <code>EXT-X-DATERANGE</code> or
/// <code>EventStream</code> ad marker's SCTE-35 data.
///
/// <code>segmentation_descriptor</code> messages must be sent with the
/// <code>time_signal</code> message type.
///
/// See the <code>segmentation_descriptor()</code> table of the 2022 SCTE-35
/// specification for more information.
///
/// @nodoc
class SegmentationDescriptor {
  /// The segment number to assign to the
  /// <code>segmentation_descriptor.segment_num</code> message, as defined in
  /// section 10.3.3.1 of the 2022 SCTE-35 specification Values must be between 0
  /// and 256, inclusive. The default value is 0.
  final int? segmentNum;

  /// The Event Identifier to assign to the
  /// <code>segmentation_descriptor.segmentation_event_id</code> message, as
  /// defined in section 10.3.3.1 of the 2022 SCTE-35 specification. The default
  /// value is 1.
  final int? segmentationEventId;

  /// The Type Identifier to assign to the
  /// <code>segmentation_descriptor.segmentation_type_id</code> message, as
  /// defined in section 10.3.3.1 of the 2022 SCTE-35 specification. Values must
  /// be between 0 and 256, inclusive. The default value is 48.
  final int? segmentationTypeId;

  /// The Upid to assign to the
  /// <code>segmentation_descriptor.segmentation_upid</code> message, as defined
  /// in section 10.3.3.1 of the 2022 SCTE-35 specification. The value must be a
  /// hexadecimal string containing only the characters 0 though 9 and A through
  /// F. The default value is "" (an empty string).
  final String? segmentationUpid;

  /// The Upid Type to assign to the
  /// <code>segmentation_descriptor.segmentation_upid_type</code> message, as
  /// defined in section 10.3.3.1 of the 2022 SCTE-35 specification. Values must
  /// be between 0 and 256, inclusive. The default value is 14.
  final int? segmentationUpidType;

  /// The number of segments expected, which is assigned to the
  /// <code>segmentation_descriptor.segments_expectedS</code> message, as defined
  /// in section 10.3.3.1 of the 2022 SCTE-35 specification Values must be between
  /// 0 and 256, inclusive. The default value is 0.
  final int? segmentsExpected;

  /// The sub-segment number to assign to the
  /// <code>segmentation_descriptor.sub_segment_num</code> message, as defined in
  /// section 10.3.3.1 of the 2022 SCTE-35 specification. Values must be between 0
  /// and 256, inclusive. The defualt value is null.
  final int? subSegmentNum;

  /// The number of sub-segments expected, which is assigned to the
  /// <code>segmentation_descriptor.sub_segments_expected</code> message, as
  /// defined in section 10.3.3.1 of the 2022 SCTE-35 specification. Values must
  /// be between 0 and 256, inclusive. The default value is null.
  final int? subSegmentsExpected;

  SegmentationDescriptor({
    this.segmentNum,
    this.segmentationEventId,
    this.segmentationTypeId,
    this.segmentationUpid,
    this.segmentationUpidType,
    this.segmentsExpected,
    this.subSegmentNum,
    this.subSegmentsExpected,
  });

  factory SegmentationDescriptor.fromJson(Map<String, dynamic> json) {
    return SegmentationDescriptor(
      segmentNum: json['SegmentNum'] as int?,
      segmentationEventId: json['SegmentationEventId'] as int?,
      segmentationTypeId: json['SegmentationTypeId'] as int?,
      segmentationUpid: json['SegmentationUpid'] as String?,
      segmentationUpidType: json['SegmentationUpidType'] as int?,
      segmentsExpected: json['SegmentsExpected'] as int?,
      subSegmentNum: json['SubSegmentNum'] as int?,
      subSegmentsExpected: json['SubSegmentsExpected'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final segmentNum = this.segmentNum;
    final segmentationEventId = this.segmentationEventId;
    final segmentationTypeId = this.segmentationTypeId;
    final segmentationUpid = this.segmentationUpid;
    final segmentationUpidType = this.segmentationUpidType;
    final segmentsExpected = this.segmentsExpected;
    final subSegmentNum = this.subSegmentNum;
    final subSegmentsExpected = this.subSegmentsExpected;
    return {
      if (segmentNum != null) 'SegmentNum': segmentNum,
      if (segmentationEventId != null)
        'SegmentationEventId': segmentationEventId,
      if (segmentationTypeId != null) 'SegmentationTypeId': segmentationTypeId,
      if (segmentationUpid != null) 'SegmentationUpid': segmentationUpid,
      if (segmentationUpidType != null)
        'SegmentationUpidType': segmentationUpidType,
      if (segmentsExpected != null) 'SegmentsExpected': segmentsExpected,
      if (subSegmentNum != null) 'SubSegmentNum': subSegmentNum,
      if (subSegmentsExpected != null)
        'SubSegmentsExpected': subSegmentsExpected,
    };
  }
}

/// Schedule configuration parameters.
///
/// @nodoc
class UpdateProgramScheduleConfiguration {
  /// Program clip range configuration.
  final ClipRange? clipRange;

  /// Program transition configuration.
  final UpdateProgramTransition? transition;

  UpdateProgramScheduleConfiguration({
    this.clipRange,
    this.transition,
  });

  Map<String, dynamic> toJson() {
    final clipRange = this.clipRange;
    final transition = this.transition;
    return {
      if (clipRange != null) 'ClipRange': clipRange,
      if (transition != null) 'Transition': transition,
    };
  }
}

/// Program transition configuration.
///
/// @nodoc
class UpdateProgramTransition {
  /// The duration of the live program in seconds.
  final int? durationMillis;

  /// The date and time that the program is scheduled to start, in epoch
  /// milliseconds.
  final int? scheduledStartTimeMillis;

  UpdateProgramTransition({
    this.durationMillis,
    this.scheduledStartTimeMillis,
  });

  Map<String, dynamic> toJson() {
    final durationMillis = this.durationMillis;
    final scheduledStartTimeMillis = this.scheduledStartTimeMillis;
    return {
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (scheduledStartTimeMillis != null)
        'ScheduledStartTimeMillis': scheduledStartTimeMillis,
    };
  }
}

/// Schedule configuration parameters. A channel must be stopped before changes
/// can be made to the schedule.
///
/// @nodoc
class ScheduleConfiguration {
  /// Program transition configurations.
  final Transition transition;

  /// Program clip range configuration.
  final ClipRange? clipRange;

  ScheduleConfiguration({
    required this.transition,
    this.clipRange,
  });

  Map<String, dynamic> toJson() {
    final transition = this.transition;
    final clipRange = this.clipRange;
    return {
      'Transition': transition,
      if (clipRange != null) 'ClipRange': clipRange,
    };
  }
}

/// Program transition configuration.
///
/// @nodoc
class Transition {
  /// The position where this program will be inserted relative to the
  /// <code>RelativePosition</code>.
  final RelativePosition relativePosition;

  /// Defines when the program plays in the schedule. You can set the value to
  /// <code>ABSOLUTE</code> or <code>RELATIVE</code>.
  ///
  /// <code>ABSOLUTE</code> - The program plays at a specific wall clock time.
  /// This setting can only be used for channels using the <code>LINEAR</code>
  /// <code>PlaybackMode</code>.
  ///
  /// Note the following considerations when using <code>ABSOLUTE</code>
  /// transitions:
  ///
  /// If the preceding program in the schedule has a duration that extends past
  /// the wall clock time, MediaTailor truncates the preceding program on a common
  /// segment boundary.
  ///
  /// If there are gaps in playback, MediaTailor plays the
  /// <code>FillerSlate</code> you configured for your linear channel.
  ///
  /// <code>RELATIVE</code> - The program is inserted into the schedule either
  /// before or after a program that you specify via
  /// <code>RelativePosition</code>.
  final String type;

  /// The duration of the live program in seconds.
  final int? durationMillis;

  /// The name of the program that this program will be inserted next to, as
  /// defined by <code>RelativePosition</code>.
  final String? relativeProgram;

  /// The date and time that the program is scheduled to start, in epoch
  /// milliseconds.
  final int? scheduledStartTimeMillis;

  Transition({
    required this.relativePosition,
    required this.type,
    this.durationMillis,
    this.relativeProgram,
    this.scheduledStartTimeMillis,
  });

  Map<String, dynamic> toJson() {
    final relativePosition = this.relativePosition;
    final type = this.type;
    final durationMillis = this.durationMillis;
    final relativeProgram = this.relativeProgram;
    final scheduledStartTimeMillis = this.scheduledStartTimeMillis;
    return {
      'RelativePosition': relativePosition.value,
      'Type': type,
      if (durationMillis != null) 'DurationMillis': durationMillis,
      if (relativeProgram != null) 'RelativeProgram': relativeProgram,
      if (scheduledStartTimeMillis != null)
        'ScheduledStartTimeMillis': scheduledStartTimeMillis,
    };
  }
}

/// @nodoc
class RelativePosition {
  static const beforeProgram = RelativePosition._('BEFORE_PROGRAM');
  static const afterProgram = RelativePosition._('AFTER_PROGRAM');

  final String value;

  const RelativePosition._(this.value);

  static const values = [beforeProgram, afterProgram];

  static RelativePosition fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RelativePosition._(value));

  @override
  bool operator ==(other) => other is RelativePosition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The properties for a schedule.
///
/// @nodoc
class ScheduleEntry {
  /// The ARN of the program.
  final String arn;

  /// The name of the channel that uses this schedule.
  final String channelName;

  /// The name of the program.
  final String programName;

  /// The name of the source location.
  final String sourceLocationName;

  /// The approximate duration of this program, in seconds.
  final int? approximateDurationSeconds;

  /// The approximate time that the program will start playing.
  final DateTime? approximateStartTime;

  /// The list of audiences defined in ScheduleEntry.
  final List<String>? audiences;

  /// The name of the live source used for the program.
  final String? liveSourceName;

  /// The schedule's ad break properties.
  final List<ScheduleAdBreak>? scheduleAdBreaks;

  /// The type of schedule entry.
  final ScheduleEntryType? scheduleEntryType;

  /// The name of the VOD source.
  final String? vodSourceName;

  ScheduleEntry({
    required this.arn,
    required this.channelName,
    required this.programName,
    required this.sourceLocationName,
    this.approximateDurationSeconds,
    this.approximateStartTime,
    this.audiences,
    this.liveSourceName,
    this.scheduleAdBreaks,
    this.scheduleEntryType,
    this.vodSourceName,
  });

  factory ScheduleEntry.fromJson(Map<String, dynamic> json) {
    return ScheduleEntry(
      arn: (json['Arn'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      programName: (json['ProgramName'] as String?) ?? '',
      sourceLocationName: (json['SourceLocationName'] as String?) ?? '',
      approximateDurationSeconds: json['ApproximateDurationSeconds'] as int?,
      approximateStartTime: timeStampFromJson(json['ApproximateStartTime']),
      audiences: (json['Audiences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      liveSourceName: json['LiveSourceName'] as String?,
      scheduleAdBreaks: (json['ScheduleAdBreaks'] as List?)
          ?.nonNulls
          .map((e) => ScheduleAdBreak.fromJson(e as Map<String, dynamic>))
          .toList(),
      scheduleEntryType: (json['ScheduleEntryType'] as String?)
          ?.let(ScheduleEntryType.fromString),
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelName = this.channelName;
    final programName = this.programName;
    final sourceLocationName = this.sourceLocationName;
    final approximateDurationSeconds = this.approximateDurationSeconds;
    final approximateStartTime = this.approximateStartTime;
    final audiences = this.audiences;
    final liveSourceName = this.liveSourceName;
    final scheduleAdBreaks = this.scheduleAdBreaks;
    final scheduleEntryType = this.scheduleEntryType;
    final vodSourceName = this.vodSourceName;
    return {
      'Arn': arn,
      'ChannelName': channelName,
      'ProgramName': programName,
      'SourceLocationName': sourceLocationName,
      if (approximateDurationSeconds != null)
        'ApproximateDurationSeconds': approximateDurationSeconds,
      if (approximateStartTime != null)
        'ApproximateStartTime': unixTimestampToJson(approximateStartTime),
      if (audiences != null) 'Audiences': audiences,
      if (liveSourceName != null) 'LiveSourceName': liveSourceName,
      if (scheduleAdBreaks != null) 'ScheduleAdBreaks': scheduleAdBreaks,
      if (scheduleEntryType != null)
        'ScheduleEntryType': scheduleEntryType.value,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class ScheduleEntryType {
  static const program = ScheduleEntryType._('PROGRAM');
  static const fillerSlate = ScheduleEntryType._('FILLER_SLATE');
  static const alternateMedia = ScheduleEntryType._('ALTERNATE_MEDIA');

  final String value;

  const ScheduleEntryType._(this.value);

  static const values = [program, fillerSlate, alternateMedia];

  static ScheduleEntryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ScheduleEntryType._(value));

  @override
  bool operator ==(other) => other is ScheduleEntryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The schedule's ad break properties.
///
/// @nodoc
class ScheduleAdBreak {
  /// The approximate duration of the ad break, in seconds.
  final int? approximateDurationSeconds;

  /// The approximate time that the ad will start playing.
  final DateTime? approximateStartTime;

  /// The name of the source location containing the VOD source used for the ad
  /// break.
  final String? sourceLocationName;

  /// The name of the VOD source used for the ad break.
  final String? vodSourceName;

  ScheduleAdBreak({
    this.approximateDurationSeconds,
    this.approximateStartTime,
    this.sourceLocationName,
    this.vodSourceName,
  });

  factory ScheduleAdBreak.fromJson(Map<String, dynamic> json) {
    return ScheduleAdBreak(
      approximateDurationSeconds: json['ApproximateDurationSeconds'] as int?,
      approximateStartTime: timeStampFromJson(json['ApproximateStartTime']),
      sourceLocationName: json['SourceLocationName'] as String?,
      vodSourceName: json['VodSourceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateDurationSeconds = this.approximateDurationSeconds;
    final approximateStartTime = this.approximateStartTime;
    final sourceLocationName = this.sourceLocationName;
    final vodSourceName = this.vodSourceName;
    return {
      if (approximateDurationSeconds != null)
        'ApproximateDurationSeconds': approximateDurationSeconds,
      if (approximateStartTime != null)
        'ApproximateStartTime': unixTimestampToJson(approximateStartTime),
      if (sourceLocationName != null) 'SourceLocationName': sourceLocationName,
      if (vodSourceName != null) 'VodSourceName': vodSourceName,
    };
  }
}

/// @nodoc
class LogType {
  static const asRun = LogType._('AS_RUN');

  final String value;

  const LogType._(this.value);

  static const values = [asRun];

  static LogType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => LogType._(value));

  @override
  bool operator ==(other) => other is LogType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration parameters for a channel. For information about
/// MediaTailor channels, see <a
/// href="https://docs.aws.amazon.com/mediatailor/latest/ug/channel-assembly-channels.html">Working
/// with channels</a> in the <i>MediaTailor User Guide</i>.
///
/// @nodoc
class Channel {
  /// The ARN of the channel.
  final String arn;

  /// The name of the channel.
  final String channelName;

  /// Returns the state whether the channel is running or not.
  final String channelState;

  /// The log configuration.
  final LogConfigurationForChannel logConfiguration;

  /// The channel's output properties.
  final List<ResponseOutputItem> outputs;

  /// The type of playback mode for this channel.
  ///
  /// <code>LINEAR</code> - Programs play back-to-back only once.
  ///
  /// <code>LOOP</code> - Programs play back-to-back in an endless loop. When the
  /// last program in the schedule plays, playback loops back to the first program
  /// in the schedule.
  final String playbackMode;

  /// The tier for this channel. STANDARD tier channels can contain live programs.
  final String tier;

  /// The list of audiences defined in channel.
  final List<String>? audiences;

  /// The timestamp of when the channel was created.
  final DateTime? creationTime;

  /// The slate used to fill gaps between programs in the schedule. You must
  /// configure filler slate if your channel uses the <code>LINEAR</code>
  /// <code>PlaybackMode</code>. MediaTailor doesn't support filler slate for
  /// channels using the <code>LOOP</code> <code>PlaybackMode</code>.
  final SlateSource? fillerSlate;

  /// The timestamp of when the channel was last modified.
  final DateTime? lastModifiedTime;

  /// The tags to assign to the channel. Tags are key-value pairs that you can
  /// associate with Amazon resources to help with organization, access control,
  /// and cost tracking. For more information, see <a
  /// href="https://docs.aws.amazon.com/mediatailor/latest/ug/tagging.html">Tagging
  /// AWS Elemental MediaTailor Resources</a>.
  final Map<String, String>? tags;

  Channel({
    required this.arn,
    required this.channelName,
    required this.channelState,
    required this.logConfiguration,
    required this.outputs,
    required this.playbackMode,
    required this.tier,
    this.audiences,
    this.creationTime,
    this.fillerSlate,
    this.lastModifiedTime,
    this.tags,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      arn: (json['Arn'] as String?) ?? '',
      channelName: (json['ChannelName'] as String?) ?? '',
      channelState: (json['ChannelState'] as String?) ?? '',
      logConfiguration: LogConfigurationForChannel.fromJson(
          (json['LogConfiguration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      outputs: ((json['Outputs'] as List?) ?? const [])
          .nonNulls
          .map((e) => ResponseOutputItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      playbackMode: (json['PlaybackMode'] as String?) ?? '',
      tier: (json['Tier'] as String?) ?? '',
      audiences: (json['Audiences'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      creationTime: timeStampFromJson(json['CreationTime']),
      fillerSlate: json['FillerSlate'] != null
          ? SlateSource.fromJson(json['FillerSlate'] as Map<String, dynamic>)
          : null,
      lastModifiedTime: timeStampFromJson(json['LastModifiedTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final channelName = this.channelName;
    final channelState = this.channelState;
    final logConfiguration = this.logConfiguration;
    final outputs = this.outputs;
    final playbackMode = this.playbackMode;
    final tier = this.tier;
    final audiences = this.audiences;
    final creationTime = this.creationTime;
    final fillerSlate = this.fillerSlate;
    final lastModifiedTime = this.lastModifiedTime;
    final tags = this.tags;
    return {
      'Arn': arn,
      'ChannelName': channelName,
      'ChannelState': channelState,
      'LogConfiguration': logConfiguration,
      'Outputs': outputs,
      'PlaybackMode': playbackMode,
      'Tier': tier,
      if (audiences != null) 'Audiences': audiences,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (fillerSlate != null) 'FillerSlate': fillerSlate,
      if (lastModifiedTime != null)
        'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      if (tags != null) 'tags': tags,
    };
  }
}

/// The log configuration for the channel.
///
/// @nodoc
class LogConfigurationForChannel {
  /// The log types.
  final List<LogType>? logTypes;

  LogConfigurationForChannel({
    this.logTypes,
  });

  factory LogConfigurationForChannel.fromJson(Map<String, dynamic> json) {
    return LogConfigurationForChannel(
      logTypes: (json['LogTypes'] as List?)
          ?.nonNulls
          .map((e) => LogType.fromString((e as String)))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final logTypes = this.logTypes;
    return {
      if (logTypes != null) 'LogTypes': logTypes.map((e) => e.value).toList(),
    };
  }
}

/// The output item response.
///
/// @nodoc
class ResponseOutputItem {
  /// The name of the manifest for the channel that will appear in the channel
  /// output's playback URL.
  final String manifestName;

  /// The URL used for playback by content players.
  final String playbackUrl;

  /// A string used to associate a package configuration source group with a
  /// channel output.
  final String sourceGroup;

  /// DASH manifest configuration settings.
  final DashPlaylistSettings? dashPlaylistSettings;

  /// HLS manifest configuration settings.
  final HlsPlaylistSettings? hlsPlaylistSettings;

  ResponseOutputItem({
    required this.manifestName,
    required this.playbackUrl,
    required this.sourceGroup,
    this.dashPlaylistSettings,
    this.hlsPlaylistSettings,
  });

  factory ResponseOutputItem.fromJson(Map<String, dynamic> json) {
    return ResponseOutputItem(
      manifestName: (json['ManifestName'] as String?) ?? '',
      playbackUrl: (json['PlaybackUrl'] as String?) ?? '',
      sourceGroup: (json['SourceGroup'] as String?) ?? '',
      dashPlaylistSettings: json['DashPlaylistSettings'] != null
          ? DashPlaylistSettings.fromJson(
              json['DashPlaylistSettings'] as Map<String, dynamic>)
          : null,
      hlsPlaylistSettings: json['HlsPlaylistSettings'] != null
          ? HlsPlaylistSettings.fromJson(
              json['HlsPlaylistSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final playbackUrl = this.playbackUrl;
    final sourceGroup = this.sourceGroup;
    final dashPlaylistSettings = this.dashPlaylistSettings;
    final hlsPlaylistSettings = this.hlsPlaylistSettings;
    return {
      'ManifestName': manifestName,
      'PlaybackUrl': playbackUrl,
      'SourceGroup': sourceGroup,
      if (dashPlaylistSettings != null)
        'DashPlaylistSettings': dashPlaylistSettings,
      if (hlsPlaylistSettings != null)
        'HlsPlaylistSettings': hlsPlaylistSettings,
    };
  }
}

/// Dash manifest configuration parameters.
///
/// @nodoc
class DashPlaylistSettings {
  /// The total duration (in seconds) of each manifest. Minimum value:
  /// <code>30</code> seconds. Maximum value: <code>3600</code> seconds.
  final int? manifestWindowSeconds;

  /// Minimum amount of content (measured in seconds) that a player must keep
  /// available in the buffer. Minimum value: <code>2</code> seconds. Maximum
  /// value: <code>60</code> seconds.
  final int? minBufferTimeSeconds;

  /// Minimum amount of time (in seconds) that the player should wait before
  /// requesting updates to the manifest. Minimum value: <code>2</code> seconds.
  /// Maximum value: <code>60</code> seconds.
  final int? minUpdatePeriodSeconds;

  /// Amount of time (in seconds) that the player should be from the live point at
  /// the end of the manifest. Minimum value: <code>2</code> seconds. Maximum
  /// value: <code>60</code> seconds.
  final int? suggestedPresentationDelaySeconds;

  DashPlaylistSettings({
    this.manifestWindowSeconds,
    this.minBufferTimeSeconds,
    this.minUpdatePeriodSeconds,
    this.suggestedPresentationDelaySeconds,
  });

  factory DashPlaylistSettings.fromJson(Map<String, dynamic> json) {
    return DashPlaylistSettings(
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
      minBufferTimeSeconds: json['MinBufferTimeSeconds'] as int?,
      minUpdatePeriodSeconds: json['MinUpdatePeriodSeconds'] as int?,
      suggestedPresentationDelaySeconds:
          json['SuggestedPresentationDelaySeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final manifestWindowSeconds = this.manifestWindowSeconds;
    final minBufferTimeSeconds = this.minBufferTimeSeconds;
    final minUpdatePeriodSeconds = this.minUpdatePeriodSeconds;
    final suggestedPresentationDelaySeconds =
        this.suggestedPresentationDelaySeconds;
    return {
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
      if (minBufferTimeSeconds != null)
        'MinBufferTimeSeconds': minBufferTimeSeconds,
      if (minUpdatePeriodSeconds != null)
        'MinUpdatePeriodSeconds': minUpdatePeriodSeconds,
      if (suggestedPresentationDelaySeconds != null)
        'SuggestedPresentationDelaySeconds': suggestedPresentationDelaySeconds,
    };
  }
}

/// HLS playlist configuration parameters.
///
/// @nodoc
class HlsPlaylistSettings {
  /// Determines the type of SCTE 35 tags to use in ad markup. Specify
  /// <code>DATERANGE</code> to use <code>DATERANGE</code> tags (for live or VOD
  /// content). Specify <code>SCTE35_ENHANCED</code> to use
  /// <code>EXT-X-CUE-OUT</code> and <code>EXT-X-CUE-IN</code> tags (for VOD
  /// content only).
  final List<AdMarkupType>? adMarkupType;

  /// The total duration (in seconds) of each manifest. Minimum value:
  /// <code>30</code> seconds. Maximum value: <code>3600</code> seconds.
  final int? manifestWindowSeconds;

  HlsPlaylistSettings({
    this.adMarkupType,
    this.manifestWindowSeconds,
  });

  factory HlsPlaylistSettings.fromJson(Map<String, dynamic> json) {
    return HlsPlaylistSettings(
      adMarkupType: (json['AdMarkupType'] as List?)
          ?.nonNulls
          .map((e) => AdMarkupType.fromString((e as String)))
          .toList(),
      manifestWindowSeconds: json['ManifestWindowSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final adMarkupType = this.adMarkupType;
    final manifestWindowSeconds = this.manifestWindowSeconds;
    return {
      if (adMarkupType != null)
        'AdMarkupType': adMarkupType.map((e) => e.value).toList(),
      if (manifestWindowSeconds != null)
        'ManifestWindowSeconds': manifestWindowSeconds,
    };
  }
}

/// @nodoc
class AdMarkupType {
  static const daterange = AdMarkupType._('DATERANGE');
  static const scte35Enhanced = AdMarkupType._('SCTE35_ENHANCED');

  final String value;

  const AdMarkupType._(this.value);

  static const values = [daterange, scte35Enhanced];

  static AdMarkupType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AdMarkupType._(value));

  @override
  bool operator ==(other) => other is AdMarkupType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ChannelState {
  static const running = ChannelState._('RUNNING');
  static const stopped = ChannelState._('STOPPED');

  final String value;

  const ChannelState._(this.value);

  static const values = [running, stopped];

  static ChannelState fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChannelState._(value));

  @override
  bool operator ==(other) => other is ChannelState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// The configuration for time-shifted viewing.
///
/// @nodoc
class TimeShiftConfiguration {
  /// The maximum time delay for time-shifted viewing. The minimum allowed maximum
  /// time delay is 0 seconds, and the maximum allowed maximum time delay is 21600
  /// seconds (6 hours).
  final int maxTimeDelaySeconds;

  TimeShiftConfiguration({
    required this.maxTimeDelaySeconds,
  });

  factory TimeShiftConfiguration.fromJson(Map<String, dynamic> json) {
    return TimeShiftConfiguration(
      maxTimeDelaySeconds: (json['MaxTimeDelaySeconds'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final maxTimeDelaySeconds = this.maxTimeDelaySeconds;
    return {
      'MaxTimeDelaySeconds': maxTimeDelaySeconds,
    };
  }
}

/// The output configuration for this channel.
///
/// @nodoc
class RequestOutputItem {
  /// The name of the manifest for the channel. The name appears in the
  /// <code>PlaybackUrl</code>.
  final String manifestName;

  /// A string used to match which <code>HttpPackageConfiguration</code> is used
  /// for each <code>VodSource</code>.
  final String sourceGroup;

  /// DASH manifest configuration parameters.
  final DashPlaylistSettings? dashPlaylistSettings;

  /// HLS playlist configuration parameters.
  final HlsPlaylistSettings? hlsPlaylistSettings;

  RequestOutputItem({
    required this.manifestName,
    required this.sourceGroup,
    this.dashPlaylistSettings,
    this.hlsPlaylistSettings,
  });

  Map<String, dynamic> toJson() {
    final manifestName = this.manifestName;
    final sourceGroup = this.sourceGroup;
    final dashPlaylistSettings = this.dashPlaylistSettings;
    final hlsPlaylistSettings = this.hlsPlaylistSettings;
    return {
      'ManifestName': manifestName,
      'SourceGroup': sourceGroup,
      if (dashPlaylistSettings != null)
        'DashPlaylistSettings': dashPlaylistSettings,
      if (hlsPlaylistSettings != null)
        'HlsPlaylistSettings': hlsPlaylistSettings,
    };
  }
}

/// @nodoc
class PlaybackMode {
  static const loop = PlaybackMode._('LOOP');
  static const linear = PlaybackMode._('LINEAR');

  final String value;

  const PlaybackMode._(this.value);

  static const values = [loop, linear];

  static PlaybackMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PlaybackMode._(value));

  @override
  bool operator ==(other) => other is PlaybackMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Tier {
  static const basic = Tier._('BASIC');
  static const standard = Tier._('STANDARD');

  final String value;

  const Tier._(this.value);

  static const values = [basic, standard];

  static Tier fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Tier._(value));

  @override
  bool operator ==(other) => other is Tier && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Alert configuration parameters.
///
/// @nodoc
class Alert {
  /// The code for the alert. For example, <code>NOT_PROCESSED</code>.
  final String alertCode;

  /// If an alert is generated for a resource, an explanation of the reason for
  /// the alert.
  final String alertMessage;

  /// The timestamp when the alert was last modified.
  final DateTime lastModifiedTime;

  /// The Amazon Resource Names (ARNs) related to this alert.
  final List<String> relatedResourceArns;

  /// The Amazon Resource Name (ARN) of the resource.
  final String resourceArn;

  /// The category that MediaTailor assigns to the alert.
  final AlertCategory? category;

  Alert({
    required this.alertCode,
    required this.alertMessage,
    required this.lastModifiedTime,
    required this.relatedResourceArns,
    required this.resourceArn,
    this.category,
  });

  factory Alert.fromJson(Map<String, dynamic> json) {
    return Alert(
      alertCode: (json['AlertCode'] as String?) ?? '',
      alertMessage: (json['AlertMessage'] as String?) ?? '',
      lastModifiedTime:
          nonNullableTimeStampFromJson(json['LastModifiedTime'] ?? 0),
      relatedResourceArns: ((json['RelatedResourceArns'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      resourceArn: (json['ResourceArn'] as String?) ?? '',
      category: (json['Category'] as String?)?.let(AlertCategory.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final alertCode = this.alertCode;
    final alertMessage = this.alertMessage;
    final lastModifiedTime = this.lastModifiedTime;
    final relatedResourceArns = this.relatedResourceArns;
    final resourceArn = this.resourceArn;
    final category = this.category;
    return {
      'AlertCode': alertCode,
      'AlertMessage': alertMessage,
      'LastModifiedTime': unixTimestampToJson(lastModifiedTime),
      'RelatedResourceArns': relatedResourceArns,
      'ResourceArn': resourceArn,
      if (category != null) 'Category': category.value,
    };
  }
}

/// @nodoc
class AlertCategory {
  static const schedulingError = AlertCategory._('SCHEDULING_ERROR');
  static const playbackWarning = AlertCategory._('PLAYBACK_WARNING');
  static const info = AlertCategory._('INFO');

  final String value;

  const AlertCategory._(this.value);

  static const values = [schedulingError, playbackWarning, info];

  static AlertCategory fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AlertCategory._(value));

  @override
  bool operator ==(other) => other is AlertCategory && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
};
