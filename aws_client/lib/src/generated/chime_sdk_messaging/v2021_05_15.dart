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

/// The Amazon Chime SDK messaging APIs in this section allow software
/// developers to send and receive messages in custom messaging applications.
/// These APIs depend on the frameworks provided by the Amazon Chime SDK
/// identity APIs. For more information about the messaging APIs, see <a
/// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Messaging.html">Amazon
/// Chime SDK messaging</a>.
class ChimeSdkMessaging {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkMessaging({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'messaging-chime',
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

  /// Associates a channel flow with a channel. Once associated, all messages to
  /// that channel go through channel flow processors. To stop processing, use
  /// the <code>DisassociateChannelFlow</code> API.
  /// <note>
  /// Only administrators or channel moderators can associate a channel flow.
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [channelFlowArn] :
  /// The ARN of the channel flow.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user making the API call.
  Future<void> associateChannelFlow({
    required String channelArn,
    required String channelFlowArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'ChannelFlowArn': channelFlowArn,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/channel-flow',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds a specified number of users and bots to a channel.
  ///
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedClientException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel to which you're adding users or bots.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArns] :
  /// The ARNs of the members you want to add to the channel. Only
  /// <code>AppInstanceUsers</code> and <code>AppInstanceBots</code> can be
  /// added as a channel member.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when creating membership in a SubChannel for a moderator in
  /// an elastic channel.
  /// </note>
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are always returned as part of
  /// <code>ListChannelMemberships</code>. Hidden members are only returned if
  /// the type filter in <code>ListChannelMemberships</code> equals
  /// <code>HIDDEN</code>. Otherwise hidden members are not returned. This is
  /// only supported by moderators.
  Future<BatchCreateChannelMembershipResponse> batchCreateChannelMembership({
    required String channelArn,
    required String chimeBearer,
    required List<String> memberArns,
    String? subChannelId,
    ChannelMembershipType? type,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'MemberArns': memberArns,
      if (subChannelId != null) 'SubChannelId': subChannelId,
      if (type != null) 'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships?operation=batch-create',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateChannelMembershipResponse.fromJson(response);
  }

  /// Calls back Amazon Chime SDK messaging with a processing response message.
  /// This should be invoked from the processor Lambda. This is a developer API.
  ///
  /// You can return one of the following processing responses:
  ///
  /// <ul>
  /// <li>
  /// Update message content or metadata
  /// </li>
  /// <li>
  /// Deny a message
  /// </li>
  /// <li>
  /// Make no changes to the message
  /// </li>
  /// </ul>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [channelMessage] :
  /// Stores information about the processed message.
  ///
  /// Parameter [callbackId] :
  /// The identifier passed to the processor by the service when invoked. Use
  /// the identifier to call back the service.
  ///
  /// Parameter [deleteResource] :
  /// When a processor determines that a message needs to be
  /// <code>DENIED</code>, pass this parameter with a value of true.
  Future<ChannelFlowCallbackResponse> channelFlowCallback({
    required String channelArn,
    required ChannelMessageCallback channelMessage,
    String? callbackId,
    bool? deleteResource,
  }) async {
    final $payload = <String, dynamic>{
      'ChannelMessage': channelMessage,
      'CallbackId': callbackId ?? _s.generateIdempotencyToken(),
      if (deleteResource != null) 'DeleteResource': deleteResource,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}?operation=channel-flow-callback',
      exceptionFnMap: _exceptionFns,
    );
    return ChannelFlowCallbackResponse.fromJson(response);
  }

  /// Creates a channel to which you can add users and send messages.
  ///
  /// <b>Restriction</b>: You can't change a channel's privacy.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the channel request.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [name] :
  /// The name of the channel.
  ///
  /// Parameter [channelId] :
  /// The ID of the channel in the request.
  ///
  /// Parameter [clientRequestToken] :
  /// The client token for the request. An <code>Idempotency</code> token.
  ///
  /// Parameter [elasticChannelConfiguration] :
  /// The attributes required to configure and create an elastic channel. An
  /// elastic channel can support a maximum of 1-million users, excluding
  /// moderators.
  ///
  /// Parameter [expirationSettings] :
  /// Settings that control the interval after which the channel is
  /// automatically deleted.
  ///
  /// Parameter [memberArns] :
  /// The ARNs of the channel members in the request.
  ///
  /// Parameter [metadata] :
  /// The metadata of the creation request. Limited to 1KB and UTF-8.
  ///
  /// Parameter [mode] :
  /// The channel mode: <code>UNRESTRICTED</code> or <code>RESTRICTED</code>.
  /// Administrators, moderators, and channel members can add themselves and
  /// other members to unrestricted channels. Only administrators and moderators
  /// can add members to restricted channels.
  ///
  /// Parameter [moderatorArns] :
  /// The ARNs of the channel moderators in the request.
  ///
  /// Parameter [privacy] :
  /// The channel's privacy level: <code>PUBLIC</code> or <code>PRIVATE</code>.
  /// Private channels aren't discoverable by users outside the channel. Public
  /// channels are discoverable by anyone in the <code>AppInstance</code>.
  ///
  /// Parameter [tags] :
  /// The tags for the creation request.
  Future<CreateChannelResponse> createChannel({
    required String appInstanceArn,
    required String chimeBearer,
    required String name,
    String? channelId,
    String? clientRequestToken,
    ElasticChannelConfiguration? elasticChannelConfiguration,
    ExpirationSettings? expirationSettings,
    List<String>? memberArns,
    String? metadata,
    ChannelMode? mode,
    List<String>? moderatorArns,
    ChannelPrivacy? privacy,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'Name': name,
      if (channelId != null) 'ChannelId': channelId,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (elasticChannelConfiguration != null)
        'ElasticChannelConfiguration': elasticChannelConfiguration,
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
      if (memberArns != null) 'MemberArns': memberArns,
      if (metadata != null) 'Metadata': metadata,
      if (mode != null) 'Mode': mode.toValue(),
      if (moderatorArns != null) 'ModeratorArns': moderatorArns,
      if (privacy != null) 'Privacy': privacy.toValue(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelResponse.fromJson(response);
  }

  /// Permanently bans a member from a channel. Moderators can't add banned
  /// members to a channel. To undo a ban, you first have to
  /// <code>DeleteChannelBan</code>, and then
  /// <code>CreateChannelMembership</code>. Bans are cleaned up when you delete
  /// users or channels.
  ///
  /// If you ban a user who is already part of a channel, that user is
  /// automatically kicked from the channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the ban request.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The <code>AppInstanceUserArn</code> of the member being banned.
  Future<CreateChannelBanResponse> createChannelBan({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'MemberArn': memberArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/bans',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelBanResponse.fromJson(response);
  }

  /// Creates a channel flow, a container for processors. Processors are AWS
  /// Lambda functions that perform actions on chat messages, such as stripping
  /// out profanity. You can associate channel flows with channels, and the
  /// processors in the channel flow then take action on all messages sent to
  /// that channel. This is a developer API.
  ///
  /// Channel flows process the following items:
  /// <ol>
  /// <li>
  /// New and updated messages
  /// </li>
  /// <li>
  /// Persistent and non-persistent messages
  /// </li>
  /// <li>
  /// The Standard message type
  /// </li> </ol> <note>
  /// Channel flows don't process Control or System messages. For more
  /// information about the message types provided by Chime SDK messaging, refer
  /// to <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/using-the-messaging-sdk.html#msg-types">Message
  /// types</a> in the <i>Amazon Chime developer guide</i>.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the channel flow request.
  ///
  /// Parameter [name] :
  /// The name of the channel flow.
  ///
  /// Parameter [processors] :
  /// Information about the processor Lambda functions.
  ///
  /// Parameter [clientRequestToken] :
  /// The client token for the request. An Idempotency token.
  ///
  /// Parameter [tags] :
  /// The tags for the creation request.
  Future<CreateChannelFlowResponse> createChannelFlow({
    required String appInstanceArn,
    required String name,
    required List<Processor> processors,
    String? clientRequestToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'Name': name,
      'Processors': processors,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channel-flows',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelFlowResponse.fromJson(response);
  }

  /// Adds a member to a channel. The <code>InvitedBy</code> field in
  /// <code>ChannelMembership</code> is derived from the request header. A
  /// channel member can:
  ///
  /// <ul>
  /// <li>
  /// List messages
  /// </li>
  /// <li>
  /// Send messages
  /// </li>
  /// <li>
  /// Receive messages
  /// </li>
  /// <li>
  /// Edit their own messages
  /// </li>
  /// <li>
  /// Leave the channel
  /// </li>
  /// </ul>
  /// Privacy settings impact this action as follows:
  ///
  /// <ul>
  /// <li>
  /// Public Channels: You do not need to be a member to list messages, but you
  /// must be a member to send messages.
  /// </li>
  /// <li>
  /// Private Channels: You must be a member to list or send messages.
  /// </li>
  /// </ul> <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUserArn</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel to which you're adding users.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The <code>AppInstanceUserArn</code> of the member you want to add to the
  /// channel.
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are always returned as part of
  /// <code>ListChannelMemberships</code>. Hidden members are only returned if
  /// the type filter in <code>ListChannelMemberships</code> equals
  /// <code>HIDDEN</code>. Otherwise hidden members are not returned. This is
  /// only supported by moderators.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when creating membership in a SubChannel for a moderator in
  /// an elastic channel.
  /// </note>
  Future<CreateChannelMembershipResponse> createChannelMembership({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
    required ChannelMembershipType type,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'MemberArn': memberArn,
      'Type': type.toValue(),
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/memberships',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelMembershipResponse.fromJson(response);
  }

  /// Creates a new <code>ChannelModerator</code>. A channel moderator can:
  ///
  /// <ul>
  /// <li>
  /// Add and remove other members of the channel.
  /// </li>
  /// <li>
  /// Add and remove other moderators of the channel.
  /// </li>
  /// <li>
  /// Add and remove user bans for the channel.
  /// </li>
  /// <li>
  /// Redact messages in the channel.
  /// </li>
  /// <li>
  /// List messages in the channel.
  /// </li>
  /// </ul> <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>of
  /// the user that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [channelModeratorArn] :
  /// The <code>AppInstanceUserArn</code> of the moderator.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<CreateChannelModeratorResponse> createChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'ChannelModeratorArn': channelModeratorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/moderators',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelModeratorResponse.fromJson(response);
  }

  /// Immediately makes a channel and its memberships inaccessible and marks
  /// them for deletion. This is an irreversible process.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUserArn</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel being deleted.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<void> deleteChannel({
    required String channelArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a member from a channel's ban list.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel from which the <code>AppInstanceUser</code> was
  /// banned.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The ARN of the <code>AppInstanceUser</code> that you want to reinstate.
  Future<void> deleteChannelBan({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/bans/${Uri.encodeComponent(memberArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel flow, an irreversible process. This is a developer API.
  /// <note>
  /// This API works only when the channel flow is not associated with any
  /// channel. To get a list of all channels that a channel flow is associated
  /// with, use the <code>ListChannelsAssociatedWithChannelFlow</code> API. Use
  /// the <code>DisassociateChannelFlow</code> API to disassociate a channel
  /// flow from all channels.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelFlowArn] :
  /// The ARN of the channel flow.
  Future<void> deleteChannelFlow({
    required String channelFlowArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channel-flows/${Uri.encodeComponent(channelFlowArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a member from a channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel from which you want to remove the user.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The <code>AppInstanceUserArn</code> of the member that you're removing
  /// from the channel.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only for use by moderators.
  /// </note>
  Future<void> deleteChannelMembership({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel message. Only admins can perform this action. Deletion
  /// makes messages inaccessible immediately. A background process deletes any
  /// revisions created by <code>UpdateChannelMessage</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [messageId] :
  /// The ID of the message being deleted.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when deleting messages in a SubChannel that the user belongs
  /// to.
  /// </note>
  Future<void> deleteChannelMessage({
    required String channelArn,
    required String chimeBearer,
    required String messageId,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel moderator.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [channelModeratorArn] :
  /// The <code>AppInstanceUserArn</code> of the moderator being deleted.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<void> deleteChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/moderators/${Uri.encodeComponent(channelModeratorArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the streaming configurations for an <code>AppInstance</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/streaming-export.html">Streaming
  /// messaging data</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the streaming configurations being deleted.
  Future<void> deleteMessagingStreamingConfigurations({
    required String appInstanceArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/streaming-configurations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the full details of a channel in an Amazon Chime
  /// <code>AppInstance</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<DescribeChannelResponse> describeChannel({
    required String channelArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelResponse.fromJson(response);
  }

  /// Returns the full details of a channel ban.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel from which the user is banned.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The <code>AppInstanceUserArn</code> of the member being banned.
  Future<DescribeChannelBanResponse> describeChannelBan({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/bans/${Uri.encodeComponent(memberArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelBanResponse.fromJson(response);
  }

  /// Returns the full details of a channel flow in an Amazon Chime
  /// <code>AppInstance</code>. This is a developer API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelFlowArn] :
  /// The ARN of the channel flow.
  Future<DescribeChannelFlowResponse> describeChannelFlow({
    required String channelFlowArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channel-flows/${Uri.encodeComponent(channelFlowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelFlowResponse.fromJson(response);
  }

  /// Returns the full details of a user's channel membership.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The <code>AppInstanceUserArn</code> of the member.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request. The response contains an
  /// <code>ElasticChannelConfiguration</code> object.
  /// <note>
  /// Only required to get a user’s SubChannel membership details.
  /// </note>
  Future<DescribeChannelMembershipResponse> describeChannelMembership({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelMembershipResponse.fromJson(response);
  }

  /// Returns the details of a channel based on the membership of the specified
  /// <code>AppInstanceUser</code> or <code>AppInstanceBot</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user or bot in a channel.
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel to which the user belongs.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<DescribeChannelMembershipForAppInstanceUserResponse>
      describeChannelMembershipForAppInstanceUser({
    required String appInstanceUserArn,
    required String channelArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      'app-instance-user-arn': [appInstanceUserArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}?scope=app-instance-user-membership',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelMembershipForAppInstanceUserResponse.fromJson(
        response);
  }

  /// Returns the full details of a channel moderated by the specified
  /// <code>AppInstanceUser</code> or <code>AppInstanceBot</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user or bot in the moderated channel.
  ///
  /// Parameter [channelArn] :
  /// The ARN of the moderated channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<DescribeChannelModeratedByAppInstanceUserResponse>
      describeChannelModeratedByAppInstanceUser({
    required String appInstanceUserArn,
    required String channelArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      'app-instance-user-arn': [appInstanceUserArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}?scope=app-instance-user-moderated-channel',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelModeratedByAppInstanceUserResponse.fromJson(response);
  }

  /// Returns the full details of a single ChannelModerator.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [channelModeratorArn] :
  /// The <code>AppInstanceUserArn</code> of the channel moderator.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<DescribeChannelModeratorResponse> describeChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/moderators/${Uri.encodeComponent(channelModeratorArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelModeratorResponse.fromJson(response);
  }

  /// Disassociates a channel flow from all its channels. Once disassociated,
  /// all messages to that channel stop going through the channel flow
  /// processor.
  /// <note>
  /// Only administrators or channel moderators can disassociate a channel flow.
  ///
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [channelFlowArn] :
  /// The ARN of the channel flow.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user making the API call.
  Future<void> disassociateChannelFlow({
    required String channelArn,
    required String channelFlowArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/channel-flow/${Uri.encodeComponent(channelFlowArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets the membership preferences of an <code>AppInstanceUser</code> or
  /// <code>AppInstanceBot</code> for the specified channel. A user or a bot
  /// must be a member of the channel and own the membership in order to
  /// retrieve membership preferences. Users or bots in the
  /// <code>AppInstanceAdmin</code> and channel moderator roles can't retrieve
  /// preferences for other users or bots. Banned users or bots can't retrieve
  /// membership preferences for the channel from which they are banned.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The <code>AppInstanceUserArn</code> of the member retrieving the
  /// preferences.
  Future<GetChannelMembershipPreferencesResponse>
      getChannelMembershipPreferences({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}/preferences',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelMembershipPreferencesResponse.fromJson(response);
  }

  /// Gets the full details of a channel message.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [messageId] :
  /// The ID of the message.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when getting messages in a SubChannel that the user belongs
  /// to.
  /// </note>
  Future<GetChannelMessageResponse> getChannelMessage({
    required String channelArn,
    required String chimeBearer,
    required String messageId,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelMessageResponse.fromJson(response);
  }

  /// Gets message status for a specified <code>messageId</code>. Use this API
  /// to determine the intermediate status of messages going through channel
  /// flow processing. The API provides an alternative to retrieving message
  /// status if the event was not received because a client wasn't connected to
  /// a websocket.
  ///
  /// Messages can have any one of these statuses.
  /// <dl> <dt>SENT</dt> <dd>
  /// Message processed successfully
  /// </dd> <dt>PENDING</dt> <dd>
  /// Ongoing processing
  /// </dd> <dt>FAILED</dt> <dd>
  /// Processing failed
  /// </dd> <dt>DENIED</dt> <dd>
  /// Message denied by the processor
  /// </dd> </dl> <note>
  /// <ul>
  /// <li>
  /// This API does not return statuses for denied messages, because we don't
  /// store them once the processor denies them.
  /// </li>
  /// <li>
  /// Only the message sender can invoke this API.
  /// </li>
  /// <li>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user making the API call.
  ///
  /// Parameter [messageId] :
  /// The ID of the message.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when getting message status in a SubChannel that the user
  /// belongs to.
  /// </note>
  Future<GetChannelMessageStatusResponse> getChannelMessageStatus({
    required String channelArn,
    required String chimeBearer,
    required String messageId,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}?scope=message-status',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelMessageStatusResponse.fromJson(response);
  }

  /// The details of the endpoint for the messaging session.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  Future<GetMessagingSessionEndpointResponse>
      getMessagingSessionEndpoint() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/endpoints/messaging-session',
      exceptionFnMap: _exceptionFns,
    );
    return GetMessagingSessionEndpointResponse.fromJson(response);
  }

  /// Retrieves the data streaming configuration for an
  /// <code>AppInstance</code>. For more information, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/streaming-export.html">Streaming
  /// messaging data</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the streaming configurations.
  Future<GetMessagingStreamingConfigurationsResponse>
      getMessagingStreamingConfigurations({
    required String appInstanceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/streaming-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return GetMessagingStreamingConfigurationsResponse.fromJson(response);
  }

  /// Lists all the users and bots banned from a particular channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bans that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested bans are
  /// returned.
  Future<ListChannelBansResponse> listChannelBans({
    required String channelArn,
    required String chimeBearer,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/bans',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelBansResponse.fromJson(response);
  }

  /// Returns a paginated lists of all the channel flows created under a single
  /// Chime. This is a developer API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channel flows that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channel flows
  /// are returned.
  Future<ListChannelFlowsResponse> listChannelFlows({
    required String appInstanceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'app-instance-arn': [appInstanceArn],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channel-flows',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelFlowsResponse.fromJson(response);
  }

  /// Lists all channel memberships in a channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  /// If you want to list the channels to which a specific app instance user
  /// belongs, see the <a
  /// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_messaging-chime_ListChannelMembershipsForAppInstanceUser.html">ListChannelMembershipsForAppInstanceUser</a>
  /// API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The maximum number of channel memberships that you want returned.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channel memberships that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channel
  /// memberships are returned.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when listing a user's memberships in a particular
  /// sub-channel of an elastic channel.
  /// </note>
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are returned as part of
  /// <code>ListChannelMemberships</code> if no type is specified. Hidden
  /// members are only returned if the type filter in
  /// <code>ListChannelMemberships</code> equals <code>HIDDEN</code>.
  Future<ListChannelMembershipsResponse> listChannelMemberships({
    required String channelArn,
    required String chimeBearer,
    int? maxResults,
    String? nextToken,
    String? subChannelId,
    ChannelMembershipType? type,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
      if (type != null) 'type': [type.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/memberships',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelMembershipsResponse.fromJson(response);
  }

  /// Lists all channels that an <code>AppInstanceUser</code> or
  /// <code>AppInstanceBot</code> is a part of. Only an
  /// <code>AppInstanceAdmin</code> can call the API with a user ARN that is not
  /// their own.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user or bot.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of users that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channel
  /// memberships is reached.
  Future<ListChannelMembershipsForAppInstanceUserResponse>
      listChannelMembershipsForAppInstanceUser({
    required String chimeBearer,
    String? appInstanceUserArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (appInstanceUserArn != null)
        'app-instance-user-arn': [appInstanceUserArn],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels?scope=app-instance-user-memberships',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelMembershipsForAppInstanceUserResponse.fromJson(response);
  }

  /// List all the messages in a channel. Returns a paginated list of
  /// <code>ChannelMessages</code>. By default, sorted by creation timestamp in
  /// descending order.
  /// <note>
  /// Redacted messages appear in the results as empty, since they are only
  /// redacted, not deleted. Deleted messages do not appear in the results. This
  /// action always returns the latest version of an edited message.
  ///
  /// Also, the <code>x-amz-chime-bearer</code> request header is mandatory. Use
  /// the ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of messages that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested messages are
  /// returned.
  ///
  /// Parameter [notAfter] :
  /// The final or ending time stamp for your requested messages.
  ///
  /// Parameter [notBefore] :
  /// The initial or starting time stamp for your requested messages.
  ///
  /// Parameter [sortOrder] :
  /// The order in which you want messages sorted. Default is Descending, based
  /// on time created.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when listing the messages in a SubChannel that the user
  /// belongs to.
  /// </note>
  Future<ListChannelMessagesResponse> listChannelMessages({
    required String channelArn,
    required String chimeBearer,
    int? maxResults,
    String? nextToken,
    DateTime? notAfter,
    DateTime? notBefore,
    SortOrder? sortOrder,
    String? subChannelId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (notAfter != null)
        'not-after': [_s.iso8601ToJson(notAfter).toString()],
      if (notBefore != null)
        'not-before': [_s.iso8601ToJson(notBefore).toString()],
      if (sortOrder != null) 'sort-order': [sortOrder.toValue()],
      if (subChannelId != null) 'sub-channel-id': [subChannelId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/messages',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelMessagesResponse.fromJson(response);
  }

  /// Lists all the moderators for a channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of moderators that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested moderators are
  /// returned.
  Future<ListChannelModeratorsResponse> listChannelModerators({
    required String channelArn,
    required String chimeBearer,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/moderators',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelModeratorsResponse.fromJson(response);
  }

  /// Lists all Channels created under a single Chime App as a paginated list.
  /// You can specify filters to narrow results.
  /// <p class="title"> <b>Functionality &amp; restrictions</b>
  ///
  /// <ul>
  /// <li>
  /// Use privacy = <code>PUBLIC</code> to retrieve all public channels in the
  /// account.
  /// </li>
  /// <li>
  /// Only an <code>AppInstanceAdmin</code> can set privacy =
  /// <code>PRIVATE</code> to list the private channels in an account.
  /// </li>
  /// </ul> <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channels are
  /// returned.
  ///
  /// Parameter [privacy] :
  /// The privacy setting. <code>PUBLIC</code> retrieves all the public
  /// channels. <code>PRIVATE</code> retrieves private channels. Only an
  /// <code>AppInstanceAdmin</code> can retrieve private channels.
  Future<ListChannelsResponse> listChannels({
    required String appInstanceArn,
    required String chimeBearer,
    int? maxResults,
    String? nextToken,
    ChannelPrivacy? privacy,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      'app-instance-arn': [appInstanceArn],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (privacy != null) 'privacy': [privacy.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// Lists all channels associated with a specified channel flow. You can
  /// associate a channel flow with multiple channels, but you can only
  /// associate a channel with one channel flow. This is a developer API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelFlowArn] :
  /// The ARN of the channel flow.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channels are
  /// returned.
  Future<ListChannelsAssociatedWithChannelFlowResponse>
      listChannelsAssociatedWithChannelFlow({
    required String channelFlowArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      'channel-flow-arn': [channelFlowArn],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels?scope=channel-flow-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsAssociatedWithChannelFlowResponse.fromJson(response);
  }

  /// A list of the channels moderated by an <code>AppInstanceUser</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user or bot in the moderated channel.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels in the request.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channels
  /// moderated by the user is reached.
  Future<ListChannelsModeratedByAppInstanceUserResponse>
      listChannelsModeratedByAppInstanceUser({
    required String chimeBearer,
    String? appInstanceUserArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (appInstanceUserArn != null)
        'app-instance-user-arn': [appInstanceUserArn],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels?scope=app-instance-user-moderated-channels',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsModeratedByAppInstanceUserResponse.fromJson(response);
  }

  /// Lists all the SubChannels in an elastic channel when given a channel ID.
  /// Available only to the app instance admins and channel moderators of
  /// elastic channels.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of elastic channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user making the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of sub-channels that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested sub-channels
  /// are returned.
  Future<ListSubChannelsResponse> listSubChannels({
    required String channelArn,
    required String chimeBearer,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/subchannels',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return ListSubChannelsResponse.fromJson(response);
  }

  /// Lists the tags applied to an Amazon Chime SDK messaging resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The ARN of the resource.
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

  /// Sets the number of days before the channel is automatically deleted.
  /// <note>
  /// <ul>
  /// <li>
  /// A background process deletes expired channels within 6 hours of
  /// expiration. Actual deletion times may vary.
  /// </li>
  /// <li>
  /// Expired channels that have not yet been deleted appear as active, and you
  /// can update their expiration settings. The system honors the new settings.
  /// </li>
  /// <li>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </li>
  /// </ul> </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [expirationSettings] :
  /// Settings that control the interval after which a channel is deleted.
  Future<PutChannelExpirationSettingsResponse> putChannelExpirationSettings({
    required String channelArn,
    String? chimeBearer,
    ExpirationSettings? expirationSettings,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/expiration-settings',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutChannelExpirationSettingsResponse.fromJson(response);
  }

  /// Sets the membership preferences of an <code>AppInstanceUser</code> or
  /// <code>AppInstanceBot</code> for the specified channel. The user or bot
  /// must be a member of the channel. Only the user or bot who owns the
  /// membership can set preferences. Users or bots in the
  /// <code>AppInstanceAdmin</code> and channel moderator roles can't set
  /// preferences for other users. Banned users or bots can't set membership
  /// preferences for the channel from which they are banned.
  /// <note>
  /// The x-amz-chime-bearer request header is mandatory. Use the ARN of an
  /// <code>AppInstanceUser</code> or <code>AppInstanceBot</code> that makes the
  /// API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [memberArn] :
  /// The ARN of the member setting the preferences.
  ///
  /// Parameter [preferences] :
  /// The channel membership preferences of an <code>AppInstanceUser</code> .
  Future<PutChannelMembershipPreferencesResponse>
      putChannelMembershipPreferences({
    required String channelArn,
    required String chimeBearer,
    required String memberArn,
    required ChannelMembershipPreferences preferences,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'Preferences': preferences,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}/preferences',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return PutChannelMembershipPreferencesResponse.fromJson(response);
  }

  /// Sets the data streaming configuration for an <code>AppInstance</code>. For
  /// more information, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/streaming-export.html">Streaming
  /// messaging data</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the streaming configuration.
  ///
  /// Parameter [streamingConfigurations] :
  /// The streaming configurations.
  Future<PutMessagingStreamingConfigurationsResponse>
      putMessagingStreamingConfigurations({
    required String appInstanceArn,
    required List<StreamingConfiguration> streamingConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      'StreamingConfigurations': streamingConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/streaming-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return PutMessagingStreamingConfigurationsResponse.fromJson(response);
  }

  /// Redacts message content, but not metadata. The message exists in the back
  /// end, but the action returns null content, and the state shows as redacted.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel containing the messages that you want to redact.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [messageId] :
  /// The ID of the message being redacted.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  Future<RedactChannelMessageResponse> redactChannelMessage({
    required String channelArn,
    required String chimeBearer,
    required String messageId,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return RedactChannelMessageResponse.fromJson(response);
  }

  /// Allows the <code>ChimeBearer</code> to search channels by channel members.
  /// Users or bots can search across the channels that they belong to. Users in
  /// the <code>AppInstanceAdmin</code> role can search across all channels.
  ///
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [fields] :
  /// A list of the <code>Field</code> objects in the channel being searched.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user making the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channels
  /// is reached.
  Future<SearchChannelsResponse> searchChannels({
    required List<SearchField> fields,
    String? chimeBearer,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final $payload = <String, dynamic>{
      'Fields': fields,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels?operation=search',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SearchChannelsResponse.fromJson(response);
  }

  /// Sends a message to a particular channel that the member is a part of.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  ///
  /// Also, <code>STANDARD</code> messages can be up to 4KB in size and contain
  /// metadata. Metadata is arbitrary, and you can use it in a variety of ways,
  /// such as containing a link to an attachment.
  ///
  /// <code>CONTROL</code> messages are limited to 30 bytes and do not contain
  /// metadata.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [content] :
  /// The content of the channel message.
  ///
  /// Parameter [persistence] :
  /// Boolean that controls whether the message is persisted on the back end.
  /// Required.
  ///
  /// Parameter [type] :
  /// The type of message, <code>STANDARD</code> or <code>CONTROL</code>.
  ///
  /// <code>STANDARD</code> messages can be up to 4KB in size and contain
  /// metadata. Metadata is arbitrary, and you can use it in a variety of ways,
  /// such as containing a link to an attachment.
  ///
  /// <code>CONTROL</code> messages are limited to 30 bytes and do not contain
  /// metadata.
  ///
  /// Parameter [clientRequestToken] :
  /// The <code>Idempotency</code> token for each client request.
  ///
  /// Parameter [contentType] :
  /// The content type of the channel message.
  ///
  /// Parameter [messageAttributes] :
  /// The attributes for the message, used for message filtering along with a
  /// <code>FilterRule</code> defined in the
  /// <code>PushNotificationPreferences</code>.
  ///
  /// Parameter [metadata] :
  /// The optional metadata for each message.
  ///
  /// Parameter [pushNotification] :
  /// The push notification configuration of the message.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  ///
  /// Parameter [target] :
  /// The target of a message. Must be a member of the channel, such as another
  /// user, a bot, or the sender. Only the target and the sender can view
  /// targeted messages. Only users who can see targeted messages can take
  /// actions on them. However, administrators can delete targeted messages that
  /// they can’t see.
  Future<SendChannelMessageResponse> sendChannelMessage({
    required String channelArn,
    required String chimeBearer,
    required String content,
    required ChannelMessagePersistenceType persistence,
    required ChannelMessageType type,
    String? clientRequestToken,
    String? contentType,
    Map<String, MessageAttributeValue>? messageAttributes,
    String? metadata,
    PushNotificationConfiguration? pushNotification,
    String? subChannelId,
    List<Target>? target,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'Content': content,
      'Persistence': persistence.toValue(),
      'Type': type.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (contentType != null) 'ContentType': contentType,
      if (messageAttributes != null) 'MessageAttributes': messageAttributes,
      if (metadata != null) 'Metadata': metadata,
      if (pushNotification != null) 'PushNotification': pushNotification,
      if (subChannelId != null) 'SubChannelId': subChannelId,
      if (target != null) 'Target': target,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/messages',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return SendChannelMessageResponse.fromJson(response);
  }

  /// Applies the specified tags to the specified Amazon Chime SDK messaging
  /// resource.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ResourceLimitExceededException].
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
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags?operation=tag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified Amazon Chime SDK messaging
  /// resource.
  ///
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
    final $payload = <String, dynamic>{
      'ResourceARN': resourceARN,
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags?operation=untag-resource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Update a channel's attributes.
  ///
  /// <b>Restriction</b>: You can't change a channel's privacy.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [metadata] :
  /// The metadata for the update request.
  ///
  /// Parameter [mode] :
  /// The mode of the update request.
  ///
  /// Parameter [name] :
  /// The name of the channel.
  Future<UpdateChannelResponse> updateChannel({
    required String channelArn,
    required String chimeBearer,
    String? metadata,
    ChannelMode? mode,
    String? name,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      if (metadata != null) 'Metadata': metadata,
      if (mode != null) 'Mode': mode.toValue(),
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Updates channel flow attributes. This is a developer API.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelFlowArn] :
  /// The ARN of the channel flow.
  ///
  /// Parameter [name] :
  /// The name of the channel flow.
  ///
  /// Parameter [processors] :
  /// Information about the processor Lambda functions
  Future<UpdateChannelFlowResponse> updateChannelFlow({
    required String channelFlowArn,
    required String name,
    required List<Processor> processors,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'Processors': processors,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channel-flows/${Uri.encodeComponent(channelFlowArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelFlowResponse.fromJson(response);
  }

  /// Updates the content of a message.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  ///
  /// Parameter [content] :
  /// The content of the channel message.
  ///
  /// Parameter [messageId] :
  /// The ID string of the message being updated.
  ///
  /// Parameter [contentType] :
  /// The content type of the channel message.
  ///
  /// Parameter [metadata] :
  /// The metadata of the message being updated.
  ///
  /// Parameter [subChannelId] :
  /// The ID of the SubChannel in the request.
  /// <note>
  /// Only required when updating messages in a SubChannel that the user belongs
  /// to.
  /// </note>
  Future<UpdateChannelMessageResponse> updateChannelMessage({
    required String channelArn,
    required String chimeBearer,
    required String content,
    required String messageId,
    String? contentType,
    String? metadata,
    String? subChannelId,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'Content': content,
      if (contentType != null) 'ContentType': contentType,
      if (metadata != null) 'Metadata': metadata,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelMessageResponse.fromJson(response);
  }

  /// The details of the time when a user last read messages in a channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call as the value in the header.
  /// </note>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The ARN of the <code>AppInstanceUser</code> or <code>AppInstanceBot</code>
  /// that makes the API call.
  Future<UpdateChannelReadMarkerResponse> updateChannelReadMarker({
    required String channelArn,
    required String chimeBearer,
  }) async {
    final headers = <String, String>{
      'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/readMarker',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelReadMarkerResponse.fromJson(response);
  }
}

enum AllowNotifications {
  all,
  none,
  filtered,
}

extension AllowNotificationsValueExtension on AllowNotifications {
  String toValue() {
    switch (this) {
      case AllowNotifications.all:
        return 'ALL';
      case AllowNotifications.none:
        return 'NONE';
      case AllowNotifications.filtered:
        return 'FILTERED';
    }
  }
}

extension AllowNotificationsFromString on String {
  AllowNotifications toAllowNotifications() {
    switch (this) {
      case 'ALL':
        return AllowNotifications.all;
      case 'NONE':
        return AllowNotifications.none;
      case 'FILTERED':
        return AllowNotifications.filtered;
    }
    throw Exception('$this is not known in enum AllowNotifications');
  }
}

/// Summary of the membership details of an <code>AppInstanceUser</code>.
class AppInstanceUserMembershipSummary {
  /// The time at which an <code>AppInstanceUser</code> last marked a channel as
  /// read.
  final DateTime? readMarkerTimestamp;

  /// The ID of the SubChannel that the <code>AppInstanceUser</code> is a member
  /// of.
  final String? subChannelId;

  /// The type of <code>ChannelMembership</code>.
  final ChannelMembershipType? type;

  AppInstanceUserMembershipSummary({
    this.readMarkerTimestamp,
    this.subChannelId,
    this.type,
  });

  factory AppInstanceUserMembershipSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceUserMembershipSummary(
      readMarkerTimestamp: timeStampFromJson(json['ReadMarkerTimestamp']),
      subChannelId: json['SubChannelId'] as String?,
      type: (json['Type'] as String?)?.toChannelMembershipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final readMarkerTimestamp = this.readMarkerTimestamp;
    final subChannelId = this.subChannelId;
    final type = this.type;
    return {
      if (readMarkerTimestamp != null)
        'ReadMarkerTimestamp': unixTimestampToJson(readMarkerTimestamp),
      if (subChannelId != null) 'SubChannelId': subChannelId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The membership information, including member ARNs, the channel ARN, and
/// membership types.
class BatchChannelMemberships {
  /// The ARN of the channel to which you're adding members.
  final String? channelArn;

  /// The identifier of the member who invited another member.
  final Identity? invitedBy;

  /// The users successfully added to the request.
  final List<Identity>? members;

  /// The ID of the SubChannel.
  final String? subChannelId;

  /// The membership types set for the channel members.
  final ChannelMembershipType? type;

  BatchChannelMemberships({
    this.channelArn,
    this.invitedBy,
    this.members,
    this.subChannelId,
    this.type,
  });

  factory BatchChannelMemberships.fromJson(Map<String, dynamic> json) {
    return BatchChannelMemberships(
      channelArn: json['ChannelArn'] as String?,
      invitedBy: json['InvitedBy'] != null
          ? Identity.fromJson(json['InvitedBy'] as Map<String, dynamic>)
          : null,
      members: (json['Members'] as List?)
          ?.whereNotNull()
          .map((e) => Identity.fromJson(e as Map<String, dynamic>))
          .toList(),
      subChannelId: json['SubChannelId'] as String?,
      type: (json['Type'] as String?)?.toChannelMembershipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final invitedBy = this.invitedBy;
    final members = this.members;
    final subChannelId = this.subChannelId;
    final type = this.type;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (invitedBy != null) 'InvitedBy': invitedBy,
      if (members != null) 'Members': members,
      if (subChannelId != null) 'SubChannelId': subChannelId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// A list of failed member ARNs, error codes, and error messages.
class BatchCreateChannelMembershipError {
  /// The error code.
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The <code>AppInstanceUserArn</code> of the member that the service couldn't
  /// add.
  final String? memberArn;

  BatchCreateChannelMembershipError({
    this.errorCode,
    this.errorMessage,
    this.memberArn,
  });

  factory BatchCreateChannelMembershipError.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateChannelMembershipError(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      memberArn: json['MemberArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final memberArn = this.memberArn;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (memberArn != null) 'MemberArn': memberArn,
    };
  }
}

class BatchCreateChannelMembershipResponse {
  /// The list of channel memberships in the response.
  final BatchChannelMemberships? batchChannelMemberships;

  /// If the action fails for one or more of the memberships in the request, a
  /// list of the memberships is returned, along with error codes and error
  /// messages.
  final List<BatchCreateChannelMembershipError>? errors;

  BatchCreateChannelMembershipResponse({
    this.batchChannelMemberships,
    this.errors,
  });

  factory BatchCreateChannelMembershipResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateChannelMembershipResponse(
      batchChannelMemberships: json['BatchChannelMemberships'] != null
          ? BatchChannelMemberships.fromJson(
              json['BatchChannelMemberships'] as Map<String, dynamic>)
          : null,
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => BatchCreateChannelMembershipError.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchChannelMemberships = this.batchChannelMemberships;
    final errors = this.errors;
    return {
      if (batchChannelMemberships != null)
        'BatchChannelMemberships': batchChannelMemberships,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// The details of a channel.
class Channel {
  /// The ARN of a channel.
  final String? channelArn;

  /// The ARN of the channel flow.
  final String? channelFlowArn;

  /// The <code>AppInstanceUser</code> who created the channel.
  final Identity? createdBy;

  /// The time at which the <code>AppInstanceUser</code> created the channel.
  final DateTime? createdTimestamp;

  /// The attributes required to configure and create an elastic channel. An
  /// elastic channel can support a maximum of 1-million members.
  final ElasticChannelConfiguration? elasticChannelConfiguration;

  /// Settings that control when a channel expires.
  final ExpirationSettings? expirationSettings;

  /// The time at which a member sent the last message in the channel.
  final DateTime? lastMessageTimestamp;

  /// The time at which a channel was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The channel's metadata.
  final String? metadata;

  /// The mode of the channel.
  final ChannelMode? mode;

  /// The name of a channel.
  final String? name;

  /// The channel's privacy setting.
  final ChannelPrivacy? privacy;

  Channel({
    this.channelArn,
    this.channelFlowArn,
    this.createdBy,
    this.createdTimestamp,
    this.elasticChannelConfiguration,
    this.expirationSettings,
    this.lastMessageTimestamp,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.mode,
    this.name,
    this.privacy,
  });

  factory Channel.fromJson(Map<String, dynamic> json) {
    return Channel(
      channelArn: json['ChannelArn'] as String?,
      channelFlowArn: json['ChannelFlowArn'] as String?,
      createdBy: json['CreatedBy'] != null
          ? Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      elasticChannelConfiguration: json['ElasticChannelConfiguration'] != null
          ? ElasticChannelConfiguration.fromJson(
              json['ElasticChannelConfiguration'] as Map<String, dynamic>)
          : null,
      expirationSettings: json['ExpirationSettings'] != null
          ? ExpirationSettings.fromJson(
              json['ExpirationSettings'] as Map<String, dynamic>)
          : null,
      lastMessageTimestamp: timeStampFromJson(json['LastMessageTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      metadata: json['Metadata'] as String?,
      mode: (json['Mode'] as String?)?.toChannelMode(),
      name: json['Name'] as String?,
      privacy: (json['Privacy'] as String?)?.toChannelPrivacy(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelFlowArn = this.channelFlowArn;
    final createdBy = this.createdBy;
    final createdTimestamp = this.createdTimestamp;
    final elasticChannelConfiguration = this.elasticChannelConfiguration;
    final expirationSettings = this.expirationSettings;
    final lastMessageTimestamp = this.lastMessageTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final metadata = this.metadata;
    final mode = this.mode;
    final name = this.name;
    final privacy = this.privacy;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelFlowArn != null) 'ChannelFlowArn': channelFlowArn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (elasticChannelConfiguration != null)
        'ElasticChannelConfiguration': elasticChannelConfiguration,
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
      if (lastMessageTimestamp != null)
        'LastMessageTimestamp': unixTimestampToJson(lastMessageTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (mode != null) 'Mode': mode.toValue(),
      if (name != null) 'Name': name,
      if (privacy != null) 'Privacy': privacy.toValue(),
    };
  }
}

/// Summary of details of a channel associated with channel flow.
class ChannelAssociatedWithFlowSummary {
  /// The ARN of the channel.
  final String? channelArn;

  /// The channel's metadata.
  final String? metadata;

  /// The mode of the channel.
  final ChannelMode? mode;

  /// The name of the channel flow.
  final String? name;

  /// The channel's privacy setting.
  final ChannelPrivacy? privacy;

  ChannelAssociatedWithFlowSummary({
    this.channelArn,
    this.metadata,
    this.mode,
    this.name,
    this.privacy,
  });

  factory ChannelAssociatedWithFlowSummary.fromJson(Map<String, dynamic> json) {
    return ChannelAssociatedWithFlowSummary(
      channelArn: json['ChannelArn'] as String?,
      metadata: json['Metadata'] as String?,
      mode: (json['Mode'] as String?)?.toChannelMode(),
      name: json['Name'] as String?,
      privacy: (json['Privacy'] as String?)?.toChannelPrivacy(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final metadata = this.metadata;
    final mode = this.mode;
    final name = this.name;
    final privacy = this.privacy;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (metadata != null) 'Metadata': metadata,
      if (mode != null) 'Mode': mode.toValue(),
      if (name != null) 'Name': name,
      if (privacy != null) 'Privacy': privacy.toValue(),
    };
  }
}

/// The details of a channel ban.
class ChannelBan {
  /// The ARN of the channel from which a member is being banned.
  final String? channelArn;

  /// The <code>AppInstanceUser</code> who created the ban.
  final Identity? createdBy;

  /// The time at which the ban was created.
  final DateTime? createdTimestamp;

  /// The member being banned from the channel.
  final Identity? member;

  ChannelBan({
    this.channelArn,
    this.createdBy,
    this.createdTimestamp,
    this.member,
  });

  factory ChannelBan.fromJson(Map<String, dynamic> json) {
    return ChannelBan(
      channelArn: json['ChannelArn'] as String?,
      createdBy: json['CreatedBy'] != null
          ? Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final createdBy = this.createdBy;
    final createdTimestamp = this.createdTimestamp;
    final member = this.member;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (member != null) 'Member': member,
    };
  }
}

/// Summary of the details of a <code>ChannelBan</code>.
class ChannelBanSummary {
  /// The member being banned from a channel.
  final Identity? member;

  ChannelBanSummary({
    this.member,
  });

  factory ChannelBanSummary.fromJson(Map<String, dynamic> json) {
    return ChannelBanSummary(
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'Member': member,
    };
  }
}

/// The details of a channel flow.
class ChannelFlow {
  /// The ARN of the channel flow.
  final String? channelFlowArn;

  /// The time at which the channel flow was created.
  final DateTime? createdTimestamp;

  /// The time at which a channel flow was updated.
  final DateTime? lastUpdatedTimestamp;

  /// The name of the channel flow.
  final String? name;

  /// Information about the processor Lambda functions.
  final List<Processor>? processors;

  ChannelFlow({
    this.channelFlowArn,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.name,
    this.processors,
  });

  factory ChannelFlow.fromJson(Map<String, dynamic> json) {
    return ChannelFlow(
      channelFlowArn: json['ChannelFlowArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      name: json['Name'] as String?,
      processors: (json['Processors'] as List?)
          ?.whereNotNull()
          .map((e) => Processor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelFlowArn = this.channelFlowArn;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final name = this.name;
    final processors = this.processors;
    return {
      if (channelFlowArn != null) 'ChannelFlowArn': channelFlowArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (name != null) 'Name': name,
      if (processors != null) 'Processors': processors,
    };
  }
}

class ChannelFlowCallbackResponse {
  /// The call back ID passed in the request.
  final String? callbackId;

  /// The ARN of the channel.
  final String? channelArn;

  ChannelFlowCallbackResponse({
    this.callbackId,
    this.channelArn,
  });

  factory ChannelFlowCallbackResponse.fromJson(Map<String, dynamic> json) {
    return ChannelFlowCallbackResponse(
      callbackId: json['CallbackId'] as String?,
      channelArn: json['ChannelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final callbackId = this.callbackId;
    final channelArn = this.channelArn;
    return {
      if (callbackId != null) 'CallbackId': callbackId,
      if (channelArn != null) 'ChannelArn': channelArn,
    };
  }
}

/// Summary of details of a channel flow.
class ChannelFlowSummary {
  /// The ARN of the channel flow.
  final String? channelFlowArn;

  /// The name of the channel flow.
  final String? name;

  /// Information about the processor Lambda functions.
  final List<Processor>? processors;

  ChannelFlowSummary({
    this.channelFlowArn,
    this.name,
    this.processors,
  });

  factory ChannelFlowSummary.fromJson(Map<String, dynamic> json) {
    return ChannelFlowSummary(
      channelFlowArn: json['ChannelFlowArn'] as String?,
      name: json['Name'] as String?,
      processors: (json['Processors'] as List?)
          ?.whereNotNull()
          .map((e) => Processor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelFlowArn = this.channelFlowArn;
    final name = this.name;
    final processors = this.processors;
    return {
      if (channelFlowArn != null) 'ChannelFlowArn': channelFlowArn,
      if (name != null) 'Name': name,
      if (processors != null) 'Processors': processors,
    };
  }
}

/// The details of a channel member.
class ChannelMembership {
  /// The ARN of the member's channel.
  final String? channelArn;

  /// The time at which the channel membership was created.
  final DateTime? createdTimestamp;

  /// The identifier of the member who invited another member.
  final Identity? invitedBy;

  /// The time at which a channel membership was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The data of the channel member.
  final Identity? member;

  /// The ID of the SubChannel that a user belongs to.
  final String? subChannelId;

  /// The membership type set for the channel member.
  final ChannelMembershipType? type;

  ChannelMembership({
    this.channelArn,
    this.createdTimestamp,
    this.invitedBy,
    this.lastUpdatedTimestamp,
    this.member,
    this.subChannelId,
    this.type,
  });

  factory ChannelMembership.fromJson(Map<String, dynamic> json) {
    return ChannelMembership(
      channelArn: json['ChannelArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      invitedBy: json['InvitedBy'] != null
          ? Identity.fromJson(json['InvitedBy'] as Map<String, dynamic>)
          : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
      subChannelId: json['SubChannelId'] as String?,
      type: (json['Type'] as String?)?.toChannelMembershipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final createdTimestamp = this.createdTimestamp;
    final invitedBy = this.invitedBy;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final member = this.member;
    final subChannelId = this.subChannelId;
    final type = this.type;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (invitedBy != null) 'InvitedBy': invitedBy,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (member != null) 'Member': member,
      if (subChannelId != null) 'SubChannelId': subChannelId,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Summary of the channel membership details of an
/// <code>AppInstanceUser</code>.
class ChannelMembershipForAppInstanceUserSummary {
  /// Returns the channel membership data for an <code>AppInstance</code>.
  final AppInstanceUserMembershipSummary? appInstanceUserMembershipSummary;

  /// Returns the channel data for an <code>AppInstance</code>.
  final ChannelSummary? channelSummary;

  ChannelMembershipForAppInstanceUserSummary({
    this.appInstanceUserMembershipSummary,
    this.channelSummary,
  });

  factory ChannelMembershipForAppInstanceUserSummary.fromJson(
      Map<String, dynamic> json) {
    return ChannelMembershipForAppInstanceUserSummary(
      appInstanceUserMembershipSummary:
          json['AppInstanceUserMembershipSummary'] != null
              ? AppInstanceUserMembershipSummary.fromJson(
                  json['AppInstanceUserMembershipSummary']
                      as Map<String, dynamic>)
              : null,
      channelSummary: json['ChannelSummary'] != null
          ? ChannelSummary.fromJson(
              json['ChannelSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserMembershipSummary =
        this.appInstanceUserMembershipSummary;
    final channelSummary = this.channelSummary;
    return {
      if (appInstanceUserMembershipSummary != null)
        'AppInstanceUserMembershipSummary': appInstanceUserMembershipSummary,
      if (channelSummary != null) 'ChannelSummary': channelSummary,
    };
  }
}

/// The channel membership preferences for an <code>AppInstanceUser</code>.
class ChannelMembershipPreferences {
  /// The push notification configuration of a message.
  final PushNotificationPreferences? pushNotifications;

  ChannelMembershipPreferences({
    this.pushNotifications,
  });

  factory ChannelMembershipPreferences.fromJson(Map<String, dynamic> json) {
    return ChannelMembershipPreferences(
      pushNotifications: json['PushNotifications'] != null
          ? PushNotificationPreferences.fromJson(
              json['PushNotifications'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final pushNotifications = this.pushNotifications;
    return {
      if (pushNotifications != null) 'PushNotifications': pushNotifications,
    };
  }
}

/// Summary of the details of a <code>ChannelMembership</code>.
class ChannelMembershipSummary {
  /// A member's summary data.
  final Identity? member;

  ChannelMembershipSummary({
    this.member,
  });

  factory ChannelMembershipSummary.fromJson(Map<String, dynamic> json) {
    return ChannelMembershipSummary(
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final member = this.member;
    return {
      if (member != null) 'Member': member,
    };
  }
}

enum ChannelMembershipType {
  $default,
  hidden,
}

extension ChannelMembershipTypeValueExtension on ChannelMembershipType {
  String toValue() {
    switch (this) {
      case ChannelMembershipType.$default:
        return 'DEFAULT';
      case ChannelMembershipType.hidden:
        return 'HIDDEN';
    }
  }
}

extension ChannelMembershipTypeFromString on String {
  ChannelMembershipType toChannelMembershipType() {
    switch (this) {
      case 'DEFAULT':
        return ChannelMembershipType.$default;
      case 'HIDDEN':
        return ChannelMembershipType.hidden;
    }
    throw Exception('$this is not known in enum ChannelMembershipType');
  }
}

/// The details of a message in a channel.
class ChannelMessage {
  /// The ARN of the channel.
  final String? channelArn;

  /// The content of the channel message. For Amazon Lex V2 bot responses, this
  /// field holds a list of messages originating from the bot. For more
  /// information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final String? content;

  /// The content type of the channel message. For Amazon Lex V2 bot responses,
  /// the content type is <code>application/amz-chime-lex-msgs</code> for success
  /// responses and <code>application/amz-chime-lex-error</code> for failure
  /// responses. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final String? contentType;

  /// The time at which the message was created.
  final DateTime? createdTimestamp;

  /// The time at which a message was edited.
  final DateTime? lastEditedTimestamp;

  /// The time at which a message was updated.
  final DateTime? lastUpdatedTimestamp;

  /// The attributes for the channel message. For Amazon Lex V2 bot responses, the
  /// attributes are mapped to specific fields from the bot. For more information,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final Map<String, MessageAttributeValue>? messageAttributes;

  /// The ID of a message.
  final String? messageId;

  /// The message metadata.
  final String? metadata;

  /// The persistence setting for a channel message.
  final ChannelMessagePersistenceType? persistence;

  /// Hides the content of a message.
  final bool? redacted;

  /// The message sender.
  final Identity? sender;

  /// The status of the channel message.
  final ChannelMessageStatusStructure? status;

  /// The ID of the SubChannel.
  final String? subChannelId;

  /// The target of a message, a sender, a user, or a bot. Only the target and the
  /// sender can view targeted messages. Only users who can see targeted messages
  /// can take actions on them. However, administrators can delete targeted
  /// messages that they can’t see.
  final List<Target>? target;

  /// The message type.
  final ChannelMessageType? type;

  ChannelMessage({
    this.channelArn,
    this.content,
    this.contentType,
    this.createdTimestamp,
    this.lastEditedTimestamp,
    this.lastUpdatedTimestamp,
    this.messageAttributes,
    this.messageId,
    this.metadata,
    this.persistence,
    this.redacted,
    this.sender,
    this.status,
    this.subChannelId,
    this.target,
    this.type,
  });

  factory ChannelMessage.fromJson(Map<String, dynamic> json) {
    return ChannelMessage(
      channelArn: json['ChannelArn'] as String?,
      content: json['Content'] as String?,
      contentType: json['ContentType'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastEditedTimestamp: timeStampFromJson(json['LastEditedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      messageAttributes: (json['MessageAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, MessageAttributeValue.fromJson(e as Map<String, dynamic>))),
      messageId: json['MessageId'] as String?,
      metadata: json['Metadata'] as String?,
      persistence:
          (json['Persistence'] as String?)?.toChannelMessagePersistenceType(),
      redacted: json['Redacted'] as bool?,
      sender: json['Sender'] != null
          ? Identity.fromJson(json['Sender'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? ChannelMessageStatusStructure.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      subChannelId: json['SubChannelId'] as String?,
      target: (json['Target'] as List?)
          ?.whereNotNull()
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toChannelMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final content = this.content;
    final contentType = this.contentType;
    final createdTimestamp = this.createdTimestamp;
    final lastEditedTimestamp = this.lastEditedTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final messageAttributes = this.messageAttributes;
    final messageId = this.messageId;
    final metadata = this.metadata;
    final persistence = this.persistence;
    final redacted = this.redacted;
    final sender = this.sender;
    final status = this.status;
    final subChannelId = this.subChannelId;
    final target = this.target;
    final type = this.type;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (content != null) 'Content': content,
      if (contentType != null) 'ContentType': contentType,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastEditedTimestamp != null)
        'LastEditedTimestamp': unixTimestampToJson(lastEditedTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (messageAttributes != null) 'MessageAttributes': messageAttributes,
      if (messageId != null) 'MessageId': messageId,
      if (metadata != null) 'Metadata': metadata,
      if (persistence != null) 'Persistence': persistence.toValue(),
      if (redacted != null) 'Redacted': redacted,
      if (sender != null) 'Sender': sender,
      if (status != null) 'Status': status,
      if (subChannelId != null) 'SubChannelId': subChannelId,
      if (target != null) 'Target': target,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Stores information about a callback.
class ChannelMessageCallback {
  /// The message ID.
  final String messageId;

  /// The message content. For Amazon Lex V2 bot responses, this field holds a
  /// list of messages originating from the bot. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final String? content;

  /// The content type of the call-back message. For Amazon Lex V2 bot responses,
  /// the content type is <code>application/amz-chime-lex-msgs</code> for success
  /// responses and <code>application/amz-chime-lex-error</code> for failure
  /// responses. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final String? contentType;

  /// The attributes for the channel message. For Amazon Lex V2 bot responses, the
  /// attributes are mapped to specific fields from the bot. For more information,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final Map<String, MessageAttributeValue>? messageAttributes;

  /// The message metadata.
  final String? metadata;

  /// The push notification configuration of the message.
  final PushNotificationConfiguration? pushNotification;

  /// The ID of the SubChannel.
  final String? subChannelId;

  ChannelMessageCallback({
    required this.messageId,
    this.content,
    this.contentType,
    this.messageAttributes,
    this.metadata,
    this.pushNotification,
    this.subChannelId,
  });

  Map<String, dynamic> toJson() {
    final messageId = this.messageId;
    final content = this.content;
    final contentType = this.contentType;
    final messageAttributes = this.messageAttributes;
    final metadata = this.metadata;
    final pushNotification = this.pushNotification;
    final subChannelId = this.subChannelId;
    return {
      'MessageId': messageId,
      if (content != null) 'Content': content,
      if (contentType != null) 'ContentType': contentType,
      if (messageAttributes != null) 'MessageAttributes': messageAttributes,
      if (metadata != null) 'Metadata': metadata,
      if (pushNotification != null) 'PushNotification': pushNotification,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

enum ChannelMessagePersistenceType {
  persistent,
  nonPersistent,
}

extension ChannelMessagePersistenceTypeValueExtension
    on ChannelMessagePersistenceType {
  String toValue() {
    switch (this) {
      case ChannelMessagePersistenceType.persistent:
        return 'PERSISTENT';
      case ChannelMessagePersistenceType.nonPersistent:
        return 'NON_PERSISTENT';
    }
  }
}

extension ChannelMessagePersistenceTypeFromString on String {
  ChannelMessagePersistenceType toChannelMessagePersistenceType() {
    switch (this) {
      case 'PERSISTENT':
        return ChannelMessagePersistenceType.persistent;
      case 'NON_PERSISTENT':
        return ChannelMessagePersistenceType.nonPersistent;
    }
    throw Exception('$this is not known in enum ChannelMessagePersistenceType');
  }
}

enum ChannelMessageStatus {
  sent,
  pending,
  failed,
  denied,
}

extension ChannelMessageStatusValueExtension on ChannelMessageStatus {
  String toValue() {
    switch (this) {
      case ChannelMessageStatus.sent:
        return 'SENT';
      case ChannelMessageStatus.pending:
        return 'PENDING';
      case ChannelMessageStatus.failed:
        return 'FAILED';
      case ChannelMessageStatus.denied:
        return 'DENIED';
    }
  }
}

extension ChannelMessageStatusFromString on String {
  ChannelMessageStatus toChannelMessageStatus() {
    switch (this) {
      case 'SENT':
        return ChannelMessageStatus.sent;
      case 'PENDING':
        return ChannelMessageStatus.pending;
      case 'FAILED':
        return ChannelMessageStatus.failed;
      case 'DENIED':
        return ChannelMessageStatus.denied;
    }
    throw Exception('$this is not known in enum ChannelMessageStatus');
  }
}

/// Stores information about a message status.
class ChannelMessageStatusStructure {
  /// Contains more details about the message status.
  final String? detail;

  /// The message status value.
  final ChannelMessageStatus? value;

  ChannelMessageStatusStructure({
    this.detail,
    this.value,
  });

  factory ChannelMessageStatusStructure.fromJson(Map<String, dynamic> json) {
    return ChannelMessageStatusStructure(
      detail: json['Detail'] as String?,
      value: (json['Value'] as String?)?.toChannelMessageStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final detail = this.detail;
    final value = this.value;
    return {
      if (detail != null) 'Detail': detail,
      if (value != null) 'Value': value.toValue(),
    };
  }
}

/// Summary of the messages in a <code>Channel</code>.
class ChannelMessageSummary {
  /// The content of the channel message. For Amazon Lex V2 bot responses, this
  /// field holds a list of messages originating from the bot. For more
  /// information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final String? content;

  /// The content type of the channel message listed in the summary. For Amazon
  /// Lex V2 bot responses, the content type is
  /// <code>application/amz-chime-lex-msgs</code> for success responses and
  /// <code>application/amz-chime-lex-error</code> for failure responses. For more
  /// information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final String? contentType;

  /// The time at which the message summary was created.
  final DateTime? createdTimestamp;

  /// The time at which a message was last edited.
  final DateTime? lastEditedTimestamp;

  /// The time at which a message was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The attributes for the channel message. For Amazon Lex V2 bot responses, the
  /// attributes are mapped to specific fields from the bot. For more information,
  /// refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/appinstance-bots#process-response.html">Processing
  /// responses from an AppInstanceBot</a> in the <i>Amazon Chime SDK Messaging
  /// Developer Guide</i>.
  final Map<String, MessageAttributeValue>? messageAttributes;

  /// The ID of the message.
  final String? messageId;

  /// The metadata of the message.
  final String? metadata;

  /// Indicates whether a message was redacted.
  final bool? redacted;

  /// The message sender.
  final Identity? sender;

  /// The message status. The status value is <code>SENT</code> for messages sent
  /// to a channel without a channel flow. For channels associated with channel
  /// flow, the value determines the processing stage.
  final ChannelMessageStatusStructure? status;

  /// The target of a message, a sender, a user, or a bot. Only the target and the
  /// sender can view targeted messages. Only users who can see targeted messages
  /// can take actions on them. However, administrators can delete targeted
  /// messages that they can’t see.
  final List<Target>? target;

  /// The type of message.
  final ChannelMessageType? type;

  ChannelMessageSummary({
    this.content,
    this.contentType,
    this.createdTimestamp,
    this.lastEditedTimestamp,
    this.lastUpdatedTimestamp,
    this.messageAttributes,
    this.messageId,
    this.metadata,
    this.redacted,
    this.sender,
    this.status,
    this.target,
    this.type,
  });

  factory ChannelMessageSummary.fromJson(Map<String, dynamic> json) {
    return ChannelMessageSummary(
      content: json['Content'] as String?,
      contentType: json['ContentType'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastEditedTimestamp: timeStampFromJson(json['LastEditedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      messageAttributes: (json['MessageAttributes'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, MessageAttributeValue.fromJson(e as Map<String, dynamic>))),
      messageId: json['MessageId'] as String?,
      metadata: json['Metadata'] as String?,
      redacted: json['Redacted'] as bool?,
      sender: json['Sender'] != null
          ? Identity.fromJson(json['Sender'] as Map<String, dynamic>)
          : null,
      status: json['Status'] != null
          ? ChannelMessageStatusStructure.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      target: (json['Target'] as List?)
          ?.whereNotNull()
          .map((e) => Target.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['Type'] as String?)?.toChannelMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final contentType = this.contentType;
    final createdTimestamp = this.createdTimestamp;
    final lastEditedTimestamp = this.lastEditedTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final messageAttributes = this.messageAttributes;
    final messageId = this.messageId;
    final metadata = this.metadata;
    final redacted = this.redacted;
    final sender = this.sender;
    final status = this.status;
    final target = this.target;
    final type = this.type;
    return {
      if (content != null) 'Content': content,
      if (contentType != null) 'ContentType': contentType,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastEditedTimestamp != null)
        'LastEditedTimestamp': unixTimestampToJson(lastEditedTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (messageAttributes != null) 'MessageAttributes': messageAttributes,
      if (messageId != null) 'MessageId': messageId,
      if (metadata != null) 'Metadata': metadata,
      if (redacted != null) 'Redacted': redacted,
      if (sender != null) 'Sender': sender,
      if (status != null) 'Status': status,
      if (target != null) 'Target': target,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ChannelMessageType {
  standard,
  control,
}

extension ChannelMessageTypeValueExtension on ChannelMessageType {
  String toValue() {
    switch (this) {
      case ChannelMessageType.standard:
        return 'STANDARD';
      case ChannelMessageType.control:
        return 'CONTROL';
    }
  }
}

extension ChannelMessageTypeFromString on String {
  ChannelMessageType toChannelMessageType() {
    switch (this) {
      case 'STANDARD':
        return ChannelMessageType.standard;
      case 'CONTROL':
        return ChannelMessageType.control;
    }
    throw Exception('$this is not known in enum ChannelMessageType');
  }
}

enum ChannelMode {
  unrestricted,
  restricted,
}

extension ChannelModeValueExtension on ChannelMode {
  String toValue() {
    switch (this) {
      case ChannelMode.unrestricted:
        return 'UNRESTRICTED';
      case ChannelMode.restricted:
        return 'RESTRICTED';
    }
  }
}

extension ChannelModeFromString on String {
  ChannelMode toChannelMode() {
    switch (this) {
      case 'UNRESTRICTED':
        return ChannelMode.unrestricted;
      case 'RESTRICTED':
        return ChannelMode.restricted;
    }
    throw Exception('$this is not known in enum ChannelMode');
  }
}

/// Summary of the details of a moderated channel.
class ChannelModeratedByAppInstanceUserSummary {
  /// Summary of the details of a <code>Channel</code>.
  final ChannelSummary? channelSummary;

  ChannelModeratedByAppInstanceUserSummary({
    this.channelSummary,
  });

  factory ChannelModeratedByAppInstanceUserSummary.fromJson(
      Map<String, dynamic> json) {
    return ChannelModeratedByAppInstanceUserSummary(
      channelSummary: json['ChannelSummary'] != null
          ? ChannelSummary.fromJson(
              json['ChannelSummary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelSummary = this.channelSummary;
    return {
      if (channelSummary != null) 'ChannelSummary': channelSummary,
    };
  }
}

/// The details of a channel moderator.
class ChannelModerator {
  /// The ARN of the moderator's channel.
  final String? channelArn;

  /// The <code>AppInstanceUser</code> who created the moderator.
  final Identity? createdBy;

  /// The time at which the moderator was created.
  final DateTime? createdTimestamp;

  /// The moderator's data.
  final Identity? moderator;

  ChannelModerator({
    this.channelArn,
    this.createdBy,
    this.createdTimestamp,
    this.moderator,
  });

  factory ChannelModerator.fromJson(Map<String, dynamic> json) {
    return ChannelModerator(
      channelArn: json['ChannelArn'] as String?,
      createdBy: json['CreatedBy'] != null
          ? Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      moderator: json['Moderator'] != null
          ? Identity.fromJson(json['Moderator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final createdBy = this.createdBy;
    final createdTimestamp = this.createdTimestamp;
    final moderator = this.moderator;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (moderator != null) 'Moderator': moderator,
    };
  }
}

/// Summary of the details of a <code>ChannelModerator</code>.
class ChannelModeratorSummary {
  /// The data for a moderator.
  final Identity? moderator;

  ChannelModeratorSummary({
    this.moderator,
  });

  factory ChannelModeratorSummary.fromJson(Map<String, dynamic> json) {
    return ChannelModeratorSummary(
      moderator: json['Moderator'] != null
          ? Identity.fromJson(json['Moderator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final moderator = this.moderator;
    return {
      if (moderator != null) 'Moderator': moderator,
    };
  }
}

enum ChannelPrivacy {
  public,
  private,
}

extension ChannelPrivacyValueExtension on ChannelPrivacy {
  String toValue() {
    switch (this) {
      case ChannelPrivacy.public:
        return 'PUBLIC';
      case ChannelPrivacy.private:
        return 'PRIVATE';
    }
  }
}

extension ChannelPrivacyFromString on String {
  ChannelPrivacy toChannelPrivacy() {
    switch (this) {
      case 'PUBLIC':
        return ChannelPrivacy.public;
      case 'PRIVATE':
        return ChannelPrivacy.private;
    }
    throw Exception('$this is not known in enum ChannelPrivacy');
  }
}

/// Summary of the details of a <code>Channel</code>.
class ChannelSummary {
  /// The ARN of the channel.
  final String? channelArn;

  /// The time at which the last persistent message visible to the caller in a
  /// channel was sent.
  final DateTime? lastMessageTimestamp;

  /// The metadata of the channel.
  final String? metadata;

  /// The mode of the channel.
  final ChannelMode? mode;

  /// The name of the channel.
  final String? name;

  /// The privacy setting of the channel.
  final ChannelPrivacy? privacy;

  ChannelSummary({
    this.channelArn,
    this.lastMessageTimestamp,
    this.metadata,
    this.mode,
    this.name,
    this.privacy,
  });

  factory ChannelSummary.fromJson(Map<String, dynamic> json) {
    return ChannelSummary(
      channelArn: json['ChannelArn'] as String?,
      lastMessageTimestamp: timeStampFromJson(json['LastMessageTimestamp']),
      metadata: json['Metadata'] as String?,
      mode: (json['Mode'] as String?)?.toChannelMode(),
      name: json['Name'] as String?,
      privacy: (json['Privacy'] as String?)?.toChannelPrivacy(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final lastMessageTimestamp = this.lastMessageTimestamp;
    final metadata = this.metadata;
    final mode = this.mode;
    final name = this.name;
    final privacy = this.privacy;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (lastMessageTimestamp != null)
        'LastMessageTimestamp': unixTimestampToJson(lastMessageTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (mode != null) 'Mode': mode.toValue(),
      if (name != null) 'Name': name,
      if (privacy != null) 'Privacy': privacy.toValue(),
    };
  }
}

class CreateChannelBanResponse {
  /// The ARN of the response to the ban request.
  final String? channelArn;

  /// The <code>ChannelArn</code> and <code>BannedIdentity</code> of the member in
  /// the ban response.
  final Identity? member;

  CreateChannelBanResponse({
    this.channelArn,
    this.member,
  });

  factory CreateChannelBanResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelBanResponse(
      channelArn: json['ChannelArn'] as String?,
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final member = this.member;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (member != null) 'Member': member,
    };
  }
}

class CreateChannelFlowResponse {
  /// The ARN of the channel flow.
  final String? channelFlowArn;

  CreateChannelFlowResponse({
    this.channelFlowArn,
  });

  factory CreateChannelFlowResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelFlowResponse(
      channelFlowArn: json['ChannelFlowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelFlowArn = this.channelFlowArn;
    return {
      if (channelFlowArn != null) 'ChannelFlowArn': channelFlowArn,
    };
  }
}

class CreateChannelMembershipResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ARN and metadata of the member being added.
  final Identity? member;

  /// The ID of the SubChannel in the response.
  final String? subChannelId;

  CreateChannelMembershipResponse({
    this.channelArn,
    this.member,
    this.subChannelId,
  });

  factory CreateChannelMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelMembershipResponse(
      channelArn: json['ChannelArn'] as String?,
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
      subChannelId: json['SubChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final member = this.member;
    final subChannelId = this.subChannelId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (member != null) 'Member': member,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

class CreateChannelModeratorResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ARNs of the channel and the moderator.
  final Identity? channelModerator;

  CreateChannelModeratorResponse({
    this.channelArn,
    this.channelModerator,
  });

  factory CreateChannelModeratorResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelModeratorResponse(
      channelArn: json['ChannelArn'] as String?,
      channelModerator: json['ChannelModerator'] != null
          ? Identity.fromJson(json['ChannelModerator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelModerator = this.channelModerator;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelModerator != null) 'ChannelModerator': channelModerator,
    };
  }
}

class CreateChannelResponse {
  /// The ARN of the channel.
  final String? channelArn;

  CreateChannelResponse({
    this.channelArn,
  });

  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelResponse(
      channelArn: json['ChannelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
    };
  }
}

class DescribeChannelBanResponse {
  /// The details of the ban.
  final ChannelBan? channelBan;

  DescribeChannelBanResponse({
    this.channelBan,
  });

  factory DescribeChannelBanResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelBanResponse(
      channelBan: json['ChannelBan'] != null
          ? ChannelBan.fromJson(json['ChannelBan'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelBan = this.channelBan;
    return {
      if (channelBan != null) 'ChannelBan': channelBan,
    };
  }
}

class DescribeChannelFlowResponse {
  /// The channel flow details.
  final ChannelFlow? channelFlow;

  DescribeChannelFlowResponse({
    this.channelFlow,
  });

  factory DescribeChannelFlowResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelFlowResponse(
      channelFlow: json['ChannelFlow'] != null
          ? ChannelFlow.fromJson(json['ChannelFlow'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelFlow = this.channelFlow;
    return {
      if (channelFlow != null) 'ChannelFlow': channelFlow,
    };
  }
}

class DescribeChannelMembershipForAppInstanceUserResponse {
  /// The channel to which a user belongs.
  final ChannelMembershipForAppInstanceUserSummary? channelMembership;

  DescribeChannelMembershipForAppInstanceUserResponse({
    this.channelMembership,
  });

  factory DescribeChannelMembershipForAppInstanceUserResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeChannelMembershipForAppInstanceUserResponse(
      channelMembership: json['ChannelMembership'] != null
          ? ChannelMembershipForAppInstanceUserSummary.fromJson(
              json['ChannelMembership'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelMembership = this.channelMembership;
    return {
      if (channelMembership != null) 'ChannelMembership': channelMembership,
    };
  }
}

class DescribeChannelMembershipResponse {
  /// The details of the membership.
  final ChannelMembership? channelMembership;

  DescribeChannelMembershipResponse({
    this.channelMembership,
  });

  factory DescribeChannelMembershipResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeChannelMembershipResponse(
      channelMembership: json['ChannelMembership'] != null
          ? ChannelMembership.fromJson(
              json['ChannelMembership'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelMembership = this.channelMembership;
    return {
      if (channelMembership != null) 'ChannelMembership': channelMembership,
    };
  }
}

class DescribeChannelModeratedByAppInstanceUserResponse {
  /// The moderated channel.
  final ChannelModeratedByAppInstanceUserSummary? channel;

  DescribeChannelModeratedByAppInstanceUserResponse({
    this.channel,
  });

  factory DescribeChannelModeratedByAppInstanceUserResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeChannelModeratedByAppInstanceUserResponse(
      channel: json['Channel'] != null
          ? ChannelModeratedByAppInstanceUserSummary.fromJson(
              json['Channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'Channel': channel,
    };
  }
}

class DescribeChannelModeratorResponse {
  /// The details of the channel moderator.
  final ChannelModerator? channelModerator;

  DescribeChannelModeratorResponse({
    this.channelModerator,
  });

  factory DescribeChannelModeratorResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelModeratorResponse(
      channelModerator: json['ChannelModerator'] != null
          ? ChannelModerator.fromJson(
              json['ChannelModerator'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelModerator = this.channelModerator;
    return {
      if (channelModerator != null) 'ChannelModerator': channelModerator,
    };
  }
}

class DescribeChannelResponse {
  /// The channel details.
  final Channel? channel;

  DescribeChannelResponse({
    this.channel,
  });

  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) {
    return DescribeChannelResponse(
      channel: json['Channel'] != null
          ? Channel.fromJson(json['Channel'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channel = this.channel;
    return {
      if (channel != null) 'Channel': channel,
    };
  }
}

/// The attributes required to configure and create an elastic channel. An
/// elastic channel can support a maximum of 1-million members.
class ElasticChannelConfiguration {
  /// The maximum number of SubChannels that you want to allow in the elastic
  /// channel.
  final int maximumSubChannels;

  /// The minimum allowed percentage of TargetMembershipsPerSubChannel users. Ceil
  /// of the calculated value is used in balancing members among SubChannels of
  /// the elastic channel.
  final int minimumMembershipPercentage;

  /// The maximum number of members allowed in a SubChannel.
  final int targetMembershipsPerSubChannel;

  ElasticChannelConfiguration({
    required this.maximumSubChannels,
    required this.minimumMembershipPercentage,
    required this.targetMembershipsPerSubChannel,
  });

  factory ElasticChannelConfiguration.fromJson(Map<String, dynamic> json) {
    return ElasticChannelConfiguration(
      maximumSubChannels: json['MaximumSubChannels'] as int,
      minimumMembershipPercentage: json['MinimumMembershipPercentage'] as int,
      targetMembershipsPerSubChannel:
          json['TargetMembershipsPerSubChannel'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final maximumSubChannels = this.maximumSubChannels;
    final minimumMembershipPercentage = this.minimumMembershipPercentage;
    final targetMembershipsPerSubChannel = this.targetMembershipsPerSubChannel;
    return {
      'MaximumSubChannels': maximumSubChannels,
      'MinimumMembershipPercentage': minimumMembershipPercentage,
      'TargetMembershipsPerSubChannel': targetMembershipsPerSubChannel,
    };
  }
}

enum ErrorCode {
  badRequest,
  conflict,
  forbidden,
  notFound,
  preconditionFailed,
  resourceLimitExceeded,
  serviceFailure,
  accessDenied,
  serviceUnavailable,
  throttled,
  throttling,
  unauthorized,
  unprocessable,
  voiceConnectorGroupAssociationsExist,
  phoneNumberAssociationsExist,
}

extension ErrorCodeValueExtension on ErrorCode {
  String toValue() {
    switch (this) {
      case ErrorCode.badRequest:
        return 'BadRequest';
      case ErrorCode.conflict:
        return 'Conflict';
      case ErrorCode.forbidden:
        return 'Forbidden';
      case ErrorCode.notFound:
        return 'NotFound';
      case ErrorCode.preconditionFailed:
        return 'PreconditionFailed';
      case ErrorCode.resourceLimitExceeded:
        return 'ResourceLimitExceeded';
      case ErrorCode.serviceFailure:
        return 'ServiceFailure';
      case ErrorCode.accessDenied:
        return 'AccessDenied';
      case ErrorCode.serviceUnavailable:
        return 'ServiceUnavailable';
      case ErrorCode.throttled:
        return 'Throttled';
      case ErrorCode.throttling:
        return 'Throttling';
      case ErrorCode.unauthorized:
        return 'Unauthorized';
      case ErrorCode.unprocessable:
        return 'Unprocessable';
      case ErrorCode.voiceConnectorGroupAssociationsExist:
        return 'VoiceConnectorGroupAssociationsExist';
      case ErrorCode.phoneNumberAssociationsExist:
        return 'PhoneNumberAssociationsExist';
    }
  }
}

extension ErrorCodeFromString on String {
  ErrorCode toErrorCode() {
    switch (this) {
      case 'BadRequest':
        return ErrorCode.badRequest;
      case 'Conflict':
        return ErrorCode.conflict;
      case 'Forbidden':
        return ErrorCode.forbidden;
      case 'NotFound':
        return ErrorCode.notFound;
      case 'PreconditionFailed':
        return ErrorCode.preconditionFailed;
      case 'ResourceLimitExceeded':
        return ErrorCode.resourceLimitExceeded;
      case 'ServiceFailure':
        return ErrorCode.serviceFailure;
      case 'AccessDenied':
        return ErrorCode.accessDenied;
      case 'ServiceUnavailable':
        return ErrorCode.serviceUnavailable;
      case 'Throttled':
        return ErrorCode.throttled;
      case 'Throttling':
        return ErrorCode.throttling;
      case 'Unauthorized':
        return ErrorCode.unauthorized;
      case 'Unprocessable':
        return ErrorCode.unprocessable;
      case 'VoiceConnectorGroupAssociationsExist':
        return ErrorCode.voiceConnectorGroupAssociationsExist;
      case 'PhoneNumberAssociationsExist':
        return ErrorCode.phoneNumberAssociationsExist;
    }
    throw Exception('$this is not known in enum ErrorCode');
  }
}

enum ExpirationCriterion {
  createdTimestamp,
  lastMessageTimestamp,
}

extension ExpirationCriterionValueExtension on ExpirationCriterion {
  String toValue() {
    switch (this) {
      case ExpirationCriterion.createdTimestamp:
        return 'CREATED_TIMESTAMP';
      case ExpirationCriterion.lastMessageTimestamp:
        return 'LAST_MESSAGE_TIMESTAMP';
    }
  }
}

extension ExpirationCriterionFromString on String {
  ExpirationCriterion toExpirationCriterion() {
    switch (this) {
      case 'CREATED_TIMESTAMP':
        return ExpirationCriterion.createdTimestamp;
      case 'LAST_MESSAGE_TIMESTAMP':
        return ExpirationCriterion.lastMessageTimestamp;
    }
    throw Exception('$this is not known in enum ExpirationCriterion');
  }
}

/// Settings that control the interval after which a channel is deleted.
class ExpirationSettings {
  /// The conditions that must be met for a channel to expire.
  final ExpirationCriterion expirationCriterion;

  /// The period in days after which the system automatically deletes a channel.
  final int expirationDays;

  ExpirationSettings({
    required this.expirationCriterion,
    required this.expirationDays,
  });

  factory ExpirationSettings.fromJson(Map<String, dynamic> json) {
    return ExpirationSettings(
      expirationCriterion:
          (json['ExpirationCriterion'] as String).toExpirationCriterion(),
      expirationDays: json['ExpirationDays'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final expirationCriterion = this.expirationCriterion;
    final expirationDays = this.expirationDays;
    return {
      'ExpirationCriterion': expirationCriterion.toValue(),
      'ExpirationDays': expirationDays,
    };
  }
}

enum FallbackAction {
  $continue,
  abort,
}

extension FallbackActionValueExtension on FallbackAction {
  String toValue() {
    switch (this) {
      case FallbackAction.$continue:
        return 'CONTINUE';
      case FallbackAction.abort:
        return 'ABORT';
    }
  }
}

extension FallbackActionFromString on String {
  FallbackAction toFallbackAction() {
    switch (this) {
      case 'CONTINUE':
        return FallbackAction.$continue;
      case 'ABORT':
        return FallbackAction.abort;
    }
    throw Exception('$this is not known in enum FallbackAction');
  }
}

class GetChannelMembershipPreferencesResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The details of a user.
  final Identity? member;

  /// The channel membership preferences for an <code>AppInstanceUser</code> .
  final ChannelMembershipPreferences? preferences;

  GetChannelMembershipPreferencesResponse({
    this.channelArn,
    this.member,
    this.preferences,
  });

  factory GetChannelMembershipPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return GetChannelMembershipPreferencesResponse(
      channelArn: json['ChannelArn'] as String?,
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
      preferences: json['Preferences'] != null
          ? ChannelMembershipPreferences.fromJson(
              json['Preferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final member = this.member;
    final preferences = this.preferences;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (member != null) 'Member': member,
      if (preferences != null) 'Preferences': preferences,
    };
  }
}

class GetChannelMessageResponse {
  /// The details of and content in the message.
  final ChannelMessage? channelMessage;

  GetChannelMessageResponse({
    this.channelMessage,
  });

  factory GetChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelMessageResponse(
      channelMessage: json['ChannelMessage'] != null
          ? ChannelMessage.fromJson(
              json['ChannelMessage'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelMessage = this.channelMessage;
    return {
      if (channelMessage != null) 'ChannelMessage': channelMessage,
    };
  }
}

class GetChannelMessageStatusResponse {
  /// The message status and details.
  final ChannelMessageStatusStructure? status;

  GetChannelMessageStatusResponse({
    this.status,
  });

  factory GetChannelMessageStatusResponse.fromJson(Map<String, dynamic> json) {
    return GetChannelMessageStatusResponse(
      status: json['Status'] != null
          ? ChannelMessageStatusStructure.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'Status': status,
    };
  }
}

class GetMessagingSessionEndpointResponse {
  /// The endpoint returned in the response.
  final MessagingSessionEndpoint? endpoint;

  GetMessagingSessionEndpointResponse({
    this.endpoint,
  });

  factory GetMessagingSessionEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMessagingSessionEndpointResponse(
      endpoint: json['Endpoint'] != null
          ? MessagingSessionEndpoint.fromJson(
              json['Endpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

class GetMessagingStreamingConfigurationsResponse {
  /// The streaming settings.
  final List<StreamingConfiguration>? streamingConfigurations;

  GetMessagingStreamingConfigurationsResponse({
    this.streamingConfigurations,
  });

  factory GetMessagingStreamingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetMessagingStreamingConfigurationsResponse(
      streamingConfigurations: (json['StreamingConfigurations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => StreamingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final streamingConfigurations = this.streamingConfigurations;
    return {
      if (streamingConfigurations != null)
        'StreamingConfigurations': streamingConfigurations,
    };
  }
}

/// The details of a user or bot.
class Identity {
  /// The ARN in an Identity.
  final String? arn;

  /// The name in an Identity.
  final String? name;

  Identity({
    this.arn,
    this.name,
  });

  factory Identity.fromJson(Map<String, dynamic> json) {
    return Identity(
      arn: json['Arn'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final name = this.name;
    return {
      if (arn != null) 'Arn': arn,
      if (name != null) 'Name': name,
    };
  }
}

enum InvocationType {
  async,
}

extension InvocationTypeValueExtension on InvocationType {
  String toValue() {
    switch (this) {
      case InvocationType.async:
        return 'ASYNC';
    }
  }
}

extension InvocationTypeFromString on String {
  InvocationType toInvocationType() {
    switch (this) {
      case 'ASYNC':
        return InvocationType.async;
    }
    throw Exception('$this is not known in enum InvocationType');
  }
}

/// Stores metadata about a Lambda processor.
class LambdaConfiguration {
  /// Controls how the Lambda function is invoked.
  final InvocationType invocationType;

  /// The ARN of the Lambda message processing function.
  final String resourceArn;

  LambdaConfiguration({
    required this.invocationType,
    required this.resourceArn,
  });

  factory LambdaConfiguration.fromJson(Map<String, dynamic> json) {
    return LambdaConfiguration(
      invocationType: (json['InvocationType'] as String).toInvocationType(),
      resourceArn: json['ResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final invocationType = this.invocationType;
    final resourceArn = this.resourceArn;
    return {
      'InvocationType': invocationType.toValue(),
      'ResourceArn': resourceArn,
    };
  }
}

class ListChannelBansResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The information for each requested ban.
  final List<ChannelBanSummary>? channelBans;

  /// The token passed by previous API calls until all requested bans are
  /// returned.
  final String? nextToken;

  ListChannelBansResponse({
    this.channelArn,
    this.channelBans,
    this.nextToken,
  });

  factory ListChannelBansResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelBansResponse(
      channelArn: json['ChannelArn'] as String?,
      channelBans: (json['ChannelBans'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelBanSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelBans = this.channelBans;
    final nextToken = this.nextToken;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelBans != null) 'ChannelBans': channelBans,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelFlowsResponse {
  /// The information about each channel flow.
  final List<ChannelFlowSummary>? channelFlows;

  /// The token passed by previous API calls until all requested channels are
  /// returned.
  final String? nextToken;

  ListChannelFlowsResponse({
    this.channelFlows,
    this.nextToken,
  });

  factory ListChannelFlowsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelFlowsResponse(
      channelFlows: (json['ChannelFlows'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelFlowSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelFlows = this.channelFlows;
    final nextToken = this.nextToken;
    return {
      if (channelFlows != null) 'ChannelFlows': channelFlows,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelMembershipsForAppInstanceUserResponse {
  /// The information for the requested channel memberships.
  final List<ChannelMembershipForAppInstanceUserSummary>? channelMemberships;

  /// The token passed by previous API calls until all requested users are
  /// returned.
  final String? nextToken;

  ListChannelMembershipsForAppInstanceUserResponse({
    this.channelMemberships,
    this.nextToken,
  });

  factory ListChannelMembershipsForAppInstanceUserResponse.fromJson(
      Map<String, dynamic> json) {
    return ListChannelMembershipsForAppInstanceUserResponse(
      channelMemberships: (json['ChannelMemberships'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelMembershipForAppInstanceUserSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelMemberships = this.channelMemberships;
    final nextToken = this.nextToken;
    return {
      if (channelMemberships != null) 'ChannelMemberships': channelMemberships,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelMembershipsResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The information for the requested channel memberships.
  final List<ChannelMembershipSummary>? channelMemberships;

  /// The token passed by previous API calls until all requested channel
  /// memberships are returned.
  final String? nextToken;

  ListChannelMembershipsResponse({
    this.channelArn,
    this.channelMemberships,
    this.nextToken,
  });

  factory ListChannelMembershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelMembershipsResponse(
      channelArn: json['ChannelArn'] as String?,
      channelMemberships: (json['ChannelMemberships'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ChannelMembershipSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelMemberships = this.channelMemberships;
    final nextToken = this.nextToken;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelMemberships != null) 'ChannelMemberships': channelMemberships,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelMessagesResponse {
  /// The ARN of the channel containing the requested messages.
  final String? channelArn;

  /// The information about, and content of, each requested message.
  final List<ChannelMessageSummary>? channelMessages;

  /// The token passed by previous API calls until all requested messages are
  /// returned.
  final String? nextToken;

  /// The ID of the SubChannel in the response.
  final String? subChannelId;

  ListChannelMessagesResponse({
    this.channelArn,
    this.channelMessages,
    this.nextToken,
    this.subChannelId,
  });

  factory ListChannelMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelMessagesResponse(
      channelArn: json['ChannelArn'] as String?,
      channelMessages: (json['ChannelMessages'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelMessageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
      subChannelId: json['SubChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelMessages = this.channelMessages;
    final nextToken = this.nextToken;
    final subChannelId = this.subChannelId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelMessages != null) 'ChannelMessages': channelMessages,
      if (nextToken != null) 'NextToken': nextToken,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

class ListChannelModeratorsResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The information about and names of each moderator.
  final List<ChannelModeratorSummary>? channelModerators;

  /// The token passed by previous API calls until all requested moderators are
  /// returned.
  final String? nextToken;

  ListChannelModeratorsResponse({
    this.channelArn,
    this.channelModerators,
    this.nextToken,
  });

  factory ListChannelModeratorsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelModeratorsResponse(
      channelArn: json['ChannelArn'] as String?,
      channelModerators: (json['ChannelModerators'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ChannelModeratorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelModerators = this.channelModerators;
    final nextToken = this.nextToken;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelModerators != null) 'ChannelModerators': channelModerators,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelsAssociatedWithChannelFlowResponse {
  /// The information about each channel.
  final List<ChannelAssociatedWithFlowSummary>? channels;

  /// The token passed by previous API calls until all requested channels are
  /// returned.
  final String? nextToken;

  ListChannelsAssociatedWithChannelFlowResponse({
    this.channels,
    this.nextToken,
  });

  factory ListChannelsAssociatedWithChannelFlowResponse.fromJson(
      Map<String, dynamic> json) {
    return ListChannelsAssociatedWithChannelFlowResponse(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelAssociatedWithFlowSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'Channels': channels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelsModeratedByAppInstanceUserResponse {
  /// The moderated channels in the request.
  final List<ChannelModeratedByAppInstanceUserSummary>? channels;

  /// The token returned from previous API requests until the number of channels
  /// moderated by the user is reached.
  final String? nextToken;

  ListChannelsModeratedByAppInstanceUserResponse({
    this.channels,
    this.nextToken,
  });

  factory ListChannelsModeratedByAppInstanceUserResponse.fromJson(
      Map<String, dynamic> json) {
    return ListChannelsModeratedByAppInstanceUserResponse(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelModeratedByAppInstanceUserSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'Channels': channels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListChannelsResponse {
  /// The information about each channel.
  final List<ChannelSummary>? channels;

  /// The token returned from previous API requests until the number of channels
  /// is reached.
  final String? nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });

  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelsResponse(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'Channels': channels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListSubChannelsResponse {
  /// The ARN of elastic channel.
  final String? channelArn;

  /// The token passed by previous API calls until all requested sub-channels are
  /// returned.
  final String? nextToken;

  /// The information about each sub-channel.
  final List<SubChannelSummary>? subChannels;

  ListSubChannelsResponse({
    this.channelArn,
    this.nextToken,
    this.subChannels,
  });

  factory ListSubChannelsResponse.fromJson(Map<String, dynamic> json) {
    return ListSubChannelsResponse(
      channelArn: json['ChannelArn'] as String?,
      nextToken: json['NextToken'] as String?,
      subChannels: (json['SubChannels'] as List?)
          ?.whereNotNull()
          .map((e) => SubChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final nextToken = this.nextToken;
    final subChannels = this.subChannels;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (nextToken != null) 'NextToken': nextToken,
      if (subChannels != null) 'SubChannels': subChannels,
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

/// A list of message attribute values.
class MessageAttributeValue {
  /// The strings in a message attribute value.
  final List<String>? stringValues;

  MessageAttributeValue({
    this.stringValues,
  });

  factory MessageAttributeValue.fromJson(Map<String, dynamic> json) {
    return MessageAttributeValue(
      stringValues: (json['StringValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final stringValues = this.stringValues;
    return {
      if (stringValues != null) 'StringValues': stringValues,
    };
  }
}

enum MessagingDataType {
  channel,
  channelMessage,
}

extension MessagingDataTypeValueExtension on MessagingDataType {
  String toValue() {
    switch (this) {
      case MessagingDataType.channel:
        return 'Channel';
      case MessagingDataType.channelMessage:
        return 'ChannelMessage';
    }
  }
}

extension MessagingDataTypeFromString on String {
  MessagingDataType toMessagingDataType() {
    switch (this) {
      case 'Channel':
        return MessagingDataType.channel;
      case 'ChannelMessage':
        return MessagingDataType.channelMessage;
    }
    throw Exception('$this is not known in enum MessagingDataType');
  }
}

/// The websocket endpoint used to connect to Amazon Chime SDK messaging.
class MessagingSessionEndpoint {
  /// The endpoint to which you establish a websocket connection.
  final String? url;

  MessagingSessionEndpoint({
    this.url,
  });

  factory MessagingSessionEndpoint.fromJson(Map<String, dynamic> json) {
    return MessagingSessionEndpoint(
      url: json['Url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'Url': url,
    };
  }
}

/// The information about a processor in a channel flow.
class Processor {
  /// The information about the type of processor and its identifier.
  final ProcessorConfiguration configuration;

  /// The sequence in which processors run. If you have multiple processors in a
  /// channel flow, message processing goes through each processor in the
  /// sequence. The value determines the sequence. At this point, we support only
  /// 1 processor within a flow.
  final int executionOrder;

  /// Determines whether to continue with message processing or stop it in cases
  /// where communication with a processor fails. If a processor has a fallback
  /// action of <code>ABORT</code> and communication with it fails, the processor
  /// sets the message status to <code>FAILED</code> and does not send the message
  /// to any recipients. Note that if the last processor in the channel flow
  /// sequence has a fallback action of <code>CONTINUE</code> and communication
  /// with the processor fails, then the message is considered processed and sent
  /// to recipients of the channel.
  final FallbackAction fallbackAction;

  /// The name of the channel flow.
  final String name;

  Processor({
    required this.configuration,
    required this.executionOrder,
    required this.fallbackAction,
    required this.name,
  });

  factory Processor.fromJson(Map<String, dynamic> json) {
    return Processor(
      configuration: ProcessorConfiguration.fromJson(
          json['Configuration'] as Map<String, dynamic>),
      executionOrder: json['ExecutionOrder'] as int,
      fallbackAction: (json['FallbackAction'] as String).toFallbackAction(),
      name: json['Name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final executionOrder = this.executionOrder;
    final fallbackAction = this.fallbackAction;
    final name = this.name;
    return {
      'Configuration': configuration,
      'ExecutionOrder': executionOrder,
      'FallbackAction': fallbackAction.toValue(),
      'Name': name,
    };
  }
}

/// A processor's metadata.
class ProcessorConfiguration {
  /// Indicates that the processor is of type Lambda.
  final LambdaConfiguration lambda;

  ProcessorConfiguration({
    required this.lambda,
  });

  factory ProcessorConfiguration.fromJson(Map<String, dynamic> json) {
    return ProcessorConfiguration(
      lambda:
          LambdaConfiguration.fromJson(json['Lambda'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final lambda = this.lambda;
    return {
      'Lambda': lambda,
    };
  }
}

/// The push notification configuration of the message.
class PushNotificationConfiguration {
  /// The body of the push notification.
  final String? body;

  /// The title of the push notification.
  final String? title;

  /// Enum value that indicates the type of the push notification for a message.
  /// <code>DEFAULT</code>: Normal mobile push notification. <code>VOIP</code>:
  /// VOIP mobile push notification.
  final PushNotificationType? type;

  PushNotificationConfiguration({
    this.body,
    this.title,
    this.type,
  });

  Map<String, dynamic> toJson() {
    final body = this.body;
    final title = this.title;
    final type = this.type;
    return {
      if (body != null) 'Body': body,
      if (title != null) 'Title': title,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The channel membership preferences for push notification.
class PushNotificationPreferences {
  /// Enum value that indicates which push notifications to send to the requested
  /// member of a channel. <code>ALL</code> sends all push notifications,
  /// <code>NONE</code> sends no push notifications, <code>FILTERED</code> sends
  /// only filtered push notifications.
  final AllowNotifications allowNotifications;

  /// The simple JSON object used to send a subset of a push notification to the
  /// requested member.
  final String? filterRule;

  PushNotificationPreferences({
    required this.allowNotifications,
    this.filterRule,
  });

  factory PushNotificationPreferences.fromJson(Map<String, dynamic> json) {
    return PushNotificationPreferences(
      allowNotifications:
          (json['AllowNotifications'] as String).toAllowNotifications(),
      filterRule: json['FilterRule'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final allowNotifications = this.allowNotifications;
    final filterRule = this.filterRule;
    return {
      'AllowNotifications': allowNotifications.toValue(),
      if (filterRule != null) 'FilterRule': filterRule,
    };
  }
}

enum PushNotificationType {
  $default,
  voip,
}

extension PushNotificationTypeValueExtension on PushNotificationType {
  String toValue() {
    switch (this) {
      case PushNotificationType.$default:
        return 'DEFAULT';
      case PushNotificationType.voip:
        return 'VOIP';
    }
  }
}

extension PushNotificationTypeFromString on String {
  PushNotificationType toPushNotificationType() {
    switch (this) {
      case 'DEFAULT':
        return PushNotificationType.$default;
      case 'VOIP':
        return PushNotificationType.voip;
    }
    throw Exception('$this is not known in enum PushNotificationType');
  }
}

class PutChannelExpirationSettingsResponse {
  /// The channel ARN.
  final String? channelArn;

  /// Settings that control the interval after which a channel is deleted.
  final ExpirationSettings? expirationSettings;

  PutChannelExpirationSettingsResponse({
    this.channelArn,
    this.expirationSettings,
  });

  factory PutChannelExpirationSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutChannelExpirationSettingsResponse(
      channelArn: json['ChannelArn'] as String?,
      expirationSettings: json['ExpirationSettings'] != null
          ? ExpirationSettings.fromJson(
              json['ExpirationSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final expirationSettings = this.expirationSettings;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
    };
  }
}

class PutChannelMembershipPreferencesResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The details of a user.
  final Identity? member;

  /// The ARN and metadata of the member being added.
  final ChannelMembershipPreferences? preferences;

  PutChannelMembershipPreferencesResponse({
    this.channelArn,
    this.member,
    this.preferences,
  });

  factory PutChannelMembershipPreferencesResponse.fromJson(
      Map<String, dynamic> json) {
    return PutChannelMembershipPreferencesResponse(
      channelArn: json['ChannelArn'] as String?,
      member: json['Member'] != null
          ? Identity.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
      preferences: json['Preferences'] != null
          ? ChannelMembershipPreferences.fromJson(
              json['Preferences'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final member = this.member;
    final preferences = this.preferences;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (member != null) 'Member': member,
      if (preferences != null) 'Preferences': preferences,
    };
  }
}

class PutMessagingStreamingConfigurationsResponse {
  /// The requested streaming configurations.
  final List<StreamingConfiguration>? streamingConfigurations;

  PutMessagingStreamingConfigurationsResponse({
    this.streamingConfigurations,
  });

  factory PutMessagingStreamingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutMessagingStreamingConfigurationsResponse(
      streamingConfigurations: (json['StreamingConfigurations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => StreamingConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final streamingConfigurations = this.streamingConfigurations;
    return {
      if (streamingConfigurations != null)
        'StreamingConfigurations': streamingConfigurations,
    };
  }
}

class RedactChannelMessageResponse {
  /// The ARN of the channel containing the messages that you want to redact.
  final String? channelArn;

  /// The ID of the message being redacted.
  final String? messageId;

  /// The ID of the SubChannel in the response.
  /// <note>
  /// Only required when redacting messages in a SubChannel that the user belongs
  /// to.
  /// </note>
  final String? subChannelId;

  RedactChannelMessageResponse({
    this.channelArn,
    this.messageId,
    this.subChannelId,
  });

  factory RedactChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return RedactChannelMessageResponse(
      channelArn: json['ChannelArn'] as String?,
      messageId: json['MessageId'] as String?,
      subChannelId: json['SubChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final messageId = this.messageId;
    final subChannelId = this.subChannelId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (messageId != null) 'MessageId': messageId,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

class SearchChannelsResponse {
  /// A list of the channels in the request.
  final List<ChannelSummary>? channels;

  /// The token returned from previous API responses until the number of channels
  /// is reached.
  final String? nextToken;

  SearchChannelsResponse({
    this.channels,
    this.nextToken,
  });

  factory SearchChannelsResponse.fromJson(Map<String, dynamic> json) {
    return SearchChannelsResponse(
      channels: (json['Channels'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      if (channels != null) 'Channels': channels,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// A <code>Field</code> of the channel that you want to search.
class SearchField {
  /// An <code>enum</code> value that indicates the key to search the channel on.
  /// <code>MEMBERS</code> allows you to search channels based on memberships. You
  /// can use it with the <code>EQUALS</code> operator to get channels whose
  /// memberships are equal to the specified values, and with the
  /// <code>INCLUDES</code> operator to get channels whose memberships include the
  /// specified values.
  final SearchFieldKey key;

  /// The operator used to compare field values, currently <code>EQUALS</code> or
  /// <code>INCLUDES</code>. Use the <code>EQUALS</code> operator to find channels
  /// whose memberships equal the specified values. Use the <code>INCLUDES</code>
  /// operator to find channels whose memberships include the specified values.
  final SearchFieldOperator operator;

  /// The values that you want to search for, a list of strings. The values must
  /// be <code>AppInstanceUserArns</code> specified as a list of strings.
  /// <note>
  /// This operation isn't supported for <code>AppInstanceUsers</code> with large
  /// number of memberships.
  /// </note>
  final List<String> values;

  SearchField({
    required this.key,
    required this.operator,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final operator = this.operator;
    final values = this.values;
    return {
      'Key': key.toValue(),
      'Operator': operator.toValue(),
      'Values': values,
    };
  }
}

enum SearchFieldKey {
  members,
}

extension SearchFieldKeyValueExtension on SearchFieldKey {
  String toValue() {
    switch (this) {
      case SearchFieldKey.members:
        return 'MEMBERS';
    }
  }
}

extension SearchFieldKeyFromString on String {
  SearchFieldKey toSearchFieldKey() {
    switch (this) {
      case 'MEMBERS':
        return SearchFieldKey.members;
    }
    throw Exception('$this is not known in enum SearchFieldKey');
  }
}

enum SearchFieldOperator {
  equals,
  includes,
}

extension SearchFieldOperatorValueExtension on SearchFieldOperator {
  String toValue() {
    switch (this) {
      case SearchFieldOperator.equals:
        return 'EQUALS';
      case SearchFieldOperator.includes:
        return 'INCLUDES';
    }
  }
}

extension SearchFieldOperatorFromString on String {
  SearchFieldOperator toSearchFieldOperator() {
    switch (this) {
      case 'EQUALS':
        return SearchFieldOperator.equals;
      case 'INCLUDES':
        return SearchFieldOperator.includes;
    }
    throw Exception('$this is not known in enum SearchFieldOperator');
  }
}

class SendChannelMessageResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ID string assigned to each message.
  final String? messageId;

  /// The status of the channel message.
  final ChannelMessageStatusStructure? status;

  /// The ID of the SubChannel in the response.
  final String? subChannelId;

  SendChannelMessageResponse({
    this.channelArn,
    this.messageId,
    this.status,
    this.subChannelId,
  });

  factory SendChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendChannelMessageResponse(
      channelArn: json['ChannelArn'] as String?,
      messageId: json['MessageId'] as String?,
      status: json['Status'] != null
          ? ChannelMessageStatusStructure.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      subChannelId: json['SubChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final messageId = this.messageId;
    final status = this.status;
    final subChannelId = this.subChannelId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (messageId != null) 'MessageId': messageId,
      if (status != null) 'Status': status,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

/// The configuration for connecting a messaging stream to Amazon Kinesis.
class StreamingConfiguration {
  /// The data type of the configuration.
  final MessagingDataType dataType;

  /// The ARN of the resource in the configuration.
  final String resourceArn;

  StreamingConfiguration({
    required this.dataType,
    required this.resourceArn,
  });

  factory StreamingConfiguration.fromJson(Map<String, dynamic> json) {
    return StreamingConfiguration(
      dataType: (json['DataType'] as String).toMessagingDataType(),
      resourceArn: json['ResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final dataType = this.dataType;
    final resourceArn = this.resourceArn;
    return {
      'DataType': dataType.toValue(),
      'ResourceArn': resourceArn,
    };
  }
}

/// Summary of the sub-channels associated with the elastic channel.
class SubChannelSummary {
  /// The number of members in a SubChannel.
  final int? membershipCount;

  /// The unique ID of a SubChannel.
  final String? subChannelId;

  SubChannelSummary({
    this.membershipCount,
    this.subChannelId,
  });

  factory SubChannelSummary.fromJson(Map<String, dynamic> json) {
    return SubChannelSummary(
      membershipCount: json['MembershipCount'] as int?,
      subChannelId: json['SubChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final membershipCount = this.membershipCount;
    final subChannelId = this.subChannelId;
    return {
      if (membershipCount != null) 'MembershipCount': membershipCount,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

/// A tag object containing a key-value pair.
class Tag {
  /// The key in a tag.
  final String key;

  /// The value in a tag.
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

/// The target of a message, a sender, a user, or a bot. Only the target and the
/// sender can view targeted messages. Only users who can see targeted messages
/// can take actions on them. However, administrators can delete targeted
/// messages that they can’t see.
class Target {
  /// The ARN of the target channel member.
  final String? memberArn;

  Target({
    this.memberArn,
  });

  factory Target.fromJson(Map<String, dynamic> json) {
    return Target(
      memberArn: json['MemberArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final memberArn = this.memberArn;
    return {
      if (memberArn != null) 'MemberArn': memberArn,
    };
  }
}

class UpdateChannelFlowResponse {
  /// The ARN of the channel flow.
  final String? channelFlowArn;

  UpdateChannelFlowResponse({
    this.channelFlowArn,
  });

  factory UpdateChannelFlowResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelFlowResponse(
      channelFlowArn: json['ChannelFlowArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelFlowArn = this.channelFlowArn;
    return {
      if (channelFlowArn != null) 'ChannelFlowArn': channelFlowArn,
    };
  }
}

class UpdateChannelMessageResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ID string of the message being updated.
  final String? messageId;

  /// The status of the message update.
  final ChannelMessageStatusStructure? status;

  /// The ID of the SubChannel in the response.
  final String? subChannelId;

  UpdateChannelMessageResponse({
    this.channelArn,
    this.messageId,
    this.status,
    this.subChannelId,
  });

  factory UpdateChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelMessageResponse(
      channelArn: json['ChannelArn'] as String?,
      messageId: json['MessageId'] as String?,
      status: json['Status'] != null
          ? ChannelMessageStatusStructure.fromJson(
              json['Status'] as Map<String, dynamic>)
          : null,
      subChannelId: json['SubChannelId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final messageId = this.messageId;
    final status = this.status;
    final subChannelId = this.subChannelId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (messageId != null) 'MessageId': messageId,
      if (status != null) 'Status': status,
      if (subChannelId != null) 'SubChannelId': subChannelId,
    };
  }
}

class UpdateChannelReadMarkerResponse {
  /// The ARN of the channel.
  final String? channelArn;

  UpdateChannelReadMarkerResponse({
    this.channelArn,
  });

  factory UpdateChannelReadMarkerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelReadMarkerResponse(
      channelArn: json['ChannelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
    };
  }
}

class UpdateChannelResponse {
  /// The ARN of the channel.
  final String? channelArn;

  UpdateChannelResponse({
    this.channelArn,
  });

  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelResponse(
      channelArn: json['ChannelArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
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
