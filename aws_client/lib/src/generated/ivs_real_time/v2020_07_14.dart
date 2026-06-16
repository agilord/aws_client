// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
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

/// The Amazon Interactive Video Service (IVS) real-time API is REST compatible,
/// using a standard HTTP API and an AWS EventBridge event stream for responses.
/// JSON is used for both requests and responses, including errors.
///
/// <b>Key Concepts</b>
///
/// <ul>
/// <li>
/// <b>Stage</b> — A virtual space where participants can exchange video in real
/// time.
/// </li>
/// <li>
/// <b>Participant token</b> — A token that authenticates a participant when
/// they join a stage.
/// </li>
/// <li>
/// <b>Participant object</b> — Represents participants (people) in the stage
/// and contains information about them. When a token is created, it includes a
/// participant ID; when a participant uses that token to join a stage, the
/// participant is associated with that participant ID. There is a 1:1 mapping
/// between participant tokens and participants.
/// </li>
/// </ul>
/// For server-side composition:
///
/// <ul>
/// <li>
/// <b>Composition process</b> — Composites participants of a stage into a
/// single video and forwards it to a set of outputs (e.g., IVS channels).
/// Composition operations support this process.
/// </li>
/// <li>
/// <b>Composition</b> — Controls the look of the outputs, including how
/// participants are positioned in the video.
/// </li>
/// </ul>
/// For participant replication:
///
/// <ul>
/// <li>
/// <b>Source stage</b> — The stage where the participant originally joined,
/// which is used as the source for replication.
/// </li>
/// <li>
/// <b>Destination stage</b> — The stage to which the participant is replicated.
/// </li>
/// <li>
/// <b>Replicated participant</b> — A participant in a stage that is replicated
/// to one or more destination stages.
/// </li>
/// <li>
/// <b>Replica participant</b> — A participant in a destination stage that is
/// replicated from another stage (the source stage).
/// </li>
/// </ul>
/// For more information about your IVS live stream, also see <a
/// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/getting-started.html">Getting
/// Started with Amazon IVS Real-Time Streaming</a>.
///
/// <b>Tagging</b>
///
/// A <i>tag</i> is a metadata label that you assign to an AWS resource. A tag
/// comprises a <i>key</i> and a <i>value</i>, both set by you. For example, you
/// might set a tag as <code>topic:nature</code> to label a particular video
/// category. See <a
/// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
/// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
/// for details, including restrictions that apply to tags and "Tag naming
/// limits and requirements"; Amazon IVS stages has no service-specific
/// constraints beyond what is documented there.
///
/// Tags can help you identify and organize your AWS resources. For example, you
/// can use the same tag for different resources to indicate that they are
/// related. You can also use tags to manage access (see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/access_tags.html">Access
/// Tags</a>).
///
/// The Amazon IVS real-time API has these tag-related operations:
/// <a>TagResource</a>, <a>UntagResource</a>, and <a>ListTagsForResource</a>.
/// The following resource supports tagging: Stage.
///
/// At most 50 tags can be applied to a resource.
class IvsRealTime {
  final _s.RestJsonProtocol _protocol;
  IvsRealTime({
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Optional name to identify the resource.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
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

  /// Creates a new IngestConfiguration resource, used to specify the ingest
  /// protocol for a stage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [ingestProtocol] :
  /// Type of ingest protocol that the user employs to broadcast. If this is set
  /// to <code>RTMP</code>, <code>insecureIngest</code> must be set to
  /// <code>true</code>.
  ///
  /// Parameter [attributes] :
  /// Application-provided attributes to store in the IngestConfiguration and
  /// attach to a stage. Map keys and values can contain UTF-8 encoded text. The
  /// maximum length of this field is 1 KB total. <i>This field is exposed to
  /// all stage participants and should not be used for personally identifying,
  /// confidential, or sensitive information.</i>
  ///
  /// Parameter [insecureIngest] :
  /// Whether the stage allows insecure RTMP ingest. This must be set to
  /// <code>true</code>, if <code>ingestProtocol</code> is set to
  /// <code>RTMP</code>. Default: <code>false</code>.
  ///
  /// Parameter [name] :
  /// Optional name that can be specified for the IngestConfiguration being
  /// created.
  ///
  /// Parameter [redundantIngest] :
  /// Indicates whether redundant ingest is enabled for the ingest
  /// configuration. Default: <code>false</code>.
  ///
  /// Parameter [stageArn] :
  /// ARN of the stage with which the IngestConfiguration is associated.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  ///
  /// Parameter [userId] :
  /// Customer-assigned name to help identify the participant using the
  /// IngestConfiguration; this can be used to link a participant to a user in
  /// the customer’s own systems. This can be any UTF-8 encoded text. <i>This
  /// field is exposed to all stage participants and should not be used for
  /// personally identifying, confidential, or sensitive information.</i>
  Future<CreateIngestConfigurationResponse> createIngestConfiguration({
    required IngestProtocol ingestProtocol,
    Map<String, String>? attributes,
    bool? insecureIngest,
    String? name,
    bool? redundantIngest,
    String? stageArn,
    Map<String, String>? tags,
    String? userId,
  }) async {
    final $payload = <String, dynamic>{
      'ingestProtocol': ingestProtocol.value,
      if (attributes != null) 'attributes': attributes,
      if (insecureIngest != null) 'insecureIngest': insecureIngest,
      if (name != null) 'name': name,
      if (redundantIngest != null) 'redundantIngest': redundantIngest,
      if (stageArn != null) 'stageArn': stageArn,
      if (tags != null) 'tags': tags,
      if (userId != null) 'userId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateIngestConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return CreateIngestConfigurationResponse.fromJson(response);
  }

  /// Creates an additional token for a specified stage. This can be done after
  /// stage creation or when tokens expire. Tokens always are scoped to the
  /// stage for which they are created.
  ///
  /// Encryption keys are owned by Amazon IVS and never used directly by your
  /// application.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
        'capabilities': capabilities.map((e) => e.value).toList(),
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
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [autoParticipantRecordingConfiguration] :
  /// Configuration object for individual participant recording, to attach to
  /// the new stage.
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  Future<CreateStageResponse> createStage({
    AutoParticipantRecordingConfiguration?
        autoParticipantRecordingConfiguration,
    String? name,
    List<ParticipantTokenConfiguration>? participantTokenConfigurations,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (autoParticipantRecordingConfiguration != null)
        'autoParticipantRecordingConfiguration':
            autoParticipantRecordingConfiguration,
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Deletes a specified IngestConfiguration, so it can no longer be used to
  /// broadcast. An IngestConfiguration cannot be deleted if the publisher is
  /// actively streaming to a stage, unless <code>force</code> is set to
  /// <code>true</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the IngestConfiguration.
  ///
  /// Parameter [force] :
  /// Optional field to force deletion of the IngestConfiguration. If this is
  /// set to <code>true</code> when a participant is actively publishing, the
  /// participant is disconnected from the stage, followed by deletion of the
  /// IngestConfiguration. Default: <code>false</code>.
  Future<void> deleteIngestConfiguration({
    required String arn,
    bool? force,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (force != null) 'force': force,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteIngestConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified public key used to sign stage participant tokens.
  /// This invalidates future participant tokens generated using the key pair’s
  /// private key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the public key to be deleted.
  Future<void> deletePublicKey({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeletePublicKey',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Shuts down and deletes the specified stage (disconnecting all
  /// participants). This operation also removes the <code>stageArn</code> from
  /// the associated <a>IngestConfiguration</a>, if there are participants using
  /// the IngestConfiguration to publish to the stage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Disconnects a specified participant from a specified stage. If the
  /// participant is publishing using an <a>IngestConfiguration</a>,
  /// DisconnectParticipant also updates the <code>stageArn</code> in the
  /// IngestConfiguration to be an empty string.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [participantId] :
  /// Identifier of the participant to be disconnected. IVS assigns this; it is
  /// returned by <a>CreateParticipantToken</a> (for streams using WebRTC
  /// ingest) or <a>CreateIngestConfiguration</a> (for streams using RTMP
  /// ingest).
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Gets information about the specified IngestConfiguration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the ingest for which the information is to be retrieved.
  Future<GetIngestConfigurationResponse> getIngestConfiguration({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetIngestConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetIngestConfigurationResponse.fromJson(response);
  }

  /// Gets information about the specified participant token.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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

  /// Gets information for the specified public key.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the public key for which the information is to be retrieved.
  Future<GetPublicKeyResponse> getPublicKey({
    required String arn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetPublicKey',
      exceptionFnMap: _exceptionFns,
    );
    return GetPublicKeyResponse.fromJson(response);
  }

  /// Gets information for the specified stage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Import a public key to be used for signing stage participant tokens.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [publicKeyMaterial] :
  /// The content of the public key to be imported.
  ///
  /// Parameter [name] :
  /// Name of the public key to be imported.
  ///
  /// Parameter [tags] :
  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
  Future<ImportPublicKeyResponse> importPublicKey({
    required String publicKeyMaterial,
    String? name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'publicKeyMaterial': publicKeyMaterial,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ImportPublicKey',
      exceptionFnMap: _exceptionFns,
    );
    return ImportPublicKeyResponse.fromJson(response);
  }

  /// Gets summary information about all Compositions in your account, in the
  /// AWS region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Lists all IngestConfigurations in your account, in the AWS region where
  /// the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filterByStageArn] :
  /// Filters the response list to match the specified stage ARN. Only one
  /// filter (by stage ARN or by state) can be used at a time.
  ///
  /// Parameter [filterByState] :
  /// Filters the response list to match the specified state. Only one filter
  /// (by stage ARN or by state) can be used at a time.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first IngestConfiguration to retrieve. This is used for pagination;
  /// see the <code>nextToken</code> response field.
  Future<ListIngestConfigurationsResponse> listIngestConfigurations({
    String? filterByStageArn,
    IngestConfigurationState? filterByState,
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
      if (filterByStageArn != null) 'filterByStageArn': filterByStageArn,
      if (filterByState != null) 'filterByState': filterByState.value,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListIngestConfigurations',
      exceptionFnMap: _exceptionFns,
    );
    return ListIngestConfigurationsResponse.fromJson(response);
  }

  /// Lists events for a specified participant that occurred during a specified
  /// stage session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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

  /// Lists all the replicas for a participant from a source stage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [participantId] :
  /// Participant ID of the publisher that has been replicated. This is assigned
  /// by IVS and returned by <a>CreateParticipantToken</a> or the
  /// <code>jti</code> (JWT ID) used to <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/getting-started-distribute-tokens.html#getting-started-distribute-tokens-self-signed">create
  /// a self signed token</a>.
  ///
  /// Parameter [sourceStageArn] :
  /// ARN of the stage where the participant is publishing.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first participant to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListParticipantReplicasResponse> listParticipantReplicas({
    required String participantId,
    required String sourceStageArn,
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
      'participantId': participantId,
      'sourceStageArn': sourceStageArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListParticipantReplicas',
      exceptionFnMap: _exceptionFns,
    );
    return ListParticipantReplicasResponse.fromJson(response);
  }

  /// Lists all participants in a specified stage session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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
  /// <code>filterByPublished</code>, <code>filterByState</code>, or
  /// <code>filterByRecordingState</code> can be provided per request.
  ///
  /// Parameter [filterByRecordingState] :
  /// Filters the response list to only show participants with the specified
  /// recording state. Only one of <code>filterByUserId</code>,
  /// <code>filterByPublished</code>, <code>filterByState</code>, or
  /// <code>filterByRecordingState</code> can be provided per request.
  ///
  /// Parameter [filterByState] :
  /// Filters the response list to only show participants in the specified
  /// state. Only one of <code>filterByUserId</code>,
  /// <code>filterByPublished</code>, <code>filterByState</code>, or
  /// <code>filterByRecordingState</code> can be provided per request.
  ///
  /// Parameter [filterByUserId] :
  /// Filters the response list to match the specified user ID. Only one of
  /// <code>filterByUserId</code>, <code>filterByPublished</code>,
  /// <code>filterByState</code>, or <code>filterByRecordingState</code> can be
  /// provided per request. A <code>userId</code> is a customer-assigned name to
  /// help identify the token; this can be used to link a participant to a user
  /// in the customer’s own systems.
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
    ParticipantRecordingFilterByRecordingState? filterByRecordingState,
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
      if (filterByRecordingState != null)
        'filterByRecordingState': filterByRecordingState.value,
      if (filterByState != null) 'filterByState': filterByState.value,
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

  /// Gets summary information about all public keys in your account, in the AWS
  /// region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return. Default: 50.
  ///
  /// Parameter [nextToken] :
  /// The first public key to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
  Future<ListPublicKeysResponse> listPublicKeys({
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
      requestUri: '/ListPublicKeys',
      exceptionFnMap: _exceptionFns,
    );
    return ListPublicKeysResponse.fromJson(response);
  }

  /// Gets summary information about all stages in your account, in the AWS
  /// region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
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

  /// Gets all sessions for a specified stage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
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

  /// Gets summary information about all storage configurations in your account,
  /// in the AWS region where the API request is processed.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// A Composition is an ephemeral resource that exists after this operation
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
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
  /// beyond what is documented there.
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

  /// Starts replicating a publishing participant from a source stage to a
  /// destination stage.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationStageArn] :
  /// ARN of the stage to which the participant will be replicated.
  ///
  /// Parameter [participantId] :
  /// Participant ID of the publisher that will be replicated. This is assigned
  /// by IVS and returned by <a>CreateParticipantToken</a> or the
  /// <code>jti</code> (JWT ID) used to <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/getting-started-distribute-tokens.html#getting-started-distribute-tokens-self-signed">create
  /// a self signed token</a>.
  ///
  /// Parameter [sourceStageArn] :
  /// ARN of the stage where the participant is publishing.
  ///
  /// Parameter [attributes] :
  /// Application-provided attributes to set on the replicated participant in
  /// the destination stage. Map keys and values can contain UTF-8 encoded text.
  /// The maximum length of this field is 1 KB total. <i>This field is exposed
  /// to all stage participants and should not be used for personally
  /// identifying, confidential, or sensitive information.</i>
  ///
  /// These attributes are merged with any attributes set for this participant
  /// when creating the token. If there is overlap in keys, the values in these
  /// attributes are replaced.
  ///
  /// Parameter [reconnectWindowSeconds] :
  /// If the participant disconnects and then reconnects within the specified
  /// interval, replication will continue to be <code>ACTIVE</code>. Default: 0.
  Future<StartParticipantReplicationResponse> startParticipantReplication({
    required String destinationStageArn,
    required String participantId,
    required String sourceStageArn,
    Map<String, String>? attributes,
    int? reconnectWindowSeconds,
  }) async {
    _s.validateNumRange(
      'reconnectWindowSeconds',
      reconnectWindowSeconds,
      0,
      300,
    );
    final $payload = <String, dynamic>{
      'destinationStageArn': destinationStageArn,
      'participantId': participantId,
      'sourceStageArn': sourceStageArn,
      if (attributes != null) 'attributes': attributes,
      if (reconnectWindowSeconds != null)
        'reconnectWindowSeconds': reconnectWindowSeconds,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartParticipantReplication',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StartParticipantReplicationResponse(
      accessControlAllowOrigin: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Allow-Origin'),
      accessControlExposeHeaders: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Expose-Headers'),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentSecurityPolicy: _s.extractHeaderStringValue(
          response.headers, 'Content-Security-Policy'),
      strictTransportSecurity: _s.extractHeaderStringValue(
          response.headers, 'Strict-Transport-Security'),
      xContentTypeOptions: _s.extractHeaderStringValue(
          response.headers, 'X-Content-Type-Options'),
      xFrameOptions:
          _s.extractHeaderStringValue(response.headers, 'X-Frame-Options'),
    );
  }

  /// Stops and deletes a Composition resource. Any broadcast from the
  /// Composition resource is stopped.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
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

  /// Stops a replicated participant session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [destinationStageArn] :
  /// ARN of the stage where the participant has been replicated.
  ///
  /// Parameter [participantId] :
  /// Participant ID of the publisher that has been replicated. This is assigned
  /// by IVS and returned by <a>CreateParticipantToken</a> or the
  /// <code>jti</code> (JWT ID) used to <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/getting-started-distribute-tokens.html#getting-started-distribute-tokens-self-signed">
  /// create a self signed token</a>.
  ///
  /// Parameter [sourceStageArn] :
  /// ARN of the stage where the participant is publishing.
  Future<StopParticipantReplicationResponse> stopParticipantReplication({
    required String destinationStageArn,
    required String participantId,
    required String sourceStageArn,
  }) async {
    final $payload = <String, dynamic>{
      'destinationStageArn': destinationStageArn,
      'participantId': participantId,
      'sourceStageArn': sourceStageArn,
    };
    final response = await _protocol.sendRaw(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopParticipantReplication',
      exceptionFnMap: _exceptionFns,
    );
    final $json = await _s.jsonFromResponse(response);
    return StopParticipantReplicationResponse(
      accessControlAllowOrigin: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Allow-Origin'),
      accessControlExposeHeaders: _s.extractHeaderStringValue(
          response.headers, 'Access-Control-Expose-Headers'),
      cacheControl:
          _s.extractHeaderStringValue(response.headers, 'Cache-Control'),
      contentSecurityPolicy: _s.extractHeaderStringValue(
          response.headers, 'Content-Security-Policy'),
      strictTransportSecurity: _s.extractHeaderStringValue(
          response.headers, 'Strict-Transport-Security'),
      xContentTypeOptions: _s.extractHeaderStringValue(
          response.headers, 'X-Content-Type-Options'),
      xFrameOptions:
          _s.extractHeaderStringValue(response.headers, 'X-Frame-Options'),
    );
  }

  /// Adds or updates tags for the AWS resource with the specified ARN.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be tagged. The ARN must be URL-encoded.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to be untagged. The ARN must be URL-encoded.
  ///
  /// Parameter [tagKeys] :
  /// Array of tag keys (strings) for the tags to be removed. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag
  /// Editor</i> for details, including restrictions that apply to tags and "Tag
  /// naming limits and requirements"; Amazon IVS has no constraints on tags
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

  /// Updates a specified IngestConfiguration. Only the stage ARN attached to
  /// the IngestConfiguration can be updated. An IngestConfiguration that is
  /// active cannot be updated.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the IngestConfiguration, for which the related stage ARN needs to
  /// be updated.
  ///
  /// Parameter [redundantIngest] :
  /// Indicates whether redundant ingest is enabled for the ingest
  /// configuration. Default: <code>false</code>.
  ///
  /// Parameter [stageArn] :
  /// Stage ARN that needs to be updated.
  Future<UpdateIngestConfigurationResponse> updateIngestConfiguration({
    required String arn,
    bool? redundantIngest,
    String? stageArn,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (redundantIngest != null) 'redundantIngest': redundantIngest,
      if (stageArn != null) 'stageArn': stageArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateIngestConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIngestConfigurationResponse.fromJson(response);
  }

  /// Updates a stage’s configuration.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [PendingVerification].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ValidationException].
  ///
  /// Parameter [arn] :
  /// ARN of the stage to be updated.
  ///
  /// Parameter [autoParticipantRecordingConfiguration] :
  /// Configuration object for individual participant recording, to attach to
  /// the stage. Note that this cannot be updated while recording is active.
  ///
  /// Parameter [name] :
  /// Name of the stage to be updated.
  Future<UpdateStageResponse> updateStage({
    required String arn,
    AutoParticipantRecordingConfiguration?
        autoParticipantRecordingConfiguration,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'arn': arn,
      if (autoParticipantRecordingConfiguration != null)
        'autoParticipantRecordingConfiguration':
            autoParticipantRecordingConfiguration,
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

class CreateIngestConfigurationResponse {
  /// The IngestConfiguration that was created.
  final IngestConfiguration? ingestConfiguration;

  CreateIngestConfigurationResponse({
    this.ingestConfiguration,
  });

  factory CreateIngestConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateIngestConfigurationResponse(
      ingestConfiguration: json['ingestConfiguration'] != null
          ? IngestConfiguration.fromJson(
              json['ingestConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestConfiguration = this.ingestConfiguration;
    return {
      if (ingestConfiguration != null)
        'ingestConfiguration': ingestConfiguration,
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
          ?.nonNulls
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

class DeleteIngestConfigurationResponse {
  DeleteIngestConfigurationResponse();

  factory DeleteIngestConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteIngestConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeletePublicKeyResponse {
  DeletePublicKeyResponse();

  factory DeletePublicKeyResponse.fromJson(Map<String, dynamic> _) {
    return DeletePublicKeyResponse();
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

class DisconnectParticipantResponse {
  DisconnectParticipantResponse();

  factory DisconnectParticipantResponse.fromJson(Map<String, dynamic> _) {
    return DisconnectParticipantResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class GetIngestConfigurationResponse {
  /// The IngestConfiguration that was returned.
  final IngestConfiguration? ingestConfiguration;

  GetIngestConfigurationResponse({
    this.ingestConfiguration,
  });

  factory GetIngestConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetIngestConfigurationResponse(
      ingestConfiguration: json['ingestConfiguration'] != null
          ? IngestConfiguration.fromJson(
              json['ingestConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestConfiguration = this.ingestConfiguration;
    return {
      if (ingestConfiguration != null)
        'ingestConfiguration': ingestConfiguration,
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

class GetPublicKeyResponse {
  /// The public key that is returned.
  final PublicKey? publicKey;

  GetPublicKeyResponse({
    this.publicKey,
  });

  factory GetPublicKeyResponse.fromJson(Map<String, dynamic> json) {
    return GetPublicKeyResponse(
      publicKey: json['publicKey'] != null
          ? PublicKey.fromJson(json['publicKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final publicKey = this.publicKey;
    return {
      if (publicKey != null) 'publicKey': publicKey,
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

class ImportPublicKeyResponse {
  /// The public key that was imported.
  final PublicKey? publicKey;

  ImportPublicKeyResponse({
    this.publicKey,
  });

  factory ImportPublicKeyResponse.fromJson(Map<String, dynamic> json) {
    return ImportPublicKeyResponse(
      publicKey: json['publicKey'] != null
          ? PublicKey.fromJson(json['publicKey'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final publicKey = this.publicKey;
    return {
      if (publicKey != null) 'publicKey': publicKey,
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
      compositions: ((json['compositions'] as List?) ?? const [])
          .nonNulls
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
      encoderConfigurations: ((json['encoderConfigurations'] as List?) ??
              const [])
          .nonNulls
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

class ListIngestConfigurationsResponse {
  /// List of the matching ingest configurations (summary information only).
  final List<IngestConfigurationSummary> ingestConfigurations;

  /// If there are more IngestConfigurations than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListIngestConfigurationsResponse({
    required this.ingestConfigurations,
    this.nextToken,
  });

  factory ListIngestConfigurationsResponse.fromJson(Map<String, dynamic> json) {
    return ListIngestConfigurationsResponse(
      ingestConfigurations: ((json['ingestConfigurations'] as List?) ??
              const [])
          .nonNulls
          .map((e) =>
              IngestConfigurationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestConfigurations = this.ingestConfigurations;
    final nextToken = this.nextToken;
    return {
      'ingestConfigurations': ingestConfigurations,
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
      events: ((json['events'] as List?) ?? const [])
          .nonNulls
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

class ListParticipantReplicasResponse {
  /// List of all participant replicas.
  final List<ParticipantReplica> replicas;

  /// If there are more participants than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListParticipantReplicasResponse({
    required this.replicas,
    this.nextToken,
  });

  factory ListParticipantReplicasResponse.fromJson(Map<String, dynamic> json) {
    return ListParticipantReplicasResponse(
      replicas: ((json['replicas'] as List?) ?? const [])
          .nonNulls
          .map((e) => ParticipantReplica.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicas = this.replicas;
    final nextToken = this.nextToken;
    return {
      'replicas': replicas,
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
      participants: ((json['participants'] as List?) ?? const [])
          .nonNulls
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

class ListPublicKeysResponse {
  /// List of the matching public keys (summary information only).
  final List<PublicKeySummary> publicKeys;

  /// If there are more public keys than <code>maxResults</code>, use
  /// <code>nextToken</code> in the request to get the next set.
  final String? nextToken;

  ListPublicKeysResponse({
    required this.publicKeys,
    this.nextToken,
  });

  factory ListPublicKeysResponse.fromJson(Map<String, dynamic> json) {
    return ListPublicKeysResponse(
      publicKeys: ((json['publicKeys'] as List?) ?? const [])
          .nonNulls
          .map((e) => PublicKeySummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final publicKeys = this.publicKeys;
    final nextToken = this.nextToken;
    return {
      'publicKeys': publicKeys,
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
      stages: ((json['stages'] as List?) ?? const [])
          .nonNulls
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
      stageSessions: ((json['stageSessions'] as List?) ?? const [])
          .nonNulls
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
      storageConfigurations: ((json['storageConfigurations'] as List?) ??
              const [])
          .nonNulls
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
      tags:
          ((json['tags'] as Map<String, dynamic>?) ?? const <String, dynamic>{})
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

class StartParticipantReplicationResponse {
  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin">Access-Control-Allow-Origin</a>
  /// in the MDN Web Docs.
  final String? accessControlAllowOrigin;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers">Access-Control-Expose-Headers</a>
  /// in the MDN Web Docs.
  final String? accessControlExposeHeaders;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control">Cache-Control</a>
  /// in the MDN Web Docs.
  final String? cacheControl;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy">Content-Security-Policy</a>
  /// in the MDN Web Docs.
  final String? contentSecurityPolicy;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security">Strict-Transport-Security</a>
  /// in the MDN Web Docs.
  final String? strictTransportSecurity;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Content-Type-Options">X-Content-Type-Options</a>
  /// in the MDN Web Docs.
  final String? xContentTypeOptions;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options">X-Frame-Options</a>
  /// in the MDN Web Docs.
  final String? xFrameOptions;

  StartParticipantReplicationResponse({
    this.accessControlAllowOrigin,
    this.accessControlExposeHeaders,
    this.cacheControl,
    this.contentSecurityPolicy,
    this.strictTransportSecurity,
    this.xContentTypeOptions,
    this.xFrameOptions,
  });

  Map<String, dynamic> toJson() {
    final accessControlAllowOrigin = this.accessControlAllowOrigin;
    final accessControlExposeHeaders = this.accessControlExposeHeaders;
    final cacheControl = this.cacheControl;
    final contentSecurityPolicy = this.contentSecurityPolicy;
    final strictTransportSecurity = this.strictTransportSecurity;
    final xContentTypeOptions = this.xContentTypeOptions;
    final xFrameOptions = this.xFrameOptions;
    return {};
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

class StopParticipantReplicationResponse {
  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Allow-Origin">Access-Control-Allow-Origin</a>
  /// in the MDN Web Docs.
  final String? accessControlAllowOrigin;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Access-Control-Expose-Headers">Access-Control-Expose-Headers</a>
  /// in the MDN Web Docs.
  final String? accessControlExposeHeaders;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Cache-Control">Cache-Control</a>
  /// in the MDN Web Docs.
  final String? cacheControl;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy">Content-Security-Policy</a>
  /// in the MDN Web Docs.
  final String? contentSecurityPolicy;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Strict-Transport-Security">Strict-Transport-Security</a>
  /// in the MDN Web Docs.
  final String? strictTransportSecurity;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Content-Type-Options">X-Content-Type-Options</a>
  /// in the MDN Web Docs.
  final String? xContentTypeOptions;

  /// See <a
  /// href="https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/X-Frame-Options">X-Frame-Options</a>
  /// in the MDN Web Docs.
  final String? xFrameOptions;

  StopParticipantReplicationResponse({
    this.accessControlAllowOrigin,
    this.accessControlExposeHeaders,
    this.cacheControl,
    this.contentSecurityPolicy,
    this.strictTransportSecurity,
    this.xContentTypeOptions,
    this.xFrameOptions,
  });

  Map<String, dynamic> toJson() {
    final accessControlAllowOrigin = this.accessControlAllowOrigin;
    final accessControlExposeHeaders = this.accessControlExposeHeaders;
    final cacheControl = this.cacheControl;
    final contentSecurityPolicy = this.contentSecurityPolicy;
    final strictTransportSecurity = this.strictTransportSecurity;
    final xContentTypeOptions = this.xContentTypeOptions;
    final xFrameOptions = this.xFrameOptions;
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateIngestConfigurationResponse {
  /// The updated IngestConfiguration.
  final IngestConfiguration? ingestConfiguration;

  UpdateIngestConfigurationResponse({
    this.ingestConfiguration,
  });

  factory UpdateIngestConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateIngestConfigurationResponse(
      ingestConfiguration: json['ingestConfiguration'] != null
          ? IngestConfiguration.fromJson(
              json['ingestConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ingestConfiguration = this.ingestConfiguration;
    return {
      if (ingestConfiguration != null)
        'ingestConfiguration': ingestConfiguration,
    };
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

/// Object specifying a stage.
class Stage {
  /// Stage ARN.
  final String arn;

  /// ID of the active session within the stage.
  final String? activeSessionId;

  /// Configuration object for individual participant recording, attached to the
  /// stage.
  final AutoParticipantRecordingConfiguration?
      autoParticipantRecordingConfiguration;

  /// Summary information about various endpoints for a stage.
  final StageEndpoints? endpoints;

  /// Stage name.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  Stage({
    required this.arn,
    this.activeSessionId,
    this.autoParticipantRecordingConfiguration,
    this.endpoints,
    this.name,
    this.tags,
  });

  factory Stage.fromJson(Map<String, dynamic> json) {
    return Stage(
      arn: (json['arn'] as String?) ?? '',
      activeSessionId: json['activeSessionId'] as String?,
      autoParticipantRecordingConfiguration:
          json['autoParticipantRecordingConfiguration'] != null
              ? AutoParticipantRecordingConfiguration.fromJson(
                  json['autoParticipantRecordingConfiguration']
                      as Map<String, dynamic>)
              : null,
      endpoints: json['endpoints'] != null
          ? StageEndpoints.fromJson(json['endpoints'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final activeSessionId = this.activeSessionId;
    final autoParticipantRecordingConfiguration =
        this.autoParticipantRecordingConfiguration;
    final endpoints = this.endpoints;
    final name = this.name;
    final tags = this.tags;
    return {
      'arn': arn,
      if (activeSessionId != null) 'activeSessionId': activeSessionId,
      if (autoParticipantRecordingConfiguration != null)
        'autoParticipantRecordingConfiguration':
            autoParticipantRecordingConfiguration,
      if (endpoints != null) 'endpoints': endpoints,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Object specifying a configuration for individual participant recording.
class AutoParticipantRecordingConfiguration {
  /// ARN of the <a>StorageConfiguration</a> resource to use for individual
  /// participant recording. Default: <code>""</code> (empty string, no storage
  /// configuration is specified). Individual participant recording cannot be
  /// started unless a storage configuration is specified, when a <a>Stage</a> is
  /// created or updated. To disable individual participant recording, set this to
  /// <code>""</code>; other fields in this object will get reset to their
  /// defaults when sending <code>""</code>.
  final String storageConfigurationArn;

  /// HLS configuration object for individual participant recording.
  final ParticipantRecordingHlsConfiguration? hlsConfiguration;

  /// Types of media to be recorded. Default: <code>AUDIO_VIDEO</code>.
  final List<ParticipantRecordingMediaType>? mediaTypes;

  /// Optional field to disable replica participant recording. If this is set to
  /// <code>false</code> when a participant is a replica, replica participants are
  /// not recorded. Default: <code>true</code>.
  final bool? recordParticipantReplicas;

  /// If a stage publisher disconnects and then reconnects within the specified
  /// interval, the multiple recordings will be considered a single recording and
  /// merged together.
  ///
  /// The default value is 0, which disables merging.
  final int? recordingReconnectWindowSeconds;

  /// A complex type that allows you to enable/disable the recording of thumbnails
  /// for individual participant recording and modify the interval at which
  /// thumbnails are generated for the live session.
  final ParticipantThumbnailConfiguration? thumbnailConfiguration;

  AutoParticipantRecordingConfiguration({
    required this.storageConfigurationArn,
    this.hlsConfiguration,
    this.mediaTypes,
    this.recordParticipantReplicas,
    this.recordingReconnectWindowSeconds,
    this.thumbnailConfiguration,
  });

  factory AutoParticipantRecordingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AutoParticipantRecordingConfiguration(
      storageConfigurationArn:
          (json['storageConfigurationArn'] as String?) ?? '',
      hlsConfiguration: json['hlsConfiguration'] != null
          ? ParticipantRecordingHlsConfiguration.fromJson(
              json['hlsConfiguration'] as Map<String, dynamic>)
          : null,
      mediaTypes: (json['mediaTypes'] as List?)
          ?.nonNulls
          .map((e) => ParticipantRecordingMediaType.fromString((e as String)))
          .toList(),
      recordParticipantReplicas: json['recordParticipantReplicas'] as bool?,
      recordingReconnectWindowSeconds:
          json['recordingReconnectWindowSeconds'] as int?,
      thumbnailConfiguration: json['thumbnailConfiguration'] != null
          ? ParticipantThumbnailConfiguration.fromJson(
              json['thumbnailConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final storageConfigurationArn = this.storageConfigurationArn;
    final hlsConfiguration = this.hlsConfiguration;
    final mediaTypes = this.mediaTypes;
    final recordParticipantReplicas = this.recordParticipantReplicas;
    final recordingReconnectWindowSeconds =
        this.recordingReconnectWindowSeconds;
    final thumbnailConfiguration = this.thumbnailConfiguration;
    return {
      'storageConfigurationArn': storageConfigurationArn,
      if (hlsConfiguration != null) 'hlsConfiguration': hlsConfiguration,
      if (mediaTypes != null)
        'mediaTypes': mediaTypes.map((e) => e.value).toList(),
      if (recordParticipantReplicas != null)
        'recordParticipantReplicas': recordParticipantReplicas,
      if (recordingReconnectWindowSeconds != null)
        'recordingReconnectWindowSeconds': recordingReconnectWindowSeconds,
      if (thumbnailConfiguration != null)
        'thumbnailConfiguration': thumbnailConfiguration,
    };
  }
}

/// Summary information about various endpoints for a stage. We recommend that
/// you cache these values at stage creation; the values can be cached for up to
/// 14 days.
class StageEndpoints {
  /// Events endpoint.
  final String? events;

  /// The endpoint to be used for IVS real-time streaming using the RTMP protocol.
  final String? rtmp;

  /// The endpoint to be used for IVS real-time streaming using the RTMPS
  /// protocol.
  final String? rtmps;

  /// The endpoint to be used for IVS real-time streaming using the WHIP protocol.
  final String? whip;

  StageEndpoints({
    this.events,
    this.rtmp,
    this.rtmps,
    this.whip,
  });

  factory StageEndpoints.fromJson(Map<String, dynamic> json) {
    return StageEndpoints(
      events: json['events'] as String?,
      rtmp: json['rtmp'] as String?,
      rtmps: json['rtmps'] as String?,
      whip: json['whip'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final rtmp = this.rtmp;
    final rtmps = this.rtmps;
    final whip = this.whip;
    return {
      if (events != null) 'events': events,
      if (rtmp != null) 'rtmp': rtmp,
      if (rtmps != null) 'rtmps': rtmps,
      if (whip != null) 'whip': whip,
    };
  }
}

/// An object representing a configuration of thumbnails for recorded video from
/// an individual participant.
class ParticipantThumbnailConfiguration {
  /// Thumbnail recording mode. Default: <code>DISABLED</code>.
  final ThumbnailRecordingMode? recordingMode;

  /// Indicates the format in which thumbnails are recorded.
  /// <code>SEQUENTIAL</code> records all generated thumbnails in a serial manner,
  /// to the media/thumbnails/high directory. <code>LATEST</code> saves the latest
  /// thumbnail in media/latest_thumbnail/high/thumb.jpg and overwrites it at the
  /// interval specified by <code>targetIntervalSeconds</code>. You can enable
  /// both <code>SEQUENTIAL</code> and <code>LATEST</code>. Default:
  /// <code>SEQUENTIAL</code>.
  final List<ThumbnailStorageType>? storage;

  /// The targeted thumbnail-generation interval in seconds. This is configurable
  /// only if <code>recordingMode</code> is <code>INTERVAL</code>. Default: 60.
  final int? targetIntervalSeconds;

  ParticipantThumbnailConfiguration({
    this.recordingMode,
    this.storage,
    this.targetIntervalSeconds,
  });

  factory ParticipantThumbnailConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ParticipantThumbnailConfiguration(
      recordingMode: (json['recordingMode'] as String?)
          ?.let(ThumbnailRecordingMode.fromString),
      storage: (json['storage'] as List?)
          ?.nonNulls
          .map((e) => ThumbnailStorageType.fromString((e as String)))
          .toList(),
      targetIntervalSeconds: json['targetIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordingMode = this.recordingMode;
    final storage = this.storage;
    final targetIntervalSeconds = this.targetIntervalSeconds;
    return {
      if (recordingMode != null) 'recordingMode': recordingMode.value,
      if (storage != null) 'storage': storage.map((e) => e.value).toList(),
      if (targetIntervalSeconds != null)
        'targetIntervalSeconds': targetIntervalSeconds,
    };
  }
}

/// An object representing a configuration of participant HLS recordings for
/// individual participant recording.
class ParticipantRecordingHlsConfiguration {
  /// Defines the target duration for recorded segments generated when recording a
  /// stage participant. Segments may have durations longer than the specified
  /// value when needed to ensure each segment begins with a keyframe. Default: 6.
  final int? targetSegmentDurationSeconds;

  ParticipantRecordingHlsConfiguration({
    this.targetSegmentDurationSeconds,
  });

  factory ParticipantRecordingHlsConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ParticipantRecordingHlsConfiguration(
      targetSegmentDurationSeconds:
          json['targetSegmentDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetSegmentDurationSeconds = this.targetSegmentDurationSeconds;
    return {
      if (targetSegmentDurationSeconds != null)
        'targetSegmentDurationSeconds': targetSegmentDurationSeconds,
    };
  }
}

class ThumbnailRecordingMode {
  static const interval = ThumbnailRecordingMode._('INTERVAL');
  static const disabled = ThumbnailRecordingMode._('DISABLED');

  final String value;

  const ThumbnailRecordingMode._(this.value);

  static const values = [interval, disabled];

  static ThumbnailRecordingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ThumbnailRecordingMode._(value));

  @override
  bool operator ==(other) =>
      other is ThumbnailRecordingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ThumbnailStorageType {
  static const sequential = ThumbnailStorageType._('SEQUENTIAL');
  static const latest = ThumbnailStorageType._('LATEST');

  final String value;

  const ThumbnailStorageType._(this.value);

  static const values = [sequential, latest];

  static ThumbnailStorageType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ThumbnailStorageType._(value));

  @override
  bool operator ==(other) =>
      other is ThumbnailStorageType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ParticipantRecordingMediaType {
  static const audioVideo = ParticipantRecordingMediaType._('AUDIO_VIDEO');
  static const audioOnly = ParticipantRecordingMediaType._('AUDIO_ONLY');
  static const none = ParticipantRecordingMediaType._('NONE');

  final String value;

  const ParticipantRecordingMediaType._(this.value);

  static const values = [audioVideo, audioOnly, none];

  static ParticipantRecordingMediaType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantRecordingMediaType._(value));

  @override
  bool operator ==(other) =>
      other is ParticipantRecordingMediaType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object specifying an ingest configuration.
class IngestConfiguration {
  /// Ingest configuration ARN.
  final String arn;

  /// Type of ingest protocol that the user employs for broadcasting.
  final IngestProtocol ingestProtocol;

  /// ID of the participant within the stage.
  final String participantId;

  /// ARN of the stage with which the IngestConfiguration is associated.
  final String stageArn;

  /// State of the ingest configuration. It is <code>ACTIVE</code> if a publisher
  /// currently is publishing to the stage associated with the ingest
  /// configuration.
  final IngestConfigurationState state;

  /// Ingest-key value for the RTMP(S) protocol.
  final String streamKey;

  /// Application-provided attributes to to store in the IngestConfiguration and
  /// attach to a stage. Map keys and values can contain UTF-8 encoded text. The
  /// maximum length of this field is 1 KB total. <i>This field is exposed to all
  /// stage participants and should not be used for personally identifying,
  /// confidential, or sensitive information.</i>
  final Map<String, String>? attributes;

  /// Ingest name
  final String? name;

  /// Indicates whether redundant ingest is enabled for the ingest configuration.
  final bool? redundantIngest;

  /// A list of redundant ingest credentials, present only when
  /// <code>redundantIngest</code> is set to <code>true</code>. See <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/rt-rtmp-publishing.html#redundant-ingest">Redundant
  /// Ingest</a> in <i>IVS RTMP Publishing</i> for details.
  final List<RedundantIngestCredential>? redundantIngestCredentials;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  /// Customer-assigned name to help identify the participant using the
  /// IngestConfiguration; this can be used to link a participant to a user in the
  /// customer’s own systems. This can be any UTF-8 encoded text. <i>This field is
  /// exposed to all stage participants and should not be used for personally
  /// identifying, confidential, or sensitive information.</i>
  final String? userId;

  IngestConfiguration({
    required this.arn,
    required this.ingestProtocol,
    required this.participantId,
    required this.stageArn,
    required this.state,
    required this.streamKey,
    this.attributes,
    this.name,
    this.redundantIngest,
    this.redundantIngestCredentials,
    this.tags,
    this.userId,
  });

  factory IngestConfiguration.fromJson(Map<String, dynamic> json) {
    return IngestConfiguration(
      arn: (json['arn'] as String?) ?? '',
      ingestProtocol:
          IngestProtocol.fromString((json['ingestProtocol'] as String?) ?? ''),
      participantId: (json['participantId'] as String?) ?? '',
      stageArn: (json['stageArn'] as String?) ?? '',
      state:
          IngestConfigurationState.fromString((json['state'] as String?) ?? ''),
      streamKey: (json['streamKey'] as String?) ?? '',
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      name: json['name'] as String?,
      redundantIngest: json['redundantIngest'] as bool?,
      redundantIngestCredentials: (json['redundantIngestCredentials'] as List?)
          ?.nonNulls
          .map((e) =>
              RedundantIngestCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final ingestProtocol = this.ingestProtocol;
    final participantId = this.participantId;
    final stageArn = this.stageArn;
    final state = this.state;
    final streamKey = this.streamKey;
    final attributes = this.attributes;
    final name = this.name;
    final redundantIngest = this.redundantIngest;
    final redundantIngestCredentials = this.redundantIngestCredentials;
    final tags = this.tags;
    final userId = this.userId;
    return {
      'arn': arn,
      'ingestProtocol': ingestProtocol.value,
      'participantId': participantId,
      'stageArn': stageArn,
      'state': state.value,
      'streamKey': streamKey,
      if (attributes != null) 'attributes': attributes,
      if (name != null) 'name': name,
      if (redundantIngest != null) 'redundantIngest': redundantIngest,
      if (redundantIngestCredentials != null)
        'redundantIngestCredentials': redundantIngestCredentials,
      if (tags != null) 'tags': tags,
      if (userId != null) 'userId': userId,
    };
  }
}

class IngestProtocol {
  static const rtmp = IngestProtocol._('RTMP');
  static const rtmps = IngestProtocol._('RTMPS');

  final String value;

  const IngestProtocol._(this.value);

  static const values = [rtmp, rtmps];

  static IngestProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngestProtocol._(value));

  @override
  bool operator ==(other) => other is IngestProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class IngestConfigurationState {
  static const active = IngestConfigurationState._('ACTIVE');
  static const inactive = IngestConfigurationState._('INACTIVE');

  final String value;

  const IngestConfigurationState._(this.value);

  static const values = [active, inactive];

  static IngestConfigurationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => IngestConfigurationState._(value));

  @override
  bool operator ==(other) =>
      other is IngestConfigurationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An object representing a redundant ingest credential.
class RedundantIngestCredential {
  /// ID of the participant within the stage.
  final String? participantId;

  /// Ingest-key value.
  final String? streamKey;

  RedundantIngestCredential({
    this.participantId,
    this.streamKey,
  });

  factory RedundantIngestCredential.fromJson(Map<String, dynamic> json) {
    return RedundantIngestCredential(
      participantId: json['participantId'] as String?,
      streamKey: json['streamKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final participantId = this.participantId;
    final streamKey = this.streamKey;
    return {
      if (participantId != null) 'participantId': participantId,
      if (streamKey != null) 'streamKey': streamKey,
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
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
      arn: (json['arn'] as String?) ?? '',
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => Destination.fromJson(e as Map<String, dynamic>))
          .toList(),
      layout: LayoutConfiguration.fromJson(
          (json['layout'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      stageArn: (json['stageArn'] as String?) ?? '',
      state: CompositionState.fromString((json['state'] as String?) ?? ''),
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
      'state': state.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (tags != null) 'tags': tags,
    };
  }
}

class CompositionState {
  static const starting = CompositionState._('STARTING');
  static const active = CompositionState._('ACTIVE');
  static const stopping = CompositionState._('STOPPING');
  static const failed = CompositionState._('FAILED');
  static const stopped = CompositionState._('STOPPED');

  final String value;

  const CompositionState._(this.value);

  static const values = [starting, active, stopping, failed, stopped];

  static CompositionState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CompositionState._(value));

  @override
  bool operator ==(other) => other is CompositionState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          (json['configuration'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      id: (json['id'] as String?) ?? '',
      state: DestinationState.fromString((json['state'] as String?) ?? ''),
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
      'state': state.value,
      if (detail != null) 'detail': detail,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

class DestinationState {
  static const starting = DestinationState._('STARTING');
  static const active = DestinationState._('ACTIVE');
  static const stopping = DestinationState._('STOPPING');
  static const reconnecting = DestinationState._('RECONNECTING');
  static const failed = DestinationState._('FAILED');
  static const stopped = DestinationState._('STOPPED');

  final String value;

  const DestinationState._(this.value);

  static const values = [
    starting,
    active,
    stopping,
    reconnecting,
    failed,
    stopped
  ];

  static DestinationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DestinationState._(value));

  @override
  bool operator ==(other) => other is DestinationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

/// Complex data type that defines S3Detail objects.
class S3Detail {
  /// The S3 bucket prefix under which the recording is stored.
  final String recordingPrefix;

  S3Detail({
    required this.recordingPrefix,
  });

  factory S3Detail.fromJson(Map<String, dynamic> json) {
    return S3Detail(
      recordingPrefix: (json['recordingPrefix'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final recordingPrefix = this.recordingPrefix;
    return {
      'recordingPrefix': recordingPrefix,
    };
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
      channelArn: (json['channelArn'] as String?) ?? '',
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

  /// A complex type that allows you to enable/disable the recording of thumbnails
  /// for a <a>Composition</a> and modify the interval at which thumbnails are
  /// generated for the live session.
  final List<CompositionThumbnailConfiguration>? thumbnailConfigurations;

  S3DestinationConfiguration({
    required this.encoderConfigurationArns,
    required this.storageConfigurationArn,
    this.recordingConfiguration,
    this.thumbnailConfigurations,
  });

  factory S3DestinationConfiguration.fromJson(Map<String, dynamic> json) {
    return S3DestinationConfiguration(
      encoderConfigurationArns:
          ((json['encoderConfigurationArns'] as List?) ?? const [])
              .nonNulls
              .map((e) => e as String)
              .toList(),
      storageConfigurationArn:
          (json['storageConfigurationArn'] as String?) ?? '',
      recordingConfiguration: json['recordingConfiguration'] != null
          ? RecordingConfiguration.fromJson(
              json['recordingConfiguration'] as Map<String, dynamic>)
          : null,
      thumbnailConfigurations: (json['thumbnailConfigurations'] as List?)
          ?.nonNulls
          .map((e) => CompositionThumbnailConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final encoderConfigurationArns = this.encoderConfigurationArns;
    final storageConfigurationArn = this.storageConfigurationArn;
    final recordingConfiguration = this.recordingConfiguration;
    final thumbnailConfigurations = this.thumbnailConfigurations;
    return {
      'encoderConfigurationArns': encoderConfigurationArns,
      'storageConfigurationArn': storageConfigurationArn,
      if (recordingConfiguration != null)
        'recordingConfiguration': recordingConfiguration,
      if (thumbnailConfigurations != null)
        'thumbnailConfigurations': thumbnailConfigurations,
    };
  }
}

/// An object representing a configuration to record a stage stream.
class RecordingConfiguration {
  /// The recording format for storing a recording in Amazon S3.
  final RecordingConfigurationFormat? format;

  /// An HLS configuration object to return information about how the recording
  /// will be configured.
  final CompositionRecordingHlsConfiguration? hlsConfiguration;

  RecordingConfiguration({
    this.format,
    this.hlsConfiguration,
  });

  factory RecordingConfiguration.fromJson(Map<String, dynamic> json) {
    return RecordingConfiguration(
      format: (json['format'] as String?)
          ?.let(RecordingConfigurationFormat.fromString),
      hlsConfiguration: json['hlsConfiguration'] != null
          ? CompositionRecordingHlsConfiguration.fromJson(
              json['hlsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final format = this.format;
    final hlsConfiguration = this.hlsConfiguration;
    return {
      if (format != null) 'format': format.value,
      if (hlsConfiguration != null) 'hlsConfiguration': hlsConfiguration,
    };
  }
}

/// An object representing a configuration of thumbnails for recorded video for
/// a <a>Composition</a>.
class CompositionThumbnailConfiguration {
  /// Indicates the format in which thumbnails are recorded.
  /// <code>SEQUENTIAL</code> records all generated thumbnails in a serial manner,
  /// to the media/thumbnails/(width)x(height) directory, where (width) and
  /// (height) are the width and height of the thumbnail. <code>LATEST</code>
  /// saves the latest thumbnail in
  /// media/latest_thumbnail/(width)x(height)/thumb.jpg and overwrites it at the
  /// interval specified by <code>targetIntervalSeconds</code>. You can enable
  /// both <code>SEQUENTIAL</code> and <code>LATEST</code>. Default:
  /// <code>SEQUENTIAL</code>.
  final List<ThumbnailStorageType>? storage;

  /// The targeted thumbnail-generation interval in seconds. Default: 60.
  final int? targetIntervalSeconds;

  CompositionThumbnailConfiguration({
    this.storage,
    this.targetIntervalSeconds,
  });

  factory CompositionThumbnailConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CompositionThumbnailConfiguration(
      storage: (json['storage'] as List?)
          ?.nonNulls
          .map((e) => ThumbnailStorageType.fromString((e as String)))
          .toList(),
      targetIntervalSeconds: json['targetIntervalSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final storage = this.storage;
    final targetIntervalSeconds = this.targetIntervalSeconds;
    return {
      if (storage != null) 'storage': storage.map((e) => e.value).toList(),
      if (targetIntervalSeconds != null)
        'targetIntervalSeconds': targetIntervalSeconds,
    };
  }
}

/// An object representing a configuration of HLS recordings for server-side
/// composition.
class CompositionRecordingHlsConfiguration {
  /// Defines the target duration for recorded segments generated when using
  /// composite recording. Default: 2.
  final int? targetSegmentDurationSeconds;

  CompositionRecordingHlsConfiguration({
    this.targetSegmentDurationSeconds,
  });

  factory CompositionRecordingHlsConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CompositionRecordingHlsConfiguration(
      targetSegmentDurationSeconds:
          json['targetSegmentDurationSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final targetSegmentDurationSeconds = this.targetSegmentDurationSeconds;
    return {
      if (targetSegmentDurationSeconds != null)
        'targetSegmentDurationSeconds': targetSegmentDurationSeconds,
    };
  }
}

class RecordingConfigurationFormat {
  static const hls = RecordingConfigurationFormat._('HLS');

  final String value;

  const RecordingConfigurationFormat._(this.value);

  static const values = [hls];

  static RecordingConfigurationFormat fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RecordingConfigurationFormat._(value));

  @override
  bool operator ==(other) =>
      other is RecordingConfigurationFormat && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Configuration information specific to Grid layout, for server-side
/// composition. See "Layouts" in <a
/// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/server-side-composition.html">Server-Side
/// Composition</a>.
class GridConfiguration {
  /// This attribute name identifies the featured slot. A participant with this
  /// attribute set to <code>"true"</code> (as a string value) in
  /// <a>ParticipantTokenConfiguration</a> is placed in the featured slot.
  /// Default: <code>""</code> (no featured participant).
  final String? featuredParticipantAttribute;

  /// Specifies the spacing between participant tiles in pixels. Default:
  /// <code>2</code>.
  final int? gridGap;

  /// Determines whether to omit participants with stopped video in the
  /// composition. Default: <code>false</code>.
  final bool? omitStoppedVideo;

  /// Attribute name in <a>ParticipantTokenConfiguration</a> identifying the
  /// participant ordering key. Participants with
  /// <code>participantOrderAttribute</code> set to <code>""</code> or not
  /// specified are ordered based on their arrival time into the stage.
  final String? participantOrderAttribute;

  /// Sets the non-featured participant display mode, to control the aspect ratio
  /// of video tiles. <code>VIDEO</code> is 16:9, <code>SQUARE</code> is 1:1, and
  /// <code>PORTRAIT</code> is 3:4. Default: <code>VIDEO</code>.
  final VideoAspectRatio? videoAspectRatio;

  /// Defines how video content fits within the participant tile:
  /// <code>FILL</code> (stretched), <code>COVER</code> (cropped), or
  /// <code>CONTAIN</code> (letterboxed). When not set, <code>videoFillMode</code>
  /// defaults to <code>COVER</code> fill mode for participants in the grid and to
  /// <code>CONTAIN</code> fill mode for featured participants.
  final VideoFillMode? videoFillMode;

  GridConfiguration({
    this.featuredParticipantAttribute,
    this.gridGap,
    this.omitStoppedVideo,
    this.participantOrderAttribute,
    this.videoAspectRatio,
    this.videoFillMode,
  });

  factory GridConfiguration.fromJson(Map<String, dynamic> json) {
    return GridConfiguration(
      featuredParticipantAttribute:
          json['featuredParticipantAttribute'] as String?,
      gridGap: json['gridGap'] as int?,
      omitStoppedVideo: json['omitStoppedVideo'] as bool?,
      participantOrderAttribute: json['participantOrderAttribute'] as String?,
      videoAspectRatio: (json['videoAspectRatio'] as String?)
          ?.let(VideoAspectRatio.fromString),
      videoFillMode:
          (json['videoFillMode'] as String?)?.let(VideoFillMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final featuredParticipantAttribute = this.featuredParticipantAttribute;
    final gridGap = this.gridGap;
    final omitStoppedVideo = this.omitStoppedVideo;
    final participantOrderAttribute = this.participantOrderAttribute;
    final videoAspectRatio = this.videoAspectRatio;
    final videoFillMode = this.videoFillMode;
    return {
      if (featuredParticipantAttribute != null)
        'featuredParticipantAttribute': featuredParticipantAttribute,
      if (gridGap != null) 'gridGap': gridGap,
      if (omitStoppedVideo != null) 'omitStoppedVideo': omitStoppedVideo,
      if (participantOrderAttribute != null)
        'participantOrderAttribute': participantOrderAttribute,
      if (videoAspectRatio != null) 'videoAspectRatio': videoAspectRatio.value,
      if (videoFillMode != null) 'videoFillMode': videoFillMode.value,
    };
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
  /// Default: <code>""</code> (no featured participant).
  final String? featuredParticipantAttribute;

  /// Specifies the spacing between participant tiles in pixels. Default:
  /// <code>0</code>.
  final int? gridGap;

  /// Determines whether to omit participants with stopped video in the
  /// composition. Default: <code>false</code>.
  final bool? omitStoppedVideo;

  /// Attribute name in <a>ParticipantTokenConfiguration</a> identifying the
  /// participant ordering key. Participants with
  /// <code>participantOrderAttribute</code> set to <code>""</code> or not
  /// specified are ordered based on their arrival time into the stage.
  final String? participantOrderAttribute;

  /// Defines PiP behavior when all participants have left: <code>STATIC</code>
  /// (maintains original position/size) or <code>DYNAMIC</code> (expands to full
  /// composition). Default: <code>STATIC</code>.
  final PipBehavior? pipBehavior;

  /// Specifies the height of the PiP window in pixels. When this is not set
  /// explicitly, <code>pipHeight</code>’s value will be based on the size of the
  /// composition and the aspect ratio of the participant’s video.
  final int? pipHeight;

  /// Sets the PiP window’s offset position in pixels from the closest edges
  /// determined by <code>PipPosition</code>. Default: <code>0</code>.
  final int? pipOffset;

  /// Specifies the participant for the PiP window. A participant with this
  /// attribute set to <code>"true"</code> (as a string value) in
  /// <a>ParticipantTokenConfiguration</a> is placed in the PiP slot. Default:
  /// <code>""</code> (no PiP participant).
  final String? pipParticipantAttribute;

  /// Determines the corner position of the PiP window. Default:
  /// <code>BOTTOM_RIGHT</code>.
  final PipPosition? pipPosition;

  /// Specifies the width of the PiP window in pixels. When this is not set
  /// explicitly, <code>pipWidth</code>’s value will be based on the size of the
  /// composition and the aspect ratio of the participant’s video.
  final int? pipWidth;

  /// Defines how video content fits within the participant tile:
  /// <code>FILL</code> (stretched), <code>COVER</code> (cropped), or
  /// <code>CONTAIN</code> (letterboxed). Default: <code>COVER</code>.
  final VideoFillMode? videoFillMode;

  PipConfiguration({
    this.featuredParticipantAttribute,
    this.gridGap,
    this.omitStoppedVideo,
    this.participantOrderAttribute,
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
      participantOrderAttribute: json['participantOrderAttribute'] as String?,
      pipBehavior:
          (json['pipBehavior'] as String?)?.let(PipBehavior.fromString),
      pipHeight: json['pipHeight'] as int?,
      pipOffset: json['pipOffset'] as int?,
      pipParticipantAttribute: json['pipParticipantAttribute'] as String?,
      pipPosition:
          (json['pipPosition'] as String?)?.let(PipPosition.fromString),
      pipWidth: json['pipWidth'] as int?,
      videoFillMode:
          (json['videoFillMode'] as String?)?.let(VideoFillMode.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final featuredParticipantAttribute = this.featuredParticipantAttribute;
    final gridGap = this.gridGap;
    final omitStoppedVideo = this.omitStoppedVideo;
    final participantOrderAttribute = this.participantOrderAttribute;
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
      if (participantOrderAttribute != null)
        'participantOrderAttribute': participantOrderAttribute,
      if (pipBehavior != null) 'pipBehavior': pipBehavior.value,
      if (pipHeight != null) 'pipHeight': pipHeight,
      if (pipOffset != null) 'pipOffset': pipOffset,
      if (pipParticipantAttribute != null)
        'pipParticipantAttribute': pipParticipantAttribute,
      if (pipPosition != null) 'pipPosition': pipPosition.value,
      if (pipWidth != null) 'pipWidth': pipWidth,
      if (videoFillMode != null) 'videoFillMode': videoFillMode.value,
    };
  }
}

class VideoFillMode {
  static const fill = VideoFillMode._('FILL');
  static const cover = VideoFillMode._('COVER');
  static const contain = VideoFillMode._('CONTAIN');

  final String value;

  const VideoFillMode._(this.value);

  static const values = [fill, cover, contain];

  static VideoFillMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VideoFillMode._(value));

  @override
  bool operator ==(other) => other is VideoFillMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PipBehavior {
  static const static = PipBehavior._('STATIC');
  static const $dynamic = PipBehavior._('DYNAMIC');

  final String value;

  const PipBehavior._(this.value);

  static const values = [static, $dynamic];

  static PipBehavior fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PipBehavior._(value));

  @override
  bool operator ==(other) => other is PipBehavior && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PipPosition {
  static const topLeft = PipPosition._('TOP_LEFT');
  static const topRight = PipPosition._('TOP_RIGHT');
  static const bottomLeft = PipPosition._('BOTTOM_LEFT');
  static const bottomRight = PipPosition._('BOTTOM_RIGHT');

  final String value;

  const PipPosition._(this.value);

  static const values = [topLeft, topRight, bottomLeft, bottomRight];

  static PipPosition fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => PipPosition._(value));

  @override
  bool operator ==(other) => other is PipPosition && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class VideoAspectRatio {
  static const auto = VideoAspectRatio._('AUTO');
  static const video = VideoAspectRatio._('VIDEO');
  static const square = VideoAspectRatio._('SQUARE');
  static const portrait = VideoAspectRatio._('PORTRAIT');

  final String value;

  const VideoAspectRatio._(this.value);

  static const values = [auto, video, square, portrait];

  static VideoAspectRatio fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VideoAspectRatio._(value));

  @override
  bool operator ==(other) => other is VideoAspectRatio && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  StorageConfigurationSummary({
    required this.arn,
    this.name,
    this.s3,
    this.tags,
  });

  factory StorageConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return StorageConfigurationSummary(
      arn: (json['arn'] as String?) ?? '',
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
      bucketName: (json['bucketName'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    return {
      'bucketName': bucketName,
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  StageSummary({
    required this.arn,
    this.activeSessionId,
    this.name,
    this.tags,
  });

  factory StageSummary.fromJson(Map<String, dynamic> json) {
    return StageSummary(
      arn: (json['arn'] as String?) ?? '',
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

/// Summary information about a public key.
class PublicKeySummary {
  /// Public key ARN.
  final String? arn;

  /// Public key name.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  PublicKeySummary({
    this.arn,
    this.name,
    this.tags,
  });

  factory PublicKeySummary.fromJson(Map<String, dynamic> json) {
    return PublicKeySummary(
      arn: json['arn'] as String?,
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
      if (arn != null) 'arn': arn,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Summary object describing a participant that has joined a stage.
class ParticipantSummary {
  /// ISO 8601 timestamp (returned as a string) when the participant first joined
  /// the stage session.
  final DateTime? firstJoinTime;

  /// The participant’s ingest configuration.
  final String? ingestConfigurationArn;

  /// Unique identifier for this participant, assigned by IVS.
  final String? participantId;

  /// Whether the participant ever published to the stage session.
  final bool? published;

  /// The participant’s recording state.
  final ParticipantRecordingState? recordingState;

  /// Indicates whether redundant ingest is enabled for the participant.
  final bool? redundantIngest;

  /// The participant's replication state.
  final ReplicationState? replicationState;

  /// Indicates if the participant has been replicated to another stage or is a
  /// replica from another stage. Default: <code>NONE</code>.
  final ReplicationType? replicationType;

  /// ID of the session within the source stage, if <code>replicationType</code>
  /// is <code>REPLICA</code>.
  final String? sourceSessionId;

  /// Source stage ARN from which this participant is replicated, if
  /// <code>replicationType</code> is <code>REPLICA</code>.
  final String? sourceStageArn;

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
    this.ingestConfigurationArn,
    this.participantId,
    this.published,
    this.recordingState,
    this.redundantIngest,
    this.replicationState,
    this.replicationType,
    this.sourceSessionId,
    this.sourceStageArn,
    this.state,
    this.userId,
  });

  factory ParticipantSummary.fromJson(Map<String, dynamic> json) {
    return ParticipantSummary(
      firstJoinTime: timeStampFromJson(json['firstJoinTime']),
      ingestConfigurationArn: json['ingestConfigurationArn'] as String?,
      participantId: json['participantId'] as String?,
      published: json['published'] as bool?,
      recordingState: (json['recordingState'] as String?)
          ?.let(ParticipantRecordingState.fromString),
      redundantIngest: json['redundantIngest'] as bool?,
      replicationState: (json['replicationState'] as String?)
          ?.let(ReplicationState.fromString),
      replicationType:
          (json['replicationType'] as String?)?.let(ReplicationType.fromString),
      sourceSessionId: json['sourceSessionId'] as String?,
      sourceStageArn: json['sourceStageArn'] as String?,
      state: (json['state'] as String?)?.let(ParticipantState.fromString),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final firstJoinTime = this.firstJoinTime;
    final ingestConfigurationArn = this.ingestConfigurationArn;
    final participantId = this.participantId;
    final published = this.published;
    final recordingState = this.recordingState;
    final redundantIngest = this.redundantIngest;
    final replicationState = this.replicationState;
    final replicationType = this.replicationType;
    final sourceSessionId = this.sourceSessionId;
    final sourceStageArn = this.sourceStageArn;
    final state = this.state;
    final userId = this.userId;
    return {
      if (firstJoinTime != null) 'firstJoinTime': iso8601ToJson(firstJoinTime),
      if (ingestConfigurationArn != null)
        'ingestConfigurationArn': ingestConfigurationArn,
      if (participantId != null) 'participantId': participantId,
      if (published != null) 'published': published,
      if (recordingState != null) 'recordingState': recordingState.value,
      if (redundantIngest != null) 'redundantIngest': redundantIngest,
      if (replicationState != null) 'replicationState': replicationState.value,
      if (replicationType != null) 'replicationType': replicationType.value,
      if (sourceSessionId != null) 'sourceSessionId': sourceSessionId,
      if (sourceStageArn != null) 'sourceStageArn': sourceStageArn,
      if (state != null) 'state': state.value,
      if (userId != null) 'userId': userId,
    };
  }
}

class ParticipantState {
  static const connected = ParticipantState._('CONNECTED');
  static const disconnected = ParticipantState._('DISCONNECTED');

  final String value;

  const ParticipantState._(this.value);

  static const values = [connected, disconnected];

  static ParticipantState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantState._(value));

  @override
  bool operator ==(other) => other is ParticipantState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ParticipantRecordingState {
  static const starting = ParticipantRecordingState._('STARTING');
  static const active = ParticipantRecordingState._('ACTIVE');
  static const stopping = ParticipantRecordingState._('STOPPING');
  static const stopped = ParticipantRecordingState._('STOPPED');
  static const failed = ParticipantRecordingState._('FAILED');
  static const disabled = ParticipantRecordingState._('DISABLED');

  final String value;

  const ParticipantRecordingState._(this.value);

  static const values = [starting, active, stopping, stopped, failed, disabled];

  static ParticipantRecordingState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantRecordingState._(value));

  @override
  bool operator ==(other) =>
      other is ParticipantRecordingState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationType {
  static const source = ReplicationType._('SOURCE');
  static const replica = ReplicationType._('REPLICA');
  static const none = ReplicationType._('NONE');

  final String value;

  const ReplicationType._(this.value);

  static const values = [source, replica, none];

  static ReplicationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationType._(value));

  @override
  bool operator ==(other) => other is ReplicationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationState {
  static const active = ReplicationState._('ACTIVE');
  static const stopped = ReplicationState._('STOPPED');

  final String value;

  const ReplicationState._(this.value);

  static const values = [active, stopped];

  static ReplicationState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationState._(value));

  @override
  bool operator ==(other) => other is ReplicationState && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ParticipantRecordingFilterByRecordingState {
  static const starting =
      ParticipantRecordingFilterByRecordingState._('STARTING');
  static const active = ParticipantRecordingFilterByRecordingState._('ACTIVE');
  static const stopping =
      ParticipantRecordingFilterByRecordingState._('STOPPING');
  static const stopped =
      ParticipantRecordingFilterByRecordingState._('STOPPED');
  static const failed = ParticipantRecordingFilterByRecordingState._('FAILED');

  final String value;

  const ParticipantRecordingFilterByRecordingState._(this.value);

  static const values = [starting, active, stopping, stopped, failed];

  static ParticipantRecordingFilterByRecordingState fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantRecordingFilterByRecordingState._(value));

  @override
  bool operator ==(other) =>
      other is ParticipantRecordingFilterByRecordingState &&
      other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about the replicated destination stage for a participant.
class ParticipantReplica {
  /// ID of the session within the destination stage.
  final String destinationSessionId;

  /// ARN of the stage where the participant is replicated.
  final String destinationStageArn;

  /// Participant ID of the publisher that will be replicated. This is assigned by
  /// IVS and returned by <a>CreateParticipantToken</a> or the <code>jti</code>
  /// (JWT ID) used to <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/getting-started-distribute-tokens.html#getting-started-distribute-tokens-self-signed">
  /// create a self signed token</a>.
  final String participantId;

  /// Replica’s current replication state.
  final ReplicationState replicationState;

  /// ID of the session within the source stage.
  final String sourceSessionId;

  /// ARN of the stage from which this participant is replicated.
  final String sourceStageArn;

  ParticipantReplica({
    required this.destinationSessionId,
    required this.destinationStageArn,
    required this.participantId,
    required this.replicationState,
    required this.sourceSessionId,
    required this.sourceStageArn,
  });

  factory ParticipantReplica.fromJson(Map<String, dynamic> json) {
    return ParticipantReplica(
      destinationSessionId: (json['destinationSessionId'] as String?) ?? '',
      destinationStageArn: (json['destinationStageArn'] as String?) ?? '',
      participantId: (json['participantId'] as String?) ?? '',
      replicationState: ReplicationState.fromString(
          (json['replicationState'] as String?) ?? ''),
      sourceSessionId: (json['sourceSessionId'] as String?) ?? '',
      sourceStageArn: (json['sourceStageArn'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final destinationSessionId = this.destinationSessionId;
    final destinationStageArn = this.destinationStageArn;
    final participantId = this.participantId;
    final replicationState = this.replicationState;
    final sourceSessionId = this.sourceSessionId;
    final sourceStageArn = this.sourceStageArn;
    return {
      'destinationSessionId': destinationSessionId,
      'destinationStageArn': destinationStageArn,
      'participantId': participantId,
      'replicationState': replicationState.value,
      'sourceSessionId': sourceSessionId,
      'sourceStageArn': sourceStageArn,
    };
  }
}

/// An occurrence during a stage session.
class Event {
  /// ID of the session within the destination stage. Applicable only if the event
  /// name is <code>REPLICATION_STARTED</code> or
  /// <code>REPLICATION_STOPPED</code>.
  final String? destinationSessionId;

  /// ARN of the stage where the participant is replicated. Applicable only if the
  /// event name is <code>REPLICATION_STARTED</code> or
  /// <code>REPLICATION_STOPPED</code>.
  final String? destinationStageArn;

  /// If the event is an error event, the error code is provided to give insight
  /// into the specific error that occurred. If the event is not an error event,
  /// this field is null.
  ///
  /// <ul>
  /// <li>
  /// <code>B_FRAME_PRESENT</code> — The participant's stream includes B-frames.
  /// For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/rt-rtmp-publishing.html">
  /// IVS RTMP Publishing</a>.
  /// </li>
  /// <li>
  /// <code>BITRATE_EXCEEDED</code> — The participant exceeded the maximum
  /// supported bitrate. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/service-quotas.html">
  /// Service Quotas</a>.
  /// </li>
  /// <li>
  /// <code>INSUFFICIENT_CAPABILITIES</code> — The participant tried to take an
  /// action that the participant’s token is not allowed to do. For details on
  /// participant capabilities, see the <code>capabilities</code> field in
  /// <a>CreateParticipantToken</a>.
  /// </li>
  /// <li>
  /// <code>INTERNAL_SERVER_EXCEPTION</code> — The participant failed to publish
  /// to the stage due to an internal server error.
  /// </li>
  /// <li>
  /// <code>INVALID_AUDIO_CODEC</code> — The participant is using an invalid audio
  /// codec. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/rt-stream-ingest.html">
  /// Stream Ingest</a>.
  /// </li>
  /// <li>
  /// <code>INVALID_INPUT</code> — The participant is using an invalid input
  /// stream.
  /// </li>
  /// <li>
  /// <code>INVALID_PROTOCOL</code> — The participant's IngestConfiguration
  /// resource is configured for RTMPS but they tried streaming with RTMP. For
  /// details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/rt-rtmp-publishing.html">
  /// IVS RTMP Publishing</a>.
  /// </li>
  /// <li>
  /// <code>INVALID_STREAM_KEY</code> — The participant is using an invalid stream
  /// key. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/rt-rtmp-publishing.html">
  /// IVS RTMP Publishing</a>.
  /// </li>
  /// <li>
  /// <code>INVALID_VIDEO_CODEC</code> — The participant is using an invalid video
  /// codec. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/rt-stream-ingest.html">
  /// Stream Ingest</a>.
  /// </li>
  /// <li>
  /// <code>PUBLISHER_NOT_FOUND</code> — The participant tried to subscribe to a
  /// publisher that doesn’t exist.
  /// </li>
  /// <li>
  /// <code>QUOTA_EXCEEDED</code> — The number of participants who want to
  /// publish/subscribe to a stage exceeds the quota. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/service-quotas.html">
  /// Service Quotas</a>.
  /// </li>
  /// <li>
  /// <code>RESOLUTION_EXCEEDED</code> — The participant exceeded the maximum
  /// supported resolution. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/service-quotas.html">
  /// Service Quotas</a>.
  /// </li>
  /// <li>
  /// <code>REUSE_OF_STREAM_KEY</code> — The participant tried to use a stream key
  /// that is associated with another active stage session.
  /// </li>
  /// <li>
  /// <code>STREAM_DURATION_EXCEEDED</code> — The participant exceeded the maximum
  /// allowed stream duration. For details, see <a
  /// href="https://docs.aws.amazon.com/ivs/latest/RealTimeUserGuide/service-quotas.html">
  /// Service Quotas</a>.
  /// </li>
  /// </ul>
  final EventErrorCode? errorCode;

  /// ISO 8601 timestamp (returned as a string) for when the event occurred.
  final DateTime? eventTime;

  /// The name of the event.
  final EventName? name;

  /// Participant token created during <code>TOKEN_EXCHANGED</code> event.
  final ExchangedParticipantToken? newToken;

  /// Unique identifier for the participant who triggered the event. This is
  /// assigned by IVS.
  final String? participantId;

  /// Source participant token for <code>TOKEN_EXCHANGED</code> event.
  final ExchangedParticipantToken? previousToken;

  /// Unique identifier for the remote participant. For a subscribe event, this is
  /// the publisher. For a publish or join event, this is null. This is assigned
  /// by IVS.
  final String? remoteParticipantId;

  /// If true, this indicates the <code>participantId</code> is a replicated
  /// participant. If this is a subscribe event, then this flag refers to
  /// <code>remoteParticipantId</code>. Default: <code>false</code>.
  final bool? replica;

  Event({
    this.destinationSessionId,
    this.destinationStageArn,
    this.errorCode,
    this.eventTime,
    this.name,
    this.newToken,
    this.participantId,
    this.previousToken,
    this.remoteParticipantId,
    this.replica,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      destinationSessionId: json['destinationSessionId'] as String?,
      destinationStageArn: json['destinationStageArn'] as String?,
      errorCode: (json['errorCode'] as String?)?.let(EventErrorCode.fromString),
      eventTime: timeStampFromJson(json['eventTime']),
      name: (json['name'] as String?)?.let(EventName.fromString),
      newToken: json['newToken'] != null
          ? ExchangedParticipantToken.fromJson(
              json['newToken'] as Map<String, dynamic>)
          : null,
      participantId: json['participantId'] as String?,
      previousToken: json['previousToken'] != null
          ? ExchangedParticipantToken.fromJson(
              json['previousToken'] as Map<String, dynamic>)
          : null,
      remoteParticipantId: json['remoteParticipantId'] as String?,
      replica: json['replica'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final destinationSessionId = this.destinationSessionId;
    final destinationStageArn = this.destinationStageArn;
    final errorCode = this.errorCode;
    final eventTime = this.eventTime;
    final name = this.name;
    final newToken = this.newToken;
    final participantId = this.participantId;
    final previousToken = this.previousToken;
    final remoteParticipantId = this.remoteParticipantId;
    final replica = this.replica;
    return {
      if (destinationSessionId != null)
        'destinationSessionId': destinationSessionId,
      if (destinationStageArn != null)
        'destinationStageArn': destinationStageArn,
      if (errorCode != null) 'errorCode': errorCode.value,
      if (eventTime != null) 'eventTime': iso8601ToJson(eventTime),
      if (name != null) 'name': name.value,
      if (newToken != null) 'newToken': newToken,
      if (participantId != null) 'participantId': participantId,
      if (previousToken != null) 'previousToken': previousToken,
      if (remoteParticipantId != null)
        'remoteParticipantId': remoteParticipantId,
      if (replica != null) 'replica': replica,
    };
  }
}

class EventName {
  static const joined = EventName._('JOINED');
  static const left = EventName._('LEFT');
  static const publishStarted = EventName._('PUBLISH_STARTED');
  static const publishStopped = EventName._('PUBLISH_STOPPED');
  static const subscribeStarted = EventName._('SUBSCRIBE_STARTED');
  static const subscribeStopped = EventName._('SUBSCRIBE_STOPPED');
  static const publishError = EventName._('PUBLISH_ERROR');
  static const subscribeError = EventName._('SUBSCRIBE_ERROR');
  static const joinError = EventName._('JOIN_ERROR');
  static const replicationStarted = EventName._('REPLICATION_STARTED');
  static const replicationStopped = EventName._('REPLICATION_STOPPED');
  static const tokenExchanged = EventName._('TOKEN_EXCHANGED');

  final String value;

  const EventName._(this.value);

  static const values = [
    joined,
    left,
    publishStarted,
    publishStopped,
    subscribeStarted,
    subscribeStopped,
    publishError,
    subscribeError,
    joinError,
    replicationStarted,
    replicationStopped,
    tokenExchanged
  ];

  static EventName fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EventName._(value));

  @override
  bool operator ==(other) => other is EventName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class EventErrorCode {
  static const insufficientCapabilities =
      EventErrorCode._('INSUFFICIENT_CAPABILITIES');
  static const quotaExceeded = EventErrorCode._('QUOTA_EXCEEDED');
  static const publisherNotFound = EventErrorCode._('PUBLISHER_NOT_FOUND');
  static const bitrateExceeded = EventErrorCode._('BITRATE_EXCEEDED');
  static const resolutionExceeded = EventErrorCode._('RESOLUTION_EXCEEDED');
  static const streamDurationExceeded =
      EventErrorCode._('STREAM_DURATION_EXCEEDED');
  static const invalidAudioCodec = EventErrorCode._('INVALID_AUDIO_CODEC');
  static const invalidVideoCodec = EventErrorCode._('INVALID_VIDEO_CODEC');
  static const invalidProtocol = EventErrorCode._('INVALID_PROTOCOL');
  static const invalidStreamKey = EventErrorCode._('INVALID_STREAM_KEY');
  static const reuseOfStreamKey = EventErrorCode._('REUSE_OF_STREAM_KEY');
  static const bFramePresent = EventErrorCode._('B_FRAME_PRESENT');
  static const invalidInput = EventErrorCode._('INVALID_INPUT');
  static const internalServerException =
      EventErrorCode._('INTERNAL_SERVER_EXCEPTION');

  final String value;

  const EventErrorCode._(this.value);

  static const values = [
    insufficientCapabilities,
    quotaExceeded,
    publisherNotFound,
    bitrateExceeded,
    resolutionExceeded,
    streamDurationExceeded,
    invalidAudioCodec,
    invalidVideoCodec,
    invalidProtocol,
    invalidStreamKey,
    reuseOfStreamKey,
    bFramePresent,
    invalidInput,
    internalServerException
  ];

  static EventErrorCode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => EventErrorCode._(value));

  @override
  bool operator ==(other) => other is EventErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Object specifying an exchanged participant token in a stage, created when an
/// original participant token is updated.
///
/// <b>Important</b>: Treat tokens as opaque; i.e., do not build functionality
/// based on token contents. The format of tokens could change in the future.
class ExchangedParticipantToken {
  /// Application-provided attributes to encode into the token and attach to a
  /// stage. Map keys and values can contain UTF-8 encoded text. The maximum
  /// length of this field is 1 KB total. <i>This field is exposed to all stage
  /// participants and should not be used for personally identifying,
  /// confidential, or sensitive information.</i>
  final Map<String, String>? attributes;

  /// Set of capabilities that the user is allowed to perform in the stage.
  final List<ParticipantTokenCapability>? capabilities;

  /// ISO 8601 timestamp (returned as a string) for when this token expires.
  final DateTime? expirationTime;

  /// Customer-assigned name to help identify the token; this can be used to link
  /// a participant to a user in the customer’s own systems. This can be any UTF-8
  /// encoded text. <i>This field is exposed to all stage participants and should
  /// not be used for personally identifying, confidential, or sensitive
  /// information.</i>
  final String? userId;

  ExchangedParticipantToken({
    this.attributes,
    this.capabilities,
    this.expirationTime,
    this.userId,
  });

  factory ExchangedParticipantToken.fromJson(Map<String, dynamic> json) {
    return ExchangedParticipantToken(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      capabilities: (json['capabilities'] as List?)
          ?.nonNulls
          .map((e) => ParticipantTokenCapability.fromString((e as String)))
          .toList(),
      expirationTime: timeStampFromJson(json['expirationTime']),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final capabilities = this.capabilities;
    final expirationTime = this.expirationTime;
    final userId = this.userId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (capabilities != null)
        'capabilities': capabilities.map((e) => e.value).toList(),
      if (expirationTime != null)
        'expirationTime': iso8601ToJson(expirationTime),
      if (userId != null) 'userId': userId,
    };
  }
}

class ParticipantTokenCapability {
  static const publish = ParticipantTokenCapability._('PUBLISH');
  static const subscribe = ParticipantTokenCapability._('SUBSCRIBE');

  final String value;

  const ParticipantTokenCapability._(this.value);

  static const values = [publish, subscribe];

  static ParticipantTokenCapability fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantTokenCapability._(value));

  @override
  bool operator ==(other) =>
      other is ParticipantTokenCapability && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Summary information about an IngestConfiguration.
class IngestConfigurationSummary {
  /// Ingest configuration ARN.
  final String arn;

  /// Type of ingest protocol that the user employs for broadcasting.
  final IngestProtocol ingestProtocol;

  /// ID of the participant within the stage.
  final String participantId;

  /// ARN of the stage with which the IngestConfiguration is associated.
  final String stageArn;

  /// State of the ingest configuration. It is <code>ACTIVE</code> if a publisher
  /// currently is publishing to the stage associated with the ingest
  /// configuration.
  final IngestConfigurationState state;

  /// Ingest name.
  final String? name;

  /// Indicates whether redundant ingest is enabled for the ingest configuration.
  final bool? redundantIngest;

  /// Customer-assigned name to help identify the participant using the
  /// IngestConfiguration; this can be used to link a participant to a user in the
  /// customer’s own systems. This can be any UTF-8 encoded text. <i>This field is
  /// exposed to all stage participants and should not be used for personally
  /// identifying, confidential, or sensitive information.</i>
  final String? userId;

  IngestConfigurationSummary({
    required this.arn,
    required this.ingestProtocol,
    required this.participantId,
    required this.stageArn,
    required this.state,
    this.name,
    this.redundantIngest,
    this.userId,
  });

  factory IngestConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return IngestConfigurationSummary(
      arn: (json['arn'] as String?) ?? '',
      ingestProtocol:
          IngestProtocol.fromString((json['ingestProtocol'] as String?) ?? ''),
      participantId: (json['participantId'] as String?) ?? '',
      stageArn: (json['stageArn'] as String?) ?? '',
      state:
          IngestConfigurationState.fromString((json['state'] as String?) ?? ''),
      name: json['name'] as String?,
      redundantIngest: json['redundantIngest'] as bool?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final ingestProtocol = this.ingestProtocol;
    final participantId = this.participantId;
    final stageArn = this.stageArn;
    final state = this.state;
    final name = this.name;
    final redundantIngest = this.redundantIngest;
    final userId = this.userId;
    return {
      'arn': arn,
      'ingestProtocol': ingestProtocol.value,
      'participantId': participantId,
      'stageArn': stageArn,
      'state': state.value,
      if (name != null) 'name': name,
      if (redundantIngest != null) 'redundantIngest': redundantIngest,
      if (userId != null) 'userId': userId,
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  EncoderConfigurationSummary({
    required this.arn,
    this.name,
    this.tags,
  });

  factory EncoderConfigurationSummary.fromJson(Map<String, dynamic> json) {
    return EncoderConfigurationSummary(
      arn: (json['arn'] as String?) ?? '',
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
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
      arn: (json['arn'] as String?) ?? '',
      destinations: ((json['destinations'] as List?) ?? const [])
          .nonNulls
          .map((e) => DestinationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      stageArn: (json['stageArn'] as String?) ?? '',
      state: CompositionState.fromString((json['state'] as String?) ?? ''),
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
      'state': state.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
      if (tags != null) 'tags': tags,
    };
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
      id: (json['id'] as String?) ?? '',
      state: DestinationState.fromString((json['state'] as String?) ?? ''),
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
      'state': state.value,
      if (endTime != null) 'endTime': iso8601ToJson(endTime),
      if (startTime != null) 'startTime': iso8601ToJson(startTime),
    };
  }
}

/// Object specifying a public key used to sign stage participant tokens.
class PublicKey {
  /// Public key ARN.
  final String? arn;

  /// The public key fingerprint, a short string used to identify or verify the
  /// full public key.
  final String? fingerprint;

  /// Public key name.
  final String? name;

  /// Public key material.
  final String? publicKeyMaterial;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  PublicKey({
    this.arn,
    this.fingerprint,
    this.name,
    this.publicKeyMaterial,
    this.tags,
  });

  factory PublicKey.fromJson(Map<String, dynamic> json) {
    return PublicKey(
      arn: json['arn'] as String?,
      fingerprint: json['fingerprint'] as String?,
      name: json['name'] as String?,
      publicKeyMaterial: json['publicKeyMaterial'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final fingerprint = this.fingerprint;
    final name = this.name;
    final publicKeyMaterial = this.publicKeyMaterial;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (fingerprint != null) 'fingerprint': fingerprint,
      if (name != null) 'name': name,
      if (publicKeyMaterial != null) 'publicKeyMaterial': publicKeyMaterial,
      if (tags != null) 'tags': tags,
    };
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
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
  final Map<String, String>? tags;

  StorageConfiguration({
    required this.arn,
    this.name,
    this.s3,
    this.tags,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      arn: (json['arn'] as String?) ?? '',
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

  /// The participant’s ingest configuration.
  final String? ingestConfigurationArn;

  /// The participant’s Internet Service Provider.
  final String? ispName;

  /// The participant’s operating system.
  final String? osName;

  /// The participant’s operating system version.
  final String? osVersion;

  /// Unique identifier for this participant, assigned by IVS.
  final String? participantId;

  /// Type of ingest protocol that the participant employs for broadcasting.
  final ParticipantProtocol? protocol;

  /// Whether the participant ever published to the stage session.
  final bool? published;

  /// Name of the S3 bucket to where the participant is being recorded, if
  /// individual participant recording is enabled, or <code>""</code> (empty
  /// string), if recording is not enabled.
  final String? recordingS3BucketName;

  /// S3 prefix of the S3 bucket where the participant is being recorded, if
  /// individual participant recording is enabled, or <code>""</code> (empty
  /// string), if recording is not enabled. If individual participant recording
  /// merge is enabled, and if a stage publisher disconnects from a stage and then
  /// reconnects, IVS tries to record to the same S3 prefix as the previous
  /// session. See <a
  /// href="/ivs/latest/RealTimeUserGuide/rt-individual-participant-recording.html#ind-part-rec-merge-frag">
  /// Merge Fragmented Individual Participant Recordings</a>.
  final String? recordingS3Prefix;

  /// The participant’s recording state.
  final ParticipantRecordingState? recordingState;

  /// Indicates whether redundant ingest is enabled for the participant.
  final bool? redundantIngest;

  /// The participant's replication state.
  final ReplicationState? replicationState;

  /// Indicates if the participant has been replicated to another stage or is a
  /// replica from another stage. Default: <code>NONE</code>.
  final ReplicationType? replicationType;

  /// The participant’s SDK version.
  final String? sdkVersion;

  /// ID of the session within the source stage, if <code>replicationType</code>
  /// is <code>REPLICA</code>.
  final String? sourceSessionId;

  /// Source stage ARN from which this participant is replicated, if
  /// <code>replicationType</code> is <code>REPLICA</code>.
  final String? sourceStageArn;

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
    this.ingestConfigurationArn,
    this.ispName,
    this.osName,
    this.osVersion,
    this.participantId,
    this.protocol,
    this.published,
    this.recordingS3BucketName,
    this.recordingS3Prefix,
    this.recordingState,
    this.redundantIngest,
    this.replicationState,
    this.replicationType,
    this.sdkVersion,
    this.sourceSessionId,
    this.sourceStageArn,
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
      ingestConfigurationArn: json['ingestConfigurationArn'] as String?,
      ispName: json['ispName'] as String?,
      osName: json['osName'] as String?,
      osVersion: json['osVersion'] as String?,
      participantId: json['participantId'] as String?,
      protocol:
          (json['protocol'] as String?)?.let(ParticipantProtocol.fromString),
      published: json['published'] as bool?,
      recordingS3BucketName: json['recordingS3BucketName'] as String?,
      recordingS3Prefix: json['recordingS3Prefix'] as String?,
      recordingState: (json['recordingState'] as String?)
          ?.let(ParticipantRecordingState.fromString),
      redundantIngest: json['redundantIngest'] as bool?,
      replicationState: (json['replicationState'] as String?)
          ?.let(ReplicationState.fromString),
      replicationType:
          (json['replicationType'] as String?)?.let(ReplicationType.fromString),
      sdkVersion: json['sdkVersion'] as String?,
      sourceSessionId: json['sourceSessionId'] as String?,
      sourceStageArn: json['sourceStageArn'] as String?,
      state: (json['state'] as String?)?.let(ParticipantState.fromString),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final browserName = this.browserName;
    final browserVersion = this.browserVersion;
    final firstJoinTime = this.firstJoinTime;
    final ingestConfigurationArn = this.ingestConfigurationArn;
    final ispName = this.ispName;
    final osName = this.osName;
    final osVersion = this.osVersion;
    final participantId = this.participantId;
    final protocol = this.protocol;
    final published = this.published;
    final recordingS3BucketName = this.recordingS3BucketName;
    final recordingS3Prefix = this.recordingS3Prefix;
    final recordingState = this.recordingState;
    final redundantIngest = this.redundantIngest;
    final replicationState = this.replicationState;
    final replicationType = this.replicationType;
    final sdkVersion = this.sdkVersion;
    final sourceSessionId = this.sourceSessionId;
    final sourceStageArn = this.sourceStageArn;
    final state = this.state;
    final userId = this.userId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (browserName != null) 'browserName': browserName,
      if (browserVersion != null) 'browserVersion': browserVersion,
      if (firstJoinTime != null) 'firstJoinTime': iso8601ToJson(firstJoinTime),
      if (ingestConfigurationArn != null)
        'ingestConfigurationArn': ingestConfigurationArn,
      if (ispName != null) 'ispName': ispName,
      if (osName != null) 'osName': osName,
      if (osVersion != null) 'osVersion': osVersion,
      if (participantId != null) 'participantId': participantId,
      if (protocol != null) 'protocol': protocol.value,
      if (published != null) 'published': published,
      if (recordingS3BucketName != null)
        'recordingS3BucketName': recordingS3BucketName,
      if (recordingS3Prefix != null) 'recordingS3Prefix': recordingS3Prefix,
      if (recordingState != null) 'recordingState': recordingState.value,
      if (redundantIngest != null) 'redundantIngest': redundantIngest,
      if (replicationState != null) 'replicationState': replicationState.value,
      if (replicationType != null) 'replicationType': replicationType.value,
      if (sdkVersion != null) 'sdkVersion': sdkVersion,
      if (sourceSessionId != null) 'sourceSessionId': sourceSessionId,
      if (sourceStageArn != null) 'sourceStageArn': sourceStageArn,
      if (state != null) 'state': state.value,
      if (userId != null) 'userId': userId,
    };
  }
}

class ParticipantProtocol {
  static const unknown = ParticipantProtocol._('UNKNOWN');
  static const whip = ParticipantProtocol._('WHIP');
  static const rtmp = ParticipantProtocol._('RTMP');
  static const rtmps = ParticipantProtocol._('RTMPS');

  final String value;

  const ParticipantProtocol._(this.value);

  static const values = [unknown, whip, rtmp, rtmps];

  static ParticipantProtocol fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ParticipantProtocol._(value));

  @override
  bool operator ==(other) =>
      other is ParticipantProtocol && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Settings for transcoding.
class EncoderConfiguration {
  /// ARN of the EncoderConfiguration resource.
  final String arn;

  /// Optional name to identify the resource.
  final String? name;

  /// Tags attached to the resource. Array of maps, each of the form
  /// <code>string:string (key:value)</code>. See <a
  /// href="https://docs.aws.amazon.com/tag-editor/latest/userguide/best-practices-and-strats.html">Best
  /// practices and strategies</a> in <i>Tagging AWS Resources and Tag Editor</i>
  /// for details, including restrictions that apply to tags and "Tag naming
  /// limits and requirements"; Amazon IVS has no constraints on tags beyond what
  /// is documented there.
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
      arn: (json['arn'] as String?) ?? '',
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

/// Settings for video.
class Video {
  /// Bitrate for generated output, in bps. Default: 2500000.
  final int? bitrate;

  /// Video frame rate, in fps. Default: 30.
  final double? framerate;

  /// Video-resolution height. This must be an even number. Note that the maximum
  /// value is determined by <code>width</code> times <code>height</code>, such
  /// that the maximum total pixels is 2073600 (1920x1080 or 1080x1920). Default:
  /// 720.
  final int? height;

  /// Video-resolution width. This must be an even number. Note that the maximum
  /// value is determined by <code>width</code> times <code>height</code>, such
  /// that the maximum total pixels is 2073600 (1920x1080 or 1080x1920). Default:
  /// 1280.
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

/// Object specifying a participant token in a stage.
///
/// <b>Important</b>: Treat tokens as opaque; i.e., do not build functionality
/// based on token contents. The format of tokens could change in the future.
class ParticipantToken {
  /// Application-provided attributes to encode into the token and attach to a
  /// stage. Map keys and values can contain UTF-8 encoded text. The maximum
  /// length of this field is 1 KB total. <i>This field is exposed to all stage
  /// participants and should not be used for personally identifying,
  /// confidential, or sensitive information.</i>
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
          ?.nonNulls
          .map((e) => ParticipantTokenCapability.fromString((e as String)))
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
        'capabilities': capabilities.map((e) => e.value).toList(),
      if (duration != null) 'duration': duration,
      if (expirationTime != null)
        'expirationTime': iso8601ToJson(expirationTime),
      if (participantId != null) 'participantId': participantId,
      if (token != null) 'token': token,
      if (userId != null) 'userId': userId,
    };
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
        'capabilities': capabilities.map((e) => e.value).toList(),
      if (duration != null) 'duration': duration,
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
