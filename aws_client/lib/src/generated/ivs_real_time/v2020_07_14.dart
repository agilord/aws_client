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
/// The Amazon Interactive Video Service (IVS) stage API is REST compatible,
/// using a standard HTTP API and an AWS EventBridge event stream for responses.
/// JSON is used for both requests and responses, including errors.
///
/// Terminology:
///
/// <ul>
/// <li>
/// The IVS stage API sometimes is referred to as the IVS <i>RealTime</i> API.
/// </li>
/// <li>
/// A <i>participant token</i> is an authorization token used to
/// publish/subscribe to a stage.
/// </li>
/// <li>
/// A <i>participant object</i> represents participants (people) in the stage
/// and contains information about them. When a token is created, it includes a
/// participant ID; when a participant uses that token to join a stage, the
/// participant is associated with that participant ID There is a 1:1 mapping
/// between participant tokens and participants.
/// </li>
/// </ul>
/// <b>Resources</b>
///
/// The following resources contain information about your IVS live stream (see
/// <a
/// href="https://docs.aws.amazon.com/ivs/latest/userguide/getting-started.html">Getting
/// Started with Amazon IVS</a>):
///
/// <ul>
/// <li>
/// <b>Stage</b> — A stage is a virtual space where multiple participants can
/// exchange audio and video in real time.
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
/// The Amazon IVS stage API has these tag-related endpoints:
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
  /// The first participant to retrieve. This is used for pagination; see the
  /// <code>nextToken</code> response field.
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
  /// The first stage to retrieve. This is used for pagination; see the
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

class DeleteStageResponse {
  DeleteStageResponse();

  factory DeleteStageResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStageResponse();
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

/// An occurrence during a stage session.
class Event {
  /// If the event is an error event, the error code is provided to give insight
  /// into the specific error that occurred. If the event is not an error event,
  /// this field is null. <code>INSUFFICIENT_CAPABILITIES</code> indicates that
  /// the participant tried to take an action that the participant’s token is not
  /// allowed to do. For more information about participant capabilities, see the
  /// <code>capabilities</code> field in <a>CreateParticipantToken</a>.
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
}

extension EventErrorCodeValueExtension on EventErrorCode {
  String toValue() {
    switch (this) {
      case EventErrorCode.insufficientCapabilities:
        return 'INSUFFICIENT_CAPABILITIES';
    }
  }
}

extension EventErrorCodeFromString on String {
  EventErrorCode toEventErrorCode() {
    switch (this) {
      case 'INSUFFICIENT_CAPABILITIES':
        return EventErrorCode.insufficientCapabilities;
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

class ListParticipantEventsResponse {
  /// List of the matching events.
  final List<Event> events;

  /// If there are more rooms than <code>maxResults</code>, use
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

  /// If there are more rooms than <code>maxResults</code>, use
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

  /// If there are more rooms than <code>maxResults</code>, use
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

  /// If there are more rooms than <code>maxResults</code>, use
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

  Participant({
    this.attributes,
    this.firstJoinTime,
    this.participantId,
    this.published,
    this.state,
    this.userId,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      attributes: (json['attributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      firstJoinTime: timeStampFromJson(json['firstJoinTime']),
      participantId: json['participantId'] as String?,
      published: json['published'] as bool?,
      state: (json['state'] as String?)?.toParticipantState(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attributes = this.attributes;
    final firstJoinTime = this.firstJoinTime;
    final participantId = this.participantId;
    final published = this.published;
    final state = this.state;
    final userId = this.userId;
    return {
      if (attributes != null) 'attributes': attributes,
      if (firstJoinTime != null) 'firstJoinTime': iso8601ToJson(firstJoinTime),
      if (participantId != null) 'participantId': participantId,
      if (published != null) 'published': published,
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
