// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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
/// developers to create Amazon Chime SDK media pipelines and capture audio,
/// video, events, and data messages from Amazon Chime SDK meetings. For more
/// information about media pipleines, see <a
/// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Media_Pipelines.html">Amzon
/// Chime SDK media pipelines</a>.
class ChimeSdkMediaPipelines {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkMediaPipelines({
    required String region,
    _s.AwsClientCredentials? credentials,
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
          endpointUrl: endpointUrl,
        );

  /// Creates a media capture pipeline.
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
  /// The configuration for a specified media capture pipeline.
  /// <code>SourceType</code> must be <code>ChimeSdkMeeting</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// The token assigned to the client making the pipeline request.
  ///
  /// Parameter [tags] :
  /// The list of tags.
  Future<CreateMediaCapturePipelineResponse> createMediaCapturePipeline({
    required String sinkArn,
    required MediaPipelineSinkType sinkType,
    required String sourceArn,
    required MediaPipelineSourceType sourceType,
    ChimeSdkMeetingConfiguration? chimeSdkMeetingConfiguration,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(sinkArn, 'sinkArn');
    ArgumentError.checkNotNull(sinkType, 'sinkType');
    ArgumentError.checkNotNull(sourceArn, 'sourceArn');
    ArgumentError.checkNotNull(sourceType, 'sourceType');
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

  /// Deletes the media capture pipeline.
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
  /// The ID of the media capture pipeline being deleted.
  Future<void> deleteMediaCapturePipeline({
    required String mediaPipelineId,
  }) async {
    ArgumentError.checkNotNull(mediaPipelineId, 'mediaPipelineId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sdk-media-capture-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets an existing media capture pipeline.
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
    ArgumentError.checkNotNull(mediaPipelineId, 'mediaPipelineId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sdk-media-capture-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaCapturePipelineResponse.fromJson(response);
  }

  /// Returns a list of media capture pipelines.
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

  /// Lists the tags applied to an Amazon Chime SDK media capture pipeline.
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
  /// The resource ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
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

  /// Applies the specified tags to the specified Amazon Chime SDK media capture
  /// pipeline.
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
  /// The resource ARN.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Removes the specified tags from the specified Amazon Chime SDK media
  /// capture pipeline.
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
  /// The resource ARN.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
}

/// The configuration for the artifacts.
class ArtifactsConfiguration {
  /// The configuration for the audio artifacts.
  final AudioArtifactsConfiguration audio;

  /// The configuration for the content artifacts.
  final ContentArtifactsConfiguration content;

  /// The configuration for the video artifacts.
  final VideoArtifactsConfiguration video;

  ArtifactsConfiguration({
    required this.audio,
    required this.content,
    required this.video,
  });

  factory ArtifactsConfiguration.fromJson(Map<String, dynamic> json) {
    return ArtifactsConfiguration(
      audio: AudioArtifactsConfiguration.fromJson(
          json['Audio'] as Map<String, dynamic>),
      content: ContentArtifactsConfiguration.fromJson(
          json['Content'] as Map<String, dynamic>),
      video: VideoArtifactsConfiguration.fromJson(
          json['Video'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final audio = this.audio;
    final content = this.content;
    final video = this.video;
    return {
      'Audio': audio,
      'Content': content,
      'Video': video,
    };
  }
}

enum ArtifactsState {
  enabled,
  disabled,
}

extension on ArtifactsState {
  String toValue() {
    switch (this) {
      case ArtifactsState.enabled:
        return 'Enabled';
      case ArtifactsState.disabled:
        return 'Disabled';
    }
  }
}

extension on String {
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

enum AudioMuxType {
  audioOnly,
  audioWithActiveSpeakerVideo,
}

extension on AudioMuxType {
  String toValue() {
    switch (this) {
      case AudioMuxType.audioOnly:
        return 'AudioOnly';
      case AudioMuxType.audioWithActiveSpeakerVideo:
        return 'AudioWithActiveSpeakerVideo';
    }
  }
}

extension on String {
  AudioMuxType toAudioMuxType() {
    switch (this) {
      case 'AudioOnly':
        return AudioMuxType.audioOnly;
      case 'AudioWithActiveSpeakerVideo':
        return AudioMuxType.audioWithActiveSpeakerVideo;
    }
    throw Exception('$this is not known in enum AudioMuxType');
  }
}

/// The configuration object of the Amazon Chime SDK meeting for a specified
/// media capture pipeline. <code>SourceType</code> must be
/// <code>ChimeSdkMeeting</code>.
class ChimeSdkMeetingConfiguration {
  /// The configuration for the artifacts in an Amazon Chime SDK meeting.
  final ArtifactsConfiguration? artifactsConfiguration;

  /// The source configuration for a specified media capture pipline.
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

enum ContentMuxType {
  contentOnly,
}

extension on ContentMuxType {
  String toValue() {
    switch (this) {
      case ContentMuxType.contentOnly:
        return 'ContentOnly';
    }
  }
}

extension on String {
  ContentMuxType toContentMuxType() {
    switch (this) {
      case 'ContentOnly':
        return ContentMuxType.contentOnly;
    }
    throw Exception('$this is not known in enum ContentMuxType');
  }
}

class CreateMediaCapturePipelineResponse {
  /// A media capture pipeline object, the ID, source type, source ARN, sink type,
  /// and sink ARN of a media capture pipeline object.
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

class GetMediaCapturePipelineResponse {
  /// The media capture pipeline object.
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

class ListMediaCapturePipelinesResponse {
  /// The media capture pipeline objects in the list.
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

class ListTagsForResourceResponse {
  /// The tag key-value pairs.
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

/// A media capture pipeline object consisting of an ID, source type, source
/// ARN, a sink type, a sink ARN, and a configuration object.
class MediaCapturePipeline {
  /// The configuration for a specified media capture pipeline.
  /// <code>SourceType</code> must be <code>ChimeSdkMeeting</code>.
  final ChimeSdkMeetingConfiguration? chimeSdkMeetingConfiguration;

  /// The time at which the capture pipeline was created, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The ARN of a media capture pipeline.
  final String? mediaPipelineArn;

  /// The ID of a media capture pipeline.
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

  /// The status of the media capture pipeline.
  final MediaPipelineStatus? status;

  /// The time at which the capture pipeline was updated, in ISO 8601 format.
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

/// A summary of a media capture pipeline.
class MediaCapturePipelineSummary {
  /// The ARN of a media capture pipeline.
  final String? mediaPipelineArn;

  /// The ID of a media capture pipeline.
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

enum MediaPipelineSinkType {
  s3Bucket,
}

extension on MediaPipelineSinkType {
  String toValue() {
    switch (this) {
      case MediaPipelineSinkType.s3Bucket:
        return 'S3Bucket';
    }
  }
}

extension on String {
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

extension on MediaPipelineSourceType {
  String toValue() {
    switch (this) {
      case MediaPipelineSourceType.chimeSdkMeeting:
        return 'ChimeSdkMeeting';
    }
  }
}

extension on String {
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
}

extension on MediaPipelineStatus {
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
    }
  }
}

extension on String {
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
    }
    throw Exception('$this is not known in enum MediaPipelineStatus');
  }
}

/// The video streams to capture for a specified media capture pipeline. The
/// total number of video streams can't exceed 25.
class SelectedVideoStreams {
  /// The attendee IDs of the streams selected for a media capture pipeline.
  final List<String>? attendeeIds;

  /// The external user IDs of the streams selected for a media capture pipeline.
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

/// Source configuration for a specified media capture pipeline.
class SourceConfiguration {
  /// The selected video streams to capture for a specified media capture
  /// pipeline. The number of video streams can't exceed 25.
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

/// Describes a tag applied to a resource.
class Tag {
  /// The key of the tag.
  final String key;

  /// The value of the tag.
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

enum VideoMuxType {
  videoOnly,
}

extension on VideoMuxType {
  String toValue() {
    switch (this) {
      case VideoMuxType.videoOnly:
        return 'VideoOnly';
    }
  }
}

extension on String {
  VideoMuxType toVideoMuxType() {
    switch (this) {
      case 'VideoOnly':
        return VideoMuxType.videoOnly;
    }
    throw Exception('$this is not known in enum VideoMuxType');
  }
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String? type, String? message})
      : super(type: type, code: 'BadRequestException', message: message);
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
