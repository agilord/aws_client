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

/// <important>
/// <b>Most of these APIs are no longer supported and will not be updated.</b>
/// We recommend using the latest versions in the <a
/// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/welcome.html">Amazon
/// Chime SDK API reference</a>, in the Amazon Chime SDK.
///
/// Using the latest versions requires migrating to dedicated namespaces. For
/// more information, refer to <a
/// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
/// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
/// Guide</i>.
/// </important>
/// The Amazon Chime application programming interface (API) is designed so
/// administrators can perform key tasks, such as creating and managing Amazon
/// Chime accounts, users, and Voice Connectors. This guide provides detailed
/// information about the Amazon Chime API, including operations, types, inputs
/// and outputs, and error codes.
///
/// You can use an AWS SDK, the AWS Command Line Interface (AWS CLI), or the
/// REST API to make API calls for Amazon Chime. We recommend using an AWS SDK
/// or the AWS CLI. The page for each API action contains a <i>See Also</i>
/// section that includes links to information about using the action with a
/// language-specific AWS SDK or the AWS CLI.
/// <dl> <dt>Using an AWS SDK</dt> <dd>
/// You don't need to write code to calculate a signature for request
/// authentication. The SDK clients authenticate your requests by using access
/// keys that you provide. For more information about AWS SDKs, see the <a
/// href="http://aws.amazon.com/developer/">AWS Developer Center</a>.
/// </dd> <dt>Using the AWS CLI</dt> <dd>
/// Use your access keys with the AWS CLI to make API calls. For information
/// about setting up the AWS CLI, see <a
/// href="https://docs.aws.amazon.com/cli/latest/userguide/installing.html">Installing
/// the AWS Command Line Interface</a> in the <i>AWS Command Line Interface User
/// Guide</i>. For a list of available Amazon Chime commands, see the <a
/// href="https://docs.aws.amazon.com/cli/latest/reference/chime/index.html">Amazon
/// Chime commands</a> in the <i>AWS CLI Command Reference</i>.
/// </dd> <dt>Using REST APIs</dt> <dd>
/// If you use REST to make API calls, you must authenticate your request by
/// providing a signature. Amazon Chime supports Signature Version 4. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/signature-version-4.html">Signature
/// Version 4 Signing Process</a> in the <i>Amazon Web Services General
/// Reference</i>.
///
/// When making REST API calls, use the service name <code>chime</code> and REST
/// endpoint <code>https://service.chime.aws.amazon.com</code>.
/// </dd> </dl>
/// Administrative permissions are controlled using AWS Identity and Access
/// Management (IAM). For more information, see <a
/// href="https://docs.aws.amazon.com/chime/latest/ag/security-iam.html">Identity
/// and Access Management for Amazon Chime</a> in the <i>Amazon Chime
/// Administration Guide</i>.
class Chime {
  final _s.RestJsonProtocol _protocol;
  Chime({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'chime',
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

  /// Associates a phone number with the specified Amazon Chime user.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [e164PhoneNumber] :
  /// The phone number, in E.164 format.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<void> associatePhoneNumberWithUser({
    required String accountId,
    required String e164PhoneNumber,
    required String userId,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumber': e164PhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=associate-phone-number',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates phone numbers with the specified Amazon Chime Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_AssociatePhoneNumbersWithVoiceConnector.html">AssociatePhoneNumbersWithVoiceConnector</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  ///
  /// Parameter [forceAssociate] :
  /// If true, associates the provided phone numbers with the provided Amazon
  /// Chime Voice Connector and removes any previously existing associations. If
  /// false, does not associate any phone numbers that have previously existing
  /// associations.
  @Deprecated(
      'Replaced by AssociatePhoneNumbersWithVoiceConnector in the Amazon Chime SDK Voice Namespace')
  Future<AssociatePhoneNumbersWithVoiceConnectorResponse>
      associatePhoneNumbersWithVoiceConnector({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorId,
    bool? forceAssociate,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      if (forceAssociate != null) 'ForceAssociate': forceAssociate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}?operation=associate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson(response);
  }

  /// Associates phone numbers with the specified Amazon Chime Voice Connector
  /// group.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_AssociatePhoneNumbersWithVoiceConnectorGroup.html">AssociatePhoneNumbersWithVoiceConnectorGroup</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  ///
  /// Parameter [forceAssociate] :
  /// If true, associates the provided phone numbers with the provided Amazon
  /// Chime Voice Connector Group and removes any previously existing
  /// associations. If false, does not associate any phone numbers that have
  /// previously existing associations.
  @Deprecated(
      'Replaced by AssociatePhoneNumbersWithVoiceConnectorGroup in the Amazon Chime SDK Voice Namespace')
  Future<AssociatePhoneNumbersWithVoiceConnectorGroupResponse>
      associatePhoneNumbersWithVoiceConnectorGroup({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorGroupId,
    bool? forceAssociate,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      if (forceAssociate != null) 'ForceAssociate': forceAssociate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}?operation=associate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePhoneNumbersWithVoiceConnectorGroupResponse.fromJson(
        response);
  }

  /// Associates the specified sign-in delegate groups with the specified Amazon
  /// Chime account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [signinDelegateGroups] :
  /// The sign-in delegate groups.
  Future<void> associateSigninDelegateGroupsWithAccount({
    required String accountId,
    required List<SigninDelegateGroup> signinDelegateGroups,
  }) async {
    final $payload = <String, dynamic>{
      'SigninDelegateGroups': signinDelegateGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}?operation=associate-signin-delegate-groups',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates up to 100 new attendees for an active Amazon Chime SDK meeting.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_BatchCreateAttendee.html">BatchCreateAttendee</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendees] :
  /// The request containing the attendees to create.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Replaced by BatchCreateAttendee in the Amazon Chime SDK Meetings Namespace')
  Future<BatchCreateAttendeeResponse> batchCreateAttendee({
    required List<CreateAttendeeRequestItem> attendees,
    required String meetingId,
  }) async {
    final $payload = <String, dynamic>{
      'Attendees': attendees,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees?operation=batch-create',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateAttendeeResponse.fromJson(response);
  }

  /// Adds a specified number of users to a channel.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_BatchCreateChannelMembership.html">BatchCreateChannelMembership</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedClientException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel to which you're adding users.
  ///
  /// Parameter [memberArns] :
  /// The ARNs of the members you want to add to the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are always returned as part of
  /// <code>ListChannelMemberships</code>. Hidden members are only returned if
  /// the type filter in <code>ListChannelMemberships</code> equals
  /// <code>HIDDEN</code>. Otherwise hidden members are not returned. This is
  /// only supported by moderators.
  @Deprecated(
      'Replaced by BatchCreateChannelMembership in the Amazon Chime SDK Messaging Namespace')
  Future<BatchCreateChannelMembershipResponse> batchCreateChannelMembership({
    required String channelArn,
    required List<String> memberArns,
    String? chimeBearer,
    ChannelMembershipType? type,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'MemberArns': memberArns,
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

  /// Adds up to 50 members to a chat room in an Amazon Chime Enterprise
  /// account. Members can be users or bots. The member role designates whether
  /// the member is a chat room administrator or a general chat room member.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [membershipItemList] :
  /// The list of membership items.
  ///
  /// Parameter [roomId] :
  /// The room ID.
  Future<BatchCreateRoomMembershipResponse> batchCreateRoomMembership({
    required String accountId,
    required List<MembershipItem> membershipItemList,
    required String roomId,
  }) async {
    final $payload = <String, dynamic>{
      'MembershipItemList': membershipItemList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/memberships?operation=batch-create',
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateRoomMembershipResponse.fromJson(response);
  }

  /// Moves phone numbers into the <b>Deletion queue</b>. Phone numbers must be
  /// disassociated from any users or Amazon Chime Voice Connectors before they
  /// can be deleted.
  ///
  /// Phone numbers remain in the <b>Deletion queue</b> for 7 days before they
  /// are deleted permanently.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberIds] :
  /// List of phone number IDs.
  Future<BatchDeletePhoneNumberResponse> batchDeletePhoneNumber({
    required List<String> phoneNumberIds,
  }) async {
    final $payload = <String, dynamic>{
      'PhoneNumberIds': phoneNumberIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-numbers?operation=batch-delete',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeletePhoneNumberResponse.fromJson(response);
  }

  /// Suspends up to 50 users from a <code>Team</code> or
  /// <code>EnterpriseLWA</code> Amazon Chime account. For more information
  /// about different account types, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing
  /// Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  ///
  /// Users suspended from a <code>Team</code> account are disassociated from
  /// the account,but they can continue to use Amazon Chime as free users. To
  /// remove the suspension from suspended <code>Team</code> account users,
  /// invite them to the <code>Team</code> account again. You can use the
  /// <a>InviteUsers</a> action to do so.
  ///
  /// Users suspended from an <code>EnterpriseLWA</code> account are immediately
  /// signed out of Amazon Chime and can no longer sign in. To remove the
  /// suspension from suspended <code>EnterpriseLWA</code> account users, use
  /// the <a>BatchUnsuspendUser</a> action.
  ///
  /// To sign out users without suspending them, use the <a>LogoutUser</a>
  /// action.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userIdList] :
  /// The request containing the user IDs to suspend.
  Future<BatchSuspendUserResponse> batchSuspendUser({
    required String accountId,
    required List<String> userIdList,
  }) async {
    final $payload = <String, dynamic>{
      'UserIdList': userIdList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users?operation=suspend',
      exceptionFnMap: _exceptionFns,
    );
    return BatchSuspendUserResponse.fromJson(response);
  }

  /// Removes the suspension from up to 50 previously suspended users for the
  /// specified Amazon Chime <code>EnterpriseLWA</code> account. Only users on
  /// <code>EnterpriseLWA</code> accounts can be unsuspended using this action.
  /// For more information about different account types, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">
  /// Managing Your Amazon Chime Accounts </a> in the account types, in the
  /// <i>Amazon Chime Administration Guide</i>.
  ///
  /// Previously suspended users who are unsuspended using this action are
  /// returned to <code>Registered</code> status. Users who are not previously
  /// suspended are ignored.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userIdList] :
  /// The request containing the user IDs to unsuspend.
  Future<BatchUnsuspendUserResponse> batchUnsuspendUser({
    required String accountId,
    required List<String> userIdList,
  }) async {
    final $payload = <String, dynamic>{
      'UserIdList': userIdList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users?operation=unsuspend',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUnsuspendUserResponse.fromJson(response);
  }

  /// Updates phone number product types or calling names. You can update one
  /// attribute at a time for each <code>UpdatePhoneNumberRequestItem</code>.
  /// For example, you can update the product type or the calling name.
  ///
  /// For toll-free numbers, you cannot use the Amazon Chime Business Calling
  /// product type. For numbers outside the U.S., you must use the Amazon Chime
  /// SIP Media Application Dial-In product type.
  ///
  /// Updates to outbound calling names can take up to 72 hours to complete.
  /// Pending updates to outbound calling names must be complete before you can
  /// request another update.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [updatePhoneNumberRequestItems] :
  /// The request containing the phone number IDs and product types or calling
  /// names to update.
  Future<BatchUpdatePhoneNumberResponse> batchUpdatePhoneNumber({
    required List<UpdatePhoneNumberRequestItem> updatePhoneNumberRequestItems,
  }) async {
    final $payload = <String, dynamic>{
      'UpdatePhoneNumberRequestItems': updatePhoneNumberRequestItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-numbers?operation=batch-update',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdatePhoneNumberResponse.fromJson(response);
  }

  /// Updates user details within the <a>UpdateUserRequestItem</a> object for up
  /// to 20 users for the specified Amazon Chime account. Currently, only
  /// <code>LicenseType</code> updates are supported for this action.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [updateUserRequestItems] :
  /// The request containing the user IDs and details to update.
  Future<BatchUpdateUserResponse> batchUpdateUser({
    required String accountId,
    required List<UpdateUserRequestItem> updateUserRequestItems,
  }) async {
    final $payload = <String, dynamic>{
      'UpdateUserRequestItems': updateUserRequestItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/users',
      exceptionFnMap: _exceptionFns,
    );
    return BatchUpdateUserResponse.fromJson(response);
  }

  /// Creates an Amazon Chime account under the administrator's AWS account.
  /// Only <code>Team</code> account types are currently supported for this
  /// action. For more information about different account types, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing
  /// Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon Chime account.
  Future<CreateAccountResponse> createAccount({
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAccountResponse.fromJson(response);
  }

  /// Creates an Amazon Chime SDK messaging <code>AppInstance</code> under an
  /// AWS account. Only SDK messaging customers use this API.
  /// <code>CreateAppInstance</code> supports idempotency behavior as described
  /// in the AWS API Standard.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_CreateAppInstance.html">CreateAppInstance</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the <code>AppInstance</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// The <code>ClientRequestToken</code> of the <code>AppInstance</code>.
  ///
  /// Parameter [metadata] :
  /// The metadata of the <code>AppInstance</code>. Limited to a 1KB string in
  /// UTF-8.
  ///
  /// Parameter [tags] :
  /// Tags assigned to the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by CreateAppInstance in the Amazon Chime SDK Identity Namespace')
  Future<CreateAppInstanceResponse> createAppInstance({
    required String name,
    String? clientRequestToken,
    String? metadata,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/app-instances',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppInstanceResponse.fromJson(response);
  }

  /// Promotes an <code>AppInstanceUser</code> to an
  /// <code>AppInstanceAdmin</code>. The promoted user can perform the following
  /// actions.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_CreateAppInstanceAdmin.html">CreateAppInstanceAdmin</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  /// <ul>
  /// <li>
  /// <code>ChannelModerator</code> actions across all channels in the
  /// <code>AppInstance</code>.
  /// </li>
  /// <li>
  /// <code>DeleteChannelMessage</code> actions.
  /// </li>
  /// </ul>
  /// Only an <code>AppInstanceUser</code> can be promoted to an
  /// <code>AppInstanceAdmin</code> role.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceAdminArn] :
  /// The ARN of the administrator of the current <code>AppInstance</code>.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by CreateAppInstanceAdmin in the Amazon Chime SDK Identity Namespace')
  Future<CreateAppInstanceAdminResponse> createAppInstanceAdmin({
    required String appInstanceAdminArn,
    required String appInstanceArn,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceAdminArn': appInstanceAdminArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/admins',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppInstanceAdminResponse.fromJson(response);
  }

  /// Creates a user under an Amazon Chime <code>AppInstance</code>. The request
  /// consists of a unique <code>appInstanceUserId</code> and <code>Name</code>
  /// for that user.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_CreateAppInstanceUser.html">CreateAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code> request.
  ///
  /// Parameter [appInstanceUserId] :
  /// The user ID of the <code>AppInstance</code>.
  ///
  /// Parameter [name] :
  /// The user's name.
  ///
  /// Parameter [clientRequestToken] :
  /// The token assigned to the user requesting an <code>AppInstance</code>.
  ///
  /// Parameter [metadata] :
  /// The request's metadata. Limited to a 1KB string in UTF-8.
  ///
  /// Parameter [tags] :
  /// Tags assigned to the <code>AppInstanceUser</code>.
  @Deprecated(
      'Replaced by CreateAppInstanceUser in the Amazon Chime SDK Identity Namespace')
  Future<CreateAppInstanceUserResponse> createAppInstanceUser({
    required String appInstanceArn,
    required String appInstanceUserId,
    required String name,
    String? clientRequestToken,
    String? metadata,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'AppInstanceUserId': appInstanceUserId,
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/app-instance-users',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppInstanceUserResponse.fromJson(response);
  }

  /// Creates a new attendee for an active Amazon Chime SDK meeting. For more
  /// information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_CreateAttendee.html">CreateAttendee</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [externalUserId] :
  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  @Deprecated(
      'Replaced by CreateAttendee in the Amazon Chime SDK Meetings Namespace')
  Future<CreateAttendeeResponse> createAttendee({
    required String externalUserId,
    required String meetingId,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ExternalUserId': externalUserId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/attendees',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAttendeeResponse.fromJson(response);
  }

  /// Creates a bot for an Amazon Chime Enterprise account.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [displayName] :
  /// The bot display name.
  ///
  /// Parameter [domain] :
  /// The domain of the Amazon Chime Enterprise account.
  Future<CreateBotResponse> createBot({
    required String accountId,
    required String displayName,
    String? domain,
  }) async {
    final $payload = <String, dynamic>{
      'DisplayName': displayName,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/bots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotResponse.fromJson(response);
  }

  /// Creates a channel to which you can add users and send messages.
  ///
  /// <b>Restriction</b>: You can't change a channel's privacy.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_CreateChannel.html">CreateChannel</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [name] :
  /// The name of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [clientRequestToken] :
  /// The client token for the request. An <code>Idempotency</code> token.
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
  /// Parameter [privacy] :
  /// The channel's privacy level: <code>PUBLIC</code> or <code>PRIVATE</code>.
  /// Private channels aren't discoverable by users outside the channel. Public
  /// channels are discoverable by anyone in the <code>AppInstance</code>.
  ///
  /// Parameter [tags] :
  /// The tags for the creation request.
  @Deprecated(
      'Replaced by CreateChannel in the Amazon Chime SDK Messaging Namespace')
  Future<CreateChannelResponse> createChannel({
    required String appInstanceArn,
    required String name,
    String? chimeBearer,
    String? clientRequestToken,
    String? metadata,
    ChannelMode? mode,
    ChannelPrivacy? privacy,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
      if (mode != null) 'Mode': mode.toValue(),
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_CreateChannelBan.html">CreateChannelBan</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [memberArn] :
  /// The ARN of the member being banned.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by CreateChannelBan in the Amazon Chime SDK Messaging Namespace')
  Future<CreateChannelBanResponse> createChannelBan({
    required String channelArn,
    required String memberArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Adds a user to a channel. The <code>InvitedBy</code> response field is
  /// derived from the request header. A channel member can:
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_CreateChannelMembership.html">CreateChannelMembership</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The ARN of the channel to which you're adding users.
  ///
  /// Parameter [memberArn] :
  /// The ARN of the member you want to add to the channel.
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are always returned as part of
  /// <code>ListChannelMemberships</code>. Hidden members are only returned if
  /// the type filter in <code>ListChannelMemberships</code> equals
  /// <code>HIDDEN</code>. Otherwise hidden members are not returned. This is
  /// only supported by moderators.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by CreateChannelMembership in the Amazon Chime SDK Messaging Namespace')
  Future<CreateChannelMembershipResponse> createChannelMembership({
    required String channelArn,
    required String memberArn,
    required ChannelMembershipType type,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'MemberArn': memberArn,
      'Type': type.toValue(),
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_CreateChannelModerator.html">CreateChannelModerator</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The ARN of the moderator.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by CreateChannelModerator in the Amazon Chime SDK Messaging Namespace')
  Future<CreateChannelModeratorResponse> createChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Creates a media capture pipeline.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_CreateMediaCapturePipeline">CreateMediaCapturePipeline</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [ResourceLimitExceededException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
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
  /// Source type from which the media artifacts will be captured. A Chime SDK
  /// Meeting is the only supported source.
  ///
  /// Parameter [chimeSdkMeetingConfiguration] :
  /// The configuration for a specified media capture pipeline.
  /// <code>SourceType</code> must be <code>ChimeSdkMeeting</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. The token makes the API
  /// request idempotent. Use a different token for different media pipeline
  /// requests.
  @Deprecated(
      'Replaced by CreateMediaCapturePipeline in the Amazon Chime SDK Media Pipelines Namespace')
  Future<CreateMediaCapturePipelineResponse> createMediaCapturePipeline({
    required String sinkArn,
    required MediaPipelineSinkType sinkType,
    required String sourceArn,
    required MediaPipelineSourceType sourceType,
    ChimeSdkMeetingConfiguration? chimeSdkMeetingConfiguration,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'SinkArn': sinkArn,
      'SinkType': sinkType.toValue(),
      'SourceArn': sourceArn,
      'SourceType': sourceType.toValue(),
      if (chimeSdkMeetingConfiguration != null)
        'ChimeSdkMeetingConfiguration': chimeSdkMeetingConfiguration,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/media-capture-pipelines',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMediaCapturePipelineResponse.fromJson(response);
  }

  /// Creates a new Amazon Chime SDK meeting in the specified media Region with
  /// no initial attendees. For more information about specifying media Regions,
  /// see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/chime-sdk-meetings-regions.html">Amazon
  /// Chime SDK Media Regions</a> in the <i>Amazon Chime SDK Developer Guide</i>
  /// . For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_CreateMeeting.html">CreateMeeting</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different meetings.
  ///
  /// Parameter [externalMeetingId] :
  /// The external meeting ID.
  ///
  /// Parameter [mediaRegion] :
  /// The Region in which to create the meeting. Default:
  /// <code>us-east-1</code>.
  ///
  /// Available values: <code>af-south-1</code> , <code>ap-northeast-1</code> ,
  /// <code>ap-northeast-2</code> , <code>ap-south-1</code> ,
  /// <code>ap-southeast-1</code> , <code>ap-southeast-2</code> ,
  /// <code>ca-central-1</code> , <code>eu-central-1</code> ,
  /// <code>eu-north-1</code> , <code>eu-south-1</code> , <code>eu-west-1</code>
  /// , <code>eu-west-2</code> , <code>eu-west-3</code> , <code>sa-east-1</code>
  /// , <code>us-east-1</code> , <code>us-east-2</code> , <code>us-west-1</code>
  /// , <code>us-west-2</code> .
  ///
  /// Parameter [meetingHostId] :
  /// Reserved.
  ///
  /// Parameter [notificationsConfiguration] :
  /// The configuration for resource targets to receive notifications when
  /// meeting and attendee events occur.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  @Deprecated(
      'Replaced by CreateMeeting in the Amazon Chime SDK Meetings Namespace')
  Future<CreateMeetingResponse> createMeeting({
    String? clientRequestToken,
    String? externalMeetingId,
    String? mediaRegion,
    String? meetingHostId,
    MeetingNotificationConfiguration? notificationsConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (externalMeetingId != null) 'ExternalMeetingId': externalMeetingId,
      if (mediaRegion != null) 'MediaRegion': mediaRegion,
      if (meetingHostId != null) 'MeetingHostId': meetingHostId,
      if (notificationsConfiguration != null)
        'NotificationsConfiguration': notificationsConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMeetingResponse.fromJson(response);
  }

  /// Uses the join token and call metadata in a meeting request (From number,
  /// To number, and so forth) to initiate an outbound call to a public switched
  /// telephone network (PSTN) and join them into a Chime meeting. Also ensures
  /// that the From number belongs to the customer.
  ///
  /// To play welcome audio or implement an interactive voice response (IVR),
  /// use the <code>CreateSipMediaApplicationCall</code> action with the
  /// corresponding SIP media application ID.
  /// <important>
  /// <b>This API is is not available in a dedicated namespace.</b>
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [fromPhoneNumber] :
  /// Phone number used as the caller ID when the remote party receives a call.
  ///
  /// Parameter [joinToken] :
  /// Token used by the Amazon Chime SDK attendee. Call the <a
  /// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_CreateAttendee.html">CreateAttendee</a>
  /// action to get a join token.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [toPhoneNumber] :
  /// Phone number called when inviting someone to a meeting.
  Future<CreateMeetingDialOutResponse> createMeetingDialOut({
    required String fromPhoneNumber,
    required String joinToken,
    required String meetingId,
    required String toPhoneNumber,
  }) async {
    final $payload = <String, dynamic>{
      'FromPhoneNumber': fromPhoneNumber,
      'JoinToken': joinToken,
      'ToPhoneNumber': toPhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/dial-outs',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMeetingDialOutResponse.fromJson(response);
  }

  /// Creates a new Amazon Chime SDK meeting in the specified media Region, with
  /// attendees. For more information about specifying media Regions, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/chime-sdk-meetings-regions.html">Amazon
  /// Chime SDK Media Regions</a> in the <i>Amazon Chime SDK Developer Guide</i>
  /// . For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i> .
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_CreateMeetingWithAttendees.html">CreateMeetingWithAttendees</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendees] :
  /// The request containing the attendees to create.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different meetings.
  ///
  /// Parameter [externalMeetingId] :
  /// The external meeting ID.
  ///
  /// Parameter [mediaRegion] :
  /// The Region in which to create the meeting. Default: <code>us-east-1</code>
  /// .
  ///
  /// Available values: <code>af-south-1</code> , <code>ap-northeast-1</code> ,
  /// <code>ap-northeast-2</code> , <code>ap-south-1</code> ,
  /// <code>ap-southeast-1</code> , <code>ap-southeast-2</code> ,
  /// <code>ca-central-1</code> , <code>eu-central-1</code> ,
  /// <code>eu-north-1</code> , <code>eu-south-1</code> , <code>eu-west-1</code>
  /// , <code>eu-west-2</code> , <code>eu-west-3</code> , <code>sa-east-1</code>
  /// , <code>us-east-1</code> , <code>us-east-2</code> , <code>us-west-1</code>
  /// , <code>us-west-2</code> .
  ///
  /// Parameter [meetingHostId] :
  /// Reserved.
  ///
  /// Parameter [notificationsConfiguration] :
  /// The resource target configurations for receiving Amazon Chime SDK meeting
  /// and attendee event notifications. The Amazon Chime SDK supports resource
  /// targets located in the US East (N. Virginia) AWS Region (us-east-1).
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  @Deprecated(
      'Replaced by CreateMeetingWithAttendees in the Amazon Chime SDK Meetings Namespace')
  Future<CreateMeetingWithAttendeesResponse> createMeetingWithAttendees({
    List<CreateAttendeeRequestItem>? attendees,
    String? clientRequestToken,
    String? externalMeetingId,
    String? mediaRegion,
    String? meetingHostId,
    MeetingNotificationConfiguration? notificationsConfiguration,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (attendees != null) 'Attendees': attendees,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (externalMeetingId != null) 'ExternalMeetingId': externalMeetingId,
      if (mediaRegion != null) 'MediaRegion': mediaRegion,
      if (meetingHostId != null) 'MeetingHostId': meetingHostId,
      if (notificationsConfiguration != null)
        'NotificationsConfiguration': notificationsConfiguration,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/meetings?operation=create-attendees',
      exceptionFnMap: _exceptionFns,
    );
    return CreateMeetingWithAttendeesResponse.fromJson(response);
  }

  /// Creates an order for phone numbers to be provisioned. For toll-free
  /// numbers, you cannot use the Amazon Chime Business Calling product type.
  /// For numbers outside the U.S., you must use the Amazon Chime SIP Media
  /// Application Dial-In product type.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [productType] :
  /// The phone number product type.
  Future<CreatePhoneNumberOrderResponse> createPhoneNumberOrder({
    required List<String> e164PhoneNumbers,
    required PhoneNumberProductType productType,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      'ProductType': productType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-number-orders',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePhoneNumberOrderResponse.fromJson(response);
  }

  /// Creates a proxy session on the specified Amazon Chime Voice Connector for
  /// the specified participant phone numbers.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_CreateProxySession.html">CreateProxySession</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [capabilities] :
  /// The proxy session capabilities.
  ///
  /// Parameter [participantPhoneNumbers] :
  /// The participant phone numbers.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  ///
  /// Parameter [expiryMinutes] :
  /// The number of minutes allowed for the proxy session.
  ///
  /// Parameter [geoMatchLevel] :
  /// The preference for matching the country or area code of the proxy phone
  /// number with that of the first participant.
  ///
  /// Parameter [geoMatchParams] :
  /// The country and area code for the proxy phone number.
  ///
  /// Parameter [name] :
  /// The name of the proxy session.
  ///
  /// Parameter [numberSelectionBehavior] :
  /// The preference for proxy phone number reuse, or stickiness, between the
  /// same participants across sessions.
  @Deprecated(
      'Replaced by CreateProxySession in the Amazon Chime SDK Voice Namespace')
  Future<CreateProxySessionResponse> createProxySession({
    required List<Capability> capabilities,
    required List<String> participantPhoneNumbers,
    required String voiceConnectorId,
    int? expiryMinutes,
    GeoMatchLevel? geoMatchLevel,
    GeoMatchParams? geoMatchParams,
    String? name,
    NumberSelectionBehavior? numberSelectionBehavior,
  }) async {
    _s.validateNumRange(
      'expiryMinutes',
      expiryMinutes,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      'ParticipantPhoneNumbers': participantPhoneNumbers,
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
      if (geoMatchLevel != null) 'GeoMatchLevel': geoMatchLevel.toValue(),
      if (geoMatchParams != null) 'GeoMatchParams': geoMatchParams,
      if (name != null) 'Name': name,
      if (numberSelectionBehavior != null)
        'NumberSelectionBehavior': numberSelectionBehavior.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProxySessionResponse.fromJson(response);
  }

  /// Creates a chat room for the specified Amazon Chime Enterprise account.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [name] :
  /// The room name.
  ///
  /// Parameter [clientRequestToken] :
  /// The idempotency token for the request.
  Future<CreateRoomResponse> createRoom({
    required String accountId,
    required String name,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/rooms',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoomResponse.fromJson(response);
  }

  /// Adds a member to a chat room in an Amazon Chime Enterprise account. A
  /// member can be either a user or a bot. The member role designates whether
  /// the member is a chat room administrator or a general chat room member.
  ///
  /// May throw [ConflictException].
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [memberId] :
  /// The Amazon Chime member ID (user ID or bot ID).
  ///
  /// Parameter [roomId] :
  /// The room ID.
  ///
  /// Parameter [role] :
  /// The role of the member.
  Future<CreateRoomMembershipResponse> createRoomMembership({
    required String accountId,
    required String memberId,
    required String roomId,
    RoomMembershipRole? role,
  }) async {
    final $payload = <String, dynamic>{
      'MemberId': memberId,
      if (role != null) 'Role': role.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/memberships',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoomMembershipResponse.fromJson(response);
  }

  /// Creates a SIP media application.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_CreateSipMediaApplication.html">CreateSipMediaApplication</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [awsRegion] :
  /// The AWS Region assigned to the SIP media application.
  ///
  /// Parameter [endpoints] :
  /// List of endpoints (Lambda Amazon Resource Names) specified for the SIP
  /// media application. Currently, only one endpoint is supported.
  ///
  /// Parameter [name] :
  /// The SIP media application name.
  @Deprecated(
      'Replaced by CreateSipMediaApplication in the Amazon Chime SDK Voice Namespace')
  Future<CreateSipMediaApplicationResponse> createSipMediaApplication({
    required String awsRegion,
    required List<SipMediaApplicationEndpoint> endpoints,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'AwsRegion': awsRegion,
      'Endpoints': endpoints,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sip-media-applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSipMediaApplicationResponse.fromJson(response);
  }

  /// Creates an outbound call to a phone number from the phone number specified
  /// in the request, and it invokes the endpoint of the specified
  /// <code>sipMediaApplicationId</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_CreateSipMediaApplicationCall.html">CreateSipMediaApplicationCall</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [AccessDeniedException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [fromPhoneNumber] :
  /// The phone number that a user calls from. This is a phone number in your
  /// Amazon Chime phone number inventory.
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The ID of the SIP media application.
  ///
  /// Parameter [toPhoneNumber] :
  /// The phone number that the service should call.
  ///
  /// Parameter [sipHeaders] :
  /// The SIP headers added to an outbound call leg.
  @Deprecated(
      'Replaced by CreateSipMediaApplicationCall in the Amazon Chime SDK Voice Namespace')
  Future<CreateSipMediaApplicationCallResponse> createSipMediaApplicationCall({
    required String fromPhoneNumber,
    required String sipMediaApplicationId,
    required String toPhoneNumber,
    Map<String, String>? sipHeaders,
  }) async {
    final $payload = <String, dynamic>{
      'FromPhoneNumber': fromPhoneNumber,
      'ToPhoneNumber': toPhoneNumber,
      if (sipHeaders != null) 'SipHeaders': sipHeaders,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/calls',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSipMediaApplicationCallResponse.fromJson(response);
  }

  /// Creates a SIP rule which can be used to run a SIP media application as a
  /// target for a specific trigger type.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_CreateSipRule.html">CreateSipRule</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the SIP rule.
  ///
  /// Parameter [targetApplications] :
  /// List of SIP media applications with priority and AWS Region. Only one SIP
  /// application per AWS Region can be used.
  ///
  /// Parameter [triggerType] :
  /// The type of trigger assigned to the SIP rule in <code>TriggerValue</code>,
  /// currently <code>RequestUriHostname</code> or <code>ToPhoneNumber</code>.
  ///
  /// Parameter [triggerValue] :
  /// If <code>TriggerType</code> is <code>RequestUriHostname</code>, the value
  /// can be the outbound host name of an Amazon Chime Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code>, the value can be a
  /// customer-owned phone number in the E164 format. The
  /// <code>SipMediaApplication</code> specified in the <code>SipRule</code> is
  /// triggered if the request URI in an incoming SIP request matches the
  /// <code>RequestUriHostname</code>, or if the <code>To</code> header in the
  /// incoming SIP request matches the <code>ToPhoneNumber</code> value.
  ///
  /// Parameter [disabled] :
  /// Enables or disables a rule. You must disable rules before you can delete
  /// them.
  @Deprecated(
      'Replaced by CreateSipRule in the Amazon Chime SDK Voice Namespace')
  Future<CreateSipRuleResponse> createSipRule({
    required String name,
    required List<SipRuleTargetApplication> targetApplications,
    required SipRuleTriggerType triggerType,
    required String triggerValue,
    bool? disabled,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'TargetApplications': targetApplications,
      'TriggerType': triggerType.toValue(),
      'TriggerValue': triggerValue,
      if (disabled != null) 'Disabled': disabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/sip-rules',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSipRuleResponse.fromJson(response);
  }

  /// Creates a user under the specified Amazon Chime account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [email] :
  /// The user's email address.
  ///
  /// Parameter [userType] :
  /// The user type.
  ///
  /// Parameter [username] :
  /// The user name.
  Future<CreateUserResponse> createUser({
    required String accountId,
    String? email,
    UserType? userType,
    String? username,
  }) async {
    final $payload = <String, dynamic>{
      if (email != null) 'Email': email,
      if (userType != null) 'UserType': userType.toValue(),
      if (username != null) 'Username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users?operation=create',
      exceptionFnMap: _exceptionFns,
    );
    return CreateUserResponse.fromJson(response);
  }

  /// Creates an Amazon Chime Voice Connector under the administrator's AWS
  /// account. You can choose to create an Amazon Chime Voice Connector in a
  /// specific AWS Region.
  ///
  /// Enabling <a>CreateVoiceConnectorRequest$RequireEncryption</a> configures
  /// your Amazon Chime Voice Connector to use TLS transport for SIP signaling
  /// and Secure RTP (SRTP) for media. Inbound calls use TLS transport, and
  /// unencrypted outbound calls are blocked.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_CreateVoiceConnector.html">CreateVoiceConnector</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon Chime Voice Connector.
  ///
  /// Parameter [requireEncryption] :
  /// When enabled, requires encryption for the Amazon Chime Voice Connector.
  ///
  /// Parameter [awsRegion] :
  /// The AWS Region in which the Amazon Chime Voice Connector is created.
  /// Default value: <code>us-east-1</code> .
  @Deprecated(
      'Replaced by CreateVoiceConnector in the Amazon Chime SDK Voice Namespace')
  Future<CreateVoiceConnectorResponse> createVoiceConnector({
    required String name,
    required bool requireEncryption,
    VoiceConnectorAwsRegion? awsRegion,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'RequireEncryption': requireEncryption,
      if (awsRegion != null) 'AwsRegion': awsRegion.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/voice-connectors',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVoiceConnectorResponse.fromJson(response);
  }

  /// Creates an Amazon Chime Voice Connector group under the administrator's
  /// AWS account. You can associate Amazon Chime Voice Connectors with the
  /// Amazon Chime Voice Connector group by including
  /// <code>VoiceConnectorItems</code> in the request.
  ///
  /// You can include Amazon Chime Voice Connectors from different AWS Regions
  /// in your group. This creates a fault tolerant mechanism for fallback in
  /// case of availability events.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_CreateVoiceConnectorGroup.html">CreateVoiceConnectorGroup</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon Chime Voice Connector group.
  ///
  /// Parameter [voiceConnectorItems] :
  /// The Amazon Chime Voice Connectors to route inbound calls to.
  @Deprecated(
      'Replaced by CreateVoiceConnectorGroup in the Amazon Chime SDK Voice Namespace')
  Future<CreateVoiceConnectorGroupResponse> createVoiceConnectorGroup({
    required String name,
    List<VoiceConnectorItem>? voiceConnectorItems,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (voiceConnectorItems != null)
        'VoiceConnectorItems': voiceConnectorItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/voice-connector-groups',
      exceptionFnMap: _exceptionFns,
    );
    return CreateVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Deletes the specified Amazon Chime account. You must suspend all users
  /// before deleting <code>Team</code> account. You can use the
  /// <a>BatchSuspendUser</a> action to dodo.
  ///
  /// For <code>EnterpriseLWA</code> and <code>EnterpriseAD</code> accounts, you
  /// must release the claimed domains for your Amazon Chime account before
  /// deletion. As soon as you release the domain, all users under that account
  /// are suspended.
  ///
  /// Deleted accounts appear in your <code>Disabled</code> accounts list for 90
  /// days. To restore deleted account from your <code>Disabled</code> accounts
  /// list, you must contact AWS Support.
  ///
  /// After 90 days, deleted accounts are permanently removed from your
  /// <code>Disabled</code> accounts list.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  Future<void> deleteAccount({
    required String accountId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an <code>AppInstance</code> and all associated data
  /// asynchronously.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DeleteAppInstance.html">DeleteAppInstance</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by DeleteAppInstance in the Amazon Chime SDK Identity Namespace')
  Future<void> deleteAppInstance({
    required String appInstanceArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/app-instances/${Uri.encodeComponent(appInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Demotes an <code>AppInstanceAdmin</code> to an
  /// <code>AppInstanceUser</code>. This action does not delete the user.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DeleteAppInstanceAdmin.html">DeleteAppInstanceAdmin</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceAdminArn] :
  /// The ARN of the <code>AppInstance</code>'s administrator.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by DeleteAppInstanceAdmin in the Amazon Chime SDK Identity Namespace')
  Future<void> deleteAppInstanceAdmin({
    required String appInstanceAdminArn,
    required String appInstanceArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/admins/${Uri.encodeComponent(appInstanceAdminArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the streaming configurations of an <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DeleteAppInstanceStreamingConfigurations.html">DeleteAppInstanceStreamingConfigurations</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The ARN of the streaming configurations being deleted.
  @Deprecated(
      'Replaced by DeleteAppInstanceStreamingConfigurations in the Amazon Chime SDK Messaging Namespace')
  Future<void> deleteAppInstanceStreamingConfigurations({
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

  /// Deletes an <code>AppInstanceUser</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DeleteAppInstanceUser.html">DeleteAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user request being deleted.
  @Deprecated(
      'Replaced by DeleteAppInstanceUser in the Amazon Chime SDK Identity Namespace')
  Future<void> deleteAppInstanceUser({
    required String appInstanceUserArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an attendee from the specified Amazon Chime SDK meeting and
  /// deletes their <code>JoinToken</code>. Attendees are automatically deleted
  /// when a Amazon Chime SDK meeting is deleted. For more information about the
  /// Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_DeleteAttendee.html">DeleteAttendee</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Replaced by DeleteAttendee in the Amazon Chime SDK Meetings Namespace')
  Future<void> deleteAttendee({
    required String attendeeId,
    required String meetingId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Immediately makes a channel and its memberships inaccessible and marks
  /// them for deletion. This is an irreversible process.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DeleteChannel.html">DeleteChannel</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel being deleted.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DeleteChannel in the Amazon Chime SDK Messaging Namespace')
  Future<void> deleteChannel({
    required String channelArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a user from a channel's ban list.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DeleteChannelBan.html">DeleteChannelBan</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [memberArn] :
  /// The ARN of the <code>AppInstanceUser</code> that you want to reinstate.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DeleteChannelBan in the Amazon Chime SDK Messaging Namespace')
  Future<void> deleteChannelBan({
    required String channelArn,
    required String memberArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Removes a member from a channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DeleteChannelMembership.html">DeleteChannelMembership</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [memberArn] :
  /// The ARN of the member that you're removing from the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DeleteChannelMembership in the Amazon Chime SDK Messaging Namespace')
  Future<void> deleteChannelMembership({
    required String channelArn,
    required String memberArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel message. Only admins can perform this action. Deletion
  /// makes messages inaccessible immediately. A background process deletes any
  /// revisions created by <code>UpdateChannelMessage</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DeleteChannelMessage.html">DeleteChannelMessage</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [messageId] :
  /// The ID of the message being deleted.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DeleteChannelMessage in the Amazon Chime SDK Messaging Namespace')
  Future<void> deleteChannelMessage({
    required String channelArn,
    required String messageId,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel moderator.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DeleteChannelModerator.html">DeleteChannelModerator</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The ARN of the moderator being deleted.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DeleteChannelModerator in the Amazon Chime SDK Messaging Namespace')
  Future<void> deleteChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Deletes the events configuration that allows a bot to receive outgoing
  /// events.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ResourceLimitExceededException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [botId] :
  /// The bot ID.
  Future<void> deleteEventsConfiguration({
    required String accountId,
    required String botId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}/events-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the media capture pipeline.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_DeleteMediaCapturePipeline.html">DeleteMediaCapturePipeline</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaPipelineId] :
  /// The ID of the media capture pipeline being deleted.
  @Deprecated(
      'Replaced by DeleteMediaCapturePipeline in the Amazon Chime SDK Media Pipelines Namespace')
  Future<void> deleteMediaCapturePipeline({
    required String mediaPipelineId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/media-capture-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified Amazon Chime SDK meeting. The operation deletes all
  /// attendees, disconnects all clients, and prevents new clients from joining
  /// the meeting. For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_DeleteMeeting.html">DeleteMeeting</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Replaced by DeleteMeeting in the Amazon Chime SDK Meetings Namespace')
  Future<void> deleteMeeting({
    required String meetingId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Moves the specified phone number into the <b>Deletion queue</b>. A phone
  /// number must be disassociated from any users or Amazon Chime Voice
  /// Connectors before it can be deleted.
  ///
  /// Deleted phone numbers remain in the <b>Deletion queue</b> for 7 days
  /// before they are deleted permanently.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number ID.
  Future<void> deletePhoneNumber({
    required String phoneNumberId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified proxy session from the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteProxySession.html">DeleteProxySession</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [proxySessionId] :
  /// The proxy session ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  @Deprecated(
      'Replaced by DeleteProxySession in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteProxySession({
    required String proxySessionId,
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions/${Uri.encodeComponent(proxySessionId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a chat room in an Amazon Chime Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [roomId] :
  /// The chat room ID.
  Future<void> deleteRoom({
    required String accountId,
    required String roomId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a member from a chat room in an Amazon Chime Enterprise account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [memberId] :
  /// The member ID (user ID or bot ID).
  ///
  /// Parameter [roomId] :
  /// The room ID.
  Future<void> deleteRoomMembership({
    required String accountId,
    required String memberId,
    required String roomId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/memberships/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a SIP media application.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteSipMediaApplication.html">DeleteSipMediaApplication</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  @Deprecated(
      'Replaced by DeleteSipMediaApplication in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteSipMediaApplication({
    required String sipMediaApplicationId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a SIP rule. You must disable a SIP rule before you can delete it.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteSipRule.html">DeleteSipRule</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipRuleId] :
  /// The SIP rule ID.
  @Deprecated(
      'Replaced by DeleteSipRule in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteSipRule({
    required String sipRuleId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified Amazon Chime Voice Connector. Any phone numbers
  /// associated with the Amazon Chime Voice Connector must be disassociated
  /// from it before it can be deleted.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnector.html">DeleteVoiceConnector</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnector in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnector({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the emergency calling configuration details from the specified
  /// Amazon Chime Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorEmergencyCallingConfiguration.html">DeleteVoiceConnectorEmergencyCallingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorEmergencyCallingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorEmergencyCallingConfiguration({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/emergency-calling-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified Amazon Chime Voice Connector group. Any
  /// <code>VoiceConnectorItems</code> and phone numbers associated with the
  /// group must be removed before it can be deleted.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorGroup.html">DeleteVoiceConnectorGroup</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorGroup in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorGroup({
    required String voiceConnectorGroupId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the origination settings for the specified Amazon Chime Voice
  /// Connector.
  /// <note>
  /// If emergency calling is configured for the Amazon Chime Voice Connector,
  /// it must be deleted prior to deleting the origination settings.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorOrigination.html">DeleteVoiceConnectorOrigination</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorOrigination in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorOrigination({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/origination',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the proxy configuration from the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorProxy.html">DeleteVoiceProxy</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorProxy in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorProxy({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/programmable-numbers/proxy',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the streaming configuration for the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorStreamingConfiguration.html">DeleteVoiceConnectorStreamingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorStreamingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorStreamingConfiguration({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the termination settings for the specified Amazon Chime Voice
  /// Connector.
  /// <note>
  /// If emergency calling is configured for the Amazon Chime Voice Connector,
  /// it must be deleted prior to deleting the termination settings.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorTermination.html">DeleteVoiceConnectorTermination</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorTermination in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorTermination({
    required String voiceConnectorId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified SIP credentials used by your equipment to
  /// authenticate during call termination.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DeleteVoiceConnectorTerminationCredentials.html">DeleteVoiceConnectorTerminationCredentials</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [usernames] :
  /// The RFC2617 compliant username associated with the SIP credentials, in
  /// US-ASCII format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DeleteVoiceConnectorTerminationCredentials in the Amazon Chime SDK Voice Namespace')
  Future<void> deleteVoiceConnectorTerminationCredentials({
    required List<String> usernames,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Usernames': usernames,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/credentials?operation=delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns the full details of an <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DescribeAppInstance.html">DescribeAppInstance</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by DescribeAppInstance in the Amazon Chime SDK Identity Namespace')
  Future<DescribeAppInstanceResponse> describeAppInstance({
    required String appInstanceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/app-instances/${Uri.encodeComponent(appInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceResponse.fromJson(response);
  }

  /// Returns the full details of an <code>AppInstanceAdmin</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DescribeAppInstanceAdmin.html">DescribeAppInstanceAdmin</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceAdminArn] :
  /// The ARN of the <code>AppInstanceAdmin</code>.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by DescribeAppInstanceAdmin in the Amazon Chime SDK Identity Namespace')
  Future<DescribeAppInstanceAdminResponse> describeAppInstanceAdmin({
    required String appInstanceAdminArn,
    required String appInstanceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/admins/${Uri.encodeComponent(appInstanceAdminArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceAdminResponse.fromJson(response);
  }

  /// Returns the full details of an <code>AppInstanceUser</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_DescribeAppInstanceUser.html">DescribeAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the <code>AppInstanceUser</code>.
  @Deprecated(
      'Replaced by DescribeAppInstanceUser in the Amazon Chime SDK Identity Namespace')
  Future<DescribeAppInstanceUserResponse> describeAppInstanceUser({
    required String appInstanceUserArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceUserResponse.fromJson(response);
  }

  /// Returns the full details of a channel in an Amazon Chime
  /// <code>AppInstance</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DescribeChannel.html">DescribeChannel</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DescribeChannel in the Amazon Chime SDK Messaging Namespace')
  Future<DescribeChannelResponse> describeChannel({
    required String channelArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DescribeChannelBan.html">DescribeChannelBan</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [memberArn] :
  /// The ARN of the member being banned.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DescribeChannelBan in the Amazon Chime SDK Messaging Namespace')
  Future<DescribeChannelBanResponse> describeChannelBan({
    required String channelArn,
    required String memberArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Returns the full details of a user's channel membership.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DescribeChannelMembership.html">DescribeChannelMembership</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [memberArn] :
  /// The ARN of the member.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DescribeChannelMembership in the Amazon Chime SDK Messaging Namespace')
  Future<DescribeChannelMembershipResponse> describeChannelMembership({
    required String channelArn,
    required String memberArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelMembershipResponse.fromJson(response);
  }

  /// Returns the details of a channel based on the membership of the specified
  /// <code>AppInstanceUser</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DescribeChannelMembershipForAppInstanceUser.html">DescribeChannelMembershipForAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user in a channel.
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel to which the user belongs.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DescribeChannelMembershipForAppInstanceUser in the Amazon Chime SDK Messaging Namespace')
  Future<DescribeChannelMembershipForAppInstanceUserResponse>
      describeChannelMembershipForAppInstanceUser({
    required String appInstanceUserArn,
    required String channelArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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
  /// <code>AppInstanceUser</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DescribeChannelModeratedByAppInstanceUser.html">DescribeChannelModeratedByAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the <code>AppInstanceUser</code> in the moderated channel.
  ///
  /// Parameter [channelArn] :
  /// The ARN of the moderated channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DescribeChannelModeratedByAppInstanceUser in the Amazon Chime SDK Messaging Namespace')
  Future<DescribeChannelModeratedByAppInstanceUserResponse>
      describeChannelModeratedByAppInstanceUser({
    required String appInstanceUserArn,
    required String channelArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_DescribeChannelModerator.html">DescribeChannelModerator</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The ARN of the channel moderator.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by DescribeChannelModerator in the Amazon Chime SDK Messaging Namespace')
  Future<DescribeChannelModeratorResponse> describeChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Disassociates the primary provisioned phone number from the specified
  /// Amazon Chime user.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<void> disassociatePhoneNumberFromUser({
    required String accountId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=disassociate-phone-number',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates the specified phone numbers from the specified Amazon Chime
  /// Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DisassociatePhoneNumbersFromVoiceConnector.html">DisassociatePhoneNumbersFromVoiceConnector</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by DisassociatePhoneNumbersFromVoiceConnector in the Amazon Chime SDK Voice Namespace')
  Future<DisassociatePhoneNumbersFromVoiceConnectorResponse>
      disassociatePhoneNumbersFromVoiceConnector({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}?operation=disassociate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson(
        response);
  }

  /// Disassociates the specified phone numbers from the specified Amazon Chime
  /// Voice Connector group.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_DisassociatePhoneNumbersFromVoiceConnectorGroup.html">DisassociatePhoneNumbersFromVoiceConnectorGroup</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  @Deprecated(
      'Replaced by DisassociatePhoneNumbersFromVoiceConnectorGroup in the Amazon Chime SDK Voice Namespace')
  Future<DisassociatePhoneNumbersFromVoiceConnectorGroupResponse>
      disassociatePhoneNumbersFromVoiceConnectorGroup({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorGroupId,
  }) async {
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}?operation=disassociate-phone-numbers',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociatePhoneNumbersFromVoiceConnectorGroupResponse.fromJson(
        response);
  }

  /// Disassociates the specified sign-in delegate groups from the specified
  /// Amazon Chime account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [groupNames] :
  /// The sign-in delegate group names.
  Future<void> disassociateSigninDelegateGroupsFromAccount({
    required String accountId,
    required List<String> groupNames,
  }) async {
    final $payload = <String, dynamic>{
      'GroupNames': groupNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}?operation=disassociate-signin-delegate-groups',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves details for the specified Amazon Chime account, such as account
  /// type and supported licenses.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  Future<GetAccountResponse> getAccount({
    required String accountId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountResponse.fromJson(response);
  }

  /// Retrieves account settings for the specified Amazon Chime account ID, such
  /// as remote control and dialout settings. For more information about these
  /// settings, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the
  /// Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  Future<GetAccountSettingsResponse> getAccountSettings({
    required String accountId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
  }

  /// Gets the retention settings for an <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_GetAppInstanceRetentionSettings.html">GetMessagingRetentionSettings</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by GetAppInstanceRetentionSettings in the Amazon Chime SDK Identity Namespace')
  Future<GetAppInstanceRetentionSettingsResponse>
      getAppInstanceRetentionSettings({
    required String appInstanceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/retention-settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppInstanceRetentionSettingsResponse.fromJson(response);
  }

  /// Gets the streaming settings for an <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_GetMessagingStreamingConfigurations.html">GetMessagingStreamingConfigurations</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The ARN of the <code>AppInstance</code>.
  @Deprecated(
      'Replaced by GetAppInstanceStreamingConfigurations in the Amazon Chime SDK Messaging Namespace')
  Future<GetAppInstanceStreamingConfigurationsResponse>
      getAppInstanceStreamingConfigurations({
    required String appInstanceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/streaming-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppInstanceStreamingConfigurationsResponse.fromJson(response);
  }

  /// Gets the Amazon Chime SDK attendee details for a specified meeting ID and
  /// attendee ID. For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_GetAttendee.html">GetAttendee</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Replaced by GetAttendee in the Amazon Chime SDK Meetings Namespace')
  Future<GetAttendeeResponse> getAttendee({
    required String attendeeId,
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAttendeeResponse.fromJson(response);
  }

  /// Retrieves details for the specified bot, such as bot email address, bot
  /// type, status, and display name.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [botId] :
  /// The bot ID.
  Future<GetBotResponse> getBot({
    required String accountId,
    required String botId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotResponse.fromJson(response);
  }

  /// Gets the full details of a channel message.
  /// <note>
  /// The x-amz-chime-bearer request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_GetChannelMessage.html">GetChannelMessage</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [messageId] :
  /// The ID of the message.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by GetChannelMessage in the Amazon Chime SDK Messaging Namespace')
  Future<GetChannelMessageResponse> getChannelMessage({
    required String channelArn,
    required String messageId,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelMessageResponse.fromJson(response);
  }

  /// Gets details for an events configuration that allows a bot to receive
  /// outgoing events, such as an HTTPS endpoint or Lambda function ARN.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [botId] :
  /// The bot ID.
  Future<GetEventsConfigurationResponse> getEventsConfiguration({
    required String accountId,
    required String botId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}/events-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetEventsConfigurationResponse.fromJson(response);
  }

  /// Retrieves global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  Future<GetGlobalSettingsResponse> getGlobalSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlobalSettingsResponse.fromJson(response);
  }

  /// Gets an existing media capture pipeline.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_GetMediaCapturePipeline.html">GetMediaCapturePipeline</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [mediaPipelineId] :
  /// The ID of the pipeline that you want to get.
  @Deprecated(
      'Replaced by GetMediaCapturePipeline in the Amazon Chime SDK Media Pipelines Namespace')
  Future<GetMediaCapturePipelineResponse> getMediaCapturePipeline({
    required String mediaPipelineId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/media-capture-pipelines/${Uri.encodeComponent(mediaPipelineId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMediaCapturePipelineResponse.fromJson(response);
  }

  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_GetMeeting.html">GetMeeting</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  /// Gets the Amazon Chime SDK meeting details for the specified meeting ID.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i> .
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Replaced by GetMeeting in the Amazon Chime SDK Meetings Namespace')
  Future<GetMeetingResponse> getMeeting({
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMeetingResponse.fromJson(response);
  }

  /// The details of the endpoint for the messaging session.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_GetMessagingSessionEndpoint.html">GetMessagingSessionEndpoint</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  @Deprecated(
      'Replaced by GetMessagingSessionEndpoint in the Amazon Chime SDK Messaging Namespace')
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

  /// Retrieves details for the specified phone number ID, such as associations,
  /// capabilities, and product type.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number ID.
  Future<GetPhoneNumberResponse> getPhoneNumber({
    required String phoneNumberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberResponse.fromJson(response);
  }

  /// Retrieves details for the specified phone number order, such as the order
  /// creation timestamp, phone numbers in E.164 format, product type, and order
  /// status.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberOrderId] :
  /// The ID for the phone number order.
  Future<GetPhoneNumberOrderResponse> getPhoneNumberOrder({
    required String phoneNumberOrderId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/phone-number-orders/${Uri.encodeComponent(phoneNumberOrderId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberOrderResponse.fromJson(response);
  }

  /// Retrieves the phone number settings for the administrator's AWS account,
  /// such as the default outbound calling name.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  Future<GetPhoneNumberSettingsResponse> getPhoneNumberSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings/phone-number',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberSettingsResponse.fromJson(response);
  }

  /// Gets the specified proxy session details for the specified Amazon Chime
  /// Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetProxySession.html">GetProxySession</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [proxySessionId] :
  /// The proxy session ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  @Deprecated(
      'Replaced by GetProxySession in the Amazon Chime SDK Voice Namespace')
  Future<GetProxySessionResponse> getProxySession({
    required String proxySessionId,
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions/${Uri.encodeComponent(proxySessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProxySessionResponse.fromJson(response);
  }

  /// Gets the retention settings for the specified Amazon Chime Enterprise
  /// account. For more information about retention settings, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing
  /// Chat Retention Policies</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  Future<GetRetentionSettingsResponse> getRetentionSettings({
    required String accountId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/retention-settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetRetentionSettingsResponse.fromJson(response);
  }

  /// Retrieves room details, such as the room name, for a room in an Amazon
  /// Chime Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [roomId] :
  /// The room ID.
  Future<GetRoomResponse> getRoom({
    required String accountId,
    required String roomId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRoomResponse.fromJson(response);
  }

  /// Retrieves the information for a SIP media application, including name, AWS
  /// Region, and endpoints.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetSipMediaApplication.html">GetSipMediaApplication</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  @Deprecated(
      'Replaced by GetSipMediaApplication in the Amazon Chime SDK Voice Namespace')
  Future<GetSipMediaApplicationResponse> getSipMediaApplication({
    required String sipMediaApplicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipMediaApplicationResponse.fromJson(response);
  }

  /// Returns the logging configuration for the specified SIP media application.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetSipMediaApplicationLoggingConfiguration.html">GetSipMediaApplicationLoggingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  @Deprecated(
      'Replaced by GetSipMediaApplicationLoggingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<GetSipMediaApplicationLoggingConfigurationResponse>
      getSipMediaApplicationLoggingConfiguration({
    required String sipMediaApplicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipMediaApplicationLoggingConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves the details of a SIP rule, such as the rule ID, name, triggers,
  /// and target endpoints.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetSipRule.html">GetSipRule</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipRuleId] :
  /// The SIP rule ID.
  @Deprecated('Replaced by GetSipRule in the Amazon Chime SDK Voice Namespace')
  Future<GetSipRuleResponse> getSipRule({
    required String sipRuleId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipRuleResponse.fromJson(response);
  }

  /// Retrieves details for the specified user ID, such as primary email
  /// address, license type,and personal meeting PIN.
  ///
  /// To retrieve user details with an email address instead of a user ID, use
  /// the <a>ListUsers</a> action, and then filter by email address.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<GetUserResponse> getUser({
    required String accountId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetUserResponse.fromJson(response);
  }

  /// Retrieves settings for the specified user ID, such as any associated phone
  /// number settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<GetUserSettingsResponse> getUserSettings({
    required String accountId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetUserSettingsResponse.fromJson(response);
  }

  /// Retrieves details for the specified Amazon Chime Voice Connector, such as
  /// timestamps,name, outbound host, and encryption requirements.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnector.html">GetVoiceConnector</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnector in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorResponse> getVoiceConnector({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorResponse.fromJson(response);
  }

  /// Gets the emergency calling configuration details for the specified Amazon
  /// Chime Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorEmergencyCallingConfiguration.html">GetVoiceConnectorEmergencyCallingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorEmergencyCallingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorEmergencyCallingConfigurationResponse>
      getVoiceConnectorEmergencyCallingConfiguration({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/emergency-calling-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
        response);
  }

  /// Retrieves details for the specified Amazon Chime Voice Connector group,
  /// such as timestamps,name, and associated <code>VoiceConnectorItems</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorGroup.html">GetVoiceConnectorGroup</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorGroup in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorGroupResponse> getVoiceConnectorGroup({
    required String voiceConnectorGroupId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Retrieves the logging configuration details for the specified Amazon Chime
  /// Voice Connector. Shows whether SIP message logs are enabled for sending to
  /// Amazon CloudWatch Logs.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorLoggingConfiguration.html">GetVoiceConnectorLoggingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorLoggingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorLoggingConfigurationResponse>
      getVoiceConnectorLoggingConfiguration({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorLoggingConfigurationResponse.fromJson(response);
  }

  /// Retrieves origination setting details for the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorOrigination.html">GetVoiceConnectorOrigination</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorOrigination in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorOriginationResponse> getVoiceConnectorOrigination({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/origination',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorOriginationResponse.fromJson(response);
  }

  /// Gets the proxy configuration details for the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorProxy.html">GetVoiceConnectorProxy</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorProxy in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorProxyResponse> getVoiceConnectorProxy({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/programmable-numbers/proxy',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorProxyResponse.fromJson(response);
  }

  /// Retrieves the streaming configuration details for the specified Amazon
  /// Chime Voice Connector. Shows whether media streaming is enabled for
  /// sending to Amazon Kinesis. It also shows the retention period, in hours,
  /// for the Amazon Kinesis data.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorStreamingConfiguration.html">GetVoiceConnectorStreamingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorStreamingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorStreamingConfigurationResponse>
      getVoiceConnectorStreamingConfiguration({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorStreamingConfigurationResponse.fromJson(response);
  }

  /// Retrieves termination setting details for the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorTermination.html">GetVoiceConnectorTermination</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorTermination in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorTerminationResponse> getVoiceConnectorTermination({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorTerminationResponse.fromJson(response);
  }

  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_GetVoiceConnectorTerminationHealth.html">GetVoiceConnectorTerminationHealth</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  /// Retrieves information about the last time a SIP <code>OPTIONS</code> ping
  /// was received from your SIP infrastructure for the specified Amazon Chime
  /// Voice Connector.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by GetVoiceConnectorTerminationHealth in the Amazon Chime SDK Voice Namespace')
  Future<GetVoiceConnectorTerminationHealthResponse>
      getVoiceConnectorTerminationHealth({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/health',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorTerminationHealthResponse.fromJson(response);
  }

  /// Sends email to a maximum of 50 users, inviting them to the specified
  /// Amazon Chime <code>Team</code> account. Only <code>Team</code> account
  /// types are currently supported for this action.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userEmailList] :
  /// The user email addresses to which to send the email invitation.
  ///
  /// Parameter [userType] :
  /// The user type.
  Future<InviteUsersResponse> inviteUsers({
    required String accountId,
    required List<String> userEmailList,
    UserType? userType,
  }) async {
    final $payload = <String, dynamic>{
      'UserEmailList': userEmailList,
      if (userType != null) 'UserType': userType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users?operation=add',
      exceptionFnMap: _exceptionFns,
    );
    return InviteUsersResponse.fromJson(response);
  }

  /// Lists the Amazon Chime accounts under the administrator's AWS account. You
  /// can filter accounts by account name prefix. To find out which Amazon Chime
  /// account a user belongs to, you can filter by the user's email address,
  /// which returns one account result.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Defaults to 100.
  ///
  /// Parameter [name] :
  /// Amazon Chime account name prefix with which to filter results.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  ///
  /// Parameter [userEmail] :
  /// User email address with which to filter results.
  Future<ListAccountsResponse> listAccounts({
    int? maxResults,
    String? name,
    String? nextToken,
    String? userEmail,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (name != null) 'name': [name],
      if (nextToken != null) 'next-token': [nextToken],
      if (userEmail != null) 'user-email': [userEmail],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountsResponse.fromJson(response);
  }

  /// Returns a list of the administrators in the <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_ListAppInstanceAdmins.html">ListAppInstanceAdmins</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of administrators that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of
  /// administrators is reached.
  @Deprecated(
      'Replaced by ListAppInstanceAdmins in the Amazon Chime SDK Identity Namespace')
  Future<ListAppInstanceAdminsResponse> listAppInstanceAdmins({
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
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/admins',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppInstanceAdminsResponse.fromJson(response);
  }

  /// List all <code>AppInstanceUsers</code> created under a single
  /// <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_ListAppInstanceUsers.html">ListAppInstanceUsers</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of requests that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested users are
  /// returned.
  @Deprecated(
      'Replaced by ListAppInstanceUsers in the Amazon Chime SDK Identity Namespace')
  Future<ListAppInstanceUsersResponse> listAppInstanceUsers({
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
      requestUri: '/app-instance-users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppInstanceUsersResponse.fromJson(response);
  }

  /// Lists all Amazon Chime <code>AppInstance</code>s created under a single
  /// AWS account.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_ListAppInstances.html">ListAppInstances</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of <code>AppInstance</code>s that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API requests until you reach the maximum
  /// number of <code>AppInstance</code>s.
  @Deprecated(
      'Replaced by ListAppInstances in the Amazon Chime SDK Identity Namespace')
  Future<ListAppInstancesResponse> listAppInstances({
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
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/app-instances',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppInstancesResponse.fromJson(response);
  }

  /// Lists the tags applied to an Amazon Chime SDK attendee resource.
  /// <important>
  /// ListAttendeeTags is not supported in the Amazon Chime SDK Meetings
  /// Namespace. Update your application to remove calls to this API.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Attendee Tags are not supported in the Amazon Chime SDK Meetings Namespace. Update your application to remove calls to this API.')
  Future<ListAttendeeTagsResponse> listAttendeeTags({
    required String attendeeId,
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListAttendeeTagsResponse.fromJson(response);
  }

  /// Lists the attendees for the specified Amazon Chime SDK meeting. For more
  /// information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_ListAttendees.html">ListAttendees</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  @Deprecated(
      'Replaced by ListAttendees in the Amazon Chime SDK Meetings Namespace')
  Future<ListAttendeesResponse> listAttendees({
    required String meetingId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/attendees',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAttendeesResponse.fromJson(response);
  }

  /// Lists the bots associated with the administrator's Amazon Chime Enterprise
  /// account ID.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default is
  /// 10.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  Future<ListBotsResponse> listBots({
    required String accountId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/bots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBotsResponse.fromJson(response);
  }

  /// Lists all the users banned from a particular channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannelBans.html">ListChannelBans</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bans that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested bans are
  /// returned.
  @Deprecated(
      'Replaced by ListChannelBans in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelBansResponse> listChannelBans({
    required String channelArn,
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

  /// Lists all channel memberships in a channel.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannelMemberships.html">ListChannelMemberships</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channel memberships that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channel
  /// memberships are returned.
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are always returned as part of
  /// <code>ListChannelMemberships</code>. Hidden members are only returned if
  /// the type filter in <code>ListChannelMemberships</code> equals
  /// <code>HIDDEN</code>. Otherwise hidden members are not returned.
  @Deprecated(
      'Replaced by ListChannelMemberships in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelMembershipsResponse> listChannelMemberships({
    required String channelArn,
    String? chimeBearer,
    int? maxResults,
    String? nextToken,
    ChannelMembershipType? type,
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

  /// Lists all channels that a particular <code>AppInstanceUser</code> is a
  /// part of. Only an <code>AppInstanceAdmin</code> can call the API with a
  /// user ARN that is not their own.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannelMembershipsForAppInstanceUser.html">ListChannelMembershipsForAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the <code>AppInstanceUser</code>s
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of users that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channel
  /// memberships is reached.
  @Deprecated(
      'Replaced by ListChannelMembershipsForAppInstanceUser in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelMembershipsForAppInstanceUserResponse>
      listChannelMembershipsForAppInstanceUser({
    String? appInstanceUserArn,
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
  /// Also, the x-amz-chime-bearer request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannelMessages.html">ListChannelMessages</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
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
  @Deprecated(
      'Replaced by ListChannelMessages in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelMessagesResponse> listChannelMessages({
    required String channelArn,
    String? chimeBearer,
    int? maxResults,
    String? nextToken,
    DateTime? notAfter,
    DateTime? notBefore,
    SortOrder? sortOrder,
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
      if (notAfter != null)
        'not-after': [_s.iso8601ToJson(notAfter).toString()],
      if (notBefore != null)
        'not-before': [_s.iso8601ToJson(notBefore).toString()],
      if (sortOrder != null) 'sort-order': [sortOrder.toValue()],
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannelModerators.html">ListChannelModerators</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of moderators that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested moderators are
  /// returned.
  @Deprecated(
      'Replaced by ListChannelModerators in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelModeratorsResponse> listChannelModerators({
    required String channelArn,
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannels.html">ListChannels</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
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
  @Deprecated(
      'Replaced by ListChannels in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelsResponse> listChannels({
    required String appInstanceArn,
    String? chimeBearer,
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
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// A list of the channels moderated by an <code>AppInstanceUser</code>.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListChannelsModeratedByAppInstanceUser.html">ListChannelsModeratedByAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user in the moderated channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels in the request.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channels
  /// moderated by the user is reached.
  @Deprecated(
      'Replaced by ListChannelsModeratedByAppInstanceUser in the Amazon Chime SDK Messaging Namespace')
  Future<ListChannelsModeratedByAppInstanceUserResponse>
      listChannelsModeratedByAppInstanceUser({
    String? appInstanceUserArn,
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

  /// Returns a list of media capture pipelines.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_media-pipelines-chime_ListMediaCapturePipelines.html">ListMediaCapturePipelines</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Valid Range: 1 -
  /// 99.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  @Deprecated(
      'Replaced by ListMediaCapturePipelines in the Amazon Chime SDK Media Pipelines Namespace')
  Future<ListMediaCapturePipelinesResponse> listMediaCapturePipelines({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/media-capture-pipelines',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMediaCapturePipelinesResponse.fromJson(response);
  }

  /// Lists the tags applied to an Amazon Chime SDK meeting resource.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_ListTagsForResource.html">ListTagsForResource</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  @Deprecated(
      'Use ListTagsForResource in the Amazon Chime SDK Meetings Namespace.')
  Future<ListMeetingTagsResponse> listMeetingTags({
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListMeetingTagsResponse.fromJson(response);
  }

  /// Lists up to 100 active Amazon Chime SDK meetings.
  /// <important>
  /// ListMeetings is not supported in the Amazon Chime SDK Meetings Namespace.
  /// Update your application to remove calls to this API.
  /// </important>
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  @Deprecated(
      'ListMeetings is not supported in the Amazon Chime SDK Meetings Namespace. Update your application to remove calls to this API.')
  Future<ListMeetingsResponse> listMeetings({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMeetingsResponse.fromJson(response);
  }

  /// Lists the phone number orders for the administrator's Amazon Chime
  /// account.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  Future<ListPhoneNumberOrdersResponse> listPhoneNumberOrders({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-number-orders',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumberOrdersResponse.fromJson(response);
  }

  /// Lists the phone numbers for the specified Amazon Chime account, Amazon
  /// Chime user, Amazon Chime Voice Connector, or Amazon Chime Voice Connector
  /// group.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [filterName] :
  /// The filter to use to limit the number of results.
  ///
  /// Parameter [filterValue] :
  /// The value to use for the filter.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  ///
  /// Parameter [productType] :
  /// The phone number product type.
  ///
  /// Parameter [status] :
  /// The phone number status.
  Future<ListPhoneNumbersResponse> listPhoneNumbers({
    PhoneNumberAssociationName? filterName,
    String? filterValue,
    int? maxResults,
    String? nextToken,
    PhoneNumberProductType? productType,
    PhoneNumberStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (filterName != null) 'filter-name': [filterName.toValue()],
      if (filterValue != null) 'filter-value': [filterValue],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (productType != null) 'product-type': [productType.toValue()],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListPhoneNumbersResponse.fromJson(response);
  }

  /// Lists the proxy sessions for the specified Amazon Chime Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ListProxySessions.html">ListProxySessions</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  ///
  /// Parameter [status] :
  /// The proxy session status.
  @Deprecated(
      'Replaced by ListProxySessions in the Amazon Chime SDK Voice Namespace')
  Future<ListProxySessionsResponse> listProxySessions({
    required String voiceConnectorId,
    int? maxResults,
    String? nextToken,
    ProxySessionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProxySessionsResponse.fromJson(response);
  }

  /// Lists the membership details for the specified room in an Amazon Chime
  /// Enterprise account, such as the members' IDs, email addresses, and names.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [roomId] :
  /// The room ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  Future<ListRoomMembershipsResponse> listRoomMemberships({
    required String accountId,
    required String roomId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/memberships',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoomMembershipsResponse.fromJson(response);
  }

  /// Lists the room details for the specified Amazon Chime Enterprise account.
  /// Optionally, filter the results by a member ID (user ID or bot ID) to see a
  /// list of rooms that the member belongs to.
  ///
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [memberId] :
  /// The member ID (user ID or bot ID).
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  Future<ListRoomsResponse> listRooms({
    required String accountId,
    int? maxResults,
    String? memberId,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (memberId != null) 'member-id': [memberId],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/rooms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListRoomsResponse.fromJson(response);
  }

  /// Lists the SIP media applications under the administrator's AWS account.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ListSipMediaApplications.html">ListSipMediaApplications</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  @Deprecated(
      'Replaced by ListSipMediaApplications in the Amazon Chime SDK Voice Namespace')
  Future<ListSipMediaApplicationsResponse> listSipMediaApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-media-applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSipMediaApplicationsResponse.fromJson(response);
  }

  /// Lists the SIP rules under the administrator's AWS account.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ListSipRules.html">ListSipRules</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  @Deprecated(
      'Replaced by ListSipRules in the Amazon Chime SDK Voice Namespace')
  Future<ListSipRulesResponse> listSipRules({
    int? maxResults,
    String? nextToken,
    String? sipMediaApplicationId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (sipMediaApplicationId != null)
        'sip-media-application': [sipMediaApplicationId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-rules',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSipRulesResponse.fromJson(response);
  }

  /// Lists supported phone number countries.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [productType] :
  /// The phone number product type.
  Future<ListSupportedPhoneNumberCountriesResponse>
      listSupportedPhoneNumberCountries({
    required PhoneNumberProductType productType,
  }) async {
    final $query = <String, List<String>>{
      'product-type': [productType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-number-countries',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSupportedPhoneNumberCountriesResponse.fromJson(response);
  }

  /// Lists the tags applied to an Amazon Chime SDK meeting and messaging
  /// resources.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the applicable latest version in the Amazon Chime SDK.
  ///
  /// <ul>
  /// <li>
  /// For meetings: <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_ListTagsForResource.html">ListTagsForResource</a>.
  /// </li>
  /// <li>
  /// For messaging: <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_ListTagsForResource.html">ListTagsForResource</a>.
  /// </li>
  /// </ul>
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  @Deprecated(
      'Replaced by ListTagsForResource in the Amazon Chime SDK Voice, Amazon Chime SDK Meetings, Amazon Chime SDK Identity, Amazon Chime SDK Messaging, and Amazon Chime SDK Media Pipelines Namespaces')
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

  /// Lists the users that belong to the specified Amazon Chime account. You can
  /// specify an email address to list only the user that the email address
  /// belongs to.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. Defaults to 100.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  ///
  /// Parameter [userEmail] :
  /// Optional. The user email address used to filter results. Maximum 1.
  ///
  /// Parameter [userType] :
  /// The user type.
  Future<ListUsersResponse> listUsers({
    required String accountId,
    int? maxResults,
    String? nextToken,
    String? userEmail,
    UserType? userType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (userEmail != null) 'user-email': [userEmail],
      if (userType != null) 'user-type': [userType.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Lists the Amazon Chime Voice Connector groups for the administrator's AWS
  /// account.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ListVoiceConnectorGroups.html">ListVoiceConnectorGroups</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  @Deprecated(
      'Replaced by ListVoiceConnectorGroups in the Amazon Chime SDK Voice Namespace')
  Future<ListVoiceConnectorGroupsResponse> listVoiceConnectorGroups({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connector-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceConnectorGroupsResponse.fromJson(response);
  }

  /// Lists the SIP credentials for the specified Amazon Chime Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ListVoiceConnectorTerminationCredentials.html">ListVoiceConnectorTerminationCredentials</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by ListVoiceConnectorTerminationCredentials in the Amazon Chime SDK Voice Namespace')
  Future<ListVoiceConnectorTerminationCredentialsResponse>
      listVoiceConnectorTerminationCredentials({
    required String voiceConnectorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/credentials',
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceConnectorTerminationCredentialsResponse.fromJson(response);
  }

  /// Lists the Amazon Chime Voice Connectors for the administrator's AWS
  /// account.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ListVoiceConnectors.html">ListVoiceConnectors</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  @Deprecated(
      'Replaced by ListVoiceConnectors in the Amazon Chime SDK Voice Namespace')
  Future<ListVoiceConnectorsResponse> listVoiceConnectors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connectors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListVoiceConnectorsResponse.fromJson(response);
  }

  /// Logs out the specified user from all of the devices they are currently
  /// logged into.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<void> logoutUser({
    required String accountId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=logout',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the amount of time in days that a given <code>AppInstance</code>
  /// retains data.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_PutAppInstanceRetentionSettings.html">PutAppInstanceRetentionSettings</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [appInstanceRetentionSettings] :
  /// The time in days to retain data. Data type: number.
  @Deprecated(
      'Replaced by PutAppInstanceRetentionSettings in the Amazon Chime SDK Identity Namespace')
  Future<PutAppInstanceRetentionSettingsResponse>
      putAppInstanceRetentionSettings({
    required String appInstanceArn,
    required AppInstanceRetentionSettings appInstanceRetentionSettings,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceRetentionSettings': appInstanceRetentionSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/retention-settings',
      exceptionFnMap: _exceptionFns,
    );
    return PutAppInstanceRetentionSettingsResponse.fromJson(response);
  }

  /// The data streaming configurations of an <code>AppInstance</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_PutMessagingStreamingConfigurations.html">PutMessagingStreamingConfigurations</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [NotFoundException].
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
  /// Parameter [appInstanceStreamingConfigurations] :
  /// The streaming configurations set for an <code>AppInstance</code>.
  @Deprecated(
      'Replaced by PutAppInstanceStreamingConfigurations in the Amazon Chime SDK Messaging Namespace')
  Future<PutAppInstanceStreamingConfigurationsResponse>
      putAppInstanceStreamingConfigurations({
    required String appInstanceArn,
    required List<AppInstanceStreamingConfiguration>
        appInstanceStreamingConfigurations,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceStreamingConfigurations': appInstanceStreamingConfigurations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/streaming-configurations',
      exceptionFnMap: _exceptionFns,
    );
    return PutAppInstanceStreamingConfigurationsResponse.fromJson(response);
  }

  /// Creates an events configuration that allows a bot to receive outgoing
  /// events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda
  /// function ARN. For more information, see <a>Bot</a>.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [NotFoundException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [botId] :
  /// The bot ID.
  ///
  /// Parameter [lambdaFunctionArn] :
  /// Lambda function ARN that allows the bot to receive outgoing events.
  ///
  /// Parameter [outboundEventsHTTPSEndpoint] :
  /// HTTPS endpoint that allows the bot to receive outgoing events.
  Future<PutEventsConfigurationResponse> putEventsConfiguration({
    required String accountId,
    required String botId,
    String? lambdaFunctionArn,
    String? outboundEventsHTTPSEndpoint,
  }) async {
    final $payload = <String, dynamic>{
      if (lambdaFunctionArn != null) 'LambdaFunctionArn': lambdaFunctionArn,
      if (outboundEventsHTTPSEndpoint != null)
        'OutboundEventsHTTPSEndpoint': outboundEventsHTTPSEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}/events-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutEventsConfigurationResponse.fromJson(response);
  }

  /// Puts retention settings for the specified Amazon Chime Enterprise account.
  /// We recommend using AWS CloudTrail to monitor usage of this API for your
  /// account. For more information, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/cloudtrail.html">Logging
  /// Amazon Chime API Calls with AWS CloudTrail</a> in the <i>Amazon Chime
  /// Administration Guide</i>.
  ///
  /// To turn off existing retention settings, remove the number of days from
  /// the corresponding <b>RetentionDays</b> field in the
  /// <b>RetentionSettings</b> object. For more information about retention
  /// settings, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing
  /// Chat Retention Policies</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [retentionSettings] :
  /// The retention settings.
  Future<PutRetentionSettingsResponse> putRetentionSettings({
    required String accountId,
    required RetentionSettings retentionSettings,
  }) async {
    final $payload = <String, dynamic>{
      'RetentionSettings': retentionSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/retention-settings',
      exceptionFnMap: _exceptionFns,
    );
    return PutRetentionSettingsResponse.fromJson(response);
  }

  /// Updates the logging configuration for the specified SIP media application.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutSipMediaApplicationLoggingConfiguration.html">PutSipMediaApplicationLoggingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  ///
  /// Parameter [sipMediaApplicationLoggingConfiguration] :
  /// The actual logging configuration.
  @Deprecated(
      'Replaced by PutSipMediaApplicationLoggingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<PutSipMediaApplicationLoggingConfigurationResponse>
      putSipMediaApplicationLoggingConfiguration({
    required String sipMediaApplicationId,
    SipMediaApplicationLoggingConfiguration?
        sipMediaApplicationLoggingConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      if (sipMediaApplicationLoggingConfiguration != null)
        'SipMediaApplicationLoggingConfiguration':
            sipMediaApplicationLoggingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutSipMediaApplicationLoggingConfigurationResponse.fromJson(
        response);
  }

  /// Puts emergency calling configuration details to the specified Amazon Chime
  /// Voice Connector, such as emergency phone numbers and calling countries.
  /// Origination and termination settings must be enabled for the Amazon Chime
  /// Voice Connector before emergency calling can be configured.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorEmergencyCallingConfiguration.html">PutVoiceConnectorEmergencyCallingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [emergencyCallingConfiguration] :
  /// The emergency calling configuration details.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by PutVoiceConnectorEmergencyCallingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<PutVoiceConnectorEmergencyCallingConfigurationResponse>
      putVoiceConnectorEmergencyCallingConfiguration({
    required EmergencyCallingConfiguration emergencyCallingConfiguration,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'EmergencyCallingConfiguration': emergencyCallingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/emergency-calling-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
        response);
  }

  /// Adds a logging configuration for the specified Amazon Chime Voice
  /// Connector. The logging configuration specifies whether SIP message logs
  /// are enabled for sending to Amazon CloudWatch Logs.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorLoggingConfiguration.html">PutVoiceConnectorLoggingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [loggingConfiguration] :
  /// The logging configuration details to add.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by PutVoiceConnectorLoggingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<PutVoiceConnectorLoggingConfigurationResponse>
      putVoiceConnectorLoggingConfiguration({
    required LoggingConfiguration loggingConfiguration,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'LoggingConfiguration': loggingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorLoggingConfigurationResponse.fromJson(response);
  }

  /// Adds origination settings for the specified Amazon Chime Voice Connector.
  /// <note>
  /// If emergency calling is configured for the Amazon Chime Voice Connector,
  /// it must be deleted prior to turning off origination settings.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorOrigination.html">PutVoiceConnectorOrigination</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [origination] :
  /// The origination setting details to add.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by PutVoiceConnectorOrigination in the Amazon Chime SDK Voice Namespace')
  Future<PutVoiceConnectorOriginationResponse> putVoiceConnectorOrigination({
    required Origination origination,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Origination': origination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/origination',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorOriginationResponse.fromJson(response);
  }

  /// Puts the specified proxy configuration to the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorProxy.html">PutVoiceConnectorProxy</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [AccessDeniedException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [defaultSessionExpiryMinutes] :
  /// The default number of minutes allowed for proxy sessions.
  ///
  /// Parameter [phoneNumberPoolCountries] :
  /// The countries for proxy phone numbers to be selected from.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  ///
  /// Parameter [disabled] :
  /// When true, stops proxy sessions from being created on the specified Amazon
  /// Chime Voice Connector.
  ///
  /// Parameter [fallBackPhoneNumber] :
  /// The phone number to route calls to after a proxy session expires.
  @Deprecated(
      'Replaced by PutVoiceConnectorProxy in the Amazon Chime SDK Voice Namespace')
  Future<PutVoiceConnectorProxyResponse> putVoiceConnectorProxy({
    required int defaultSessionExpiryMinutes,
    required List<String> phoneNumberPoolCountries,
    required String voiceConnectorId,
    bool? disabled,
    String? fallBackPhoneNumber,
  }) async {
    final $payload = <String, dynamic>{
      'DefaultSessionExpiryMinutes': defaultSessionExpiryMinutes,
      'PhoneNumberPoolCountries': phoneNumberPoolCountries,
      if (disabled != null) 'Disabled': disabled,
      if (fallBackPhoneNumber != null)
        'FallBackPhoneNumber': fallBackPhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/programmable-numbers/proxy',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorProxyResponse.fromJson(response);
  }

  /// Adds a streaming configuration for the specified Amazon Chime Voice
  /// Connector. The streaming configuration specifies whether media streaming
  /// is enabled for sending to Kinesis. It also sets the retention period, in
  /// hours, for the Amazon Kinesis data.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorStreamingConfiguration.html">PutVoiceConnectorStreamingConfiguration</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [streamingConfiguration] :
  /// The streaming configuration details to add.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by PutVoiceConnectorStreamingConfiguration in the Amazon Chime SDK Voice Namespace')
  Future<PutVoiceConnectorStreamingConfigurationResponse>
      putVoiceConnectorStreamingConfiguration({
    required StreamingConfiguration streamingConfiguration,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'StreamingConfiguration': streamingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorStreamingConfigurationResponse.fromJson(response);
  }

  /// Adds termination settings for the specified Amazon Chime Voice Connector.
  /// <note>
  /// If emergency calling is configured for the Amazon Chime Voice Connector,
  /// it must be deleted prior to turning off termination settings.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorTermination.html">PutVoiceConnectorTermination</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [AccessDeniedException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [termination] :
  /// The termination setting details to add.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by PutVoiceConnectorTermination in the Amazon Chime SDK Voice Namespace')
  Future<PutVoiceConnectorTerminationResponse> putVoiceConnectorTermination({
    required Termination termination,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Termination': termination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorTerminationResponse.fromJson(response);
  }

  /// Adds termination SIP credentials for the specified Amazon Chime Voice
  /// Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_PutVoiceConnectorTerminationCredentials.html">PutVoiceConnectorTerminationCredentials</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  ///
  /// Parameter [credentials] :
  /// The termination SIP credentials.
  @Deprecated(
      'Replaced by PutVoiceConnectorTerminationCredentials in the Amazon Chime SDK Voice Namespace')
  Future<void> putVoiceConnectorTerminationCredentials({
    required String voiceConnectorId,
    List<Credential>? credentials,
  }) async {
    final $payload = <String, dynamic>{
      if (credentials != null) 'Credentials': credentials,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination/credentials?operation=put',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Redacts message content, but not metadata. The message exists in the back
  /// end, but the action returns null content, and the state shows as redacted.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_RedactChannelMessage.html">RedactChannelMessage</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel containing the messages that you want to redact.
  ///
  /// Parameter [messageId] :
  /// The ID of the message being redacted.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by RedactChannelMessage in the Amazon Chime SDK Messaging Namespace')
  Future<RedactChannelMessageResponse> redactChannelMessage({
    required String channelArn,
    required String messageId,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return RedactChannelMessageResponse.fromJson(response);
  }

  /// Redacts the specified message from the specified Amazon Chime
  /// conversation.
  ///
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [BadRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [conversationId] :
  /// The conversation ID.
  ///
  /// Parameter [messageId] :
  /// The message ID.
  Future<void> redactConversationMessage({
    required String accountId,
    required String conversationId,
    required String messageId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/conversations/${Uri.encodeComponent(conversationId)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Redacts the specified message from the specified Amazon Chime channel.
  ///
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [BadRequestException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [messageId] :
  /// The message ID.
  ///
  /// Parameter [roomId] :
  /// The room ID.
  Future<void> redactRoomMessage({
    required String accountId,
    required String messageId,
    required String roomId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Regenerates the security token for a bot.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [botId] :
  /// The bot ID.
  Future<RegenerateSecurityTokenResponse> regenerateSecurityToken({
    required String accountId,
    required String botId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}?operation=regenerate-security-token',
      exceptionFnMap: _exceptionFns,
    );
    return RegenerateSecurityTokenResponse.fromJson(response);
  }

  /// Resets the personal meeting PIN for the specified user on an Amazon Chime
  /// account. Returns the <a>User</a> object with the updated personal meeting
  /// PIN.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  Future<ResetPersonalPINResponse> resetPersonalPIN({
    required String accountId,
    required String userId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=reset-personal-pin',
      exceptionFnMap: _exceptionFns,
    );
    return ResetPersonalPINResponse.fromJson(response);
  }

  /// Moves a phone number from the <b>Deletion queue</b> back into the phone
  /// number <b>Inventory</b>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number.
  Future<RestorePhoneNumberResponse> restorePhoneNumber({
    required String phoneNumberId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}?operation=restore',
      exceptionFnMap: _exceptionFns,
    );
    return RestorePhoneNumberResponse.fromJson(response);
  }

  /// Searches for phone numbers that can be ordered. For US numbers, provide at
  /// least one of the following search filters: <code>AreaCode</code>,
  /// <code>City</code>, <code>State</code>, or <code>TollFreePrefix</code>. If
  /// you provide <code>City</code>, you must also provide <code>State</code>.
  /// Numbers outside the US only support the <code>PhoneNumberType</code>
  /// filter, which you must use.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [AccessDeniedException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [areaCode] :
  /// The area code used to filter results. Only applies to the US.
  ///
  /// Parameter [city] :
  /// The city used to filter results. Only applies to the US.
  ///
  /// Parameter [country] :
  /// The country used to filter results. Defaults to the US Format: ISO 3166-1
  /// alpha-2.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token used to retrieve the next page of results.
  ///
  /// Parameter [phoneNumberType] :
  /// The phone number type used to filter results. Required for non-US numbers.
  ///
  /// Parameter [state] :
  /// The state used to filter results. Required only if you provide
  /// <code>City</code>. Only applies to the US.
  ///
  /// Parameter [tollFreePrefix] :
  /// The toll-free prefix that you use to filter results. Only applies to the
  /// US.
  Future<SearchAvailablePhoneNumbersResponse> searchAvailablePhoneNumbers({
    String? areaCode,
    String? city,
    String? country,
    int? maxResults,
    String? nextToken,
    PhoneNumberType? phoneNumberType,
    String? state,
    String? tollFreePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $query = <String, List<String>>{
      if (areaCode != null) 'area-code': [areaCode],
      if (city != null) 'city': [city],
      if (country != null) 'country': [country],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (phoneNumberType != null)
        'phone-number-type': [phoneNumberType.toValue()],
      if (state != null) 'state': [state],
      if (tollFreePrefix != null) 'toll-free-prefix': [tollFreePrefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/search?type=phone-numbers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return SearchAvailablePhoneNumbersResponse.fromJson(response);
  }

  /// Sends a message to a particular channel that the member is a part of.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  ///
  /// Also, <code>STANDARD</code> messages can contain 4KB of data and the 1KB
  /// of metadata. <code>CONTROL</code> messages can contain 30 bytes of data
  /// and no metadata.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_SendChannelMessage.html">SendChannelMessage</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [content] :
  /// The content of the message.
  ///
  /// Parameter [persistence] :
  /// Boolean that controls whether the message is persisted on the back end.
  /// Required.
  ///
  /// Parameter [type] :
  /// The type of message, <code>STANDARD</code> or <code>CONTROL</code>.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [clientRequestToken] :
  /// The <code>Idempotency</code> token for each client request.
  ///
  /// Parameter [metadata] :
  /// The optional metadata for each message.
  @Deprecated(
      'Replaced by SendChannelMessage in the Amazon Chime SDK Messaging Namespace')
  Future<SendChannelMessageResponse> sendChannelMessage({
    required String channelArn,
    required String content,
    required ChannelMessagePersistenceType persistence,
    required ChannelMessageType type,
    String? chimeBearer,
    String? clientRequestToken,
    String? metadata,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'Content': content,
      'Persistence': persistence.toValue(),
      'Type': type.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
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

  /// Starts transcription for the specified <code>meetingId</code>. For more
  /// information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/meeting-transcription.html">
  /// Using Amazon Chime SDK live transcription </a> in the <i>Amazon Chime SDK
  /// Developer Guide</i>.
  ///
  /// If you specify an invalid configuration, a <code>TranscriptFailed</code>
  /// event will be sent with the contents of the
  /// <code>BadRequestException</code> generated by Amazon Transcribe. For more
  /// information on each parameter and which combinations are valid, refer to
  /// the <a
  /// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/API_streaming_StartStreamTranscription.html">StartStreamTranscription</a>
  /// API in the <i>Amazon Transcribe Developer Guide</i>.
  /// <note>
  /// Amazon Chime SDK live transcription is powered by Amazon Transcribe. Use
  /// of Amazon Transcribe is subject to the <a
  /// href="https://aws.amazon.com/service-terms/">AWS Service Terms</a>,
  /// including the terms specific to the AWS Machine Learning and Artificial
  /// Intelligence Services.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_StartMeetingTranscription.html">StartMeetingTranscription</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The unique ID of the meeting being transcribed.
  ///
  /// Parameter [transcriptionConfiguration] :
  /// The configuration for the current transcription operation. Must contain
  /// <code>EngineTranscribeSettings</code> or
  /// <code>EngineTranscribeMedicalSettings</code>.
  @Deprecated(
      'Replaced by StartMeetingTranscription in the Amazon Chime SDK Meetings Namespace')
  Future<void> startMeetingTranscription({
    required String meetingId,
    required TranscriptionConfiguration transcriptionConfiguration,
  }) async {
    final $payload = <String, dynamic>{
      'TranscriptionConfiguration': transcriptionConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/transcription?operation=start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops transcription for the specified <code>meetingId</code>.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_StopMeetingTranscription.html">StopMeetingTranscription</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [UnprocessableEntityException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The unique ID of the meeting for which you stop transcription.
  @Deprecated(
      'Replaced by StopMeetingTranscription in the Amazon Chime SDK Meetings Namespace')
  Future<void> stopMeetingTranscription({
    required String meetingId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/transcription?operation=stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies the specified tags to the specified Amazon Chime attendee.
  /// <important>
  /// TagAttendee is not supported in the Amazon Chime SDK Meetings Namespace.
  /// Update your application to remove calls to this API.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  @Deprecated(
      'Attendee Tags are not supported in the Amazon Chime SDK Meetings Namespace. Update your application to remove calls to this API.')
  Future<void> tagAttendee({
    required String attendeeId,
    required String meetingId,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}/tags?operation=add',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies the specified tags to the specified Amazon Chime SDK meeting.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_TagResource.html">TagResource</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  @Deprecated('Use TagResource in the Amazon Chime SDK Meetings Namespace.')
  Future<void> tagMeeting({
    required String meetingId,
    required List<Tag> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/tags?operation=add',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Applies the specified tags to the specified Amazon Chime SDK meeting
  /// resource.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_TagResource.html">TagResource</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  @Deprecated(
      'Replaced by TagResource in the Amazon Chime SDK Voice, Amazon Chime SDK Meetings, Amazon Chime SDK Identity, Amazon Chime SDK Messaging, and Amazon Chime SDK Media Pipelines Namespaces')
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

  /// Untags the specified tags from the specified Amazon Chime SDK attendee.
  /// <important>
  /// UntagAttendee is not supported in the Amazon Chime SDK Meetings Namespace.
  /// Update your application to remove calls to this API.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [attendeeId] :
  /// The Amazon Chime SDK attendee ID.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  @Deprecated(
      'Attendee Tags are not supported in the Amazon Chime SDK Meetings Namespace. Update your application to remove calls to this API.')
  Future<void> untagAttendee({
    required String attendeeId,
    required String meetingId,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/attendees/${Uri.encodeComponent(attendeeId)}/tags?operation=delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untags the specified tags from the specified Amazon Chime SDK meeting.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_UntagResource.html">UntagResource</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  @Deprecated('Use UntagResource in the Amazon Chime SDK Meetings Namespace.')
  Future<void> untagMeeting({
    required String meetingId,
    required List<String> tagKeys,
  }) async {
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId)}/tags?operation=delete',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Untags the specified tags from the specified Amazon Chime SDK meeting
  /// resource.
  ///
  /// Applies the specified tags to the specified Amazon Chime SDK meeting
  /// resource.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_UntagResource.html">UntagResource</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [resourceARN] :
  /// The resource ARN.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys.
  @Deprecated(
      'Replaced by UntagResource in the Amazon Chime SDK Voice, Amazon Chime SDK Meetings, Amazon Chime SDK Identity, Amazon Chime SDK Messaging, and Amazon Chime SDK Media Pipelines Namespaces')
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

  /// Updates account details for the specified Amazon Chime account. Currently,
  /// only account name and default license updates are supported for this
  /// action.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [defaultLicense] :
  /// The default license applied when you add users to an Amazon Chime account.
  ///
  /// Parameter [name] :
  /// The new name for the specified Amazon Chime account.
  Future<UpdateAccountResponse> updateAccount({
    required String accountId,
    License? defaultLicense,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (defaultLicense != null) 'DefaultLicense': defaultLicense.toValue(),
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountResponse.fromJson(response);
  }

  /// Updates the settings for the specified Amazon Chime account. You can
  /// update settings for remote control of shared screens, or for the dial-out
  /// option. For more information about these settings, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the
  /// Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [accountSettings] :
  /// The Amazon Chime account settings to update.
  Future<void> updateAccountSettings({
    required String accountId,
    required AccountSettings accountSettings,
  }) async {
    final $payload = <String, dynamic>{
      'AccountSettings': accountSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates <code>AppInstance</code> metadata.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_UpdateAppInstance.html">UpdateAppInstance</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [name] :
  /// The name that you want to change.
  ///
  /// Parameter [metadata] :
  /// The metadata that you want to change.
  @Deprecated(
      'Replaced by UpdateAppInstance in the Amazon Chime SDK Identity Namespace')
  Future<UpdateAppInstanceResponse> updateAppInstance({
    required String appInstanceArn,
    required String name,
    String? metadata,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (metadata != null) 'Metadata': metadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/app-instances/${Uri.encodeComponent(appInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppInstanceResponse.fromJson(response);
  }

  /// Updates the details of an <code>AppInstanceUser</code>. You can update
  /// names and metadata.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_identity-chime_UpdateAppInstanceUser.html">UpdateAppInstanceUser</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the <code>AppInstanceUser</code>.
  ///
  /// Parameter [name] :
  /// The name of the <code>AppInstanceUser</code>.
  ///
  /// Parameter [metadata] :
  /// The metadata of the <code>AppInstanceUser</code>.
  @Deprecated(
      'Replaced by UpdateAppInstanceUser in the Amazon Chime SDK Identity Namespace')
  Future<UpdateAppInstanceUserResponse> updateAppInstanceUser({
    required String appInstanceUserArn,
    required String name,
    String? metadata,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (metadata != null) 'Metadata': metadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppInstanceUserResponse.fromJson(response);
  }

  /// Updates the status of the specified bot, such as starting or stopping the
  /// bot from running in your Amazon Chime Enterprise account.
  ///
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ThrottledClientException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [botId] :
  /// The bot ID.
  ///
  /// Parameter [disabled] :
  /// When true, stops the specified bot from running in your account.
  Future<UpdateBotResponse> updateBot({
    required String accountId,
    required String botId,
    bool? disabled,
  }) async {
    final $payload = <String, dynamic>{
      if (disabled != null) 'Disabled': disabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotResponse.fromJson(response);
  }

  /// Update a channel's attributes.
  ///
  /// <b>Restriction</b>: You can't change a channel's privacy.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_UpdateChannel.html">UpdateChannel</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [mode] :
  /// The mode of the update request.
  ///
  /// Parameter [name] :
  /// The name of the channel.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [metadata] :
  /// The metadata for the update request.
  @Deprecated(
      'Replaced by UpdateChannel in the Amazon Chime SDK Messaging Namespace')
  Future<UpdateChannelResponse> updateChannel({
    required String channelArn,
    required ChannelMode mode,
    required String name,
    String? chimeBearer,
    String? metadata,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      'Mode': mode.toValue(),
      'Name': name,
      if (metadata != null) 'Metadata': metadata,
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

  /// Updates the content of a message.
  /// <note>
  /// The <code>x-amz-chime-bearer</code> request header is mandatory. Use the
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_UpdateChannelMessage.html">UpdateChannelMessage</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// Parameter [messageId] :
  /// The ID string of the message being updated.
  ///
  /// Parameter [chimeBearer] :
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  ///
  /// Parameter [content] :
  /// The content of the message being updated.
  ///
  /// Parameter [metadata] :
  /// The metadata of the message being updated.
  @Deprecated(
      'Replaced by UpdateChannelMessage in the Amazon Chime SDK Messaging Namespace')
  Future<UpdateChannelMessageResponse> updateChannelMessage({
    required String channelArn,
    required String messageId,
    String? chimeBearer,
    String? content,
    String? metadata,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
    };
    final $payload = <String, dynamic>{
      if (content != null) 'Content': content,
      if (metadata != null) 'Metadata': metadata,
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
  /// <code>AppInstanceUserArn</code> of the user that makes the API call as the
  /// value in the header.
  /// </note> <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_messaging-chime_UpdateChannelReadMarker.html">UpdateChannelReadMarker</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
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
  /// The <code>AppInstanceUserArn</code> of the user that makes the API call.
  @Deprecated(
      'Replaced by UpdateChannelReadMarker in the Amazon Chime SDK Messaging Namespace')
  Future<UpdateChannelReadMarkerResponse> updateChannelReadMarker({
    required String channelArn,
    String? chimeBearer,
  }) async {
    final headers = <String, String>{
      if (chimeBearer != null) 'x-amz-chime-bearer': chimeBearer.toString(),
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

  /// Updates global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [businessCalling] :
  /// The Amazon Chime Business Calling settings.
  ///
  /// Parameter [voiceConnector] :
  /// The Amazon Chime Voice Connector settings.
  Future<void> updateGlobalSettings({
    BusinessCallingSettings? businessCalling,
    VoiceConnectorSettings? voiceConnector,
  }) async {
    final $payload = <String, dynamic>{
      if (businessCalling != null) 'BusinessCalling': businessCalling,
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates phone number details, such as product type or calling name, for
  /// the specified phone number ID. You can update one phone number detail at a
  /// time. For example, you can update either the product type or the calling
  /// name in one action.
  ///
  /// For toll-free numbers, you cannot use the Amazon Chime Business Calling
  /// product type. For numbers outside the U.S., you must use the Amazon Chime
  /// SIP Media Application Dial-In product type.
  ///
  /// Updates to outbound calling names can take 72 hours to complete. Pending
  /// updates to outbound calling names must be complete before you can request
  /// another update.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ConflictException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [phoneNumberId] :
  /// The phone number ID.
  ///
  /// Parameter [callingName] :
  /// The outbound calling name associated with the phone number.
  ///
  /// Parameter [productType] :
  /// The product type.
  Future<UpdatePhoneNumberResponse> updatePhoneNumber({
    required String phoneNumberId,
    String? callingName,
    PhoneNumberProductType? productType,
  }) async {
    final $payload = <String, dynamic>{
      if (callingName != null) 'CallingName': callingName,
      if (productType != null) 'ProductType': productType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdatePhoneNumberResponse.fromJson(response);
  }

  /// Updates the phone number settings for the administrator's AWS account,
  /// such as the default outbound calling name. You can update the default
  /// outbound calling name once every seven days. Outbound calling names can
  /// take up to 72 hours to update.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [callingName] :
  /// The default outbound calling name for the account.
  Future<void> updatePhoneNumberSettings({
    required String callingName,
  }) async {
    final $payload = <String, dynamic>{
      'CallingName': callingName,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/settings/phone-number',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified proxy session details, such as voice or SMS
  /// capabilities.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_UpdateProxySession.html">UpdateProxySession</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [capabilities] :
  /// The proxy session capabilities.
  ///
  /// Parameter [proxySessionId] :
  /// The proxy session ID.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime voice connector ID.
  ///
  /// Parameter [expiryMinutes] :
  /// The number of minutes allowed for the proxy session.
  @Deprecated(
      'Replaced by UpdateProxySession in the Amazon Chime SDK Voice Namespace')
  Future<UpdateProxySessionResponse> updateProxySession({
    required List<Capability> capabilities,
    required String proxySessionId,
    required String voiceConnectorId,
    int? expiryMinutes,
  }) async {
    _s.validateNumRange(
      'expiryMinutes',
      expiryMinutes,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/proxy-sessions/${Uri.encodeComponent(proxySessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProxySessionResponse.fromJson(response);
  }

  /// Updates room details, such as the room name, for a room in an Amazon Chime
  /// Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [roomId] :
  /// The room ID.
  ///
  /// Parameter [name] :
  /// The room name.
  Future<UpdateRoomResponse> updateRoom({
    required String accountId,
    required String roomId,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoomResponse.fromJson(response);
  }

  /// Updates room membership details, such as the member role, for a room in an
  /// Amazon Chime Enterprise account. The member role designates whether the
  /// member is a chat room administrator or a general chat room member. The
  /// member role can be updated only for user IDs.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [memberId] :
  /// The member ID.
  ///
  /// Parameter [roomId] :
  /// The room ID.
  ///
  /// Parameter [role] :
  /// The role of the member.
  Future<UpdateRoomMembershipResponse> updateRoomMembership({
    required String accountId,
    required String memberId,
    required String roomId,
    RoomMembershipRole? role,
  }) async {
    final $payload = <String, dynamic>{
      if (role != null) 'Role': role.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/memberships/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoomMembershipResponse.fromJson(response);
  }

  /// Updates the details of the specified SIP media application.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_UpdateSipMediaApplication.html">UpdateSipMediaApplication</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The SIP media application ID.
  ///
  /// Parameter [endpoints] :
  /// The new set of endpoints for the specified SIP media application.
  ///
  /// Parameter [name] :
  /// The new name for the specified SIP media application.
  @Deprecated(
      'Replaced by UpdateSipMediaApplication in the Amazon Chime SDK Voice Namespace')
  Future<UpdateSipMediaApplicationResponse> updateSipMediaApplication({
    required String sipMediaApplicationId,
    List<SipMediaApplicationEndpoint>? endpoints,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (endpoints != null) 'Endpoints': endpoints,
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSipMediaApplicationResponse.fromJson(response);
  }

  /// Invokes the AWS Lambda function associated with the SIP media application
  /// and transaction ID in an update request. The Lambda function can then
  /// return a new set of actions.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_UpdateSipMediaApplicationCall.html">UpdateSipMediaApplicationCall</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [BadRequestException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [arguments] :
  /// Arguments made available to the Lambda function as part of the
  /// <code>CALL_UPDATE_REQUESTED</code> event. Can contain 0-20 key-value
  /// pairs.
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The ID of the SIP media application handling the call.
  ///
  /// Parameter [transactionId] :
  /// The ID of the call transaction.
  @Deprecated(
      'Replaced by UpdateSipMediaApplicationCall in the Amazon Chime SDK Voice Namespace')
  Future<UpdateSipMediaApplicationCallResponse> updateSipMediaApplicationCall({
    required Map<String, String> arguments,
    required String sipMediaApplicationId,
    required String transactionId,
  }) async {
    final $payload = <String, dynamic>{
      'Arguments': arguments,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}/calls/${Uri.encodeComponent(transactionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSipMediaApplicationCallResponse.fromJson(response);
  }

  /// Updates the details of the specified SIP rule.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_UpdateSipRule.html">UpdateSipRule</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The new name for the specified SIP rule.
  ///
  /// Parameter [sipRuleId] :
  /// The SIP rule ID.
  ///
  /// Parameter [disabled] :
  /// The new value specified to indicate whether the rule is disabled.
  ///
  /// Parameter [targetApplications] :
  /// The new value of the list of target applications.
  @Deprecated(
      'Replaced by UpdateSipRule in the Amazon Chime SDK Voice Namespace')
  Future<UpdateSipRuleResponse> updateSipRule({
    required String name,
    required String sipRuleId,
    bool? disabled,
    List<SipRuleTargetApplication>? targetApplications,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      if (disabled != null) 'Disabled': disabled,
      if (targetApplications != null) 'TargetApplications': targetApplications,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSipRuleResponse.fromJson(response);
  }

  /// Updates user details for a specified user ID. Currently, only
  /// <code>LicenseType</code> updates are supported for this action.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  ///
  /// Parameter [alexaForBusinessMetadata] :
  /// The Alexa for Business metadata.
  ///
  /// Parameter [licenseType] :
  /// The user license type to update. This must be a supported license type for
  /// the Amazon Chime account that the user belongs to.
  ///
  /// Parameter [userType] :
  /// The user type.
  Future<UpdateUserResponse> updateUser({
    required String accountId,
    required String userId,
    AlexaForBusinessMetadata? alexaForBusinessMetadata,
    License? licenseType,
    UserType? userType,
  }) async {
    final $payload = <String, dynamic>{
      if (alexaForBusinessMetadata != null)
        'AlexaForBusinessMetadata': alexaForBusinessMetadata,
      if (licenseType != null) 'LicenseType': licenseType.toValue(),
      if (userType != null) 'UserType': userType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }

  /// Updates the settings for the specified user, such as phone number
  /// settings.
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [accountId] :
  /// The Amazon Chime account ID.
  ///
  /// Parameter [userId] :
  /// The user ID.
  ///
  /// Parameter [userSettings] :
  /// The user settings to update.
  Future<void> updateUserSettings({
    required String accountId,
    required String userId,
    required UserSettings userSettings,
  }) async {
    final $payload = <String, dynamic>{
      'UserSettings': userSettings,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates details for the specified Amazon Chime Voice Connector.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_UpdateVoiceConnector.html">UpdateVoiceConnector</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon Chime Voice Connector.
  ///
  /// Parameter [requireEncryption] :
  /// When enabled, requires encryption for the Amazon Chime Voice Connector.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  @Deprecated(
      'Replaced by UpdateVoiceConnector in the Amazon Chime SDK Voice Namespace')
  Future<UpdateVoiceConnectorResponse> updateVoiceConnector({
    required String name,
    required bool requireEncryption,
    required String voiceConnectorId,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'RequireEncryption': requireEncryption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceConnectorResponse.fromJson(response);
  }

  /// Updates details of the specified Amazon Chime Voice Connector group, such
  /// as the name and Amazon Chime Voice Connector priority ranking.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_UpdateVoiceConnectorGroup.html">UpdateVoiceConnectorGroup</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [name] :
  /// The name of the Amazon Chime Voice Connector group.
  ///
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  ///
  /// Parameter [voiceConnectorItems] :
  /// The <code>VoiceConnectorItems</code> to associate with the group.
  @Deprecated(
      'Replaced by UpdateVoiceConnectorGroup in the Amazon Chime SDK Voice Namespace')
  Future<UpdateVoiceConnectorGroupResponse> updateVoiceConnectorGroup({
    required String name,
    required String voiceConnectorGroupId,
    required List<VoiceConnectorItem> voiceConnectorItems,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'VoiceConnectorItems': voiceConnectorItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Validates an address to be used for 911 calls made with Amazon Chime Voice
  /// Connectors. You can use validated addresses in a Presence Information Data
  /// Format Location Object file that you include in SIP requests. That helps
  /// ensure that addresses are routed to the appropriate Public Safety
  /// Answering Point.
  /// <important>
  /// <b>This API is is no longer supported and will not be updated.</b> We
  /// recommend using the latest version, <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_voice-chime_ValidateE911Address.html">ValidateE911Address</a>,
  /// in the Amazon Chime SDK.
  ///
  /// Using the latest version requires migrating to a dedicated namespace. For
  /// more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/migrate-from-chm-namespace.html">Migrating
  /// from the Amazon Chime namespace</a> in the <i>Amazon Chime SDK Developer
  /// Guide</i>.
  /// </important>
  ///
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ForbiddenException].
  /// May throw [BadRequestException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [awsAccountId] :
  /// The AWS account ID.
  ///
  /// Parameter [city] :
  /// The address city, such as <code>Portland</code>.
  ///
  /// Parameter [country] :
  /// The address country, such as <code>US</code>.
  ///
  /// Parameter [postalCode] :
  /// The address postal code, such as <code>04352</code>.
  ///
  /// Parameter [state] :
  /// The address state, such as <code>ME</code>.
  ///
  /// Parameter [streetInfo] :
  /// The address street information, such as <code>8th Avenue</code>.
  ///
  /// Parameter [streetNumber] :
  /// The address street number, such as <code>200</code> or <code>2121</code>.
  @Deprecated(
      'Replaced by ValidateE911Address in the Amazon Chime SDK Voice Namespace')
  Future<ValidateE911AddressResponse> validateE911Address({
    required String awsAccountId,
    required String city,
    required String country,
    required String postalCode,
    required String state,
    required String streetInfo,
    required String streetNumber,
  }) async {
    final $payload = <String, dynamic>{
      'AwsAccountId': awsAccountId,
      'City': city,
      'Country': country,
      'PostalCode': postalCode,
      'State': state,
      'StreetInfo': streetInfo,
      'StreetNumber': streetNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/emergency-calling/address',
      exceptionFnMap: _exceptionFns,
    );
    return ValidateE911AddressResponse.fromJson(response);
  }
}

/// The Amazon Chime account details. An AWS account can have multiple Amazon
/// Chime accounts.
class Account {
  /// The Amazon Chime account ID.
  final String accountId;

  /// The AWS account ID.
  final String awsAccountId;

  /// The Amazon Chime account name.
  final String name;

  /// The status of the account.
  final AccountStatus? accountStatus;

  /// The Amazon Chime account type. For more information about different account
  /// types, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing
  /// Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  final AccountType? accountType;

  /// The Amazon Chime account creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The default license for the Amazon Chime account.
  final License? defaultLicense;

  /// The sign-in delegate groups associated with the account.
  final List<SigninDelegateGroup>? signinDelegateGroups;

  /// Supported licenses for the Amazon Chime account.
  final List<License>? supportedLicenses;

  Account({
    required this.accountId,
    required this.awsAccountId,
    required this.name,
    this.accountStatus,
    this.accountType,
    this.createdTimestamp,
    this.defaultLicense,
    this.signinDelegateGroups,
    this.supportedLicenses,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountId: json['AccountId'] as String,
      awsAccountId: json['AwsAccountId'] as String,
      name: json['Name'] as String,
      accountStatus: (json['AccountStatus'] as String?)?.toAccountStatus(),
      accountType: (json['AccountType'] as String?)?.toAccountType(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      defaultLicense: (json['DefaultLicense'] as String?)?.toLicense(),
      signinDelegateGroups: (json['SigninDelegateGroups'] as List?)
          ?.whereNotNull()
          .map((e) => SigninDelegateGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedLicenses: (json['SupportedLicenses'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLicense())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final awsAccountId = this.awsAccountId;
    final name = this.name;
    final accountStatus = this.accountStatus;
    final accountType = this.accountType;
    final createdTimestamp = this.createdTimestamp;
    final defaultLicense = this.defaultLicense;
    final signinDelegateGroups = this.signinDelegateGroups;
    final supportedLicenses = this.supportedLicenses;
    return {
      'AccountId': accountId,
      'AwsAccountId': awsAccountId,
      'Name': name,
      if (accountStatus != null) 'AccountStatus': accountStatus.toValue(),
      if (accountType != null) 'AccountType': accountType.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (defaultLicense != null) 'DefaultLicense': defaultLicense.toValue(),
      if (signinDelegateGroups != null)
        'SigninDelegateGroups': signinDelegateGroups,
      if (supportedLicenses != null)
        'SupportedLicenses': supportedLicenses.map((e) => e.toValue()).toList(),
    };
  }
}

/// Settings related to the Amazon Chime account. This includes settings that
/// start or stop remote control of shared screens, or start or stop the
/// dial-out option in the Amazon Chime web application. For more information
/// about these settings, see <a
/// href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the
/// Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.
class AccountSettings {
  /// Setting that stops or starts remote control of shared screens during
  /// meetings.
  final bool? disableRemoteControl;

  /// Setting that allows meeting participants to choose the <b>Call me at a phone
  /// number</b> option. For more information, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ug/chime-join-meeting.html">Join
  /// a Meeting without the Amazon Chime App</a>.
  final bool? enableDialOut;

  AccountSettings({
    this.disableRemoteControl,
    this.enableDialOut,
  });

  factory AccountSettings.fromJson(Map<String, dynamic> json) {
    return AccountSettings(
      disableRemoteControl: json['DisableRemoteControl'] as bool?,
      enableDialOut: json['EnableDialOut'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final disableRemoteControl = this.disableRemoteControl;
    final enableDialOut = this.enableDialOut;
    return {
      if (disableRemoteControl != null)
        'DisableRemoteControl': disableRemoteControl,
      if (enableDialOut != null) 'EnableDialOut': enableDialOut,
    };
  }
}

enum AccountStatus {
  suspended,
  active,
}

extension AccountStatusValueExtension on AccountStatus {
  String toValue() {
    switch (this) {
      case AccountStatus.suspended:
        return 'Suspended';
      case AccountStatus.active:
        return 'Active';
    }
  }
}

extension AccountStatusFromString on String {
  AccountStatus toAccountStatus() {
    switch (this) {
      case 'Suspended':
        return AccountStatus.suspended;
      case 'Active':
        return AccountStatus.active;
    }
    throw Exception('$this is not known in enum AccountStatus');
  }
}

enum AccountType {
  team,
  enterpriseDirectory,
  enterpriseLWA,
  enterpriseOIDC,
}

extension AccountTypeValueExtension on AccountType {
  String toValue() {
    switch (this) {
      case AccountType.team:
        return 'Team';
      case AccountType.enterpriseDirectory:
        return 'EnterpriseDirectory';
      case AccountType.enterpriseLWA:
        return 'EnterpriseLWA';
      case AccountType.enterpriseOIDC:
        return 'EnterpriseOIDC';
    }
  }
}

extension AccountTypeFromString on String {
  AccountType toAccountType() {
    switch (this) {
      case 'Team':
        return AccountType.team;
      case 'EnterpriseDirectory':
        return AccountType.enterpriseDirectory;
      case 'EnterpriseLWA':
        return AccountType.enterpriseLWA;
      case 'EnterpriseOIDC':
        return AccountType.enterpriseOIDC;
    }
    throw Exception('$this is not known in enum AccountType');
  }
}

/// A validated address.
class Address {
  /// The city of an address.
  final String? city;

  /// The country of an address.
  final String? country;

  /// An address suffix location, such as the <code>S. Unit A</code> in
  /// <code>Central Park S. Unit A</code>.
  final String? postDirectional;

  /// The postal code of an address.
  final String? postalCode;

  /// The Zip + 4 or postal code + 4 of an address.
  final String? postalCodePlus4;

  /// An address prefix location, such as the <code>N</code> in <code>N. Third
  /// St.</code>.
  final String? preDirectional;

  /// The state of an address.
  final String? state;

  /// The address street, such as <code>8th Avenue</code>.
  final String? streetName;

  /// The numeric portion of an address.
  final String? streetNumber;

  /// The address suffix, such as the <code>N</code> in <code>8th Avenue N</code>.
  final String? streetSuffix;

  Address({
    this.city,
    this.country,
    this.postDirectional,
    this.postalCode,
    this.postalCodePlus4,
    this.preDirectional,
    this.state,
    this.streetName,
    this.streetNumber,
    this.streetSuffix,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      city: json['city'] as String?,
      country: json['country'] as String?,
      postDirectional: json['postDirectional'] as String?,
      postalCode: json['postalCode'] as String?,
      postalCodePlus4: json['postalCodePlus4'] as String?,
      preDirectional: json['preDirectional'] as String?,
      state: json['state'] as String?,
      streetName: json['streetName'] as String?,
      streetNumber: json['streetNumber'] as String?,
      streetSuffix: json['streetSuffix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final postDirectional = this.postDirectional;
    final postalCode = this.postalCode;
    final postalCodePlus4 = this.postalCodePlus4;
    final preDirectional = this.preDirectional;
    final state = this.state;
    final streetName = this.streetName;
    final streetNumber = this.streetNumber;
    final streetSuffix = this.streetSuffix;
    return {
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (postDirectional != null) 'postDirectional': postDirectional,
      if (postalCode != null) 'postalCode': postalCode,
      if (postalCodePlus4 != null) 'postalCodePlus4': postalCodePlus4,
      if (preDirectional != null) 'preDirectional': preDirectional,
      if (state != null) 'state': state,
      if (streetName != null) 'streetName': streetName,
      if (streetNumber != null) 'streetNumber': streetNumber,
      if (streetSuffix != null) 'streetSuffix': streetSuffix,
    };
  }
}

/// The Alexa for Business metadata associated with an Amazon Chime user, used
/// to integrate Alexa for Business with a device.
class AlexaForBusinessMetadata {
  /// The ARN of the room resource.
  final String? alexaForBusinessRoomArn;

  /// Starts or stops Alexa for Business.
  final bool? isAlexaForBusinessEnabled;

  AlexaForBusinessMetadata({
    this.alexaForBusinessRoomArn,
    this.isAlexaForBusinessEnabled,
  });

  factory AlexaForBusinessMetadata.fromJson(Map<String, dynamic> json) {
    return AlexaForBusinessMetadata(
      alexaForBusinessRoomArn: json['AlexaForBusinessRoomArn'] as String?,
      isAlexaForBusinessEnabled: json['IsAlexaForBusinessEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final alexaForBusinessRoomArn = this.alexaForBusinessRoomArn;
    final isAlexaForBusinessEnabled = this.isAlexaForBusinessEnabled;
    return {
      if (alexaForBusinessRoomArn != null)
        'AlexaForBusinessRoomArn': alexaForBusinessRoomArn,
      if (isAlexaForBusinessEnabled != null)
        'IsAlexaForBusinessEnabled': isAlexaForBusinessEnabled,
    };
  }
}

/// The details of an <code>AppInstance</code>, an instance of an Amazon Chime
/// SDK messaging application.
class AppInstance {
  /// The ARN of the messaging instance.
  final String? appInstanceArn;

  /// The time at which an <code>AppInstance</code> was created. In epoch
  /// milliseconds.
  final DateTime? createdTimestamp;

  /// The time an <code>AppInstance</code> was last updated. In epoch
  /// milliseconds.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata of an <code>AppInstance</code>.
  final String? metadata;

  /// The name of an <code>AppInstance</code>.
  final String? name;

  AppInstance({
    this.appInstanceArn,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.name,
  });

  factory AppInstance.fromJson(Map<String, dynamic> json) {
    return AppInstance(
      appInstanceArn: json['AppInstanceArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceArn = this.appInstanceArn;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
  }
}

/// The details of an <code>AppInstanceAdmin</code>.
class AppInstanceAdmin {
  /// The <code>AppInstanceAdmin</code> data.
  final Identity? admin;

  /// The ARN of the <code>AppInstance</code> for which the user is an
  /// administrator.
  final String? appInstanceArn;

  /// The time at which an administrator was created.
  final DateTime? createdTimestamp;

  AppInstanceAdmin({
    this.admin,
    this.appInstanceArn,
    this.createdTimestamp,
  });

  factory AppInstanceAdmin.fromJson(Map<String, dynamic> json) {
    return AppInstanceAdmin(
      admin: json['Admin'] != null
          ? Identity.fromJson(json['Admin'] as Map<String, dynamic>)
          : null,
      appInstanceArn: json['AppInstanceArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final admin = this.admin;
    final appInstanceArn = this.appInstanceArn;
    final createdTimestamp = this.createdTimestamp;
    return {
      if (admin != null) 'Admin': admin,
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
    };
  }
}

/// Summary of the details of an <code>AppInstanceAdmin</code>.
class AppInstanceAdminSummary {
  /// The details of the <code>AppInstanceAdmin</code>.
  final Identity? admin;

  AppInstanceAdminSummary({
    this.admin,
  });

  factory AppInstanceAdminSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceAdminSummary(
      admin: json['Admin'] != null
          ? Identity.fromJson(json['Admin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final admin = this.admin;
    return {
      if (admin != null) 'Admin': admin,
    };
  }
}

enum AppInstanceDataType {
  channel,
  channelMessage,
}

extension AppInstanceDataTypeValueExtension on AppInstanceDataType {
  String toValue() {
    switch (this) {
      case AppInstanceDataType.channel:
        return 'Channel';
      case AppInstanceDataType.channelMessage:
        return 'ChannelMessage';
    }
  }
}

extension AppInstanceDataTypeFromString on String {
  AppInstanceDataType toAppInstanceDataType() {
    switch (this) {
      case 'Channel':
        return AppInstanceDataType.channel;
      case 'ChannelMessage':
        return AppInstanceDataType.channelMessage;
    }
    throw Exception('$this is not known in enum AppInstanceDataType');
  }
}

/// The details of the data-retention settings for an <code>AppInstance</code>.
class AppInstanceRetentionSettings {
  /// The length of time in days to retain the messages in a channel.
  final ChannelRetentionSettings? channelRetentionSettings;

  AppInstanceRetentionSettings({
    this.channelRetentionSettings,
  });

  factory AppInstanceRetentionSettings.fromJson(Map<String, dynamic> json) {
    return AppInstanceRetentionSettings(
      channelRetentionSettings: json['ChannelRetentionSettings'] != null
          ? ChannelRetentionSettings.fromJson(
              json['ChannelRetentionSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final channelRetentionSettings = this.channelRetentionSettings;
    return {
      if (channelRetentionSettings != null)
        'ChannelRetentionSettings': channelRetentionSettings,
    };
  }
}

/// The details of the streaming configuration of an <code>AppInstance</code>.
class AppInstanceStreamingConfiguration {
  /// The type of data to be streamed.
  final AppInstanceDataType appInstanceDataType;

  /// The resource ARN.
  final String resourceArn;

  AppInstanceStreamingConfiguration({
    required this.appInstanceDataType,
    required this.resourceArn,
  });

  factory AppInstanceStreamingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return AppInstanceStreamingConfiguration(
      appInstanceDataType:
          (json['AppInstanceDataType'] as String).toAppInstanceDataType(),
      resourceArn: json['ResourceArn'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceDataType = this.appInstanceDataType;
    final resourceArn = this.resourceArn;
    return {
      'AppInstanceDataType': appInstanceDataType.toValue(),
      'ResourceArn': resourceArn,
    };
  }
}

/// Summary of the data for an <code>AppInstance</code>.
class AppInstanceSummary {
  /// The <code>AppInstance</code> ARN.
  final String? appInstanceArn;

  /// The metadata of the <code>AppInstance</code>.
  final String? metadata;

  /// The name of the <code>AppInstance</code>.
  final String? name;

  AppInstanceSummary({
    this.appInstanceArn,
    this.metadata,
    this.name,
  });

  factory AppInstanceSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceSummary(
      appInstanceArn: json['AppInstanceArn'] as String?,
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceArn = this.appInstanceArn;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
  }
}

/// The details of an <code>AppInstanceUser</code>.
class AppInstanceUser {
  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// The time at which the <code>AppInstanceUser</code> was created.
  final DateTime? createdTimestamp;

  /// The time at which the <code>AppInstanceUser</code> was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata of the <code>AppInstanceUser</code>.
  final String? metadata;

  /// The name of the <code>AppInstanceUser</code>.
  final String? name;

  AppInstanceUser({
    this.appInstanceUserArn,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.name,
  });

  factory AppInstanceUser.fromJson(Map<String, dynamic> json) {
    return AppInstanceUser(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
  }
}

/// Summary of the membership details of an <code>AppInstanceUser</code>.
class AppInstanceUserMembershipSummary {
  /// The time at which a message was last read.
  final DateTime? readMarkerTimestamp;

  /// The type of <code>ChannelMembership</code>.
  final ChannelMembershipType? type;

  AppInstanceUserMembershipSummary({
    this.readMarkerTimestamp,
    this.type,
  });

  factory AppInstanceUserMembershipSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceUserMembershipSummary(
      readMarkerTimestamp: timeStampFromJson(json['ReadMarkerTimestamp']),
      type: (json['Type'] as String?)?.toChannelMembershipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final readMarkerTimestamp = this.readMarkerTimestamp;
    final type = this.type;
    return {
      if (readMarkerTimestamp != null)
        'ReadMarkerTimestamp': unixTimestampToJson(readMarkerTimestamp),
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Summary of the details of an <code>AppInstanceUser</code>.
class AppInstanceUserSummary {
  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// The metadata of the <code>AppInstanceUser</code>.
  final String? metadata;

  /// The name of an <code>AppInstanceUser</code>.
  final String? name;

  AppInstanceUserSummary({
    this.appInstanceUserArn,
    this.metadata,
    this.name,
  });

  factory AppInstanceUserSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceUserSummary(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
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

class AssociatePhoneNumberWithUserResponse {
  AssociatePhoneNumberWithUserResponse();

  factory AssociatePhoneNumberWithUserResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociatePhoneNumberWithUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociatePhoneNumbersWithVoiceConnectorGroupResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorGroupResponse({
    this.phoneNumberErrors,
  });

  factory AssociatePhoneNumbersWithVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociatePhoneNumbersWithVoiceConnectorGroupResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class AssociatePhoneNumbersWithVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorResponse({
    this.phoneNumberErrors,
  });

  factory AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociatePhoneNumbersWithVoiceConnectorResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class AssociateSigninDelegateGroupsWithAccountResponse {
  AssociateSigninDelegateGroupsWithAccountResponse();

  factory AssociateSigninDelegateGroupsWithAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateSigninDelegateGroupsWithAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// An Amazon Chime SDK meeting attendee. Includes a unique
/// <code>AttendeeId</code> and <code>JoinToken</code> . The
/// <code>JoinToken</code> allows a client to authenticate and join as the
/// specified attendee. The <code>JoinToken</code> expires when the meeting ends
/// or when <a>DeleteAttendee</a> is called. After that, the attendee is unable
/// to join the meeting.
///
/// We recommend securely transferring each <code>JoinToken</code> from your
/// server application to the client so that no other client has access to the
/// token except for the one authorized to represent the attendee.
class Attendee {
  /// The Amazon Chime SDK attendee ID.
  final String? attendeeId;

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  final String? externalUserId;

  /// The join token used by the Amazon Chime SDK attendee.
  final String? joinToken;

  Attendee({
    this.attendeeId,
    this.externalUserId,
    this.joinToken,
  });

  factory Attendee.fromJson(Map<String, dynamic> json) {
    return Attendee(
      attendeeId: json['AttendeeId'] as String?,
      externalUserId: json['ExternalUserId'] as String?,
      joinToken: json['JoinToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attendeeId = this.attendeeId;
    final externalUserId = this.externalUserId;
    final joinToken = this.joinToken;
    return {
      if (attendeeId != null) 'AttendeeId': attendeeId,
      if (externalUserId != null) 'ExternalUserId': externalUserId,
      if (joinToken != null) 'JoinToken': joinToken,
    };
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

extension AudioMuxTypeValueExtension on AudioMuxType {
  String toValue() {
    switch (this) {
      case AudioMuxType.audioOnly:
        return 'AudioOnly';
      case AudioMuxType.audioWithActiveSpeakerVideo:
        return 'AudioWithActiveSpeakerVideo';
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
    }
    throw Exception('$this is not known in enum AudioMuxType');
  }
}

/// The membership information, including member ARNs, the channel ARN, and
/// membership types.
class BatchChannelMemberships {
  /// The ARN of the channel to which you're adding users.
  final String? channelArn;

  /// The identifier of the member who invited another member.
  final Identity? invitedBy;

  /// The users successfully added to the request.
  final List<Identity>? members;

  /// The membership types set for the channel users.
  final ChannelMembershipType? type;

  BatchChannelMemberships({
    this.channelArn,
    this.invitedBy,
    this.members,
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
      type: (json['Type'] as String?)?.toChannelMembershipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final invitedBy = this.invitedBy;
    final members = this.members;
    final type = this.type;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (invitedBy != null) 'InvitedBy': invitedBy,
      if (members != null) 'Members': members,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

class BatchCreateAttendeeResponse {
  /// The attendee information, including attendees IDs and join tokens.
  final List<Attendee>? attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  final List<CreateAttendeeError>? errors;

  BatchCreateAttendeeResponse({
    this.attendees,
    this.errors,
  });

  factory BatchCreateAttendeeResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateAttendeeResponse(
      attendees: (json['Attendees'] as List?)
          ?.whereNotNull()
          .map((e) => Attendee.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => CreateAttendeeError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final attendees = this.attendees;
    final errors = this.errors;
    return {
      if (attendees != null) 'Attendees': attendees,
      if (errors != null) 'Errors': errors,
    };
  }
}

/// A list of failed member ARNs, error codes, and error messages.
class BatchCreateChannelMembershipError {
  /// The error code.
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The ARN of the member that the service couldn't add.
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

class BatchCreateRoomMembershipResponse {
  /// If the action fails for one or more of the member IDs in the request, a list
  /// of the member IDs is returned, along with error codes and error messages.
  final List<MemberError>? errors;

  BatchCreateRoomMembershipResponse({
    this.errors,
  });

  factory BatchCreateRoomMembershipResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchCreateRoomMembershipResponse(
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => MemberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    return {
      if (errors != null) 'Errors': errors,
    };
  }
}

class BatchDeletePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  BatchDeletePhoneNumberResponse({
    this.phoneNumberErrors,
  });

  factory BatchDeletePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeletePhoneNumberResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class BatchSuspendUserResponse {
  /// If the <a>BatchSuspendUser</a> action fails for one or more of the user IDs
  /// in the request, a list of the user IDs is returned, along with error codes
  /// and error messages.
  final List<UserError>? userErrors;

  BatchSuspendUserResponse({
    this.userErrors,
  });

  factory BatchSuspendUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchSuspendUserResponse(
      userErrors: (json['UserErrors'] as List?)
          ?.whereNotNull()
          .map((e) => UserError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userErrors = this.userErrors;
    return {
      if (userErrors != null) 'UserErrors': userErrors,
    };
  }
}

class BatchUnsuspendUserResponse {
  /// If the <a>BatchUnsuspendUser</a> action fails for one or more of the user
  /// IDs in the request, a list of the user IDs is returned, along with error
  /// codes and error messages.
  final List<UserError>? userErrors;

  BatchUnsuspendUserResponse({
    this.userErrors,
  });

  factory BatchUnsuspendUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchUnsuspendUserResponse(
      userErrors: (json['UserErrors'] as List?)
          ?.whereNotNull()
          .map((e) => UserError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userErrors = this.userErrors;
    return {
      if (userErrors != null) 'UserErrors': userErrors,
    };
  }
}

class BatchUpdatePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  BatchUpdatePhoneNumberResponse({
    this.phoneNumberErrors,
  });

  factory BatchUpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdatePhoneNumberResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class BatchUpdateUserResponse {
  /// If the <a>BatchUpdateUser</a> action fails for one or more of the user IDs
  /// in the request, a list of the user IDs is returned, along with error codes
  /// and error messages.
  final List<UserError>? userErrors;

  BatchUpdateUserResponse({
    this.userErrors,
  });

  factory BatchUpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchUpdateUserResponse(
      userErrors: (json['UserErrors'] as List?)
          ?.whereNotNull()
          .map((e) => UserError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final userErrors = this.userErrors;
    return {
      if (userErrors != null) 'UserErrors': userErrors,
    };
  }
}

/// A resource that allows Enterprise account administrators to configure an
/// interface to receive events from Amazon Chime.
class Bot {
  /// The bot email address.
  final String? botEmail;

  /// The bot ID.
  final String? botId;

  /// The bot type.
  final BotType? botType;

  /// The bot creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// When true, the bot is stopped from running in your account.
  final bool? disabled;

  /// The bot display name.
  final String? displayName;

  /// The security token used to authenticate Amazon Chime with the outgoing event
  /// endpoint.
  final String? securityToken;

  /// The updated bot timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  /// The unique ID for the bot user.
  final String? userId;

  Bot({
    this.botEmail,
    this.botId,
    this.botType,
    this.createdTimestamp,
    this.disabled,
    this.displayName,
    this.securityToken,
    this.updatedTimestamp,
    this.userId,
  });

  factory Bot.fromJson(Map<String, dynamic> json) {
    return Bot(
      botEmail: json['BotEmail'] as String?,
      botId: json['BotId'] as String?,
      botType: (json['BotType'] as String?)?.toBotType(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      disabled: json['Disabled'] as bool?,
      displayName: json['DisplayName'] as String?,
      securityToken: json['SecurityToken'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botEmail = this.botEmail;
    final botId = this.botId;
    final botType = this.botType;
    final createdTimestamp = this.createdTimestamp;
    final disabled = this.disabled;
    final displayName = this.displayName;
    final securityToken = this.securityToken;
    final updatedTimestamp = this.updatedTimestamp;
    final userId = this.userId;
    return {
      if (botEmail != null) 'BotEmail': botEmail,
      if (botId != null) 'BotId': botId,
      if (botType != null) 'BotType': botType.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (disabled != null) 'Disabled': disabled,
      if (displayName != null) 'DisplayName': displayName,
      if (securityToken != null) 'SecurityToken': securityToken,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (userId != null) 'UserId': userId,
    };
  }
}

enum BotType {
  chatBot,
}

extension BotTypeValueExtension on BotType {
  String toValue() {
    switch (this) {
      case BotType.chatBot:
        return 'ChatBot';
    }
  }
}

extension BotTypeFromString on String {
  BotType toBotType() {
    switch (this) {
      case 'ChatBot':
        return BotType.chatBot;
    }
    throw Exception('$this is not known in enum BotType');
  }
}

/// The Amazon Chime Business Calling settings for the administrator's AWS
/// account. Includes any Amazon S3 buckets designated for storing call detail
/// records.
class BusinessCallingSettings {
  /// The Amazon S3 bucket designated for call detail record storage.
  final String? cdrBucket;

  BusinessCallingSettings({
    this.cdrBucket,
  });

  factory BusinessCallingSettings.fromJson(Map<String, dynamic> json) {
    return BusinessCallingSettings(
      cdrBucket: json['CdrBucket'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cdrBucket = this.cdrBucket;
    return {
      if (cdrBucket != null) 'CdrBucket': cdrBucket,
    };
  }
}

enum CallingNameStatus {
  unassigned,
  updateInProgress,
  updateSucceeded,
  updateFailed,
}

extension CallingNameStatusValueExtension on CallingNameStatus {
  String toValue() {
    switch (this) {
      case CallingNameStatus.unassigned:
        return 'Unassigned';
      case CallingNameStatus.updateInProgress:
        return 'UpdateInProgress';
      case CallingNameStatus.updateSucceeded:
        return 'UpdateSucceeded';
      case CallingNameStatus.updateFailed:
        return 'UpdateFailed';
    }
  }
}

extension CallingNameStatusFromString on String {
  CallingNameStatus toCallingNameStatus() {
    switch (this) {
      case 'Unassigned':
        return CallingNameStatus.unassigned;
      case 'UpdateInProgress':
        return CallingNameStatus.updateInProgress;
      case 'UpdateSucceeded':
        return CallingNameStatus.updateSucceeded;
      case 'UpdateFailed':
        return CallingNameStatus.updateFailed;
    }
    throw Exception('$this is not known in enum CallingNameStatus');
  }
}

/// A suggested address.
class CandidateAddress {
  /// The city of a candidate address.
  final String? city;

  /// The country of a candidate address.
  final String? country;

  /// The postal code of a candidate address.
  final String? postalCode;

  /// The Zip + 4 or postal code + 4 of a candidate address.
  final String? postalCodePlus4;

  /// The state of a candidate address.
  final String? state;

  /// The street information of a candidate address
  final String? streetInfo;

  /// The numeric portion of a candidate address.
  final String? streetNumber;

  CandidateAddress({
    this.city,
    this.country,
    this.postalCode,
    this.postalCodePlus4,
    this.state,
    this.streetInfo,
    this.streetNumber,
  });

  factory CandidateAddress.fromJson(Map<String, dynamic> json) {
    return CandidateAddress(
      city: json['city'] as String?,
      country: json['country'] as String?,
      postalCode: json['postalCode'] as String?,
      postalCodePlus4: json['postalCodePlus4'] as String?,
      state: json['state'] as String?,
      streetInfo: json['streetInfo'] as String?,
      streetNumber: json['streetNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final city = this.city;
    final country = this.country;
    final postalCode = this.postalCode;
    final postalCodePlus4 = this.postalCodePlus4;
    final state = this.state;
    final streetInfo = this.streetInfo;
    final streetNumber = this.streetNumber;
    return {
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (postalCode != null) 'postalCode': postalCode,
      if (postalCodePlus4 != null) 'postalCodePlus4': postalCodePlus4,
      if (state != null) 'state': state,
      if (streetInfo != null) 'streetInfo': streetInfo,
      if (streetNumber != null) 'streetNumber': streetNumber,
    };
  }
}

enum Capability {
  voice,
  sms,
}

extension CapabilityValueExtension on Capability {
  String toValue() {
    switch (this) {
      case Capability.voice:
        return 'Voice';
      case Capability.sms:
        return 'SMS';
    }
  }
}

extension CapabilityFromString on String {
  Capability toCapability() {
    switch (this) {
      case 'Voice':
        return Capability.voice;
      case 'SMS':
        return Capability.sms;
    }
    throw Exception('$this is not known in enum Capability');
  }
}

/// The details of a channel.
class Channel {
  /// The ARN of the channel.
  final String? channelArn;

  /// The <code>AppInstanceUser</code> who created the channel.
  final Identity? createdBy;

  /// The time at which the <code>AppInstanceUser</code> created the channel.
  final DateTime? createdTimestamp;

  /// The time at which a member sent the last message in the channel.
  final DateTime? lastMessageTimestamp;

  /// The time at which a channel was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The channel's metadata.
  final String? metadata;

  /// The mode of the channel.
  final ChannelMode? mode;

  /// The name of the channel.
  final String? name;

  /// The channel's privacy setting.
  final ChannelPrivacy? privacy;

  Channel({
    this.channelArn,
    this.createdBy,
    this.createdTimestamp,
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
      createdBy: json['CreatedBy'] != null
          ? Identity.fromJson(json['CreatedBy'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
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
    final createdBy = this.createdBy;
    final createdTimestamp = this.createdTimestamp;
    final lastMessageTimestamp = this.lastMessageTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final metadata = this.metadata;
    final mode = this.mode;
    final name = this.name;
    final privacy = this.privacy;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
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

  /// The membership type set for the channel member.
  final ChannelMembershipType? type;

  ChannelMembership({
    this.channelArn,
    this.createdTimestamp,
    this.invitedBy,
    this.lastUpdatedTimestamp,
    this.member,
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
      type: (json['Type'] as String?)?.toChannelMembershipType(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final createdTimestamp = this.createdTimestamp;
    final invitedBy = this.invitedBy;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final member = this.member;
    final type = this.type;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (invitedBy != null) 'InvitedBy': invitedBy,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (member != null) 'Member': member,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Summary of the channel membership details of an
/// <code>AppInstanceUser</code>.
class ChannelMembershipForAppInstanceUserSummary {
  /// Summary of the membership details of an <code>AppInstanceUser</code>.
  final AppInstanceUserMembershipSummary? appInstanceUserMembershipSummary;

  /// Summary of the details of a <code>Channel</code>.
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

  /// The message content.
  final String? content;

  /// The time at which the message was created.
  final DateTime? createdTimestamp;

  /// The time at which a message was edited.
  final DateTime? lastEditedTimestamp;

  /// The time at which a message was updated.
  final DateTime? lastUpdatedTimestamp;

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

  /// The message type.
  final ChannelMessageType? type;

  ChannelMessage({
    this.channelArn,
    this.content,
    this.createdTimestamp,
    this.lastEditedTimestamp,
    this.lastUpdatedTimestamp,
    this.messageId,
    this.metadata,
    this.persistence,
    this.redacted,
    this.sender,
    this.type,
  });

  factory ChannelMessage.fromJson(Map<String, dynamic> json) {
    return ChannelMessage(
      channelArn: json['ChannelArn'] as String?,
      content: json['Content'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastEditedTimestamp: timeStampFromJson(json['LastEditedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      messageId: json['MessageId'] as String?,
      metadata: json['Metadata'] as String?,
      persistence:
          (json['Persistence'] as String?)?.toChannelMessagePersistenceType(),
      redacted: json['Redacted'] as bool?,
      sender: json['Sender'] != null
          ? Identity.fromJson(json['Sender'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toChannelMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final content = this.content;
    final createdTimestamp = this.createdTimestamp;
    final lastEditedTimestamp = this.lastEditedTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final messageId = this.messageId;
    final metadata = this.metadata;
    final persistence = this.persistence;
    final redacted = this.redacted;
    final sender = this.sender;
    final type = this.type;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (content != null) 'Content': content,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastEditedTimestamp != null)
        'LastEditedTimestamp': unixTimestampToJson(lastEditedTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (messageId != null) 'MessageId': messageId,
      if (metadata != null) 'Metadata': metadata,
      if (persistence != null) 'Persistence': persistence.toValue(),
      if (redacted != null) 'Redacted': redacted,
      if (sender != null) 'Sender': sender,
      if (type != null) 'Type': type.toValue(),
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

/// Summary of the messages in a <code>Channel</code>.
class ChannelMessageSummary {
  /// The content of the message.
  final String? content;

  /// The time at which the message summary was created.
  final DateTime? createdTimestamp;

  /// The time at which a message was last edited.
  final DateTime? lastEditedTimestamp;

  /// The time at which a message was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The ID of the message.
  final String? messageId;

  /// The metadata of the message.
  final String? metadata;

  /// Indicates whether a message was redacted.
  final bool? redacted;

  /// The message sender.
  final Identity? sender;

  /// The type of message.
  final ChannelMessageType? type;

  ChannelMessageSummary({
    this.content,
    this.createdTimestamp,
    this.lastEditedTimestamp,
    this.lastUpdatedTimestamp,
    this.messageId,
    this.metadata,
    this.redacted,
    this.sender,
    this.type,
  });

  factory ChannelMessageSummary.fromJson(Map<String, dynamic> json) {
    return ChannelMessageSummary(
      content: json['Content'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastEditedTimestamp: timeStampFromJson(json['LastEditedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      messageId: json['MessageId'] as String?,
      metadata: json['Metadata'] as String?,
      redacted: json['Redacted'] as bool?,
      sender: json['Sender'] != null
          ? Identity.fromJson(json['Sender'] as Map<String, dynamic>)
          : null,
      type: (json['Type'] as String?)?.toChannelMessageType(),
    );
  }

  Map<String, dynamic> toJson() {
    final content = this.content;
    final createdTimestamp = this.createdTimestamp;
    final lastEditedTimestamp = this.lastEditedTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final messageId = this.messageId;
    final metadata = this.metadata;
    final redacted = this.redacted;
    final sender = this.sender;
    final type = this.type;
    return {
      if (content != null) 'Content': content,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastEditedTimestamp != null)
        'LastEditedTimestamp': unixTimestampToJson(lastEditedTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (messageId != null) 'MessageId': messageId,
      if (metadata != null) 'Metadata': metadata,
      if (redacted != null) 'Redacted': redacted,
      if (sender != null) 'Sender': sender,
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

/// The details of the retention settings for a channel.
class ChannelRetentionSettings {
  /// The time in days to retain the messages in a channel.
  final int? retentionDays;

  ChannelRetentionSettings({
    this.retentionDays,
  });

  factory ChannelRetentionSettings.fromJson(Map<String, dynamic> json) {
    return ChannelRetentionSettings(
      retentionDays: json['RetentionDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final retentionDays = this.retentionDays;
    return {
      if (retentionDays != null) 'RetentionDays': retentionDays,
    };
  }
}

/// Summary of the details of a <code>Channel</code>.
class ChannelSummary {
  /// The ARN of the channel.
  final String? channelArn;

  /// The time at which the last message in a channel was sent.
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

/// The configuration object of the Amazon Chime SDK meeting for a specified
/// media capture pipeline. <code>SourceType</code> must be
/// <code>ChimeSdkMeeting</code>.
class ChimeSdkMeetingConfiguration {
  /// The configuration for the artifacts in an Amazon Chime SDK meeting.
  final ArtifactsConfiguration? artifactsConfiguration;

  /// The source configuration for a specified media capture pipeline.
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

/// The retention settings that determine how long to retain conversation
/// messages for an Amazon Chime Enterprise account.
class ConversationRetentionSettings {
  /// The number of days for which to retain conversation messages.
  final int? retentionDays;

  ConversationRetentionSettings({
    this.retentionDays,
  });

  factory ConversationRetentionSettings.fromJson(Map<String, dynamic> json) {
    return ConversationRetentionSettings(
      retentionDays: json['RetentionDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final retentionDays = this.retentionDays;
    return {
      if (retentionDays != null) 'RetentionDays': retentionDays,
    };
  }
}

class CreateAccountResponse {
  /// The Amazon Chime account details.
  final Account? account;

  CreateAccountResponse({
    this.account,
  });

  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    return CreateAccountResponse(
      account: json['Account'] != null
          ? Account.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      if (account != null) 'Account': account,
    };
  }
}

class CreateAppInstanceAdminResponse {
  /// The name and ARN of the admin for the <code>AppInstance</code>.
  final Identity? appInstanceAdmin;

  /// The ARN of the of the admin for the <code>AppInstance</code>.
  final String? appInstanceArn;

  CreateAppInstanceAdminResponse({
    this.appInstanceAdmin,
    this.appInstanceArn,
  });

  factory CreateAppInstanceAdminResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppInstanceAdminResponse(
      appInstanceAdmin: json['AppInstanceAdmin'] != null
          ? Identity.fromJson(json['AppInstanceAdmin'] as Map<String, dynamic>)
          : null,
      appInstanceArn: json['AppInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceAdmin = this.appInstanceAdmin;
    final appInstanceArn = this.appInstanceArn;
    return {
      if (appInstanceAdmin != null) 'AppInstanceAdmin': appInstanceAdmin,
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
    };
  }
}

class CreateAppInstanceResponse {
  /// The Amazon Resource Number (ARN) of the <code>AppInstance</code>.
  final String? appInstanceArn;

  CreateAppInstanceResponse({
    this.appInstanceArn,
  });

  factory CreateAppInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppInstanceResponse(
      appInstanceArn: json['AppInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceArn = this.appInstanceArn;
    return {
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
    };
  }
}

class CreateAppInstanceUserResponse {
  /// The user's ARN.
  final String? appInstanceUserArn;

  CreateAppInstanceUserResponse({
    this.appInstanceUserArn,
  });

  factory CreateAppInstanceUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppInstanceUserResponse(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
    };
  }
}

/// The list of errors returned when errors are encountered during the
/// BatchCreateAttendee and CreateAttendee actions. This includes external user
/// IDs, error codes, and error messages.
class CreateAttendeeError {
  /// The error code.
  final String? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  final String? externalUserId;

  CreateAttendeeError({
    this.errorCode,
    this.errorMessage,
    this.externalUserId,
  });

  factory CreateAttendeeError.fromJson(Map<String, dynamic> json) {
    return CreateAttendeeError(
      errorCode: json['ErrorCode'] as String?,
      errorMessage: json['ErrorMessage'] as String?,
      externalUserId: json['ExternalUserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final externalUserId = this.externalUserId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (externalUserId != null) 'ExternalUserId': externalUserId,
    };
  }
}

/// The Amazon Chime SDK attendee fields to create, used with the
/// BatchCreateAttendee action.
class CreateAttendeeRequestItem {
  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application.
  final String externalUserId;

  /// The tag key-value pairs.
  final List<Tag>? tags;

  CreateAttendeeRequestItem({
    required this.externalUserId,
    this.tags,
  });

  Map<String, dynamic> toJson() {
    final externalUserId = this.externalUserId;
    final tags = this.tags;
    return {
      'ExternalUserId': externalUserId,
      if (tags != null) 'Tags': tags,
    };
  }
}

class CreateAttendeeResponse {
  /// The attendee information, including attendee ID and join token.
  final Attendee? attendee;

  CreateAttendeeResponse({
    this.attendee,
  });

  factory CreateAttendeeResponse.fromJson(Map<String, dynamic> json) {
    return CreateAttendeeResponse(
      attendee: json['Attendee'] != null
          ? Attendee.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    return {
      if (attendee != null) 'Attendee': attendee,
    };
  }
}

class CreateBotResponse {
  /// The bot details.
  final Bot? bot;

  CreateBotResponse({
    this.bot,
  });

  factory CreateBotResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotResponse(
      bot: json['Bot'] != null
          ? Bot.fromJson(json['Bot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bot = this.bot;
    return {
      if (bot != null) 'Bot': bot,
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

class CreateChannelMembershipResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ARN and metadata of the member being added.
  final Identity? member;

  CreateChannelMembershipResponse({
    this.channelArn,
    this.member,
  });

  factory CreateChannelMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateChannelMembershipResponse(
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

class CreateMeetingDialOutResponse {
  /// Unique ID that tracks API calls.
  final String? transactionId;

  CreateMeetingDialOutResponse({
    this.transactionId,
  });

  factory CreateMeetingDialOutResponse.fromJson(Map<String, dynamic> json) {
    return CreateMeetingDialOutResponse(
      transactionId: json['TransactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transactionId = this.transactionId;
    return {
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

class CreateMeetingResponse {
  /// The meeting information, including the meeting ID and
  /// <code>MediaPlacement</code> .
  final Meeting? meeting;

  CreateMeetingResponse({
    this.meeting,
  });

  factory CreateMeetingResponse.fromJson(Map<String, dynamic> json) {
    return CreateMeetingResponse(
      meeting: json['Meeting'] != null
          ? Meeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meeting = this.meeting;
    return {
      if (meeting != null) 'Meeting': meeting,
    };
  }
}

class CreateMeetingWithAttendeesResponse {
  /// The attendee information, including attendees IDs and join tokens.
  final List<Attendee>? attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  final List<CreateAttendeeError>? errors;

  /// A meeting created using the Amazon Chime SDK.
  final Meeting? meeting;

  CreateMeetingWithAttendeesResponse({
    this.attendees,
    this.errors,
    this.meeting,
  });

  factory CreateMeetingWithAttendeesResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateMeetingWithAttendeesResponse(
      attendees: (json['Attendees'] as List?)
          ?.whereNotNull()
          .map((e) => Attendee.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['Errors'] as List?)
          ?.whereNotNull()
          .map((e) => CreateAttendeeError.fromJson(e as Map<String, dynamic>))
          .toList(),
      meeting: json['Meeting'] != null
          ? Meeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendees = this.attendees;
    final errors = this.errors;
    final meeting = this.meeting;
    return {
      if (attendees != null) 'Attendees': attendees,
      if (errors != null) 'Errors': errors,
      if (meeting != null) 'Meeting': meeting,
    };
  }
}

class CreatePhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder? phoneNumberOrder;

  CreatePhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });

  factory CreatePhoneNumberOrderResponse.fromJson(Map<String, dynamic> json) {
    return CreatePhoneNumberOrderResponse(
      phoneNumberOrder: json['PhoneNumberOrder'] != null
          ? PhoneNumberOrder.fromJson(
              json['PhoneNumberOrder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberOrder = this.phoneNumberOrder;
    return {
      if (phoneNumberOrder != null) 'PhoneNumberOrder': phoneNumberOrder,
    };
  }
}

class CreateProxySessionResponse {
  /// The proxy session details.
  final ProxySession? proxySession;

  CreateProxySessionResponse({
    this.proxySession,
  });

  factory CreateProxySessionResponse.fromJson(Map<String, dynamic> json) {
    return CreateProxySessionResponse(
      proxySession: json['ProxySession'] != null
          ? ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxySession = this.proxySession;
    return {
      if (proxySession != null) 'ProxySession': proxySession,
    };
  }
}

class CreateRoomMembershipResponse {
  /// The room membership details.
  final RoomMembership? roomMembership;

  CreateRoomMembershipResponse({
    this.roomMembership,
  });

  factory CreateRoomMembershipResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoomMembershipResponse(
      roomMembership: json['RoomMembership'] != null
          ? RoomMembership.fromJson(
              json['RoomMembership'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roomMembership = this.roomMembership;
    return {
      if (roomMembership != null) 'RoomMembership': roomMembership,
    };
  }
}

class CreateRoomResponse {
  /// The room details.
  final Room? room;

  CreateRoomResponse({
    this.room,
  });

  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) {
    return CreateRoomResponse(
      room: json['Room'] != null
          ? Room.fromJson(json['Room'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final room = this.room;
    return {
      if (room != null) 'Room': room,
    };
  }
}

class CreateSipMediaApplicationCallResponse {
  /// The actual call.
  final SipMediaApplicationCall? sipMediaApplicationCall;

  CreateSipMediaApplicationCallResponse({
    this.sipMediaApplicationCall,
  });

  factory CreateSipMediaApplicationCallResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSipMediaApplicationCallResponse(
      sipMediaApplicationCall: json['SipMediaApplicationCall'] != null
          ? SipMediaApplicationCall.fromJson(
              json['SipMediaApplicationCall'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationCall = this.sipMediaApplicationCall;
    return {
      if (sipMediaApplicationCall != null)
        'SipMediaApplicationCall': sipMediaApplicationCall,
    };
  }
}

class CreateSipMediaApplicationResponse {
  /// The SIP media application details.
  final SipMediaApplication? sipMediaApplication;

  CreateSipMediaApplicationResponse({
    this.sipMediaApplication,
  });

  factory CreateSipMediaApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSipMediaApplicationResponse(
      sipMediaApplication: json['SipMediaApplication'] != null
          ? SipMediaApplication.fromJson(
              json['SipMediaApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplication = this.sipMediaApplication;
    return {
      if (sipMediaApplication != null)
        'SipMediaApplication': sipMediaApplication,
    };
  }
}

class CreateSipRuleResponse {
  /// Returns the SIP rule information, including the rule ID, triggers, and
  /// target applications.
  final SipRule? sipRule;

  CreateSipRuleResponse({
    this.sipRule,
  });

  factory CreateSipRuleResponse.fromJson(Map<String, dynamic> json) {
    return CreateSipRuleResponse(
      sipRule: json['SipRule'] != null
          ? SipRule.fromJson(json['SipRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipRule = this.sipRule;
    return {
      if (sipRule != null) 'SipRule': sipRule,
    };
  }
}

class CreateUserResponse {
  /// The user on the Amazon Chime account.
  final User? user;

  CreateUserResponse({
    this.user,
  });

  factory CreateUserResponse.fromJson(Map<String, dynamic> json) {
    return CreateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

class CreateVoiceConnectorGroupResponse {
  /// The Amazon Chime Voice Connector group details.
  final VoiceConnectorGroup? voiceConnectorGroup;

  CreateVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });

  factory CreateVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateVoiceConnectorGroupResponse(
      voiceConnectorGroup: json['VoiceConnectorGroup'] != null
          ? VoiceConnectorGroup.fromJson(
              json['VoiceConnectorGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorGroup = this.voiceConnectorGroup;
    return {
      if (voiceConnectorGroup != null)
        'VoiceConnectorGroup': voiceConnectorGroup,
    };
  }
}

class CreateVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector? voiceConnector;

  CreateVoiceConnectorResponse({
    this.voiceConnector,
  });

  factory CreateVoiceConnectorResponse.fromJson(Map<String, dynamic> json) {
    return CreateVoiceConnectorResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnector.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

/// The SIP credentials used to authenticate requests to your Amazon Chime Voice
/// Connector.
class Credential {
  /// The RFC2617 compliant password associated with the SIP credentials, in
  /// US-ASCII format.
  final String? password;

  /// The RFC2617 compliant user name associated with the SIP credentials, in
  /// US-ASCII format.
  final String? username;

  Credential({
    this.password,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final password = this.password;
    final username = this.username;
    return {
      if (password != null) 'Password': password,
      if (username != null) 'Username': username,
    };
  }
}

/// The Dialed Number Identification Service (DNIS) emergency calling
/// configuration details associated with an Amazon Chime Voice Connector's
/// emergency calling configuration.
class DNISEmergencyCallingConfiguration {
  /// The country from which emergency calls are allowed, in ISO 3166-1 alpha-2
  /// format.
  final String callingCountry;

  /// The DNIS phone number to route emergency calls to, in E.164 format.
  final String emergencyPhoneNumber;

  /// The DNIS phone number to route test emergency calls to, in E.164 format.
  final String? testPhoneNumber;

  DNISEmergencyCallingConfiguration({
    required this.callingCountry,
    required this.emergencyPhoneNumber,
    this.testPhoneNumber,
  });

  factory DNISEmergencyCallingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return DNISEmergencyCallingConfiguration(
      callingCountry: json['CallingCountry'] as String,
      emergencyPhoneNumber: json['EmergencyPhoneNumber'] as String,
      testPhoneNumber: json['TestPhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final callingCountry = this.callingCountry;
    final emergencyPhoneNumber = this.emergencyPhoneNumber;
    final testPhoneNumber = this.testPhoneNumber;
    return {
      'CallingCountry': callingCountry,
      'EmergencyPhoneNumber': emergencyPhoneNumber,
      if (testPhoneNumber != null) 'TestPhoneNumber': testPhoneNumber,
    };
  }
}

class DeleteAccountResponse {
  DeleteAccountResponse();

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeAppInstanceAdminResponse {
  /// The ARN and name of the <code>AppInstanceUser</code>, the ARN of the
  /// <code>AppInstance</code>, and the created and last-updated timestamps. All
  /// timestamps use epoch milliseconds.
  final AppInstanceAdmin? appInstanceAdmin;

  DescribeAppInstanceAdminResponse({
    this.appInstanceAdmin,
  });

  factory DescribeAppInstanceAdminResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppInstanceAdminResponse(
      appInstanceAdmin: json['AppInstanceAdmin'] != null
          ? AppInstanceAdmin.fromJson(
              json['AppInstanceAdmin'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceAdmin = this.appInstanceAdmin;
    return {
      if (appInstanceAdmin != null) 'AppInstanceAdmin': appInstanceAdmin,
    };
  }
}

class DescribeAppInstanceResponse {
  /// The ARN, metadata, created and last-updated timestamps, and the name of the
  /// <code>AppInstance</code>. All timestamps use epoch milliseconds.
  final AppInstance? appInstance;

  DescribeAppInstanceResponse({
    this.appInstance,
  });

  factory DescribeAppInstanceResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppInstanceResponse(
      appInstance: json['AppInstance'] != null
          ? AppInstance.fromJson(json['AppInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstance = this.appInstance;
    return {
      if (appInstance != null) 'AppInstance': appInstance,
    };
  }
}

class DescribeAppInstanceUserResponse {
  /// The name of the <code>AppInstanceUser</code>.
  final AppInstanceUser? appInstanceUser;

  DescribeAppInstanceUserResponse({
    this.appInstanceUser,
  });

  factory DescribeAppInstanceUserResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppInstanceUserResponse(
      appInstanceUser: json['AppInstanceUser'] != null
          ? AppInstanceUser.fromJson(
              json['AppInstanceUser'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUser = this.appInstanceUser;
    return {
      if (appInstanceUser != null) 'AppInstanceUser': appInstanceUser,
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

class DisassociatePhoneNumberFromUserResponse {
  DisassociatePhoneNumberFromUserResponse();

  factory DisassociatePhoneNumberFromUserResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociatePhoneNumberFromUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociatePhoneNumbersFromVoiceConnectorGroupResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorGroupResponse({
    this.phoneNumberErrors,
  });

  factory DisassociatePhoneNumbersFromVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociatePhoneNumbersFromVoiceConnectorGroupResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class DisassociatePhoneNumbersFromVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  final List<PhoneNumberError>? phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorResponse({
    this.phoneNumberErrors,
  });

  factory DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociatePhoneNumbersFromVoiceConnectorResponse(
      phoneNumberErrors: (json['PhoneNumberErrors'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberErrors = this.phoneNumberErrors;
    return {
      if (phoneNumberErrors != null) 'PhoneNumberErrors': phoneNumberErrors,
    };
  }
}

class DisassociateSigninDelegateGroupsFromAccountResponse {
  DisassociateSigninDelegateGroupsFromAccountResponse();

  factory DisassociateSigninDelegateGroupsFromAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateSigninDelegateGroupsFromAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum EmailStatus {
  notSent,
  sent,
  failed,
}

extension EmailStatusValueExtension on EmailStatus {
  String toValue() {
    switch (this) {
      case EmailStatus.notSent:
        return 'NotSent';
      case EmailStatus.sent:
        return 'Sent';
      case EmailStatus.failed:
        return 'Failed';
    }
  }
}

extension EmailStatusFromString on String {
  EmailStatus toEmailStatus() {
    switch (this) {
      case 'NotSent':
        return EmailStatus.notSent;
      case 'Sent':
        return EmailStatus.sent;
      case 'Failed':
        return EmailStatus.failed;
    }
    throw Exception('$this is not known in enum EmailStatus');
  }
}

/// The emergency calling configuration details associated with an Amazon Chime
/// Voice Connector.
class EmergencyCallingConfiguration {
  /// The Dialed Number Identification Service (DNIS) emergency calling
  /// configuration details.
  final List<DNISEmergencyCallingConfiguration>? dnis;

  EmergencyCallingConfiguration({
    this.dnis,
  });

  factory EmergencyCallingConfiguration.fromJson(Map<String, dynamic> json) {
    return EmergencyCallingConfiguration(
      dnis: (json['DNIS'] as List?)
          ?.whereNotNull()
          .map((e) => DNISEmergencyCallingConfiguration.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dnis = this.dnis;
    return {
      if (dnis != null) 'DNIS': dnis,
    };
  }
}

/// Settings specific to the Amazon Transcribe Medical engine.
class EngineTranscribeMedicalSettings {
  /// The language code specified for the Amazon Transcribe Medical engine.
  final TranscribeMedicalLanguageCode languageCode;

  /// The specialty specified for the Amazon Transcribe Medical engine.
  final TranscribeMedicalSpecialty specialty;

  /// The type of transcription.
  final TranscribeMedicalType type;

  /// Labels all personally identifiable information (PII) identified in your
  /// transcript. If you don't include <code>PiiEntityTypes</code>, all PII is
  /// identified.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code>.
  final TranscribeMedicalContentIdentificationType? contentIdentificationType;

  /// The AWS Region passed to Amazon Transcribe Medical. If you don't specify a
  /// Region, Amazon Chime uses the meeting's Region.
  final TranscribeMedicalRegion? region;

  /// The name of the vocabulary passed to Amazon Transcribe Medical.
  final String? vocabularyName;

  EngineTranscribeMedicalSettings({
    required this.languageCode,
    required this.specialty,
    required this.type,
    this.contentIdentificationType,
    this.region,
    this.vocabularyName,
  });

  Map<String, dynamic> toJson() {
    final languageCode = this.languageCode;
    final specialty = this.specialty;
    final type = this.type;
    final contentIdentificationType = this.contentIdentificationType;
    final region = this.region;
    final vocabularyName = this.vocabularyName;
    return {
      'LanguageCode': languageCode.toValue(),
      'Specialty': specialty.toValue(),
      'Type': type.toValue(),
      if (contentIdentificationType != null)
        'ContentIdentificationType': contentIdentificationType.toValue(),
      if (region != null) 'Region': region.toValue(),
      if (vocabularyName != null) 'VocabularyName': vocabularyName,
    };
  }
}

/// Settings specific for Amazon Transcribe as the live transcription engine.
///
/// If you specify an invalid combination of parameters, a
/// <code>TranscriptFailed</code> event will be sent with the contents of the
/// <code>BadRequestException</code> generated by Amazon Transcribe. For more
/// information on each parameter and which combinations are valid, refer to the
/// <a
/// href="https://docs.aws.amazon.com/transcribe/latest/APIReference/API_streaming_StartStreamTranscription.html">StartStreamTranscription</a>
/// API in the <i>Amazon Transcribe Developer Guide</i>.
class EngineTranscribeSettings {
  /// Labels all personally identifiable information (PII) identified in your
  /// transcript. If you don't include <code>PiiEntityTypes</code>, all PII is
  /// identified.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code>.
  final TranscribeContentIdentificationType? contentIdentificationType;

  /// Content redaction is performed at the segment level. If you don't include
  /// <code>PiiEntityTypes</code>, all PII is redacted.
  ///
  /// You can’t set <code>ContentIdentificationType</code> and
  /// <code>ContentRedactionType</code>.
  final TranscribeContentRedactionType? contentRedactionType;

  /// Enables partial result stabilization for your transcription. Partial result
  /// stabilization can reduce latency in your output, but may impact accuracy.
  final bool? enablePartialResultsStabilization;

  /// Enables automatic language identification for your transcription.
  ///
  /// If you include <code>IdentifyLanguage</code>, you can optionally use
  /// <code>LanguageOptions</code> to include a list of language codes that you
  /// think may be present in your audio stream. Including language options can
  /// improve transcription accuracy.
  ///
  /// You can also use <code>PreferredLanguage</code> to include a preferred
  /// language. Doing so can help Amazon Transcribe identify the language faster.
  ///
  /// You must include either <code>LanguageCode</code> or
  /// <code>IdentifyLanguage</code>.
  ///
  /// Language identification can't be combined with custom language models or
  /// redaction.
  final bool? identifyLanguage;

  /// Specify the language code that represents the language spoken.
  ///
  /// If you're unsure of the language spoken in your audio, consider using
  /// <code>IdentifyLanguage</code> to enable automatic language identification.
  final TranscribeLanguageCode? languageCode;

  /// Specify the name of the custom language model that you want to use when
  /// processing your transcription. Note that language model names are case
  /// sensitive.
  ///
  /// The language of the specified language model must match the language code.
  /// If the languages don't match, the custom language model isn't applied. There
  /// are no errors or warnings associated with a language mismatch.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the custom language model
  /// must be available in Amazon Transcribe in each Region.
  final String? languageModelName;

  /// Specify two or more language codes that represent the languages you think
  /// may be present in your media; including more than five is not recommended.
  /// If you're unsure what languages are present, do not include this parameter.
  ///
  /// Including language options can improve the accuracy of language
  /// identification.
  ///
  /// If you include <code>LanguageOptions</code>, you must also include
  /// <code>IdentifyLanguage</code>.
  /// <important>
  /// You can only include one language dialect per language. For example, you
  /// cannot include <code>en-US</code> and <code>en-AU</code>.
  /// </important>
  final String? languageOptions;

  /// Specify the level of stability to use when you enable partial results
  /// stabilization (<code>EnablePartialResultsStabilization</code>).
  ///
  /// Low stability provides the highest accuracy. High stability transcribes
  /// faster, but with slightly lower accuracy.
  final TranscribePartialResultsStability? partialResultsStability;

  /// Specify which types of personally identifiable information (PII) you want to
  /// redact in your transcript. You can include as many types as you'd like, or
  /// you can select <code>ALL</code>.
  ///
  /// Values must be comma-separated and can include: <code>ADDRESS</code>,
  /// <code>BANK_ACCOUNT_NUMBER</code>, <code>BANK_ROUTING</code>,
  /// <code>CREDIT_DEBIT_CVV</code>, <code>CREDIT_DEBIT_EXPIRY</code>
  /// <code>CREDIT_DEBIT_NUMBER</code>, <code>EMAIL</code>,<code>NAME</code>,
  /// <code>PHONE</code>, <code>PIN</code>, <code>SSN</code>, or <code>ALL</code>.
  ///
  /// Note that if you include <code>PiiEntityTypes</code>, you must also include
  /// <code>ContentIdentificationType</code> or <code>ContentRedactionType</code>.
  ///
  /// If you include <code>ContentRedactionType</code> or
  /// <code>ContentIdentificationType</code>, but do not include
  /// <code>PiiEntityTypes</code>, all PII is redacted or identified.
  final String? piiEntityTypes;

  /// Specify a preferred language from the subset of languages codes you
  /// specified in <code>LanguageOptions</code>.
  ///
  /// You can only use this parameter if you include <code>IdentifyLanguage</code>
  /// and <code>LanguageOptions</code>.
  final TranscribeLanguageCode? preferredLanguage;

  /// The AWS Region in which to use Amazon Transcribe.
  ///
  /// If you don't specify a Region, then the <code>MediaRegion</code> parameter
  /// of the <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/APIReference/API_meeting-chime_CreateMeeting.html">CreateMeeting.html</a>
  /// API will be used. However, if Amazon Transcribe is not available in the
  /// <code>MediaRegion</code>, then a TranscriptFailed event is sent.
  ///
  /// Use <code>auto</code> to use Amazon Transcribe in a Region near the
  /// meeting’s <code>MediaRegion</code>. For more information, refer to <a
  /// href="https://docs.aws.amazon.com/chime-sdk/latest/dg/transcription-options.html#choose-region">Choosing
  /// a transcription Region</a> in the <i>Amazon Chime SDK Developer Guide</i>.
  final TranscribeRegion? region;

  /// Specify how you want your vocabulary filter applied to your transcript.
  ///
  /// To replace words with <code>***</code>, choose <code>mask</code>.
  ///
  /// To delete words, choose <code>remove</code>.
  ///
  /// To flag words without changing them, choose <code>tag</code>.
  final TranscribeVocabularyFilterMethod? vocabularyFilterMethod;

  /// Specify the name of the custom vocabulary filter that you want to use when
  /// processing your transcription. Note that vocabulary filter names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the vocabulary filter must
  /// be available in Amazon Transcribe in each Region.
  ///
  /// If you include <code>IdentifyLanguage</code> and want to use one or more
  /// vocabulary filters with your transcription, use the
  /// <code>VocabularyFilterNames</code> parameter instead.
  final String? vocabularyFilterName;

  /// Specify the names of the custom vocabulary filters that you want to use when
  /// processing your transcription. Note that vocabulary filter names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the vocabulary filter must
  /// be available in Amazon Transcribe in each Region.
  ///
  /// If you're <i>not</i> including <code>IdentifyLanguage</code> and want to use
  /// a custom vocabulary filter with your transcription, use the
  /// <code>VocabularyFilterName</code> parameter instead.
  final String? vocabularyFilterNames;

  /// Specify the name of the custom vocabulary that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe multiple Regions, the vocabulary must be
  /// available in Amazon Transcribe in each Region.
  ///
  /// If you include <code>IdentifyLanguage</code> and want to use one or more
  /// custom vocabularies with your transcription, use the
  /// <code>VocabularyNames</code> parameter instead.
  final String? vocabularyName;

  /// Specify the names of the custom vocabularies that you want to use when
  /// processing your transcription. Note that vocabulary names are case
  /// sensitive.
  ///
  /// If you use Amazon Transcribe in multiple Regions, the vocabulary must be
  /// available in Amazon Transcribe in each Region.
  ///
  /// If you don't include <code>IdentifyLanguage</code> and want to use a custom
  /// vocabulary with your transcription, use the <code>VocabularyName</code>
  /// parameter instead.
  final String? vocabularyNames;

  EngineTranscribeSettings({
    this.contentIdentificationType,
    this.contentRedactionType,
    this.enablePartialResultsStabilization,
    this.identifyLanguage,
    this.languageCode,
    this.languageModelName,
    this.languageOptions,
    this.partialResultsStability,
    this.piiEntityTypes,
    this.preferredLanguage,
    this.region,
    this.vocabularyFilterMethod,
    this.vocabularyFilterName,
    this.vocabularyFilterNames,
    this.vocabularyName,
    this.vocabularyNames,
  });

  Map<String, dynamic> toJson() {
    final contentIdentificationType = this.contentIdentificationType;
    final contentRedactionType = this.contentRedactionType;
    final enablePartialResultsStabilization =
        this.enablePartialResultsStabilization;
    final identifyLanguage = this.identifyLanguage;
    final languageCode = this.languageCode;
    final languageModelName = this.languageModelName;
    final languageOptions = this.languageOptions;
    final partialResultsStability = this.partialResultsStability;
    final piiEntityTypes = this.piiEntityTypes;
    final preferredLanguage = this.preferredLanguage;
    final region = this.region;
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
      if (identifyLanguage != null) 'IdentifyLanguage': identifyLanguage,
      if (languageCode != null) 'LanguageCode': languageCode.toValue(),
      if (languageModelName != null) 'LanguageModelName': languageModelName,
      if (languageOptions != null) 'LanguageOptions': languageOptions,
      if (partialResultsStability != null)
        'PartialResultsStability': partialResultsStability.toValue(),
      if (piiEntityTypes != null) 'PiiEntityTypes': piiEntityTypes,
      if (preferredLanguage != null)
        'PreferredLanguage': preferredLanguage.toValue(),
      if (region != null) 'Region': region.toValue(),
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

/// The configuration that allows a bot to receive outgoing events. Can be
/// either an HTTPS endpoint or a Lambda function ARN.
class EventsConfiguration {
  /// The bot ID.
  final String? botId;

  /// Lambda function ARN that allows a bot to receive outgoing events.
  final String? lambdaFunctionArn;

  /// HTTPS endpoint that allows a bot to receive outgoing events.
  final String? outboundEventsHTTPSEndpoint;

  EventsConfiguration({
    this.botId,
    this.lambdaFunctionArn,
    this.outboundEventsHTTPSEndpoint,
  });

  factory EventsConfiguration.fromJson(Map<String, dynamic> json) {
    return EventsConfiguration(
      botId: json['BotId'] as String?,
      lambdaFunctionArn: json['LambdaFunctionArn'] as String?,
      outboundEventsHTTPSEndpoint:
          json['OutboundEventsHTTPSEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final lambdaFunctionArn = this.lambdaFunctionArn;
    final outboundEventsHTTPSEndpoint = this.outboundEventsHTTPSEndpoint;
    return {
      if (botId != null) 'BotId': botId,
      if (lambdaFunctionArn != null) 'LambdaFunctionArn': lambdaFunctionArn,
      if (outboundEventsHTTPSEndpoint != null)
        'OutboundEventsHTTPSEndpoint': outboundEventsHTTPSEndpoint,
    };
  }
}

enum GeoMatchLevel {
  country,
  areaCode,
}

extension GeoMatchLevelValueExtension on GeoMatchLevel {
  String toValue() {
    switch (this) {
      case GeoMatchLevel.country:
        return 'Country';
      case GeoMatchLevel.areaCode:
        return 'AreaCode';
    }
  }
}

extension GeoMatchLevelFromString on String {
  GeoMatchLevel toGeoMatchLevel() {
    switch (this) {
      case 'Country':
        return GeoMatchLevel.country;
      case 'AreaCode':
        return GeoMatchLevel.areaCode;
    }
    throw Exception('$this is not known in enum GeoMatchLevel');
  }
}

/// The country and area code for a proxy phone number in a proxy phone session.
class GeoMatchParams {
  /// The area code.
  final String areaCode;

  /// The country.
  final String country;

  GeoMatchParams({
    required this.areaCode,
    required this.country,
  });

  factory GeoMatchParams.fromJson(Map<String, dynamic> json) {
    return GeoMatchParams(
      areaCode: json['AreaCode'] as String,
      country: json['Country'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final areaCode = this.areaCode;
    final country = this.country;
    return {
      'AreaCode': areaCode,
      'Country': country,
    };
  }
}

class GetAccountResponse {
  /// The Amazon Chime account details.
  final Account? account;

  GetAccountResponse({
    this.account,
  });

  factory GetAccountResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountResponse(
      account: json['Account'] != null
          ? Account.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      if (account != null) 'Account': account,
    };
  }
}

class GetAccountSettingsResponse {
  /// The Amazon Chime account settings.
  final AccountSettings? accountSettings;

  GetAccountSettingsResponse({
    this.accountSettings,
  });

  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetAccountSettingsResponse(
      accountSettings: json['AccountSettings'] != null
          ? AccountSettings.fromJson(
              json['AccountSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final accountSettings = this.accountSettings;
    return {
      if (accountSettings != null) 'AccountSettings': accountSettings,
    };
  }
}

class GetAppInstanceRetentionSettingsResponse {
  /// The retention settings for the <code>AppInstance</code>.
  final AppInstanceRetentionSettings? appInstanceRetentionSettings;

  /// The timestamp representing the time at which the specified items are
  /// retained, in Epoch Seconds.
  final DateTime? initiateDeletionTimestamp;

  GetAppInstanceRetentionSettingsResponse({
    this.appInstanceRetentionSettings,
    this.initiateDeletionTimestamp,
  });

  factory GetAppInstanceRetentionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAppInstanceRetentionSettingsResponse(
      appInstanceRetentionSettings: json['AppInstanceRetentionSettings'] != null
          ? AppInstanceRetentionSettings.fromJson(
              json['AppInstanceRetentionSettings'] as Map<String, dynamic>)
          : null,
      initiateDeletionTimestamp:
          timeStampFromJson(json['InitiateDeletionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceRetentionSettings = this.appInstanceRetentionSettings;
    final initiateDeletionTimestamp = this.initiateDeletionTimestamp;
    return {
      if (appInstanceRetentionSettings != null)
        'AppInstanceRetentionSettings': appInstanceRetentionSettings,
      if (initiateDeletionTimestamp != null)
        'InitiateDeletionTimestamp':
            unixTimestampToJson(initiateDeletionTimestamp),
    };
  }
}

class GetAppInstanceStreamingConfigurationsResponse {
  /// The streaming settings.
  final List<AppInstanceStreamingConfiguration>?
      appInstanceStreamingConfigurations;

  GetAppInstanceStreamingConfigurationsResponse({
    this.appInstanceStreamingConfigurations,
  });

  factory GetAppInstanceStreamingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAppInstanceStreamingConfigurationsResponse(
      appInstanceStreamingConfigurations:
          (json['AppInstanceStreamingConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => AppInstanceStreamingConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceStreamingConfigurations =
        this.appInstanceStreamingConfigurations;
    return {
      if (appInstanceStreamingConfigurations != null)
        'AppInstanceStreamingConfigurations':
            appInstanceStreamingConfigurations,
    };
  }
}

class GetAttendeeResponse {
  /// The Amazon Chime SDK attendee information.
  final Attendee? attendee;

  GetAttendeeResponse({
    this.attendee,
  });

  factory GetAttendeeResponse.fromJson(Map<String, dynamic> json) {
    return GetAttendeeResponse(
      attendee: json['Attendee'] != null
          ? Attendee.fromJson(json['Attendee'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final attendee = this.attendee;
    return {
      if (attendee != null) 'Attendee': attendee,
    };
  }
}

class GetBotResponse {
  /// The chat bot details.
  final Bot? bot;

  GetBotResponse({
    this.bot,
  });

  factory GetBotResponse.fromJson(Map<String, dynamic> json) {
    return GetBotResponse(
      bot: json['Bot'] != null
          ? Bot.fromJson(json['Bot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bot = this.bot;
    return {
      if (bot != null) 'Bot': bot,
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

class GetEventsConfigurationResponse {
  /// The events configuration details.
  final EventsConfiguration? eventsConfiguration;

  GetEventsConfigurationResponse({
    this.eventsConfiguration,
  });

  factory GetEventsConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return GetEventsConfigurationResponse(
      eventsConfiguration: json['EventsConfiguration'] != null
          ? EventsConfiguration.fromJson(
              json['EventsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventsConfiguration = this.eventsConfiguration;
    return {
      if (eventsConfiguration != null)
        'EventsConfiguration': eventsConfiguration,
    };
  }
}

class GetGlobalSettingsResponse {
  /// The Amazon Chime Business Calling settings.
  final BusinessCallingSettings? businessCalling;

  /// The Amazon Chime Voice Connector settings.
  final VoiceConnectorSettings? voiceConnector;

  GetGlobalSettingsResponse({
    this.businessCalling,
    this.voiceConnector,
  });

  factory GetGlobalSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetGlobalSettingsResponse(
      businessCalling: json['BusinessCalling'] != null
          ? BusinessCallingSettings.fromJson(
              json['BusinessCalling'] as Map<String, dynamic>)
          : null,
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnectorSettings.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final businessCalling = this.businessCalling;
    final voiceConnector = this.voiceConnector;
    return {
      if (businessCalling != null) 'BusinessCalling': businessCalling,
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
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

class GetMeetingResponse {
  /// The Amazon Chime SDK meeting information.
  final Meeting? meeting;

  GetMeetingResponse({
    this.meeting,
  });

  factory GetMeetingResponse.fromJson(Map<String, dynamic> json) {
    return GetMeetingResponse(
      meeting: json['Meeting'] != null
          ? Meeting.fromJson(json['Meeting'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final meeting = this.meeting;
    return {
      if (meeting != null) 'Meeting': meeting,
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

class GetPhoneNumberOrderResponse {
  /// The phone number order details.
  final PhoneNumberOrder? phoneNumberOrder;

  GetPhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });

  factory GetPhoneNumberOrderResponse.fromJson(Map<String, dynamic> json) {
    return GetPhoneNumberOrderResponse(
      phoneNumberOrder: json['PhoneNumberOrder'] != null
          ? PhoneNumberOrder.fromJson(
              json['PhoneNumberOrder'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberOrder = this.phoneNumberOrder;
    return {
      if (phoneNumberOrder != null) 'PhoneNumberOrder': phoneNumberOrder,
    };
  }
}

class GetPhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber? phoneNumber;

  GetPhoneNumberResponse({
    this.phoneNumber,
  });

  factory GetPhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return GetPhoneNumberResponse(
      phoneNumber: json['PhoneNumber'] != null
          ? PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class GetPhoneNumberSettingsResponse {
  /// The default outbound calling name for the account.
  final String? callingName;

  /// The updated outbound calling name timestamp, in ISO 8601 format.
  final DateTime? callingNameUpdatedTimestamp;

  GetPhoneNumberSettingsResponse({
    this.callingName,
    this.callingNameUpdatedTimestamp,
  });

  factory GetPhoneNumberSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetPhoneNumberSettingsResponse(
      callingName: json['CallingName'] as String?,
      callingNameUpdatedTimestamp:
          timeStampFromJson(json['CallingNameUpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final callingName = this.callingName;
    final callingNameUpdatedTimestamp = this.callingNameUpdatedTimestamp;
    return {
      if (callingName != null) 'CallingName': callingName,
      if (callingNameUpdatedTimestamp != null)
        'CallingNameUpdatedTimestamp':
            iso8601ToJson(callingNameUpdatedTimestamp),
    };
  }
}

class GetProxySessionResponse {
  /// The proxy session details.
  final ProxySession? proxySession;

  GetProxySessionResponse({
    this.proxySession,
  });

  factory GetProxySessionResponse.fromJson(Map<String, dynamic> json) {
    return GetProxySessionResponse(
      proxySession: json['ProxySession'] != null
          ? ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxySession = this.proxySession;
    return {
      if (proxySession != null) 'ProxySession': proxySession,
    };
  }
}

class GetRetentionSettingsResponse {
  /// The timestamp representing the time at which the specified items are
  /// permanently deleted, in ISO 8601 format.
  final DateTime? initiateDeletionTimestamp;

  /// The retention settings.
  final RetentionSettings? retentionSettings;

  GetRetentionSettingsResponse({
    this.initiateDeletionTimestamp,
    this.retentionSettings,
  });

  factory GetRetentionSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetRetentionSettingsResponse(
      initiateDeletionTimestamp:
          timeStampFromJson(json['InitiateDeletionTimestamp']),
      retentionSettings: json['RetentionSettings'] != null
          ? RetentionSettings.fromJson(
              json['RetentionSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final initiateDeletionTimestamp = this.initiateDeletionTimestamp;
    final retentionSettings = this.retentionSettings;
    return {
      if (initiateDeletionTimestamp != null)
        'InitiateDeletionTimestamp': iso8601ToJson(initiateDeletionTimestamp),
      if (retentionSettings != null) 'RetentionSettings': retentionSettings,
    };
  }
}

class GetRoomResponse {
  /// The room details.
  final Room? room;

  GetRoomResponse({
    this.room,
  });

  factory GetRoomResponse.fromJson(Map<String, dynamic> json) {
    return GetRoomResponse(
      room: json['Room'] != null
          ? Room.fromJson(json['Room'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final room = this.room;
    return {
      if (room != null) 'Room': room,
    };
  }
}

class GetSipMediaApplicationLoggingConfigurationResponse {
  /// The actual logging configuration.
  final SipMediaApplicationLoggingConfiguration?
      sipMediaApplicationLoggingConfiguration;

  GetSipMediaApplicationLoggingConfigurationResponse({
    this.sipMediaApplicationLoggingConfiguration,
  });

  factory GetSipMediaApplicationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSipMediaApplicationLoggingConfigurationResponse(
      sipMediaApplicationLoggingConfiguration:
          json['SipMediaApplicationLoggingConfiguration'] != null
              ? SipMediaApplicationLoggingConfiguration.fromJson(
                  json['SipMediaApplicationLoggingConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationLoggingConfiguration =
        this.sipMediaApplicationLoggingConfiguration;
    return {
      if (sipMediaApplicationLoggingConfiguration != null)
        'SipMediaApplicationLoggingConfiguration':
            sipMediaApplicationLoggingConfiguration,
    };
  }
}

class GetSipMediaApplicationResponse {
  /// The SIP media application details.
  final SipMediaApplication? sipMediaApplication;

  GetSipMediaApplicationResponse({
    this.sipMediaApplication,
  });

  factory GetSipMediaApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetSipMediaApplicationResponse(
      sipMediaApplication: json['SipMediaApplication'] != null
          ? SipMediaApplication.fromJson(
              json['SipMediaApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplication = this.sipMediaApplication;
    return {
      if (sipMediaApplication != null)
        'SipMediaApplication': sipMediaApplication,
    };
  }
}

class GetSipRuleResponse {
  /// The SIP rule details.
  final SipRule? sipRule;

  GetSipRuleResponse({
    this.sipRule,
  });

  factory GetSipRuleResponse.fromJson(Map<String, dynamic> json) {
    return GetSipRuleResponse(
      sipRule: json['SipRule'] != null
          ? SipRule.fromJson(json['SipRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipRule = this.sipRule;
    return {
      if (sipRule != null) 'SipRule': sipRule,
    };
  }
}

class GetUserResponse {
  /// The user details.
  final User? user;

  GetUserResponse({
    this.user,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

class GetUserSettingsResponse {
  /// The user settings.
  final UserSettings? userSettings;

  GetUserSettingsResponse({
    this.userSettings,
  });

  factory GetUserSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetUserSettingsResponse(
      userSettings: json['UserSettings'] != null
          ? UserSettings.fromJson(json['UserSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final userSettings = this.userSettings;
    return {
      if (userSettings != null) 'UserSettings': userSettings,
    };
  }
}

class GetVoiceConnectorEmergencyCallingConfigurationResponse {
  /// The emergency calling configuration details.
  final EmergencyCallingConfiguration? emergencyCallingConfiguration;

  GetVoiceConnectorEmergencyCallingConfigurationResponse({
    this.emergencyCallingConfiguration,
  });

  factory GetVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorEmergencyCallingConfigurationResponse(
      emergencyCallingConfiguration:
          json['EmergencyCallingConfiguration'] != null
              ? EmergencyCallingConfiguration.fromJson(
                  json['EmergencyCallingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final emergencyCallingConfiguration = this.emergencyCallingConfiguration;
    return {
      if (emergencyCallingConfiguration != null)
        'EmergencyCallingConfiguration': emergencyCallingConfiguration,
    };
  }
}

class GetVoiceConnectorGroupResponse {
  /// The Amazon Chime Voice Connector group details.
  final VoiceConnectorGroup? voiceConnectorGroup;

  GetVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });

  factory GetVoiceConnectorGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceConnectorGroupResponse(
      voiceConnectorGroup: json['VoiceConnectorGroup'] != null
          ? VoiceConnectorGroup.fromJson(
              json['VoiceConnectorGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorGroup = this.voiceConnectorGroup;
    return {
      if (voiceConnectorGroup != null)
        'VoiceConnectorGroup': voiceConnectorGroup,
    };
  }
}

class GetVoiceConnectorLoggingConfigurationResponse {
  /// The logging configuration details.
  final LoggingConfiguration? loggingConfiguration;

  GetVoiceConnectorLoggingConfigurationResponse({
    this.loggingConfiguration,
  });

  factory GetVoiceConnectorLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

class GetVoiceConnectorOriginationResponse {
  /// The origination setting details.
  final Origination? origination;

  GetVoiceConnectorOriginationResponse({
    this.origination,
  });

  factory GetVoiceConnectorOriginationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorOriginationResponse(
      origination: json['Origination'] != null
          ? Origination.fromJson(json['Origination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final origination = this.origination;
    return {
      if (origination != null) 'Origination': origination,
    };
  }
}

class GetVoiceConnectorProxyResponse {
  /// The proxy configuration details.
  final Proxy? proxy;

  GetVoiceConnectorProxyResponse({
    this.proxy,
  });

  factory GetVoiceConnectorProxyResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceConnectorProxyResponse(
      proxy: json['Proxy'] != null
          ? Proxy.fromJson(json['Proxy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxy = this.proxy;
    return {
      if (proxy != null) 'Proxy': proxy,
    };
  }
}

class GetVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  final VoiceConnector? voiceConnector;

  GetVoiceConnectorResponse({
    this.voiceConnector,
  });

  factory GetVoiceConnectorResponse.fromJson(Map<String, dynamic> json) {
    return GetVoiceConnectorResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnector.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

class GetVoiceConnectorStreamingConfigurationResponse {
  /// The streaming configuration details.
  final StreamingConfiguration? streamingConfiguration;

  GetVoiceConnectorStreamingConfigurationResponse({
    this.streamingConfiguration,
  });

  factory GetVoiceConnectorStreamingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorStreamingConfigurationResponse(
      streamingConfiguration: json['StreamingConfiguration'] != null
          ? StreamingConfiguration.fromJson(
              json['StreamingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingConfiguration = this.streamingConfiguration;
    return {
      if (streamingConfiguration != null)
        'StreamingConfiguration': streamingConfiguration,
    };
  }
}

class GetVoiceConnectorTerminationHealthResponse {
  /// The termination health details.
  final TerminationHealth? terminationHealth;

  GetVoiceConnectorTerminationHealthResponse({
    this.terminationHealth,
  });

  factory GetVoiceConnectorTerminationHealthResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorTerminationHealthResponse(
      terminationHealth: json['TerminationHealth'] != null
          ? TerminationHealth.fromJson(
              json['TerminationHealth'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final terminationHealth = this.terminationHealth;
    return {
      if (terminationHealth != null) 'TerminationHealth': terminationHealth,
    };
  }
}

class GetVoiceConnectorTerminationResponse {
  /// The termination setting details.
  final Termination? termination;

  GetVoiceConnectorTerminationResponse({
    this.termination,
  });

  factory GetVoiceConnectorTerminationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetVoiceConnectorTerminationResponse(
      termination: json['Termination'] != null
          ? Termination.fromJson(json['Termination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final termination = this.termination;
    return {
      if (termination != null) 'Termination': termination,
    };
  }
}

/// The details of a user.
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

/// Invitation object returned after emailing users to invite them to join the
/// Amazon Chime <code>Team</code> account.
class Invite {
  /// The email address to which the invite is sent.
  final String? emailAddress;

  /// The status of the invite email.
  final EmailStatus? emailStatus;

  /// The invite ID.
  final String? inviteId;

  /// The status of the invite.
  final InviteStatus? status;

  Invite({
    this.emailAddress,
    this.emailStatus,
    this.inviteId,
    this.status,
  });

  factory Invite.fromJson(Map<String, dynamic> json) {
    return Invite(
      emailAddress: json['EmailAddress'] as String?,
      emailStatus: (json['EmailStatus'] as String?)?.toEmailStatus(),
      inviteId: json['InviteId'] as String?,
      status: (json['Status'] as String?)?.toInviteStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final emailStatus = this.emailStatus;
    final inviteId = this.inviteId;
    final status = this.status;
    return {
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (emailStatus != null) 'EmailStatus': emailStatus.toValue(),
      if (inviteId != null) 'InviteId': inviteId,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum InviteStatus {
  pending,
  accepted,
  failed,
}

extension InviteStatusValueExtension on InviteStatus {
  String toValue() {
    switch (this) {
      case InviteStatus.pending:
        return 'Pending';
      case InviteStatus.accepted:
        return 'Accepted';
      case InviteStatus.failed:
        return 'Failed';
    }
  }
}

extension InviteStatusFromString on String {
  InviteStatus toInviteStatus() {
    switch (this) {
      case 'Pending':
        return InviteStatus.pending;
      case 'Accepted':
        return InviteStatus.accepted;
      case 'Failed':
        return InviteStatus.failed;
    }
    throw Exception('$this is not known in enum InviteStatus');
  }
}

class InviteUsersResponse {
  /// The email invitation details.
  final List<Invite>? invites;

  InviteUsersResponse({
    this.invites,
  });

  factory InviteUsersResponse.fromJson(Map<String, dynamic> json) {
    return InviteUsersResponse(
      invites: (json['Invites'] as List?)
          ?.whereNotNull()
          .map((e) => Invite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final invites = this.invites;
    return {
      if (invites != null) 'Invites': invites,
    };
  }
}

enum License {
  basic,
  plus,
  pro,
  proTrial,
}

extension LicenseValueExtension on License {
  String toValue() {
    switch (this) {
      case License.basic:
        return 'Basic';
      case License.plus:
        return 'Plus';
      case License.pro:
        return 'Pro';
      case License.proTrial:
        return 'ProTrial';
    }
  }
}

extension LicenseFromString on String {
  License toLicense() {
    switch (this) {
      case 'Basic':
        return License.basic;
      case 'Plus':
        return License.plus;
      case 'Pro':
        return License.pro;
      case 'ProTrial':
        return License.proTrial;
    }
    throw Exception('$this is not known in enum License');
  }
}

class ListAccountsResponse {
  /// List of Amazon Chime accounts and account details.
  final List<Account>? accounts;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListAccountsResponse({
    this.accounts,
    this.nextToken,
  });

  factory ListAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListAccountsResponse(
      accounts: (json['Accounts'] as List?)
          ?.whereNotNull()
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final nextToken = this.nextToken;
    return {
      if (accounts != null) 'Accounts': accounts,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAppInstanceAdminsResponse {
  /// The information for each administrator.
  final List<AppInstanceAdminSummary>? appInstanceAdmins;

  /// The ARN of the <code>AppInstance</code>.
  final String? appInstanceArn;

  /// The token returned from previous API requests until the number of
  /// administrators is reached.
  final String? nextToken;

  ListAppInstanceAdminsResponse({
    this.appInstanceAdmins,
    this.appInstanceArn,
    this.nextToken,
  });

  factory ListAppInstanceAdminsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppInstanceAdminsResponse(
      appInstanceAdmins: (json['AppInstanceAdmins'] as List?)
          ?.whereNotNull()
          .map((e) =>
              AppInstanceAdminSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      appInstanceArn: json['AppInstanceArn'] as String?,
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceAdmins = this.appInstanceAdmins;
    final appInstanceArn = this.appInstanceArn;
    final nextToken = this.nextToken;
    return {
      if (appInstanceAdmins != null) 'AppInstanceAdmins': appInstanceAdmins,
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAppInstanceUsersResponse {
  /// The ARN of the <code>AppInstance</code>.
  final String? appInstanceArn;

  /// The information for each requested <code>AppInstanceUser</code>.
  final List<AppInstanceUserSummary>? appInstanceUsers;

  /// The token passed by previous API calls until all requested users are
  /// returned.
  final String? nextToken;

  ListAppInstanceUsersResponse({
    this.appInstanceArn,
    this.appInstanceUsers,
    this.nextToken,
  });

  factory ListAppInstanceUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListAppInstanceUsersResponse(
      appInstanceArn: json['AppInstanceArn'] as String?,
      appInstanceUsers: (json['AppInstanceUsers'] as List?)
          ?.whereNotNull()
          .map(
              (e) => AppInstanceUserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceArn = this.appInstanceArn;
    final appInstanceUsers = this.appInstanceUsers;
    final nextToken = this.nextToken;
    return {
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
      if (appInstanceUsers != null) 'AppInstanceUsers': appInstanceUsers,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAppInstancesResponse {
  /// The information for each <code>AppInstance</code>.
  final List<AppInstanceSummary>? appInstances;

  /// The token passed by previous API requests until the maximum number of
  /// <code>AppInstance</code>s is reached.
  final String? nextToken;

  ListAppInstancesResponse({
    this.appInstances,
    this.nextToken,
  });

  factory ListAppInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListAppInstancesResponse(
      appInstances: (json['AppInstances'] as List?)
          ?.whereNotNull()
          .map((e) => AppInstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstances = this.appInstances;
    final nextToken = this.nextToken;
    return {
      if (appInstances != null) 'AppInstances': appInstances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAttendeeTagsResponse {
  /// A list of tag key-value pairs.
  final List<Tag>? tags;

  ListAttendeeTagsResponse({
    this.tags,
  });

  factory ListAttendeeTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListAttendeeTagsResponse(
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

class ListAttendeesResponse {
  /// The Amazon Chime SDK attendee information.
  final List<Attendee>? attendees;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListAttendeesResponse({
    this.attendees,
    this.nextToken,
  });

  factory ListAttendeesResponse.fromJson(Map<String, dynamic> json) {
    return ListAttendeesResponse(
      attendees: (json['Attendees'] as List?)
          ?.whereNotNull()
          .map((e) => Attendee.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final attendees = this.attendees;
    final nextToken = this.nextToken;
    return {
      if (attendees != null) 'Attendees': attendees,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListBotsResponse {
  /// List of bots and bot details.
  final List<Bot>? bots;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListBotsResponse({
    this.bots,
    this.nextToken,
  });

  factory ListBotsResponse.fromJson(Map<String, dynamic> json) {
    return ListBotsResponse(
      bots: (json['Bots'] as List?)
          ?.whereNotNull()
          .map((e) => Bot.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bots = this.bots;
    final nextToken = this.nextToken;
    return {
      if (bots != null) 'Bots': bots,
      if (nextToken != null) 'NextToken': nextToken,
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

  ListChannelMessagesResponse({
    this.channelArn,
    this.channelMessages,
    this.nextToken,
  });

  factory ListChannelMessagesResponse.fromJson(Map<String, dynamic> json) {
    return ListChannelMessagesResponse(
      channelArn: json['ChannelArn'] as String?,
      channelMessages: (json['ChannelMessages'] as List?)
          ?.whereNotNull()
          .map((e) => ChannelMessageSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final channelMessages = this.channelMessages;
    final nextToken = this.nextToken;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (channelMessages != null) 'ChannelMessages': channelMessages,
      if (nextToken != null) 'NextToken': nextToken,
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

class ListMediaCapturePipelinesResponse {
  /// The media capture pipeline objects in the list.
  final List<MediaCapturePipeline>? mediaCapturePipelines;

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
          .map((e) => MediaCapturePipeline.fromJson(e as Map<String, dynamic>))
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

class ListMeetingTagsResponse {
  /// A list of tag key-value pairs.
  final List<Tag>? tags;

  ListMeetingTagsResponse({
    this.tags,
  });

  factory ListMeetingTagsResponse.fromJson(Map<String, dynamic> json) {
    return ListMeetingTagsResponse(
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

class ListMeetingsResponse {
  /// The Amazon Chime SDK meeting information.
  final List<Meeting>? meetings;

  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  ListMeetingsResponse({
    this.meetings,
    this.nextToken,
  });

  factory ListMeetingsResponse.fromJson(Map<String, dynamic> json) {
    return ListMeetingsResponse(
      meetings: (json['Meetings'] as List?)
          ?.whereNotNull()
          .map((e) => Meeting.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meetings = this.meetings;
    final nextToken = this.nextToken;
    return {
      if (meetings != null) 'Meetings': meetings,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListPhoneNumberOrdersResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The phone number order details.
  final List<PhoneNumberOrder>? phoneNumberOrders;

  ListPhoneNumberOrdersResponse({
    this.nextToken,
    this.phoneNumberOrders,
  });

  factory ListPhoneNumberOrdersResponse.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumberOrdersResponse(
      nextToken: json['NextToken'] as String?,
      phoneNumberOrders: (json['PhoneNumberOrders'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberOrder.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumberOrders = this.phoneNumberOrders;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumberOrders != null) 'PhoneNumberOrders': phoneNumberOrders,
    };
  }
}

class ListPhoneNumbersResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The phone number details.
  final List<PhoneNumber>? phoneNumbers;

  ListPhoneNumbersResponse({
    this.nextToken,
    this.phoneNumbers,
  });

  factory ListPhoneNumbersResponse.fromJson(Map<String, dynamic> json) {
    return ListPhoneNumbersResponse(
      nextToken: json['NextToken'] as String?,
      phoneNumbers: (json['PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final phoneNumbers = this.phoneNumbers;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (phoneNumbers != null) 'PhoneNumbers': phoneNumbers,
    };
  }
}

class ListProxySessionsResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The proxy session details.
  final List<ProxySession>? proxySessions;

  ListProxySessionsResponse({
    this.nextToken,
    this.proxySessions,
  });

  factory ListProxySessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListProxySessionsResponse(
      nextToken: json['NextToken'] as String?,
      proxySessions: (json['ProxySessions'] as List?)
          ?.whereNotNull()
          .map((e) => ProxySession.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final proxySessions = this.proxySessions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (proxySessions != null) 'ProxySessions': proxySessions,
    };
  }
}

class ListRoomMembershipsResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The room membership details.
  final List<RoomMembership>? roomMemberships;

  ListRoomMembershipsResponse({
    this.nextToken,
    this.roomMemberships,
  });

  factory ListRoomMembershipsResponse.fromJson(Map<String, dynamic> json) {
    return ListRoomMembershipsResponse(
      nextToken: json['NextToken'] as String?,
      roomMemberships: (json['RoomMemberships'] as List?)
          ?.whereNotNull()
          .map((e) => RoomMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final roomMemberships = this.roomMemberships;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (roomMemberships != null) 'RoomMemberships': roomMemberships,
    };
  }
}

class ListRoomsResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The room details.
  final List<Room>? rooms;

  ListRoomsResponse({
    this.nextToken,
    this.rooms,
  });

  factory ListRoomsResponse.fromJson(Map<String, dynamic> json) {
    return ListRoomsResponse(
      nextToken: json['NextToken'] as String?,
      rooms: (json['Rooms'] as List?)
          ?.whereNotNull()
          .map((e) => Room.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final rooms = this.rooms;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (rooms != null) 'Rooms': rooms,
    };
  }
}

class ListSipMediaApplicationsResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// List of SIP media applications and application details.
  final List<SipMediaApplication>? sipMediaApplications;

  ListSipMediaApplicationsResponse({
    this.nextToken,
    this.sipMediaApplications,
  });

  factory ListSipMediaApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListSipMediaApplicationsResponse(
      nextToken: json['NextToken'] as String?,
      sipMediaApplications: (json['SipMediaApplications'] as List?)
          ?.whereNotNull()
          .map((e) => SipMediaApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sipMediaApplications = this.sipMediaApplications;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sipMediaApplications != null)
        'SipMediaApplications': sipMediaApplications,
    };
  }
}

class ListSipRulesResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// List of SIP rules and rule details.
  final List<SipRule>? sipRules;

  ListSipRulesResponse({
    this.nextToken,
    this.sipRules,
  });

  factory ListSipRulesResponse.fromJson(Map<String, dynamic> json) {
    return ListSipRulesResponse(
      nextToken: json['NextToken'] as String?,
      sipRules: (json['SipRules'] as List?)
          ?.whereNotNull()
          .map((e) => SipRule.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final sipRules = this.sipRules;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (sipRules != null) 'SipRules': sipRules,
    };
  }
}

class ListSupportedPhoneNumberCountriesResponse {
  /// The supported phone number countries.
  final List<PhoneNumberCountry>? phoneNumberCountries;

  ListSupportedPhoneNumberCountriesResponse({
    this.phoneNumberCountries,
  });

  factory ListSupportedPhoneNumberCountriesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSupportedPhoneNumberCountriesResponse(
      phoneNumberCountries: (json['PhoneNumberCountries'] as List?)
          ?.whereNotNull()
          .map((e) => PhoneNumberCountry.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumberCountries = this.phoneNumberCountries;
    return {
      if (phoneNumberCountries != null)
        'PhoneNumberCountries': phoneNumberCountries,
    };
  }
}

class ListTagsForResourceResponse {
  /// A list of tag-key value pairs.
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

class ListUsersResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// List of users and user details.
  final List<User>? users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['NextToken'] as String?,
      users: (json['Users'] as List?)
          ?.whereNotNull()
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (users != null) 'Users': users,
    };
  }
}

class ListVoiceConnectorGroupsResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The details of the Amazon Chime Voice Connector groups.
  final List<VoiceConnectorGroup>? voiceConnectorGroups;

  ListVoiceConnectorGroupsResponse({
    this.nextToken,
    this.voiceConnectorGroups,
  });

  factory ListVoiceConnectorGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListVoiceConnectorGroupsResponse(
      nextToken: json['NextToken'] as String?,
      voiceConnectorGroups: (json['VoiceConnectorGroups'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnectorGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voiceConnectorGroups = this.voiceConnectorGroups;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voiceConnectorGroups != null)
        'VoiceConnectorGroups': voiceConnectorGroups,
    };
  }
}

class ListVoiceConnectorTerminationCredentialsResponse {
  /// A list of user names.
  final List<String>? usernames;

  ListVoiceConnectorTerminationCredentialsResponse({
    this.usernames,
  });

  factory ListVoiceConnectorTerminationCredentialsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListVoiceConnectorTerminationCredentialsResponse(
      usernames: (json['Usernames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final usernames = this.usernames;
    return {
      if (usernames != null) 'Usernames': usernames,
    };
  }
}

class ListVoiceConnectorsResponse {
  /// The token to use to retrieve the next page of results.
  final String? nextToken;

  /// The details of the Amazon Chime Voice Connectors.
  final List<VoiceConnector>? voiceConnectors;

  ListVoiceConnectorsResponse({
    this.nextToken,
    this.voiceConnectors,
  });

  factory ListVoiceConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListVoiceConnectorsResponse(
      nextToken: json['NextToken'] as String?,
      voiceConnectors: (json['VoiceConnectors'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnector.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final voiceConnectors = this.voiceConnectors;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (voiceConnectors != null) 'VoiceConnectors': voiceConnectors,
    };
  }
}

/// The logging configuration associated with an Amazon Chime Voice Connector.
/// Specifies whether SIP message logs are enabled for sending to Amazon
/// CloudWatch Logs.
class LoggingConfiguration {
  /// Boolean that enables logging of detailed media metrics for Voice Connectors
  /// to Amazon CloudWatch logs.
  final bool? enableMediaMetricLogs;

  /// Boolean that enables SIP message logs to Amazon CloudWatch logs.
  final bool? enableSIPLogs;

  LoggingConfiguration({
    this.enableMediaMetricLogs,
    this.enableSIPLogs,
  });

  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      enableMediaMetricLogs: json['EnableMediaMetricLogs'] as bool?,
      enableSIPLogs: json['EnableSIPLogs'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableMediaMetricLogs = this.enableMediaMetricLogs;
    final enableSIPLogs = this.enableSIPLogs;
    return {
      if (enableMediaMetricLogs != null)
        'EnableMediaMetricLogs': enableMediaMetricLogs,
      if (enableSIPLogs != null) 'EnableSIPLogs': enableSIPLogs,
    };
  }
}

class LogoutUserResponse {
  LogoutUserResponse();

  factory LogoutUserResponse.fromJson(Map<String, dynamic> _) {
    return LogoutUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  /// The ID of a media capture pipeline.
  final String? mediaPipelineId;

  /// ARN of the destination to which the media artifacts are saved.
  final String? sinkArn;

  /// Destination type to which the media artifacts are saved. You must use an S3
  /// Bucket.
  final MediaPipelineSinkType? sinkType;

  /// ARN of the source from which the media artifacts will be saved.
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
    }
    throw Exception('$this is not known in enum MediaPipelineStatus');
  }
}

/// A set of endpoints used by clients to connect to the media service group for
/// an Amazon Chime SDK meeting.
class MediaPlacement {
  /// The audio fallback URL.
  final String? audioFallbackUrl;

  /// The audio host URL.
  final String? audioHostUrl;

  /// The event ingestion URL to which you send client meeting events.
  final String? eventIngestionUrl;

  /// The screen data URL.
  /// <important>
  /// <b>This parameter is is no longer supported and no longer used by the Amazon
  /// Chime SDK.</b>
  /// </important>
  final String? screenDataUrl;

  /// The screen sharing URL.
  /// <important>
  /// <b>This parameter is is no longer supported and no longer used by the Amazon
  /// Chime SDK.</b>.
  /// </important>
  final String? screenSharingUrl;

  /// The screen viewing URL.
  /// <important>
  /// <b>This parameter is is no longer supported and no longer used by the Amazon
  /// Chime SDK.</b>
  /// </important>
  final String? screenViewingUrl;

  /// The signaling URL.
  final String? signalingUrl;

  /// The turn control URL.
  /// <important>
  /// <b>This parameter is is no longer supported and no longer used by the Amazon
  /// Chime SDK.</b>
  /// </important>
  final String? turnControlUrl;

  MediaPlacement({
    this.audioFallbackUrl,
    this.audioHostUrl,
    this.eventIngestionUrl,
    this.screenDataUrl,
    this.screenSharingUrl,
    this.screenViewingUrl,
    this.signalingUrl,
    this.turnControlUrl,
  });

  factory MediaPlacement.fromJson(Map<String, dynamic> json) {
    return MediaPlacement(
      audioFallbackUrl: json['AudioFallbackUrl'] as String?,
      audioHostUrl: json['AudioHostUrl'] as String?,
      eventIngestionUrl: json['EventIngestionUrl'] as String?,
      screenDataUrl: json['ScreenDataUrl'] as String?,
      screenSharingUrl: json['ScreenSharingUrl'] as String?,
      screenViewingUrl: json['ScreenViewingUrl'] as String?,
      signalingUrl: json['SignalingUrl'] as String?,
      turnControlUrl: json['TurnControlUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final audioFallbackUrl = this.audioFallbackUrl;
    final audioHostUrl = this.audioHostUrl;
    final eventIngestionUrl = this.eventIngestionUrl;
    final screenDataUrl = this.screenDataUrl;
    final screenSharingUrl = this.screenSharingUrl;
    final screenViewingUrl = this.screenViewingUrl;
    final signalingUrl = this.signalingUrl;
    final turnControlUrl = this.turnControlUrl;
    return {
      if (audioFallbackUrl != null) 'AudioFallbackUrl': audioFallbackUrl,
      if (audioHostUrl != null) 'AudioHostUrl': audioHostUrl,
      if (eventIngestionUrl != null) 'EventIngestionUrl': eventIngestionUrl,
      if (screenDataUrl != null) 'ScreenDataUrl': screenDataUrl,
      if (screenSharingUrl != null) 'ScreenSharingUrl': screenSharingUrl,
      if (screenViewingUrl != null) 'ScreenViewingUrl': screenViewingUrl,
      if (signalingUrl != null) 'SignalingUrl': signalingUrl,
      if (turnControlUrl != null) 'TurnControlUrl': turnControlUrl,
    };
  }
}

/// A meeting created using the Amazon Chime SDK.
class Meeting {
  /// The external meeting ID.
  final String? externalMeetingId;

  /// The media placement for the meeting.
  final MediaPlacement? mediaPlacement;

  /// The Region in which you create the meeting. Available values:
  /// <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
  final String? mediaRegion;

  /// The Amazon Chime SDK meeting ID.
  final String? meetingId;

  Meeting({
    this.externalMeetingId,
    this.mediaPlacement,
    this.mediaRegion,
    this.meetingId,
  });

  factory Meeting.fromJson(Map<String, dynamic> json) {
    return Meeting(
      externalMeetingId: json['ExternalMeetingId'] as String?,
      mediaPlacement: json['MediaPlacement'] != null
          ? MediaPlacement.fromJson(
              json['MediaPlacement'] as Map<String, dynamic>)
          : null,
      mediaRegion: json['MediaRegion'] as String?,
      meetingId: json['MeetingId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final externalMeetingId = this.externalMeetingId;
    final mediaPlacement = this.mediaPlacement;
    final mediaRegion = this.mediaRegion;
    final meetingId = this.meetingId;
    return {
      if (externalMeetingId != null) 'ExternalMeetingId': externalMeetingId,
      if (mediaPlacement != null) 'MediaPlacement': mediaPlacement,
      if (mediaRegion != null) 'MediaRegion': mediaRegion,
      if (meetingId != null) 'MeetingId': meetingId,
    };
  }
}

/// The resource target configurations for receiving Amazon Chime SDK meeting
/// and attendee event notifications. The Amazon Chime SDK supports resource
/// targets located in the US East (N. Virginia) AWS Region
/// (<code>us-east-1</code>).
class MeetingNotificationConfiguration {
  /// The SNS topic ARN.
  final String? snsTopicArn;

  /// The SQS queue ARN.
  final String? sqsQueueArn;

  MeetingNotificationConfiguration({
    this.snsTopicArn,
    this.sqsQueueArn,
  });

  Map<String, dynamic> toJson() {
    final snsTopicArn = this.snsTopicArn;
    final sqsQueueArn = this.sqsQueueArn;
    return {
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sqsQueueArn != null) 'SqsQueueArn': sqsQueueArn,
    };
  }
}

/// The member details, such as email address, name, member ID, and member type.
class Member {
  /// The Amazon Chime account ID.
  final String? accountId;

  /// The member email address.
  final String? email;

  /// The member name.
  final String? fullName;

  /// The member ID (user ID or bot ID).
  final String? memberId;

  /// The member type.
  final MemberType? memberType;

  Member({
    this.accountId,
    this.email,
    this.fullName,
    this.memberId,
    this.memberType,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      accountId: json['AccountId'] as String?,
      email: json['Email'] as String?,
      fullName: json['FullName'] as String?,
      memberId: json['MemberId'] as String?,
      memberType: (json['MemberType'] as String?)?.toMemberType(),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final email = this.email;
    final fullName = this.fullName;
    final memberId = this.memberId;
    final memberType = this.memberType;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (email != null) 'Email': email,
      if (fullName != null) 'FullName': fullName,
      if (memberId != null) 'MemberId': memberId,
      if (memberType != null) 'MemberType': memberType.toValue(),
    };
  }
}

/// The list of errors returned when a member action results in an error.
class MemberError {
  /// The error code.
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The member ID.
  final String? memberId;

  MemberError({
    this.errorCode,
    this.errorMessage,
    this.memberId,
  });

  factory MemberError.fromJson(Map<String, dynamic> json) {
    return MemberError(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      memberId: json['MemberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final memberId = this.memberId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (memberId != null) 'MemberId': memberId,
    };
  }
}

enum MemberType {
  user,
  bot,
  webhook,
}

extension MemberTypeValueExtension on MemberType {
  String toValue() {
    switch (this) {
      case MemberType.user:
        return 'User';
      case MemberType.bot:
        return 'Bot';
      case MemberType.webhook:
        return 'Webhook';
    }
  }
}

extension MemberTypeFromString on String {
  MemberType toMemberType() {
    switch (this) {
      case 'User':
        return MemberType.user;
      case 'Bot':
        return MemberType.bot;
      case 'Webhook':
        return MemberType.webhook;
    }
    throw Exception('$this is not known in enum MemberType');
  }
}

/// Membership details, such as member ID and member role.
class MembershipItem {
  /// The member ID.
  final String? memberId;

  /// The member role.
  final RoomMembershipRole? role;

  MembershipItem({
    this.memberId,
    this.role,
  });

  Map<String, dynamic> toJson() {
    final memberId = this.memberId;
    final role = this.role;
    return {
      if (memberId != null) 'MemberId': memberId,
      if (role != null) 'Role': role.toValue(),
    };
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

enum NotificationTarget {
  eventBridge,
  sns,
  sqs,
}

extension NotificationTargetValueExtension on NotificationTarget {
  String toValue() {
    switch (this) {
      case NotificationTarget.eventBridge:
        return 'EventBridge';
      case NotificationTarget.sns:
        return 'SNS';
      case NotificationTarget.sqs:
        return 'SQS';
    }
  }
}

extension NotificationTargetFromString on String {
  NotificationTarget toNotificationTarget() {
    switch (this) {
      case 'EventBridge':
        return NotificationTarget.eventBridge;
      case 'SNS':
        return NotificationTarget.sns;
      case 'SQS':
        return NotificationTarget.sqs;
    }
    throw Exception('$this is not known in enum NotificationTarget');
  }
}

enum NumberSelectionBehavior {
  preferSticky,
  avoidSticky,
}

extension NumberSelectionBehaviorValueExtension on NumberSelectionBehavior {
  String toValue() {
    switch (this) {
      case NumberSelectionBehavior.preferSticky:
        return 'PreferSticky';
      case NumberSelectionBehavior.avoidSticky:
        return 'AvoidSticky';
    }
  }
}

extension NumberSelectionBehaviorFromString on String {
  NumberSelectionBehavior toNumberSelectionBehavior() {
    switch (this) {
      case 'PreferSticky':
        return NumberSelectionBehavior.preferSticky;
      case 'AvoidSticky':
        return NumberSelectionBehavior.avoidSticky;
    }
    throw Exception('$this is not known in enum NumberSelectionBehavior');
  }
}

/// A phone number for which an order has been placed.
class OrderedPhoneNumber {
  /// The phone number, in E.164 format.
  final String? e164PhoneNumber;

  /// The phone number status.
  final OrderedPhoneNumberStatus? status;

  OrderedPhoneNumber({
    this.e164PhoneNumber,
    this.status,
  });

  factory OrderedPhoneNumber.fromJson(Map<String, dynamic> json) {
    return OrderedPhoneNumber(
      e164PhoneNumber: json['E164PhoneNumber'] as String?,
      status: (json['Status'] as String?)?.toOrderedPhoneNumberStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final e164PhoneNumber = this.e164PhoneNumber;
    final status = this.status;
    return {
      if (e164PhoneNumber != null) 'E164PhoneNumber': e164PhoneNumber,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum OrderedPhoneNumberStatus {
  processing,
  acquired,
  failed,
}

extension OrderedPhoneNumberStatusValueExtension on OrderedPhoneNumberStatus {
  String toValue() {
    switch (this) {
      case OrderedPhoneNumberStatus.processing:
        return 'Processing';
      case OrderedPhoneNumberStatus.acquired:
        return 'Acquired';
      case OrderedPhoneNumberStatus.failed:
        return 'Failed';
    }
  }
}

extension OrderedPhoneNumberStatusFromString on String {
  OrderedPhoneNumberStatus toOrderedPhoneNumberStatus() {
    switch (this) {
      case 'Processing':
        return OrderedPhoneNumberStatus.processing;
      case 'Acquired':
        return OrderedPhoneNumberStatus.acquired;
      case 'Failed':
        return OrderedPhoneNumberStatus.failed;
    }
    throw Exception('$this is not known in enum OrderedPhoneNumberStatus');
  }
}

/// Origination settings enable your SIP hosts to receive inbound calls using
/// your Amazon Chime Voice Connector.
/// <note>
/// The parameters listed below are not required, but you must use at least one.
/// </note>
class Origination {
  /// When origination settings are disabled, inbound calls are not enabled for
  /// your Amazon Chime Voice Connector. This parameter is not required, but you
  /// must specify this parameter or <code>Routes</code>.
  final bool? disabled;

  /// The call distribution properties defined for your SIP hosts. Valid range:
  /// Minimum value of 1. Maximum value of 20. This parameter is not required, but
  /// you must specify this parameter or <code>Disabled</code>.
  final List<OriginationRoute>? routes;

  Origination({
    this.disabled,
    this.routes,
  });

  factory Origination.fromJson(Map<String, dynamic> json) {
    return Origination(
      disabled: json['Disabled'] as bool?,
      routes: (json['Routes'] as List?)
          ?.whereNotNull()
          .map((e) => OriginationRoute.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final disabled = this.disabled;
    final routes = this.routes;
    return {
      if (disabled != null) 'Disabled': disabled,
      if (routes != null) 'Routes': routes,
    };
  }
}

/// Origination routes define call distribution properties for your SIP hosts to
/// receive inbound calls using your Amazon Chime Voice Connector. Limit: Ten
/// origination routes for each Amazon Chime Voice Connector.
/// <note>
/// The parameters listed below are not required, but you must use at least one.
/// </note>
class OriginationRoute {
  /// The FQDN or IP address to contact for origination traffic.
  final String? host;

  /// The designated origination route port. Defaults to 5060.
  final int? port;

  /// The priority associated with the host, with 1 being the highest priority.
  /// Higher priority hosts are attempted first.
  final int? priority;

  /// The protocol to use for the origination route. Encryption-enabled Amazon
  /// Chime Voice Connectors use TCP protocol by default.
  final OriginationRouteProtocol? protocol;

  /// The weight associated with the host. If hosts are equal in priority, calls
  /// are redistributed among them based on their relative weight.
  final int? weight;

  OriginationRoute({
    this.host,
    this.port,
    this.priority,
    this.protocol,
    this.weight,
  });

  factory OriginationRoute.fromJson(Map<String, dynamic> json) {
    return OriginationRoute(
      host: json['Host'] as String?,
      port: json['Port'] as int?,
      priority: json['Priority'] as int?,
      protocol: (json['Protocol'] as String?)?.toOriginationRouteProtocol(),
      weight: json['Weight'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final host = this.host;
    final port = this.port;
    final priority = this.priority;
    final protocol = this.protocol;
    final weight = this.weight;
    return {
      if (host != null) 'Host': host,
      if (port != null) 'Port': port,
      if (priority != null) 'Priority': priority,
      if (protocol != null) 'Protocol': protocol.toValue(),
      if (weight != null) 'Weight': weight,
    };
  }
}

enum OriginationRouteProtocol {
  tcp,
  udp,
}

extension OriginationRouteProtocolValueExtension on OriginationRouteProtocol {
  String toValue() {
    switch (this) {
      case OriginationRouteProtocol.tcp:
        return 'TCP';
      case OriginationRouteProtocol.udp:
        return 'UDP';
    }
  }
}

extension OriginationRouteProtocolFromString on String {
  OriginationRouteProtocol toOriginationRouteProtocol() {
    switch (this) {
      case 'TCP':
        return OriginationRouteProtocol.tcp;
      case 'UDP':
        return OriginationRouteProtocol.udp;
    }
    throw Exception('$this is not known in enum OriginationRouteProtocol');
  }
}

/// The phone number and proxy phone number for a participant in an Amazon Chime
/// Voice Connector proxy session.
class Participant {
  /// The participant's phone number.
  final String? phoneNumber;

  /// The participant's proxy phone number.
  final String? proxyPhoneNumber;

  Participant({
    this.phoneNumber,
    this.proxyPhoneNumber,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      phoneNumber: json['PhoneNumber'] as String?,
      proxyPhoneNumber: json['ProxyPhoneNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    final proxyPhoneNumber = this.proxyPhoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
      if (proxyPhoneNumber != null) 'ProxyPhoneNumber': proxyPhoneNumber,
    };
  }
}

/// A phone number used for Amazon Chime Business Calling or an Amazon Chime
/// Voice Connector.
class PhoneNumber {
  /// The phone number associations.
  final List<PhoneNumberAssociation>? associations;

  /// The outbound calling name associated with the phone number.
  final String? callingName;

  /// The outbound calling name status.
  final CallingNameStatus? callingNameStatus;

  /// The phone number capabilities.
  final PhoneNumberCapabilities? capabilities;

  /// The phone number country. Format: ISO 3166-1 alpha-2.
  final String? country;

  /// The phone number creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The deleted phone number timestamp, in ISO 8601 format.
  final DateTime? deletionTimestamp;

  /// The phone number, in E.164 format.
  final String? e164PhoneNumber;

  /// The phone number ID.
  final String? phoneNumberId;

  /// The phone number product type.
  final PhoneNumberProductType? productType;

  /// The phone number status.
  final PhoneNumberStatus? status;

  /// The phone number type.
  final PhoneNumberType? type;

  /// The updated phone number timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  PhoneNumber({
    this.associations,
    this.callingName,
    this.callingNameStatus,
    this.capabilities,
    this.country,
    this.createdTimestamp,
    this.deletionTimestamp,
    this.e164PhoneNumber,
    this.phoneNumberId,
    this.productType,
    this.status,
    this.type,
    this.updatedTimestamp,
  });

  factory PhoneNumber.fromJson(Map<String, dynamic> json) {
    return PhoneNumber(
      associations: (json['Associations'] as List?)
          ?.whereNotNull()
          .map(
              (e) => PhoneNumberAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      callingName: json['CallingName'] as String?,
      callingNameStatus:
          (json['CallingNameStatus'] as String?)?.toCallingNameStatus(),
      capabilities: json['Capabilities'] != null
          ? PhoneNumberCapabilities.fromJson(
              json['Capabilities'] as Map<String, dynamic>)
          : null,
      country: json['Country'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionTimestamp: timeStampFromJson(json['DeletionTimestamp']),
      e164PhoneNumber: json['E164PhoneNumber'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      productType: (json['ProductType'] as String?)?.toPhoneNumberProductType(),
      status: (json['Status'] as String?)?.toPhoneNumberStatus(),
      type: (json['Type'] as String?)?.toPhoneNumberType(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final associations = this.associations;
    final callingName = this.callingName;
    final callingNameStatus = this.callingNameStatus;
    final capabilities = this.capabilities;
    final country = this.country;
    final createdTimestamp = this.createdTimestamp;
    final deletionTimestamp = this.deletionTimestamp;
    final e164PhoneNumber = this.e164PhoneNumber;
    final phoneNumberId = this.phoneNumberId;
    final productType = this.productType;
    final status = this.status;
    final type = this.type;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (associations != null) 'Associations': associations,
      if (callingName != null) 'CallingName': callingName,
      if (callingNameStatus != null)
        'CallingNameStatus': callingNameStatus.toValue(),
      if (capabilities != null) 'Capabilities': capabilities,
      if (country != null) 'Country': country,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (deletionTimestamp != null)
        'DeletionTimestamp': iso8601ToJson(deletionTimestamp),
      if (e164PhoneNumber != null) 'E164PhoneNumber': e164PhoneNumber,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (productType != null) 'ProductType': productType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (type != null) 'Type': type.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// The phone number associations, such as Amazon Chime account ID, Amazon Chime
/// user ID, Amazon Chime Voice Connector ID, or Amazon Chime Voice Connector
/// group ID.
class PhoneNumberAssociation {
  /// The timestamp of the phone number association, in ISO 8601 format.
  final DateTime? associatedTimestamp;

  /// Defines the association with an Amazon Chime account ID, user ID, Amazon
  /// Chime Voice Connector ID, or Amazon Chime Voice Connector group ID.
  final PhoneNumberAssociationName? name;

  /// Contains the ID for the entity specified in Name.
  final String? value;

  PhoneNumberAssociation({
    this.associatedTimestamp,
    this.name,
    this.value,
  });

  factory PhoneNumberAssociation.fromJson(Map<String, dynamic> json) {
    return PhoneNumberAssociation(
      associatedTimestamp: timeStampFromJson(json['AssociatedTimestamp']),
      name: (json['Name'] as String?)?.toPhoneNumberAssociationName(),
      value: json['Value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedTimestamp = this.associatedTimestamp;
    final name = this.name;
    final value = this.value;
    return {
      if (associatedTimestamp != null)
        'AssociatedTimestamp': iso8601ToJson(associatedTimestamp),
      if (name != null) 'Name': name.toValue(),
      if (value != null) 'Value': value,
    };
  }
}

enum PhoneNumberAssociationName {
  accountId,
  userId,
  voiceConnectorId,
  voiceConnectorGroupId,
  sipRuleId,
}

extension PhoneNumberAssociationNameValueExtension
    on PhoneNumberAssociationName {
  String toValue() {
    switch (this) {
      case PhoneNumberAssociationName.accountId:
        return 'AccountId';
      case PhoneNumberAssociationName.userId:
        return 'UserId';
      case PhoneNumberAssociationName.voiceConnectorId:
        return 'VoiceConnectorId';
      case PhoneNumberAssociationName.voiceConnectorGroupId:
        return 'VoiceConnectorGroupId';
      case PhoneNumberAssociationName.sipRuleId:
        return 'SipRuleId';
    }
  }
}

extension PhoneNumberAssociationNameFromString on String {
  PhoneNumberAssociationName toPhoneNumberAssociationName() {
    switch (this) {
      case 'AccountId':
        return PhoneNumberAssociationName.accountId;
      case 'UserId':
        return PhoneNumberAssociationName.userId;
      case 'VoiceConnectorId':
        return PhoneNumberAssociationName.voiceConnectorId;
      case 'VoiceConnectorGroupId':
        return PhoneNumberAssociationName.voiceConnectorGroupId;
      case 'SipRuleId':
        return PhoneNumberAssociationName.sipRuleId;
    }
    throw Exception('$this is not known in enum PhoneNumberAssociationName');
  }
}

/// The phone number capabilities for Amazon Chime Business Calling phone
/// numbers, such as enabled inbound and outbound calling and text messaging.
class PhoneNumberCapabilities {
  /// Allows or denies inbound calling for the specified phone number.
  final bool? inboundCall;

  /// Allows or denies inbound MMS messaging for the specified phone number.
  final bool? inboundMMS;

  /// Allows or denies inbound SMS messaging for the specified phone number.
  final bool? inboundSMS;

  /// Allows or denies outbound calling for the specified phone number.
  final bool? outboundCall;

  /// Allows or denies outbound MMS messaging for the specified phone number.
  final bool? outboundMMS;

  /// Allows or denies outbound SMS messaging for the specified phone number.
  final bool? outboundSMS;

  PhoneNumberCapabilities({
    this.inboundCall,
    this.inboundMMS,
    this.inboundSMS,
    this.outboundCall,
    this.outboundMMS,
    this.outboundSMS,
  });

  factory PhoneNumberCapabilities.fromJson(Map<String, dynamic> json) {
    return PhoneNumberCapabilities(
      inboundCall: json['InboundCall'] as bool?,
      inboundMMS: json['InboundMMS'] as bool?,
      inboundSMS: json['InboundSMS'] as bool?,
      outboundCall: json['OutboundCall'] as bool?,
      outboundMMS: json['OutboundMMS'] as bool?,
      outboundSMS: json['OutboundSMS'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final inboundCall = this.inboundCall;
    final inboundMMS = this.inboundMMS;
    final inboundSMS = this.inboundSMS;
    final outboundCall = this.outboundCall;
    final outboundMMS = this.outboundMMS;
    final outboundSMS = this.outboundSMS;
    return {
      if (inboundCall != null) 'InboundCall': inboundCall,
      if (inboundMMS != null) 'InboundMMS': inboundMMS,
      if (inboundSMS != null) 'InboundSMS': inboundSMS,
      if (outboundCall != null) 'OutboundCall': outboundCall,
      if (outboundMMS != null) 'OutboundMMS': outboundMMS,
      if (outboundSMS != null) 'OutboundSMS': outboundSMS,
    };
  }
}

/// The phone number country.
class PhoneNumberCountry {
  /// The phone number country code. Format: ISO 3166-1 alpha-2.
  final String? countryCode;

  /// The supported phone number types.
  final List<PhoneNumberType>? supportedPhoneNumberTypes;

  PhoneNumberCountry({
    this.countryCode,
    this.supportedPhoneNumberTypes,
  });

  factory PhoneNumberCountry.fromJson(Map<String, dynamic> json) {
    return PhoneNumberCountry(
      countryCode: json['CountryCode'] as String?,
      supportedPhoneNumberTypes: (json['SupportedPhoneNumberTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toPhoneNumberType())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final countryCode = this.countryCode;
    final supportedPhoneNumberTypes = this.supportedPhoneNumberTypes;
    return {
      if (countryCode != null) 'CountryCode': countryCode,
      if (supportedPhoneNumberTypes != null)
        'SupportedPhoneNumberTypes':
            supportedPhoneNumberTypes.map((e) => e.toValue()).toList(),
    };
  }
}

/// If the phone number action fails for one or more of the phone numbers in the
/// request, a list of the phone numbers is returned, along with error codes and
/// error messages.
class PhoneNumberError {
  /// The error code.
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The phone number ID for which the action failed.
  final String? phoneNumberId;

  PhoneNumberError({
    this.errorCode,
    this.errorMessage,
    this.phoneNumberId,
  });

  factory PhoneNumberError.fromJson(Map<String, dynamic> json) {
    return PhoneNumberError(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final phoneNumberId = this.phoneNumberId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
    };
  }
}

/// The details of a phone number order created for Amazon Chime.
class PhoneNumberOrder {
  /// The phone number order creation time stamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The ordered phone number details, such as the phone number in E.164 format
  /// and the phone number status.
  final List<OrderedPhoneNumber>? orderedPhoneNumbers;

  /// The phone number order ID.
  final String? phoneNumberOrderId;

  /// The phone number order product type.
  final PhoneNumberProductType? productType;

  /// The status of the phone number order.
  final PhoneNumberOrderStatus? status;

  /// The updated phone number order time stamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  PhoneNumberOrder({
    this.createdTimestamp,
    this.orderedPhoneNumbers,
    this.phoneNumberOrderId,
    this.productType,
    this.status,
    this.updatedTimestamp,
  });

  factory PhoneNumberOrder.fromJson(Map<String, dynamic> json) {
    return PhoneNumberOrder(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      orderedPhoneNumbers: (json['OrderedPhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => OrderedPhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumberOrderId: json['PhoneNumberOrderId'] as String?,
      productType: (json['ProductType'] as String?)?.toPhoneNumberProductType(),
      status: (json['Status'] as String?)?.toPhoneNumberOrderStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final orderedPhoneNumbers = this.orderedPhoneNumbers;
    final phoneNumberOrderId = this.phoneNumberOrderId;
    final productType = this.productType;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (orderedPhoneNumbers != null)
        'OrderedPhoneNumbers': orderedPhoneNumbers,
      if (phoneNumberOrderId != null) 'PhoneNumberOrderId': phoneNumberOrderId,
      if (productType != null) 'ProductType': productType.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

enum PhoneNumberOrderStatus {
  processing,
  successful,
  failed,
  partial,
}

extension PhoneNumberOrderStatusValueExtension on PhoneNumberOrderStatus {
  String toValue() {
    switch (this) {
      case PhoneNumberOrderStatus.processing:
        return 'Processing';
      case PhoneNumberOrderStatus.successful:
        return 'Successful';
      case PhoneNumberOrderStatus.failed:
        return 'Failed';
      case PhoneNumberOrderStatus.partial:
        return 'Partial';
    }
  }
}

extension PhoneNumberOrderStatusFromString on String {
  PhoneNumberOrderStatus toPhoneNumberOrderStatus() {
    switch (this) {
      case 'Processing':
        return PhoneNumberOrderStatus.processing;
      case 'Successful':
        return PhoneNumberOrderStatus.successful;
      case 'Failed':
        return PhoneNumberOrderStatus.failed;
      case 'Partial':
        return PhoneNumberOrderStatus.partial;
    }
    throw Exception('$this is not known in enum PhoneNumberOrderStatus');
  }
}

enum PhoneNumberProductType {
  businessCalling,
  voiceConnector,
  sipMediaApplicationDialIn,
}

extension PhoneNumberProductTypeValueExtension on PhoneNumberProductType {
  String toValue() {
    switch (this) {
      case PhoneNumberProductType.businessCalling:
        return 'BusinessCalling';
      case PhoneNumberProductType.voiceConnector:
        return 'VoiceConnector';
      case PhoneNumberProductType.sipMediaApplicationDialIn:
        return 'SipMediaApplicationDialIn';
    }
  }
}

extension PhoneNumberProductTypeFromString on String {
  PhoneNumberProductType toPhoneNumberProductType() {
    switch (this) {
      case 'BusinessCalling':
        return PhoneNumberProductType.businessCalling;
      case 'VoiceConnector':
        return PhoneNumberProductType.voiceConnector;
      case 'SipMediaApplicationDialIn':
        return PhoneNumberProductType.sipMediaApplicationDialIn;
    }
    throw Exception('$this is not known in enum PhoneNumberProductType');
  }
}

enum PhoneNumberStatus {
  acquireInProgress,
  acquireFailed,
  unassigned,
  assigned,
  releaseInProgress,
  deleteInProgress,
  releaseFailed,
  deleteFailed,
}

extension PhoneNumberStatusValueExtension on PhoneNumberStatus {
  String toValue() {
    switch (this) {
      case PhoneNumberStatus.acquireInProgress:
        return 'AcquireInProgress';
      case PhoneNumberStatus.acquireFailed:
        return 'AcquireFailed';
      case PhoneNumberStatus.unassigned:
        return 'Unassigned';
      case PhoneNumberStatus.assigned:
        return 'Assigned';
      case PhoneNumberStatus.releaseInProgress:
        return 'ReleaseInProgress';
      case PhoneNumberStatus.deleteInProgress:
        return 'DeleteInProgress';
      case PhoneNumberStatus.releaseFailed:
        return 'ReleaseFailed';
      case PhoneNumberStatus.deleteFailed:
        return 'DeleteFailed';
    }
  }
}

extension PhoneNumberStatusFromString on String {
  PhoneNumberStatus toPhoneNumberStatus() {
    switch (this) {
      case 'AcquireInProgress':
        return PhoneNumberStatus.acquireInProgress;
      case 'AcquireFailed':
        return PhoneNumberStatus.acquireFailed;
      case 'Unassigned':
        return PhoneNumberStatus.unassigned;
      case 'Assigned':
        return PhoneNumberStatus.assigned;
      case 'ReleaseInProgress':
        return PhoneNumberStatus.releaseInProgress;
      case 'DeleteInProgress':
        return PhoneNumberStatus.deleteInProgress;
      case 'ReleaseFailed':
        return PhoneNumberStatus.releaseFailed;
      case 'DeleteFailed':
        return PhoneNumberStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum PhoneNumberStatus');
  }
}

enum PhoneNumberType {
  local,
  tollFree,
}

extension PhoneNumberTypeValueExtension on PhoneNumberType {
  String toValue() {
    switch (this) {
      case PhoneNumberType.local:
        return 'Local';
      case PhoneNumberType.tollFree:
        return 'TollFree';
    }
  }
}

extension PhoneNumberTypeFromString on String {
  PhoneNumberType toPhoneNumberType() {
    switch (this) {
      case 'Local':
        return PhoneNumberType.local;
      case 'TollFree':
        return PhoneNumberType.tollFree;
    }
    throw Exception('$this is not known in enum PhoneNumberType');
  }
}

/// The proxy configuration for an Amazon Chime Voice Connector.
class Proxy {
  /// The default number of minutes allowed for proxy sessions.
  final int? defaultSessionExpiryMinutes;

  /// When true, stops proxy sessions from being created on the specified Amazon
  /// Chime Voice Connector.
  final bool? disabled;

  /// The phone number to route calls to after a proxy session expires.
  final String? fallBackPhoneNumber;

  /// The countries for proxy phone numbers to be selected from.
  final List<String>? phoneNumberCountries;

  Proxy({
    this.defaultSessionExpiryMinutes,
    this.disabled,
    this.fallBackPhoneNumber,
    this.phoneNumberCountries,
  });

  factory Proxy.fromJson(Map<String, dynamic> json) {
    return Proxy(
      defaultSessionExpiryMinutes: json['DefaultSessionExpiryMinutes'] as int?,
      disabled: json['Disabled'] as bool?,
      fallBackPhoneNumber: json['FallBackPhoneNumber'] as String?,
      phoneNumberCountries: (json['PhoneNumberCountries'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultSessionExpiryMinutes = this.defaultSessionExpiryMinutes;
    final disabled = this.disabled;
    final fallBackPhoneNumber = this.fallBackPhoneNumber;
    final phoneNumberCountries = this.phoneNumberCountries;
    return {
      if (defaultSessionExpiryMinutes != null)
        'DefaultSessionExpiryMinutes': defaultSessionExpiryMinutes,
      if (disabled != null) 'Disabled': disabled,
      if (fallBackPhoneNumber != null)
        'FallBackPhoneNumber': fallBackPhoneNumber,
      if (phoneNumberCountries != null)
        'PhoneNumberCountries': phoneNumberCountries,
    };
  }
}

/// The proxy session for an Amazon Chime Voice Connector.
class ProxySession {
  /// The proxy session capabilities.
  final List<Capability>? capabilities;

  /// The created time stamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The ended time stamp, in ISO 8601 format.
  final DateTime? endedTimestamp;

  /// The number of minutes allowed for the proxy session.
  final int? expiryMinutes;

  /// The preference for matching the country or area code of the proxy phone
  /// number with that of the first participant.
  final GeoMatchLevel? geoMatchLevel;

  /// The country and area code for the proxy phone number.
  final GeoMatchParams? geoMatchParams;

  /// The name of the proxy session.
  final String? name;

  /// The preference for proxy phone number reuse, or stickiness, between the same
  /// participants across sessions.
  final NumberSelectionBehavior? numberSelectionBehavior;

  /// The proxy session participants.
  final List<Participant>? participants;

  /// The proxy session ID.
  final String? proxySessionId;

  /// The status of the proxy session.
  final ProxySessionStatus? status;

  /// The updated time stamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  /// The Amazon Chime voice connector ID.
  final String? voiceConnectorId;

  ProxySession({
    this.capabilities,
    this.createdTimestamp,
    this.endedTimestamp,
    this.expiryMinutes,
    this.geoMatchLevel,
    this.geoMatchParams,
    this.name,
    this.numberSelectionBehavior,
    this.participants,
    this.proxySessionId,
    this.status,
    this.updatedTimestamp,
    this.voiceConnectorId,
  });

  factory ProxySession.fromJson(Map<String, dynamic> json) {
    return ProxySession(
      capabilities: (json['Capabilities'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toCapability())
          .toList(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endedTimestamp: timeStampFromJson(json['EndedTimestamp']),
      expiryMinutes: json['ExpiryMinutes'] as int?,
      geoMatchLevel: (json['GeoMatchLevel'] as String?)?.toGeoMatchLevel(),
      geoMatchParams: json['GeoMatchParams'] != null
          ? GeoMatchParams.fromJson(
              json['GeoMatchParams'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      numberSelectionBehavior: (json['NumberSelectionBehavior'] as String?)
          ?.toNumberSelectionBehavior(),
      participants: (json['Participants'] as List?)
          ?.whereNotNull()
          .map((e) => Participant.fromJson(e as Map<String, dynamic>))
          .toList(),
      proxySessionId: json['ProxySessionId'] as String?,
      status: (json['Status'] as String?)?.toProxySessionStatus(),
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorId: json['VoiceConnectorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final capabilities = this.capabilities;
    final createdTimestamp = this.createdTimestamp;
    final endedTimestamp = this.endedTimestamp;
    final expiryMinutes = this.expiryMinutes;
    final geoMatchLevel = this.geoMatchLevel;
    final geoMatchParams = this.geoMatchParams;
    final name = this.name;
    final numberSelectionBehavior = this.numberSelectionBehavior;
    final participants = this.participants;
    final proxySessionId = this.proxySessionId;
    final status = this.status;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      if (capabilities != null)
        'Capabilities': capabilities.map((e) => e.toValue()).toList(),
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (endedTimestamp != null)
        'EndedTimestamp': iso8601ToJson(endedTimestamp),
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
      if (geoMatchLevel != null) 'GeoMatchLevel': geoMatchLevel.toValue(),
      if (geoMatchParams != null) 'GeoMatchParams': geoMatchParams,
      if (name != null) 'Name': name,
      if (numberSelectionBehavior != null)
        'NumberSelectionBehavior': numberSelectionBehavior.toValue(),
      if (participants != null) 'Participants': participants,
      if (proxySessionId != null) 'ProxySessionId': proxySessionId,
      if (status != null) 'Status': status.toValue(),
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceConnectorId != null) 'VoiceConnectorId': voiceConnectorId,
    };
  }
}

enum ProxySessionStatus {
  open,
  inProgress,
  closed,
}

extension ProxySessionStatusValueExtension on ProxySessionStatus {
  String toValue() {
    switch (this) {
      case ProxySessionStatus.open:
        return 'Open';
      case ProxySessionStatus.inProgress:
        return 'InProgress';
      case ProxySessionStatus.closed:
        return 'Closed';
    }
  }
}

extension ProxySessionStatusFromString on String {
  ProxySessionStatus toProxySessionStatus() {
    switch (this) {
      case 'Open':
        return ProxySessionStatus.open;
      case 'InProgress':
        return ProxySessionStatus.inProgress;
      case 'Closed':
        return ProxySessionStatus.closed;
    }
    throw Exception('$this is not known in enum ProxySessionStatus');
  }
}

class PutAppInstanceRetentionSettingsResponse {
  /// The time in days to retain data. Data type: number.
  final AppInstanceRetentionSettings? appInstanceRetentionSettings;

  /// The time at which the API deletes data.
  final DateTime? initiateDeletionTimestamp;

  PutAppInstanceRetentionSettingsResponse({
    this.appInstanceRetentionSettings,
    this.initiateDeletionTimestamp,
  });

  factory PutAppInstanceRetentionSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutAppInstanceRetentionSettingsResponse(
      appInstanceRetentionSettings: json['AppInstanceRetentionSettings'] != null
          ? AppInstanceRetentionSettings.fromJson(
              json['AppInstanceRetentionSettings'] as Map<String, dynamic>)
          : null,
      initiateDeletionTimestamp:
          timeStampFromJson(json['InitiateDeletionTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceRetentionSettings = this.appInstanceRetentionSettings;
    final initiateDeletionTimestamp = this.initiateDeletionTimestamp;
    return {
      if (appInstanceRetentionSettings != null)
        'AppInstanceRetentionSettings': appInstanceRetentionSettings,
      if (initiateDeletionTimestamp != null)
        'InitiateDeletionTimestamp':
            unixTimestampToJson(initiateDeletionTimestamp),
    };
  }
}

class PutAppInstanceStreamingConfigurationsResponse {
  /// The streaming configurations of an <code>AppInstance</code>.
  final List<AppInstanceStreamingConfiguration>?
      appInstanceStreamingConfigurations;

  PutAppInstanceStreamingConfigurationsResponse({
    this.appInstanceStreamingConfigurations,
  });

  factory PutAppInstanceStreamingConfigurationsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutAppInstanceStreamingConfigurationsResponse(
      appInstanceStreamingConfigurations:
          (json['AppInstanceStreamingConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => AppInstanceStreamingConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceStreamingConfigurations =
        this.appInstanceStreamingConfigurations;
    return {
      if (appInstanceStreamingConfigurations != null)
        'AppInstanceStreamingConfigurations':
            appInstanceStreamingConfigurations,
    };
  }
}

class PutEventsConfigurationResponse {
  /// The configuration that allows a bot to receive outgoing events. Can be an
  /// HTTPS endpoint or an AWS Lambda function ARN.
  final EventsConfiguration? eventsConfiguration;

  PutEventsConfigurationResponse({
    this.eventsConfiguration,
  });

  factory PutEventsConfigurationResponse.fromJson(Map<String, dynamic> json) {
    return PutEventsConfigurationResponse(
      eventsConfiguration: json['EventsConfiguration'] != null
          ? EventsConfiguration.fromJson(
              json['EventsConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final eventsConfiguration = this.eventsConfiguration;
    return {
      if (eventsConfiguration != null)
        'EventsConfiguration': eventsConfiguration,
    };
  }
}

class PutRetentionSettingsResponse {
  /// The timestamp representing the time at which the specified items are
  /// permanently deleted, in ISO 8601 format.
  final DateTime? initiateDeletionTimestamp;

  /// The retention settings.
  final RetentionSettings? retentionSettings;

  PutRetentionSettingsResponse({
    this.initiateDeletionTimestamp,
    this.retentionSettings,
  });

  factory PutRetentionSettingsResponse.fromJson(Map<String, dynamic> json) {
    return PutRetentionSettingsResponse(
      initiateDeletionTimestamp:
          timeStampFromJson(json['InitiateDeletionTimestamp']),
      retentionSettings: json['RetentionSettings'] != null
          ? RetentionSettings.fromJson(
              json['RetentionSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final initiateDeletionTimestamp = this.initiateDeletionTimestamp;
    final retentionSettings = this.retentionSettings;
    return {
      if (initiateDeletionTimestamp != null)
        'InitiateDeletionTimestamp': iso8601ToJson(initiateDeletionTimestamp),
      if (retentionSettings != null) 'RetentionSettings': retentionSettings,
    };
  }
}

class PutSipMediaApplicationLoggingConfigurationResponse {
  /// The logging configuration of the SIP media application.
  final SipMediaApplicationLoggingConfiguration?
      sipMediaApplicationLoggingConfiguration;

  PutSipMediaApplicationLoggingConfigurationResponse({
    this.sipMediaApplicationLoggingConfiguration,
  });

  factory PutSipMediaApplicationLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutSipMediaApplicationLoggingConfigurationResponse(
      sipMediaApplicationLoggingConfiguration:
          json['SipMediaApplicationLoggingConfiguration'] != null
              ? SipMediaApplicationLoggingConfiguration.fromJson(
                  json['SipMediaApplicationLoggingConfiguration']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationLoggingConfiguration =
        this.sipMediaApplicationLoggingConfiguration;
    return {
      if (sipMediaApplicationLoggingConfiguration != null)
        'SipMediaApplicationLoggingConfiguration':
            sipMediaApplicationLoggingConfiguration,
    };
  }
}

class PutVoiceConnectorEmergencyCallingConfigurationResponse {
  /// The emergency calling configuration details.
  final EmergencyCallingConfiguration? emergencyCallingConfiguration;

  PutVoiceConnectorEmergencyCallingConfigurationResponse({
    this.emergencyCallingConfiguration,
  });

  factory PutVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorEmergencyCallingConfigurationResponse(
      emergencyCallingConfiguration:
          json['EmergencyCallingConfiguration'] != null
              ? EmergencyCallingConfiguration.fromJson(
                  json['EmergencyCallingConfiguration'] as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final emergencyCallingConfiguration = this.emergencyCallingConfiguration;
    return {
      if (emergencyCallingConfiguration != null)
        'EmergencyCallingConfiguration': emergencyCallingConfiguration,
    };
  }
}

class PutVoiceConnectorLoggingConfigurationResponse {
  /// The updated logging configuration details.
  final LoggingConfiguration? loggingConfiguration;

  PutVoiceConnectorLoggingConfigurationResponse({
    this.loggingConfiguration,
  });

  factory PutVoiceConnectorLoggingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorLoggingConfigurationResponse(
      loggingConfiguration: json['LoggingConfiguration'] != null
          ? LoggingConfiguration.fromJson(
              json['LoggingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final loggingConfiguration = this.loggingConfiguration;
    return {
      if (loggingConfiguration != null)
        'LoggingConfiguration': loggingConfiguration,
    };
  }
}

class PutVoiceConnectorOriginationResponse {
  /// The updated origination setting details.
  final Origination? origination;

  PutVoiceConnectorOriginationResponse({
    this.origination,
  });

  factory PutVoiceConnectorOriginationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorOriginationResponse(
      origination: json['Origination'] != null
          ? Origination.fromJson(json['Origination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final origination = this.origination;
    return {
      if (origination != null) 'Origination': origination,
    };
  }
}

class PutVoiceConnectorProxyResponse {
  /// The proxy configuration details.
  final Proxy? proxy;

  PutVoiceConnectorProxyResponse({
    this.proxy,
  });

  factory PutVoiceConnectorProxyResponse.fromJson(Map<String, dynamic> json) {
    return PutVoiceConnectorProxyResponse(
      proxy: json['Proxy'] != null
          ? Proxy.fromJson(json['Proxy'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxy = this.proxy;
    return {
      if (proxy != null) 'Proxy': proxy,
    };
  }
}

class PutVoiceConnectorStreamingConfigurationResponse {
  /// The updated streaming configuration details.
  final StreamingConfiguration? streamingConfiguration;

  PutVoiceConnectorStreamingConfigurationResponse({
    this.streamingConfiguration,
  });

  factory PutVoiceConnectorStreamingConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorStreamingConfigurationResponse(
      streamingConfiguration: json['StreamingConfiguration'] != null
          ? StreamingConfiguration.fromJson(
              json['StreamingConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final streamingConfiguration = this.streamingConfiguration;
    return {
      if (streamingConfiguration != null)
        'StreamingConfiguration': streamingConfiguration,
    };
  }
}

class PutVoiceConnectorTerminationResponse {
  /// The updated termination setting details.
  final Termination? termination;

  PutVoiceConnectorTerminationResponse({
    this.termination,
  });

  factory PutVoiceConnectorTerminationResponse.fromJson(
      Map<String, dynamic> json) {
    return PutVoiceConnectorTerminationResponse(
      termination: json['Termination'] != null
          ? Termination.fromJson(json['Termination'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final termination = this.termination;
    return {
      if (termination != null) 'Termination': termination,
    };
  }
}

class RedactChannelMessageResponse {
  /// The ARN of the channel containing the messages that you want to redact.
  final String? channelArn;

  /// The ID of the message being redacted.
  final String? messageId;

  RedactChannelMessageResponse({
    this.channelArn,
    this.messageId,
  });

  factory RedactChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return RedactChannelMessageResponse(
      channelArn: json['ChannelArn'] as String?,
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final messageId = this.messageId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

class RedactConversationMessageResponse {
  RedactConversationMessageResponse();

  factory RedactConversationMessageResponse.fromJson(Map<String, dynamic> _) {
    return RedactConversationMessageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RedactRoomMessageResponse {
  RedactRoomMessageResponse();

  factory RedactRoomMessageResponse.fromJson(Map<String, dynamic> _) {
    return RedactRoomMessageResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RegenerateSecurityTokenResponse {
  /// A resource that allows Enterprise account administrators to configure an
  /// interface that receives events from Amazon Chime.
  final Bot? bot;

  RegenerateSecurityTokenResponse({
    this.bot,
  });

  factory RegenerateSecurityTokenResponse.fromJson(Map<String, dynamic> json) {
    return RegenerateSecurityTokenResponse(
      bot: json['Bot'] != null
          ? Bot.fromJson(json['Bot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bot = this.bot;
    return {
      if (bot != null) 'Bot': bot,
    };
  }
}

enum RegistrationStatus {
  unregistered,
  registered,
  suspended,
}

extension RegistrationStatusValueExtension on RegistrationStatus {
  String toValue() {
    switch (this) {
      case RegistrationStatus.unregistered:
        return 'Unregistered';
      case RegistrationStatus.registered:
        return 'Registered';
      case RegistrationStatus.suspended:
        return 'Suspended';
    }
  }
}

extension RegistrationStatusFromString on String {
  RegistrationStatus toRegistrationStatus() {
    switch (this) {
      case 'Unregistered':
        return RegistrationStatus.unregistered;
      case 'Registered':
        return RegistrationStatus.registered;
      case 'Suspended':
        return RegistrationStatus.suspended;
    }
    throw Exception('$this is not known in enum RegistrationStatus');
  }
}

class ResetPersonalPINResponse {
  /// The user details and new personal meeting PIN.
  final User? user;

  ResetPersonalPINResponse({
    this.user,
  });

  factory ResetPersonalPINResponse.fromJson(Map<String, dynamic> json) {
    return ResetPersonalPINResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

class RestorePhoneNumberResponse {
  /// The phone number details.
  final PhoneNumber? phoneNumber;

  RestorePhoneNumberResponse({
    this.phoneNumber,
  });

  factory RestorePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return RestorePhoneNumberResponse(
      phoneNumber: json['PhoneNumber'] != null
          ? PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

/// The retention settings for an Amazon Chime Enterprise account that determine
/// how long to retain items such as chat-room messages and chat-conversation
/// messages.
class RetentionSettings {
  /// The chat conversation retention settings.
  final ConversationRetentionSettings? conversationRetentionSettings;

  /// The chat room retention settings.
  final RoomRetentionSettings? roomRetentionSettings;

  RetentionSettings({
    this.conversationRetentionSettings,
    this.roomRetentionSettings,
  });

  factory RetentionSettings.fromJson(Map<String, dynamic> json) {
    return RetentionSettings(
      conversationRetentionSettings:
          json['ConversationRetentionSettings'] != null
              ? ConversationRetentionSettings.fromJson(
                  json['ConversationRetentionSettings'] as Map<String, dynamic>)
              : null,
      roomRetentionSettings: json['RoomRetentionSettings'] != null
          ? RoomRetentionSettings.fromJson(
              json['RoomRetentionSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final conversationRetentionSettings = this.conversationRetentionSettings;
    final roomRetentionSettings = this.roomRetentionSettings;
    return {
      if (conversationRetentionSettings != null)
        'ConversationRetentionSettings': conversationRetentionSettings,
      if (roomRetentionSettings != null)
        'RoomRetentionSettings': roomRetentionSettings,
    };
  }
}

/// The Amazon Chime chat room details.
class Room {
  /// The Amazon Chime account ID.
  final String? accountId;

  /// The identifier of the room creator.
  final String? createdBy;

  /// The room creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The room name.
  final String? name;

  /// The room ID.
  final String? roomId;

  /// The room update timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  Room({
    this.accountId,
    this.createdBy,
    this.createdTimestamp,
    this.name,
    this.roomId,
    this.updatedTimestamp,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      accountId: json['AccountId'] as String?,
      createdBy: json['CreatedBy'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
      roomId: json['RoomId'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    final createdBy = this.createdBy;
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    final roomId = this.roomId;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (accountId != null) 'AccountId': accountId,
      if (createdBy != null) 'CreatedBy': createdBy,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
      if (roomId != null) 'RoomId': roomId,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// The room membership details.
class RoomMembership {
  /// The identifier of the user that invited the room member.
  final String? invitedBy;

  /// The member details, such as email address, name, member ID, and member type.
  final Member? member;

  /// The membership role.
  final RoomMembershipRole? role;

  /// The room ID.
  final String? roomId;

  /// The room membership update timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  RoomMembership({
    this.invitedBy,
    this.member,
    this.role,
    this.roomId,
    this.updatedTimestamp,
  });

  factory RoomMembership.fromJson(Map<String, dynamic> json) {
    return RoomMembership(
      invitedBy: json['InvitedBy'] as String?,
      member: json['Member'] != null
          ? Member.fromJson(json['Member'] as Map<String, dynamic>)
          : null,
      role: (json['Role'] as String?)?.toRoomMembershipRole(),
      roomId: json['RoomId'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final invitedBy = this.invitedBy;
    final member = this.member;
    final role = this.role;
    final roomId = this.roomId;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (invitedBy != null) 'InvitedBy': invitedBy,
      if (member != null) 'Member': member,
      if (role != null) 'Role': role.toValue(),
      if (roomId != null) 'RoomId': roomId,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

enum RoomMembershipRole {
  administrator,
  member,
}

extension RoomMembershipRoleValueExtension on RoomMembershipRole {
  String toValue() {
    switch (this) {
      case RoomMembershipRole.administrator:
        return 'Administrator';
      case RoomMembershipRole.member:
        return 'Member';
    }
  }
}

extension RoomMembershipRoleFromString on String {
  RoomMembershipRole toRoomMembershipRole() {
    switch (this) {
      case 'Administrator':
        return RoomMembershipRole.administrator;
      case 'Member':
        return RoomMembershipRole.member;
    }
    throw Exception('$this is not known in enum RoomMembershipRole');
  }
}

/// The retention settings that determine how long to retain chat-room messages
/// for an Amazon Chime Enterprise account.
class RoomRetentionSettings {
  /// The number of days for which to retain chat-room messages.
  final int? retentionDays;

  RoomRetentionSettings({
    this.retentionDays,
  });

  factory RoomRetentionSettings.fromJson(Map<String, dynamic> json) {
    return RoomRetentionSettings(
      retentionDays: json['RetentionDays'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final retentionDays = this.retentionDays;
    return {
      if (retentionDays != null) 'RetentionDays': retentionDays,
    };
  }
}

class SearchAvailablePhoneNumbersResponse {
  /// List of phone numbers, in E.164 format.
  final List<String>? e164PhoneNumbers;

  /// The token used to retrieve the next page of search results.
  final String? nextToken;

  SearchAvailablePhoneNumbersResponse({
    this.e164PhoneNumbers,
    this.nextToken,
  });

  factory SearchAvailablePhoneNumbersResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchAvailablePhoneNumbersResponse(
      e164PhoneNumbers: (json['E164PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final e164PhoneNumbers = this.e164PhoneNumbers;
    final nextToken = this.nextToken;
    return {
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
      if (nextToken != null) 'NextToken': nextToken,
    };
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

class SendChannelMessageResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ID string assigned to each message.
  final String? messageId;

  SendChannelMessageResponse({
    this.channelArn,
    this.messageId,
  });

  factory SendChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return SendChannelMessageResponse(
      channelArn: json['ChannelArn'] as String?,
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final messageId = this.messageId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (messageId != null) 'MessageId': messageId,
    };
  }
}

/// An Active Directory (AD) group whose members are granted permission to act
/// as delegates.
class SigninDelegateGroup {
  /// The group name.
  final String? groupName;

  SigninDelegateGroup({
    this.groupName,
  });

  factory SigninDelegateGroup.fromJson(Map<String, dynamic> json) {
    return SigninDelegateGroup(
      groupName: json['GroupName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupName = this.groupName;
    return {
      if (groupName != null) 'GroupName': groupName,
    };
  }
}

/// The details of the SIP media application, including name and endpoints. An
/// AWS account can have multiple SIP media applications.
class SipMediaApplication {
  /// The AWS Region in which the SIP media application is created.
  final String? awsRegion;

  /// The SIP media application creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// List of endpoints for SIP media application. Currently, only one endpoint
  /// per SIP media application is permitted.
  final List<SipMediaApplicationEndpoint>? endpoints;

  /// The name of the SIP media application.
  final String? name;

  /// The SIP media application ID.
  final String? sipMediaApplicationId;

  /// The SIP media application updated timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  SipMediaApplication({
    this.awsRegion,
    this.createdTimestamp,
    this.endpoints,
    this.name,
    this.sipMediaApplicationId,
    this.updatedTimestamp,
  });

  factory SipMediaApplication.fromJson(Map<String, dynamic> json) {
    return SipMediaApplication(
      awsRegion: json['AwsRegion'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endpoints: (json['Endpoints'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SipMediaApplicationEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      name: json['Name'] as String?,
      sipMediaApplicationId: json['SipMediaApplicationId'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final createdTimestamp = this.createdTimestamp;
    final endpoints = this.endpoints;
    final name = this.name;
    final sipMediaApplicationId = this.sipMediaApplicationId;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (endpoints != null) 'Endpoints': endpoints,
      if (name != null) 'Name': name,
      if (sipMediaApplicationId != null)
        'SipMediaApplicationId': sipMediaApplicationId,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// A <code>Call</code> instance for a SIP media application.
class SipMediaApplicationCall {
  /// The transaction ID of a call.
  final String? transactionId;

  SipMediaApplicationCall({
    this.transactionId,
  });

  factory SipMediaApplicationCall.fromJson(Map<String, dynamic> json) {
    return SipMediaApplicationCall(
      transactionId: json['TransactionId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final transactionId = this.transactionId;
    return {
      if (transactionId != null) 'TransactionId': transactionId,
    };
  }
}

/// The endpoint assigned to the SIP media application.
class SipMediaApplicationEndpoint {
  /// Valid Amazon Resource Name (ARN) of the Lambda function, version, or alias.
  /// The function must be created in the same AWS Region as the SIP media
  /// application.
  final String? lambdaArn;

  SipMediaApplicationEndpoint({
    this.lambdaArn,
  });

  factory SipMediaApplicationEndpoint.fromJson(Map<String, dynamic> json) {
    return SipMediaApplicationEndpoint(
      lambdaArn: json['LambdaArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lambdaArn = this.lambdaArn;
    return {
      if (lambdaArn != null) 'LambdaArn': lambdaArn,
    };
  }
}

/// Logging configuration of the SIP media application.
class SipMediaApplicationLoggingConfiguration {
  /// Enables application message logs for the SIP media application.
  final bool? enableSipMediaApplicationMessageLogs;

  SipMediaApplicationLoggingConfiguration({
    this.enableSipMediaApplicationMessageLogs,
  });

  factory SipMediaApplicationLoggingConfiguration.fromJson(
      Map<String, dynamic> json) {
    return SipMediaApplicationLoggingConfiguration(
      enableSipMediaApplicationMessageLogs:
          json['EnableSipMediaApplicationMessageLogs'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableSipMediaApplicationMessageLogs =
        this.enableSipMediaApplicationMessageLogs;
    return {
      if (enableSipMediaApplicationMessageLogs != null)
        'EnableSipMediaApplicationMessageLogs':
            enableSipMediaApplicationMessageLogs,
    };
  }
}

/// The SIP rule details, including name, triggers, and target applications. An
/// AWS account can have multiple SIP rules.
class SipRule {
  /// The time at which the SIP rule was created, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// Indicates whether the SIP rule is enabled or disabled. You must disable a
  /// rule before you can delete it.
  final bool? disabled;

  /// The name of the SIP rule.
  final String? name;

  /// The SIP rule ID.
  final String? sipRuleId;

  /// Target SIP media application and other details, such as priority and AWS
  /// Region, to be specified in the SIP rule. Only one SIP rule per AWS Region
  /// can be provided.
  final List<SipRuleTargetApplication>? targetApplications;

  /// The type of trigger assigned to the SIP rule in <code>TriggerValue</code>,
  /// currently <code>RequestUriHostname</code> or <code>ToPhoneNumber</code>.
  final SipRuleTriggerType? triggerType;

  /// If <code>TriggerType</code> is <code>RequestUriHostname</code>, then the
  /// value can be the outbound host name of the Amazon Chime Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code>, then the value can
  /// be a customer-owned phone number in E164 format. <code>SipRule</code> is
  /// triggered when a SIP rule requests host name or <code>ToPhoneNumber</code>
  /// matches in the incoming SIP request.
  final String? triggerValue;

  /// The time at which the SIP rule was last updated, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  SipRule({
    this.createdTimestamp,
    this.disabled,
    this.name,
    this.sipRuleId,
    this.targetApplications,
    this.triggerType,
    this.triggerValue,
    this.updatedTimestamp,
  });

  factory SipRule.fromJson(Map<String, dynamic> json) {
    return SipRule(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      disabled: json['Disabled'] as bool?,
      name: json['Name'] as String?,
      sipRuleId: json['SipRuleId'] as String?,
      targetApplications: (json['TargetApplications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SipRuleTargetApplication.fromJson(e as Map<String, dynamic>))
          .toList(),
      triggerType: (json['TriggerType'] as String?)?.toSipRuleTriggerType(),
      triggerValue: json['TriggerValue'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final disabled = this.disabled;
    final name = this.name;
    final sipRuleId = this.sipRuleId;
    final targetApplications = this.targetApplications;
    final triggerType = this.triggerType;
    final triggerValue = this.triggerValue;
    final updatedTimestamp = this.updatedTimestamp;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (disabled != null) 'Disabled': disabled,
      if (name != null) 'Name': name,
      if (sipRuleId != null) 'SipRuleId': sipRuleId,
      if (targetApplications != null) 'TargetApplications': targetApplications,
      if (triggerType != null) 'TriggerType': triggerType.toValue(),
      if (triggerValue != null) 'TriggerValue': triggerValue,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

/// Target SIP media application and other details, such as priority and AWS
/// Region, to be specified in the SIP rule. Only one SIP rule per AWS Region
/// can be provided.
class SipRuleTargetApplication {
  /// The AWS Region of the target application.
  final String? awsRegion;

  /// Priority of the SIP media application in the target list.
  final int? priority;

  /// The SIP media application ID.
  final String? sipMediaApplicationId;

  SipRuleTargetApplication({
    this.awsRegion,
    this.priority,
    this.sipMediaApplicationId,
  });

  factory SipRuleTargetApplication.fromJson(Map<String, dynamic> json) {
    return SipRuleTargetApplication(
      awsRegion: json['AwsRegion'] as String?,
      priority: json['Priority'] as int?,
      sipMediaApplicationId: json['SipMediaApplicationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final priority = this.priority;
    final sipMediaApplicationId = this.sipMediaApplicationId;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion,
      if (priority != null) 'Priority': priority,
      if (sipMediaApplicationId != null)
        'SipMediaApplicationId': sipMediaApplicationId,
    };
  }
}

enum SipRuleTriggerType {
  toPhoneNumber,
  requestUriHostname,
}

extension SipRuleTriggerTypeValueExtension on SipRuleTriggerType {
  String toValue() {
    switch (this) {
      case SipRuleTriggerType.toPhoneNumber:
        return 'ToPhoneNumber';
      case SipRuleTriggerType.requestUriHostname:
        return 'RequestUriHostname';
    }
  }
}

extension SipRuleTriggerTypeFromString on String {
  SipRuleTriggerType toSipRuleTriggerType() {
    switch (this) {
      case 'ToPhoneNumber':
        return SipRuleTriggerType.toPhoneNumber;
      case 'RequestUriHostname':
        return SipRuleTriggerType.requestUriHostname;
    }
    throw Exception('$this is not known in enum SipRuleTriggerType');
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

class StartMeetingTranscriptionResponse {
  StartMeetingTranscriptionResponse();

  factory StartMeetingTranscriptionResponse.fromJson(Map<String, dynamic> _) {
    return StartMeetingTranscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StopMeetingTranscriptionResponse {
  StopMeetingTranscriptionResponse();

  factory StopMeetingTranscriptionResponse.fromJson(Map<String, dynamic> _) {
    return StopMeetingTranscriptionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The streaming configuration associated with an Amazon Chime Voice Connector.
/// Specifies whether media streaming is enabled for sending to Amazon Kinesis,
/// and shows the retention period for the Amazon Kinesis data, in hours.
class StreamingConfiguration {
  /// The retention period, in hours, for the Amazon Kinesis data.
  final int dataRetentionInHours;

  /// When true, media streaming to Amazon Kinesis is turned off.
  final bool? disabled;

  /// The streaming notification targets.
  final List<StreamingNotificationTarget>? streamingNotificationTargets;

  StreamingConfiguration({
    required this.dataRetentionInHours,
    this.disabled,
    this.streamingNotificationTargets,
  });

  factory StreamingConfiguration.fromJson(Map<String, dynamic> json) {
    return StreamingConfiguration(
      dataRetentionInHours: json['DataRetentionInHours'] as int,
      disabled: json['Disabled'] as bool?,
      streamingNotificationTargets: (json['StreamingNotificationTargets']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              StreamingNotificationTarget.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataRetentionInHours = this.dataRetentionInHours;
    final disabled = this.disabled;
    final streamingNotificationTargets = this.streamingNotificationTargets;
    return {
      'DataRetentionInHours': dataRetentionInHours,
      if (disabled != null) 'Disabled': disabled,
      if (streamingNotificationTargets != null)
        'StreamingNotificationTargets': streamingNotificationTargets,
    };
  }
}

/// The targeted recipient for a streaming configuration notification.
class StreamingNotificationTarget {
  /// The streaming notification target.
  final NotificationTarget notificationTarget;

  StreamingNotificationTarget({
    required this.notificationTarget,
  });

  factory StreamingNotificationTarget.fromJson(Map<String, dynamic> json) {
    return StreamingNotificationTarget(
      notificationTarget:
          (json['NotificationTarget'] as String).toNotificationTarget(),
    );
  }

  Map<String, dynamic> toJson() {
    final notificationTarget = this.notificationTarget;
    return {
      'NotificationTarget': notificationTarget.toValue(),
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

/// Settings that allow management of telephony permissions for an Amazon Chime
/// user, such as inbound and outbound calling and text messaging.
class TelephonySettings {
  /// Allows or denies inbound calling.
  final bool inboundCalling;

  /// Allows or denies outbound calling.
  final bool outboundCalling;

  /// Allows or denies SMS messaging.
  final bool sms;

  TelephonySettings({
    required this.inboundCalling,
    required this.outboundCalling,
    required this.sms,
  });

  factory TelephonySettings.fromJson(Map<String, dynamic> json) {
    return TelephonySettings(
      inboundCalling: json['InboundCalling'] as bool,
      outboundCalling: json['OutboundCalling'] as bool,
      sms: json['SMS'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    final inboundCalling = this.inboundCalling;
    final outboundCalling = this.outboundCalling;
    final sms = this.sms;
    return {
      'InboundCalling': inboundCalling,
      'OutboundCalling': outboundCalling,
      'SMS': sms,
    };
  }
}

/// Termination settings enable your SIP hosts to make outbound calls using your
/// Amazon Chime Voice Connector.
class Termination {
  /// The countries to which calls are allowed, in ISO 3166-1 alpha-2 format.
  /// Required.
  final List<String>? callingRegions;

  /// The IP addresses allowed to make calls, in CIDR format. Required.
  final List<String>? cidrAllowedList;

  /// The limit on calls per second. Max value based on account service quota.
  /// Default value of 1.
  final int? cpsLimit;

  /// The default caller ID phone number.
  final String? defaultPhoneNumber;

  /// When termination settings are disabled, outbound calls can not be made.
  final bool? disabled;

  Termination({
    this.callingRegions,
    this.cidrAllowedList,
    this.cpsLimit,
    this.defaultPhoneNumber,
    this.disabled,
  });

  factory Termination.fromJson(Map<String, dynamic> json) {
    return Termination(
      callingRegions: (json['CallingRegions'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cidrAllowedList: (json['CidrAllowedList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      cpsLimit: json['CpsLimit'] as int?,
      defaultPhoneNumber: json['DefaultPhoneNumber'] as String?,
      disabled: json['Disabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final callingRegions = this.callingRegions;
    final cidrAllowedList = this.cidrAllowedList;
    final cpsLimit = this.cpsLimit;
    final defaultPhoneNumber = this.defaultPhoneNumber;
    final disabled = this.disabled;
    return {
      if (callingRegions != null) 'CallingRegions': callingRegions,
      if (cidrAllowedList != null) 'CidrAllowedList': cidrAllowedList,
      if (cpsLimit != null) 'CpsLimit': cpsLimit,
      if (defaultPhoneNumber != null) 'DefaultPhoneNumber': defaultPhoneNumber,
      if (disabled != null) 'Disabled': disabled,
    };
  }
}

/// The termination health details, including the source IP address and
/// timestamp of the last successful SIP <code>OPTIONS</code> message from your
/// SIP infrastructure.
class TerminationHealth {
  /// The source IP address.
  final String? source;

  /// The timestamp, in ISO 8601 format.
  final DateTime? timestamp;

  TerminationHealth({
    this.source,
    this.timestamp,
  });

  factory TerminationHealth.fromJson(Map<String, dynamic> json) {
    return TerminationHealth(
      source: json['Source'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final source = this.source;
    final timestamp = this.timestamp;
    return {
      if (source != null) 'Source': source,
      if (timestamp != null) 'Timestamp': iso8601ToJson(timestamp),
    };
  }
}

enum TranscribeContentIdentificationType {
  pii,
}

extension TranscribeContentIdentificationTypeValueExtension
    on TranscribeContentIdentificationType {
  String toValue() {
    switch (this) {
      case TranscribeContentIdentificationType.pii:
        return 'PII';
    }
  }
}

extension TranscribeContentIdentificationTypeFromString on String {
  TranscribeContentIdentificationType toTranscribeContentIdentificationType() {
    switch (this) {
      case 'PII':
        return TranscribeContentIdentificationType.pii;
    }
    throw Exception(
        '$this is not known in enum TranscribeContentIdentificationType');
  }
}

enum TranscribeContentRedactionType {
  pii,
}

extension TranscribeContentRedactionTypeValueExtension
    on TranscribeContentRedactionType {
  String toValue() {
    switch (this) {
      case TranscribeContentRedactionType.pii:
        return 'PII';
    }
  }
}

extension TranscribeContentRedactionTypeFromString on String {
  TranscribeContentRedactionType toTranscribeContentRedactionType() {
    switch (this) {
      case 'PII':
        return TranscribeContentRedactionType.pii;
    }
    throw Exception(
        '$this is not known in enum TranscribeContentRedactionType');
  }
}

enum TranscribeLanguageCode {
  enUs,
  enGb,
  esUs,
  frCa,
  frFr,
  enAu,
  itIt,
  deDe,
  ptBr,
  jaJp,
  koKr,
  zhCn,
  thTh,
  hiIn,
}

extension TranscribeLanguageCodeValueExtension on TranscribeLanguageCode {
  String toValue() {
    switch (this) {
      case TranscribeLanguageCode.enUs:
        return 'en-US';
      case TranscribeLanguageCode.enGb:
        return 'en-GB';
      case TranscribeLanguageCode.esUs:
        return 'es-US';
      case TranscribeLanguageCode.frCa:
        return 'fr-CA';
      case TranscribeLanguageCode.frFr:
        return 'fr-FR';
      case TranscribeLanguageCode.enAu:
        return 'en-AU';
      case TranscribeLanguageCode.itIt:
        return 'it-IT';
      case TranscribeLanguageCode.deDe:
        return 'de-DE';
      case TranscribeLanguageCode.ptBr:
        return 'pt-BR';
      case TranscribeLanguageCode.jaJp:
        return 'ja-JP';
      case TranscribeLanguageCode.koKr:
        return 'ko-KR';
      case TranscribeLanguageCode.zhCn:
        return 'zh-CN';
      case TranscribeLanguageCode.thTh:
        return 'th-TH';
      case TranscribeLanguageCode.hiIn:
        return 'hi-IN';
    }
  }
}

extension TranscribeLanguageCodeFromString on String {
  TranscribeLanguageCode toTranscribeLanguageCode() {
    switch (this) {
      case 'en-US':
        return TranscribeLanguageCode.enUs;
      case 'en-GB':
        return TranscribeLanguageCode.enGb;
      case 'es-US':
        return TranscribeLanguageCode.esUs;
      case 'fr-CA':
        return TranscribeLanguageCode.frCa;
      case 'fr-FR':
        return TranscribeLanguageCode.frFr;
      case 'en-AU':
        return TranscribeLanguageCode.enAu;
      case 'it-IT':
        return TranscribeLanguageCode.itIt;
      case 'de-DE':
        return TranscribeLanguageCode.deDe;
      case 'pt-BR':
        return TranscribeLanguageCode.ptBr;
      case 'ja-JP':
        return TranscribeLanguageCode.jaJp;
      case 'ko-KR':
        return TranscribeLanguageCode.koKr;
      case 'zh-CN':
        return TranscribeLanguageCode.zhCn;
      case 'th-TH':
        return TranscribeLanguageCode.thTh;
      case 'hi-IN':
        return TranscribeLanguageCode.hiIn;
    }
    throw Exception('$this is not known in enum TranscribeLanguageCode');
  }
}

enum TranscribeMedicalContentIdentificationType {
  phi,
}

extension TranscribeMedicalContentIdentificationTypeValueExtension
    on TranscribeMedicalContentIdentificationType {
  String toValue() {
    switch (this) {
      case TranscribeMedicalContentIdentificationType.phi:
        return 'PHI';
    }
  }
}

extension TranscribeMedicalContentIdentificationTypeFromString on String {
  TranscribeMedicalContentIdentificationType
      toTranscribeMedicalContentIdentificationType() {
    switch (this) {
      case 'PHI':
        return TranscribeMedicalContentIdentificationType.phi;
    }
    throw Exception(
        '$this is not known in enum TranscribeMedicalContentIdentificationType');
  }
}

enum TranscribeMedicalLanguageCode {
  enUs,
}

extension TranscribeMedicalLanguageCodeValueExtension
    on TranscribeMedicalLanguageCode {
  String toValue() {
    switch (this) {
      case TranscribeMedicalLanguageCode.enUs:
        return 'en-US';
    }
  }
}

extension TranscribeMedicalLanguageCodeFromString on String {
  TranscribeMedicalLanguageCode toTranscribeMedicalLanguageCode() {
    switch (this) {
      case 'en-US':
        return TranscribeMedicalLanguageCode.enUs;
    }
    throw Exception('$this is not known in enum TranscribeMedicalLanguageCode');
  }
}

enum TranscribeMedicalRegion {
  usEast_1,
  usEast_2,
  usWest_2,
  apSoutheast_2,
  caCentral_1,
  euWest_1,
  auto,
}

extension TranscribeMedicalRegionValueExtension on TranscribeMedicalRegion {
  String toValue() {
    switch (this) {
      case TranscribeMedicalRegion.usEast_1:
        return 'us-east-1';
      case TranscribeMedicalRegion.usEast_2:
        return 'us-east-2';
      case TranscribeMedicalRegion.usWest_2:
        return 'us-west-2';
      case TranscribeMedicalRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case TranscribeMedicalRegion.caCentral_1:
        return 'ca-central-1';
      case TranscribeMedicalRegion.euWest_1:
        return 'eu-west-1';
      case TranscribeMedicalRegion.auto:
        return 'auto';
    }
  }
}

extension TranscribeMedicalRegionFromString on String {
  TranscribeMedicalRegion toTranscribeMedicalRegion() {
    switch (this) {
      case 'us-east-1':
        return TranscribeMedicalRegion.usEast_1;
      case 'us-east-2':
        return TranscribeMedicalRegion.usEast_2;
      case 'us-west-2':
        return TranscribeMedicalRegion.usWest_2;
      case 'ap-southeast-2':
        return TranscribeMedicalRegion.apSoutheast_2;
      case 'ca-central-1':
        return TranscribeMedicalRegion.caCentral_1;
      case 'eu-west-1':
        return TranscribeMedicalRegion.euWest_1;
      case 'auto':
        return TranscribeMedicalRegion.auto;
    }
    throw Exception('$this is not known in enum TranscribeMedicalRegion');
  }
}

enum TranscribeMedicalSpecialty {
  primarycare,
  cardiology,
  neurology,
  oncology,
  radiology,
  urology,
}

extension TranscribeMedicalSpecialtyValueExtension
    on TranscribeMedicalSpecialty {
  String toValue() {
    switch (this) {
      case TranscribeMedicalSpecialty.primarycare:
        return 'PRIMARYCARE';
      case TranscribeMedicalSpecialty.cardiology:
        return 'CARDIOLOGY';
      case TranscribeMedicalSpecialty.neurology:
        return 'NEUROLOGY';
      case TranscribeMedicalSpecialty.oncology:
        return 'ONCOLOGY';
      case TranscribeMedicalSpecialty.radiology:
        return 'RADIOLOGY';
      case TranscribeMedicalSpecialty.urology:
        return 'UROLOGY';
    }
  }
}

extension TranscribeMedicalSpecialtyFromString on String {
  TranscribeMedicalSpecialty toTranscribeMedicalSpecialty() {
    switch (this) {
      case 'PRIMARYCARE':
        return TranscribeMedicalSpecialty.primarycare;
      case 'CARDIOLOGY':
        return TranscribeMedicalSpecialty.cardiology;
      case 'NEUROLOGY':
        return TranscribeMedicalSpecialty.neurology;
      case 'ONCOLOGY':
        return TranscribeMedicalSpecialty.oncology;
      case 'RADIOLOGY':
        return TranscribeMedicalSpecialty.radiology;
      case 'UROLOGY':
        return TranscribeMedicalSpecialty.urology;
    }
    throw Exception('$this is not known in enum TranscribeMedicalSpecialty');
  }
}

enum TranscribeMedicalType {
  conversation,
  dictation,
}

extension TranscribeMedicalTypeValueExtension on TranscribeMedicalType {
  String toValue() {
    switch (this) {
      case TranscribeMedicalType.conversation:
        return 'CONVERSATION';
      case TranscribeMedicalType.dictation:
        return 'DICTATION';
    }
  }
}

extension TranscribeMedicalTypeFromString on String {
  TranscribeMedicalType toTranscribeMedicalType() {
    switch (this) {
      case 'CONVERSATION':
        return TranscribeMedicalType.conversation;
      case 'DICTATION':
        return TranscribeMedicalType.dictation;
    }
    throw Exception('$this is not known in enum TranscribeMedicalType');
  }
}

enum TranscribePartialResultsStability {
  low,
  medium,
  high,
}

extension TranscribePartialResultsStabilityValueExtension
    on TranscribePartialResultsStability {
  String toValue() {
    switch (this) {
      case TranscribePartialResultsStability.low:
        return 'low';
      case TranscribePartialResultsStability.medium:
        return 'medium';
      case TranscribePartialResultsStability.high:
        return 'high';
    }
  }
}

extension TranscribePartialResultsStabilityFromString on String {
  TranscribePartialResultsStability toTranscribePartialResultsStability() {
    switch (this) {
      case 'low':
        return TranscribePartialResultsStability.low;
      case 'medium':
        return TranscribePartialResultsStability.medium;
      case 'high':
        return TranscribePartialResultsStability.high;
    }
    throw Exception(
        '$this is not known in enum TranscribePartialResultsStability');
  }
}

enum TranscribeRegion {
  usEast_2,
  usEast_1,
  usWest_2,
  apNortheast_2,
  apSoutheast_2,
  apNortheast_1,
  caCentral_1,
  euCentral_1,
  euWest_1,
  euWest_2,
  saEast_1,
  auto,
}

extension TranscribeRegionValueExtension on TranscribeRegion {
  String toValue() {
    switch (this) {
      case TranscribeRegion.usEast_2:
        return 'us-east-2';
      case TranscribeRegion.usEast_1:
        return 'us-east-1';
      case TranscribeRegion.usWest_2:
        return 'us-west-2';
      case TranscribeRegion.apNortheast_2:
        return 'ap-northeast-2';
      case TranscribeRegion.apSoutheast_2:
        return 'ap-southeast-2';
      case TranscribeRegion.apNortheast_1:
        return 'ap-northeast-1';
      case TranscribeRegion.caCentral_1:
        return 'ca-central-1';
      case TranscribeRegion.euCentral_1:
        return 'eu-central-1';
      case TranscribeRegion.euWest_1:
        return 'eu-west-1';
      case TranscribeRegion.euWest_2:
        return 'eu-west-2';
      case TranscribeRegion.saEast_1:
        return 'sa-east-1';
      case TranscribeRegion.auto:
        return 'auto';
    }
  }
}

extension TranscribeRegionFromString on String {
  TranscribeRegion toTranscribeRegion() {
    switch (this) {
      case 'us-east-2':
        return TranscribeRegion.usEast_2;
      case 'us-east-1':
        return TranscribeRegion.usEast_1;
      case 'us-west-2':
        return TranscribeRegion.usWest_2;
      case 'ap-northeast-2':
        return TranscribeRegion.apNortheast_2;
      case 'ap-southeast-2':
        return TranscribeRegion.apSoutheast_2;
      case 'ap-northeast-1':
        return TranscribeRegion.apNortheast_1;
      case 'ca-central-1':
        return TranscribeRegion.caCentral_1;
      case 'eu-central-1':
        return TranscribeRegion.euCentral_1;
      case 'eu-west-1':
        return TranscribeRegion.euWest_1;
      case 'eu-west-2':
        return TranscribeRegion.euWest_2;
      case 'sa-east-1':
        return TranscribeRegion.saEast_1;
      case 'auto':
        return TranscribeRegion.auto;
    }
    throw Exception('$this is not known in enum TranscribeRegion');
  }
}

enum TranscribeVocabularyFilterMethod {
  remove,
  mask,
  tag,
}

extension TranscribeVocabularyFilterMethodValueExtension
    on TranscribeVocabularyFilterMethod {
  String toValue() {
    switch (this) {
      case TranscribeVocabularyFilterMethod.remove:
        return 'remove';
      case TranscribeVocabularyFilterMethod.mask:
        return 'mask';
      case TranscribeVocabularyFilterMethod.tag:
        return 'tag';
    }
  }
}

extension TranscribeVocabularyFilterMethodFromString on String {
  TranscribeVocabularyFilterMethod toTranscribeVocabularyFilterMethod() {
    switch (this) {
      case 'remove':
        return TranscribeVocabularyFilterMethod.remove;
      case 'mask':
        return TranscribeVocabularyFilterMethod.mask;
      case 'tag':
        return TranscribeVocabularyFilterMethod.tag;
    }
    throw Exception(
        '$this is not known in enum TranscribeVocabularyFilterMethod');
  }
}

/// The configuration for the current transcription operation. Must contain
/// <code>EngineTranscribeSettings</code> or
/// <code>EngineTranscribeMedicalSettings</code>.
class TranscriptionConfiguration {
  /// The transcription configuration settings passed to Amazon Transcribe
  /// Medical.
  final EngineTranscribeMedicalSettings? engineTranscribeMedicalSettings;

  /// The transcription configuration settings passed to Amazon Transcribe.
  final EngineTranscribeSettings? engineTranscribeSettings;

  TranscriptionConfiguration({
    this.engineTranscribeMedicalSettings,
    this.engineTranscribeSettings,
  });

  Map<String, dynamic> toJson() {
    final engineTranscribeMedicalSettings =
        this.engineTranscribeMedicalSettings;
    final engineTranscribeSettings = this.engineTranscribeSettings;
    return {
      if (engineTranscribeMedicalSettings != null)
        'EngineTranscribeMedicalSettings': engineTranscribeMedicalSettings,
      if (engineTranscribeSettings != null)
        'EngineTranscribeSettings': engineTranscribeSettings,
    };
  }
}

class UpdateAccountResponse {
  /// The updated Amazon Chime account details.
  final Account? account;

  UpdateAccountResponse({
    this.account,
  });

  factory UpdateAccountResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAccountResponse(
      account: json['Account'] != null
          ? Account.fromJson(json['Account'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final account = this.account;
    return {
      if (account != null) 'Account': account,
    };
  }
}

class UpdateAccountSettingsResponse {
  UpdateAccountSettingsResponse();

  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAccountSettingsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAppInstanceResponse {
  /// The ARN of the <code>AppInstance</code>.
  final String? appInstanceArn;

  UpdateAppInstanceResponse({
    this.appInstanceArn,
  });

  factory UpdateAppInstanceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppInstanceResponse(
      appInstanceArn: json['AppInstanceArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceArn = this.appInstanceArn;
    return {
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
    };
  }
}

class UpdateAppInstanceUserResponse {
  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  UpdateAppInstanceUserResponse({
    this.appInstanceUserArn,
  });

  factory UpdateAppInstanceUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppInstanceUserResponse(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
    };
  }
}

class UpdateBotResponse {
  /// The updated bot details.
  final Bot? bot;

  UpdateBotResponse({
    this.bot,
  });

  factory UpdateBotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBotResponse(
      bot: json['Bot'] != null
          ? Bot.fromJson(json['Bot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final bot = this.bot;
    return {
      if (bot != null) 'Bot': bot,
    };
  }
}

class UpdateChannelMessageResponse {
  /// The ARN of the channel.
  final String? channelArn;

  /// The ID string of the message being updated.
  final String? messageId;

  UpdateChannelMessageResponse({
    this.channelArn,
    this.messageId,
  });

  factory UpdateChannelMessageResponse.fromJson(Map<String, dynamic> json) {
    return UpdateChannelMessageResponse(
      channelArn: json['ChannelArn'] as String?,
      messageId: json['MessageId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channelArn = this.channelArn;
    final messageId = this.messageId;
    return {
      if (channelArn != null) 'ChannelArn': channelArn,
      if (messageId != null) 'MessageId': messageId,
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

/// The phone number ID, product type, or calling name fields to update, used
/// with the <a>BatchUpdatePhoneNumber</a> and <a>UpdatePhoneNumber</a> actions.
class UpdatePhoneNumberRequestItem {
  /// The phone number ID to update.
  final String phoneNumberId;

  /// The outbound calling name to update.
  final String? callingName;

  /// The product type to update.
  final PhoneNumberProductType? productType;

  UpdatePhoneNumberRequestItem({
    required this.phoneNumberId,
    this.callingName,
    this.productType,
  });

  Map<String, dynamic> toJson() {
    final phoneNumberId = this.phoneNumberId;
    final callingName = this.callingName;
    final productType = this.productType;
    return {
      'PhoneNumberId': phoneNumberId,
      if (callingName != null) 'CallingName': callingName,
      if (productType != null) 'ProductType': productType.toValue(),
    };
  }
}

class UpdatePhoneNumberResponse {
  /// The updated phone number details.
  final PhoneNumber? phoneNumber;

  UpdatePhoneNumberResponse({
    this.phoneNumber,
  });

  factory UpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) {
    return UpdatePhoneNumberResponse(
      phoneNumber: json['PhoneNumber'] != null
          ? PhoneNumber.fromJson(json['PhoneNumber'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final phoneNumber = this.phoneNumber;
    return {
      if (phoneNumber != null) 'PhoneNumber': phoneNumber,
    };
  }
}

class UpdateProxySessionResponse {
  /// The proxy session details.
  final ProxySession? proxySession;

  UpdateProxySessionResponse({
    this.proxySession,
  });

  factory UpdateProxySessionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProxySessionResponse(
      proxySession: json['ProxySession'] != null
          ? ProxySession.fromJson(json['ProxySession'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final proxySession = this.proxySession;
    return {
      if (proxySession != null) 'ProxySession': proxySession,
    };
  }
}

class UpdateRoomMembershipResponse {
  /// The room membership details.
  final RoomMembership? roomMembership;

  UpdateRoomMembershipResponse({
    this.roomMembership,
  });

  factory UpdateRoomMembershipResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRoomMembershipResponse(
      roomMembership: json['RoomMembership'] != null
          ? RoomMembership.fromJson(
              json['RoomMembership'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final roomMembership = this.roomMembership;
    return {
      if (roomMembership != null) 'RoomMembership': roomMembership,
    };
  }
}

class UpdateRoomResponse {
  /// The room details.
  final Room? room;

  UpdateRoomResponse({
    this.room,
  });

  factory UpdateRoomResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRoomResponse(
      room: json['Room'] != null
          ? Room.fromJson(json['Room'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final room = this.room;
    return {
      if (room != null) 'Room': room,
    };
  }
}

class UpdateSipMediaApplicationCallResponse {
  /// A <code>Call</code> instance for a SIP media application.
  final SipMediaApplicationCall? sipMediaApplicationCall;

  UpdateSipMediaApplicationCallResponse({
    this.sipMediaApplicationCall,
  });

  factory UpdateSipMediaApplicationCallResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSipMediaApplicationCallResponse(
      sipMediaApplicationCall: json['SipMediaApplicationCall'] != null
          ? SipMediaApplicationCall.fromJson(
              json['SipMediaApplicationCall'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplicationCall = this.sipMediaApplicationCall;
    return {
      if (sipMediaApplicationCall != null)
        'SipMediaApplicationCall': sipMediaApplicationCall,
    };
  }
}

class UpdateSipMediaApplicationResponse {
  /// The updated SIP media application details.
  final SipMediaApplication? sipMediaApplication;

  UpdateSipMediaApplicationResponse({
    this.sipMediaApplication,
  });

  factory UpdateSipMediaApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSipMediaApplicationResponse(
      sipMediaApplication: json['SipMediaApplication'] != null
          ? SipMediaApplication.fromJson(
              json['SipMediaApplication'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipMediaApplication = this.sipMediaApplication;
    return {
      if (sipMediaApplication != null)
        'SipMediaApplication': sipMediaApplication,
    };
  }
}

class UpdateSipRuleResponse {
  /// Updated SIP rule details.
  final SipRule? sipRule;

  UpdateSipRuleResponse({
    this.sipRule,
  });

  factory UpdateSipRuleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSipRuleResponse(
      sipRule: json['SipRule'] != null
          ? SipRule.fromJson(json['SipRule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sipRule = this.sipRule;
    return {
      if (sipRule != null) 'SipRule': sipRule,
    };
  }
}

/// The user ID and user fields to update, used with the <a>BatchUpdateUser</a>
/// action.
class UpdateUserRequestItem {
  /// The user ID.
  final String userId;

  /// The Alexa for Business metadata.
  final AlexaForBusinessMetadata? alexaForBusinessMetadata;

  /// The user license type.
  final License? licenseType;

  /// The user type.
  final UserType? userType;

  UpdateUserRequestItem({
    required this.userId,
    this.alexaForBusinessMetadata,
    this.licenseType,
    this.userType,
  });

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final alexaForBusinessMetadata = this.alexaForBusinessMetadata;
    final licenseType = this.licenseType;
    final userType = this.userType;
    return {
      'UserId': userId,
      if (alexaForBusinessMetadata != null)
        'AlexaForBusinessMetadata': alexaForBusinessMetadata,
      if (licenseType != null) 'LicenseType': licenseType.toValue(),
      if (userType != null) 'UserType': userType.toValue(),
    };
  }
}

class UpdateUserResponse {
  /// The updated user details.
  final User? user;

  UpdateUserResponse({
    this.user,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      user: json['User'] != null
          ? User.fromJson(json['User'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final user = this.user;
    return {
      if (user != null) 'User': user,
    };
  }
}

class UpdateVoiceConnectorGroupResponse {
  /// The updated Amazon Chime Voice Connector group details.
  final VoiceConnectorGroup? voiceConnectorGroup;

  UpdateVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });

  factory UpdateVoiceConnectorGroupResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateVoiceConnectorGroupResponse(
      voiceConnectorGroup: json['VoiceConnectorGroup'] != null
          ? VoiceConnectorGroup.fromJson(
              json['VoiceConnectorGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnectorGroup = this.voiceConnectorGroup;
    return {
      if (voiceConnectorGroup != null)
        'VoiceConnectorGroup': voiceConnectorGroup,
    };
  }
}

class UpdateVoiceConnectorResponse {
  /// The updated Amazon Chime Voice Connector details.
  final VoiceConnector? voiceConnector;

  UpdateVoiceConnectorResponse({
    this.voiceConnector,
  });

  factory UpdateVoiceConnectorResponse.fromJson(Map<String, dynamic> json) {
    return UpdateVoiceConnectorResponse(
      voiceConnector: json['VoiceConnector'] != null
          ? VoiceConnector.fromJson(
              json['VoiceConnector'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final voiceConnector = this.voiceConnector;
    return {
      if (voiceConnector != null) 'VoiceConnector': voiceConnector,
    };
  }
}

/// The user on the Amazon Chime account.
class User {
  /// The user ID.
  final String userId;

  /// The Amazon Chime account ID.
  final String? accountId;

  /// The Alexa for Business metadata.
  final AlexaForBusinessMetadata? alexaForBusinessMetadata;

  /// The display name of the user.
  final String? displayName;

  /// Date and time when the user is invited to the Amazon Chime account, in ISO
  /// 8601 format.
  final DateTime? invitedOn;

  /// The license type for the user.
  final License? licenseType;

  /// The user's personal meeting PIN.
  final String? personalPIN;

  /// The primary email address of the user.
  final String? primaryEmail;

  /// The primary phone number associated with the user.
  final String? primaryProvisionedNumber;

  /// Date and time when the user is registered, in ISO 8601 format.
  final DateTime? registeredOn;

  /// The user invite status.
  final InviteStatus? userInvitationStatus;

  /// The user registration status.
  final RegistrationStatus? userRegistrationStatus;

  /// The user type.
  final UserType? userType;

  User({
    required this.userId,
    this.accountId,
    this.alexaForBusinessMetadata,
    this.displayName,
    this.invitedOn,
    this.licenseType,
    this.personalPIN,
    this.primaryEmail,
    this.primaryProvisionedNumber,
    this.registeredOn,
    this.userInvitationStatus,
    this.userRegistrationStatus,
    this.userType,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['UserId'] as String,
      accountId: json['AccountId'] as String?,
      alexaForBusinessMetadata: json['AlexaForBusinessMetadata'] != null
          ? AlexaForBusinessMetadata.fromJson(
              json['AlexaForBusinessMetadata'] as Map<String, dynamic>)
          : null,
      displayName: json['DisplayName'] as String?,
      invitedOn: timeStampFromJson(json['InvitedOn']),
      licenseType: (json['LicenseType'] as String?)?.toLicense(),
      personalPIN: json['PersonalPIN'] as String?,
      primaryEmail: json['PrimaryEmail'] as String?,
      primaryProvisionedNumber: json['PrimaryProvisionedNumber'] as String?,
      registeredOn: timeStampFromJson(json['RegisteredOn']),
      userInvitationStatus:
          (json['UserInvitationStatus'] as String?)?.toInviteStatus(),
      userRegistrationStatus:
          (json['UserRegistrationStatus'] as String?)?.toRegistrationStatus(),
      userType: (json['UserType'] as String?)?.toUserType(),
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final accountId = this.accountId;
    final alexaForBusinessMetadata = this.alexaForBusinessMetadata;
    final displayName = this.displayName;
    final invitedOn = this.invitedOn;
    final licenseType = this.licenseType;
    final personalPIN = this.personalPIN;
    final primaryEmail = this.primaryEmail;
    final primaryProvisionedNumber = this.primaryProvisionedNumber;
    final registeredOn = this.registeredOn;
    final userInvitationStatus = this.userInvitationStatus;
    final userRegistrationStatus = this.userRegistrationStatus;
    final userType = this.userType;
    return {
      'UserId': userId,
      if (accountId != null) 'AccountId': accountId,
      if (alexaForBusinessMetadata != null)
        'AlexaForBusinessMetadata': alexaForBusinessMetadata,
      if (displayName != null) 'DisplayName': displayName,
      if (invitedOn != null) 'InvitedOn': iso8601ToJson(invitedOn),
      if (licenseType != null) 'LicenseType': licenseType.toValue(),
      if (personalPIN != null) 'PersonalPIN': personalPIN,
      if (primaryEmail != null) 'PrimaryEmail': primaryEmail,
      if (primaryProvisionedNumber != null)
        'PrimaryProvisionedNumber': primaryProvisionedNumber,
      if (registeredOn != null) 'RegisteredOn': iso8601ToJson(registeredOn),
      if (userInvitationStatus != null)
        'UserInvitationStatus': userInvitationStatus.toValue(),
      if (userRegistrationStatus != null)
        'UserRegistrationStatus': userRegistrationStatus.toValue(),
      if (userType != null) 'UserType': userType.toValue(),
    };
  }
}

/// The list of errors returned when errors are encountered during the
/// <a>BatchSuspendUser</a>, <a>BatchUnsuspendUser</a>, or
/// <a>BatchUpdateUser</a> actions. This includes user IDs, error codes, and
/// error messages.
class UserError {
  /// The error code.
  final ErrorCode? errorCode;

  /// The error message.
  final String? errorMessage;

  /// The user ID for which the action failed.
  final String? userId;

  UserError({
    this.errorCode,
    this.errorMessage,
    this.userId,
  });

  factory UserError.fromJson(Map<String, dynamic> json) {
    return UserError(
      errorCode: (json['ErrorCode'] as String?)?.toErrorCode(),
      errorMessage: json['ErrorMessage'] as String?,
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final userId = this.userId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.toValue(),
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (userId != null) 'UserId': userId,
    };
  }
}

/// Settings associated with an Amazon Chime user, including inbound and
/// outbound calling and text messaging.
class UserSettings {
  /// The telephony settings associated with the user.
  final TelephonySettings telephony;

  UserSettings({
    required this.telephony,
  });

  factory UserSettings.fromJson(Map<String, dynamic> json) {
    return UserSettings(
      telephony:
          TelephonySettings.fromJson(json['Telephony'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final telephony = this.telephony;
    return {
      'Telephony': telephony,
    };
  }
}

enum UserType {
  privateUser,
  sharedDevice,
}

extension UserTypeValueExtension on UserType {
  String toValue() {
    switch (this) {
      case UserType.privateUser:
        return 'PrivateUser';
      case UserType.sharedDevice:
        return 'SharedDevice';
    }
  }
}

extension UserTypeFromString on String {
  UserType toUserType() {
    switch (this) {
      case 'PrivateUser':
        return UserType.privateUser;
      case 'SharedDevice':
        return UserType.sharedDevice;
    }
    throw Exception('$this is not known in enum UserType');
  }
}

class ValidateE911AddressResponse {
  /// The validated address.
  final Address? address;

  /// The ID that represents the address.
  final String? addressExternalId;

  /// The list of address suggestions.
  final List<CandidateAddress>? candidateAddressList;

  /// Number indicating the result of address validation. <code>0</code> means the
  /// address was perfect as is and successfully validated. <code>1</code> means
  /// the address was corrected. <code>2</code> means the address sent was not
  /// close enough and was not validated.
  final int? validationResult;

  ValidateE911AddressResponse({
    this.address,
    this.addressExternalId,
    this.candidateAddressList,
    this.validationResult,
  });

  factory ValidateE911AddressResponse.fromJson(Map<String, dynamic> json) {
    return ValidateE911AddressResponse(
      address: json['Address'] != null
          ? Address.fromJson(json['Address'] as Map<String, dynamic>)
          : null,
      addressExternalId: json['AddressExternalId'] as String?,
      candidateAddressList: (json['CandidateAddressList'] as List?)
          ?.whereNotNull()
          .map((e) => CandidateAddress.fromJson(e as Map<String, dynamic>))
          .toList(),
      validationResult: json['ValidationResult'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final addressExternalId = this.addressExternalId;
    final candidateAddressList = this.candidateAddressList;
    final validationResult = this.validationResult;
    return {
      if (address != null) 'Address': address,
      if (addressExternalId != null) 'AddressExternalId': addressExternalId,
      if (candidateAddressList != null)
        'CandidateAddressList': candidateAddressList,
      if (validationResult != null) 'ValidationResult': validationResult,
    };
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

/// The Amazon Chime Voice Connector configuration, including outbound host name
/// and encryption settings.
class VoiceConnector {
  /// The AWS Region in which the Amazon Chime Voice Connector is created.
  /// Default: <code>us-east-1</code>.
  final VoiceConnectorAwsRegion? awsRegion;

  /// The Amazon Chime Voice Connector creation timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The name of the Amazon Chime Voice Connector.
  final String? name;

  /// The outbound host name for the Amazon Chime Voice Connector.
  final String? outboundHostName;

  /// Designates whether encryption is required for the Amazon Chime Voice
  /// Connector.
  final bool? requireEncryption;

  /// The updated Amazon Chime Voice Connector timestamp, in ISO 8601 format.
  final DateTime? updatedTimestamp;

  /// The ARN of the specified Amazon Chime Voice Connector.
  final String? voiceConnectorArn;

  /// The Amazon Chime Voice Connector ID.
  final String? voiceConnectorId;

  VoiceConnector({
    this.awsRegion,
    this.createdTimestamp,
    this.name,
    this.outboundHostName,
    this.requireEncryption,
    this.updatedTimestamp,
    this.voiceConnectorArn,
    this.voiceConnectorId,
  });

  factory VoiceConnector.fromJson(Map<String, dynamic> json) {
    return VoiceConnector(
      awsRegion: (json['AwsRegion'] as String?)?.toVoiceConnectorAwsRegion(),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
      outboundHostName: json['OutboundHostName'] as String?,
      requireEncryption: json['RequireEncryption'] as bool?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorArn: json['VoiceConnectorArn'] as String?,
      voiceConnectorId: json['VoiceConnectorId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsRegion = this.awsRegion;
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    final outboundHostName = this.outboundHostName;
    final requireEncryption = this.requireEncryption;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceConnectorArn = this.voiceConnectorArn;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      if (awsRegion != null) 'AwsRegion': awsRegion.toValue(),
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
      if (outboundHostName != null) 'OutboundHostName': outboundHostName,
      if (requireEncryption != null) 'RequireEncryption': requireEncryption,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceConnectorArn != null) 'VoiceConnectorArn': voiceConnectorArn,
      if (voiceConnectorId != null) 'VoiceConnectorId': voiceConnectorId,
    };
  }
}

enum VoiceConnectorAwsRegion {
  usEast_1,
  usWest_2,
}

extension VoiceConnectorAwsRegionValueExtension on VoiceConnectorAwsRegion {
  String toValue() {
    switch (this) {
      case VoiceConnectorAwsRegion.usEast_1:
        return 'us-east-1';
      case VoiceConnectorAwsRegion.usWest_2:
        return 'us-west-2';
    }
  }
}

extension VoiceConnectorAwsRegionFromString on String {
  VoiceConnectorAwsRegion toVoiceConnectorAwsRegion() {
    switch (this) {
      case 'us-east-1':
        return VoiceConnectorAwsRegion.usEast_1;
      case 'us-west-2':
        return VoiceConnectorAwsRegion.usWest_2;
    }
    throw Exception('$this is not known in enum VoiceConnectorAwsRegion');
  }
}

/// The Amazon Chime Voice Connector group configuration, including associated
/// Amazon Chime Voice Connectors. You can include Amazon Chime Voice Connectors
/// from different AWS Regions in your group. This creates a fault tolerant
/// mechanism for fallback in case of availability events.
class VoiceConnectorGroup {
  /// The Amazon Chime Voice Connector group creation time stamp, in ISO 8601
  /// format.
  final DateTime? createdTimestamp;

  /// The name of the Amazon Chime Voice Connector group.
  final String? name;

  /// The updated Amazon Chime Voice Connector group time stamp, in ISO 8601
  /// format.
  final DateTime? updatedTimestamp;

  /// The ARN of the specified Amazon Chime Voice Connector group.
  final String? voiceConnectorGroupArn;

  /// The Amazon Chime Voice Connector group ID.
  final String? voiceConnectorGroupId;

  /// The Amazon Chime Voice Connectors to which to route inbound calls.
  final List<VoiceConnectorItem>? voiceConnectorItems;

  VoiceConnectorGroup({
    this.createdTimestamp,
    this.name,
    this.updatedTimestamp,
    this.voiceConnectorGroupArn,
    this.voiceConnectorGroupId,
    this.voiceConnectorItems,
  });

  factory VoiceConnectorGroup.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorGroup(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorGroupArn: json['VoiceConnectorGroupArn'] as String?,
      voiceConnectorGroupId: json['VoiceConnectorGroupId'] as String?,
      voiceConnectorItems: (json['VoiceConnectorItems'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnectorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final createdTimestamp = this.createdTimestamp;
    final name = this.name;
    final updatedTimestamp = this.updatedTimestamp;
    final voiceConnectorGroupArn = this.voiceConnectorGroupArn;
    final voiceConnectorGroupId = this.voiceConnectorGroupId;
    final voiceConnectorItems = this.voiceConnectorItems;
    return {
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (name != null) 'Name': name,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
      if (voiceConnectorGroupArn != null)
        'VoiceConnectorGroupArn': voiceConnectorGroupArn,
      if (voiceConnectorGroupId != null)
        'VoiceConnectorGroupId': voiceConnectorGroupId,
      if (voiceConnectorItems != null)
        'VoiceConnectorItems': voiceConnectorItems,
    };
  }
}

/// For Amazon Chime Voice Connector groups, the Amazon Chime Voice Connectors
/// to which to route inbound calls. Includes priority configuration settings.
/// Limit: 3 <code>VoiceConnectorItems</code> per Amazon Chime Voice Connector
/// group.
class VoiceConnectorItem {
  /// The priority associated with the Amazon Chime Voice Connector, with 1 being
  /// the highest priority. Higher priority Amazon Chime Voice Connectors are
  /// attempted first.
  final int priority;

  /// The Amazon Chime Voice Connector ID.
  final String voiceConnectorId;

  VoiceConnectorItem({
    required this.priority,
    required this.voiceConnectorId,
  });

  factory VoiceConnectorItem.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorItem(
      priority: json['Priority'] as int,
      voiceConnectorId: json['VoiceConnectorId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final priority = this.priority;
    final voiceConnectorId = this.voiceConnectorId;
    return {
      'Priority': priority,
      'VoiceConnectorId': voiceConnectorId,
    };
  }
}

/// The Amazon Chime Voice Connector settings. Includes any Amazon S3 buckets
/// designated for storing call detail records.
class VoiceConnectorSettings {
  /// The Amazon S3 bucket designated for call detail record storage.
  final String? cdrBucket;

  VoiceConnectorSettings({
    this.cdrBucket,
  });

  factory VoiceConnectorSettings.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorSettings(
      cdrBucket: json['CdrBucket'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cdrBucket = this.cdrBucket;
    return {
      if (cdrBucket != null) 'CdrBucket': cdrBucket,
    };
  }
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
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

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String? type, String? message})
      : super(
            type: type, code: 'UnprocessableEntityException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AccessDeniedException': (type, message) =>
      AccessDeniedException(type: type, message: message),
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
  'UnprocessableEntityException': (type, message) =>
      UnprocessableEntityException(type: type, message: message),
};
