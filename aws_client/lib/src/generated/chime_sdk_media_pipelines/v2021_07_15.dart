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

/// The Amazon Chime SDK media pipeline APIs in this section allow software
/// developers to create Amazon Chime SDK media pipelines that capture,
/// concatenate, or stream your Amazon Chime SDK meetings. For more information
/// about media pipelines, see <a
/// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_Operations_Amazon_Chime_SDK_Media_Pipelines.html">Amazon
/// Chime SDK media pipelines</a>.
class ChimeSdkMediaPipelines {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkMediaPipelines({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'media-pipelines-chime',
            signingName: 'chime',
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

  /// Creates a media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sinkArn] :
  /// The ARN of the sink type.
  ///
  /// Parameter [sinkType] :
  /// Destination type to which the media artifacts are saved. You must use an
  /// S3 bucket.
  ///
  /// Parameter [sourceArn] :
  /// ARN of the source from which the media artifacts are captured.
  ///
  /// Parameter [sourceType] :
  /// Source type from which the media artifacts are captured. A Chime SDK
  /// Meeting is the only supported source.
  ///
  /// Parameter [chimeSdkMeetingConfiguration] :
  /// The configuration for a specified media pipeline. <code>SourceType</code>
  /// must be <code>ChimeSdkMeeting</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. The token makes the API
  /// request idempotent. Use a unique token for each media pipeline request.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<CreateMediaCapturePipelineResponse> createMediaCapturePipeline({
    required String sinkArn,
    required MediaPipelineSinkType sinkType,
    required String sourceArn,
    required MediaPipelineSourceType sourceType,
    ChimeSdkMeetingConfiguration? chimeSdkMeetingConfiguration,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'SinkArn': sinkArn,
      'SinkType': sinkType.toValue(),
      'SourceArn': sourceArn,
      'SourceType': sourceType.toValue(),
      if (chimeSdkMeetingConfiguration != null)
        'ChimeSdkMeetingConfiguration': chimeSdkMeetingConfiguration,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sdk-media-capture-pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaCapturePipelineResponse.fromJson(response);
  }

  /// Creates a media concatenation pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sinks] :
  /// An object that specifies the data sinks for the media concatenation
  /// pipeline.
  ///
  /// Parameter [sources] :
  /// An object that specifies the sources for the media concatenation pipeline.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. The token makes the API
  /// request idempotent. Use a unique token for each media concatenation
  /// pipeline request.
  ///
  /// Parameter [tags] :
  /// The tags associated with the media concatenation pipeline.
  Future<CreateMediaConcatenationPipelineResponse>
      createMediaConcatenationPipeline({
    required List<ConcatenationSink> sinks,
    required List<ConcatenationSource> sources,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Sinks': sinks,
      'Sources': sources,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sdk-media-concatenation-pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaConcatenationPipelineResponse.fromJson(response);
  }

  /// Creates a media insights pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaInsightsPipelineConfigurationArn] :
  /// The ARN of the pipeline's configuration.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the media insights pipeline request.
  ///
  /// Parameter [kinesisVideoStreamRecordingSourceRuntimeConfiguration] :
  /// The runtime configuration for the Kinesis video recording stream source.
  ///
  /// Parameter [kinesisVideoStreamSourceRuntimeConfiguration] :
  /// The runtime configuration for the Kinesis video stream source of the media
  /// insights pipeline.
  ///
  /// Parameter [mediaInsightsRuntimeMetadata] :
  /// The runtime metadata for the media insights pipeline. Consists of a
  /// key-value map of strings.
  ///
  /// Parameter [s3RecordingSinkRuntimeConfiguration] :
  /// The runtime configuration for the S3 recording sink. If specified, the
  /// settings in this structure override any settings in
  /// <code>S3RecordingSinkConfiguration</code>.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the media insights pipeline.
  Future<CreateMediaInsightsPipelineResponse> createMediaInsightsPipeline({
    required String mediaInsightsPipelineConfigurationArn,
    String? clientRequestToken,
    KinesisVideoStreamRecordingSourceRuntimeConfiguration?
        kinesisVideoStreamRecordingSourceRuntimeConfiguration,
    KinesisVideoStreamSourceRuntimeConfiguration?
        kinesisVideoStreamSourceRuntimeConfiguration,
    Map<String, String>? mediaInsightsRuntimeMetadata,
    S3RecordingSinkRuntimeConfiguration? s3RecordingSinkRuntimeConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'MediaInsightsPipelineConfigurationArn':
          mediaInsightsPipelineConfigurationArn,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (kinesisVideoStreamRecordingSourceRuntimeConfiguration != null)
        'KinesisVideoStreamRecordingSourceRuntimeConfiguration':
            kinesisVideoStreamRecordingSourceRuntimeConfiguration,
      if (kinesisVideoStreamSourceRuntimeConfiguration != null)
        'KinesisVideoStreamSourceRuntimeConfiguration':
            kinesisVideoStreamSourceRuntimeConfiguration,
      if (mediaInsightsRuntimeMetadata != null)
        'MediaInsightsRuntimeMetadata': mediaInsightsRuntimeMetadata,
      if (s3RecordingSinkRuntimeConfiguration != null)
        'S3RecordingSinkRuntimeConfiguration':
            s3RecordingSinkRuntimeConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/media-insights-pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaInsightsPipelineResponse.fromJson(response);
  }

  /// A structure that contains the static configurations for a media insights
  /// pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [elements] :
  /// The elements in the request, such as a processor for Amazon Transcribe or
  /// a sink for a Kinesis Data Stream.
  ///
  /// Parameter [mediaInsightsPipelineConfigurationName] :
  /// The name of the media insights pipeline configuration.
  ///
  /// Parameter [resourceAccessRoleArn] :
  /// The ARN of the role used by the service to access Amazon Web Services
  /// resources, including <code>Transcribe</code> and <code>Transcribe Call
  /// Analytics</code>, on the caller’s behalf.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the media insights pipeline configuration
  /// request.
  ///
  /// Parameter [realTimeAlertConfiguration] :
  /// The configuration settings for the real-time alerts in a media insights
  /// pipeline configuration.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the media insights pipeline configuration.
  Future<CreateMediaInsightsPipelineConfigurationResponse>
      createMediaInsightsPipelineConfiguration({
    required List<MediaInsightsPipelineConfigurationElement> elements,
    required String mediaInsightsPipelineConfigurationName,
    required String resourceAccessRoleArn,
    String? clientRequestToken,
    RealTimeAlertConfiguration? realTimeAlertConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Elements': elements,
      'MediaInsightsPipelineConfigurationName':
          mediaInsightsPipelineConfigurationName,
      'ResourceAccessRoleArn': resourceAccessRoleArn,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (realTimeAlertConfiguration != null)
        'RealTimeAlertConfiguration': realTimeAlertConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/media-insights-pipeline-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaInsightsPipelineConfigurationResponse.fromJson(response);
  }

  /// Creates a media live connector pipeline in an Amazon Chime SDK meeting.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sinks] :
  /// The media live connector pipeline's data sinks.
  ///
  /// Parameter [sources] :
  /// The media live connector pipeline's data sources.
  ///
  /// Parameter [clientRequestToken] :
  /// The token assigned to the client making the request.
  ///
  /// Parameter [tags] :
  /// The tags associated with the media live connector pipeline.
  Future<CreateMediaLiveConnectorPipelineResponse>
      createMediaLiveConnectorPipeline({
    required List<LiveConnectorSinkConfiguration> sinks,
    required List<LiveConnectorSourceConfiguration> sources,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Sinks': sinks,
      'Sources': sources,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sdk-media-live-connector-pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaLiveConnectorPipelineResponse.fromJson(response);
  }

  /// Creates an Kinesis video stream pool for the media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [poolName] :
  /// The name of the video stream pool.
  ///
  /// Parameter [streamConfiguration] :
  /// The configuration settings for the video stream.
  ///
  /// Parameter [clientRequestToken] :
  /// The token assigned to the client making the request.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the video stream pool.
  Future<CreateMediaPipelineKinesisVideoStreamPoolResponse>
      createMediaPipelineKinesisVideoStreamPool({
    required String poolName,
    required KinesisVideoStreamConfiguration streamConfiguration,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'PoolName': poolName,
      'StreamConfiguration': streamConfiguration,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/media-pipeline-kinesis-video-stream-pools',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaPipelineKinesisVideoStreamPoolResponse.fromJson(response);
  }

  /// Creates a streaming media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sinks] :
  /// The data sink for the media pipeline.
  ///
  /// Parameter [sources] :
  /// The data sources for the media pipeline.
  ///
  /// Parameter [clientRequestToken] :
  /// The token assigned to the client making the request.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the media pipeline.
  Future<CreateMediaStreamPipelineResponse> createMediaStreamPipeline({
    required List<MediaStreamSink> sinks,
    required List<MediaStreamSource> sources,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Sinks': sinks,
      'Sources': sources,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sdk-media-stream-pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaStreamPipelineResponse.fromJson(response);
  }

  /// Deletes the media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaPipelineId] :
  /// The ID of the media pipeline being deleted.
  Future<void> deleteMediaCapturePipeline({
    required String mediaPipelineId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sdk-media-capture-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified configuration settings.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be deleted. Valid values include
  /// the name and ARN of the media insights pipeline configuration.
  Future<void> deleteMediaInsightsPipelineConfiguration({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/media-insights-pipeline-configurations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaPipelineId] :
  /// The ID of the media pipeline to delete.
  Future<void> deleteMediaPipeline({
    required String mediaPipelineId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sdk-media-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an Kinesis video stream pool.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The ID of the pool being deleted.
  Future<void> deleteMediaPipelineKinesisVideoStreamPool({
    required String identifier,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/media-pipeline-kinesis-video-stream-pools/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets an existing media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaPipelineId] :
  /// The ID of the pipeline that you want to get.
  Future<GetMediaCapturePipelineResponse> getMediaCapturePipeline({
    required String mediaPipelineId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sdk-media-capture-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaCapturePipelineResponse.fromJson(response);
  }

  /// Gets the configuration settings for a media insights pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the requested resource. Valid values include the
  /// name and ARN of the media insights pipeline configuration.
  Future<GetMediaInsightsPipelineConfigurationResponse>
      getMediaInsightsPipelineConfiguration({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/media-insights-pipeline-configurations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaInsightsPipelineConfigurationResponse.fromJson(response);
  }

  /// Gets an existing media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaPipelineId] :
  /// The ID of the pipeline that you want to get.
  Future<GetMediaPipelineResponse> getMediaPipeline({
    required String mediaPipelineId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sdk-media-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaPipelineResponse.fromJson(response);
  }

  /// Gets an Kinesis video stream pool.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The ID of the video stream pool.
  Future<GetMediaPipelineKinesisVideoStreamPoolResponse>
      getMediaPipelineKinesisVideoStreamPool({
    required String identifier,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/media-pipeline-kinesis-video-stream-pools/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaPipelineKinesisVideoStreamPoolResponse.fromJson(response);
  }

  /// Retrieves the details of the specified speaker search task.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [speakerSearchTaskId] :
  /// The ID of the speaker search task.
  Future<GetSpeakerSearchTaskResponse> getSpeakerSearchTask({
    required String identifier,
    required String speakerSearchTaskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/media-insights-pipelines/${Uri.encodeComponent(identifier)}/speaker-search-tasks/${Uri.encodeComponent(speakerSearchTaskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpeakerSearchTaskResponse.fromJson(response);
  }

  /// Retrieves the details of a voice tone analysis task.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [voiceToneAnalysisTaskId] :
  /// The ID of the voice tone analysis task.
  Future<GetVoiceToneAnalysisTaskResponse> getVoiceToneAnalysisTask({
    required String identifier,
    required String voiceToneAnalysisTaskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/media-insights-pipelines/${Uri.encodeComponent(identifier)}/voice-tone-analysis-tasks/${Uri.encodeComponent(voiceToneAnalysisTaskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceToneAnalysisTaskResponse.fromJson(response);
  }

  /// Returns a list of media pipelines.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid Range: 1 -
  /// 99.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  Future<ListMediaCapturePipelinesResponse> listMediaCapturePipelines({
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
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sdk-media-capture-pipelines',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMediaCapturePipelinesResponse.fromJson(response);
  }

  /// Lists the available media insights pipeline configurations.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  Future<ListMediaInsightsPipelineConfigurationsResponse>
      listMediaInsightsPipelineConfigurations({
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
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/media-insights-pipeline-configurations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMediaInsightsPipelineConfigurationsResponse.fromJson(response);
  }

  /// Lists the video stream pools in the media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to return the next page of results.
  Future<ListMediaPipelineKinesisVideoStreamPoolsResponse>
      listMediaPipelineKinesisVideoStreamPools({
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
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/media-pipeline-kinesis-video-stream-pools',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMediaPipelineKinesisVideoStreamPoolsResponse.fromJson(response);
  }

  /// Returns a list of media pipelines.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid Range: 1 -
  /// 99.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  Future<ListMediaPipelinesResponse> listMediaPipelines({
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
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sdk-media-pipelines',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMediaPipelinesResponse.fromJson(response);
  }

  /// Lists the tags available for a media pipeline.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the media pipeline associated with any tags. The ARN consists
  /// of the pipeline's region, resource ID, and pipeline ID.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    final $query = <String, List<String>>{
      'arn': [resourceARN],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Starts a speaker search task.
  /// <important>
  /// Before starting any speaker search tasks, you must provide all notices and
  /// obtain all consents from the speaker as required under applicable privacy
  /// and biometrics laws, and as required under the <a
  /// href="https://aws.amazon.com/service-terms/">AWS service terms</a> for the
  /// Amazon Chime SDK.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [voiceProfileDomainArn] :
  /// The ARN of the voice profile domain that will store the voice profile.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different speaker search tasks.
  ///
  /// Parameter [kinesisVideoStreamSourceTaskConfiguration] :
  /// The task configuration for the Kinesis video stream source of the media
  /// insights pipeline.
  Future<StartSpeakerSearchTaskResponse> startSpeakerSearchTask({
    required String identifier,
    required String voiceProfileDomainArn,
    String? clientRequestToken,
    KinesisVideoStreamSourceTaskConfiguration?
        kinesisVideoStreamSourceTaskConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'VoiceProfileDomainArn': voiceProfileDomainArn,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (kinesisVideoStreamSourceTaskConfiguration != null)
        'KinesisVideoStreamSourceTaskConfiguration':
            kinesisVideoStreamSourceTaskConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/media-insights-pipelines/${Uri.encodeComponent(identifier)}/speaker-search-tasks?operation=start',
      exceptionFnMap: _exceptionFns,
    );
    return StartSpeakerSearchTaskResponse.fromJson(response);
  }

  /// Starts a voice tone analysis task. For more information about voice tone
  /// analysis, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/voice-analytics.html">Using
  /// Amazon Chime SDK voice analytics</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// <important>
  /// Before starting any voice tone analysis tasks, you must provide all
  /// notices and obtain all consents from the speaker as required under
  /// applicable privacy and biometrics laws, and as required under the <a
  /// href="https://aws.amazon.com/service-terms/">AWS service terms</a> for the
  /// Amazon Chime SDK.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [languageCode] :
  /// The language code.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different voice tone analysis tasks.
  ///
  /// Parameter [kinesisVideoStreamSourceTaskConfiguration] :
  /// The task configuration for the Kinesis video stream source of the media
  /// insights pipeline.
  Future<StartVoiceToneAnalysisTaskResponse> startVoiceToneAnalysisTask({
    required String identifier,
    required VoiceAnalyticsLanguageCode languageCode,
    String? clientRequestToken,
    KinesisVideoStreamSourceTaskConfiguration?
        kinesisVideoStreamSourceTaskConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'LanguageCode': languageCode.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (kinesisVideoStreamSourceTaskConfiguration != null)
        'KinesisVideoStreamSourceTaskConfiguration':
            kinesisVideoStreamSourceTaskConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/media-insights-pipelines/${Uri.encodeComponent(identifier)}/voice-tone-analysis-tasks?operation=start',
      exceptionFnMap: _exceptionFns,
    );
    return StartVoiceToneAnalysisTaskResponse.fromJson(response);
  }

  /// Stops a speaker search task.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [speakerSearchTaskId] :
  /// The speaker search task ID.
  Future<void> stopSpeakerSearchTask({
    required String identifier,
    required String speakerSearchTaskId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/media-insights-pipelines/${Uri.encodeComponent(identifier)}/speaker-search-tasks/${Uri.encodeComponent(speakerSearchTaskId)}?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops a voice tone analysis task.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [voiceToneAnalysisTaskId] :
  /// The ID of the voice tone analysis task.
  Future<void> stopVoiceToneAnalysisTask({
    required String identifier,
    required String voiceToneAnalysisTaskId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/media-insights-pipelines/${Uri.encodeComponent(identifier)}/voice-tone-analysis-tasks/${Uri.encodeComponent(voiceToneAnalysisTaskId)}?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// The ARN of the media pipeline that you want to tag. Consists of the
  /// pipeline's endpoint region, resource ID, and pipeline ID.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the media pipeline associated with any tags. The ARN consists
  /// of the pipeline's endpoint region, resource ID, and pipeline ID.
  ///
  /// Parameter [tags] :
  /// The tags associated with the specified media pipeline.
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
      requestUri: '/tags?operation=tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes any tags from a media pipeline.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the pipeline that you want to untag.
  ///
  /// Parameter [tagKeys] :
  /// The key/value pairs in the tag that you want to remove.
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
      requestUri: '/tags?operation=untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the media insights pipeline's configuration settings.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [elements] :
  /// The elements in the request, such as a processor for Amazon Transcribe or
  /// a sink for a Kinesis Data Stream..
  ///
  /// Parameter [identifier] :
  /// The unique identifier for the resource to be updated. Valid values include
  /// the name and ARN of the media insights pipeline configuration.
  ///
  /// Parameter [resourceAccessRoleArn] :
  /// The ARN of the role used by the service to access Amazon Web Services
  /// resources.
  ///
  /// Parameter [realTimeAlertConfiguration] :
  /// The configuration settings for real-time alerts for the media insights
  /// pipeline.
  Future<UpdateMediaInsightsPipelineConfigurationResponse>
      updateMediaInsightsPipelineConfiguration({
    required List<MediaInsightsPipelineConfigurationElement> elements,
    required String identifier,
    required String resourceAccessRoleArn,
    RealTimeAlertConfiguration? realTimeAlertConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'Elements': elements,
      'ResourceAccessRoleArn': resourceAccessRoleArn,
      if (realTimeAlertConfiguration != null)
        'RealTimeAlertConfiguration': realTimeAlertConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/media-insights-pipeline-configurations/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMediaInsightsPipelineConfigurationResponse.fromJson(response);
  }

  /// Updates the status of a media insights pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The unique identifier of the resource to be updated. Valid values include
  /// the ID and ARN of the media insights pipeline.
  ///
  /// Parameter [updateStatus] :
  /// The requested status of the media insights pipeline.
  Future<void> updateMediaInsightsPipelineStatus({
    required String identifier,
    required MediaPipelineStatusUpdate updateStatus,
  }) async {
    final $payload = <String, dynamic>{
      'UpdateStatus': updateStatus.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/media-insights-pipeline-status/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates an Kinesis video stream pool in a media pipeline.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [identifier] :
  /// The ID of the video stream pool.
  ///
  /// Parameter [streamConfiguration] :
  /// The configuration settings for the video stream.
  Future<UpdateMediaPipelineKinesisVideoStreamPoolResponse>
      updateMediaPipelineKinesisVideoStreamPool({
    required String identifier,
    KinesisVideoStreamConfigurationUpdate? streamConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (streamConfiguration != null)
        'StreamConfiguration': streamConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/media-pipeline-kinesis-video-stream-pools/${Uri.encodeComponent(identifier)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateMediaPipelineKinesisVideoStreamPoolResponse.fromJson(response);
  }
}

/// Defines the configuration for an <code>ActiveSpeakerOnly</code> video tile.
class ActiveSpeakerOnlyConfiguration {
  /// The position of the <code>ActiveSpeakerOnly</code> video tile.
  final ActiveSpeakerPosition? activeSpeakerPosition;

  ActiveSpeakerOnlyConfiguration({
    this.activeSpeakerPosition,
  });

  factory ActiveSpeakerOnlyConfiguration.fromJson(Map<String, dynamic> json) {
    return ActiveSpeakerOnlyConfiguration(
      activeSpeakerPosition:
          (json['ActiveSpeakerPosition'] as String?)?.toActiveSpeakerPosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final activeSpeakerPosition = this.activeSpeakerPosition;
    return {
      if (activeSpeakerPosition != null)
        'ActiveSpeakerPosition': activeSpeakerPosition.toValue(),
    };
  }
}

enum ActiveSpeakerPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

extension ActiveSpeakerPositionValueExtension on ActiveSpeakerPosition {
  String toValue() {
    switch (this) {
      case ActiveSpeakerPosition.topLeft:
        return 'TopLeft';
      case ActiveSpeakerPosition.topRight:
        return 'TopRight';
      case ActiveSpeakerPosition.bottomLeft:
        return 'BottomLeft';
      case ActiveSpeakerPosition.bottomRight:
        return 'BottomRight';
    }
  }
}

extension ActiveSpeakerPositionFromString on String {
  ActiveSpeakerPosition toActiveSpeakerPosition() {
    switch (this) {
      case 'TopLeft':
        return ActiveSpeakerPosition.topLeft;
      case 'TopRight':
        return ActiveSpeakerPosition.topRight;
      case 'BottomLeft':
        return ActiveSpeakerPosition.bottomLeft;
      case 'BottomRight':
        return ActiveSpeakerPosition.bottomRight;
    }
    throw Exception('$this is not known in enum ActiveSpeakerPosition');
  }
}

/// A structure that contains the configuration settings for an Amazon
/// Transcribe call analytics processor.
class AmazonTranscribeCallAnalyticsProcessorConfiguration {
  /// The language code in the configuration.
  final CallAnalyticsLanguageCode languageCode;

  /// By default, all <code>CategoryEvents</code> are sent to the insights target.
  /// If this parameter is specified, only included categories are sent to the
  /// insights target.
  final List<String>? callAnalyticsStreamCategories;

  /// Labels all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content identification is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is flagged upon complete transcription of an
  /// audio segment.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code> in the same request. If you do, your
  /// request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a> in the <i>Amazon
  /// Transcribe Developer Guide</i>.
  final ContentType? contentIdentificationType;

  /// Redacts all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content redaction is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is redacted upon complete transcription of an
  /// audio segment.
  ///
  /// You can’t set <code>ContentRedactionType</code> and
  /// <code>ContentIdentificationType</code> in the same request. If you do, your
  /// request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a> in the <i>Amazon
  /// Transcribe Developer Guide</i>.
  final ContentType? contentRedactionType;

  /// Enables partial result stabilization for your transcription. Partial result
  /// stabilization can reduce latency in your output, but may impact accuracy.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final bool? enablePartialResultsStabilization;

  /// If true, <code>UtteranceEvents</code> with <code>IsPartial: true</code> are
  /// filtered out of the insights target.
  final bool? filterPartialResults;

  /// Specifies the name of the custom language model to use when processing a
  /// transcription. Note that language model names are case sensitive.
  ///
  /// The language of the specified language model must match the language code
  /// specified in the transcription request. If the languages don't match, the
  /// custom language model isn't applied. Language mismatches don't generate
  /// errors or warnings.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">Custom
  /// language models</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final String? languageModelName;

  /// Specifies the level of stability to use when you enable partial results
  /// stabilization (<code>EnablePartialResultsStabilization</code>).
  ///
  /// Low stability provides the highest accuracy. High stability transcribes
  /// faster, but with slightly lower accuracy.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final PartialResultsStability? partialResultsStability;

  /// Specifies the types of personally identifiable information (PII) to redact
  /// from a transcript. You can include as many types as you'd like, or you can
  /// select <code>ALL</code>.
  ///
  /// To include <code>PiiEntityTypes</code> in your Call Analytics request, you
  /// must also include <code>ContentIdentificationType</code> or
  /// <code>ContentRedactionType</code>, but you can't include both.
  ///
  /// Values must be comma-separated and can include: <code>ADDRESS</code>,
  /// <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING</code>,
  /// <code>CREDIT_DEBIT_CVV</code>, <code>CREDIT_DEBIT_EXPIRY</code>,
  /// <code>CREDIT_DEBIT_NUMBER</code>, <code>EMAIL</code>, <code>NAME</code>,
  /// <code>PHONE</code>, <code>PIN</code>, <code>SSN</code>, or <code>ALL</code>.
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 300.
  final String? piiEntityTypes;

  /// The settings for a post-call analysis task in an analytics configuration.
  final PostCallAnalyticsSettings? postCallAnalyticsSettings;

  /// Specifies how to apply a vocabulary filter to a transcript.
  ///
  /// To replace words with <b>***</b>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// Specifies the name of the custom vocabulary filter to use when processing a
  /// transcription. Note that vocabulary filter names are case sensitive.
  ///
  /// If the language of the specified custom vocabulary filter doesn't match the
  /// language identified in your media, the vocabulary filter is not applied to
  /// your transcription.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/vocabulary-filtering.html">Using
  /// vocabulary filtering with unwanted words</a> in the <i>Amazon Transcribe
  /// Developer Guide</i>.
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 200.
  final String? vocabularyFilterName;

  /// Specifies the name of the custom vocabulary to use when processing a
  /// transcription. Note that vocabulary names are case sensitive.
  ///
  /// If the language of the specified custom vocabulary doesn't match the
  /// language identified in your media, the custom vocabulary is not applied to
  /// your transcription.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-vocabulary.html">Custom
  /// vocabularies</a> in the <i>Amazon Transcribe Developer Guide</i>.
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 200.
  final String? vocabularyName;

  AmazonTranscribeCallAnalyticsProcessorConfiguration({
    required this.languageCode,
    this.callAnalyticsStreamCategories,
    this.contentIdentificationType,
    this.contentRedactionType,
    this.enablePartialResultsStabilization,
    this.filterPartialResults,
    this.languageModelName,
    this.partialResultsStability,
    this.piiEntityTypes,
    this.postCallAnalyticsSettings,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyName,
  });

  factory AmazonTranscribeCallAnalyticsProcessorConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AmazonTranscribeCallAnalyticsProcessorConfiguration(
      languageCode:
          (json['LanguageCode'] as String).toCallAnalyticsLanguageCode(),
      callAnalyticsStreamCategories:
          (json['CallAnalyticsStreamCategories'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      contentIdentificationType:
          (json['ContentIdentificationType'] as String?)?.toContentType(),
      contentRedactionType:
          (json['ContentRedactionType'] as String?)?.toContentType(),
      enablePartialResultsStabilization:
          json['EnablePartialResultsStabilization'] as bool?,
      filterPartialResults: json['FilterPartialResults'] as bool?,
      languageModelName: json['LanguageModelName'] as String?,
      partialResultsStability: (json['PartialResultsStability'] as String?)
          ?.toPartialResultsStability(),
      piiEntityTypes: json['PiiEntityTypes'] as String?,
      postCallAnalyticsSettings: json['PostCallAnalyticsSettings'] != null
          ? PostCallAnalyticsSettings.fromJson(
              json['PostCallAnalyticsSettings'] as Map<String, dynamic>)
          : null,
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.toVocabularyFilterMethod(),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final callAnalyticsStreamCategories = this.callAnalyticsStreamCategories;
    final contentIdentificationType = this.contentIdentificationType;
    final contentRedactionType = this.contentRedactionType;
    final enablePartialResultsStabilization =
        this.enablePartialResultsStabilization;
    final filterPartialResults = this.filterPartialResults;
    final languageModelName = this.languageModelName;
    final partialResultsStability = this.partialResultsStability;
    final piiEntityTypes = this.piiEntityTypes;
    final postCallAnalyticsSettings = this.postCallAnalyticsSettings;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyName = this.vocabularyName;
    return {
      'LanguageCode': languageCode.toValue(),
      if (callAnalyticsStreamCategories != null)
        'CallAnalyticsStreamCategories': callAnalyticsStreamCategories,
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (contentRedactionType != null)
        'ContentRedactionType': contentRedactionType.toValue(),
      if (enablePartialResultsStabilization != null)
        'EnablePartialResultsStabilization': enablePartialResultsStabilization,
      if (filterPartialResults != null)
        'FilterPartialResults': filterPartialResults,
      if (languageModelName != null) 'LanguageModelName': languageModelName,
      if (partialResultsStability != null)
        'PartialResultsStability': partialResultsStability.toValue(),
      if (piiEntityTypes != null) 'PiiEntityTypes': piiEntityTypes,
      if (postCallAnalyticsSettings != null)
        'PostCallAnalyticsSettings': postCallAnalyticsSettings,
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.toValue(),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// A structure that contains the configuration settings for an Amazon
/// Transcribe processor.
class AmazonTranscribeProcessorConfiguration {
  /// Labels all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content identification is performed at the segment level; PII specified in
  /// <code>PiiEntityTypes</code> is flagged upon complete transcription of an
  /// audio segment.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code> in the same request. If you set both, your
  /// request returns a <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a> in the <i>Amazon
  /// Transcribe Developer Guide</i>.
  final ContentType? contentIdentificationType;

  /// Redacts all personally identifiable information (PII) identified in your
  /// transcript.
  ///
  /// Content redaction is performed at the segment level; PII specified in
  /// PiiEntityTypes is redacted upon complete transcription of an audio segment.
  ///
  /// You can’t set ContentRedactionType and ContentIdentificationType in the same
  /// request. If you set both, your request returns a
  /// <code>BadRequestException</code>.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/pii-redaction.html">Redacting
  /// or identifying personally identifiable information</a> in the <i>Amazon
  /// Transcribe Developer Guide</i>.
  final ContentType? contentRedactionType;

  /// Enables partial result stabilization for your transcription. Partial result
  /// stabilization can reduce latency in your output, but may impact accuracy.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final bool? enablePartialResultsStabilization;

  /// If true, <code>TranscriptEvents</code> with <code>IsPartial: true</code> are
  /// filtered out of the insights target.
  final bool? filterPartialResults;

  /// Turns language identification on or off.
  final bool? identifyLanguage;

  /// The language code that represents the language spoken in your audio.
  ///
  /// If you're unsure of the language spoken in your audio, consider using
  /// <code>IdentifyLanguage</code> to enable automatic language identification.
  ///
  /// For a list of languages that real-time Call Analytics supports, see the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/supported-languages.html">Supported
  /// languages table</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final CallAnalyticsLanguageCode? languageCode;

  /// The name of the custom language model that you want to use when processing
  /// your transcription. Note that language model names are case sensitive.
  ///
  /// The language of the specified language model must match the language code
  /// you specify in your transcription request. If the languages don't match, the
  /// custom language model isn't applied. There are no errors or warnings
  /// associated with a language mismatch.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/custom-language-models.html">Custom
  /// language models</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final String? languageModelName;

  /// The language options for the transcription, such as automatic language
  /// detection.
  final String? languageOptions;

  /// The level of stability to use when you enable partial results stabilization
  /// (<code>EnablePartialResultsStabilization</code>).
  ///
  /// Low stability provides the highest accuracy. High stability transcribes
  /// faster, but with slightly lower accuracy.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/streaming.html#streaming-partial-result-stabilization">Partial-result
  /// stabilization</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final PartialResultsStability? partialResultsStability;

  /// The types of personally identifiable information (PII) to redact from a
  /// transcript. You can include as many types as you'd like, or you can select
  /// <code>ALL</code>.
  ///
  /// To include <code>PiiEntityTypes</code> in your Call Analytics request, you
  /// must also include <code>ContentIdentificationType</code> or
  /// <code>ContentRedactionType</code>, but you can't include both.
  ///
  /// Values must be comma-separated and can include: <code>ADDRESS</code>,
  /// <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING</code>,
  /// <code>CREDIT_DEBIT_CVV</code>, <code>CREDIT_DEBIT_EXPIRY</code>,
  /// <code>CREDIT_DEBIT_NUMBER</code>, <code>EMAIL</code>, <code>NAME</code>,
  /// <code>PHONE</code>, <code>PIN</code>, <code>SSN</code>, or <code>ALL</code>.
  ///
  /// If you leave this parameter empty, the default behavior is equivalent to
  /// <code>ALL</code>.
  final String? piiEntityTypes;

  /// The preferred language for the transcription.
  final CallAnalyticsLanguageCode? preferredLanguage;

  /// Enables speaker partitioning (diarization) in your transcription output.
  /// Speaker partitioning labels the speech from individual speakers in your
  /// media file.
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/diarization.html">Partitioning
  /// speakers (diarization)</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final bool? showSpeakerLabel;

  /// The vocabulary filtering method used in your Call Analytics transcription.
  final VocabularyFilterMethod? vocabularyFilterMethod;

  /// The name of the custom vocabulary filter that you specified in your Call
  /// Analytics request.
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 200.
  final String? vocabularyFilterName;

  /// The names of the custom vocabulary filter or filters using during
  /// transcription.
  final String? vocabularyFilterNames;

  /// The name of the custom vocabulary that you specified in your Call Analytics
  /// request.
  ///
  /// Length Constraints: Minimum length of 1. Maximum length of 200.
  final String? vocabularyName;

  /// The names of the custom vocabulary or vocabularies used during
  /// transcription.
  final String? vocabularyNames;

  AmazonTranscribeProcessorConfiguration({
    this.contentIdentificationType,
    this.contentRedactionType,
    this.enablePartialResultsStabilization,
    this.filterPartialResults,
    this.identifyLanguage,
    this.languageCode,
    this.languageModelName,
    this.languageOptions,
    this.partialResultsStability,
    this.piiEntityTypes,
    this.preferredLanguage,
    this.showSpeakerLabel,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyFilterNames,
    this.vocabularyName,
    this.vocabularyNames,
  });

  factory AmazonTranscribeProcessorConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AmazonTranscribeProcessorConfiguration(
      contentIdentificationType:
          (json['ContentIdentificationType'] as String?)?.toContentType(),
      contentRedactionType:
          (json['ContentRedactionType'] as String?)?.toContentType(),
      enablePartialResultsStabilization:
          json['EnablePartialResultsStabilization'] as bool?,
      filterPartialResults: json['FilterPartialResults'] as bool?,
      identifyLanguage: json['IdentifyLanguage'] as bool?,
      languageCode:
          (json['LanguageCode'] as String?)?.toCallAnalyticsLanguageCode(),
      languageModelName: json['LanguageModelName'] as String?,
      languageOptions: json['LanguageOptions'] as String?,
      partialResultsStability: (json['PartialResultsStability'] as String?)
          ?.toPartialResultsStability(),
      piiEntityTypes: json['PiiEntityTypes'] as String?,
      preferredLanguage:
          (json['PreferredLanguage'] as String?)?.toCallAnalyticsLanguageCode(),
      showSpeakerLabel: json['ShowSpeakerLabel'] as bool?,
      vocabularyFilterMethod: (json['VocabularyFilterMethod'] as String?)
          ?.toVocabularyFilterMethod(),
      vocabularyFilterName: json['VocabularyFilterName'] as String?,
      vocabularyFilterNames: json['VocabularyFilterNames'] as String?,
      vocabularyName: json['VocabularyName'] as String?,
      vocabularyNames: json['VocabularyNames'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final contentIdentificationType = this.contentIdentificationType;
    final contentRedactionType = this.contentRedactionType;
    final enablePartialResultsStabilization =
        this.enablePartialResultsStabilization;
    final filterPartialResults = this.filterPartialResults;
    final identifyLanguage = this.identifyLanguage;
    final languageCode = this.languageCode;
    final languageModelName = this.languageModelName;
    final languageOptions = this.languageOptions;
    final partialResultsStability = this.partialResultsStability;
    final piiEntityTypes = this.piiEntityTypes;
    final preferredLanguage = this.preferredLanguage;
    final showSpeakerLabel = this.showSpeakerLabel;
    final vocabularyFilterMethod = this.vocabularyFilterMethod;
    final vocabularyFilterName = this.vocabularyFilterName;
    final vocabularyFilterNames = this.vocabularyFilterNames;
    final vocabularyName = this.vocabularyName;
    final vocabularyNames = this.vocabularyNames;
    return {
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (contentRedactionType != null)
        'ContentRedactionType': contentRedactionType.toValue(),
      if (enablePartialResultsStabilization != null)
        'EnablePartialResultsStabilization': enablePartialResultsStabilization,
      if (filterPartialResults != null)
        'FilterPartialResults': filterPartialResults,
      if (identifyLanguage != null) 'IdentifyLanguage': identifyLanguage,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageModelName != null) 'LanguageModelName': languageModelName,
      if (languageOptions != null) 'LanguageOptions': languageOptions,
      if (partialResultsStability != null)
        'PartialResultsStability': partialResultsStability.toValue(),
      if (piiEntityTypes != null) 'PiiEntityTypes': piiEntityTypes,
      if (preferredLanguage != null)
        'PreferredLanguage': preferredLanguage.toValue(),
      if (showSpeakerLabel != null) 'ShowSpeakerLabel': showSpeakerLabel,
      if (vocabularyFilterMethod != null)
        'VocabularyFilterMethod': vocabularyFilterMethod.toValue(),
      if (vocabularyFilterName != null)
        'VocabularyFilterName': vocabularyFilterName,
      if (vocabularyFilterNames != null)
        'VocabularyFilterNames': vocabularyFilterNames,
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
      if (vocabularyNames != null) 'VocabularyNames': vocabularyNames,
    };
  }
}

/// The configuration for the artifacts concatenation.
class ArtifactsConcatenationConfiguration {
  /// The configuration for the audio artifacts concatenation.
  final AudioConcatenationConfiguration audio;

  /// The configuration for the composited video artifacts concatenation.
  final CompositedVideoConcatenationConfiguration compositedVideo;

  /// The configuration for the content artifacts concatenation.
  final ContentConcatenationConfiguration content;

  /// The configuration for the data channel artifacts concatenation.
  final DataChannelConcatenationConfiguration dataChannel;

  /// The configuration for the meeting events artifacts concatenation.
  final MeetingEventsConcatenationConfiguration meetingEvents;

  /// The configuration for the transcription messages artifacts concatenation.
  final TranscriptionMessagesConcatenationConfiguration transcriptionMessages;

  /// The configuration for the video artifacts concatenation.
  final VideoConcatenationConfiguration video;

  ArtifactsConcatenationConfiguration({
    required this.audio,
    required this.compositedVideo,
    required this.content,
    required this.dataChannel,
    required this.meetingEvents,
    required this.transcriptionMessages,
    required this.video,
  });

  factory ArtifactsConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ArtifactsConcatenationConfiguration(
      audio: AudioConcatenationConfiguration.fromJson(
          json['Audio'] as Map<String, dynamic>),
      compositedVideo: CompositedVideoConcatenationConfiguration.fromJson(
          json['CompositedVideo'] as Map<String, dynamic>),
      content: ContentConcatenationConfiguration.fromJson(
          json['Content'] as Map<String, dynamic>),
      dataChannel: DataChannelConcatenationConfiguration.fromJson(
          json['DataChannel'] as Map<String, dynamic>),
      meetingEvents: MeetingEventsConcatenationConfiguration.fromJson(
          json['MeetingEvents'] as Map<String, dynamic>),
      transcriptionMessages:
          TranscriptionMessagesConcatenationConfiguration.fromJson(
              json['TranscriptionMessages'] as Map<String, dynamic>),
      video: VideoConcatenationConfiguration.fromJson(
          json['Video'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final compositedVideo = this.compositedVideo;
    final content = this.content;
    final dataChannel = this.dataChannel;
    final meetingEvents = this.meetingEvents;
    final transcriptionMessages = this.transcriptionMessages;
    final video = this.video;
    return {
      'Audio': audio,
      'CompositedVideo': compositedVideo,
      'Content': content,
      'DataChannel': dataChannel,
      'MeetingEvents': meetingEvents,
      'TranscriptionMessages': transcriptionMessages,
      'Video': video,
    };
  }
}

enum ArtifactsConcatenationState {
  enabled,
  disabled,
}

extension ArtifactsConcatenationStateValueExtension
    on ArtifactsConcatenationState {
  String toValue() {
    switch (this) {
      case ArtifactsConcatenationState.enabled:
        return 'Enabled';
      case ArtifactsConcatenationState.disabled:
        return 'Disabled';
    }
  }
}

extension ArtifactsConcatenationStateFromString on String {
  ArtifactsConcatenationState toArtifactsConcatenationState() {
    switch (this) {
      case 'Enabled':
        return ArtifactsConcatenationState.enabled;
      case 'Disabled':
        return ArtifactsConcatenationState.disabled;
    }
    throw Exception('$this is not known in enum ArtifactsConcatenationState');
  }
}

/// The configuration for the artifacts.
class ArtifactsConfiguration {
  /// The configuration for the audio artifacts.
  final AudioArtifactsConfiguration audio;

  /// The configuration for the content artifacts.
  final ContentArtifactsConfiguration content;

  /// The configuration for the video artifacts.
  final VideoArtifactsConfiguration video;

  /// Enables video compositing.
  final CompositedVideoArtifactsConfiguration? compositedVideo;

  ArtifactsConfiguration({
    required this.audio,
    required this.content,
    required this.video,
    this.compositedVideo,
  });

  factory ArtifactsConfiguration.fromJson(Map<String, dynamic> json) {
    return ArtifactsConfiguration(
      audio: AudioArtifactsConfiguration.fromJson(
          json['Audio'] as Map<String, dynamic>),
      content: ContentArtifactsConfiguration.fromJson(
          json['Content'] as Map<String, dynamic>),
      video: VideoArtifactsConfiguration.fromJson(
          json['Video'] as Map<String, dynamic>),
      compositedVideo: json['CompositedVideo'] != null
          ? CompositedVideoArtifactsConfiguration.fromJson(
              json['CompositedVideo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final content = this.content;
    final video = this.video;
    final compositedVideo = this.compositedVideo;
    return {
      'Audio': audio,
      'Content': content,
      'Video': video,
      if (compositedVideo != null) 'CompositedVideo': compositedVideo,
    };
  }
}

enum ArtifactsState {
  enabled,
  disabled,
}

extension ArtifactsStateValueExtension on ArtifactsState {
  String toValue() {
    switch (this) {
      case ArtifactsState.enabled:
        return 'Enabled';
      case ArtifactsState.disabled:
        return 'Disabled';
    }
  }
}

extension ArtifactsStateFromString on String {
  ArtifactsState toArtifactsState() {
    switch (this) {
      case 'Enabled':
        return ArtifactsState.enabled;
      case 'Disabled':
        return ArtifactsState.disabled;
    }
    throw Exception('$this is not known in enum ArtifactsState');
  }
}

enum AudioArtifactsConcatenationState {
  enabled,
}

extension AudioArtifactsConcatenationStateValueExtension
    on AudioArtifactsConcatenationState {
  String toValue() {
    switch (this) {
      case AudioArtifactsConcatenationState.enabled:
        return 'Enabled';
    }
  }
}

extension AudioArtifactsConcatenationStateFromString on String {
  AudioArtifactsConcatenationState toAudioArtifactsConcatenationState() {
    switch (this) {
      case 'Enabled':
        return AudioArtifactsConcatenationState.enabled;
    }
    throw Exception(
        '$this is not known in enum AudioArtifactsConcatenationState');
  }
}

/// The audio artifact configuration object.
class AudioArtifactsConfiguration {
  /// The MUX type of the audio artifact configuration object.
  final AudioMuxType muxType;

  AudioArtifactsConfiguration({
    required this.muxType,
  });

  factory AudioArtifactsConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioArtifactsConfiguration(
      muxType: (json['MuxType'] as String).toAudioMuxType(),
    );
  }

  Map<String, dynamic> toJson() {
    final muxType = this.muxType;
    return {
      'MuxType': muxType.toValue(),
    };
  }
}

enum AudioChannelsOption {
  stereo,
  mono,
}

extension AudioChannelsOptionValueExtension on AudioChannelsOption {
  String toValue() {
    switch (this) {
      case AudioChannelsOption.stereo:
        return 'Stereo';
      case AudioChannelsOption.mono:
        return 'Mono';
    }
  }
}

extension AudioChannelsOptionFromString on String {
  AudioChannelsOption toAudioChannelsOption() {
    switch (this) {
      case 'Stereo':
        return AudioChannelsOption.stereo;
      case 'Mono':
        return AudioChannelsOption.mono;
    }
    throw Exception('$this is not known in enum AudioChannelsOption');
  }
}

/// The audio artifact concatenation configuration object.
class AudioConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final AudioArtifactsConcatenationState state;

  AudioConcatenationConfiguration({
    required this.state,
  });

  factory AudioConcatenationConfiguration.fromJson(Map<String, dynamic> json) {
    return AudioConcatenationConfiguration(
      state: (json['State'] as String).toAudioArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
    };
  }
}

enum AudioMuxType {
  audioOnly,
  audioWithActiveSpeakerVideo,
  audioWithCompositedVideo,
}

extension AudioMuxTypeValueExtension on AudioMuxType {
  String toValue() {
    switch (this) {
      case AudioMuxType.audioOnly:
        return 'AudioOnly';
      case AudioMuxType.audioWithActiveSpeakerVideo:
        return 'AudioWithActiveSpeakerVideo';
      case AudioMuxType.audioWithCompositedVideo:
        return 'AudioWithCompositedVideo';
    }
  }
}

extension AudioMuxTypeFromString on String {
  AudioMuxType toAudioMuxType() {
    switch (this) {
      case 'AudioOnly':
        return AudioMuxType.audioOnly;
      case 'AudioWithActiveSpeakerVideo':
        return AudioMuxType.audioWithActiveSpeakerVideo;
      case 'AudioWithCompositedVideo':
        return AudioMuxType.audioWithCompositedVideo;
    }
    throw Exception('$this is not known in enum AudioMuxType');
  }
}

enum BorderColor {
  black,
  blue,
  red,
  green,
  white,
  yellow,
}

extension BorderColorValueExtension on BorderColor {
  String toValue() {
    switch (this) {
      case BorderColor.black:
        return 'Black';
      case BorderColor.blue:
        return 'Blue';
      case BorderColor.red:
        return 'Red';
      case BorderColor.green:
        return 'Green';
      case BorderColor.white:
        return 'White';
      case BorderColor.yellow:
        return 'Yellow';
    }
  }
}

extension BorderColorFromString on String {
  BorderColor toBorderColor() {
    switch (this) {
      case 'Black':
        return BorderColor.black;
      case 'Blue':
        return BorderColor.blue;
      case 'Red':
        return BorderColor.red;
      case 'Green':
        return BorderColor.green;
      case 'White':
        return BorderColor.white;
      case 'Yellow':
        return BorderColor.yellow;
    }
    throw Exception('$this is not known in enum BorderColor');
  }
}

enum CallAnalyticsLanguageCode {
  enUs,
  enGb,
  esUs,
  frCa,
  frFr,
  enAu,
  itIt,
  deDe,
  ptBr,
}

extension CallAnalyticsLanguageCodeValueExtension on CallAnalyticsLanguageCode {
  String toValue() {
    switch (this) {
      case CallAnalyticsLanguageCode.enUs:
        return 'en-US';
      case CallAnalyticsLanguageCode.enGb:
        return 'en-GB';
      case CallAnalyticsLanguageCode.esUs:
        return 'es-US';
      case CallAnalyticsLanguageCode.frCa:
        return 'fr-CA';
      case CallAnalyticsLanguageCode.frFr:
        return 'fr-FR';
      case CallAnalyticsLanguageCode.enAu:
        return 'en-AU';
      case CallAnalyticsLanguageCode.itIt:
        return 'it-IT';
      case CallAnalyticsLanguageCode.deDe:
        return 'de-DE';
      case CallAnalyticsLanguageCode.ptBr:
        return 'pt-BR';
    }
  }
}

extension CallAnalyticsLanguageCodeFromString on String {
  CallAnalyticsLanguageCode toCallAnalyticsLanguageCode() {
    switch (this) {
      case 'en-US':
        return CallAnalyticsLanguageCode.enUs;
      case 'en-GB':
        return CallAnalyticsLanguageCode.enGb;
      case 'es-US':
        return CallAnalyticsLanguageCode.esUs;
      case 'fr-CA':
        return CallAnalyticsLanguageCode.frCa;
      case 'fr-FR':
        return CallAnalyticsLanguageCode.frFr;
      case 'en-AU':
        return CallAnalyticsLanguageCode.enAu;
      case 'it-IT':
        return CallAnalyticsLanguageCode.itIt;
      case 'de-DE':
        return CallAnalyticsLanguageCode.deDe;
      case 'pt-BR':
        return CallAnalyticsLanguageCode.ptBr;
    }
    throw Exception('$this is not known in enum CallAnalyticsLanguageCode');
  }
}

enum CanvasOrientation {
  landscape,
  portrait,
}

extension CanvasOrientationValueExtension on CanvasOrientation {
  String toValue() {
    switch (this) {
      case CanvasOrientation.landscape:
        return 'Landscape';
      case CanvasOrientation.portrait:
        return 'Portrait';
    }
  }
}

extension CanvasOrientationFromString on String {
  CanvasOrientation toCanvasOrientation() {
    switch (this) {
      case 'Landscape':
        return CanvasOrientation.landscape;
      case 'Portrait':
        return CanvasOrientation.portrait;
    }
    throw Exception('$this is not known in enum CanvasOrientation');
  }
}

/// Defines an audio channel in a Kinesis video stream.
class ChannelDefinition {
  /// The channel ID.
  final int channelId;

  /// Specifies whether the audio in a channel belongs to the <code>AGENT</code>
  /// or <code>CUSTOMER</code>.
  final ParticipantRole? participantRole;

  ChannelDefinition({
    required this.channelId,
    this.participantRole,
  });

  factory ChannelDefinition.fromJson(Map<String, dynamic> json) {
    return ChannelDefinition(
      channelId: json['ChannelId'] as int,
      participantRole:
          (json['ParticipantRole'] as String?)?.toParticipantRole(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final participantRole = this.participantRole;
    return {
      'ChannelId': channelId,
      if (participantRole != null) 'ParticipantRole': participantRole.toValue(),
    };
  }
}

/// The configuration object of the Amazon Chime SDK meeting concatenation for a
/// specified media pipeline.
class ChimeSdkMeetingConcatenationConfiguration {
  /// The configuration for the artifacts in an Amazon Chime SDK meeting
  /// concatenation.
  final ArtifactsConcatenationConfiguration artifactsConfiguration;

  ChimeSdkMeetingConcatenationConfiguration({
    required this.artifactsConfiguration,
  });

  factory ChimeSdkMeetingConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ChimeSdkMeetingConcatenationConfiguration(
      artifactsConfiguration: ArtifactsConcatenationConfiguration.fromJson(
          json['ArtifactsConfiguration'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final artifactsConfiguration = this.artifactsConfiguration;
    return {
      'ArtifactsConfiguration': artifactsConfiguration,
    };
  }
}

/// The configuration object of the Amazon Chime SDK meeting for a specified
/// media pipeline. <code>SourceType</code> must be
/// <code>ChimeSdkMeeting</code>.
class ChimeSdkMeetingConfiguration {
  /// The configuration for the artifacts in an Amazon Chime SDK meeting.
  final ArtifactsConfiguration? artifactsConfiguration;

  /// The source configuration for a specified media pipeline.
  final SourceConfiguration? sourceConfiguration;

  ChimeSdkMeetingConfiguration({
    this.artifactsConfiguration,
    this.sourceConfiguration,
  });

  factory ChimeSdkMeetingConfiguration.fromJson(Map<String, dynamic> json) {
    return ChimeSdkMeetingConfiguration(
      artifactsConfiguration: json['ArtifactsConfiguration'] != null
          ? ArtifactsConfiguration.fromJson(
              json['ArtifactsConfiguration'] as Map<String, dynamic>)
          : null,
      sourceConfiguration: json['SourceConfiguration'] != null
          ? SourceConfiguration.fromJson(
              json['SourceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final artifactsConfiguration = this.artifactsConfiguration;
    final sourceConfiguration = this.sourceConfiguration;
    return {
      if (artifactsConfiguration != null)
        'ArtifactsConfiguration': artifactsConfiguration,
      if (sourceConfiguration != null)
        'SourceConfiguration': sourceConfiguration,
    };
  }
}

/// The media pipeline's configuration object.
class ChimeSdkMeetingLiveConnectorConfiguration {
  /// The configuration object's Chime SDK meeting ARN.
  final String arn;

  /// The configuration object's multiplex type.
  final LiveConnectorMuxType muxType;

  /// The media pipeline's composited video.
  final CompositedVideoArtifactsConfiguration? compositedVideo;

  /// The source configuration settings of the media pipeline's configuration
  /// object.
  final SourceConfiguration? sourceConfiguration;

  ChimeSdkMeetingLiveConnectorConfiguration({
    required this.arn,
    required this.muxType,
    this.compositedVideo,
    this.sourceConfiguration,
  });

  factory ChimeSdkMeetingLiveConnectorConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ChimeSdkMeetingLiveConnectorConfiguration(
      arn: json['Arn'] as String,
      muxType: (json['MuxType'] as String).toLiveConnectorMuxType(),
      compositedVideo: json['CompositedVideo'] != null
          ? CompositedVideoArtifactsConfiguration.fromJson(
              json['CompositedVideo'] as Map<String, dynamic>)
          : null,
      sourceConfiguration: json['SourceConfiguration'] != null
          ? SourceConfiguration.fromJson(
              json['SourceConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final muxType = this.muxType;
    final compositedVideo = this.compositedVideo;
    final sourceConfiguration = this.sourceConfiguration;
    return {
      'Arn': arn,
      'MuxType': muxType.toValue(),
      if (compositedVideo != null) 'CompositedVideo': compositedVideo,
      if (sourceConfiguration != null)
        'SourceConfiguration': sourceConfiguration,
    };
  }
}

/// Specifies the configuration for compositing video artifacts.
class CompositedVideoArtifactsConfiguration {
  /// The <code>GridView</code> configuration setting.
  final GridViewConfiguration gridViewConfiguration;

  /// The layout setting, such as <code>GridView</code> in the configuration
  /// object.
  final LayoutOption? layout;

  /// The video resolution setting in the configuration object. Default: HD at
  /// 1280 x 720. FHD resolution: 1920 x 1080.
  final ResolutionOption? resolution;

  CompositedVideoArtifactsConfiguration({
    required this.gridViewConfiguration,
    this.layout,
    this.resolution,
  });

  factory CompositedVideoArtifactsConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CompositedVideoArtifactsConfiguration(
      gridViewConfiguration: GridViewConfiguration.fromJson(
          json['GridViewConfiguration'] as Map<String, dynamic>),
      layout: (json['Layout'] as String?)?.toLayoutOption(),
      resolution: (json['Resolution'] as String?)?.toResolutionOption(),
    );
  }

  Map<String, dynamic> toJson() {
    final gridViewConfiguration = this.gridViewConfiguration;
    final layout = this.layout;
    final resolution = this.resolution;
    return {
      'GridViewConfiguration': gridViewConfiguration,
      if (layout != null) 'Layout': layout.toValue(),
      if (resolution != null) 'Resolution': resolution.toValue(),
    };
  }
}

/// The composited video configuration object for a specified media pipeline.
/// <code>SourceType</code> must be <code>ChimeSdkMeeting</code>.
class CompositedVideoConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final ArtifactsConcatenationState state;

  CompositedVideoConcatenationConfiguration({
    required this.state,
  });

  factory CompositedVideoConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CompositedVideoConcatenationConfiguration(
      state: (json['State'] as String).toArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
    };
  }
}

/// The data sink of the configuration object.
class ConcatenationSink {
  /// The configuration settings for an Amazon S3 bucket sink.
  final S3BucketSinkConfiguration s3BucketSinkConfiguration;

  /// The type of data sink in the configuration object.
  final ConcatenationSinkType type;

  ConcatenationSink({
    required this.s3BucketSinkConfiguration,
    required this.type,
  });

  factory ConcatenationSink.fromJson(Map<String, dynamic> json) {
    return ConcatenationSink(
      s3BucketSinkConfiguration: S3BucketSinkConfiguration.fromJson(
          json['S3BucketSinkConfiguration'] as Map<String, dynamic>),
      type: (json['Type'] as String).toConcatenationSinkType(),
    );
  }

  Map<String, dynamic> toJson() {
    final s3BucketSinkConfiguration = this.s3BucketSinkConfiguration;
    final type = this.type;
    return {
      'S3BucketSinkConfiguration': s3BucketSinkConfiguration,
      'Type': type.toValue(),
    };
  }
}

enum ConcatenationSinkType {
  s3Bucket,
}

extension ConcatenationSinkTypeValueExtension on ConcatenationSinkType {
  String toValue() {
    switch (this) {
      case ConcatenationSinkType.s3Bucket:
        return 'S3Bucket';
    }
  }
}

extension ConcatenationSinkTypeFromString on String {
  ConcatenationSinkType toConcatenationSinkType() {
    switch (this) {
      case 'S3Bucket':
        return ConcatenationSinkType.s3Bucket;
    }
    throw Exception('$this is not known in enum ConcatenationSinkType');
  }
}

/// The source type and media pipeline configuration settings in a configuration
/// object.
class ConcatenationSource {
  /// The concatenation settings for the media pipeline in a configuration object.
  final MediaCapturePipelineSourceConfiguration
      mediaCapturePipelineSourceConfiguration;

  /// The type of concatenation source in a configuration object.
  final ConcatenationSourceType type;

  ConcatenationSource({
    required this.mediaCapturePipelineSourceConfiguration,
    required this.type,
  });

  factory ConcatenationSource.fromJson(Map<String, dynamic> json) {
    return ConcatenationSource(
      mediaCapturePipelineSourceConfiguration:
          MediaCapturePipelineSourceConfiguration.fromJson(
              json['MediaCapturePipelineSourceConfiguration']
                  as Map<String, dynamic>),
      type: (json['Type'] as String).toConcatenationSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final mediaCapturePipelineSourceConfiguration =
        this.mediaCapturePipelineSourceConfiguration;
    final type = this.type;
    return {
      'MediaCapturePipelineSourceConfiguration':
          mediaCapturePipelineSourceConfiguration,
      'Type': type.toValue(),
    };
  }
}

enum ConcatenationSourceType {
  mediaCapturePipeline,
}

extension ConcatenationSourceTypeValueExtension on ConcatenationSourceType {
  String toValue() {
    switch (this) {
      case ConcatenationSourceType.mediaCapturePipeline:
        return 'MediaCapturePipeline';
    }
  }
}

extension ConcatenationSourceTypeFromString on String {
  ConcatenationSourceType toConcatenationSourceType() {
    switch (this) {
      case 'MediaCapturePipeline':
        return ConcatenationSourceType.mediaCapturePipeline;
    }
    throw Exception('$this is not known in enum ConcatenationSourceType');
  }
}

/// The content artifact object.
class ContentArtifactsConfiguration {
  /// Indicates whether the content artifact is enabled or disabled.
  final ArtifactsState state;

  /// The MUX type of the artifact configuration.
  final ContentMuxType? muxType;

  ContentArtifactsConfiguration({
    required this.state,
    this.muxType,
  });

  factory ContentArtifactsConfiguration.fromJson(Map<String, dynamic> json) {
    return ContentArtifactsConfiguration(
      state: (json['State'] as String).toArtifactsState(),
      muxType: (json['MuxType'] as String?)?.toContentMuxType(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final muxType = this.muxType;
    return {
      'State': state.toValue(),
      if (muxType != null) 'MuxType': muxType.toValue(),
    };
  }
}

/// The composited content configuration object for a specified media pipeline.
class ContentConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final ArtifactsConcatenationState state;

  ContentConcatenationConfiguration({
    required this.state,
  });

  factory ContentConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ContentConcatenationConfiguration(
      state: (json['State'] as String).toArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
    };
  }
}

enum ContentMuxType {
  contentOnly,
}

extension ContentMuxTypeValueExtension on ContentMuxType {
  String toValue() {
    switch (this) {
      case ContentMuxType.contentOnly:
        return 'ContentOnly';
    }
  }
}

extension ContentMuxTypeFromString on String {
  ContentMuxType toContentMuxType() {
    switch (this) {
      case 'ContentOnly':
        return ContentMuxType.contentOnly;
    }
    throw Exception('$this is not known in enum ContentMuxType');
  }
}

enum ContentRedactionOutput {
  redacted,
  redactedAndUnredacted,
}

extension ContentRedactionOutputValueExtension on ContentRedactionOutput {
  String toValue() {
    switch (this) {
      case ContentRedactionOutput.redacted:
        return 'redacted';
      case ContentRedactionOutput.redactedAndUnredacted:
        return 'redacted_and_unredacted';
    }
  }
}

extension ContentRedactionOutputFromString on String {
  ContentRedactionOutput toContentRedactionOutput() {
    switch (this) {
      case 'redacted':
        return ContentRedactionOutput.redacted;
      case 'redacted_and_unredacted':
        return ContentRedactionOutput.redactedAndUnredacted;
    }
    throw Exception('$this is not known in enum ContentRedactionOutput');
  }
}

enum ContentShareLayoutOption {
  presenterOnly,
  horizontal,
  vertical,
  activeSpeakerOnly,
}

extension ContentShareLayoutOptionValueExtension on ContentShareLayoutOption {
  String toValue() {
    switch (this) {
      case ContentShareLayoutOption.presenterOnly:
        return 'PresenterOnly';
      case ContentShareLayoutOption.horizontal:
        return 'Horizontal';
      case ContentShareLayoutOption.vertical:
        return 'Vertical';
      case ContentShareLayoutOption.activeSpeakerOnly:
        return 'ActiveSpeakerOnly';
    }
  }
}

extension ContentShareLayoutOptionFromString on String {
  ContentShareLayoutOption toContentShareLayoutOption() {
    switch (this) {
      case 'PresenterOnly':
        return ContentShareLayoutOption.presenterOnly;
      case 'Horizontal':
        return ContentShareLayoutOption.horizontal;
      case 'Vertical':
        return ContentShareLayoutOption.vertical;
      case 'ActiveSpeakerOnly':
        return ContentShareLayoutOption.activeSpeakerOnly;
    }
    throw Exception('$this is not known in enum ContentShareLayoutOption');
  }
}

enum ContentType {
  pii,
}

extension ContentTypeValueExtension on ContentType {
  String toValue() {
    switch (this) {
      case ContentType.pii:
        return 'PII';
    }
  }
}

extension ContentTypeFromString on String {
  ContentType toContentType() {
    switch (this) {
      case 'PII':
        return ContentType.pii;
    }
    throw Exception('$this is not known in enum ContentType');
  }
}

class CreateMediaCapturePipelineResponse {
  /// A media pipeline object, the ID, source type, source ARN, sink type, and
  /// sink ARN of a media pipeline object.
  final MediaCapturePipeline? mediaCapturePipeline;

  CreateMediaCapturePipelineResponse({
    this.mediaCapturePipeline,
  });

  factory CreateMediaCapturePipelineResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaCapturePipelineResponse(
      mediaCapturePipeline: json['MediaCapturePipeline'] != null
          ? MediaCapturePipeline.fromJson(
              json['MediaCapturePipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaCapturePipeline = this.mediaCapturePipeline;
    return {
      if (mediaCapturePipeline != null)
        'MediaCapturePipeline': mediaCapturePipeline,
    };
  }
}

class CreateMediaConcatenationPipelineResponse {
  /// A media concatenation pipeline object, the ID, source type,
  /// <code>MediaPipelineARN</code>, and sink of a media concatenation pipeline
  /// object.
  final MediaConcatenationPipeline? mediaConcatenationPipeline;

  CreateMediaConcatenationPipelineResponse({
    this.mediaConcatenationPipeline,
  });

  factory CreateMediaConcatenationPipelineResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaConcatenationPipelineResponse(
      mediaConcatenationPipeline: json['MediaConcatenationPipeline'] != null
          ? MediaConcatenationPipeline.fromJson(
              json['MediaConcatenationPipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaConcatenationPipeline = this.mediaConcatenationPipeline;
    return {
      if (mediaConcatenationPipeline != null)
        'MediaConcatenationPipeline': mediaConcatenationPipeline,
    };
  }
}

class CreateMediaInsightsPipelineConfigurationResponse {
  /// The configuration settings for the media insights pipeline.
  final MediaInsightsPipelineConfiguration? mediaInsightsPipelineConfiguration;

  CreateMediaInsightsPipelineConfigurationResponse({
    this.mediaInsightsPipelineConfiguration,
  });

  factory CreateMediaInsightsPipelineConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaInsightsPipelineConfigurationResponse(
      mediaInsightsPipelineConfiguration:
          json['MediaInsightsPipelineConfiguration'] != null
              ? MediaInsightsPipelineConfiguration.fromJson(
                  json['MediaInsightsPipelineConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaInsightsPipelineConfiguration =
        this.mediaInsightsPipelineConfiguration;
    return {
      if (mediaInsightsPipelineConfiguration != null)
        'MediaInsightsPipelineConfiguration':
            mediaInsightsPipelineConfiguration,
    };
  }
}

class CreateMediaInsightsPipelineResponse {
  /// The media insights pipeline object.
  final MediaInsightsPipeline mediaInsightsPipeline;

  CreateMediaInsightsPipelineResponse({
    required this.mediaInsightsPipeline,
  });

  factory CreateMediaInsightsPipelineResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaInsightsPipelineResponse(
      mediaInsightsPipeline: MediaInsightsPipeline.fromJson(
          json['MediaInsightsPipeline'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final mediaInsightsPipeline = this.mediaInsightsPipeline;
    return {
      'MediaInsightsPipeline': mediaInsightsPipeline,
    };
  }
}

class CreateMediaLiveConnectorPipelineResponse {
  /// The new media live connector pipeline.
  final MediaLiveConnectorPipeline? mediaLiveConnectorPipeline;

  CreateMediaLiveConnectorPipelineResponse({
    this.mediaLiveConnectorPipeline,
  });

  factory CreateMediaLiveConnectorPipelineResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaLiveConnectorPipelineResponse(
      mediaLiveConnectorPipeline: json['MediaLiveConnectorPipeline'] != null
          ? MediaLiveConnectorPipeline.fromJson(
              json['MediaLiveConnectorPipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaLiveConnectorPipeline = this.mediaLiveConnectorPipeline;
    return {
      if (mediaLiveConnectorPipeline != null)
        'MediaLiveConnectorPipeline': mediaLiveConnectorPipeline,
    };
  }
}

class CreateMediaPipelineKinesisVideoStreamPoolResponse {
  /// The configuration for the Kinesis video stream pool.
  final KinesisVideoStreamPoolConfiguration?
      kinesisVideoStreamPoolConfiguration;

  CreateMediaPipelineKinesisVideoStreamPoolResponse({
    this.kinesisVideoStreamPoolConfiguration,
  });

  factory CreateMediaPipelineKinesisVideoStreamPoolResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaPipelineKinesisVideoStreamPoolResponse(
      kinesisVideoStreamPoolConfiguration:
          json['KinesisVideoStreamPoolConfiguration'] != null
              ? KinesisVideoStreamPoolConfiguration.fromJson(
                  json['KinesisVideoStreamPoolConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisVideoStreamPoolConfiguration =
        this.kinesisVideoStreamPoolConfiguration;
    return {
      if (kinesisVideoStreamPoolConfiguration != null)
        'KinesisVideoStreamPoolConfiguration':
            kinesisVideoStreamPoolConfiguration,
    };
  }
}

class CreateMediaStreamPipelineResponse {
  /// The requested media pipeline.
  final MediaStreamPipeline? mediaStreamPipeline;

  CreateMediaStreamPipelineResponse({
    this.mediaStreamPipeline,
  });

  factory CreateMediaStreamPipelineResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMediaStreamPipelineResponse(
      mediaStreamPipeline: json['MediaStreamPipeline'] != null
          ? MediaStreamPipeline.fromJson(
              json['MediaStreamPipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaStreamPipeline = this.mediaStreamPipeline;
    return {
      if (mediaStreamPipeline != null)
        'MediaStreamPipeline': mediaStreamPipeline,
    };
  }
}

/// The content configuration object's data channel.
class DataChannelConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final ArtifactsConcatenationState state;

  DataChannelConcatenationConfiguration({
    required this.state,
  });

  factory DataChannelConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DataChannelConcatenationConfiguration(
      state: (json['State'] as String).toArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
    };
  }
}

/// Describes the timestamp range and timestamp origin of a range of fragments.
///
/// Only fragments with a start timestamp greater than or equal to the given
/// start time and less than or equal to the end time are returned. For example,
/// say a stream contains fragments with the following start timestamps:
///
/// <ul>
/// <li>
/// 00:00:00
/// </li>
/// <li>
/// 00:00:02
/// </li>
/// <li>
/// 00:00:04
/// </li>
/// <li>
/// 00:00:06
/// </li>
/// </ul>
/// A fragment selector range with a start time of 00:00:01 and end time of
/// 00:00:04 would return the fragments with start times of 00:00:02 and
/// 00:00:04.
class FragmentSelector {
  /// The origin of the timestamps to use, <code>Server</code> or
  /// <code>Producer</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/kinesisvideostreams/latest/dg/API_dataplane_StartSelector.html">StartSelectorType</a>
  /// in the <i>Amazon Kinesis Video Streams Developer Guide</i>.
  final FragmentSelectorType fragmentSelectorType;

  /// The range of timestamps to return.
  final TimestampRange timestampRange;

  FragmentSelector({
    required this.fragmentSelectorType,
    required this.timestampRange,
  });

  factory FragmentSelector.fromJson(Map<String, dynamic> json) {
    return FragmentSelector(
      fragmentSelectorType:
          (json['FragmentSelectorType'] as String).toFragmentSelectorType(),
      timestampRange: TimestampRange.fromJson(
          json['TimestampRange'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final fragmentSelectorType = this.fragmentSelectorType;
    final timestampRange = this.timestampRange;
    return {
      'FragmentSelectorType': fragmentSelectorType.toValue(),
      'TimestampRange': timestampRange,
    };
  }
}

enum FragmentSelectorType {
  producerTimestamp,
  serverTimestamp,
}

extension FragmentSelectorTypeValueExtension on FragmentSelectorType {
  String toValue() {
    switch (this) {
      case FragmentSelectorType.producerTimestamp:
        return 'ProducerTimestamp';
      case FragmentSelectorType.serverTimestamp:
        return 'ServerTimestamp';
    }
  }
}

extension FragmentSelectorTypeFromString on String {
  FragmentSelectorType toFragmentSelectorType() {
    switch (this) {
      case 'ProducerTimestamp':
        return FragmentSelectorType.producerTimestamp;
      case 'ServerTimestamp':
        return FragmentSelectorType.serverTimestamp;
    }
    throw Exception('$this is not known in enum FragmentSelectorType');
  }
}

class GetMediaCapturePipelineResponse {
  /// The media pipeline object.
  final MediaCapturePipeline? mediaCapturePipeline;

  GetMediaCapturePipelineResponse({
    this.mediaCapturePipeline,
  });

  factory GetMediaCapturePipelineResponse.fromJson(Map<String, dynamic> json) {
    return GetMediaCapturePipelineResponse(
      mediaCapturePipeline: json['MediaCapturePipeline'] != null
          ? MediaCapturePipeline.fromJson(
              json['MediaCapturePipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaCapturePipeline = this.mediaCapturePipeline;
    return {
      if (mediaCapturePipeline != null)
        'MediaCapturePipeline': mediaCapturePipeline,
    };
  }
}

class GetMediaInsightsPipelineConfigurationResponse {
  /// The requested media insights pipeline configuration.
  final MediaInsightsPipelineConfiguration? mediaInsightsPipelineConfiguration;

  GetMediaInsightsPipelineConfigurationResponse({
    this.mediaInsightsPipelineConfiguration,
  });

  factory GetMediaInsightsPipelineConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMediaInsightsPipelineConfigurationResponse(
      mediaInsightsPipelineConfiguration:
          json['MediaInsightsPipelineConfiguration'] != null
              ? MediaInsightsPipelineConfiguration.fromJson(
                  json['MediaInsightsPipelineConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaInsightsPipelineConfiguration =
        this.mediaInsightsPipelineConfiguration;
    return {
      if (mediaInsightsPipelineConfiguration != null)
        'MediaInsightsPipelineConfiguration':
            mediaInsightsPipelineConfiguration,
    };
  }
}

class GetMediaPipelineKinesisVideoStreamPoolResponse {
  /// The video stream pool configuration object.
  final KinesisVideoStreamPoolConfiguration?
      kinesisVideoStreamPoolConfiguration;

  GetMediaPipelineKinesisVideoStreamPoolResponse({
    this.kinesisVideoStreamPoolConfiguration,
  });

  factory GetMediaPipelineKinesisVideoStreamPoolResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMediaPipelineKinesisVideoStreamPoolResponse(
      kinesisVideoStreamPoolConfiguration:
          json['KinesisVideoStreamPoolConfiguration'] != null
              ? KinesisVideoStreamPoolConfiguration.fromJson(
                  json['KinesisVideoStreamPoolConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisVideoStreamPoolConfiguration =
        this.kinesisVideoStreamPoolConfiguration;
    return {
      if (kinesisVideoStreamPoolConfiguration != null)
        'KinesisVideoStreamPoolConfiguration':
            kinesisVideoStreamPoolConfiguration,
    };
  }
}

class GetMediaPipelineResponse {
  /// The media pipeline object.
  final MediaPipeline? mediaPipeline;

  GetMediaPipelineResponse({
    this.mediaPipeline,
  });

  factory GetMediaPipelineResponse.fromJson(Map<String, dynamic> json) {
    return GetMediaPipelineResponse(
      mediaPipeline: json['MediaPipeline'] != null
          ? MediaPipeline.fromJson(
              json['MediaPipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaPipeline = this.mediaPipeline;
    return {
      if (mediaPipeline != null) 'MediaPipeline': mediaPipeline,
    };
  }
}

class GetSpeakerSearchTaskResponse {
  /// The details of the speaker search task.
  final SpeakerSearchTask? speakerSearchTask;

  GetSpeakerSearchTaskResponse({
    this.speakerSearchTask,
  });

  factory GetSpeakerSearchTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetSpeakerSearchTaskResponse(
      speakerSearchTask: json['SpeakerSearchTask'] != null
          ? SpeakerSearchTask.fromJson(
              json['SpeakerSearchTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final speakerSearchTask = this.speakerSearchTask;
    return {
      if (speakerSearchTask != null) 'SpeakerSearchTask': speakerSearchTask,
    };
  }
}

class GetVoiceToneAnalysisTaskResponse {
  /// The details of the voice tone analysis task.
  final VoiceToneAnalysisTask? voiceToneAnalysisTask;

  GetVoiceToneAnalysisTaskResponse({
    this.voiceToneAnalysisTask,
  });

  factory GetVoiceToneAnalysisTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceToneAnalysisTaskResponse(
      voiceToneAnalysisTask: json['VoiceToneAnalysisTask'] != null
          ? VoiceToneAnalysisTask.fromJson(
              json['VoiceToneAnalysisTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceToneAnalysisTask = this.voiceToneAnalysisTask;
    return {
      if (voiceToneAnalysisTask != null)
        'VoiceToneAnalysisTask': voiceToneAnalysisTask,
    };
  }
}

/// Specifies the type of grid layout.
class GridViewConfiguration {
  /// Defines the layout of the video tiles when content sharing is enabled.
  final ContentShareLayoutOption contentShareLayout;

  /// The configuration settings for an <code>ActiveSpeakerOnly</code> video tile.
  final ActiveSpeakerOnlyConfiguration? activeSpeakerOnlyConfiguration;

  /// The orientation setting, horizontal or vertical.
  final CanvasOrientation? canvasOrientation;

  /// The configuration settings for a horizontal layout.
  final HorizontalLayoutConfiguration? horizontalLayoutConfiguration;

  /// Defines the configuration options for a presenter only video tile.
  final PresenterOnlyConfiguration? presenterOnlyConfiguration;

  /// The configuration settings for a vertical layout.
  final VerticalLayoutConfiguration? verticalLayoutConfiguration;

  /// The attribute settings for the video tiles.
  final VideoAttribute? videoAttribute;

  GridViewConfiguration({
    required this.contentShareLayout,
    this.activeSpeakerOnlyConfiguration,
    this.canvasOrientation,
    this.horizontalLayoutConfiguration,
    this.presenterOnlyConfiguration,
    this.verticalLayoutConfiguration,
    this.videoAttribute,
  });

  factory GridViewConfiguration.fromJson(Map<String, dynamic> json) {
    return GridViewConfiguration(
      contentShareLayout:
          (json['ContentShareLayout'] as String).toContentShareLayoutOption(),
      activeSpeakerOnlyConfiguration: json['ActiveSpeakerOnlyConfiguration'] !=
              null
          ? ActiveSpeakerOnlyConfiguration.fromJson(
              json['ActiveSpeakerOnlyConfiguration'] as Map<String, dynamic>)
          : null,
      canvasOrientation:
          (json['CanvasOrientation'] as String?)?.toCanvasOrientation(),
      horizontalLayoutConfiguration:
          json['HorizontalLayoutConfiguration'] != null
              ? HorizontalLayoutConfiguration.fromJson(
                  json['HorizontalLayoutConfiguration'] as Map<String, dynamic>)
              : null,
      presenterOnlyConfiguration: json['PresenterOnlyConfiguration'] != null
          ? PresenterOnlyConfiguration.fromJson(
              json['PresenterOnlyConfiguration'] as Map<String, dynamic>)
          : null,
      verticalLayoutConfiguration: json['VerticalLayoutConfiguration'] != null
          ? VerticalLayoutConfiguration.fromJson(
              json['VerticalLayoutConfiguration'] as Map<String, dynamic>)
          : null,
      videoAttribute: json['VideoAttribute'] != null
          ? VideoAttribute.fromJson(
              json['VideoAttribute'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final contentShareLayout = this.contentShareLayout;
    final activeSpeakerOnlyConfiguration = this.activeSpeakerOnlyConfiguration;
    final canvasOrientation = this.canvasOrientation;
    final horizontalLayoutConfiguration = this.horizontalLayoutConfiguration;
    final presenterOnlyConfiguration = this.presenterOnlyConfiguration;
    final verticalLayoutConfiguration = this.verticalLayoutConfiguration;
    final videoAttribute = this.videoAttribute;
    return {
      'ContentShareLayout': contentShareLayout.toValue(),
      if (activeSpeakerOnlyConfiguration != null)
        'ActiveSpeakerOnlyConfiguration': activeSpeakerOnlyConfiguration,
      if (canvasOrientation != null)
        'CanvasOrientation': canvasOrientation.toValue(),
      if (horizontalLayoutConfiguration != null)
        'HorizontalLayoutConfiguration': horizontalLayoutConfiguration,
      if (presenterOnlyConfiguration != null)
        'PresenterOnlyConfiguration': presenterOnlyConfiguration,
      if (verticalLayoutConfiguration != null)
        'VerticalLayoutConfiguration': verticalLayoutConfiguration,
      if (videoAttribute != null) 'VideoAttribute': videoAttribute,
    };
  }
}

enum HighlightColor {
  black,
  blue,
  red,
  green,
  white,
  yellow,
}

extension HighlightColorValueExtension on HighlightColor {
  String toValue() {
    switch (this) {
      case HighlightColor.black:
        return 'Black';
      case HighlightColor.blue:
        return 'Blue';
      case HighlightColor.red:
        return 'Red';
      case HighlightColor.green:
        return 'Green';
      case HighlightColor.white:
        return 'White';
      case HighlightColor.yellow:
        return 'Yellow';
    }
  }
}

extension HighlightColorFromString on String {
  HighlightColor toHighlightColor() {
    switch (this) {
      case 'Black':
        return HighlightColor.black;
      case 'Blue':
        return HighlightColor.blue;
      case 'Red':
        return HighlightColor.red;
      case 'Green':
        return HighlightColor.green;
      case 'White':
        return HighlightColor.white;
      case 'Yellow':
        return HighlightColor.yellow;
    }
    throw Exception('$this is not known in enum HighlightColor');
  }
}

/// Defines the configuration settings for the horizontal layout.
class HorizontalLayoutConfiguration {
  /// Specifies the aspect ratio of all video tiles.
  final String? tileAspectRatio;

  /// The maximum number of video tiles to display.
  final int? tileCount;

  /// Sets the automatic ordering of the video tiles.
  final TileOrder? tileOrder;

  /// Sets the position of horizontal tiles.
  final HorizontalTilePosition? tilePosition;

  HorizontalLayoutConfiguration({
    this.tileAspectRatio,
    this.tileCount,
    this.tileOrder,
    this.tilePosition,
  });

  factory HorizontalLayoutConfiguration.fromJson(Map<String, dynamic> json) {
    return HorizontalLayoutConfiguration(
      tileAspectRatio: json['TileAspectRatio'] as String?,
      tileCount: json['TileCount'] as int?,
      tileOrder: (json['TileOrder'] as String?)?.toTileOrder(),
      tilePosition:
          (json['TilePosition'] as String?)?.toHorizontalTilePosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final tileAspectRatio = this.tileAspectRatio;
    final tileCount = this.tileCount;
    final tileOrder = this.tileOrder;
    final tilePosition = this.tilePosition;
    return {
      if (tileAspectRatio != null) 'TileAspectRatio': tileAspectRatio,
      if (tileCount != null) 'TileCount': tileCount,
      if (tileOrder != null) 'TileOrder': tileOrder.toValue(),
      if (tilePosition != null) 'TilePosition': tilePosition.toValue(),
    };
  }
}

enum HorizontalTilePosition {
  top,
  bottom,
}

extension HorizontalTilePositionValueExtension on HorizontalTilePosition {
  String toValue() {
    switch (this) {
      case HorizontalTilePosition.top:
        return 'Top';
      case HorizontalTilePosition.bottom:
        return 'Bottom';
    }
  }
}

extension HorizontalTilePositionFromString on String {
  HorizontalTilePosition toHorizontalTilePosition() {
    switch (this) {
      case 'Top':
        return HorizontalTilePosition.top;
      case 'Bottom':
        return HorizontalTilePosition.bottom;
    }
    throw Exception('$this is not known in enum HorizontalTilePosition');
  }
}

/// A structure that contains the configuration settings for an issue detection
/// task.
class IssueDetectionConfiguration {
  /// The name of the issue detection rule.
  final String ruleName;

  IssueDetectionConfiguration({
    required this.ruleName,
  });

  factory IssueDetectionConfiguration.fromJson(Map<String, dynamic> json) {
    return IssueDetectionConfiguration(
      ruleName: json['RuleName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    return {
      'RuleName': ruleName,
    };
  }
}

/// A structure that contains the settings for a keyword match task.
class KeywordMatchConfiguration {
  /// The keywords or phrases that you want to match.
  final List<String> keywords;

  /// The name of the keyword match rule.
  final String ruleName;

  /// Matches keywords or phrases on their presence or absence. If set to
  /// <code>TRUE</code>, the rule matches when all the specified keywords or
  /// phrases are absent. Default: <code>FALSE</code>.
  final bool? negate;

  KeywordMatchConfiguration({
    required this.keywords,
    required this.ruleName,
    this.negate,
  });

  factory KeywordMatchConfiguration.fromJson(Map<String, dynamic> json) {
    return KeywordMatchConfiguration(
      keywords: (json['Keywords'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      ruleName: json['RuleName'] as String,
      negate: json['Negate'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final keywords = this.keywords;
    final ruleName = this.ruleName;
    final negate = this.negate;
    return {
      'Keywords': keywords,
      'RuleName': ruleName,
      if (negate != null) 'Negate': negate,
    };
  }
}

/// A structure that contains the configuration settings for a Kinesis Data
/// Stream sink.
class KinesisDataStreamSinkConfiguration {
  /// The ARN of the sink.
  final String? insightsTarget;

  KinesisDataStreamSinkConfiguration({
    this.insightsTarget,
  });

  factory KinesisDataStreamSinkConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KinesisDataStreamSinkConfiguration(
      insightsTarget: json['InsightsTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightsTarget = this.insightsTarget;
    return {
      if (insightsTarget != null) 'InsightsTarget': insightsTarget,
    };
  }
}

/// The configuration of an Kinesis video stream.
class KinesisVideoStreamConfiguration {
  /// The Amazon Web Services Region of the video stream.
  final String region;

  /// The amount of time that data is retained.
  final int? dataRetentionInHours;

  KinesisVideoStreamConfiguration({
    required this.region,
    this.dataRetentionInHours,
  });

  factory KinesisVideoStreamConfiguration.fromJson(Map<String, dynamic> json) {
    return KinesisVideoStreamConfiguration(
      region: json['Region'] as String,
      dataRetentionInHours: json['DataRetentionInHours'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final region = this.region;
    final dataRetentionInHours = this.dataRetentionInHours;
    return {
      'Region': region,
      if (dataRetentionInHours != null)
        'DataRetentionInHours': dataRetentionInHours,
    };
  }
}

/// The updated Kinesis video stream configuration object.
class KinesisVideoStreamConfigurationUpdate {
  /// The updated time that data is retained.
  final int? dataRetentionInHours;

  KinesisVideoStreamConfigurationUpdate({
    this.dataRetentionInHours,
  });

  Map<String, dynamic> toJson() {
    final dataRetentionInHours = this.dataRetentionInHours;
    return {
      if (dataRetentionInHours != null)
        'DataRetentionInHours': dataRetentionInHours,
    };
  }
}

/// The video stream pool configuration object.
class KinesisVideoStreamPoolConfiguration {
  /// The time at which the configuration was created.
  final DateTime? createdTimestamp;

  /// The ARN of the video stream pool configuration.
  final String? poolArn;

  /// The ID of the video stream pool in the configuration.
  final String? poolId;

  /// The name of the video stream pool configuration.
  final String? poolName;

  /// The size of the video stream pool in the configuration.
  final int? poolSize;

  /// The status of the video stream pool in the configuration.
  final KinesisVideoStreamPoolStatus? poolStatus;

  /// The Kinesis video stream pool configuration object.
  final KinesisVideoStreamConfiguration? streamConfiguration;

  /// The time at which the configuration was updated.
  final DateTime? updatedTimestamp;

  KinesisVideoStreamPoolConfiguration({
    this.createdTimestamp,
    this.poolArn,
    this.poolId,
    this.poolName,
    this.poolSize,
    this.poolStatus,
    this.streamConfiguration,
    this.updatedTimestamp,
  });

  factory KinesisVideoStreamPoolConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KinesisVideoStreamPoolConfiguration(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      poolName: json['PoolName'] as String?,
      poolSize: json['PoolSize'] as int?,
      poolStatus:
          (json['PoolStatus'] as String?)?.toKinesisVideoStreamPoolStatus(),
      streamConfiguration: json['StreamConfiguration'] != null
          ? KinesisVideoStreamConfiguration.fromJson(
              json['StreamConfiguration'] as Map<String, dynamic>)
          : null,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    final poolName = this.poolName;
    final poolSize = this.poolSize;
    final poolStatus = this.poolStatus;
    final streamConfiguration = this.streamConfiguration;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (poolName != null) 'PoolName': poolName,
      if (poolSize != null) 'PoolSize': poolSize,
      if (poolStatus != null) 'PoolStatus': poolStatus.toValue(),
      if (streamConfiguration != null)
        'StreamConfiguration': streamConfiguration,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

enum KinesisVideoStreamPoolStatus {
  creating,
  active,
  updating,
  deleting,
  failed,
}

extension KinesisVideoStreamPoolStatusValueExtension
    on KinesisVideoStreamPoolStatus {
  String toValue() {
    switch (this) {
      case KinesisVideoStreamPoolStatus.creating:
        return 'CREATING';
      case KinesisVideoStreamPoolStatus.active:
        return 'ACTIVE';
      case KinesisVideoStreamPoolStatus.updating:
        return 'UPDATING';
      case KinesisVideoStreamPoolStatus.deleting:
        return 'DELETING';
      case KinesisVideoStreamPoolStatus.failed:
        return 'FAILED';
    }
  }
}

extension KinesisVideoStreamPoolStatusFromString on String {
  KinesisVideoStreamPoolStatus toKinesisVideoStreamPoolStatus() {
    switch (this) {
      case 'CREATING':
        return KinesisVideoStreamPoolStatus.creating;
      case 'ACTIVE':
        return KinesisVideoStreamPoolStatus.active;
      case 'UPDATING':
        return KinesisVideoStreamPoolStatus.updating;
      case 'DELETING':
        return KinesisVideoStreamPoolStatus.deleting;
      case 'FAILED':
        return KinesisVideoStreamPoolStatus.failed;
    }
    throw Exception('$this is not known in enum KinesisVideoStreamPoolStatus');
  }
}

/// A summary of the Kinesis video stream pool.
class KinesisVideoStreamPoolSummary {
  /// The ARN of the video stream pool.
  final String? poolArn;

  /// The ID of the video stream pool.
  final String? poolId;

  /// The name of the video stream pool.
  final String? poolName;

  KinesisVideoStreamPoolSummary({
    this.poolArn,
    this.poolId,
    this.poolName,
  });

  factory KinesisVideoStreamPoolSummary.fromJson(Map<String, dynamic> json) {
    return KinesisVideoStreamPoolSummary(
      poolArn: json['PoolArn'] as String?,
      poolId: json['PoolId'] as String?,
      poolName: json['PoolName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final poolArn = this.poolArn;
    final poolId = this.poolId;
    final poolName = this.poolName;
    return {
      if (poolArn != null) 'PoolArn': poolArn,
      if (poolId != null) 'PoolId': poolId,
      if (poolName != null) 'PoolName': poolName,
    };
  }
}

/// A structure that contains the runtime settings for recording a Kinesis video
/// stream.
class KinesisVideoStreamRecordingSourceRuntimeConfiguration {
  /// Describes the timestamp range and timestamp origin of a range of fragments
  /// in the Kinesis video stream.
  final FragmentSelector fragmentSelector;

  /// The stream or streams to be recorded.
  final List<RecordingStreamConfiguration> streams;

  KinesisVideoStreamRecordingSourceRuntimeConfiguration({
    required this.fragmentSelector,
    required this.streams,
  });

  factory KinesisVideoStreamRecordingSourceRuntimeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KinesisVideoStreamRecordingSourceRuntimeConfiguration(
      fragmentSelector: FragmentSelector.fromJson(
          json['FragmentSelector'] as Map<String, dynamic>),
      streams: (json['Streams'] as List)
          .whereNotNull()
          .map((e) =>
              RecordingStreamConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final fragmentSelector = this.fragmentSelector;
    final streams = this.streams;
    return {
      'FragmentSelector': fragmentSelector,
      'Streams': streams,
    };
  }
}

/// The runtime configuration settings for the Kinesis video stream source.
class KinesisVideoStreamSourceRuntimeConfiguration {
  /// Specifies the encoding of your input audio. Supported format: PCM (only
  /// signed 16-bit little-endian audio formats, which does not include WAV)
  ///
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/how-input.html#how-input-audio">Media
  /// formats</a> in the <i>Amazon Transcribe Developer Guide</i>.
  final MediaEncoding mediaEncoding;

  /// The sample rate of the input audio (in hertz). Low-quality audio, such as
  /// telephone audio, is typically around 8,000 Hz. High-quality audio typically
  /// ranges from 16,000 Hz to 48,000 Hz. Note that the sample rate you specify
  /// must match that of your audio.
  ///
  /// Valid Range: Minimum value of 8000. Maximum value of 48000.
  final int mediaSampleRate;

  /// The streams in the source runtime configuration of a Kinesis video stream.
  final List<StreamConfiguration> streams;

  KinesisVideoStreamSourceRuntimeConfiguration({
    required this.mediaEncoding,
    required this.mediaSampleRate,
    required this.streams,
  });

  factory KinesisVideoStreamSourceRuntimeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return KinesisVideoStreamSourceRuntimeConfiguration(
      mediaEncoding: (json['MediaEncoding'] as String).toMediaEncoding(),
      mediaSampleRate: json['MediaSampleRate'] as int,
      streams: (json['Streams'] as List)
          .whereNotNull()
          .map((e) => StreamConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final mediaEncoding = this.mediaEncoding;
    final mediaSampleRate = this.mediaSampleRate;
    final streams = this.streams;
    return {
      'MediaEncoding': mediaEncoding.toValue(),
      'MediaSampleRate': mediaSampleRate,
      'Streams': streams,
    };
  }
}

/// The task configuration settings for the Kinesis video stream source.
class KinesisVideoStreamSourceTaskConfiguration {
  /// The channel ID.
  final int channelId;

  /// The ARN of the stream.
  final String streamArn;

  /// The unique identifier of the fragment to begin processing.
  final String? fragmentNumber;

  KinesisVideoStreamSourceTaskConfiguration({
    required this.channelId,
    required this.streamArn,
    this.fragmentNumber,
  });

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final streamArn = this.streamArn;
    final fragmentNumber = this.fragmentNumber;
    return {
      'ChannelId': channelId,
      'StreamArn': streamArn,
      if (fragmentNumber != null) 'FragmentNumber': fragmentNumber,
    };
  }
}

/// A structure that contains the configuration settings for an AWS Lambda
/// function's data sink.
class LambdaFunctionSinkConfiguration {
  /// The ARN of the sink.
  final String? insightsTarget;

  LambdaFunctionSinkConfiguration({
    this.insightsTarget,
  });

  factory LambdaFunctionSinkConfiguration.fromJson(Map<String, dynamic> json) {
    return LambdaFunctionSinkConfiguration(
      insightsTarget: json['InsightsTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightsTarget = this.insightsTarget;
    return {
      if (insightsTarget != null) 'InsightsTarget': insightsTarget,
    };
  }
}

enum LayoutOption {
  gridView,
}

extension LayoutOptionValueExtension on LayoutOption {
  String toValue() {
    switch (this) {
      case LayoutOption.gridView:
        return 'GridView';
    }
  }
}

extension LayoutOptionFromString on String {
  LayoutOption toLayoutOption() {
    switch (this) {
      case 'GridView':
        return LayoutOption.gridView;
    }
    throw Exception('$this is not known in enum LayoutOption');
  }
}

class ListMediaCapturePipelinesResponse {
  /// The media pipeline objects in the list.
  final List<MediaCapturePipelineSummary>? mediaCapturePipelines;

  /// The token used to retrieve the next page of results.
  final String? nextToken;

  ListMediaCapturePipelinesResponse({
    this.mediaCapturePipelines,
    this.nextToken,
  });

  factory ListMediaCapturePipelinesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMediaCapturePipelinesResponse(
      mediaCapturePipelines: (json['MediaCapturePipelines'] as List?)
          ?.whereNotNull()
          .map((e) =>
              MediaCapturePipelineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaCapturePipelines = this.mediaCapturePipelines;
    final nextToken = this.nextToken;
    return {
      if (mediaCapturePipelines != null)
        'MediaCapturePipelines': mediaCapturePipelines,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMediaInsightsPipelineConfigurationsResponse {
  /// The requested list of media insights pipeline configurations.
  final List<MediaInsightsPipelineConfigurationSummary>?
      mediaInsightsPipelineConfigurations;

  /// The token used to return the next page of results.
  final String? nextToken;

  ListMediaInsightsPipelineConfigurationsResponse({
    this.mediaInsightsPipelineConfigurations,
    this.nextToken,
  });

  factory ListMediaInsightsPipelineConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMediaInsightsPipelineConfigurationsResponse(
      mediaInsightsPipelineConfigurations:
          (json['MediaInsightsPipelineConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => MediaInsightsPipelineConfigurationSummary.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaInsightsPipelineConfigurations =
        this.mediaInsightsPipelineConfigurations;
    final nextToken = this.nextToken;
    return {
      if (mediaInsightsPipelineConfigurations != null)
        'MediaInsightsPipelineConfigurations':
            mediaInsightsPipelineConfigurations,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMediaPipelineKinesisVideoStreamPoolsResponse {
  /// The list of video stream pools.
  final List<KinesisVideoStreamPoolSummary>? kinesisVideoStreamPools;

  /// The token used to return the next page of results.
  final String? nextToken;

  ListMediaPipelineKinesisVideoStreamPoolsResponse({
    this.kinesisVideoStreamPools,
    this.nextToken,
  });

  factory ListMediaPipelineKinesisVideoStreamPoolsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListMediaPipelineKinesisVideoStreamPoolsResponse(
      kinesisVideoStreamPools: (json['KinesisVideoStreamPools'] as List?)
          ?.whereNotNull()
          .map((e) =>
              KinesisVideoStreamPoolSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisVideoStreamPools = this.kinesisVideoStreamPools;
    final nextToken = this.nextToken;
    return {
      if (kinesisVideoStreamPools != null)
        'KinesisVideoStreamPools': kinesisVideoStreamPools,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListMediaPipelinesResponse {
  /// The media pipeline objects in the list.
  final List<MediaPipelineSummary>? mediaPipelines;

  /// The token used to retrieve the next page of results.
  final String? nextToken;

  ListMediaPipelinesResponse({
    this.mediaPipelines,
    this.nextToken,
  });

  factory ListMediaPipelinesResponse.fromJson(Map<String, dynamic> json) {
    return ListMediaPipelinesResponse(
      mediaPipelines: (json['MediaPipelines'] as List?)
          ?.whereNotNull()
          .map((e) => MediaPipelineSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaPipelines = this.mediaPipelines;
    final nextToken = this.nextToken;
    return {
      if (mediaPipelines != null) 'MediaPipelines': mediaPipelines,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags associated with the specified media pipeline.
  final List<Tag>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

enum LiveConnectorMuxType {
  audioWithCompositedVideo,
  audioWithActiveSpeakerVideo,
}

extension LiveConnectorMuxTypeValueExtension on LiveConnectorMuxType {
  String toValue() {
    switch (this) {
      case LiveConnectorMuxType.audioWithCompositedVideo:
        return 'AudioWithCompositedVideo';
      case LiveConnectorMuxType.audioWithActiveSpeakerVideo:
        return 'AudioWithActiveSpeakerVideo';
    }
  }
}

extension LiveConnectorMuxTypeFromString on String {
  LiveConnectorMuxType toLiveConnectorMuxType() {
    switch (this) {
      case 'AudioWithCompositedVideo':
        return LiveConnectorMuxType.audioWithCompositedVideo;
      case 'AudioWithActiveSpeakerVideo':
        return LiveConnectorMuxType.audioWithActiveSpeakerVideo;
    }
    throw Exception('$this is not known in enum LiveConnectorMuxType');
  }
}

/// The media pipeline's RTMP configuration object.
class LiveConnectorRTMPConfiguration {
  /// The URL of the RTMP configuration.
  final String url;

  /// The audio channels set for the RTMP configuration
  final AudioChannelsOption? audioChannels;

  /// The audio sample rate set for the RTMP configuration. Default: 48000.
  final String? audioSampleRate;

  LiveConnectorRTMPConfiguration({
    required this.url,
    this.audioChannels,
    this.audioSampleRate,
  });

  factory LiveConnectorRTMPConfiguration.fromJson(Map<String, dynamic> json) {
    return LiveConnectorRTMPConfiguration(
      url: json['Url'] as String,
      audioChannels:
          (json['AudioChannels'] as String?)?.toAudioChannelsOption(),
      audioSampleRate: json['AudioSampleRate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    final audioChannels = this.audioChannels;
    final audioSampleRate = this.audioSampleRate;
    return {
      'Url': url,
      if (audioChannels != null) 'AudioChannels': audioChannels.toValue(),
      if (audioSampleRate != null) 'AudioSampleRate': audioSampleRate,
    };
  }
}

/// The media pipeline's sink configuration settings.
class LiveConnectorSinkConfiguration {
  /// The sink configuration's RTMP configuration settings.
  final LiveConnectorRTMPConfiguration rTMPConfiguration;

  /// The sink configuration's sink type.
  final LiveConnectorSinkType sinkType;

  LiveConnectorSinkConfiguration({
    required this.rTMPConfiguration,
    required this.sinkType,
  });

  factory LiveConnectorSinkConfiguration.fromJson(Map<String, dynamic> json) {
    return LiveConnectorSinkConfiguration(
      rTMPConfiguration: LiveConnectorRTMPConfiguration.fromJson(
          json['RTMPConfiguration'] as Map<String, dynamic>),
      sinkType: (json['SinkType'] as String).toLiveConnectorSinkType(),
    );
  }

  Map<String, dynamic> toJson() {
    final rTMPConfiguration = this.rTMPConfiguration;
    final sinkType = this.sinkType;
    return {
      'RTMPConfiguration': rTMPConfiguration,
      'SinkType': sinkType.toValue(),
    };
  }
}

enum LiveConnectorSinkType {
  rtmp,
}

extension LiveConnectorSinkTypeValueExtension on LiveConnectorSinkType {
  String toValue() {
    switch (this) {
      case LiveConnectorSinkType.rtmp:
        return 'RTMP';
    }
  }
}

extension LiveConnectorSinkTypeFromString on String {
  LiveConnectorSinkType toLiveConnectorSinkType() {
    switch (this) {
      case 'RTMP':
        return LiveConnectorSinkType.rtmp;
    }
    throw Exception('$this is not known in enum LiveConnectorSinkType');
  }
}

/// The data source configuration object of a streaming media pipeline.
class LiveConnectorSourceConfiguration {
  /// The configuration settings of the connector pipeline.
  final ChimeSdkMeetingLiveConnectorConfiguration
      chimeSdkMeetingLiveConnectorConfiguration;

  /// The source configuration's media source type.
  final LiveConnectorSourceType sourceType;

  LiveConnectorSourceConfiguration({
    required this.chimeSdkMeetingLiveConnectorConfiguration,
    required this.sourceType,
  });

  factory LiveConnectorSourceConfiguration.fromJson(Map<String, dynamic> json) {
    return LiveConnectorSourceConfiguration(
      chimeSdkMeetingLiveConnectorConfiguration:
          ChimeSdkMeetingLiveConnectorConfiguration.fromJson(
              json['ChimeSdkMeetingLiveConnectorConfiguration']
                  as Map<String, dynamic>),
      sourceType: (json['SourceType'] as String).toLiveConnectorSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final chimeSdkMeetingLiveConnectorConfiguration =
        this.chimeSdkMeetingLiveConnectorConfiguration;
    final sourceType = this.sourceType;
    return {
      'ChimeSdkMeetingLiveConnectorConfiguration':
          chimeSdkMeetingLiveConnectorConfiguration,
      'SourceType': sourceType.toValue(),
    };
  }
}

enum LiveConnectorSourceType {
  chimeSdkMeeting,
}

extension LiveConnectorSourceTypeValueExtension on LiveConnectorSourceType {
  String toValue() {
    switch (this) {
      case LiveConnectorSourceType.chimeSdkMeeting:
        return 'ChimeSdkMeeting';
    }
  }
}

extension LiveConnectorSourceTypeFromString on String {
  LiveConnectorSourceType toLiveConnectorSourceType() {
    switch (this) {
      case 'ChimeSdkMeeting':
        return LiveConnectorSourceType.chimeSdkMeeting;
    }
    throw Exception('$this is not known in enum LiveConnectorSourceType');
  }
}

/// A media pipeline object consisting of an ID, source type, source ARN, a sink
/// type, a sink ARN, and a configuration object.
class MediaCapturePipeline {
  /// The configuration for a specified media pipeline. <code>SourceType</code>
  /// must be <code>ChimeSdkMeeting</code>.
  final ChimeSdkMeetingConfiguration? chimeSdkMeetingConfiguration;

  /// The time at which the pipeline was created, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The ARN of the media capture pipeline
  final String? mediaPipelineArn;

  /// The ID of a media pipeline.
  final String? mediaPipelineId;

  /// ARN of the destination to which the media artifacts are saved.
  final String? sinkArn;

  /// Destination type to which the media artifacts are saved. You must use an S3
  /// Bucket.
  final MediaPipelineSinkType? sinkType;

  /// ARN of the source from which the media artifacts are saved.
  final String? sourceArn;

  /// Source type from which media artifacts are saved. You must use
  /// <code>ChimeMeeting</code>.
  final MediaPipelineSourceType? sourceType;

  /// The status of the media pipeline.
  final MediaPipelineStatus? status;

  /// The time at which the pipeline was updated, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  MediaCapturePipeline({
    this.chimeSdkMeetingConfiguration,
    this.createdTimestamp,
    this.mediaPipelineArn,
    this.mediaPipelineId,
    this.sinkArn,
    this.sinkType,
    this.sourceArn,
    this.sourceType,
    this.status,
    this.updatedTimestamp,
  });

  factory MediaCapturePipeline.fromJson(Map<String, dynamic> json) {
    return MediaCapturePipeline(
      chimeSdkMeetingConfiguration: json['ChimeSdkMeetingConfiguration'] != null
          ? ChimeSdkMeetingConfiguration.fromJson(
              json['ChimeSdkMeetingConfiguration'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
      sinkArn: json['SinkArn'] as String?,
      sinkType: (json['SinkType'] as String?)?.toMediaPipelineSinkType(),
      sourceArn: json['SourceArn'] as String?,
      sourceType: (json['SourceType'] as String?)?.toMediaPipelineSourceType(),
      status: (json['Status'] as String?)?.toMediaPipelineStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final chimeSdkMeetingConfiguration = this.chimeSdkMeetingConfiguration;
    final createdTimestamp = this.createdTimestamp;
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    final sinkArn = this.sinkArn;
    final sinkType = this.sinkType;
    final sourceArn = this.sourceArn;
    final sourceType = this.sourceType;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (chimeSdkMeetingConfiguration != null)
        'ChimeSdkMeetingConfiguration': chimeSdkMeetingConfiguration,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
      if (sinkArn != null) 'SinkArn': sinkArn,
      if (sinkType != null) 'SinkType': sinkType.toValue(),
      if (sourceArn != null) 'SourceArn': sourceArn,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// The source configuration object of a media capture pipeline.
class MediaCapturePipelineSourceConfiguration {
  /// The meeting configuration settings in a media capture pipeline configuration
  /// object.
  final ChimeSdkMeetingConcatenationConfiguration chimeSdkMeetingConfiguration;

  /// The media pipeline ARN in the configuration object of a media capture
  /// pipeline.
  final String mediaPipelineArn;

  MediaCapturePipelineSourceConfiguration({
    required this.chimeSdkMeetingConfiguration,
    required this.mediaPipelineArn,
  });

  factory MediaCapturePipelineSourceConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaCapturePipelineSourceConfiguration(
      chimeSdkMeetingConfiguration:
          ChimeSdkMeetingConcatenationConfiguration.fromJson(
              json['ChimeSdkMeetingConfiguration'] as Map<String, dynamic>),
      mediaPipelineArn: json['MediaPipelineArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final chimeSdkMeetingConfiguration = this.chimeSdkMeetingConfiguration;
    final mediaPipelineArn = this.mediaPipelineArn;
    return {
      'ChimeSdkMeetingConfiguration': chimeSdkMeetingConfiguration,
      'MediaPipelineArn': mediaPipelineArn,
    };
  }
}

/// The summary data of a media capture pipeline.
class MediaCapturePipelineSummary {
  /// The ARN of the media pipeline in the summary.
  final String? mediaPipelineArn;

  /// The ID of the media pipeline in the summary.
  final String? mediaPipelineId;

  MediaCapturePipelineSummary({
    this.mediaPipelineArn,
    this.mediaPipelineId,
  });

  factory MediaCapturePipelineSummary.fromJson(Map<String, dynamic> json) {
    return MediaCapturePipelineSummary(
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    return {
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
    };
  }
}

/// Concatenates audio and video data from one or more data streams.
class MediaConcatenationPipeline {
  /// The time at which the concatenation pipeline was created.
  final DateTime? createdTimestamp;

  /// The ARN of the media pipeline that you specify in the
  /// <code>SourceConfiguration</code> object.
  final String? mediaPipelineArn;

  /// The ID of the media pipeline being concatenated.
  final String? mediaPipelineId;

  /// The data sinks of the concatenation pipeline.
  final List<ConcatenationSink>? sinks;

  /// The data sources being concatenated.
  final List<ConcatenationSource>? sources;

  /// The status of the concatenation pipeline.
  final MediaPipelineStatus? status;

  /// The time at which the concatenation pipeline was last updated.
  final DateTime? updatedTimestamp;

  MediaConcatenationPipeline({
    this.createdTimestamp,
    this.mediaPipelineArn,
    this.mediaPipelineId,
    this.sinks,
    this.sources,
    this.status,
    this.updatedTimestamp,
  });

  factory MediaConcatenationPipeline.fromJson(Map<String, dynamic> json) {
    return MediaConcatenationPipeline(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
      sinks: (json['Sinks'] as List?)
          ?.whereNotNull()
          .map((e) => ConcatenationSink.fromJson(e as Map<String, dynamic>))
          .toList(),
      sources: (json['Sources'] as List?)
          ?.whereNotNull()
          .map((e) => ConcatenationSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toMediaPipelineStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    final sinks = this.sinks;
    final sources = this.sources;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
      if (sinks != null) 'Sinks': sinks,
      if (sources != null) 'Sources': sources,
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

enum MediaEncoding {
  pcm,
}

extension MediaEncodingValueExtension on MediaEncoding {
  String toValue() {
    switch (this) {
      case MediaEncoding.pcm:
        return 'pcm';
    }
  }
}

extension MediaEncodingFromString on String {
  MediaEncoding toMediaEncoding() {
    switch (this) {
      case 'pcm':
        return MediaEncoding.pcm;
    }
    throw Exception('$this is not known in enum MediaEncoding');
  }
}

/// A media pipeline that streams call analytics data.
class MediaInsightsPipeline {
  /// The time at which the media insights pipeline was created.
  final DateTime? createdTimestamp;

  /// The statuses that the elements in a media insights pipeline can have during
  /// data processing.
  final List<MediaInsightsPipelineElementStatus>? elementStatuses;

  /// The runtime configuration settings for a Kinesis recording video stream in a
  /// media insights pipeline.
  final KinesisVideoStreamRecordingSourceRuntimeConfiguration?
      kinesisVideoStreamRecordingSourceRuntimeConfiguration;

  /// The configuration settings for a Kinesis runtime video stream in a media
  /// insights pipeline.
  final KinesisVideoStreamSourceRuntimeConfiguration?
      kinesisVideoStreamSourceRuntimeConfiguration;

  /// The ARN of a media insight pipeline's configuration settings.
  final String? mediaInsightsPipelineConfigurationArn;

  /// The runtime metadata of a media insights pipeline.
  final Map<String, String>? mediaInsightsRuntimeMetadata;

  /// The ARN of a media insights pipeline.
  final String? mediaPipelineArn;

  /// The ID of a media insights pipeline.
  final String? mediaPipelineId;

  /// The runtime configuration of the Amazon S3 bucket that stores recordings in
  /// a media insights pipeline.
  final S3RecordingSinkRuntimeConfiguration?
      s3RecordingSinkRuntimeConfiguration;

  /// The status of a media insights pipeline.
  final MediaPipelineStatus? status;

  MediaInsightsPipeline({
    this.createdTimestamp,
    this.elementStatuses,
    this.kinesisVideoStreamRecordingSourceRuntimeConfiguration,
    this.kinesisVideoStreamSourceRuntimeConfiguration,
    this.mediaInsightsPipelineConfigurationArn,
    this.mediaInsightsRuntimeMetadata,
    this.mediaPipelineArn,
    this.mediaPipelineId,
    this.s3RecordingSinkRuntimeConfiguration,
    this.status,
  });

  factory MediaInsightsPipeline.fromJson(Map<String, dynamic> json) {
    return MediaInsightsPipeline(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      elementStatuses: (json['ElementStatuses'] as List?)
          ?.whereNotNull()
          .map((e) => MediaInsightsPipelineElementStatus.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      kinesisVideoStreamRecordingSourceRuntimeConfiguration:
          json['KinesisVideoStreamRecordingSourceRuntimeConfiguration'] != null
              ? KinesisVideoStreamRecordingSourceRuntimeConfiguration.fromJson(
                  json['KinesisVideoStreamRecordingSourceRuntimeConfiguration']
                      as Map<String, dynamic>)
              : null,
      kinesisVideoStreamSourceRuntimeConfiguration:
          json['KinesisVideoStreamSourceRuntimeConfiguration'] != null
              ? KinesisVideoStreamSourceRuntimeConfiguration.fromJson(
                  json['KinesisVideoStreamSourceRuntimeConfiguration']
                      as Map<String, dynamic>)
              : null,
      mediaInsightsPipelineConfigurationArn:
          json['MediaInsightsPipelineConfigurationArn'] as String?,
      mediaInsightsRuntimeMetadata:
          (json['MediaInsightsRuntimeMetadata'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
      s3RecordingSinkRuntimeConfiguration:
          json['S3RecordingSinkRuntimeConfiguration'] != null
              ? S3RecordingSinkRuntimeConfiguration.fromJson(
                  json['S3RecordingSinkRuntimeConfiguration']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)?.toMediaPipelineStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final elementStatuses = this.elementStatuses;
    final kinesisVideoStreamRecordingSourceRuntimeConfiguration =
        this.kinesisVideoStreamRecordingSourceRuntimeConfiguration;
    final kinesisVideoStreamSourceRuntimeConfiguration =
        this.kinesisVideoStreamSourceRuntimeConfiguration;
    final mediaInsightsPipelineConfigurationArn =
        this.mediaInsightsPipelineConfigurationArn;
    final mediaInsightsRuntimeMetadata = this.mediaInsightsRuntimeMetadata;
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    final s3RecordingSinkRuntimeConfiguration =
        this.s3RecordingSinkRuntimeConfiguration;
    final status = this.status;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (elementStatuses != null) 'ElementStatuses': elementStatuses,
      if (kinesisVideoStreamRecordingSourceRuntimeConfiguration != null)
        'KinesisVideoStreamRecordingSourceRuntimeConfiguration':
            kinesisVideoStreamRecordingSourceRuntimeConfiguration,
      if (kinesisVideoStreamSourceRuntimeConfiguration != null)
        'KinesisVideoStreamSourceRuntimeConfiguration':
            kinesisVideoStreamSourceRuntimeConfiguration,
      if (mediaInsightsPipelineConfigurationArn != null)
        'MediaInsightsPipelineConfigurationArn':
            mediaInsightsPipelineConfigurationArn,
      if (mediaInsightsRuntimeMetadata != null)
        'MediaInsightsRuntimeMetadata': mediaInsightsRuntimeMetadata,
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
      if (s3RecordingSinkRuntimeConfiguration != null)
        'S3RecordingSinkRuntimeConfiguration':
            s3RecordingSinkRuntimeConfiguration,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

/// A structure that contains the configuration settings for a media insights
/// pipeline.
class MediaInsightsPipelineConfiguration {
  /// The time at which the configuration was created.
  final DateTime? createdTimestamp;

  /// The elements in the configuration.
  final List<MediaInsightsPipelineConfigurationElement>? elements;

  /// The ARN of the configuration.
  final String? mediaInsightsPipelineConfigurationArn;

  /// The ID of the configuration.
  final String? mediaInsightsPipelineConfigurationId;

  /// The name of the configuration.
  final String? mediaInsightsPipelineConfigurationName;

  /// Lists the rules that trigger a real-time alert.
  final RealTimeAlertConfiguration? realTimeAlertConfiguration;

  /// The ARN of the role used by the service to access Amazon Web Services
  /// resources.
  final String? resourceAccessRoleArn;

  /// The time at which the configuration was last updated.
  final DateTime? updatedTimestamp;

  MediaInsightsPipelineConfiguration({
    this.createdTimestamp,
    this.elements,
    this.mediaInsightsPipelineConfigurationArn,
    this.mediaInsightsPipelineConfigurationId,
    this.mediaInsightsPipelineConfigurationName,
    this.realTimeAlertConfiguration,
    this.resourceAccessRoleArn,
    this.updatedTimestamp,
  });

  factory MediaInsightsPipelineConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MediaInsightsPipelineConfiguration(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      elements: (json['Elements'] as List?)
          ?.whereNotNull()
          .map((e) => MediaInsightsPipelineConfigurationElement.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      mediaInsightsPipelineConfigurationArn:
          json['MediaInsightsPipelineConfigurationArn'] as String?,
      mediaInsightsPipelineConfigurationId:
          json['MediaInsightsPipelineConfigurationId'] as String?,
      mediaInsightsPipelineConfigurationName:
          json['MediaInsightsPipelineConfigurationName'] as String?,
      realTimeAlertConfiguration: json['RealTimeAlertConfiguration'] != null
          ? RealTimeAlertConfiguration.fromJson(
              json['RealTimeAlertConfiguration'] as Map<String, dynamic>)
          : null,
      resourceAccessRoleArn: json['ResourceAccessRoleArn'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final elements = this.elements;
    final mediaInsightsPipelineConfigurationArn =
        this.mediaInsightsPipelineConfigurationArn;
    final mediaInsightsPipelineConfigurationId =
        this.mediaInsightsPipelineConfigurationId;
    final mediaInsightsPipelineConfigurationName =
        this.mediaInsightsPipelineConfigurationName;
    final realTimeAlertConfiguration = this.realTimeAlertConfiguration;
    final resourceAccessRoleArn = this.resourceAccessRoleArn;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (elements != null) 'Elements': elements,
      if (mediaInsightsPipelineConfigurationArn != null)
        'MediaInsightsPipelineConfigurationArn':
            mediaInsightsPipelineConfigurationArn,
      if (mediaInsightsPipelineConfigurationId != null)
        'MediaInsightsPipelineConfigurationId':
            mediaInsightsPipelineConfigurationId,
      if (mediaInsightsPipelineConfigurationName != null)
        'MediaInsightsPipelineConfigurationName':
            mediaInsightsPipelineConfigurationName,
      if (realTimeAlertConfiguration != null)
        'RealTimeAlertConfiguration': realTimeAlertConfiguration,
      if (resourceAccessRoleArn != null)
        'ResourceAccessRoleArn': resourceAccessRoleArn,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// An element in a media insights pipeline configuration.
class MediaInsightsPipelineConfigurationElement {
  /// The element type.
  final MediaInsightsPipelineConfigurationElementType type;

  /// The analytics configuration settings for transcribing audio in a media
  /// insights pipeline configuration element.
  final AmazonTranscribeCallAnalyticsProcessorConfiguration?
      amazonTranscribeCallAnalyticsProcessorConfiguration;

  /// The transcription processor configuration settings in a media insights
  /// pipeline configuration element.
  final AmazonTranscribeProcessorConfiguration?
      amazonTranscribeProcessorConfiguration;

  /// The configuration settings for the Kinesis Data Stream Sink in a media
  /// insights pipeline configuration element.
  final KinesisDataStreamSinkConfiguration? kinesisDataStreamSinkConfiguration;

  /// The configuration settings for the Amazon Web Services Lambda sink in a
  /// media insights pipeline configuration element.
  final LambdaFunctionSinkConfiguration? lambdaFunctionSinkConfiguration;

  /// The configuration settings for the Amazon S3 recording bucket in a media
  /// insights pipeline configuration element.
  final S3RecordingSinkConfiguration? s3RecordingSinkConfiguration;

  /// The configuration settings for an SNS topic sink in a media insights
  /// pipeline configuration element.
  final SnsTopicSinkConfiguration? snsTopicSinkConfiguration;

  /// The configuration settings for an SQS queue sink in a media insights
  /// pipeline configuration element.
  final SqsQueueSinkConfiguration? sqsQueueSinkConfiguration;

  /// The voice analytics configuration settings in a media insights pipeline
  /// configuration element.
  final VoiceAnalyticsProcessorConfiguration?
      voiceAnalyticsProcessorConfiguration;

  /// The configuration settings for voice enhancement sink in a media insights
  /// pipeline configuration element.
  final VoiceEnhancementSinkConfiguration? voiceEnhancementSinkConfiguration;

  MediaInsightsPipelineConfigurationElement({
    required this.type,
    this.amazonTranscribeCallAnalyticsProcessorConfiguration,
    this.amazonTranscribeProcessorConfiguration,
    this.kinesisDataStreamSinkConfiguration,
    this.lambdaFunctionSinkConfiguration,
    this.s3RecordingSinkConfiguration,
    this.snsTopicSinkConfiguration,
    this.sqsQueueSinkConfiguration,
    this.voiceAnalyticsProcessorConfiguration,
    this.voiceEnhancementSinkConfiguration,
  });

  factory MediaInsightsPipelineConfigurationElement.fromJson(
      Map<String, dynamic> json) {
    return MediaInsightsPipelineConfigurationElement(
      type: (json['Type'] as String)
          .toMediaInsightsPipelineConfigurationElementType(),
      amazonTranscribeCallAnalyticsProcessorConfiguration:
          json['AmazonTranscribeCallAnalyticsProcessorConfiguration'] != null
              ? AmazonTranscribeCallAnalyticsProcessorConfiguration.fromJson(
                  json['AmazonTranscribeCallAnalyticsProcessorConfiguration']
                      as Map<String, dynamic>)
              : null,
      amazonTranscribeProcessorConfiguration:
          json['AmazonTranscribeProcessorConfiguration'] != null
              ? AmazonTranscribeProcessorConfiguration.fromJson(
                  json['AmazonTranscribeProcessorConfiguration']
                      as Map<String, dynamic>)
              : null,
      kinesisDataStreamSinkConfiguration:
          json['KinesisDataStreamSinkConfiguration'] != null
              ? KinesisDataStreamSinkConfiguration.fromJson(
                  json['KinesisDataStreamSinkConfiguration']
                      as Map<String, dynamic>)
              : null,
      lambdaFunctionSinkConfiguration:
          json['LambdaFunctionSinkConfiguration'] != null
              ? LambdaFunctionSinkConfiguration.fromJson(
                  json['LambdaFunctionSinkConfiguration']
                      as Map<String, dynamic>)
              : null,
      s3RecordingSinkConfiguration: json['S3RecordingSinkConfiguration'] != null
          ? S3RecordingSinkConfiguration.fromJson(
              json['S3RecordingSinkConfiguration'] as Map<String, dynamic>)
          : null,
      snsTopicSinkConfiguration: json['SnsTopicSinkConfiguration'] != null
          ? SnsTopicSinkConfiguration.fromJson(
              json['SnsTopicSinkConfiguration'] as Map<String, dynamic>)
          : null,
      sqsQueueSinkConfiguration: json['SqsQueueSinkConfiguration'] != null
          ? SqsQueueSinkConfiguration.fromJson(
              json['SqsQueueSinkConfiguration'] as Map<String, dynamic>)
          : null,
      voiceAnalyticsProcessorConfiguration:
          json['VoiceAnalyticsProcessorConfiguration'] != null
              ? VoiceAnalyticsProcessorConfiguration.fromJson(
                  json['VoiceAnalyticsProcessorConfiguration']
                      as Map<String, dynamic>)
              : null,
      voiceEnhancementSinkConfiguration:
          json['VoiceEnhancementSinkConfiguration'] != null
              ? VoiceEnhancementSinkConfiguration.fromJson(
                  json['VoiceEnhancementSinkConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final amazonTranscribeCallAnalyticsProcessorConfiguration =
        this.amazonTranscribeCallAnalyticsProcessorConfiguration;
    final amazonTranscribeProcessorConfiguration =
        this.amazonTranscribeProcessorConfiguration;
    final kinesisDataStreamSinkConfiguration =
        this.kinesisDataStreamSinkConfiguration;
    final lambdaFunctionSinkConfiguration =
        this.lambdaFunctionSinkConfiguration;
    final s3RecordingSinkConfiguration = this.s3RecordingSinkConfiguration;
    final snsTopicSinkConfiguration = this.snsTopicSinkConfiguration;
    final sqsQueueSinkConfiguration = this.sqsQueueSinkConfiguration;
    final voiceAnalyticsProcessorConfiguration =
        this.voiceAnalyticsProcessorConfiguration;
    final voiceEnhancementSinkConfiguration =
        this.voiceEnhancementSinkConfiguration;
    return {
      'Type': type.toValue(),
      if (amazonTranscribeCallAnalyticsProcessorConfiguration != null)
        'AmazonTranscribeCallAnalyticsProcessorConfiguration':
            amazonTranscribeCallAnalyticsProcessorConfiguration,
      if (amazonTranscribeProcessorConfiguration != null)
        'AmazonTranscribeProcessorConfiguration':
            amazonTranscribeProcessorConfiguration,
      if (kinesisDataStreamSinkConfiguration != null)
        'KinesisDataStreamSinkConfiguration':
            kinesisDataStreamSinkConfiguration,
      if (lambdaFunctionSinkConfiguration != null)
        'LambdaFunctionSinkConfiguration': lambdaFunctionSinkConfiguration,
      if (s3RecordingSinkConfiguration != null)
        'S3RecordingSinkConfiguration': s3RecordingSinkConfiguration,
      if (snsTopicSinkConfiguration != null)
        'SnsTopicSinkConfiguration': snsTopicSinkConfiguration,
      if (sqsQueueSinkConfiguration != null)
        'SqsQueueSinkConfiguration': sqsQueueSinkConfiguration,
      if (voiceAnalyticsProcessorConfiguration != null)
        'VoiceAnalyticsProcessorConfiguration':
            voiceAnalyticsProcessorConfiguration,
      if (voiceEnhancementSinkConfiguration != null)
        'VoiceEnhancementSinkConfiguration': voiceEnhancementSinkConfiguration,
    };
  }
}

enum MediaInsightsPipelineConfigurationElementType {
  amazonTranscribeCallAnalyticsProcessor,
  voiceAnalyticsProcessor,
  amazonTranscribeProcessor,
  kinesisDataStreamSink,
  lambdaFunctionSink,
  sqsQueueSink,
  snsTopicSink,
  s3RecordingSink,
  voiceEnhancementSink,
}

extension MediaInsightsPipelineConfigurationElementTypeValueExtension
    on MediaInsightsPipelineConfigurationElementType {
  String toValue() {
    switch (this) {
      case MediaInsightsPipelineConfigurationElementType
            .amazonTranscribeCallAnalyticsProcessor:
        return 'AmazonTranscribeCallAnalyticsProcessor';
      case MediaInsightsPipelineConfigurationElementType
            .voiceAnalyticsProcessor:
        return 'VoiceAnalyticsProcessor';
      case MediaInsightsPipelineConfigurationElementType
            .amazonTranscribeProcessor:
        return 'AmazonTranscribeProcessor';
      case MediaInsightsPipelineConfigurationElementType.kinesisDataStreamSink:
        return 'KinesisDataStreamSink';
      case MediaInsightsPipelineConfigurationElementType.lambdaFunctionSink:
        return 'LambdaFunctionSink';
      case MediaInsightsPipelineConfigurationElementType.sqsQueueSink:
        return 'SqsQueueSink';
      case MediaInsightsPipelineConfigurationElementType.snsTopicSink:
        return 'SnsTopicSink';
      case MediaInsightsPipelineConfigurationElementType.s3RecordingSink:
        return 'S3RecordingSink';
      case MediaInsightsPipelineConfigurationElementType.voiceEnhancementSink:
        return 'VoiceEnhancementSink';
    }
  }
}

extension MediaInsightsPipelineConfigurationElementTypeFromString on String {
  MediaInsightsPipelineConfigurationElementType
      toMediaInsightsPipelineConfigurationElementType() {
    switch (this) {
      case 'AmazonTranscribeCallAnalyticsProcessor':
        return MediaInsightsPipelineConfigurationElementType
            .amazonTranscribeCallAnalyticsProcessor;
      case 'VoiceAnalyticsProcessor':
        return MediaInsightsPipelineConfigurationElementType
            .voiceAnalyticsProcessor;
      case 'AmazonTranscribeProcessor':
        return MediaInsightsPipelineConfigurationElementType
            .amazonTranscribeProcessor;
      case 'KinesisDataStreamSink':
        return MediaInsightsPipelineConfigurationElementType
            .kinesisDataStreamSink;
      case 'LambdaFunctionSink':
        return MediaInsightsPipelineConfigurationElementType.lambdaFunctionSink;
      case 'SqsQueueSink':
        return MediaInsightsPipelineConfigurationElementType.sqsQueueSink;
      case 'SnsTopicSink':
        return MediaInsightsPipelineConfigurationElementType.snsTopicSink;
      case 'S3RecordingSink':
        return MediaInsightsPipelineConfigurationElementType.s3RecordingSink;
      case 'VoiceEnhancementSink':
        return MediaInsightsPipelineConfigurationElementType
            .voiceEnhancementSink;
    }
    throw Exception(
        '$this is not known in enum MediaInsightsPipelineConfigurationElementType');
  }
}

/// A summary of the media insights pipeline configuration.
class MediaInsightsPipelineConfigurationSummary {
  /// The ARN of the media insights pipeline configuration.
  final String? mediaInsightsPipelineConfigurationArn;

  /// The ID of the media insights pipeline configuration.
  final String? mediaInsightsPipelineConfigurationId;

  /// The name of the media insights pipeline configuration.
  final String? mediaInsightsPipelineConfigurationName;

  MediaInsightsPipelineConfigurationSummary({
    this.mediaInsightsPipelineConfigurationArn,
    this.mediaInsightsPipelineConfigurationId,
    this.mediaInsightsPipelineConfigurationName,
  });

  factory MediaInsightsPipelineConfigurationSummary.fromJson(
      Map<String, dynamic> json) {
    return MediaInsightsPipelineConfigurationSummary(
      mediaInsightsPipelineConfigurationArn:
          json['MediaInsightsPipelineConfigurationArn'] as String?,
      mediaInsightsPipelineConfigurationId:
          json['MediaInsightsPipelineConfigurationId'] as String?,
      mediaInsightsPipelineConfigurationName:
          json['MediaInsightsPipelineConfigurationName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaInsightsPipelineConfigurationArn =
        this.mediaInsightsPipelineConfigurationArn;
    final mediaInsightsPipelineConfigurationId =
        this.mediaInsightsPipelineConfigurationId;
    final mediaInsightsPipelineConfigurationName =
        this.mediaInsightsPipelineConfigurationName;
    return {
      if (mediaInsightsPipelineConfigurationArn != null)
        'MediaInsightsPipelineConfigurationArn':
            mediaInsightsPipelineConfigurationArn,
      if (mediaInsightsPipelineConfigurationId != null)
        'MediaInsightsPipelineConfigurationId':
            mediaInsightsPipelineConfigurationId,
      if (mediaInsightsPipelineConfigurationName != null)
        'MediaInsightsPipelineConfigurationName':
            mediaInsightsPipelineConfigurationName,
    };
  }
}

/// The status of the pipeline element.
class MediaInsightsPipelineElementStatus {
  /// The element's status.
  final MediaPipelineElementStatus? status;

  /// The type of status.
  final MediaInsightsPipelineConfigurationElementType? type;

  MediaInsightsPipelineElementStatus({
    this.status,
    this.type,
  });

  factory MediaInsightsPipelineElementStatus.fromJson(
      Map<String, dynamic> json) {
    return MediaInsightsPipelineElementStatus(
      status: (json['Status'] as String?)?.toMediaPipelineElementStatus(),
      type: (json['Type'] as String?)
          ?.toMediaInsightsPipelineConfigurationElementType(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final type = this.type;
    return {
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The connector pipeline.
class MediaLiveConnectorPipeline {
  /// The time at which the connector pipeline was created.
  final DateTime? createdTimestamp;

  /// The connector pipeline's ARN.
  final String? mediaPipelineArn;

  /// The connector pipeline's ID.
  final String? mediaPipelineId;

  /// The connector pipeline's data sinks.
  final List<LiveConnectorSinkConfiguration>? sinks;

  /// The connector pipeline's data sources.
  final List<LiveConnectorSourceConfiguration>? sources;

  /// The connector pipeline's status.
  final MediaPipelineStatus? status;

  /// The time at which the connector pipeline was last updated.
  final DateTime? updatedTimestamp;

  MediaLiveConnectorPipeline({
    this.createdTimestamp,
    this.mediaPipelineArn,
    this.mediaPipelineId,
    this.sinks,
    this.sources,
    this.status,
    this.updatedTimestamp,
  });

  factory MediaLiveConnectorPipeline.fromJson(Map<String, dynamic> json) {
    return MediaLiveConnectorPipeline(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
      sinks: (json['Sinks'] as List?)
          ?.whereNotNull()
          .map((e) => LiveConnectorSinkConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      sources: (json['Sources'] as List?)
          ?.whereNotNull()
          .map((e) => LiveConnectorSourceConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toMediaPipelineStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    final sinks = this.sinks;
    final sources = this.sources;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
      if (sinks != null) 'Sinks': sinks,
      if (sources != null) 'Sources': sources,
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// A pipeline consisting of a media capture, media concatenation, or
/// live-streaming pipeline.
class MediaPipeline {
  /// A pipeline that enables users to capture audio and video.
  final MediaCapturePipeline? mediaCapturePipeline;

  /// The media concatenation pipeline in a media pipeline.
  final MediaConcatenationPipeline? mediaConcatenationPipeline;

  /// The media insights pipeline of a media pipeline.
  final MediaInsightsPipeline? mediaInsightsPipeline;

  /// The connector pipeline of the media pipeline.
  final MediaLiveConnectorPipeline? mediaLiveConnectorPipeline;

  /// Designates a media pipeline as a media stream pipeline.
  final MediaStreamPipeline? mediaStreamPipeline;

  MediaPipeline({
    this.mediaCapturePipeline,
    this.mediaConcatenationPipeline,
    this.mediaInsightsPipeline,
    this.mediaLiveConnectorPipeline,
    this.mediaStreamPipeline,
  });

  factory MediaPipeline.fromJson(Map<String, dynamic> json) {
    return MediaPipeline(
      mediaCapturePipeline: json['MediaCapturePipeline'] != null
          ? MediaCapturePipeline.fromJson(
              json['MediaCapturePipeline'] as Map<String, dynamic>)
          : null,
      mediaConcatenationPipeline: json['MediaConcatenationPipeline'] != null
          ? MediaConcatenationPipeline.fromJson(
              json['MediaConcatenationPipeline'] as Map<String, dynamic>)
          : null,
      mediaInsightsPipeline: json['MediaInsightsPipeline'] != null
          ? MediaInsightsPipeline.fromJson(
              json['MediaInsightsPipeline'] as Map<String, dynamic>)
          : null,
      mediaLiveConnectorPipeline: json['MediaLiveConnectorPipeline'] != null
          ? MediaLiveConnectorPipeline.fromJson(
              json['MediaLiveConnectorPipeline'] as Map<String, dynamic>)
          : null,
      mediaStreamPipeline: json['MediaStreamPipeline'] != null
          ? MediaStreamPipeline.fromJson(
              json['MediaStreamPipeline'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaCapturePipeline = this.mediaCapturePipeline;
    final mediaConcatenationPipeline = this.mediaConcatenationPipeline;
    final mediaInsightsPipeline = this.mediaInsightsPipeline;
    final mediaLiveConnectorPipeline = this.mediaLiveConnectorPipeline;
    final mediaStreamPipeline = this.mediaStreamPipeline;
    return {
      if (mediaCapturePipeline != null)
        'MediaCapturePipeline': mediaCapturePipeline,
      if (mediaConcatenationPipeline != null)
        'MediaConcatenationPipeline': mediaConcatenationPipeline,
      if (mediaInsightsPipeline != null)
        'MediaInsightsPipeline': mediaInsightsPipeline,
      if (mediaLiveConnectorPipeline != null)
        'MediaLiveConnectorPipeline': mediaLiveConnectorPipeline,
      if (mediaStreamPipeline != null)
        'MediaStreamPipeline': mediaStreamPipeline,
    };
  }
}

enum MediaPipelineElementStatus {
  notStarted,
  notSupported,
  initializing,
  inProgress,
  failed,
  stopping,
  stopped,
  paused,
}

extension MediaPipelineElementStatusValueExtension
    on MediaPipelineElementStatus {
  String toValue() {
    switch (this) {
      case MediaPipelineElementStatus.notStarted:
        return 'NotStarted';
      case MediaPipelineElementStatus.notSupported:
        return 'NotSupported';
      case MediaPipelineElementStatus.initializing:
        return 'Initializing';
      case MediaPipelineElementStatus.inProgress:
        return 'InProgress';
      case MediaPipelineElementStatus.failed:
        return 'Failed';
      case MediaPipelineElementStatus.stopping:
        return 'Stopping';
      case MediaPipelineElementStatus.stopped:
        return 'Stopped';
      case MediaPipelineElementStatus.paused:
        return 'Paused';
    }
  }
}

extension MediaPipelineElementStatusFromString on String {
  MediaPipelineElementStatus toMediaPipelineElementStatus() {
    switch (this) {
      case 'NotStarted':
        return MediaPipelineElementStatus.notStarted;
      case 'NotSupported':
        return MediaPipelineElementStatus.notSupported;
      case 'Initializing':
        return MediaPipelineElementStatus.initializing;
      case 'InProgress':
        return MediaPipelineElementStatus.inProgress;
      case 'Failed':
        return MediaPipelineElementStatus.failed;
      case 'Stopping':
        return MediaPipelineElementStatus.stopping;
      case 'Stopped':
        return MediaPipelineElementStatus.stopped;
      case 'Paused':
        return MediaPipelineElementStatus.paused;
    }
    throw Exception('$this is not known in enum MediaPipelineElementStatus');
  }
}

enum MediaPipelineSinkType {
  s3Bucket,
}

extension MediaPipelineSinkTypeValueExtension on MediaPipelineSinkType {
  String toValue() {
    switch (this) {
      case MediaPipelineSinkType.s3Bucket:
        return 'S3Bucket';
    }
  }
}

extension MediaPipelineSinkTypeFromString on String {
  MediaPipelineSinkType toMediaPipelineSinkType() {
    switch (this) {
      case 'S3Bucket':
        return MediaPipelineSinkType.s3Bucket;
    }
    throw Exception('$this is not known in enum MediaPipelineSinkType');
  }
}

enum MediaPipelineSourceType {
  chimeSdkMeeting,
}

extension MediaPipelineSourceTypeValueExtension on MediaPipelineSourceType {
  String toValue() {
    switch (this) {
      case MediaPipelineSourceType.chimeSdkMeeting:
        return 'ChimeSdkMeeting';
    }
  }
}

extension MediaPipelineSourceTypeFromString on String {
  MediaPipelineSourceType toMediaPipelineSourceType() {
    switch (this) {
      case 'ChimeSdkMeeting':
        return MediaPipelineSourceType.chimeSdkMeeting;
    }
    throw Exception('$this is not known in enum MediaPipelineSourceType');
  }
}

enum MediaPipelineStatus {
  initializing,
  inProgress,
  failed,
  stopping,
  stopped,
  paused,
  notStarted,
}

extension MediaPipelineStatusValueExtension on MediaPipelineStatus {
  String toValue() {
    switch (this) {
      case MediaPipelineStatus.initializing:
        return 'Initializing';
      case MediaPipelineStatus.inProgress:
        return 'InProgress';
      case MediaPipelineStatus.failed:
        return 'Failed';
      case MediaPipelineStatus.stopping:
        return 'Stopping';
      case MediaPipelineStatus.stopped:
        return 'Stopped';
      case MediaPipelineStatus.paused:
        return 'Paused';
      case MediaPipelineStatus.notStarted:
        return 'NotStarted';
    }
  }
}

extension MediaPipelineStatusFromString on String {
  MediaPipelineStatus toMediaPipelineStatus() {
    switch (this) {
      case 'Initializing':
        return MediaPipelineStatus.initializing;
      case 'InProgress':
        return MediaPipelineStatus.inProgress;
      case 'Failed':
        return MediaPipelineStatus.failed;
      case 'Stopping':
        return MediaPipelineStatus.stopping;
      case 'Stopped':
        return MediaPipelineStatus.stopped;
      case 'Paused':
        return MediaPipelineStatus.paused;
      case 'NotStarted':
        return MediaPipelineStatus.notStarted;
    }
    throw Exception('$this is not known in enum MediaPipelineStatus');
  }
}

enum MediaPipelineStatusUpdate {
  pause,
  resume,
}

extension MediaPipelineStatusUpdateValueExtension on MediaPipelineStatusUpdate {
  String toValue() {
    switch (this) {
      case MediaPipelineStatusUpdate.pause:
        return 'Pause';
      case MediaPipelineStatusUpdate.resume:
        return 'Resume';
    }
  }
}

extension MediaPipelineStatusUpdateFromString on String {
  MediaPipelineStatusUpdate toMediaPipelineStatusUpdate() {
    switch (this) {
      case 'Pause':
        return MediaPipelineStatusUpdate.pause;
      case 'Resume':
        return MediaPipelineStatusUpdate.resume;
    }
    throw Exception('$this is not known in enum MediaPipelineStatusUpdate');
  }
}

/// The summary of the media pipeline.
class MediaPipelineSummary {
  /// The ARN of the media pipeline in the summary.
  final String? mediaPipelineArn;

  /// The ID of the media pipeline in the summary.
  final String? mediaPipelineId;

  MediaPipelineSummary({
    this.mediaPipelineArn,
    this.mediaPipelineId,
  });

  factory MediaPipelineSummary.fromJson(Map<String, dynamic> json) {
    return MediaPipelineSummary(
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    return {
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
    };
  }
}

enum MediaPipelineTaskStatus {
  notStarted,
  initializing,
  inProgress,
  failed,
  stopping,
  stopped,
}

extension MediaPipelineTaskStatusValueExtension on MediaPipelineTaskStatus {
  String toValue() {
    switch (this) {
      case MediaPipelineTaskStatus.notStarted:
        return 'NotStarted';
      case MediaPipelineTaskStatus.initializing:
        return 'Initializing';
      case MediaPipelineTaskStatus.inProgress:
        return 'InProgress';
      case MediaPipelineTaskStatus.failed:
        return 'Failed';
      case MediaPipelineTaskStatus.stopping:
        return 'Stopping';
      case MediaPipelineTaskStatus.stopped:
        return 'Stopped';
    }
  }
}

extension MediaPipelineTaskStatusFromString on String {
  MediaPipelineTaskStatus toMediaPipelineTaskStatus() {
    switch (this) {
      case 'NotStarted':
        return MediaPipelineTaskStatus.notStarted;
      case 'Initializing':
        return MediaPipelineTaskStatus.initializing;
      case 'InProgress':
        return MediaPipelineTaskStatus.inProgress;
      case 'Failed':
        return MediaPipelineTaskStatus.failed;
      case 'Stopping':
        return MediaPipelineTaskStatus.stopping;
      case 'Stopped':
        return MediaPipelineTaskStatus.stopped;
    }
    throw Exception('$this is not known in enum MediaPipelineTaskStatus');
  }
}

/// Structure that contains the settings for a media stream pipeline.
class MediaStreamPipeline {
  /// The time at which the media stream pipeline was created.
  final DateTime? createdTimestamp;

  /// The ARN of the media stream pipeline.
  final String? mediaPipelineArn;

  /// The ID of the media stream pipeline
  final String? mediaPipelineId;

  /// The media stream pipeline's data sinks.
  final List<MediaStreamSink>? sinks;

  /// The media stream pipeline's data sources.
  final List<MediaStreamSource>? sources;

  /// The status of the media stream pipeline.
  final MediaPipelineStatus? status;

  /// The time at which the media stream pipeline was updated.
  final DateTime? updatedTimestamp;

  MediaStreamPipeline({
    this.createdTimestamp,
    this.mediaPipelineArn,
    this.mediaPipelineId,
    this.sinks,
    this.sources,
    this.status,
    this.updatedTimestamp,
  });

  factory MediaStreamPipeline.fromJson(Map<String, dynamic> json) {
    return MediaStreamPipeline(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      mediaPipelineArn: json['MediaPipelineArn'] as String?,
      mediaPipelineId: json['MediaPipelineId'] as String?,
      sinks: (json['Sinks'] as List?)
          ?.whereNotNull()
          .map((e) => MediaStreamSink.fromJson(e as Map<String, dynamic>))
          .toList(),
      sources: (json['Sources'] as List?)
          ?.whereNotNull()
          .map((e) => MediaStreamSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['Status'] as String?)?.toMediaPipelineStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final mediaPipelineArn = this.mediaPipelineArn;
    final mediaPipelineId = this.mediaPipelineId;
    final sinks = this.sinks;
    final sources = this.sources;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (mediaPipelineArn != null) 'MediaPipelineArn': mediaPipelineArn,
      if (mediaPipelineId != null) 'MediaPipelineId': mediaPipelineId,
      if (sinks != null) 'Sinks': sinks,
      if (sources != null) 'Sources': sources,
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

enum MediaStreamPipelineSinkType {
  kinesisVideoStreamPool,
}

extension MediaStreamPipelineSinkTypeValueExtension
    on MediaStreamPipelineSinkType {
  String toValue() {
    switch (this) {
      case MediaStreamPipelineSinkType.kinesisVideoStreamPool:
        return 'KinesisVideoStreamPool';
    }
  }
}

extension MediaStreamPipelineSinkTypeFromString on String {
  MediaStreamPipelineSinkType toMediaStreamPipelineSinkType() {
    switch (this) {
      case 'KinesisVideoStreamPool':
        return MediaStreamPipelineSinkType.kinesisVideoStreamPool;
    }
    throw Exception('$this is not known in enum MediaStreamPipelineSinkType');
  }
}

/// Structure that contains the settings for a media stream sink.
class MediaStreamSink {
  /// The media stream sink's media stream type.
  final MediaStreamType mediaStreamType;

  /// Specifies the number of streams that the sink can accept.
  final int reservedStreamCapacity;

  /// The ARN of the media stream sink.
  final String sinkArn;

  /// The media stream sink's type.
  final MediaStreamPipelineSinkType sinkType;

  MediaStreamSink({
    required this.mediaStreamType,
    required this.reservedStreamCapacity,
    required this.sinkArn,
    required this.sinkType,
  });

  factory MediaStreamSink.fromJson(Map<String, dynamic> json) {
    return MediaStreamSink(
      mediaStreamType: (json['MediaStreamType'] as String).toMediaStreamType(),
      reservedStreamCapacity: json['ReservedStreamCapacity'] as int,
      sinkArn: json['SinkArn'] as String,
      sinkType: (json['SinkType'] as String).toMediaStreamPipelineSinkType(),
    );
  }

  Map<String, dynamic> toJson() {
    final mediaStreamType = this.mediaStreamType;
    final reservedStreamCapacity = this.reservedStreamCapacity;
    final sinkArn = this.sinkArn;
    final sinkType = this.sinkType;
    return {
      'MediaStreamType': mediaStreamType.toValue(),
      'ReservedStreamCapacity': reservedStreamCapacity,
      'SinkArn': sinkArn,
      'SinkType': sinkType.toValue(),
    };
  }
}

/// Structure that contains the settings for media stream sources.
class MediaStreamSource {
  /// The ARN of the media stream source.
  final String sourceArn;

  /// The type of media stream source.
  final MediaPipelineSourceType sourceType;

  MediaStreamSource({
    required this.sourceArn,
    required this.sourceType,
  });

  factory MediaStreamSource.fromJson(Map<String, dynamic> json) {
    return MediaStreamSource(
      sourceArn: json['SourceArn'] as String,
      sourceType: (json['SourceType'] as String).toMediaPipelineSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final sourceArn = this.sourceArn;
    final sourceType = this.sourceType;
    return {
      'SourceArn': sourceArn,
      'SourceType': sourceType.toValue(),
    };
  }
}

enum MediaStreamType {
  mixedAudio,
  individualAudio,
}

extension MediaStreamTypeValueExtension on MediaStreamType {
  String toValue() {
    switch (this) {
      case MediaStreamType.mixedAudio:
        return 'MixedAudio';
      case MediaStreamType.individualAudio:
        return 'IndividualAudio';
    }
  }
}

extension MediaStreamTypeFromString on String {
  MediaStreamType toMediaStreamType() {
    switch (this) {
      case 'MixedAudio':
        return MediaStreamType.mixedAudio;
      case 'IndividualAudio':
        return MediaStreamType.individualAudio;
    }
    throw Exception('$this is not known in enum MediaStreamType');
  }
}

/// The configuration object for an event concatenation pipeline.
class MeetingEventsConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final ArtifactsConcatenationState state;

  MeetingEventsConcatenationConfiguration({
    required this.state,
  });

  factory MeetingEventsConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return MeetingEventsConcatenationConfiguration(
      state: (json['State'] as String).toArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
    };
  }
}

enum PartialResultsStability {
  high,
  medium,
  low,
}

extension PartialResultsStabilityValueExtension on PartialResultsStability {
  String toValue() {
    switch (this) {
      case PartialResultsStability.high:
        return 'high';
      case PartialResultsStability.medium:
        return 'medium';
      case PartialResultsStability.low:
        return 'low';
    }
  }
}

extension PartialResultsStabilityFromString on String {
  PartialResultsStability toPartialResultsStability() {
    switch (this) {
      case 'high':
        return PartialResultsStability.high;
      case 'medium':
        return PartialResultsStability.medium;
      case 'low':
        return PartialResultsStability.low;
    }
    throw Exception('$this is not known in enum PartialResultsStability');
  }
}

enum ParticipantRole {
  agent,
  customer,
}

extension ParticipantRoleValueExtension on ParticipantRole {
  String toValue() {
    switch (this) {
      case ParticipantRole.agent:
        return 'AGENT';
      case ParticipantRole.customer:
        return 'CUSTOMER';
    }
  }
}

extension ParticipantRoleFromString on String {
  ParticipantRole toParticipantRole() {
    switch (this) {
      case 'AGENT':
        return ParticipantRole.agent;
      case 'CUSTOMER':
        return ParticipantRole.customer;
    }
    throw Exception('$this is not known in enum ParticipantRole');
  }
}

/// Allows you to specify additional settings for your Call Analytics post-call
/// request, including output locations for your redacted transcript, which IAM
/// role to use, and which encryption key to use.
///
/// <code>DataAccessRoleArn</code> and <code>OutputLocation</code> are required
/// fields.
///
/// <code>PostCallAnalyticsSettings</code> provides the same insights as a Call
/// Analytics post-call transcription. For more information, refer to <a
/// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-post-call.html">Post-call
/// analytics with real-time transcriptions</a> in the <i>Amazon Transcribe
/// Developer Guide</i>.
class PostCallAnalyticsSettings {
  /// The ARN of the role used by Amazon Web Services Transcribe to upload your
  /// post call analysis. For more information, see <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/dg/tca-post-call.html">Post-call
  /// analytics with real-time transcriptions</a> in the <i>Amazon Transcribe
  /// Developer Guide</i>.
  final String dataAccessRoleArn;

  /// The URL of the Amazon S3 bucket that contains the post-call data.
  final String outputLocation;

  /// The content redaction output settings for a post-call analysis task.
  final ContentRedactionOutput? contentRedactionOutput;

  /// The ID of the KMS (Key Management Service) key used to encrypt the output.
  final String? outputEncryptionKMSKeyId;

  PostCallAnalyticsSettings({
    required this.dataAccessRoleArn,
    required this.outputLocation,
    this.contentRedactionOutput,
    this.outputEncryptionKMSKeyId,
  });

  factory PostCallAnalyticsSettings.fromJson(Map<String, dynamic> json) {
    return PostCallAnalyticsSettings(
      dataAccessRoleArn: json['DataAccessRoleArn'] as String,
      outputLocation: json['OutputLocation'] as String,
      contentRedactionOutput: (json['ContentRedactionOutput'] as String?)
          ?.toContentRedactionOutput(),
      outputEncryptionKMSKeyId: json['OutputEncryptionKMSKeyId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataAccessRoleArn = this.dataAccessRoleArn;
    final outputLocation = this.outputLocation;
    final contentRedactionOutput = this.contentRedactionOutput;
    final outputEncryptionKMSKeyId = this.outputEncryptionKMSKeyId;
    return {
      'DataAccessRoleArn': dataAccessRoleArn,
      'OutputLocation': outputLocation,
      if (contentRedactionOutput != null)
        'ContentRedactionOutput': contentRedactionOutput.toValue(),
      if (outputEncryptionKMSKeyId != null)
        'OutputEncryptionKMSKeyId': outputEncryptionKMSKeyId,
    };
  }
}

/// Defines the configuration for a presenter-only video tile.
class PresenterOnlyConfiguration {
  /// Defines the position of the presenter video tile. Default:
  /// <code>TopRight</code>.
  final PresenterPosition? presenterPosition;

  PresenterOnlyConfiguration({
    this.presenterPosition,
  });

  factory PresenterOnlyConfiguration.fromJson(Map<String, dynamic> json) {
    return PresenterOnlyConfiguration(
      presenterPosition:
          (json['PresenterPosition'] as String?)?.toPresenterPosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final presenterPosition = this.presenterPosition;
    return {
      if (presenterPosition != null)
        'PresenterPosition': presenterPosition.toValue(),
    };
  }
}

enum PresenterPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

extension PresenterPositionValueExtension on PresenterPosition {
  String toValue() {
    switch (this) {
      case PresenterPosition.topLeft:
        return 'TopLeft';
      case PresenterPosition.topRight:
        return 'TopRight';
      case PresenterPosition.bottomLeft:
        return 'BottomLeft';
      case PresenterPosition.bottomRight:
        return 'BottomRight';
    }
  }
}

extension PresenterPositionFromString on String {
  PresenterPosition toPresenterPosition() {
    switch (this) {
      case 'TopLeft':
        return PresenterPosition.topLeft;
      case 'TopRight':
        return PresenterPosition.topRight;
      case 'BottomLeft':
        return PresenterPosition.bottomLeft;
      case 'BottomRight':
        return PresenterPosition.bottomRight;
    }
    throw Exception('$this is not known in enum PresenterPosition');
  }
}

/// A structure that contains the configuration settings for real-time alerts.
class RealTimeAlertConfiguration {
  /// Turns off real-time alerts.
  final bool? disabled;

  /// The rules in the alert. Rules specify the words or phrases that you want to
  /// be notified about.
  final List<RealTimeAlertRule>? rules;

  RealTimeAlertConfiguration({
    this.disabled,
    this.rules,
  });

  factory RealTimeAlertConfiguration.fromJson(Map<String, dynamic> json) {
    return RealTimeAlertConfiguration(
      disabled: json['Disabled'] as bool?,
      rules: (json['Rules'] as List?)
          ?.whereNotNull()
          .map((e) => RealTimeAlertRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabled = this.disabled;
    final rules = this.rules;
    return {
      if (disabled != null) 'Disabled': disabled,
      if (rules != null) 'Rules': rules,
    };
  }
}

/// Specifies the words or phrases that trigger an alert.
class RealTimeAlertRule {
  /// The type of alert rule.
  final RealTimeAlertRuleType type;

  /// Specifies the issue detection settings for a real-time alert rule.
  final IssueDetectionConfiguration? issueDetectionConfiguration;

  /// Specifies the settings for matching the keywords in a real-time alert rule.
  final KeywordMatchConfiguration? keywordMatchConfiguration;

  /// Specifies the settings for predicting sentiment in a real-time alert rule.
  final SentimentConfiguration? sentimentConfiguration;

  RealTimeAlertRule({
    required this.type,
    this.issueDetectionConfiguration,
    this.keywordMatchConfiguration,
    this.sentimentConfiguration,
  });

  factory RealTimeAlertRule.fromJson(Map<String, dynamic> json) {
    return RealTimeAlertRule(
      type: (json['Type'] as String).toRealTimeAlertRuleType(),
      issueDetectionConfiguration: json['IssueDetectionConfiguration'] != null
          ? IssueDetectionConfiguration.fromJson(
              json['IssueDetectionConfiguration'] as Map<String, dynamic>)
          : null,
      keywordMatchConfiguration: json['KeywordMatchConfiguration'] != null
          ? KeywordMatchConfiguration.fromJson(
              json['KeywordMatchConfiguration'] as Map<String, dynamic>)
          : null,
      sentimentConfiguration: json['SentimentConfiguration'] != null
          ? SentimentConfiguration.fromJson(
              json['SentimentConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    final issueDetectionConfiguration = this.issueDetectionConfiguration;
    final keywordMatchConfiguration = this.keywordMatchConfiguration;
    final sentimentConfiguration = this.sentimentConfiguration;
    return {
      'Type': type.toValue(),
      if (issueDetectionConfiguration != null)
        'IssueDetectionConfiguration': issueDetectionConfiguration,
      if (keywordMatchConfiguration != null)
        'KeywordMatchConfiguration': keywordMatchConfiguration,
      if (sentimentConfiguration != null)
        'SentimentConfiguration': sentimentConfiguration,
    };
  }
}

enum RealTimeAlertRuleType {
  keywordMatch,
  sentiment,
  issueDetection,
}

extension RealTimeAlertRuleTypeValueExtension on RealTimeAlertRuleType {
  String toValue() {
    switch (this) {
      case RealTimeAlertRuleType.keywordMatch:
        return 'KeywordMatch';
      case RealTimeAlertRuleType.sentiment:
        return 'Sentiment';
      case RealTimeAlertRuleType.issueDetection:
        return 'IssueDetection';
    }
  }
}

extension RealTimeAlertRuleTypeFromString on String {
  RealTimeAlertRuleType toRealTimeAlertRuleType() {
    switch (this) {
      case 'KeywordMatch':
        return RealTimeAlertRuleType.keywordMatch;
      case 'Sentiment':
        return RealTimeAlertRuleType.sentiment;
      case 'IssueDetection':
        return RealTimeAlertRuleType.issueDetection;
    }
    throw Exception('$this is not known in enum RealTimeAlertRuleType');
  }
}

enum RecordingFileFormat {
  wav,
  opus,
}

extension RecordingFileFormatValueExtension on RecordingFileFormat {
  String toValue() {
    switch (this) {
      case RecordingFileFormat.wav:
        return 'Wav';
      case RecordingFileFormat.opus:
        return 'Opus';
    }
  }
}

extension RecordingFileFormatFromString on String {
  RecordingFileFormat toRecordingFileFormat() {
    switch (this) {
      case 'Wav':
        return RecordingFileFormat.wav;
      case 'Opus':
        return RecordingFileFormat.opus;
    }
    throw Exception('$this is not known in enum RecordingFileFormat');
  }
}

/// A structure that holds the settings for recording media.
class RecordingStreamConfiguration {
  /// The ARN of the recording stream.
  final String? streamArn;

  RecordingStreamConfiguration({
    this.streamArn,
  });

  factory RecordingStreamConfiguration.fromJson(Map<String, dynamic> json) {
    return RecordingStreamConfiguration(
      streamArn: json['StreamArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamArn = this.streamArn;
    return {
      if (streamArn != null) 'StreamArn': streamArn,
    };
  }
}

enum ResolutionOption {
  hd,
  fhd,
}

extension ResolutionOptionValueExtension on ResolutionOption {
  String toValue() {
    switch (this) {
      case ResolutionOption.hd:
        return 'HD';
      case ResolutionOption.fhd:
        return 'FHD';
    }
  }
}

extension ResolutionOptionFromString on String {
  ResolutionOption toResolutionOption() {
    switch (this) {
      case 'HD':
        return ResolutionOption.hd;
      case 'FHD':
        return ResolutionOption.fhd;
    }
    throw Exception('$this is not known in enum ResolutionOption');
  }
}

/// The configuration settings for the S3 bucket.
class S3BucketSinkConfiguration {
  /// The destination URL of the S3 bucket.
  final String destination;

  S3BucketSinkConfiguration({
    required this.destination,
  });

  factory S3BucketSinkConfiguration.fromJson(Map<String, dynamic> json) {
    return S3BucketSinkConfiguration(
      destination: json['Destination'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    return {
      'Destination': destination,
    };
  }
}

/// The structure that holds the settings for transmitting media to the Amazon
/// S3 bucket. These values are used as defaults if
/// <code>S3RecordingSinkRuntimeConfiguration</code> is not specified.
class S3RecordingSinkConfiguration {
  /// The default URI of the Amazon S3 bucket used as the recording sink.
  final String? destination;

  /// The default file format for the media files sent to the Amazon S3 bucket.
  final RecordingFileFormat? recordingFileFormat;

  S3RecordingSinkConfiguration({
    this.destination,
    this.recordingFileFormat,
  });

  factory S3RecordingSinkConfiguration.fromJson(Map<String, dynamic> json) {
    return S3RecordingSinkConfiguration(
      destination: json['Destination'] as String?,
      recordingFileFormat:
          (json['RecordingFileFormat'] as String?)?.toRecordingFileFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final recordingFileFormat = this.recordingFileFormat;
    return {
      if (destination != null) 'Destination': destination,
      if (recordingFileFormat != null)
        'RecordingFileFormat': recordingFileFormat.toValue(),
    };
  }
}

/// A structure that holds the settings for transmitting media files to the
/// Amazon S3 bucket. If specified, the settings in this structure override any
/// settings in <code>S3RecordingSinkConfiguration</code>.
class S3RecordingSinkRuntimeConfiguration {
  /// The URI of the S3 bucket used as the sink.
  final String destination;

  /// The file format for the media files sent to the Amazon S3 bucket.
  final RecordingFileFormat recordingFileFormat;

  S3RecordingSinkRuntimeConfiguration({
    required this.destination,
    required this.recordingFileFormat,
  });

  factory S3RecordingSinkRuntimeConfiguration.fromJson(
      Map<String, dynamic> json) {
    return S3RecordingSinkRuntimeConfiguration(
      destination: json['Destination'] as String,
      recordingFileFormat:
          (json['RecordingFileFormat'] as String).toRecordingFileFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final recordingFileFormat = this.recordingFileFormat;
    return {
      'Destination': destination,
      'RecordingFileFormat': recordingFileFormat.toValue(),
    };
  }
}

/// The video streams for a specified media pipeline. The total number of video
/// streams can't exceed 25.
class SelectedVideoStreams {
  /// The attendee IDs of the streams selected for a media pipeline.
  final List<String>? attendeeIds;

  /// The external user IDs of the streams selected for a media pipeline.
  final List<String>? externalUserIds;

  SelectedVideoStreams({
    this.attendeeIds,
    this.externalUserIds,
  });

  factory SelectedVideoStreams.fromJson(Map<String, dynamic> json) {
    return SelectedVideoStreams(
      attendeeIds: (json['AttendeeIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      externalUserIds: (json['ExternalUserIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attendeeIds = this.attendeeIds;
    final externalUserIds = this.externalUserIds;
    return {
      if (attendeeIds != null) 'AttendeeIds': attendeeIds,
      if (externalUserIds != null) 'ExternalUserIds': externalUserIds,
    };
  }
}

/// A structure that contains the configuration settings for a sentiment
/// analysis task.
class SentimentConfiguration {
  /// The name of the rule in the sentiment configuration.
  final String ruleName;

  /// The type of sentiment, <code>POSITIVE</code>, <code>NEGATIVE</code>, or
  /// <code>NEUTRAL</code>.
  final SentimentType sentimentType;

  /// Specifies the analysis interval.
  final int timePeriod;

  SentimentConfiguration({
    required this.ruleName,
    required this.sentimentType,
    required this.timePeriod,
  });

  factory SentimentConfiguration.fromJson(Map<String, dynamic> json) {
    return SentimentConfiguration(
      ruleName: json['RuleName'] as String,
      sentimentType: (json['SentimentType'] as String).toSentimentType(),
      timePeriod: json['TimePeriod'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final ruleName = this.ruleName;
    final sentimentType = this.sentimentType;
    final timePeriod = this.timePeriod;
    return {
      'RuleName': ruleName,
      'SentimentType': sentimentType.toValue(),
      'TimePeriod': timePeriod,
    };
  }
}

enum SentimentType {
  negative,
}

extension SentimentTypeValueExtension on SentimentType {
  String toValue() {
    switch (this) {
      case SentimentType.negative:
        return 'NEGATIVE';
    }
  }
}

extension SentimentTypeFromString on String {
  SentimentType toSentimentType() {
    switch (this) {
      case 'NEGATIVE':
        return SentimentType.negative;
    }
    throw Exception('$this is not known in enum SentimentType');
  }
}

/// The configuration settings for the SNS topic sink.
class SnsTopicSinkConfiguration {
  /// The ARN of the SNS sink.
  final String? insightsTarget;

  SnsTopicSinkConfiguration({
    this.insightsTarget,
  });

  factory SnsTopicSinkConfiguration.fromJson(Map<String, dynamic> json) {
    return SnsTopicSinkConfiguration(
      insightsTarget: json['InsightsTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightsTarget = this.insightsTarget;
    return {
      if (insightsTarget != null) 'InsightsTarget': insightsTarget,
    };
  }
}

/// Source configuration for a specified media pipeline.
class SourceConfiguration {
  /// The selected video streams for a specified media pipeline. The number of
  /// video streams can't exceed 25.
  final SelectedVideoStreams? selectedVideoStreams;

  SourceConfiguration({
    this.selectedVideoStreams,
  });

  factory SourceConfiguration.fromJson(Map<String, dynamic> json) {
    return SourceConfiguration(
      selectedVideoStreams: json['SelectedVideoStreams'] != null
          ? SelectedVideoStreams.fromJson(
              json['SelectedVideoStreams'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final selectedVideoStreams = this.selectedVideoStreams;
    return {
      if (selectedVideoStreams != null)
        'SelectedVideoStreams': selectedVideoStreams,
    };
  }
}

/// A representation of an asynchronous request to perform speaker search
/// analysis on a media insights pipeline.
class SpeakerSearchTask {
  /// The time at which a speaker search task was created.
  final DateTime? createdTimestamp;

  /// The speaker search task ID.
  final String? speakerSearchTaskId;

  /// The status of the speaker search task.
  final MediaPipelineTaskStatus? speakerSearchTaskStatus;

  /// The time at which a speaker search task was updated.
  final DateTime? updatedTimestamp;

  SpeakerSearchTask({
    this.createdTimestamp,
    this.speakerSearchTaskId,
    this.speakerSearchTaskStatus,
    this.updatedTimestamp,
  });

  factory SpeakerSearchTask.fromJson(Map<String, dynamic> json) {
    return SpeakerSearchTask(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      speakerSearchTaskId: json['SpeakerSearchTaskId'] as String?,
      speakerSearchTaskStatus: (json['SpeakerSearchTaskStatus'] as String?)
          ?.toMediaPipelineTaskStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final speakerSearchTaskId = this.speakerSearchTaskId;
    final speakerSearchTaskStatus = this.speakerSearchTaskStatus;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (speakerSearchTaskId != null)
        'SpeakerSearchTaskId': speakerSearchTaskId,
      if (speakerSearchTaskStatus != null)
        'SpeakerSearchTaskStatus': speakerSearchTaskStatus.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// The configuration settings for the SQS sink.
class SqsQueueSinkConfiguration {
  /// The ARN of the SQS sink.
  final String? insightsTarget;

  SqsQueueSinkConfiguration({
    this.insightsTarget,
  });

  factory SqsQueueSinkConfiguration.fromJson(Map<String, dynamic> json) {
    return SqsQueueSinkConfiguration(
      insightsTarget: json['InsightsTarget'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final insightsTarget = this.insightsTarget;
    return {
      if (insightsTarget != null) 'InsightsTarget': insightsTarget,
    };
  }
}

class StartSpeakerSearchTaskResponse {
  /// The details of the speaker search task.
  final SpeakerSearchTask? speakerSearchTask;

  StartSpeakerSearchTaskResponse({
    this.speakerSearchTask,
  });

  factory StartSpeakerSearchTaskResponse.fromJson(Map<String, dynamic> json) {
    return StartSpeakerSearchTaskResponse(
      speakerSearchTask: json['SpeakerSearchTask'] != null
          ? SpeakerSearchTask.fromJson(
              json['SpeakerSearchTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final speakerSearchTask = this.speakerSearchTask;
    return {
      if (speakerSearchTask != null) 'SpeakerSearchTask': speakerSearchTask,
    };
  }
}

class StartVoiceToneAnalysisTaskResponse {
  /// The details of the voice tone analysis task.
  final VoiceToneAnalysisTask? voiceToneAnalysisTask;

  StartVoiceToneAnalysisTaskResponse({
    this.voiceToneAnalysisTask,
  });

  factory StartVoiceToneAnalysisTaskResponse.fromJson(
      Map<String, dynamic> json) {
    return StartVoiceToneAnalysisTaskResponse(
      voiceToneAnalysisTask: json['VoiceToneAnalysisTask'] != null
          ? VoiceToneAnalysisTask.fromJson(
              json['VoiceToneAnalysisTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceToneAnalysisTask = this.voiceToneAnalysisTask;
    return {
      if (voiceToneAnalysisTask != null)
        'VoiceToneAnalysisTask': voiceToneAnalysisTask,
    };
  }
}

/// Defines a streaming channel.
class StreamChannelDefinition {
  /// The number of channels in a streaming channel.
  final int numberOfChannels;

  /// The definitions of the channels in a streaming channel.
  final List<ChannelDefinition>? channelDefinitions;

  StreamChannelDefinition({
    required this.numberOfChannels,
    this.channelDefinitions,
  });

  factory StreamChannelDefinition.fromJson(Map<String, dynamic> json) {
    return StreamChannelDefinition(
      numberOfChannels: json['NumberOfChannels'] as int,
      channelDefinitions: (json['ChannelDefinitions'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final numberOfChannels = this.numberOfChannels;
    final channelDefinitions = this.channelDefinitions;
    return {
      'NumberOfChannels': numberOfChannels,
      if (channelDefinitions != null) 'ChannelDefinitions': channelDefinitions,
    };
  }
}

/// The configuration settings for a stream.
class StreamConfiguration {
  /// The ARN of the stream.
  final String streamArn;

  /// The streaming channel definition in the stream configuration.
  final StreamChannelDefinition streamChannelDefinition;

  /// The unique identifier of the fragment to begin processing.
  final String? fragmentNumber;

  StreamConfiguration({
    required this.streamArn,
    required this.streamChannelDefinition,
    this.fragmentNumber,
  });

  factory StreamConfiguration.fromJson(Map<String, dynamic> json) {
    return StreamConfiguration(
      streamArn: json['StreamArn'] as String,
      streamChannelDefinition: StreamChannelDefinition.fromJson(
          json['StreamChannelDefinition'] as Map<String, dynamic>),
      fragmentNumber: json['FragmentNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final streamArn = this.streamArn;
    final streamChannelDefinition = this.streamChannelDefinition;
    final fragmentNumber = this.fragmentNumber;
    return {
      'StreamArn': streamArn,
      'StreamChannelDefinition': streamChannelDefinition,
      if (fragmentNumber != null) 'FragmentNumber': fragmentNumber,
    };
  }
}

/// A key/value pair that grants users access to meeting resources.
class Tag {
  /// The key half of a tag.
  final String key;

  /// The value half of a tag.
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

enum TileOrder {
  joinSequence,
  speakerSequence,
}

extension TileOrderValueExtension on TileOrder {
  String toValue() {
    switch (this) {
      case TileOrder.joinSequence:
        return 'JoinSequence';
      case TileOrder.speakerSequence:
        return 'SpeakerSequence';
    }
  }
}

extension TileOrderFromString on String {
  TileOrder toTileOrder() {
    switch (this) {
      case 'JoinSequence':
        return TileOrder.joinSequence;
      case 'SpeakerSequence':
        return TileOrder.speakerSequence;
    }
    throw Exception('$this is not known in enum TileOrder');
  }
}

/// The range of timestamps to return.
class TimestampRange {
  /// The ending timestamp for the specified range.
  final DateTime endTimestamp;

  /// The starting timestamp for the specified range.
  final DateTime startTimestamp;

  TimestampRange({
    required this.endTimestamp,
    required this.startTimestamp,
  });

  factory TimestampRange.fromJson(Map<String, dynamic> json) {
    return TimestampRange(
      endTimestamp:
          nonNullableTimeStampFromJson(json['EndTimestamp'] as Object),
      startTimestamp:
          nonNullableTimeStampFromJson(json['StartTimestamp'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endTimestamp = this.endTimestamp;
    final startTimestamp = this.startTimestamp;
    return {
      'EndTimestamp': unixTimestampToJson(endTimestamp),
      'StartTimestamp': unixTimestampToJson(startTimestamp),
    };
  }
}

/// The configuration object for concatenating transcription messages.
class TranscriptionMessagesConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final ArtifactsConcatenationState state;

  TranscriptionMessagesConcatenationConfiguration({
    required this.state,
  });

  factory TranscriptionMessagesConcatenationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return TranscriptionMessagesConcatenationConfiguration(
      state: (json['State'] as String).toArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
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

class UpdateMediaInsightsPipelineConfigurationResponse {
  /// The updated configuration settings.
  final MediaInsightsPipelineConfiguration? mediaInsightsPipelineConfiguration;

  UpdateMediaInsightsPipelineConfigurationResponse({
    this.mediaInsightsPipelineConfiguration,
  });

  factory UpdateMediaInsightsPipelineConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateMediaInsightsPipelineConfigurationResponse(
      mediaInsightsPipelineConfiguration:
          json['MediaInsightsPipelineConfiguration'] != null
              ? MediaInsightsPipelineConfiguration.fromJson(
                  json['MediaInsightsPipelineConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final mediaInsightsPipelineConfiguration =
        this.mediaInsightsPipelineConfiguration;
    return {
      if (mediaInsightsPipelineConfiguration != null)
        'MediaInsightsPipelineConfiguration':
            mediaInsightsPipelineConfiguration,
    };
  }
}

class UpdateMediaPipelineKinesisVideoStreamPoolResponse {
  /// The video stream pool configuration object.
  final KinesisVideoStreamPoolConfiguration?
      kinesisVideoStreamPoolConfiguration;

  UpdateMediaPipelineKinesisVideoStreamPoolResponse({
    this.kinesisVideoStreamPoolConfiguration,
  });

  factory UpdateMediaPipelineKinesisVideoStreamPoolResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateMediaPipelineKinesisVideoStreamPoolResponse(
      kinesisVideoStreamPoolConfiguration:
          json['KinesisVideoStreamPoolConfiguration'] != null
              ? KinesisVideoStreamPoolConfiguration.fromJson(
                  json['KinesisVideoStreamPoolConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final kinesisVideoStreamPoolConfiguration =
        this.kinesisVideoStreamPoolConfiguration;
    return {
      if (kinesisVideoStreamPoolConfiguration != null)
        'KinesisVideoStreamPoolConfiguration':
            kinesisVideoStreamPoolConfiguration,
    };
  }
}

/// Defines the configuration settings for a vertical layout.
class VerticalLayoutConfiguration {
  /// Sets the aspect ratio of the video tiles, such as 16:9.
  final String? tileAspectRatio;

  /// The maximum number of tiles to display.
  final int? tileCount;

  /// Sets the automatic ordering of the video tiles.
  final TileOrder? tileOrder;

  /// Sets the position of vertical tiles.
  final VerticalTilePosition? tilePosition;

  VerticalLayoutConfiguration({
    this.tileAspectRatio,
    this.tileCount,
    this.tileOrder,
    this.tilePosition,
  });

  factory VerticalLayoutConfiguration.fromJson(Map<String, dynamic> json) {
    return VerticalLayoutConfiguration(
      tileAspectRatio: json['TileAspectRatio'] as String?,
      tileCount: json['TileCount'] as int?,
      tileOrder: (json['TileOrder'] as String?)?.toTileOrder(),
      tilePosition: (json['TilePosition'] as String?)?.toVerticalTilePosition(),
    );
  }

  Map<String, dynamic> toJson() {
    final tileAspectRatio = this.tileAspectRatio;
    final tileCount = this.tileCount;
    final tileOrder = this.tileOrder;
    final tilePosition = this.tilePosition;
    return {
      if (tileAspectRatio != null) 'TileAspectRatio': tileAspectRatio,
      if (tileCount != null) 'TileCount': tileCount,
      if (tileOrder != null) 'TileOrder': tileOrder.toValue(),
      if (tilePosition != null) 'TilePosition': tilePosition.toValue(),
    };
  }
}

enum VerticalTilePosition {
  left,
  right,
}

extension VerticalTilePositionValueExtension on VerticalTilePosition {
  String toValue() {
    switch (this) {
      case VerticalTilePosition.left:
        return 'Left';
      case VerticalTilePosition.right:
        return 'Right';
    }
  }
}

extension VerticalTilePositionFromString on String {
  VerticalTilePosition toVerticalTilePosition() {
    switch (this) {
      case 'Left':
        return VerticalTilePosition.left;
      case 'Right':
        return VerticalTilePosition.right;
    }
    throw Exception('$this is not known in enum VerticalTilePosition');
  }
}

/// The video artifact configuration object.
class VideoArtifactsConfiguration {
  /// Indicates whether the video artifact is enabled or disabled.
  final ArtifactsState state;

  /// The MUX type of the video artifact configuration object.
  final VideoMuxType? muxType;

  VideoArtifactsConfiguration({
    required this.state,
    this.muxType,
  });

  factory VideoArtifactsConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoArtifactsConfiguration(
      state: (json['State'] as String).toArtifactsState(),
      muxType: (json['MuxType'] as String?)?.toVideoMuxType(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    final muxType = this.muxType;
    return {
      'State': state.toValue(),
      if (muxType != null) 'MuxType': muxType.toValue(),
    };
  }
}

/// Defines the settings for a video tile.
class VideoAttribute {
  /// Defines the border color of all video tiles.
  final BorderColor? borderColor;

  /// Defines the border thickness for all video tiles.
  final int? borderThickness;

  /// Sets the corner radius of all video tiles.
  final int? cornerRadius;

  /// Defines the highlight color for the active video tile.
  final HighlightColor? highlightColor;

  VideoAttribute({
    this.borderColor,
    this.borderThickness,
    this.cornerRadius,
    this.highlightColor,
  });

  factory VideoAttribute.fromJson(Map<String, dynamic> json) {
    return VideoAttribute(
      borderColor: (json['BorderColor'] as String?)?.toBorderColor(),
      borderThickness: json['BorderThickness'] as int?,
      cornerRadius: json['CornerRadius'] as int?,
      highlightColor: (json['HighlightColor'] as String?)?.toHighlightColor(),
    );
  }

  Map<String, dynamic> toJson() {
    final borderColor = this.borderColor;
    final borderThickness = this.borderThickness;
    final cornerRadius = this.cornerRadius;
    final highlightColor = this.highlightColor;
    return {
      if (borderColor != null) 'BorderColor': borderColor.toValue(),
      if (borderThickness != null) 'BorderThickness': borderThickness,
      if (cornerRadius != null) 'CornerRadius': cornerRadius,
      if (highlightColor != null) 'HighlightColor': highlightColor.toValue(),
    };
  }
}

/// The configuration object of a video concatenation pipeline.
class VideoConcatenationConfiguration {
  /// Enables or disables the configuration object.
  final ArtifactsConcatenationState state;

  VideoConcatenationConfiguration({
    required this.state,
  });

  factory VideoConcatenationConfiguration.fromJson(Map<String, dynamic> json) {
    return VideoConcatenationConfiguration(
      state: (json['State'] as String).toArtifactsConcatenationState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'State': state.toValue(),
    };
  }
}

enum VideoMuxType {
  videoOnly,
}

extension VideoMuxTypeValueExtension on VideoMuxType {
  String toValue() {
    switch (this) {
      case VideoMuxType.videoOnly:
        return 'VideoOnly';
    }
  }
}

extension VideoMuxTypeFromString on String {
  VideoMuxType toVideoMuxType() {
    switch (this) {
      case 'VideoOnly':
        return VideoMuxType.videoOnly;
    }
    throw Exception('$this is not known in enum VideoMuxType');
  }
}

enum VocabularyFilterMethod {
  remove,
  mask,
  tag,
}

extension VocabularyFilterMethodValueExtension on VocabularyFilterMethod {
  String toValue() {
    switch (this) {
      case VocabularyFilterMethod.remove:
        return 'remove';
      case VocabularyFilterMethod.mask:
        return 'mask';
      case VocabularyFilterMethod.tag:
        return 'tag';
    }
  }
}

extension VocabularyFilterMethodFromString on String {
  VocabularyFilterMethod toVocabularyFilterMethod() {
    switch (this) {
      case 'remove':
        return VocabularyFilterMethod.remove;
      case 'mask':
        return VocabularyFilterMethod.mask;
      case 'tag':
        return VocabularyFilterMethod.tag;
    }
    throw Exception('$this is not known in enum VocabularyFilterMethod');
  }
}

enum VoiceAnalyticsConfigurationStatus {
  enabled,
  disabled,
}

extension VoiceAnalyticsConfigurationStatusValueExtension
    on VoiceAnalyticsConfigurationStatus {
  String toValue() {
    switch (this) {
      case VoiceAnalyticsConfigurationStatus.enabled:
        return 'Enabled';
      case VoiceAnalyticsConfigurationStatus.disabled:
        return 'Disabled';
    }
  }
}

extension VoiceAnalyticsConfigurationStatusFromString on String {
  VoiceAnalyticsConfigurationStatus toVoiceAnalyticsConfigurationStatus() {
    switch (this) {
      case 'Enabled':
        return VoiceAnalyticsConfigurationStatus.enabled;
      case 'Disabled':
        return VoiceAnalyticsConfigurationStatus.disabled;
    }
    throw Exception(
        '$this is not known in enum VoiceAnalyticsConfigurationStatus');
  }
}

enum VoiceAnalyticsLanguageCode {
  enUs,
}

extension VoiceAnalyticsLanguageCodeValueExtension
    on VoiceAnalyticsLanguageCode {
  String toValue() {
    switch (this) {
      case VoiceAnalyticsLanguageCode.enUs:
        return 'en-US';
    }
  }
}

extension VoiceAnalyticsLanguageCodeFromString on String {
  VoiceAnalyticsLanguageCode toVoiceAnalyticsLanguageCode() {
    switch (this) {
      case 'en-US':
        return VoiceAnalyticsLanguageCode.enUs;
    }
    throw Exception('$this is not known in enum VoiceAnalyticsLanguageCode');
  }
}

/// The configuration settings for a voice analytics processor.
class VoiceAnalyticsProcessorConfiguration {
  /// The status of the speaker search task.
  final VoiceAnalyticsConfigurationStatus? speakerSearchStatus;

  /// The status of the voice tone analysis task.
  final VoiceAnalyticsConfigurationStatus? voiceToneAnalysisStatus;

  VoiceAnalyticsProcessorConfiguration({
    this.speakerSearchStatus,
    this.voiceToneAnalysisStatus,
  });

  factory VoiceAnalyticsProcessorConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VoiceAnalyticsProcessorConfiguration(
      speakerSearchStatus: (json['SpeakerSearchStatus'] as String?)
          ?.toVoiceAnalyticsConfigurationStatus(),
      voiceToneAnalysisStatus: (json['VoiceToneAnalysisStatus'] as String?)
          ?.toVoiceAnalyticsConfigurationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final speakerSearchStatus = this.speakerSearchStatus;
    final voiceToneAnalysisStatus = this.voiceToneAnalysisStatus;
    return {
      if (speakerSearchStatus != null)
        'SpeakerSearchStatus': speakerSearchStatus.toValue(),
      if (voiceToneAnalysisStatus != null)
        'VoiceToneAnalysisStatus': voiceToneAnalysisStatus.toValue(),
    };
  }
}

/// A static structure that contains the configuration data for a
/// <code>VoiceEnhancementSinkConfiguration</code> element.
class VoiceEnhancementSinkConfiguration {
  /// Disables the <code>VoiceEnhancementSinkConfiguration</code> element.
  final bool? disabled;

  VoiceEnhancementSinkConfiguration({
    this.disabled,
  });

  factory VoiceEnhancementSinkConfiguration.fromJson(
      Map<String, dynamic> json) {
    return VoiceEnhancementSinkConfiguration(
      disabled: json['Disabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final disabled = this.disabled;
    return {
      if (disabled != null) 'Disabled': disabled,
    };
  }
}

/// A representation of an asynchronous request to perform voice tone analysis
/// on a media insights pipeline.
class VoiceToneAnalysisTask {
  /// The time at which a voice tone analysis task was created.
  final DateTime? createdTimestamp;

  /// The time at which a voice tone analysis task was updated.
  final DateTime? updatedTimestamp;

  /// The ID of the voice tone analysis task.
  final String? voiceToneAnalysisTaskId;

  /// The status of a voice tone analysis task.
  final MediaPipelineTaskStatus? voiceToneAnalysisTaskStatus;

  VoiceToneAnalysisTask({
    this.createdTimestamp,
    this.updatedTimestamp,
    this.voiceToneAnalysisTaskId,
    this.voiceToneAnalysisTaskStatus,
  });

  factory VoiceToneAnalysisTask.fromJson(Map<String, dynamic> json) {
    return VoiceToneAnalysisTask(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceToneAnalysisTaskId: json['VoiceToneAnalysisTaskId'] as String?,
      voiceToneAnalysisTaskStatus:
          (json['VoiceToneAnalysisTaskStatus'] as String?)
              ?.toMediaPipelineTaskStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceToneAnalysisTaskId = this.voiceToneAnalysisTaskId;
    final voiceToneAnalysisTaskStatus = this.voiceToneAnalysisTaskStatus;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceToneAnalysisTaskId != null)
        'VoiceToneAnalysisTaskId': voiceToneAnalysisTaskId,
      if (voiceToneAnalysisTaskStatus != null)
        'VoiceToneAnalysisTaskStatus': voiceToneAnalysisTaskStatus.toValue(),
    };
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String? type, String? message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String? type, String? message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String? type, String? message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottledClientException extends _s.GenericAwsException {
  ThrottledClientException({String? type, String? message})
      : super(type: type, code: 'ThrottledClientException', message: message);
}

class UnauthorizedClientException extends _s.GenericAwsException {
  UnauthorizedClientException({String? type, String? message})
      : super(
            type: type, code: 'UnauthorizedClientException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestException': (type, message) =>
      BadRequestException(type: type, message: message),
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'ForbiddenException': (type, message) =>
      ForbiddenException(type: type, message: message),
  'NotFoundException': (type, message) =>
      NotFoundException(type: type, message: message),
  'ResourceLimitExceededException': (type, message) =>
      ResourceLimitExceededException(type: type, message: message),
  'ServiceFailureException': (type, message) =>
      ServiceFailureException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottledClientException': (type, message) =>
      ThrottledClientException(type: type, message: message),
  'UnauthorizedClientException': (type, message) =>
      UnauthorizedClientException(type: type, message: message),
};
