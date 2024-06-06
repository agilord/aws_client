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

/// <b>Introduction</b>
///
/// The Amazon Interactive Video Service (IVS) real-time API is REST compatible,
/// using a standard HTTP API and an AWS EventBridge event stream for responses.
/// JSON is used for both requests and responses, including errors.
///
/// Terminology:
///
/// <ul>
/// <li>
/// A <i>stage</i> is a virtual space where participants can exchange video in
/// real time.
/// </li>
/// <li>
/// A <i>participant token</i> is a token that authenticates a participant when
/// they join a stage.
/// </li>
/// <li>
/// A <i>participant object</i> represents participants (people) in the stage
/// and contains information about them. When a token is created, it includes a
/// participant ID; when a participant uses that token to join a stage, the
/// participant is associated with that participant ID. There is a 1:1 mapping
/// between participant tokens and participants.
/// </li>
/// <li>
/// Server-side composition: The <i>composition</i> process composites
/// participants of a stage into a single video and forwards it to a set of
/// outputs (e.g., IVS channels). Composition endpoints support this process.
/// </li>
/// <li>
/// Server-side composition: A <i>composition</i> controls the look of the
/// outputs, including how participants are positioned in the video.
/// </li>
/// </ul>
/// <b>Resources</b>
///
/// The following resources contain information about your IVS live stream (see
/// <a
/// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/getting-started.html">Getting
/// Started with Amazon IVS Real-Time Streaming</a>):
///
/// <ul>
/// <li>
/// <b>Stage</b> — A stage is a virtual space where participants can exchange
/// video in real time.
/// </li>
/// </ul>
/// <b>Tagging</b>
///
/// A <i>tag</i> is a metadata label that you assign to an AWS resource. A tag
/// comprises a <i>key</i> and a <i>value</i>, both set by you. For example, you
/// might set a tag as <code>topic:nature</code> to label a particular video
/// category. See <a
/// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
/// AWS Resources</a> for more information, including restrictions that apply to
/// tags and "Tag naming limits and requirements"; Amazon IVS stages has no
/// service-specific constraints beyond what is documented there.
///
/// Tags can help you identify and organize your AWS resources. For example, you
/// can use the same tag for different resources to indicate that they are
/// related. You can also use tags to manage access (see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Access
/// Tags</a>).
///
/// The Amazon IVS real-time API has these tag-related endpoints:
/// <a>TagResource</a>, <a>UntagResource</a>, and <a>ListTagsForResource</a>.
/// The following resource supports tagging: Stage.
///
/// At most 50 tags can be applied to a resource.
///
/// <b>Stages Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateParticipantToken</a> — Creates an additional token for a specified
/// stage. This can be done after stage creation or when tokens expire.
/// </li>
/// <li>
/// <a>CreateStage</a> — Creates a new stage (and optionally participant
/// tokens).
/// </li>
/// <li>
/// <a>DeleteStage</a> — Shuts down and deletes the specified stage
/// (disconnecting all participants).
/// </li>
/// <li>
/// <a>DisconnectParticipant</a> — Disconnects a specified participant and
/// revokes the participant permanently from a specified stage.
/// </li>
/// <li>
/// <a>GetParticipant</a> — Gets information about the specified participant
/// token.
/// </li>
/// <li>
/// <a>GetStage</a> — Gets information for the specified stage.
/// </li>
/// <li>
/// <a>GetStageSession</a> — Gets information for the specified stage session.
/// </li>
/// <li>
/// <a>ListParticipantEvents</a> — Lists events for a specified participant that
/// occurred during a specified stage session.
/// </li>
/// <li>
/// <a>ListParticipants</a> — Lists all participants in a specified stage
/// session.
/// </li>
/// <li>
/// <a>ListStages</a> — Gets summary information about all stages in your
/// account, in the AWS region where the API request is processed.
/// </li>
/// <li>
/// <a>ListStageSessions</a> — Gets all sessions for a specified stage.
/// </li>
/// <li>
/// <a>UpdateStage</a> — Updates a stage’s configuration.
/// </li>
/// </ul>
/// <b>Composition Endpoints</b>
///
/// <ul>
/// <li>
/// <a>GetComposition</a> — Gets information about the specified Composition
/// resource.
/// </li>
/// <li>
/// <a>ListCompositions</a> — Gets summary information about all Compositions in
/// your account, in the AWS region where the API request is processed.
/// </li>
/// <li>
/// <a>StartComposition</a> — Starts a Composition from a stage based on the
/// configuration provided in the request.
/// </li>
/// <li>
/// <a>StopComposition</a> — Stops and deletes a Composition resource. Any
/// broadcast from the Composition resource is stopped.
/// </li>
/// </ul>
/// <b>EncoderConfiguration Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateEncoderConfiguration</a> — Creates an EncoderConfiguration object.
/// </li>
/// <li>
/// <a>DeleteEncoderConfiguration</a> — Deletes an EncoderConfiguration
/// resource. Ensures that no Compositions are using this template; otherwise,
/// returns an error.
/// </li>
/// <li>
/// <a>GetEncoderConfiguration</a> — Gets information about the specified
/// EncoderConfiguration resource.
/// </li>
/// <li>
/// <a>ListEncoderConfigurations</a> — Gets summary information about all
/// EncoderConfigurations in your account, in the AWS region where the API
/// request is processed.
/// </li>
/// </ul>
/// <b>StorageConfiguration Endpoints</b>
///
/// <ul>
/// <li>
/// <a>CreateStorageConfiguration</a> — Creates a new storage configuration,
/// used to enable recording to Amazon S3.
/// </li>
/// <li>
/// <a>DeleteStorageConfiguration</a> — Deletes the storage configuration for
/// the specified ARN.
/// </li>
/// <li>
/// <a>GetStorageConfiguration</a> — Gets the storage configuration for the
/// specified ARN.
/// </li>
/// <li>
/// <a>ListStorageConfigurations</a> — Gets summary information about all
/// storage configurations in your account, in the AWS region where the API
/// request is processed.
/// </li>
/// </ul>
/// <b>Tags Endpoints</b>
///
/// <ul>
/// <li>
/// <a>ListTagsForResource</a> — Gets information about AWS tags for the
/// specified ARN.
/// </li>
/// <li>
/// <a>TagResource</a> — Adds or updates tags for the AWS resource with the
/// specified ARN.
/// </li>
/// <li>
/// <a>UntagResource</a> — Removes tags from the resource with the specified
/// ARN.
/// </li>
/// </ul>
class Ivsrealtime {
  final _s.RestJsonProtocol _protocol;
  Ivsrealtime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ivsrealtime',
            signingName: 'ivs',
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

  /// Creates an EncoderConfiguration object.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [name] :
  /// Optional name to identify the resource.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no constraints on
  /// tags beyond what is documented there.
  ///
  /// Parameter [video] :
  /// Video configuration. Default: video resolution 1280x720, bitrate 2500
  /// kbps, 30 fps.
  Future<CreateEncoderConfigurationResponse> createEncoderConfiguration({
    String? name,
    Map<String, String>? tags,
    Video? video,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (video != null) 'video': video,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateEncoderConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEncoderConfigurationResponse.fromJson(response);
  }

  /// Creates an additional token for a specified stage. This can be done after
  /// stage creation or when tokens expire. Tokens always are scoped to the
  /// stage for which they are created.
  ///
  /// Encryption keys are owned by Amazon IVS and never used directly by your
  /// application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [stageArn] :
  /// ARN of the stage to which this token is scoped.
  ///
  /// Parameter [attributes] :
  /// Application-provided attributes to encode into the token and attach to a
  /// stage. Map keys and values can contain UTF-8 encoded text. The maximum
  /// length of this field is 1 KB total. <i>This field is exposed to all stage
  /// participants and should not be used for personally identifying,
  /// confidential, or sensitive information.</i>
  ///
  /// Parameter [capabilities] :
  /// Set of capabilities that the user is allowed to perform in the stage.
  /// Default: <code>PUBLISH, SUBSCRIBE</code>.
  ///
  /// Parameter [duration] :
  /// Duration (in minutes), after which the token expires. Default: 720 (12
  /// hours).
  ///
  /// Parameter [userId] :
  /// Name that can be specified to help identify the token. This can be any
  /// UTF-8 encoded text. <i>This field is exposed to all stage participants and
  /// should not be used for personally identifying, confidential, or sensitive
  /// information.</i>
  Future<CreateParticipantTokenResponse> createParticipantToken({
    required String stageArn,
    Map<String, String>? attributes,
    List<ParticipantTokenCapability>? capabilities,
    int? duration,
    String? userId,
  }) async {
    _s.validateNumRange(
      'duration',
      duration,
      1,
      20160,
    );
    final $payload = <String, dynamic>{
      'stageArn': stageArn,
      if (attributes != null) 'attributes': attributes,
      if (capabilities != null)
        'capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (duration != null) 'duration': duration,
      if (userId != null) 'userId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateParticipantToken',
      exceptionFnMap: _exceptionFns,
    );
    return CreateParticipantTokenResponse.fromJson(response);
  }

  /// Creates a new stage (and optionally participant tokens).
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [name] :
  /// Optional name that can be specified for the stage being created.
  ///
  /// Parameter [participantTokenConfigurations] :
  /// Array of participant token configuration objects to attach to the new
  /// stage.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no constraints on
  /// tags beyond what is documented there.
  Future<CreateStageResponse> createStage({
    String? name,
    List<ParticipantTokenConfiguration>? participantTokenConfigurations,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
      if (participantTokenConfigurations != null)
        'participantTokenConfigurations': participantTokenConfigurations,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateStage',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStageResponse.fromJson(response);
  }

  /// Creates a new storage configuration, used to enable recording to Amazon
  /// S3. When a StorageConfiguration is created, IVS will modify the S3
  /// bucketPolicy of the provided bucket. This will ensure that IVS has
  /// sufficient permissions to write content to the provided bucket.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [s3] :
  /// A complex type that contains a storage configuration for where recorded
  /// video will be stored.
  ///
  /// Parameter [name] :
  /// Storage configuration name. The value does not need to be unique.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no constraints on
  /// tags beyond what is documented there.
  Future<CreateStorageConfigurationResponse> createStorageConfiguration({
    required S3StorageConfiguration s3,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      's3': s3,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateStorageConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateStorageConfigurationResponse.fromJson(response);
  }

  /// Deletes an EncoderConfiguration resource. Ensures that no Compositions are
  /// using this template; otherwise, returns an error.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the EncoderConfiguration.
  Future<void> deleteEncoderConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteEncoderConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Shuts down and deletes the specified stage (disconnecting all
  /// participants).
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the stage to be deleted.
  Future<void> deleteStage({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteStage',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the storage configuration for the specified ARN.
  ///
  /// If you try to delete a storage configuration that is used by a
  /// Composition, you will get an error (409 ConflictException). To avoid this,
  /// for all Compositions that reference the storage configuration, first use
  /// <a>StopComposition</a> and wait for it to complete, then use
  /// DeleteStorageConfiguration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the storage configuration to be deleted.
  Future<void> deleteStorageConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteStorageConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disconnects a specified participant and revokes the participant
  /// permanently from a specified stage.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [participantId] :
  /// Identifier of the participant to be disconnected. This is assigned by IVS
  /// and returned by <a>CreateParticipantToken</a>.
  ///
  /// Parameter [stageArn] :
  /// ARN of the stage to which the participant is attached.
  ///
  /// Parameter [reason] :
  /// Description of why this participant is being disconnected.
  Future<void> disconnectParticipant({
    required String participantId,
    required String stageArn,
    String? reason,
  }) async {
    final $payload = <String, dynamic>{
      'participantId': participantId,
      'stageArn': stageArn,
      if (reason != null) 'reason': reason,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisconnectParticipant',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get information about the specified Composition resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the Composition resource.
  Future<GetCompositionResponse> getComposition({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetComposition',
      exceptionFnMap: _exceptionFns,
    );
    return GetCompositionResponse.fromJson(response);
  }

  /// Gets information about the specified EncoderConfiguration resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the EncoderConfiguration resource.
  Future<GetEncoderConfigurationResponse> getEncoderConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetEncoderConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetEncoderConfigurationResponse.fromJson(response);
  }

  /// Gets information about the specified participant token.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [participantId] :
  /// Unique identifier for the participant. This is assigned by IVS and
  /// returned by <a>CreateParticipantToken</a>.
  ///
  /// Parameter [sessionId] :
  /// ID of a session within the stage.
  ///
  /// Parameter [stageArn] :
  /// Stage ARN.
  Future<GetParticipantResponse> getParticipant({
    required String participantId,
    required String sessionId,
    required String stageArn,
  }) async {
    final $payload = <String, dynamic>{
      'participantId': participantId,
      'sessionId': sessionId,
      'stageArn': stageArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetParticipant',
      exceptionFnMap: _exceptionFns,
    );
    return GetParticipantResponse.fromJson(response);
  }

  /// Gets information for the specified stage.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [arn] :
  /// ARN of the stage for which the information is to be retrieved.
  Future<GetStageResponse> getStage({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetStage',
      exceptionFnMap: _exceptionFns,
    );
    return GetStageResponse.fromJson(response);
  }

  /// Gets information for the specified stage session.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [sessionId] :
  /// ID of a session within the stage.
  ///
  /// Parameter [stageArn] :
  /// ARN of the stage for which the information is to be retrieved.
  Future<GetStageSessionResponse> getStageSession({
    required String sessionId,
    required String stageArn,
  }) async {
    final $payload = <String, dynamic>{
      'sessionId': sessionId,
      'stageArn': stageArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetStageSession',
      exceptionFnMap: _exceptionFns,
    );
    return GetStageSessionResponse.fromJson(response);
  }

  /// Gets the storage configuration for the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the storage configuration to be retrieved.
  Future<GetStorageConfigurationResponse> getStorageConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetStorageConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetStorageConfigurationResponse.fromJson(response);
  }

  /// Gets summary information about all Compositions in your account, in the
  /// AWS region where the API request is processed.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [filterByEncoderConfigurationArn] :
  /// Filters the Composition list to match the specified EncoderConfiguration
  /// attached to at least one of its output.
  ///
  /// Parameter [filterByStageArn] :
  /// Filters the Composition list to match the specified Stage ARN.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 100.
  ///
  /// Parameter [nextToken] :
  /// The first Composition to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListCompositionsResponse> listCompositions({
    String? filterByEncoderConfigurationArn,
    String? filterByStageArn,
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
      if (filterByEncoderConfigurationArn != null)
        'filterByEncoderConfigurationArn': filterByEncoderConfigurationArn,
      if (filterByStageArn != null) 'filterByStageArn': filterByStageArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListCompositions',
      exceptionFnMap: _exceptionFns,
    );
    return ListCompositionsResponse.fromJson(response);
  }

  /// Gets summary information about all EncoderConfigurations in your account,
  /// in the AWS region where the API request is processed.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 100.
  ///
  /// Parameter [nextToken] :
  /// The first encoder configuration to retrieve. This is used for pagination;
  /// see the <code>nextToken</code> response field.
  Future<ListEncoderConfigurationsResponse> listEncoderConfigurations({
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListEncoderConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListEncoderConfigurationsResponse.fromJson(response);
  }

  /// Lists events for a specified participant that occurred during a specified
  /// stage session.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [participantId] :
  /// Unique identifier for this participant. This is assigned by IVS and
  /// returned by <a>CreateParticipantToken</a>.
  ///
  /// Parameter [sessionId] :
  /// ID of a session within the stage.
  ///
  /// Parameter [stageArn] :
  /// Stage ARN.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first participant event to retrieve. This is used for pagination; see
  /// the <code>nextToken</code> response field.
  Future<ListParticipantEventsResponse> listParticipantEvents({
    required String participantId,
    required String sessionId,
    required String stageArn,
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
      'participantId': participantId,
      'sessionId': sessionId,
      'stageArn': stageArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListParticipantEvents',
      exceptionFnMap: _exceptionFns,
    );
    return ListParticipantEventsResponse.fromJson(response);
  }

  /// Lists all participants in a specified stage session.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [sessionId] :
  /// ID of the session within the stage.
  ///
  /// Parameter [stageArn] :
  /// Stage ARN.
  ///
  /// Parameter [filterByPublished] :
  /// Filters the response list to only show participants who published during
  /// the stage session. Only one of <code>filterByUserId</code>,
  /// <code>filterByPublished</code>, or <code>filterByState</code> can be
  /// provided per request.
  ///
  /// Parameter [filterByState] :
  /// Filters the response list to only show participants in the specified
  /// state. Only one of <code>filterByUserId</code>,
  /// <code>filterByPublished</code>, or <code>filterByState</code> can be
  /// provided per request.
  ///
  /// Parameter [filterByUserId] :
  /// Filters the response list to match the specified user ID. Only one of
  /// <code>filterByUserId</code>, <code>filterByPublished</code>, or
  /// <code>filterByState</code> can be provided per request. A
  /// <code>userId</code> is a customer-assigned name to help identify the
  /// token; this can be used to link a participant to a user in the customer’s
  /// own systems.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first participant to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListParticipantsResponse> listParticipants({
    required String sessionId,
    required String stageArn,
    bool? filterByPublished,
    ParticipantState? filterByState,
    String? filterByUserId,
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
      'sessionId': sessionId,
      'stageArn': stageArn,
      if (filterByPublished != null) 'filterByPublished': filterByPublished,
      if (filterByState != null) 'filterByState': filterByState.toValue(),
      if (filterByUserId != null) 'filterByUserId': filterByUserId,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListParticipants',
      exceptionFnMap: _exceptionFns,
    );
    return ListParticipantsResponse.fromJson(response);
  }

  /// Gets all sessions for a specified stage.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [stageArn] :
  /// Stage ARN.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first stage session to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStageSessionsResponse> listStageSessions({
    required String stageArn,
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
      'stageArn': stageArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListStageSessions',
      exceptionFnMap: _exceptionFns,
    );
    return ListStageSessionsResponse.fromJson(response);
  }

  /// Gets summary information about all stages in your account, in the AWS
  /// region where the API request is processed.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first stage to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListStagesResponse> listStages({
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListStages',
      exceptionFnMap: _exceptionFns,
    );
    return ListStagesResponse.fromJson(response);
  }

  /// Gets summary information about all storage configurations in your account,
  /// in the AWS region where the API request is processed.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of storage configurations to return. Default: your service
  /// quota or 100, whichever is smaller.
  ///
  /// Parameter [nextToken] :
  /// The first storage configuration to retrieve. This is used for pagination;
  /// see the <code>nextToken</code> response field.
  Future<ListStorageConfigurationsResponse> listStorageConfigurations({
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListStorageConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageConfigurationsResponse.fromJson(response);
  }

  /// Gets information about AWS tags for the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be retrieved. The ARN must be URL-encoded.
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

  /// Starts a Composition from a stage based on the configuration provided in
  /// the request.
  ///
  /// A Composition is an ephemeral resource that exists after this endpoint
  /// returns successfully. Composition stops and the resource is deleted:
  ///
  /// <ul>
  /// <li>
  /// When <a>StopComposition</a> is called.
  /// </li>
  /// <li>
  /// After a 1-minute timeout, when all participants are disconnected from the
  /// stage.
  /// </li>
  /// <li>
  /// After a 1-minute timeout, if there are no participants in the stage when
  /// StartComposition is called.
  /// </li>
  /// <li>
  /// When broadcasting to the IVS channel fails and all retries are exhausted.
  /// </li>
  /// <li>
  /// When broadcasting is disconnected and all attempts to reconnect are
  /// exhausted.
  /// </li>
  /// </ul>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [destinations] :
  /// Array of destination configuration.
  ///
  /// Parameter [stageArn] :
  /// ARN of the stage to be used for compositing.
  ///
  /// Parameter [idempotencyToken] :
  /// Idempotency token.
  ///
  /// Parameter [layout] :
  /// Layout object to configure composition parameters.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no constraints on
  /// tags beyond what is documented there.
  Future<StartCompositionResponse> startComposition({
    required List<DestinationConfiguration> destinations,
    required String stageArn,
    String? idempotencyToken,
    LayoutConfiguration? layout,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'destinations': destinations,
      'stageArn': stageArn,
      'idempotencyToken': idempotencyToken ?? _s.generateIdempotencyToken(),
      if (layout != null) 'layout': layout,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartComposition',
      exceptionFnMap: _exceptionFns,
    );
    return StartCompositionResponse.fromJson(response);
  }

  /// Stops and deletes a Composition resource. Any broadcast from the
  /// Composition resource is stopped.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [arn] :
  /// ARN of the Composition.
  Future<void> stopComposition({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopComposition',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds or updates tags for the AWS resource with the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be tagged. The ARN must be URL-encoded.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no constraints
  /// beyond what is documented there.
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

  /// Removes tags from the resource with the specified ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be untagged. The ARN must be URL-encoded.
  ///
  /// Parameter [tagKeys] :
  /// Array of tags to be removed. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags
  /// and "Tag naming limits and requirements"; Amazon IVS has no constraints
  /// beyond what is documented there.
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

  /// Updates a stage’s configuration.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  ///
  /// Parameter [arn] :
  /// ARN of the stage to be updated.
  ///
  /// Parameter [name] :
  /// Name of the stage to be updated.
  Future<UpdateStageResponse> updateStage({
    required String arn,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateStage',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateStageResponse.fromJson(response);
  }
}

/// Object specifying a channel as a destination.
class ChannelDestinationConfiguration {
  /// ARN of the channel to use for broadcasting. The channel and stage resources
  /// must be in the same AWS account and region. The channel must be offline (not
  /// broadcasting).
  final String channelArn;

  /// ARN of the <a>EncoderConfiguration</a> resource. The encoder configuration
  /// and stage resources must be in the same AWS account and region.
  final String? encoderConfigurationArn;

  ChannelDestinationConfiguration({
    required this.channelArn,
    this.encoderConfigurationArn,
  });

  factory ChannelDestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return ChannelDestinationConfiguration(
      channelArn: json['channelArn'] as String,
      encoderConfigurationArn: json['encoderConfigurationArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final encoderConfigurationArn = this.encoderConfigurationArn;
    return {
      'channelArn': channelArn,
      if (encoderConfigurationArn != null)
        'encoderConfigurationArn': encoderConfigurationArn,
    };
  }
}

/// Object specifying a Composition resource.
class Composition {
  /// ARN of the Composition resource.
  final String arn;

  /// Array of Destination objects. A Composition can contain either one
  /// destination (<code>channel</code> or <code>s3</code>) or two (one
  /// <code>channel</code> and one <code>s3</code>).
  final List<Destination> destinations;

  /// Layout object to configure composition parameters.
  final LayoutConfiguration layout;

  /// ARN of the stage used as input
  final String stageArn;

  /// State of the Composition.
  final CompositionState state;

  /// UTC time of the Composition end. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? endTime;

  /// UTC time of the Composition start. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>.
  final DateTime? startTime;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  Composition({
    required this.arn,
    required this.destinations,
    required this.layout,
    required this.stageArn,
    required this.state,
    this.endTime,
    this.startTime,
    this.tags,
  });

  factory Composition.fromJson(Map<String, dynamic> json) {
    return Composition(
      arn: json['arn'] as String,
      destinations: (json['destinations'] as List)
          .whereNotNull()
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      layout:
          LayoutConfiguration.fromJson(json['layout'] as Map<String, dynamic>),
      stageArn: json['stageArn'] as String,
      state: (json['state'] as String).toCompositionState(),
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinations = this.destinations;
    final layout = this.layout;
    final stageArn = this.stageArn;
    final state = this.state;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final tags = this.tags;
    return {
      'arn': arn,
      'destinations': destinations,
      'layout': layout,
      'stageArn': stageArn,
      'state': state.toValue(),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (tags != null) 'tags': tags,
    };
  }
}

enum CompositionState {
  starting,
  active,
  stopping,
  failed,
  stopped,
}

extension CompositionStateValueExtension on CompositionState {
  String toValue() {
    switch (this) {
      case CompositionState.starting:
        return 'STARTING';
      case CompositionState.active:
        return 'ACTIVE';
      case CompositionState.stopping:
        return 'STOPPING';
      case CompositionState.failed:
        return 'FAILED';
      case CompositionState.stopped:
        return 'STOPPED';
    }
  }
}

extension CompositionStateFromString on String {
  CompositionState toCompositionState() {
    switch (this) {
      case 'STARTING':
        return CompositionState.starting;
      case 'ACTIVE':
        return CompositionState.active;
      case 'STOPPING':
        return CompositionState.stopping;
      case 'FAILED':
        return CompositionState.failed;
      case 'STOPPED':
        return CompositionState.stopped;
    }
    throw Exception('$this is not known in enum CompositionState');
  }
}

/// Summary information about a Composition.
class CompositionSummary {
  /// ARN of the Composition resource.
  final String arn;

  /// Array of Destination objects.
  final List<DestinationSummary> destinations;

  /// ARN of the attached stage.
  final String stageArn;

  /// State of the Composition resource.
  final CompositionState state;

  /// UTC time of the Composition end. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? endTime;

  /// UTC time of the Composition start. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>.
  final DateTime? startTime;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  CompositionSummary({
    required this.arn,
    required this.destinations,
    required this.stageArn,
    required this.state,
    this.endTime,
    this.startTime,
    this.tags,
  });

  factory CompositionSummary.fromJson(Map<String, dynamic> json) {
    return CompositionSummary(
      arn: json['arn'] as String,
      destinations: (json['destinations'] as List)
          .whereNotNull()
          .map((e) => DestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      stageArn: json['stageArn'] as String,
      state: (json['state'] as String).toCompositionState(),
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final destinations = this.destinations;
    final stageArn = this.stageArn;
    final state = this.state;
    final endTime = this.endTime;
    final startTime = this.startTime;
    final tags = this.tags;
    return {
      'arn': arn,
      'destinations': destinations,
      'stageArn': stageArn,
      'state': state.toValue(),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateEncoderConfigurationResponse {
  /// The EncoderConfiguration that was created.
  final EncoderConfiguration? encoderConfiguration;

  CreateEncoderConfigurationResponse({
    this.encoderConfiguration,
  });

  factory CreateEncoderConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateEncoderConfigurationResponse(
      encoderConfiguration: json['encoderConfiguration'] != null
          ? EncoderConfiguration.fromJson(
              json['encoderConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encoderConfiguration = this.encoderConfiguration;
    return {
      if (encoderConfiguration != null)
        'encoderConfiguration': encoderConfiguration,
    };
  }
}

class CreateParticipantTokenResponse {
  /// The participant token that was created.
  final ParticipantToken? participantToken;

  CreateParticipantTokenResponse({
    this.participantToken,
  });

  factory CreateParticipantTokenResponse.fromJson(Map<String, dynamic> json) {
    return CreateParticipantTokenResponse(
      participantToken: json['participantToken'] != null
          ? ParticipantToken.fromJson(
              json['participantToken'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final participantToken = this.participantToken;
    return {
      if (participantToken != null) 'participantToken': participantToken,
    };
  }
}

class CreateStageResponse {
  /// Participant tokens attached to the stage. These correspond to the
  /// <code>participants</code> in the request.
  final List<ParticipantToken>? participantTokens;

  /// The stage that was created.
  final Stage? stage;

  CreateStageResponse({
    this.participantTokens,
    this.stage,
  });

  factory CreateStageResponse.fromJson(Map<String, dynamic> json) {
    return CreateStageResponse(
      participantTokens: (json['participantTokens'] as List?)
          ?.whereNotNull()
          .map((e) => ParticipantToken.fromJson(e as Map<String, dynamic>))
          .toList(),
      stage: json['stage'] != null
          ? Stage.fromJson(json['stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final participantTokens = this.participantTokens;
    final stage = this.stage;
    return {
      if (participantTokens != null) 'participantTokens': participantTokens,
      if (stage != null) 'stage': stage,
    };
  }
}

class CreateStorageConfigurationResponse {
  /// The StorageConfiguration that was created.
  final StorageConfiguration? storageConfiguration;

  CreateStorageConfigurationResponse({
    this.storageConfiguration,
  });

  factory CreateStorageConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateStorageConfigurationResponse(
      storageConfiguration: json['storageConfiguration'] != null
          ? StorageConfiguration.fromJson(
              json['storageConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageConfiguration = this.storageConfiguration;
    return {
      if (storageConfiguration != null)
        'storageConfiguration': storageConfiguration,
    };
  }
}

class DeleteEncoderConfigurationResponse {
  DeleteEncoderConfigurationResponse();

  factory DeleteEncoderConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEncoderConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStageResponse {
  DeleteStageResponse();

  factory DeleteStageResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStorageConfigurationResponse {
  DeleteStorageConfigurationResponse();

  factory DeleteStorageConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStorageConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Object specifying the status of a Destination.
class Destination {
  /// Configuration used to create this destination.
  final DestinationConfiguration configuration;

  /// Unique identifier for this destination, assigned by IVS.
  final String id;

  /// State of the Composition Destination.
  final DestinationState state;

  /// Optional details regarding the status of the destination.
  final DestinationDetail? detail;

  /// UTC time of the destination end. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? endTime;

  /// UTC time of the destination start. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>.
  final DateTime? startTime;

  Destination({
    required this.configuration,
    required this.id,
    required this.state,
    this.detail,
    this.endTime,
    this.startTime,
  });

  factory Destination.fromJson(Map<String, dynamic> json) {
    return Destination(
      configuration: DestinationConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      id: json['id'] as String,
      state: (json['state'] as String).toDestinationState(),
      detail: json['detail'] != null
          ? DestinationDetail.fromJson(json['detail'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final id = this.id;
    final state = this.state;
    final detail = this.detail;
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'configuration': configuration,
      'id': id,
      'state': state.toValue(),
      if (detail != null) 'detail': detail,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Complex data type that defines destination-configuration objects.
class DestinationConfiguration {
  /// An IVS channel to be used for broadcasting, for server-side composition.
  /// Either a <code>channel</code> or an <code>s3</code> must be specified.
  final ChannelDestinationConfiguration? channel;

  /// Name that can be specified to help identify the destination.
  final String? name;

  /// An S3 storage configuration to be used for recording video data. Either a
  /// <code>channel</code> or an <code>s3</code> must be specified.
  final S3DestinationConfiguration? s3;

  DestinationConfiguration({
    this.channel,
    this.name,
    this.s3,
  });

  factory DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return DestinationConfiguration(
      channel: json['channel'] != null
          ? ChannelDestinationConfiguration.fromJson(
              json['channel'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      s3: json['s3'] != null
          ? S3DestinationConfiguration.fromJson(
              json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    final name = this.name;
    final s3 = this.s3;
    return {
      if (channel != null) 'channel': channel,
      if (name != null) 'name': name,
      if (s3 != null) 's3': s3,
    };
  }
}

/// Complex data type that defines destination-detail objects.
class DestinationDetail {
  /// An S3 detail object to return information about the S3 destination.
  final S3Detail? s3;

  DestinationDetail({
    this.s3,
  });

  factory DestinationDetail.fromJson(Map<String, dynamic> json) {
    return DestinationDetail(
      s3: json['s3'] != null
          ? S3Detail.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3 = this.s3;
    return {
      if (s3 != null) 's3': s3,
    };
  }
}

enum DestinationState {
  starting,
  active,
  stopping,
  reconnecting,
  failed,
  stopped,
}

extension DestinationStateValueExtension on DestinationState {
  String toValue() {
    switch (this) {
      case DestinationState.starting:
        return 'STARTING';
      case DestinationState.active:
        return 'ACTIVE';
      case DestinationState.stopping:
        return 'STOPPING';
      case DestinationState.reconnecting:
        return 'RECONNECTING';
      case DestinationState.failed:
        return 'FAILED';
      case DestinationState.stopped:
        return 'STOPPED';
    }
  }
}

extension DestinationStateFromString on String {
  DestinationState toDestinationState() {
    switch (this) {
      case 'STARTING':
        return DestinationState.starting;
      case 'ACTIVE':
        return DestinationState.active;
      case 'STOPPING':
        return DestinationState.stopping;
      case 'RECONNECTING':
        return DestinationState.reconnecting;
      case 'FAILED':
        return DestinationState.failed;
      case 'STOPPED':
        return DestinationState.stopped;
    }
    throw Exception('$this is not known in enum DestinationState');
  }
}

/// Summary information about a Destination.
class DestinationSummary {
  /// Unique identifier for this destination, assigned by IVS.
  final String id;

  /// State of the Composition Destination.
  final DestinationState state;

  /// UTC time of the destination end. This is an ISO 8601 timestamp; <i>note that
  /// this is returned as a string</i>.
  final DateTime? endTime;

  /// UTC time of the destination start. This is an ISO 8601 timestamp; <i>note
  /// that this is returned as a string</i>.
  final DateTime? startTime;

  DestinationSummary({
    required this.id,
    required this.state,
    this.endTime,
    this.startTime,
  });

  factory DestinationSummary.fromJson(Map<String, dynamic> json) {
    return DestinationSummary(
      id: json['id'] as String,
      state: (json['state'] as String).toDestinationState(),
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final id = this.id;
    final state = this.state;
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'id': id,
      'state': state.toValue(),
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

class DisconnectParticipantResponse {
  DisconnectParticipantResponse();

  factory DisconnectParticipantResponse.fromJson(Map<String, dynamic> _) {
    return DisconnectParticipantResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Settings for transcoding.
class EncoderConfiguration {
  /// ARN of the EncoderConfiguration resource.
  final String arn;

  /// Optional name to identify the resource.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  /// Video configuration. Default: video resolution 1280x720, bitrate 2500 kbps,
  /// 30 fps
  final Video? video;

  EncoderConfiguration({
    required this.arn,
    this.name,
    this.tags,
    this.video,
  });

  factory EncoderConfiguration.fromJson(Map<String, dynamic> json) {
    return EncoderConfiguration(
      arn: json['arn'] as String,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      video: json['video'] != null
          ? Video.fromJson(json['video'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final tags = this.tags;
    final video = this.video;
    return {
      'arn': arn,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (video != null) 'video': video,
    };
  }
}

/// Summary information about an EncoderConfiguration.
class EncoderConfigurationSummary {
  /// ARN of the EncoderConfiguration resource.
  final String arn;

  /// Optional name to identify the resource.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  EncoderConfigurationSummary({
    required this.arn,
    this.name,
    this.tags,
  });

  factory EncoderConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return EncoderConfigurationSummary(
      arn: json['arn'] as String,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// An occurrence during a stage session.
class Event {
  /// If the event is an error event, the error code is provided to give insight
  /// into the specific error that occurred. If the event is not an error event,
  /// this field is null. <code>INSUFFICIENT_CAPABILITIES</code> indicates that
  /// the participant tried to take an action that the participant’s token is not
  /// allowed to do. For more information about participant capabilities, see the
  /// <code>capabilities</code> field in <a>CreateParticipantToken</a>.
  /// <code>QUOTA_EXCEEDED</code> indicates that the number of participants who
  /// want to publish/subscribe to a stage exceeds the quota; for more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/service-quotas.html">Service
  /// Quotas</a>. <code>PUBLISHER_NOT_FOUND</code> indicates that the participant
  /// tried to subscribe to a publisher that doesn’t exist.
  final EventErrorCode? errorCode;

  /// ISO 8601 timestamp (returned as a string) for when the event occurred.
  final DateTime? eventTime;

  /// The name of the event.
  final EventName? name;

  /// Unique identifier for the participant who triggered the event. This is
  /// assigned by IVS.
  final String? participantId;

  /// Unique identifier for the remote participant. For a subscribe event, this is
  /// the publisher. For a publish or join event, this is null. This is assigned
  /// by IVS.
  final String? remoteParticipantId;

  Event({
    this.errorCode,
    this.eventTime,
    this.name,
    this.participantId,
    this.remoteParticipantId,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      errorCode: (json['errorCode'] as String?)?.toEventErrorCode(),
      eventTime: timeStampFromJson(json['eventTime']),
      name: (json['name'] as String?)?.toEventName(),
      participantId: json['participantId'] as String?,
      remoteParticipantId: json['remoteParticipantId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final eventTime = this.eventTime;
    final name = this.name;
    final participantId = this.participantId;
    final remoteParticipantId = this.remoteParticipantId;
    return {
      if (errorCode != null) 'errorCode': errorCode.toValue(),
      if (eventTime != null) 'eventTime': iso8601ToJson(eventTime),
      if (name != null) 'name': name.toValue(),
      if (participantId != null) 'participantId': participantId,
      if (remoteParticipantId != null)
        'remoteParticipantId': remoteParticipantId,
    };
  }
}

enum EventErrorCode {
  insufficientCapabilities,
  quotaExceeded,
  publisherNotFound,
}

extension EventErrorCodeValueExtension on EventErrorCode {
  String toValue() {
    switch (this) {
      case EventErrorCode.insufficientCapabilities:
        return 'INSUFFICIENT_CAPABILITIES';
      case EventErrorCode.quotaExceeded:
        return 'QUOTA_EXCEEDED';
      case EventErrorCode.publisherNotFound:
        return 'PUBLISHER_NOT_FOUND';
    }
  }
}

extension EventErrorCodeFromString on String {
  EventErrorCode toEventErrorCode() {
    switch (this) {
      case 'INSUFFICIENT_CAPABILITIES':
        return EventErrorCode.insufficientCapabilities;
      case 'QUOTA_EXCEEDED':
        return EventErrorCode.quotaExceeded;
      case 'PUBLISHER_NOT_FOUND':
        return EventErrorCode.publisherNotFound;
    }
    throw Exception('$this is not known in enum EventErrorCode');
  }
}

enum EventName {
  joined,
  left,
  publishStarted,
  publishStopped,
  subscribeStarted,
  subscribeStopped,
  publishError,
  subscribeError,
  joinError,
}

extension EventNameValueExtension on EventName {
  String toValue() {
    switch (this) {
      case EventName.joined:
        return 'JOINED';
      case EventName.left:
        return 'LEFT';
      case EventName.publishStarted:
        return 'PUBLISH_STARTED';
      case EventName.publishStopped:
        return 'PUBLISH_STOPPED';
      case EventName.subscribeStarted:
        return 'SUBSCRIBE_STARTED';
      case EventName.subscribeStopped:
        return 'SUBSCRIBE_STOPPED';
      case EventName.publishError:
        return 'PUBLISH_ERROR';
      case EventName.subscribeError:
        return 'SUBSCRIBE_ERROR';
      case EventName.joinError:
        return 'JOIN_ERROR';
    }
  }
}

extension EventNameFromString on String {
  EventName toEventName() {
    switch (this) {
      case 'JOINED':
        return EventName.joined;
      case 'LEFT':
        return EventName.left;
      case 'PUBLISH_STARTED':
        return EventName.publishStarted;
      case 'PUBLISH_STOPPED':
        return EventName.publishStopped;
      case 'SUBSCRIBE_STARTED':
        return EventName.subscribeStarted;
      case 'SUBSCRIBE_STOPPED':
        return EventName.subscribeStopped;
      case 'PUBLISH_ERROR':
        return EventName.publishError;
      case 'SUBSCRIBE_ERROR':
        return EventName.subscribeError;
      case 'JOIN_ERROR':
        return EventName.joinError;
    }
    throw Exception('$this is not known in enum EventName');
  }
}

class GetCompositionResponse {
  /// The Composition that was returned.
  final Composition? composition;

  GetCompositionResponse({
    this.composition,
  });

  factory GetCompositionResponse.fromJson(Map<String, dynamic> json) {
    return GetCompositionResponse(
      composition: json['composition'] != null
          ? Composition.fromJson(json['composition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final composition = this.composition;
    return {
      if (composition != null) 'composition': composition,
    };
  }
}

class GetEncoderConfigurationResponse {
  /// The EncoderConfiguration that was returned.
  final EncoderConfiguration? encoderConfiguration;

  GetEncoderConfigurationResponse({
    this.encoderConfiguration,
  });

  factory GetEncoderConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetEncoderConfigurationResponse(
      encoderConfiguration: json['encoderConfiguration'] != null
          ? EncoderConfiguration.fromJson(
              json['encoderConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encoderConfiguration = this.encoderConfiguration;
    return {
      if (encoderConfiguration != null)
        'encoderConfiguration': encoderConfiguration,
    };
  }
}

class GetParticipantResponse {
  /// The participant that is returned.
  final Participant? participant;

  GetParticipantResponse({
    this.participant,
  });

  factory GetParticipantResponse.fromJson(Map<String, dynamic> json) {
    return GetParticipantResponse(
      participant: json['participant'] != null
          ? Participant.fromJson(json['participant'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final participant = this.participant;
    return {
      if (participant != null) 'participant': participant,
    };
  }
}

class GetStageResponse {
  /// The stage that is returned.
  final Stage? stage;

  GetStageResponse({
    this.stage,
  });

  factory GetStageResponse.fromJson(Map<String, dynamic> json) {
    return GetStageResponse(
      stage: json['stage'] != null
          ? Stage.fromJson(json['stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stage = this.stage;
    return {
      if (stage != null) 'stage': stage,
    };
  }
}

class GetStageSessionResponse {
  /// The stage session that is returned.
  final StageSession? stageSession;

  GetStageSessionResponse({
    this.stageSession,
  });

  factory GetStageSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetStageSessionResponse(
      stageSession: json['stageSession'] != null
          ? StageSession.fromJson(json['stageSession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stageSession = this.stageSession;
    return {
      if (stageSession != null) 'stageSession': stageSession,
    };
  }
}

class GetStorageConfigurationResponse {
  /// The StorageConfiguration that was returned.
  final StorageConfiguration? storageConfiguration;

  GetStorageConfigurationResponse({
    this.storageConfiguration,
  });

  factory GetStorageConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetStorageConfigurationResponse(
      storageConfiguration: json['storageConfiguration'] != null
          ? StorageConfiguration.fromJson(
              json['storageConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageConfiguration = this.storageConfiguration;
    return {
      if (storageConfiguration != null)
        'storageConfiguration': storageConfiguration,
    };
  }
}

/// Configuration information specific to Grid layout, for server-side
/// composition. See "Layouts" in <a
/// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/server-side-composition.html">Server-Side
/// Composition</a>.
class GridConfiguration {
  /// This attribute name identifies the featured slot. A participant with this
  /// attribute set to <code>"true"</code> (as a string value) in
  /// <a>ParticipantTokenConfiguration</a> is placed in the featured slot.
  final String? featuredParticipantAttribute;

  /// Specifies the spacing between participant tiles in pixels. Default:
  /// <code>2</code>.
  final int? gridGap;

  /// Determines whether to omit participants with stopped video in the
  /// composition. Default: <code>false</code>.
  final bool? omitStoppedVideo;

  /// Sets the non-featured participant display mode. Default: <code>VIDEO</code>.
  final VideoAspectRatio? videoAspectRatio;

  /// Defines how video fits within the participant tile. When not set,
  /// <code>videoFillMode</code> defaults to <code>COVER</code> fill mode for
  /// participants in the grid and to <code>CONTAIN</code> fill mode for featured
  /// participants.
  final VideoFillMode? videoFillMode;

  GridConfiguration({
    this.featuredParticipantAttribute,
    this.gridGap,
    this.omitStoppedVideo,
    this.videoAspectRatio,
    this.videoFillMode,
  });

  factory GridConfiguration.fromJson(Map<String, dynamic> json) {
    return GridConfiguration(
      featuredParticipantAttribute:
          json['featuredParticipantAttribute'] as String?,
      gridGap: json['gridGap'] as int?,
      omitStoppedVideo: json['omitStoppedVideo'] as bool?,
      videoAspectRatio:
          (json['videoAspectRatio'] as String?)?.toVideoAspectRatio(),
      videoFillMode: (json['videoFillMode'] as String?)?.toVideoFillMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final featuredParticipantAttribute = this.featuredParticipantAttribute;
    final gridGap = this.gridGap;
    final omitStoppedVideo = this.omitStoppedVideo;
    final videoAspectRatio = this.videoAspectRatio;
    final videoFillMode = this.videoFillMode;
    return {
      if (featuredParticipantAttribute != null)
        'featuredParticipantAttribute': featuredParticipantAttribute,
      if (gridGap != null) 'gridGap': gridGap,
      if (omitStoppedVideo != null) 'omitStoppedVideo': omitStoppedVideo,
      if (videoAspectRatio != null)
        'videoAspectRatio': videoAspectRatio.toValue(),
      if (videoFillMode != null) 'videoFillMode': videoFillMode.toValue(),
    };
  }
}

/// Configuration information of supported layouts for server-side composition.
class LayoutConfiguration {
  /// Configuration related to grid layout. Default: Grid layout.
  final GridConfiguration? grid;

  /// Configuration related to PiP layout.
  final PipConfiguration? pip;

  LayoutConfiguration({
    this.grid,
    this.pip,
  });

  factory LayoutConfiguration.fromJson(Map<String, dynamic> json) {
    return LayoutConfiguration(
      grid: json['grid'] != null
          ? GridConfiguration.fromJson(json['grid'] as Map<String, dynamic>)
          : null,
      pip: json['pip'] != null
          ? PipConfiguration.fromJson(json['pip'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final grid = this.grid;
    final pip = this.pip;
    return {
      if (grid != null) 'grid': grid,
      if (pip != null) 'pip': pip,
    };
  }
}

class ListCompositionsResponse {
  /// List of the matching Compositions (summary information only).
  final List<CompositionSummary> compositions;

  /// If there are more compositions than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListCompositionsResponse({
    required this.compositions,
    this.nextToken,
  });

  factory ListCompositionsResponse.fromJson(Map<String, dynamic> json) {
    return ListCompositionsResponse(
      compositions: (json['compositions'] as List)
          .whereNotNull()
          .map((e) => CompositionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final compositions = this.compositions;
    final nextToken = this.nextToken;
    return {
      'compositions': compositions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEncoderConfigurationsResponse {
  /// List of the matching EncoderConfigurations (summary information only).
  final List<EncoderConfigurationSummary> encoderConfigurations;

  /// If there are more encoder configurations than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListEncoderConfigurationsResponse({
    required this.encoderConfigurations,
    this.nextToken,
  });

  factory ListEncoderConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListEncoderConfigurationsResponse(
      encoderConfigurations: (json['encoderConfigurations'] as List)
          .whereNotNull()
          .map((e) =>
              EncoderConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encoderConfigurations = this.encoderConfigurations;
    final nextToken = this.nextToken;
    return {
      'encoderConfigurations': encoderConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListParticipantEventsResponse {
  /// List of the matching events.
  final List<Event> events;

  /// If there are more events than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListParticipantEventsResponse({
    required this.events,
    this.nextToken,
  });

  factory ListParticipantEventsResponse.fromJson(Map<String, dynamic> json) {
    return ListParticipantEventsResponse(
      events: (json['events'] as List)
          .whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final nextToken = this.nextToken;
    return {
      'events': events,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListParticipantsResponse {
  /// List of the matching participants (summary information only).
  final List<ParticipantSummary> participants;

  /// If there are more participants than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListParticipantsResponse({
    required this.participants,
    this.nextToken,
  });

  factory ListParticipantsResponse.fromJson(Map<String, dynamic> json) {
    return ListParticipantsResponse(
      participants: (json['participants'] as List)
          .whereNotNull()
          .map((e) => ParticipantSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final participants = this.participants;
    final nextToken = this.nextToken;
    return {
      'participants': participants,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStageSessionsResponse {
  /// List of matching stage sessions.
  final List<StageSessionSummary> stageSessions;

  /// If there are more stage sessions than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListStageSessionsResponse({
    required this.stageSessions,
    this.nextToken,
  });

  factory ListStageSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListStageSessionsResponse(
      stageSessions: (json['stageSessions'] as List)
          .whereNotNull()
          .map((e) => StageSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stageSessions = this.stageSessions;
    final nextToken = this.nextToken;
    return {
      'stageSessions': stageSessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStagesResponse {
  /// List of the matching stages (summary information only).
  final List<StageSummary> stages;

  /// If there are more stages than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListStagesResponse({
    required this.stages,
    this.nextToken,
  });

  factory ListStagesResponse.fromJson(Map<String, dynamic> json) {
    return ListStagesResponse(
      stages: (json['stages'] as List)
          .whereNotNull()
          .map((e) => StageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stages = this.stages;
    final nextToken = this.nextToken;
    return {
      'stages': stages,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStorageConfigurationsResponse {
  /// List of the matching storage configurations.
  final List<StorageConfigurationSummary> storageConfigurations;

  /// If there are more storage configurations than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListStorageConfigurationsResponse({
    required this.storageConfigurations,
    this.nextToken,
  });

  factory ListStorageConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListStorageConfigurationsResponse(
      storageConfigurations: (json['storageConfigurations'] as List)
          .whereNotNull()
          .map((e) =>
              StorageConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageConfigurations = this.storageConfigurations;
    final nextToken = this.nextToken;
    return {
      'storageConfigurations': storageConfigurations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// Object describing a participant that has joined a stage.
class Participant {
  /// Application-provided attributes to encode into the token and attach to a
  /// stage. Map keys and values can contain UTF-8 encoded text. The maximum
  /// length of this field is 1 KB total. <i>This field is exposed to all stage
  /// participants and should not be used for personally identifying,
  /// confidential, or sensitive information</i>.
  final Map<String, String>? attributes;

  /// The participant’s browser.
  final String? browserName;

  /// The participant’s browser version.
  final String? browserVersion;

  /// ISO 8601 timestamp (returned as a string) when the participant first joined
  /// the stage session.
  final DateTime? firstJoinTime;

  /// The participant’s Internet Service Provider.
  final String? ispName;

  /// The participant’s operating system.
  final String? osName;

  /// The participant’s operating system version.
  final String? osVersion;

  /// Unique identifier for this participant, assigned by IVS.
  final String? participantId;

  /// Whether the participant ever published to the stage session.
  final bool? published;

  /// The participant’s SDK version.
  final String? sdkVersion;

  /// Whether the participant is connected to or disconnected from the stage.
  final ParticipantState? state;

  /// Customer-assigned name to help identify the token; this can be used to link
  /// a participant to a user in the customer’s own systems. This can be any UTF-8
  /// encoded text. <i>This field is exposed to all stage participants and should
  /// not be used for personally identifying, confidential, or sensitive
  /// information</i>.
  final String? userId;

  Participant({
    this.attributes,
    this.browserName,
    this.browserVersion,
    this.firstJoinTime,
    this.ispName,
    this.osName,
    this.osVersion,
    this.participantId,
    this.published,
    this.sdkVersion,
    this.state,
    this.userId,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      browserName: json['browserName'] as String?,
      browserVersion: json['browserVersion'] as String?,
      firstJoinTime: timeStampFromJson(json['firstJoinTime']),
      ispName: json['ispName'] as String?,
      osName: json['osName'] as String?,
      osVersion: json['osVersion'] as String?,
      participantId: json['participantId'] as String?,
      published: json['published'] as bool?,
      sdkVersion: json['sdkVersion'] as String?,
      state: (json['state'] as String?)?.toParticipantState(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final browserName = this.browserName;
    final browserVersion = this.browserVersion;
    final firstJoinTime = this.firstJoinTime;
    final ispName = this.ispName;
    final osName = this.osName;
    final osVersion = this.osVersion;
    final participantId = this.participantId;
    final published = this.published;
    final sdkVersion = this.sdkVersion;
    final state = this.state;
    final userId = this.userId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (browserName != null) 'browserName': browserName,
      if (browserVersion != null) 'browserVersion': browserVersion,
      if (firstJoinTime != null) 'firstJoinTime': iso8601ToJson(firstJoinTime),
      if (ispName != null) 'ispName': ispName,
      if (osName != null) 'osName': osName,
      if (osVersion != null) 'osVersion': osVersion,
      if (participantId != null) 'participantId': participantId,
      if (published != null) 'published': published,
      if (sdkVersion != null) 'sdkVersion': sdkVersion,
      if (state != null) 'state': state.toValue(),
      if (userId != null) 'userId': userId,
    };
  }
}

enum ParticipantState {
  connected,
  disconnected,
}

extension ParticipantStateValueExtension on ParticipantState {
  String toValue() {
    switch (this) {
      case ParticipantState.connected:
        return 'CONNECTED';
      case ParticipantState.disconnected:
        return 'DISCONNECTED';
    }
  }
}

extension ParticipantStateFromString on String {
  ParticipantState toParticipantState() {
    switch (this) {
      case 'CONNECTED':
        return ParticipantState.connected;
      case 'DISCONNECTED':
        return ParticipantState.disconnected;
    }
    throw Exception('$this is not known in enum ParticipantState');
  }
}

/// Summary object describing a participant that has joined a stage.
class ParticipantSummary {
  /// ISO 8601 timestamp (returned as a string) when the participant first joined
  /// the stage session.
  final DateTime? firstJoinTime;

  /// Unique identifier for this participant, assigned by IVS.
  final String? participantId;

  /// Whether the participant ever published to the stage session.
  final bool? published;

  /// Whether the participant is connected to or disconnected from the stage.
  final ParticipantState? state;

  /// Customer-assigned name to help identify the token; this can be used to link
  /// a participant to a user in the customer’s own systems. This can be any UTF-8
  /// encoded text. <i>This field is exposed to all stage participants and should
  /// not be used for personally identifying, confidential, or sensitive
  /// information</i>.
  final String? userId;

  ParticipantSummary({
    this.firstJoinTime,
    this.participantId,
    this.published,
    this.state,
    this.userId,
  });

  factory ParticipantSummary.fromJson(Map<String, dynamic> json) {
    return ParticipantSummary(
      firstJoinTime: timeStampFromJson(json['firstJoinTime']),
      participantId: json['participantId'] as String?,
      published: json['published'] as bool?,
      state: (json['state'] as String?)?.toParticipantState(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstJoinTime = this.firstJoinTime;
    final participantId = this.participantId;
    final published = this.published;
    final state = this.state;
    final userId = this.userId;
    return {
      if (firstJoinTime != null) 'firstJoinTime': iso8601ToJson(firstJoinTime),
      if (participantId != null) 'participantId': participantId,
      if (published != null) 'published': published,
      if (state != null) 'state': state.toValue(),
      if (userId != null) 'userId': userId,
    };
  }
}

/// Object specifying a participant token in a stage.
///
/// <b>Important</b>: Treat tokens as opaque; i.e., do not build functionality
/// based on token contents. The format of tokens could change in the future.
class ParticipantToken {
  /// Application-provided attributes to encode into the token and attach to a
  /// stage. <i>This field is exposed to all stage participants and should not be
  /// used for personally identifying, confidential, or sensitive information.</i>
  final Map<String, String>? attributes;

  /// Set of capabilities that the user is allowed to perform in the stage.
  final List<ParticipantTokenCapability>? capabilities;

  /// Duration (in minutes), after which the participant token expires. Default:
  /// 720 (12 hours).
  final int? duration;

  /// ISO 8601 timestamp (returned as a string) for when this token expires.
  final DateTime? expirationTime;

  /// Unique identifier for this participant token, assigned by IVS.
  final String? participantId;

  /// The issued client token, encrypted.
  final String? token;

  /// Customer-assigned name to help identify the token; this can be used to link
  /// a participant to a user in the customer’s own systems. This can be any UTF-8
  /// encoded text. <i>This field is exposed to all stage participants and should
  /// not be used for personally identifying, confidential, or sensitive
  /// information.</i>
  final String? userId;

  ParticipantToken({
    this.attributes,
    this.capabilities,
    this.duration,
    this.expirationTime,
    this.participantId,
    this.token,
    this.userId,
  });

  factory ParticipantToken.fromJson(Map<String, dynamic> json) {
    return ParticipantToken(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      capabilities: (json['capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toParticipantTokenCapability())
          .toList(),
      duration: json['duration'] as int?,
      expirationTime: timeStampFromJson(json['expirationTime']),
      participantId: json['participantId'] as String?,
      token: json['token'] as String?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final capabilities = this.capabilities;
    final duration = this.duration;
    final expirationTime = this.expirationTime;
    final participantId = this.participantId;
    final token = this.token;
    final userId = this.userId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (capabilities != null)
        'capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (duration != null) 'duration': duration,
      if (expirationTime != null)
        'expirationTime': iso8601ToJson(expirationTime),
      if (participantId != null) 'participantId': participantId,
      if (token != null) 'token': token,
      if (userId != null) 'userId': userId,
    };
  }
}

enum ParticipantTokenCapability {
  publish,
  subscribe,
}

extension ParticipantTokenCapabilityValueExtension
    on ParticipantTokenCapability {
  String toValue() {
    switch (this) {
      case ParticipantTokenCapability.publish:
        return 'PUBLISH';
      case ParticipantTokenCapability.subscribe:
        return 'SUBSCRIBE';
    }
  }
}

extension ParticipantTokenCapabilityFromString on String {
  ParticipantTokenCapability toParticipantTokenCapability() {
    switch (this) {
      case 'PUBLISH':
        return ParticipantTokenCapability.publish;
      case 'SUBSCRIBE':
        return ParticipantTokenCapability.subscribe;
    }
    throw Exception('$this is not known in enum ParticipantTokenCapability');
  }
}

/// Object specifying a participant token configuration in a stage.
class ParticipantTokenConfiguration {
  /// Application-provided attributes to encode into the corresponding participant
  /// token and attach to a stage. Map keys and values can contain UTF-8 encoded
  /// text. The maximum length of this field is 1 KB total. <i>This field is
  /// exposed to all stage participants and should not be used for personally
  /// identifying, confidential, or sensitive information.</i>
  final Map<String, String>? attributes;

  /// Set of capabilities that the user is allowed to perform in the stage.
  final List<ParticipantTokenCapability>? capabilities;

  /// Duration (in minutes), after which the corresponding participant token
  /// expires. Default: 720 (12 hours).
  final int? duration;

  /// Customer-assigned name to help identify the token; this can be used to link
  /// a participant to a user in the customer’s own systems. This can be any UTF-8
  /// encoded text. <i>This field is exposed to all stage participants and should
  /// not be used for personally identifying, confidential, or sensitive
  /// information.</i>
  final String? userId;

  ParticipantTokenConfiguration({
    this.attributes,
    this.capabilities,
    this.duration,
    this.userId,
  });

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final capabilities = this.capabilities;
    final duration = this.duration;
    final userId = this.userId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (capabilities != null)
        'capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (duration != null) 'duration': duration,
      if (userId != null) 'userId': userId,
    };
  }
}

enum PipBehavior {
  static,
  $dynamic,
}

extension PipBehaviorValueExtension on PipBehavior {
  String toValue() {
    switch (this) {
      case PipBehavior.static:
        return 'STATIC';
      case PipBehavior.$dynamic:
        return 'DYNAMIC';
    }
  }
}

extension PipBehaviorFromString on String {
  PipBehavior toPipBehavior() {
    switch (this) {
      case 'STATIC':
        return PipBehavior.static;
      case 'DYNAMIC':
        return PipBehavior.$dynamic;
    }
    throw Exception('$this is not known in enum PipBehavior');
  }
}

/// Configuration information specific to Picture-in-Picture (PiP) layout, for
/// <a
/// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/server-side-composition.html">server-side
/// composition</a>.
class PipConfiguration {
  /// This attribute name identifies the featured slot. A participant with this
  /// attribute set to <code>"true"</code> (as a string value) in
  /// <a>ParticipantTokenConfiguration</a> is placed in the featured slot.
  final String? featuredParticipantAttribute;

  /// Specifies the spacing between participant tiles in pixels. Default:
  /// <code>0</code>.
  final int? gridGap;

  /// Determines whether to omit participants with stopped video in the
  /// composition. Default: <code>false</code>.
  final bool? omitStoppedVideo;

  /// Defines PiP behavior when all participants have left. Default:
  /// <code>STATIC</code>.
  final PipBehavior? pipBehavior;

  /// Specifies the height of the PiP window in pixels. When this is not set
  /// explicitly, <code>pipHeight</code>’s value will be based on the size of the
  /// composition and the aspect ratio of the participant’s video.
  final int? pipHeight;

  /// Sets the PiP window’s offset position in pixels from the closest edges
  /// determined by <code>PipPosition</code>. Default: <code>0</code>.
  final int? pipOffset;

  /// Identifies the PiP slot. A participant with this attribute set to
  /// <code>"true"</code> (as a string value) in
  /// <a>ParticipantTokenConfiguration</a> is placed in the PiP slot.
  final String? pipParticipantAttribute;

  /// Determines the corner position of the PiP window. Default:
  /// <code>BOTTOM_RIGHT</code>.
  final PipPosition? pipPosition;

  /// Specifies the width of the PiP window in pixels. When this is not set
  /// explicitly, <code>pipWidth</code>’s value will be based on the size of the
  /// composition and the aspect ratio of the participant’s video.
  final int? pipWidth;

  /// Defines how video fits within the participant tile. Default:
  /// <code>COVER</code>.
  final VideoFillMode? videoFillMode;

  PipConfiguration({
    this.featuredParticipantAttribute,
    this.gridGap,
    this.omitStoppedVideo,
    this.pipBehavior,
    this.pipHeight,
    this.pipOffset,
    this.pipParticipantAttribute,
    this.pipPosition,
    this.pipWidth,
    this.videoFillMode,
  });

  factory PipConfiguration.fromJson(Map<String, dynamic> json) {
    return PipConfiguration(
      featuredParticipantAttribute:
          json['featuredParticipantAttribute'] as String?,
      gridGap: json['gridGap'] as int?,
      omitStoppedVideo: json['omitStoppedVideo'] as bool?,
      pipBehavior: (json['pipBehavior'] as String?)?.toPipBehavior(),
      pipHeight: json['pipHeight'] as int?,
      pipOffset: json['pipOffset'] as int?,
      pipParticipantAttribute: json['pipParticipantAttribute'] as String?,
      pipPosition: (json['pipPosition'] as String?)?.toPipPosition(),
      pipWidth: json['pipWidth'] as int?,
      videoFillMode: (json['videoFillMode'] as String?)?.toVideoFillMode(),
    );
  }

  Map<String, dynamic> toJson() {
    final featuredParticipantAttribute = this.featuredParticipantAttribute;
    final gridGap = this.gridGap;
    final omitStoppedVideo = this.omitStoppedVideo;
    final pipBehavior = this.pipBehavior;
    final pipHeight = this.pipHeight;
    final pipOffset = this.pipOffset;
    final pipParticipantAttribute = this.pipParticipantAttribute;
    final pipPosition = this.pipPosition;
    final pipWidth = this.pipWidth;
    final videoFillMode = this.videoFillMode;
    return {
      if (featuredParticipantAttribute != null)
        'featuredParticipantAttribute': featuredParticipantAttribute,
      if (gridGap != null) 'gridGap': gridGap,
      if (omitStoppedVideo != null) 'omitStoppedVideo': omitStoppedVideo,
      if (pipBehavior != null) 'pipBehavior': pipBehavior.toValue(),
      if (pipHeight != null) 'pipHeight': pipHeight,
      if (pipOffset != null) 'pipOffset': pipOffset,
      if (pipParticipantAttribute != null)
        'pipParticipantAttribute': pipParticipantAttribute,
      if (pipPosition != null) 'pipPosition': pipPosition.toValue(),
      if (pipWidth != null) 'pipWidth': pipWidth,
      if (videoFillMode != null) 'videoFillMode': videoFillMode.toValue(),
    };
  }
}

enum PipPosition {
  topLeft,
  topRight,
  bottomLeft,
  bottomRight,
}

extension PipPositionValueExtension on PipPosition {
  String toValue() {
    switch (this) {
      case PipPosition.topLeft:
        return 'TOP_LEFT';
      case PipPosition.topRight:
        return 'TOP_RIGHT';
      case PipPosition.bottomLeft:
        return 'BOTTOM_LEFT';
      case PipPosition.bottomRight:
        return 'BOTTOM_RIGHT';
    }
  }
}

extension PipPositionFromString on String {
  PipPosition toPipPosition() {
    switch (this) {
      case 'TOP_LEFT':
        return PipPosition.topLeft;
      case 'TOP_RIGHT':
        return PipPosition.topRight;
      case 'BOTTOM_LEFT':
        return PipPosition.bottomLeft;
      case 'BOTTOM_RIGHT':
        return PipPosition.bottomRight;
    }
    throw Exception('$this is not known in enum PipPosition');
  }
}

/// An object representing a configuration to record a stage stream.
class RecordingConfiguration {
  /// The recording format for storing a recording in Amazon S3.
  final RecordingConfigurationFormat? format;

  RecordingConfiguration({
    this.format,
  });

  factory RecordingConfiguration.fromJson(Map<String, dynamic> json) {
    return RecordingConfiguration(
      format: (json['format'] as String?)?.toRecordingConfigurationFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    return {
      if (format != null) 'format': format.toValue(),
    };
  }
}

enum RecordingConfigurationFormat {
  hls,
}

extension RecordingConfigurationFormatValueExtension
    on RecordingConfigurationFormat {
  String toValue() {
    switch (this) {
      case RecordingConfigurationFormat.hls:
        return 'HLS';
    }
  }
}

extension RecordingConfigurationFormatFromString on String {
  RecordingConfigurationFormat toRecordingConfigurationFormat() {
    switch (this) {
      case 'HLS':
        return RecordingConfigurationFormat.hls;
    }
    throw Exception('$this is not known in enum RecordingConfigurationFormat');
  }
}

/// A complex type that describes an S3 location where recorded videos will be
/// stored.
class S3DestinationConfiguration {
  /// ARNs of the <a>EncoderConfiguration</a> resource. The encoder configuration
  /// and stage resources must be in the same AWS account and region.
  final List<String> encoderConfigurationArns;

  /// ARN of the <a>StorageConfiguration</a> where recorded videos will be stored.
  final String storageConfigurationArn;

  /// Array of maps, each of the form <code>string:string (key:value)</code>. This
  /// is an optional customer specification, currently used only to specify the
  /// recording format for storing a recording in Amazon S3.
  final RecordingConfiguration? recordingConfiguration;

  S3DestinationConfiguration({
    required this.encoderConfigurationArns,
    required this.storageConfigurationArn,
    this.recordingConfiguration,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      encoderConfigurationArns: (json['encoderConfigurationArns'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      storageConfigurationArn: json['storageConfigurationArn'] as String,
      recordingConfiguration: json['recordingConfiguration'] != null
          ? RecordingConfiguration.fromJson(
              json['recordingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final encoderConfigurationArns = this.encoderConfigurationArns;
    final storageConfigurationArn = this.storageConfigurationArn;
    final recordingConfiguration = this.recordingConfiguration;
    return {
      'encoderConfigurationArns': encoderConfigurationArns,
      'storageConfigurationArn': storageConfigurationArn,
      if (recordingConfiguration != null)
        'recordingConfiguration': recordingConfiguration,
    };
  }
}

/// Complex data type that defines S3Detail objects.
class S3Detail {
  /// The S3 bucket prefix under which the recording is stored.
  final String recordingPrefix;

  S3Detail({
    required this.recordingPrefix,
  });

  factory S3Detail.fromJson(Map<String, dynamic> json) {
    return S3Detail(
      recordingPrefix: json['recordingPrefix'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingPrefix = this.recordingPrefix;
    return {
      'recordingPrefix': recordingPrefix,
    };
  }
}

/// A complex type that describes an S3 location where recorded videos will be
/// stored.
class S3StorageConfiguration {
  /// Location (S3 bucket name) where recorded videos will be stored. Note that
  /// the StorageConfiguration and S3 bucket must be in the same region as the
  /// Composition.
  final String bucketName;

  S3StorageConfiguration({
    required this.bucketName,
  });

  factory S3StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return S3StorageConfiguration(
      bucketName: json['bucketName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
    };
  }
}

/// Object specifying a stage.
class Stage {
  /// Stage ARN.
  final String arn;

  /// ID of the active session within the stage.
  final String? activeSessionId;

  /// Stage name.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  Stage({
    required this.arn,
    this.activeSessionId,
    this.name,
    this.tags,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      arn: json['arn'] as String,
      activeSessionId: json['activeSessionId'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final activeSessionId = this.activeSessionId;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      if (activeSessionId != null) 'activeSessionId': activeSessionId,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// A stage session begins when the first participant joins a stage and ends
/// after the last participant leaves the stage. A stage session helps with
/// debugging stages by grouping events and participants into shorter periods of
/// time (i.e., a session), which is helpful when stages are used over long
/// periods of time.
class StageSession {
  /// ISO 8601 timestamp (returned as a string) when the stage session ended. This
  /// is null if the stage is active.
  final DateTime? endTime;

  /// ID of the session within the stage.
  final String? sessionId;

  /// ISO 8601 timestamp (returned as a string) when this stage session began.
  final DateTime? startTime;

  StageSession({
    this.endTime,
    this.sessionId,
    this.startTime,
  });

  factory StageSession.fromJson(Map<String, dynamic> json) {
    return StageSession(
      endTime: timeStampFromJson(json['endTime']),
      sessionId: json['sessionId'] as String?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final sessionId = this.sessionId;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (sessionId != null) 'sessionId': sessionId,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Summary information about a stage session.
class StageSessionSummary {
  /// ISO 8601 timestamp (returned as a string) when the stage session ended. This
  /// is null if the stage is active.
  final DateTime? endTime;

  /// ID of the session within the stage.
  final String? sessionId;

  /// ISO 8601 timestamp (returned as a string) when this stage session began.
  final DateTime? startTime;

  StageSessionSummary({
    this.endTime,
    this.sessionId,
    this.startTime,
  });

  factory StageSessionSummary.fromJson(Map<String, dynamic> json) {
    return StageSessionSummary(
      endTime: timeStampFromJson(json['endTime']),
      sessionId: json['sessionId'] as String?,
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final sessionId = this.sessionId;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (sessionId != null) 'sessionId': sessionId,
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Summary information about a stage.
class StageSummary {
  /// Stage ARN.
  final String arn;

  /// ID of the active session within the stage.
  final String? activeSessionId;

  /// Stage name.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  StageSummary({
    required this.arn,
    this.activeSessionId,
    this.name,
    this.tags,
  });

  factory StageSummary.fromJson(Map<String, dynamic> json) {
    return StageSummary(
      arn: json['arn'] as String,
      activeSessionId: json['activeSessionId'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final activeSessionId = this.activeSessionId;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      if (activeSessionId != null) 'activeSessionId': activeSessionId,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class StartCompositionResponse {
  /// The Composition that was created.
  final Composition? composition;

  StartCompositionResponse({
    this.composition,
  });

  factory StartCompositionResponse.fromJson(Map<String, dynamic> json) {
    return StartCompositionResponse(
      composition: json['composition'] != null
          ? Composition.fromJson(json['composition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final composition = this.composition;
    return {
      if (composition != null) 'composition': composition,
    };
  }
}

class StopCompositionResponse {
  StopCompositionResponse();

  factory StopCompositionResponse.fromJson(Map<String, dynamic> _) {
    return StopCompositionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A complex type that describes a location where recorded videos will be
/// stored.
class StorageConfiguration {
  /// ARN of the storage configuration.
  final String arn;

  /// Name of the storage configuration.
  final String? name;

  /// An S3 destination configuration where recorded videos will be stored.
  final S3StorageConfiguration? s3;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  StorageConfiguration({
    required this.arn,
    this.name,
    this.s3,
    this.tags,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      arn: json['arn'] as String,
      name: json['name'] as String?,
      s3: json['s3'] != null
          ? S3StorageConfiguration.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final s3 = this.s3;
    final tags = this.tags;
    return {
      'arn': arn,
      if (name != null) 'name': name,
      if (s3 != null) 's3': s3,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary information about a storage configuration.
class StorageConfigurationSummary {
  /// ARN of the storage configuration.
  final String arn;

  /// Name of the storage configuration.
  final String? name;

  /// An S3 destination configuration where recorded videos will be stored.
  final S3StorageConfiguration? s3;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/general/latest/gr/aws_tagging.html">Tagging
  /// AWS Resources</a> for details, including restrictions that apply to tags and
  /// "Tag naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  final Map<String, String>? tags;

  StorageConfigurationSummary({
    required this.arn,
    this.name,
    this.s3,
    this.tags,
  });

  factory StorageConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return StorageConfigurationSummary(
      arn: json['arn'] as String,
      name: json['name'] as String?,
      s3: json['s3'] != null
          ? S3StorageConfiguration.fromJson(json['s3'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    final s3 = this.s3;
    final tags = this.tags;
    return {
      'arn': arn,
      if (name != null) 'name': name,
      if (s3 != null) 's3': s3,
      if (tags != null) 'tags': tags,
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

class UpdateStageResponse {
  /// The updated stage.
  final Stage? stage;

  UpdateStageResponse({
    this.stage,
  });

  factory UpdateStageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateStageResponse(
      stage: json['stage'] != null
          ? Stage.fromJson(json['stage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final stage = this.stage;
    return {
      if (stage != null) 'stage': stage,
    };
  }
}

/// Settings for video.
class Video {
  /// Bitrate for generated output, in bps. Default: 2500000.
  final int? bitrate;

  /// Video frame rate, in fps. Default: 30.
  final double? framerate;

  /// Video-resolution height. Note that the maximum value is determined by
  /// <code>width</code> times <code>height</code>, such that the maximum total
  /// pixels is 2073600 (1920x1080 or 1080x1920). Default: 720.
  final int? height;

  /// Video-resolution width. Note that the maximum value is determined by
  /// <code>width</code> times <code>height</code>, such that the maximum total
  /// pixels is 2073600 (1920x1080 or 1080x1920). Default: 1280.
  final int? width;

  Video({
    this.bitrate,
    this.framerate,
    this.height,
    this.width,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      bitrate: json['bitrate'] as int?,
      framerate: json['framerate'] as double?,
      height: json['height'] as int?,
      width: json['width'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final bitrate = this.bitrate;
    final framerate = this.framerate;
    final height = this.height;
    final width = this.width;
    return {
      if (bitrate != null) 'bitrate': bitrate,
      if (framerate != null) 'framerate': framerate,
      if (height != null) 'height': height,
      if (width != null) 'width': width,
    };
  }
}

enum VideoAspectRatio {
  auto,
  video,
  square,
  portrait,
}

extension VideoAspectRatioValueExtension on VideoAspectRatio {
  String toValue() {
    switch (this) {
      case VideoAspectRatio.auto:
        return 'AUTO';
      case VideoAspectRatio.video:
        return 'VIDEO';
      case VideoAspectRatio.square:
        return 'SQUARE';
      case VideoAspectRatio.portrait:
        return 'PORTRAIT';
    }
  }
}

extension VideoAspectRatioFromString on String {
  VideoAspectRatio toVideoAspectRatio() {
    switch (this) {
      case 'AUTO':
        return VideoAspectRatio.auto;
      case 'VIDEO':
        return VideoAspectRatio.video;
      case 'SQUARE':
        return VideoAspectRatio.square;
      case 'PORTRAIT':
        return VideoAspectRatio.portrait;
    }
    throw Exception('$this is not known in enum VideoAspectRatio');
  }
}

enum VideoFillMode {
  fill,
  cover,
  contain,
}

extension VideoFillModeValueExtension on VideoFillMode {
  String toValue() {
    switch (this) {
      case VideoFillMode.fill:
        return 'FILL';
      case VideoFillMode.cover:
        return 'COVER';
      case VideoFillMode.contain:
        return 'CONTAIN';
    }
  }
}

extension VideoFillModeFromString on String {
  VideoFillMode toVideoFillMode() {
    switch (this) {
      case 'FILL':
        return VideoFillMode.fill;
      case 'COVER':
        return VideoFillMode.cover;
      case 'CONTAIN':
        return VideoFillMode.contain;
    }
    throw Exception('$this is not known in enum VideoFillMode');
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

class PendingVerification extends _s.GenericAwsException {
  PendingVerification({String? type, String? message})
      : super(type: type, code: 'PendingVerification', message: message);
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
  'PendingVerification': (type, message) =>
      PendingVerification(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
