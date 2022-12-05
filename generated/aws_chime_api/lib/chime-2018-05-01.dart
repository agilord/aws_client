// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

/// The Amazon Chime API (application programming interface) is designed for
/// developers to perform key tasks, such as creating and managing Amazon Chime
/// accounts, users, and Voice Connectors. This guide provides detailed
/// information about the Amazon Chime API, including operations, types, inputs
/// and outputs, and error codes. It also includes some server-side API actions
/// to use with the Amazon Chime SDK. For more information about the Amazon
/// Chime SDK, see <a
/// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
/// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
///
/// You can use an AWS SDK, the AWS Command Line Interface (AWS CLI), or the
/// REST API to make API calls. We recommend using an AWS SDK or the AWS CLI.
/// Each API operation includes links to information about using it with a
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
/// </dd> <dt>Using REST</dt> <dd>
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(e164PhoneNumber, 'e164PhoneNumber');
    ArgumentError.checkNotNull(userId, 'userId');
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
  Future<AssociatePhoneNumbersWithVoiceConnectorResponse>
      associatePhoneNumbersWithVoiceConnector({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorId,
    bool? forceAssociate,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<AssociatePhoneNumbersWithVoiceConnectorGroupResponse>
      associatePhoneNumbersWithVoiceConnectorGroup({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorGroupId,
    bool? forceAssociate,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(signinDelegateGroups, 'signinDelegateGroups');
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
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<BatchCreateAttendeeResponse> batchCreateAttendee({
    required List<CreateAttendeeRequestItem> attendees,
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendees, 'attendees');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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

  /// Adds up to 50 members to a chat room in an Amazon Chime Enterprise
  /// account. Members can be either users or bots. The member role designates
  /// whether the member is a chat room administrator or a general chat room
  /// member.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(membershipItemList, 'membershipItemList');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
    ArgumentError.checkNotNull(phoneNumberIds, 'phoneNumberIds');
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
  /// the account, but they can continue to use Amazon Chime as free users. To
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userIdList, 'userIdList');
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
  /// href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing
  /// Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userIdList, 'userIdList');
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
  /// For example, you can update either the product type or the calling name.
  ///
  /// For product types, choose from Amazon Chime Business Calling and Amazon
  /// Chime Voice Connector. For toll-free numbers, you must use the Amazon
  /// Chime Voice Connector product type.
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
    ArgumentError.checkNotNull(
        updatePhoneNumberRequestItems, 'updatePhoneNumberRequestItems');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(
        updateUserRequestItems, 'updateUserRequestItems');
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
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

  /// Creates an Amazon Chime Messaging SDK <code>AppInstance</code> under an
  /// AWS Account. Only Messaging SDK customers use this API.
  /// <code>CreateAppInstance</code> supports <code>idempotency</code> behavior
  /// as described in the AWS API Standard.
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
  /// The name of the app instance.
  ///
  /// Parameter [clientRequestToken] :
  /// The <code>ClientRequestToken</code> of the app instance.
  ///
  /// Parameter [metadata] :
  /// The metadata of the app instance. Limited to a 1KB string in UTF-8.
  Future<CreateAppInstanceResponse> createAppInstance({
    required String name,
    String? clientRequestToken,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
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
  ///
  /// <ul>
  /// <li>
  /// <code>ChannelModerator</code> actions across all channels in the app
  /// instance.
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
  /// The ARN of the administrator of the current app instance.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  Future<CreateAppInstanceAdminResponse> createAppInstanceAdmin({
    required String appInstanceAdminArn,
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceAdminArn, 'appInstanceAdminArn');
    _s.validateStringLength(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
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
  /// The ARN of the app instance request.
  ///
  /// Parameter [appInstanceUserId] :
  /// The user ID of the app instance.
  ///
  /// Parameter [name] :
  /// The user's name.
  ///
  /// Parameter [clientRequestToken] :
  /// The token assigned to the user requesting an app instance.
  ///
  /// Parameter [metadata] :
  /// The request's metadata. Limited to a 1KB string in UTF-8.
  Future<CreateAppInstanceUserResponse> createAppInstanceUser({
    required String appInstanceArn,
    required String appInstanceUserId,
    required String name,
    String? clientRequestToken,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(appInstanceUserId, 'appInstanceUserId');
    _s.validateStringLength(
      'appInstanceUserId',
      appInstanceUserId,
      1,
      50,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'AppInstanceUserId': appInstanceUserId,
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
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
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<CreateAttendeeResponse> createAttendee({
    required String externalUserId,
    required String meetingId,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(externalUserId, 'externalUserId');
    _s.validateStringLength(
      'externalUserId',
      externalUserId,
      2,
      64,
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(displayName, 'displayName');
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
  /// channels are discoverable by anyone in the app instance.
  Future<CreateChannelResponse> createChannel({
    required String appInstanceArn,
    required String name,
    String? clientRequestToken,
    String? metadata,
    ChannelMode? mode,
    ChannelPrivacy? privacy,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
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
  Future<CreateChannelBanResponse> createChannelBan({
    required String channelArn,
    required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberArn, 'memberArn');
    _s.validateStringLength(
      'memberArn',
      memberArn,
      5,
      1600,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'MemberArn': memberArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/bans',
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
  /// </ul>
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
  Future<CreateChannelMembershipResponse> createChannelMembership({
    required String channelArn,
    required String memberArn,
    required ChannelMembershipType type,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberArn, 'memberArn');
    _s.validateStringLength(
      'memberArn',
      memberArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'MemberArn': memberArn,
      'Type': type.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/memberships',
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
  /// </ul>
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
  Future<CreateChannelModeratorResponse> createChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(channelModeratorArn, 'channelModeratorArn');
    _s.validateStringLength(
      'channelModeratorArn',
      channelModeratorArn,
      5,
      1600,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ChannelModeratorArn': channelModeratorArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/moderators',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelModeratorResponse.fromJson(response);
  }

  /// Creates a new Amazon Chime SDK meeting in the specified media Region with
  /// no initial attendees. For more information about specifying media Regions,
  /// see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon
  /// Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  /// Available values: <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
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
  Future<CreateMeetingResponse> createMeeting({
    String? clientRequestToken,
    String? externalMeetingId,
    String? mediaRegion,
    String? meetingHostId,
    MeetingNotificationConfiguration? notificationsConfiguration,
    List<Tag>? tags,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringLength(
      'externalMeetingId',
      externalMeetingId,
      2,
      64,
    );
    _s.validateStringLength(
      'meetingHostId',
      meetingHostId,
      2,
      64,
    );
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
  /// telephone network (PSTN) and joins them into Chime meeting. Also ensures
  /// that the From number belongs to the customer.
  ///
  /// To play welcome audio or implement an interactive voice response (IVR),
  /// use the <code>CreateSipMediaApplicationCall</code> API with the
  /// corresponding SIP media application ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [fromPhoneNumber] :
  /// Phone number used as the caller ID when the remote party receives a call.
  ///
  /// Parameter [joinToken] :
  /// Token used by the Amazon Chime SDK attendee. Call the <a
  /// href="https://docs.aws.amazon.com/https:/docs.aws.amazon.com/chime/latest/APIReference/API_Attendee.html">
  /// CreateAttendee API</a> to get a join token.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Type: String
  ///
  /// Pattern: [a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}
  ///
  /// Required: No
  ///
  /// Parameter [toPhoneNumber] :
  /// Phone number called when inviting someone to a meeting.
  Future<CreateMeetingDialOutResponse> createMeetingDialOut({
    required String fromPhoneNumber,
    required String joinToken,
    required String meetingId,
    required String toPhoneNumber,
  }) async {
    ArgumentError.checkNotNull(fromPhoneNumber, 'fromPhoneNumber');
    ArgumentError.checkNotNull(joinToken, 'joinToken');
    _s.validateStringLength(
      'joinToken',
      joinToken,
      2,
      2048,
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    ArgumentError.checkNotNull(toPhoneNumber, 'toPhoneNumber');
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
  /// href="https://docs.aws.amazon.com/chime/latest/dg/chime-sdk-meetings-regions.html">Amazon
  /// Chime SDK Media Regions</a> in the <i>Amazon Chime Developer Guide</i>.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  /// The Region in which to create the meeting. Default:
  /// <code>us-east-1</code>.
  ///
  /// Available values: <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
  ///
  /// Parameter [meetingHostId] :
  /// Reserved.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<CreateMeetingWithAttendeesResponse> createMeetingWithAttendees({
    List<CreateAttendeeRequestItem>? attendees,
    String? clientRequestToken,
    String? externalMeetingId,
    String? mediaRegion,
    String? meetingHostId,
    MeetingNotificationConfiguration? notificationsConfiguration,
    List<Tag>? tags,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringLength(
      'externalMeetingId',
      externalMeetingId,
      2,
      64,
    );
    _s.validateStringLength(
      'meetingHostId',
      meetingHostId,
      2,
      64,
    );
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

  /// Creates an order for phone numbers to be provisioned. Choose from Amazon
  /// Chime Business Calling and Amazon Chime Voice Connector product types. For
  /// toll-free numbers, you must use the Amazon Chime Voice Connector product
  /// type.
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
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(productType, 'productType');
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
    ArgumentError.checkNotNull(capabilities, 'capabilities');
    ArgumentError.checkNotNull(
        participantPhoneNumbers, 'participantPhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(memberId, 'memberId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
  /// AWS Region assigned to the SIP media application.
  ///
  /// Parameter [endpoints] :
  /// List of endpoints (Lambda Amazon Resource Names) specified for the SIP
  /// media application. Currently, only one endpoint is supported.
  ///
  /// Parameter [name] :
  /// The SIP media application name.
  Future<CreateSipMediaApplicationResponse> createSipMediaApplication({
    required String awsRegion,
    required List<SipMediaApplicationEndpoint> endpoints,
    String? name,
  }) async {
    ArgumentError.checkNotNull(awsRegion, 'awsRegion');
    ArgumentError.checkNotNull(endpoints, 'endpoints');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
    final $payload = <String, dynamic>{
      'AwsRegion': awsRegion,
      'Endpoints': endpoints,
      if (name != null) 'Name': name,
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
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [sipMediaApplicationId] :
  /// The ID of the SIP media application.
  ///
  /// Parameter [fromPhoneNumber] :
  /// The phone number that a user calls from.
  ///
  /// Parameter [toPhoneNumber] :
  /// The phone number that the user dials in order to connect to a meeting
  Future<CreateSipMediaApplicationCallResponse> createSipMediaApplicationCall({
    required String sipMediaApplicationId,
    String? fromPhoneNumber,
    String? toPhoneNumber,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    final $payload = <String, dynamic>{
      if (fromPhoneNumber != null) 'FromPhoneNumber': fromPhoneNumber,
      if (toPhoneNumber != null) 'ToPhoneNumber': toPhoneNumber,
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
  /// The type of trigger whose value is assigned to the SIP rule in
  /// <code>TriggerValue</code>. Allowed trigger values are
  /// <code>RequestUriHostname</code> and <code>ToPhoneNumber</code>.
  ///
  /// Parameter [triggerValue] :
  /// If <code>TriggerType</code> is <code>RequestUriHostname</code> then the
  /// value can be the outbound host name of an Amazon Chime Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code> then the value can
  /// be a customer-owned phone number in E164 format. <code>SipRule</code> is
  /// triggered if the SIP application requests a host name, or a If
  /// <code>TriggerType</code> is <code>RequestUriHostname</code>, then the
  /// value can be the outbound hostname of an Amazon Chime Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code>, then the value can
  /// be a customer-owned phone number in E164 format. <code>SipRule</code> is
  /// triggered if the SIP application requests a host name, or a
  /// <code>ToPhoneNumber</code> value matches the incoming SIP request.
  ///
  /// Parameter [disabled] :
  /// Enables or disables a rule. You must disable rules before you can delete
  /// them.
  Future<CreateSipRuleResponse> createSipRule({
    required String name,
    required List<SipRuleTargetApplication> targetApplications,
    required SipRuleTriggerType triggerType,
    required String triggerValue,
    bool? disabled,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(targetApplications, 'targetApplications');
    ArgumentError.checkNotNull(triggerType, 'triggerType');
    ArgumentError.checkNotNull(triggerValue, 'triggerValue');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
  /// Default value: <code>us-east-1</code>.
  Future<CreateVoiceConnectorResponse> createVoiceConnector({
    required String name,
    required bool requireEncryption,
    VoiceConnectorAwsRegion? awsRegion,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(requireEncryption, 'requireEncryption');
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
  Future<CreateVoiceConnectorGroupResponse> createVoiceConnectorGroup({
    required String name,
    List<VoiceConnectorItem>? voiceConnectorItems,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
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
  /// before deleting a <code>Team</code> account. You can use the
  /// <a>BatchSuspendUser</a> action to do so.
  ///
  /// For <code>EnterpriseLWA</code> and <code>EnterpriseAD</code> accounts, you
  /// must release the claimed domains for your Amazon Chime account before
  /// deletion. As soon as you release the domain, all users under that account
  /// are suspended.
  ///
  /// Deleted accounts appear in your <code>Disabled</code> accounts list for 90
  /// days. To restore a deleted account from your <code>Disabled</code>
  /// accounts list, you must contact AWS Support.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an <code>AppInstance</code> and all associated data
  /// asynchronously.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  Future<void> deleteAppInstance({
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/app-instances/${Uri.encodeComponent(appInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Demotes an <code>AppInstanceAdmin</code> to an
  /// <code>AppInstanceUser</code>. This action does not delete the user.
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
  /// The ARN of the app instance's administrator.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  Future<void> deleteAppInstanceAdmin({
    required String appInstanceAdminArn,
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceAdminArn, 'appInstanceAdminArn');
    _s.validateStringLength(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/admins/${Uri.encodeComponent(appInstanceAdminArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the streaming configurations of an app instance.
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
  Future<void> deleteAppInstanceStreamingConfigurations({
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/streaming-configurations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an <code>AppInstanceUser</code>.
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
  Future<void> deleteAppInstanceUser({
    required String appInstanceUserArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
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
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<void> deleteAttendee({
    required String attendeeId,
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
  Future<void> deleteChannel({
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a user from a channel's ban list.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel from which the app instance user was banned.
  ///
  /// Parameter [memberArn] :
  /// The ARN of the app instance user that you want to reinstate.
  Future<void> deleteChannelBan({
    required String channelArn,
    required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberArn, 'memberArn');
    _s.validateStringLength(
      'memberArn',
      memberArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/bans/${Uri.encodeComponent(memberArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a member from a channel.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [channelArn] :
  /// The ARN of the channel from which you want to remove the user.
  ///
  /// Parameter [memberArn] :
  /// The ARN of the member that you're removing from the channel.
  Future<void> deleteChannelMembership({
    required String channelArn,
    required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberArn, 'memberArn');
    _s.validateStringLength(
      'memberArn',
      memberArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel message. Only admins can perform this action. Deletion
  /// makes messages inaccessible immediately. A background process deletes any
  /// revisions created by <code>UpdateChannelMessage</code>.
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
  Future<void> deleteChannelMessage({
    required String channelArn,
    required String messageId,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringLength(
      'messageId',
      messageId,
      1,
      128,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a channel moderator.
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
  Future<void> deleteChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(channelModeratorArn, 'channelModeratorArn');
    _s.validateStringLength(
      'channelModeratorArn',
      channelModeratorArn,
      5,
      1600,
      isRequired: true,
    );
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/moderators/${Uri.encodeComponent(channelModeratorArn)}',
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(botId, 'botId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/bots/${Uri.encodeComponent(botId)}/events-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified Amazon Chime SDK meeting. When a meeting is deleted,
  /// its attendees are also deleted and clients can no longer join it. For more
  /// information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<void> deleteMeeting({
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the specified proxy session from the specified Amazon Chime Voice
  /// Connector.
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
  Future<void> deleteProxySession({
    required String proxySessionId,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(proxySessionId, 'proxySessionId');
    _s.validateStringLength(
      'proxySessionId',
      proxySessionId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(memberId, 'memberId');
    ArgumentError.checkNotNull(roomId, 'roomId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/memberships/${Uri.encodeComponent(memberId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a SIP media application.
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
  Future<void> deleteSipMediaApplication({
    required String sipMediaApplicationId,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/sip-media-applications/${Uri.encodeComponent(sipMediaApplicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a SIP rule. You must disable a SIP rule before you can delete it.
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
  Future<void> deleteSipRule({
    required String sipRuleId,
  }) async {
    ArgumentError.checkNotNull(sipRuleId, 'sipRuleId');
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
  Future<void> deleteVoiceConnector({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the emergency calling configuration details from the specified
  /// Amazon Chime Voice Connector.
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
  Future<void> deleteVoiceConnectorEmergencyCallingConfiguration({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<void> deleteVoiceConnectorGroup({
    required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
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
  /// </note>
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
  Future<void> deleteVoiceConnectorOrigination({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<void> deleteVoiceConnectorProxy({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
  Future<void> deleteVoiceConnectorStreamingConfiguration({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  /// </note>
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
  Future<void> deleteVoiceConnectorTermination({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<void> deleteVoiceConnectorTerminationCredentials({
    required List<String> usernames,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(usernames, 'usernames');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  Future<DescribeAppInstanceResponse> describeAppInstance({
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/app-instances/${Uri.encodeComponent(appInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceResponse.fromJson(response);
  }

  /// Returns the full details of an <code>AppInstanceAdmin</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceAdminArn] :
  /// The ARN of the app instance administrator.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  Future<DescribeAppInstanceAdminResponse> describeAppInstanceAdmin({
    required String appInstanceAdminArn,
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceAdminArn, 'appInstanceAdminArn');
    _s.validateStringLength(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
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
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the app instance user.
  Future<DescribeAppInstanceUserResponse> describeAppInstanceUser({
    required String appInstanceUserArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceUserResponse.fromJson(response);
  }

  /// Returns the full details of a channel in an Amazon Chime app instance.
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
  Future<DescribeChannelResponse> describeChannel({
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelResponse.fromJson(response);
  }

  /// Returns the full details of a channel ban.
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
  Future<DescribeChannelBanResponse> describeChannelBan({
    required String channelArn,
    required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberArn, 'memberArn');
    _s.validateStringLength(
      'memberArn',
      memberArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/bans/${Uri.encodeComponent(memberArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelBanResponse.fromJson(response);
  }

  /// Returns the full details of a user's channel membership.
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
  Future<DescribeChannelMembershipResponse> describeChannelMembership({
    required String channelArn,
    required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberArn, 'memberArn');
    _s.validateStringLength(
      'memberArn',
      memberArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/memberships/${Uri.encodeComponent(memberArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelMembershipResponse.fromJson(response);
  }

  /// Returns the details of a channel based on the membership of the
  /// <code>AppInstanceUser</code> specified.
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
  Future<DescribeChannelMembershipForAppInstanceUserResponse>
      describeChannelMembershipForAppInstanceUser({
    required String appInstanceUserArn,
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'app-instance-user-arn': [appInstanceUserArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}?scope=app-instance-user-membership',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelMembershipForAppInstanceUserResponse.fromJson(
        response);
  }

  /// Returns the full details of a channel moderated by the specified
  /// <code>AppInstanceUser</code>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the app instance user in the moderated channel.
  ///
  /// Parameter [channelArn] :
  /// The ARN of the moderated channel.
  Future<DescribeChannelModeratedByAppInstanceUserResponse>
      describeChannelModeratedByAppInstanceUser({
    required String appInstanceUserArn,
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    final $query = <String, List<String>>{
      'app-instance-user-arn': [appInstanceUserArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}?scope=app-instance-user-moderated-channel',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeChannelModeratedByAppInstanceUserResponse.fromJson(response);
  }

  /// Returns the full details of a single ChannelModerator.
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
  Future<DescribeChannelModeratorResponse> describeChannelModerator({
    required String channelArn,
    required String channelModeratorArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(channelModeratorArn, 'channelModeratorArn');
    _s.validateStringLength(
      'channelModeratorArn',
      channelModeratorArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/moderators/${Uri.encodeComponent(channelModeratorArn)}',
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
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
  Future<DisassociatePhoneNumbersFromVoiceConnectorResponse>
      disassociatePhoneNumbersFromVoiceConnector({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<DisassociatePhoneNumbersFromVoiceConnectorGroupResponse>
      disassociatePhoneNumbersFromVoiceConnectorGroup({
    required List<String> e164PhoneNumbers,
    required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(groupNames, 'groupNames');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountResponse.fromJson(response);
  }

  /// Retrieves account settings for the specified Amazon Chime account ID, such
  /// as remote control and dial out settings. For more information about these
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
  }

  /// Gets the retention settings for an app instance.
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
  /// The ARN of the app instance.
  Future<GetAppInstanceRetentionSettingsResponse>
      getAppInstanceRetentionSettings({
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instances/${Uri.encodeComponent(appInstanceArn)}/retention-settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetAppInstanceRetentionSettingsResponse.fromJson(response);
  }

  /// Gets the streaming settings for an app instance.
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
  /// The ARN of the app instance.
  Future<GetAppInstanceStreamingConfigurationsResponse>
      getAppInstanceStreamingConfigurations({
    required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
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
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<GetAttendeeResponse> getAttendee({
    required String attendeeId,
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(botId, 'botId');
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
  Future<GetChannelMessageResponse> getChannelMessage({
    required String channelArn,
    required String messageId,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringLength(
      'messageId',
      messageId,
      1,
      128,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(botId, 'botId');
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

  /// Gets the Amazon Chime SDK meeting details for the specified meeting ID.
  /// For more information about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<GetMeetingResponse> getMeeting({
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMeetingResponse.fromJson(response);
  }

  /// The endpoint for the messaging session.
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
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberResponse.fromJson(response);
  }

  /// Retrieves details for the specified phone number order, such as order
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
    ArgumentError.checkNotNull(phoneNumberOrderId, 'phoneNumberOrderId');
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
  Future<GetProxySessionResponse> getProxySession({
    required String proxySessionId,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(proxySessionId, 'proxySessionId');
    _s.validateStringLength(
      'proxySessionId',
      proxySessionId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
  Future<GetSipMediaApplicationResponse> getSipMediaApplication({
    required String sipMediaApplicationId,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
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
  /// The ID of the SIP media application.
  Future<GetSipMediaApplicationLoggingConfigurationResponse>
      getSipMediaApplicationLoggingConfiguration({
    required String sipMediaApplicationId,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
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
  Future<GetSipRuleResponse> getSipRule({
    required String sipRuleId,
  }) async {
    ArgumentError.checkNotNull(sipRuleId, 'sipRuleId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/sip-rules/${Uri.encodeComponent(sipRuleId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSipRuleResponse.fromJson(response);
  }

  /// Retrieves details for the specified user ID, such as primary email
  /// address, license type, and personal meeting PIN.
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
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
  /// timestamps, name, outbound host, and encryption requirements.
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
  Future<GetVoiceConnectorResponse> getVoiceConnector({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<GetVoiceConnectorEmergencyCallingConfigurationResponse>
      getVoiceConnectorEmergencyCallingConfiguration({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  /// such as timestamps, name, and associated <code>VoiceConnectorItems</code>.
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
  Future<GetVoiceConnectorGroupResponse> getVoiceConnectorGroup({
    required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
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
  /// Amazon CloudWatch.
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
  Future<GetVoiceConnectorLoggingConfigurationResponse>
      getVoiceConnectorLoggingConfiguration({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<GetVoiceConnectorOriginationResponse> getVoiceConnectorOrigination({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<GetVoiceConnectorProxyResponse> getVoiceConnectorProxy({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
  Future<GetVoiceConnectorStreamingConfigurationResponse>
      getVoiceConnectorStreamingConfiguration({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<GetVoiceConnectorTerminationResponse> getVoiceConnectorTermination({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId)}/termination',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorTerminationResponse.fromJson(response);
  }

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
  Future<GetVoiceConnectorTerminationHealthResponse>
      getVoiceConnectorTerminationHealth({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userEmailList, 'userEmailList');
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
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
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

  /// Returns a list of the administrators in the app instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of administrators that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of
  /// administrators is reached.
  Future<ListAppInstanceAdminsResponse> listAppInstanceAdmins({
    required String appInstanceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
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
      0,
      2048,
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

  /// List all <code>AppInstanceUsers</code> created under a single app
  /// instance.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the app instance.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of requests that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested users are
  /// returned.
  Future<ListAppInstanceUsersResponse> listAppInstanceUsers({
    required String appInstanceArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
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
      0,
      2048,
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

  /// Lists all Amazon Chime app instances created under a single AWS account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of app instances that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API requests until you reach the maximum
  /// number of app instances.
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      2048,
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
  Future<ListAttendeeTagsResponse> listAttendeeTags({
    required String attendeeId,
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<ListAttendeesResponse> listAttendees({
    required String meetingId,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
  /// Parameter [maxResults] :
  /// The maximum number of bans that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested bans are
  /// returned.
  Future<ListChannelBansResponse> listChannelBans({
    required String channelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
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
      0,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/bans',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelBansResponse.fromJson(response);
  }

  /// Lists all channel memberships in a channel.
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
  /// Parameter [maxResults] :
  /// The maximum number of channel memberships that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channel
  /// memberships are returned..
  ///
  /// Parameter [type] :
  /// The membership type of a user, <code>DEFAULT</code> or
  /// <code>HIDDEN</code>. Default members are always returned as part of
  /// <code>ListChannelMemberships</code>. Hidden members are only returned if
  /// the type filter in <code>ListChannelMemberships</code> equals
  /// <code>HIDDEN</code>. Otherwise hidden members are not returned.
  Future<ListChannelMembershipsResponse> listChannelMemberships({
    required String channelArn,
    int? maxResults,
    String? nextToken,
    ChannelMembershipType? type,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
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
      0,
      2048,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelMembershipsResponse.fromJson(response);
  }

  /// Lists all channels that a particular <code>AppInstanceUser</code> is a
  /// part of. Only an <code>AppInstanceAdmin</code> can call the API with a
  /// user ARN that is not their own.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [UnauthorizedClientException].
  /// May throw [ThrottledClientException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the app instance users
  ///
  /// Parameter [maxResults] :
  /// The maximum number of users that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channel
  /// memberships is reached.
  Future<ListChannelMembershipsForAppInstanceUserResponse>
      listChannelMembershipsForAppInstanceUser({
    String? appInstanceUserArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
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
      0,
      2048,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelMembershipsForAppInstanceUserResponse.fromJson(response);
  }

  /// List all the messages in a channel. Returns a paginated list of
  /// <code>ChannelMessages</code>. Sorted in descending order by default, based
  /// on the creation timestamp.
  /// <note>
  /// Redacted messages appear in the results as empty, since they are only
  /// redacted, not deleted. Deleted messages do not appear in the results. This
  /// action always returns the latest version of an edited message.
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
  Future<ListChannelMessagesResponse> listChannelMessages({
    required String channelArn,
    int? maxResults,
    String? nextToken,
    DateTime? notAfter,
    DateTime? notBefore,
    SortOrder? sortOrder,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
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
      0,
      2048,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelMessagesResponse.fromJson(response);
  }

  /// Lists all the moderators for a channel.
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
  /// Parameter [maxResults] :
  /// The maximum number of moderators that you want returned.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested moderators are
  /// returned.
  Future<ListChannelModeratorsResponse> listChannelModerators({
    required String channelArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
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
      0,
      2048,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/moderators',
      queryParams: $query,
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
  /// account
  /// </li>
  /// <li>
  /// Only an <code>AppInstanceAdmin</code> can set privacy =
  /// <code>PRIVATE</code> to list the private channels in an account.
  /// </li>
  /// </ul>
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
  /// The maximum number of channels that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested channels are
  /// returned.
  ///
  /// Parameter [privacy] :
  /// The privacy setting. <code>PUBLIC</code> retrieves all the public
  /// channels. <code>PRIVATE</code> retrieves private channels. Only an app
  /// instance administrator can retrieve private channels.
  Future<ListChannelsResponse> listChannels({
    required String appInstanceArn,
    int? maxResults,
    String? nextToken,
    ChannelPrivacy? privacy,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
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
      0,
      2048,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsResponse.fromJson(response);
  }

  /// A list of the channels moderated by an app instance user.
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
  /// Parameter [maxResults] :
  /// The maximum number of channels in the request.
  ///
  /// Parameter [nextToken] :
  /// The token returned from previous API requests until the number of channels
  /// moderated by the user is reached.
  Future<ListChannelsModeratedByAppInstanceUserResponse>
      listChannelsModeratedByAppInstanceUser({
    String? appInstanceUserArn,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
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
      0,
      2048,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsModeratedByAppInstanceUserResponse.fromJson(response);
  }

  /// Lists the tags applied to an Amazon Chime SDK meeting resource.
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
  Future<ListMeetingTagsResponse> listMeetingTags({
    required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId)}/tags',
      exceptionFnMap: _exceptionFns,
    );
    return ListMeetingTagsResponse.fromJson(response);
  }

  /// Lists up to 100 active Amazon Chime SDK meetings. For more information
  /// about the Amazon Chime SDK, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/dg/meetings-sdk.html">Using
  /// the Amazon Chime SDK</a> in the <i>Amazon Chime Developer Guide</i>.
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
  Future<ListProxySessionsResponse> listProxySessions({
    required String voiceConnectorId,
    int? maxResults,
    String? nextToken,
    ProxySessionStatus? status,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
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
    _s.validateStringLength(
      'nextToken',
      nextToken,
      0,
      65535,
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

  /// Lists the tags applied to an Amazon Chime SDK meeting resource.
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
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
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
  Future<ListVoiceConnectorTerminationCredentialsResponse>
      listVoiceConnectorTerminationCredentials({
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=logout',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sets the amount of time in days that a given app instance retains data.
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
  /// The ARN of the app instance.
  ///
  /// Parameter [appInstanceRetentionSettings] :
  /// The time in days to retain data. Data type: number.
  Future<PutAppInstanceRetentionSettingsResponse>
      putAppInstanceRetentionSettings({
    required String appInstanceArn,
    required AppInstanceRetentionSettings appInstanceRetentionSettings,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        appInstanceRetentionSettings, 'appInstanceRetentionSettings');
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

  /// The data streaming configurations of an app instance.
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
  /// The ARN of the app instance.
  ///
  /// Parameter [appInstanceStreamingConfigurations] :
  /// The streaming configurations set for an app instance.
  Future<PutAppInstanceStreamingConfigurationsResponse>
      putAppInstanceStreamingConfigurations({
    required String appInstanceArn,
    required List<AppInstanceStreamingConfiguration>
        appInstanceStreamingConfigurations,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(appInstanceStreamingConfigurations,
        'appInstanceStreamingConfigurations');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(botId, 'botId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(retentionSettings, 'retentionSettings');
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
  /// The ID of the specified SIP media application
  ///
  /// Parameter [sipMediaApplicationLoggingConfiguration] :
  /// The actual logging configuration.
  Future<PutSipMediaApplicationLoggingConfigurationResponse>
      putSipMediaApplicationLoggingConfiguration({
    required String sipMediaApplicationId,
    SipMediaApplicationLoggingConfiguration?
        sipMediaApplicationLoggingConfiguration,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
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
  Future<PutVoiceConnectorEmergencyCallingConfigurationResponse>
      putVoiceConnectorEmergencyCallingConfiguration({
    required EmergencyCallingConfiguration emergencyCallingConfiguration,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(
        emergencyCallingConfiguration, 'emergencyCallingConfiguration');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<PutVoiceConnectorLoggingConfigurationResponse>
      putVoiceConnectorLoggingConfiguration({
    required LoggingConfiguration loggingConfiguration,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(loggingConfiguration, 'loggingConfiguration');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  /// </note>
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
  Future<PutVoiceConnectorOriginationResponse> putVoiceConnectorOrigination({
    required Origination origination,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(origination, 'origination');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<PutVoiceConnectorProxyResponse> putVoiceConnectorProxy({
    required int defaultSessionExpiryMinutes,
    required List<String> phoneNumberPoolCountries,
    required String voiceConnectorId,
    bool? disabled,
    String? fallBackPhoneNumber,
  }) async {
    ArgumentError.checkNotNull(
        defaultSessionExpiryMinutes, 'defaultSessionExpiryMinutes');
    ArgumentError.checkNotNull(
        phoneNumberPoolCountries, 'phoneNumberPoolCountries');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
  /// is enabled for sending to Amazon Kinesis. It also sets the retention
  /// period, in hours, for the Amazon Kinesis data.
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
  Future<PutVoiceConnectorStreamingConfigurationResponse>
      putVoiceConnectorStreamingConfiguration({
    required StreamingConfiguration streamingConfiguration,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(
        streamingConfiguration, 'streamingConfiguration');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  /// </note>
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
  Future<PutVoiceConnectorTerminationResponse> putVoiceConnectorTermination({
    required Termination termination,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(termination, 'termination');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<void> putVoiceConnectorTerminationCredentials({
    required String voiceConnectorId,
    List<Credential>? credentials,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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
  Future<RedactChannelMessageResponse> redactChannelMessage({
    required String channelArn,
    required String messageId,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringLength(
      'messageId',
      messageId,
      1,
      128,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    ArgumentError.checkNotNull(messageId, 'messageId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(messageId, 'messageId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(botId, 'botId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
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
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId)}?operation=restore',
      exceptionFnMap: _exceptionFns,
    );
    return RestorePhoneNumberResponse.fromJson(response);
  }

  /// Searches phone numbers that can be ordered.
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
  /// The area code used to filter results.
  ///
  /// Parameter [city] :
  /// The city used to filter results.
  ///
  /// Parameter [country] :
  /// The country used to filter results.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results.
  ///
  /// Parameter [state] :
  /// The state used to filter results.
  ///
  /// Parameter [tollFreePrefix] :
  /// The toll-free prefix that you use to filter results.
  Future<SearchAvailablePhoneNumbersResponse> searchAvailablePhoneNumbers({
    String? areaCode,
    String? city,
    String? country,
    int? maxResults,
    String? nextToken,
    String? state,
    String? tollFreePrefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    _s.validateStringLength(
      'tollFreePrefix',
      tollFreePrefix,
      3,
      3,
    );
    final $query = <String, List<String>>{
      if (areaCode != null) 'area-code': [areaCode],
      if (city != null) 'city': [city],
      if (country != null) 'country': [country],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
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
  /// <code>STANDARD</code> messages can contain 4KB of data and the 1KB of
  /// metadata. <code>CONTROL</code> messages can contain 30 bytes of data and
  /// no metadata.
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
  /// Parameter [clientRequestToken] :
  /// The <code>Idempotency</code> token for each client request.
  ///
  /// Parameter [metadata] :
  /// The optional metadata for each message.
  Future<SendChannelMessageResponse> sendChannelMessage({
    required String channelArn,
    required String content,
    required ChannelMessagePersistenceType persistence,
    required ChannelMessageType type,
    String? clientRequestToken,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      4096,
      isRequired: true,
    );
    ArgumentError.checkNotNull(persistence, 'persistence');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
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
      exceptionFnMap: _exceptionFns,
    );
    return SendChannelMessageResponse.fromJson(response);
  }

  /// Applies the specified tags to the specified Amazon Chime SDK attendee.
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
  Future<void> tagAttendee({
    required String attendeeId,
    required String meetingId,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    ArgumentError.checkNotNull(tags, 'tags');
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
  Future<void> tagMeeting({
    required String meetingId,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    ArgumentError.checkNotNull(tags, 'tags');
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
  Future<void> tagResource({
    required String resourceARN,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
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
  Future<void> untagAttendee({
    required String attendeeId,
    required String meetingId,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  Future<void> untagMeeting({
    required String meetingId,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  Future<void> untagResource({
    required String resourceARN,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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
  /// only account name updates are supported for this action.
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
  /// Parameter [name] :
  /// The new name for the specified Amazon Chime account.
  Future<UpdateAccountResponse> updateAccount({
    required String accountId,
    String? name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    final $payload = <String, dynamic>{
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(accountSettings, 'accountSettings');
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
  /// The ARN of the app instance.
  ///
  /// Parameter [name] :
  /// The name that you want to change.
  ///
  /// Parameter [metadata] :
  /// The metadata that you want to change.
  Future<UpdateAppInstanceResponse> updateAppInstance({
    required String appInstanceArn,
    required String name,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
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

  /// Updates the details for an <code>AppInstanceUser</code>. You can update
  /// names and metadata.
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
  /// The ARN of the app instance user.
  ///
  /// Parameter [name] :
  /// The name of the app instance user.
  ///
  /// Parameter [metadata] :
  /// The metadata of the app instance user.
  Future<UpdateAppInstanceUserResponse> updateAppInstanceUser({
    required String appInstanceUserArn,
    required String name,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(botId, 'botId');
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
  /// Parameter [metadata] :
  /// The metadata of the channel.
  Future<UpdateChannelResponse> updateChannel({
    required String channelArn,
    required ChannelMode mode,
    required String name,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(mode, 'mode');
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      'Mode': mode.toValue(),
      'Name': name,
      if (metadata != null) 'Metadata': metadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelResponse.fromJson(response);
  }

  /// Updates the content of a message.
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
  /// Parameter [content] :
  /// The content of the message being updated.
  ///
  /// Parameter [metadata] :
  /// The metadata of the message being updated.
  Future<UpdateChannelMessageResponse> updateChannelMessage({
    required String channelArn,
    required String messageId,
    String? content,
    String? metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringLength(
      'messageId',
      messageId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringLength(
      'content',
      content,
      0,
      4096,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    final $payload = <String, dynamic>{
      if (content != null) 'Content': content,
      if (metadata != null) 'Metadata': metadata,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/channels/${Uri.encodeComponent(channelArn)}/messages/${Uri.encodeComponent(messageId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateChannelMessageResponse.fromJson(response);
  }

  /// Sets the timestamp to the point when a user last read messages in a
  /// channel.
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
  Future<UpdateChannelReadMarkerResponse> updateChannelReadMarker({
    required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri: '/channels/${Uri.encodeComponent(channelArn)}/readMarker',
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
    required BusinessCallingSettings businessCalling,
    required VoiceConnectorSettings voiceConnector,
  }) async {
    ArgumentError.checkNotNull(businessCalling, 'businessCalling');
    ArgumentError.checkNotNull(voiceConnector, 'voiceConnector');
    final $payload = <String, dynamic>{
      'BusinessCalling': businessCalling,
      'VoiceConnector': voiceConnector,
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
  /// For toll-free numbers, you must use the Amazon Chime Voice Connector
  /// product type.
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
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
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
    ArgumentError.checkNotNull(callingName, 'callingName');
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
  Future<UpdateProxySessionResponse> updateProxySession({
    required List<Capability> capabilities,
    required String proxySessionId,
    required String voiceConnectorId,
    int? expiryMinutes,
  }) async {
    ArgumentError.checkNotNull(capabilities, 'capabilities');
    ArgumentError.checkNotNull(proxySessionId, 'proxySessionId');
    _s.validateStringLength(
      'proxySessionId',
      proxySessionId,
      1,
      128,
      isRequired: true,
    );
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(memberId, 'memberId');
    ArgumentError.checkNotNull(roomId, 'roomId');
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

  /// Updates the details for the specified SIP media application.
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
  Future<UpdateSipMediaApplicationResponse> updateSipMediaApplication({
    required String sipMediaApplicationId,
    List<SipMediaApplicationEndpoint>? endpoints,
    String? name,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
    );
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

  /// Updates the details for the specified SIP rule.
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
  Future<UpdateSipRuleResponse> updateSipRule({
    required String name,
    required String sipRuleId,
    bool? disabled,
    List<SipRuleTargetApplication>? targetApplications,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(sipRuleId, 'sipRuleId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
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
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
    ArgumentError.checkNotNull(userSettings, 'userSettings');
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
  Future<UpdateVoiceConnectorResponse> updateVoiceConnector({
    required String name,
    required bool requireEncryption,
    required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(requireEncryption, 'requireEncryption');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
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

  /// Updates details for the specified Amazon Chime Voice Connector group, such
  /// as the name and Amazon Chime Voice Connector priority ranking.
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
  Future<UpdateVoiceConnectorGroupResponse> updateVoiceConnectorGroup({
    required String name,
    required String voiceConnectorGroupId,
    required List<VoiceConnectorItem> voiceConnectorItems,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    ArgumentError.checkNotNull(voiceConnectorItems, 'voiceConnectorItems');
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

/// An instance of a Chime messaging application.
class AppInstance {
  /// The ARN of the messaging instance.
  final String? appInstanceArn;

  /// The time at which an app instance was created. In epoch milliseconds.
  final DateTime? createdTimestamp;

  /// The time an app instance was last updated. In epoch milliseconds.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata of an app instance.
  final String? metadata;

  /// The name of an app instance.
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
}

/// Promotes a user to the administrator role for the duration of an app
/// instance.
class AppInstanceAdmin {
  /// The name and metadata of the app instance administrator.
  final Identity? admin;

  /// The ARN of the app instance administrator.
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
}

/// The identity and metadata of an administrator.
class AppInstanceAdminSummary {
  /// The name and metadata of the app instance administrator.
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

/// The length of time in days to retain messages.
class AppInstanceRetentionSettings {
  /// The length of time in days to retain a channel.
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

/// The streaming configuration of an app instance.
class AppInstanceStreamingConfiguration {
  /// The data type of the app instance.
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

/// The summary data for an app instance.
class AppInstanceSummary {
  /// The app instance ARN.
  final String? appInstanceArn;

  /// The metadata of the app instance summary.
  final String? metadata;

  /// The name of the app instance summary.
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
}

/// The app instance user.
class AppInstanceUser {
  /// The ARN of the app instance user.
  final String? appInstanceUserArn;

  /// The time at which the app instance user was created.
  final DateTime? createdTimestamp;

  /// The time at which the app instance user was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata of the app instance user.
  final String? metadata;

  /// The name of the app instance user.
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
}

/// Lists the channels to which app instance users belong.
class AppInstanceUserMembershipSummary {
  /// The time at which a summary was last read.
  final DateTime? readMarkerTimestamp;

  /// The type of channel summary,
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
}

/// The app instance user summary data .
class AppInstanceUserSummary {
  /// The ARN of the app instance user.
  final String? appInstanceUserArn;

  /// The metadata in an app instance user summary.
  final String? metadata;

  /// The name in an app instance user summary.
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
}

class AssociatePhoneNumberWithUserResponse {
  AssociatePhoneNumberWithUserResponse();
  factory AssociatePhoneNumberWithUserResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociatePhoneNumberWithUserResponse();
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
}

class AssociateSigninDelegateGroupsWithAccountResponse {
  AssociateSigninDelegateGroupsWithAccountResponse();
  factory AssociateSigninDelegateGroupsWithAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return AssociateSigninDelegateGroupsWithAccountResponse();
  }
}

/// An Amazon Chime SDK meeting attendee. Includes a unique
/// <code>AttendeeId</code> and <code>JoinToken</code>. The
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
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
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

/// Creates a channel.
class Channel {
  /// The ARN of the channel.
  final String? channelArn;

  /// The administrator who created the channel.
  final Identity? createdBy;

  /// The time at which the administrator created the channel.
  final DateTime? createdTimestamp;

  /// The time at which a member sent the last message in a session.
  final DateTime? lastMessageTimestamp;

  /// The time at which a channel was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata of the channel.
  final String? metadata;

  /// The mode of the channel.
  final ChannelMode? mode;

  /// The name of the channel.
  final String? name;

  /// The channel's privacy setting, <code>PUBLIC</code> or <code>HIDDEN</code>.
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
}

/// Bans a user from a channel.
class ChannelBan {
  /// The ARN of the channel from which a member is being banned.
  final String? channelArn;

  /// The parameter of the action.
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
}

/// The summary data for the channel ban.
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
}

/// Creates a channel member.
class ChannelMembership {
  /// The ARN of the member's channel.
  final String? channelArn;

  /// The time at which the channel membership was created.
  final DateTime? createdTimestamp;

  /// The identifier of the member who invited another member. Taken from the
  /// message header.
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
}

/// Returns the channel membership summary data for an app instance.
class ChannelMembershipForAppInstanceUserSummary {
  /// Returns the channel membership data for an app instance.
  final AppInstanceUserMembershipSummary? appInstanceUserMembershipSummary;
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
}

/// The summary data of a channel membership.
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

/// Creates a message in a channel.
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
  final ChannelMessagePersistenceType? persistence;

  /// Hides the content of a message. The message still exists on the back end,
  /// but this action only returns metadata.
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

/// A summary of the messages in a channel.
class ChannelMessageSummary {
  /// The content of the message summary.
  final String? content;

  /// The time at which the message summary was created.
  final DateTime? createdTimestamp;
  final DateTime? lastEditedTimestamp;
  final DateTime? lastUpdatedTimestamp;

  /// The ID of the message summary.
  final String? messageId;

  /// The metadata of the message summary.
  final String? metadata;

  /// Redacts the content of a message summary.
  final bool? redacted;

  /// The sender of the message summary.
  final Identity? sender;

  /// The type of message summary.
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

/// Returns the summary data for a moderated channel.
class ChannelModeratedByAppInstanceUserSummary {
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
}

/// Creates a moderator on a channel.
class ChannelModerator {
  /// The ARN of the moderator's channel.
  final String? channelArn;

  /// The member who created the moderator.
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
}

/// Summary data of the moderators in a channel.
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

/// The retention settings for a channel.
class ChannelRetentionSettings {
  /// The time in days to retain a channel.
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

/// The summary data for a channel.
class ChannelSummary {
  /// The ARN of the channel summary.
  final String? channelArn;

  /// The time at which the last message in a channel was sent.
  final DateTime? lastMessageTimestamp;

  /// The metadata of the channel summary.
  final String? metadata;

  /// The summary mode of the channel.
  final ChannelMode? mode;

  /// The parameter of the action.
  final String? name;

  /// The privacy setting of the channel being summarized, <code>PUBLIC</code> or
  /// <code>HIDDEN</code>.
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
}

/// The retention settings that determine how long to retain chat conversation
/// messages for an Amazon Chime Enterprise account.
class ConversationRetentionSettings {
  /// The number of days for which to retain chat conversation messages.
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
}

class CreateAppInstanceAdminResponse {
  /// The name and ARN of the admin for the app instance.
  final Identity? appInstanceAdmin;

  /// The ARN of the of the admin for the app instance.
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
}

class CreateAppInstanceResponse {
  /// The Amazon Resource Number (ARN) of the app instance.
  final String? appInstanceArn;

  CreateAppInstanceResponse({
    this.appInstanceArn,
  });
  factory CreateAppInstanceResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppInstanceResponse(
      appInstanceArn: json['AppInstanceArn'] as String?,
    );
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
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
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
}

/// The Amazon Chime SDK attendee fields to create, used with the
/// BatchCreateAttendee action.
class CreateAttendeeRequestItem {
  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
  ///
  /// The Amazon Chime SDK external user ID. Links the attendee to an identity
  /// managed by a builder application.
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
}

class CreateMeetingResponse {
  /// The meeting information, including the meeting ID and
  /// <code>MediaPlacement</code>.
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
}

class CreateMeetingWithAttendeesResponse {
  /// The attendee information, including attendees IDs and join tokens.
  final List<Attendee>? attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  final List<CreateAttendeeError>? errors;
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
}

class CreateSipMediaApplicationResponse {
  /// The Sip media application details.
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
}

class CreateUserResponse {
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
}

class DescribeAppInstanceAdminResponse {
  /// The ARN and name of the app instance user, the ARN of the app instance, and
  /// the created and last-updated timestamps. All timestamps use epoch
  /// milliseconds.
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
}

class DescribeAppInstanceResponse {
  /// The ARN, metadata, created and last-updated timestamps, and the name of the
  /// app instance. All timestamps use epoch milliseconds.
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
}

class DescribeAppInstanceUserResponse {
  /// The name of the app instance user.
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
}

class DescribeChannelBanResponse {
  /// The the details of the ban.
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
}

class DisassociatePhoneNumberFromUserResponse {
  DisassociatePhoneNumberFromUserResponse();
  factory DisassociatePhoneNumberFromUserResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociatePhoneNumberFromUserResponse();
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
}

class DisassociateSigninDelegateGroupsFromAccountResponse {
  DisassociateSigninDelegateGroupsFromAccountResponse();
  factory DisassociateSigninDelegateGroupsFromAccountResponse.fromJson(
      Map<String, dynamic> _) {
    return DisassociateSigninDelegateGroupsFromAccountResponse();
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
}

class GetAppInstanceRetentionSettingsResponse {
  /// The retention settings for the app instance.
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
}

/// The ARN and name of a user.
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
  /// The list of accounts.
  final List<Account>? accounts;

  /// The account's user token.
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
}

class ListAppInstanceAdminsResponse {
  /// The information for each administrator.
  final List<AppInstanceAdminSummary>? appInstanceAdmins;

  /// The ARN of the app instance.
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
}

class ListAppInstanceUsersResponse {
  /// The ARN of the app instance.
  final String? appInstanceArn;

  /// The information for each of the requested app instance users.
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
}

class ListAppInstancesResponse {
  /// The information for each app instance.
  final List<AppInstanceSummary>? appInstances;

  /// The token passed by previous API requests until the maximum number of app
  /// instances is reached.
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
}

class ListChannelMembershipsForAppInstanceUserResponse {
  /// The token passed by previous API calls until all requested users are
  /// returned.
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
}

class ListChannelMessagesResponse {
  /// The ARN of the channel containing the requested messages.
  final String? channelArn;

  /// The information about and content of each requested message.
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
}

/// The logging configuration associated with an Amazon Chime Voice Connector.
/// Specifies whether SIP message logs are enabled for sending to Amazon
/// CloudWatch Logs.
class LoggingConfiguration {
  /// When true, enables SIP message logs for sending to Amazon CloudWatch Logs.
  final bool? enableSIPLogs;

  LoggingConfiguration({
    this.enableSIPLogs,
  });
  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return LoggingConfiguration(
      enableSIPLogs: json['EnableSIPLogs'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enableSIPLogs = this.enableSIPLogs;
    return {
      if (enableSIPLogs != null) 'EnableSIPLogs': enableSIPLogs,
    };
  }
}

class LogoutUserResponse {
  LogoutUserResponse();
  factory LogoutUserResponse.fromJson(Map<String, dynamic> _) {
    return LogoutUserResponse();
  }
}

/// A set of endpoints used by clients to connect to the media service group for
/// a Amazon Chime SDK meeting.
class MediaPlacement {
  /// The audio fallback URL.
  final String? audioFallbackUrl;

  /// The audio host URL.
  final String? audioHostUrl;

  /// The screen data URL.
  final String? screenDataUrl;

  /// The screen sharing URL.
  final String? screenSharingUrl;

  /// The screen viewing URL.
  final String? screenViewingUrl;

  /// The signaling URL.
  final String? signalingUrl;

  /// The turn control URL.
  final String? turnControlUrl;

  MediaPlacement({
    this.audioFallbackUrl,
    this.audioHostUrl,
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
      screenDataUrl: json['ScreenDataUrl'] as String?,
      screenSharingUrl: json['ScreenSharingUrl'] as String?,
      screenViewingUrl: json['ScreenViewingUrl'] as String?,
      signalingUrl: json['SignalingUrl'] as String?,
      turnControlUrl: json['TurnControlUrl'] as String?,
    );
  }
}

/// A meeting created using the Amazon Chime SDK.
class Meeting {
  /// The external meeting ID.
  final String? externalMeetingId;

  /// The media placement for the meeting.
  final MediaPlacement? mediaPlacement;

  /// The Region in which to create the meeting. Available values:
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
}

/// The configuration for resource targets to receive notifications when Amazon
/// Chime SDK meeting and attendee events occur. The Amazon Chime SDK supports
/// resource targets located in the US East (N. Virginia) AWS Region
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

/// The endpoint of a meeting session.
class MessagingSessionEndpoint {
  /// The URL of a meeting session endpoint.
  final String? url;

  MessagingSessionEndpoint({
    this.url,
  });
  factory MessagingSessionEndpoint.fromJson(Map<String, dynamic> json) {
    return MessagingSessionEndpoint(
      url: json['Url'] as String?,
    );
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
class Origination {
  /// When origination settings are disabled, inbound calls are not enabled for
  /// your Amazon Chime Voice Connector.
  final bool? disabled;

  /// The call distribution properties defined for your SIP hosts. Valid range:
  /// Minimum value of 1. Maximum value of 20.
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
  /// are distributed among them based on their relative weight.
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
}

/// The details of a phone number order created for Amazon Chime.
class PhoneNumberOrder {
  /// The phone number order creation timestamp, in ISO 8601 format.
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

  /// The updated phone number order timestamp, in ISO 8601 format.
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
}

extension PhoneNumberProductTypeValueExtension on PhoneNumberProductType {
  String toValue() {
    switch (this) {
      case PhoneNumberProductType.businessCalling:
        return 'BusinessCalling';
      case PhoneNumberProductType.voiceConnector:
        return 'VoiceConnector';
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
}

/// The proxy session for an Amazon Chime Voice Connector.
class ProxySession {
  /// The proxy session capabilities.
  final List<Capability>? capabilities;

  /// The created timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// The ended timestamp, in ISO 8601 format.
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

  /// The updated timestamp, in ISO 8601 format.
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
}

class PutAppInstanceStreamingConfigurationsResponse {
  /// The streaming configurations of an app instance.
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
}

class PutEventsConfigurationResponse {
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
}

class PutSipMediaApplicationLoggingConfigurationResponse {
  /// The actual logging configuration.
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
}

class RedactConversationMessageResponse {
  RedactConversationMessageResponse();
  factory RedactConversationMessageResponse.fromJson(Map<String, dynamic> _) {
    return RedactConversationMessageResponse();
  }
}

class RedactRoomMessageResponse {
  RedactRoomMessageResponse();
  factory RedactRoomMessageResponse.fromJson(Map<String, dynamic> _) {
    return RedactRoomMessageResponse();
  }
}

class RegenerateSecurityTokenResponse {
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
}

/// The retention settings for an Amazon Chime Enterprise account that determine
/// how long to retain items such as chat room messages and chat conversation
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
}

/// The room membership details.
class RoomMembership {
  /// The identifier of the user that invited the room member.
  final String? invitedBy;
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

/// The retention settings that determine how long to retain chat room messages
/// for an Amazon Chime Enterprise account.
class RoomRetentionSettings {
  /// The number of days for which to retain chat room messages.
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

  SearchAvailablePhoneNumbersResponse({
    this.e164PhoneNumbers,
  });
  factory SearchAvailablePhoneNumbersResponse.fromJson(
      Map<String, dynamic> json) {
    return SearchAvailablePhoneNumbersResponse(
      e164PhoneNumbers: (json['E164PhoneNumbers'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
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

/// The SIP media application details, including name and endpoints. An AWS
/// account can have multiple SIP media applications.
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
}

/// Endpoints to specify as part of a SIP media application.
class SipMediaApplicationEndpoint {
  /// Valid Amazon Resource Name (ARN) of the Lambda function of the same AWS
  /// Region where the SIP media application is created.
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
  /// The SIP rule created timestamp, in ISO 8601 format.
  final DateTime? createdTimestamp;

  /// Indicates if the SIP rule is enabled or disabled. You must disable a rule
  /// before you can delete it.
  final bool? disabled;

  /// The name of the SIP rule.
  final String? name;

  /// The SIP rule ID.
  final String? sipRuleId;

  /// List of SIP media applications with priority and AWS Region. You can only
  /// use one SIP application per AWS Region and priority combination.
  final List<SipRuleTargetApplication>? targetApplications;

  /// The type of trigger whose value is assigned to the SIP rule in
  /// <code>TriggerValue</code>.
  final SipRuleTriggerType? triggerType;

  /// If <code>TriggerType</code> is <code>RequestUriHostname</code>, then the
  /// value can be the outbound host name of the Amazon Chime Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code>, then the value can
  /// be a customer-owned phone number in E164 format. <code>SipRule</code> is
  /// triggered when a SIP rule requests host name or <code>ToPhoneNumber</code>
  /// matches in the incoming SIP request.
  final String? triggerValue;

  /// The SIP rule updated timestamp, in ISO 8601 format.
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
}

/// Target SIP media application along with other details like priority and AWS
/// Region to be specified in the SIP rule. Only one SIP rule per AWS Region can
/// be provided.
class SipRuleTargetApplication {
  /// AWS Region of target application.
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
}

class UpdateAccountResponse {
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
}

class UpdateAccountSettingsResponse {
  UpdateAccountSettingsResponse();
  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> _) {
    return UpdateAccountSettingsResponse();
  }
}

class UpdateAppInstanceResponse {
  /// The ARN of the app instance.
  final String? appInstanceArn;

  UpdateAppInstanceResponse({
    this.appInstanceArn,
  });
  factory UpdateAppInstanceResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppInstanceResponse(
      appInstanceArn: json['AppInstanceArn'] as String?,
    );
  }
}

class UpdateAppInstanceUserResponse {
  /// The ARN of the app instance user.
  final String? appInstanceUserArn;

  UpdateAppInstanceUserResponse({
    this.appInstanceUserArn,
  });
  factory UpdateAppInstanceUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppInstanceUserResponse(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
    );
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

  /// The Amazon Chime Voice Connector ID.
  final String? voiceConnectorId;

  VoiceConnector({
    this.awsRegion,
    this.createdTimestamp,
    this.name,
    this.outboundHostName,
    this.requireEncryption,
    this.updatedTimestamp,
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
      voiceConnectorId: json['VoiceConnectorId'] as String?,
    );
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
  /// The Amazon Chime Voice Connector group creation timestamp, in ISO 8601
  /// format.
  final DateTime? createdTimestamp;

  /// The name of the Amazon Chime Voice Connector group.
  final String? name;

  /// The updated Amazon Chime Voice Connector group timestamp, in ISO 8601
  /// format.
  final DateTime? updatedTimestamp;

  /// The Amazon Chime Voice Connector group ID.
  final String? voiceConnectorGroupId;

  /// The Amazon Chime Voice Connectors to which to route inbound calls.
  final List<VoiceConnectorItem>? voiceConnectorItems;

  VoiceConnectorGroup({
    this.createdTimestamp,
    this.name,
    this.updatedTimestamp,
    this.voiceConnectorGroupId,
    this.voiceConnectorItems,
  });
  factory VoiceConnectorGroup.fromJson(Map<String, dynamic> json) {
    return VoiceConnectorGroup(
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      name: json['Name'] as String?,
      updatedTimestamp: timeStampFromJson(json['UpdatedTimestamp']),
      voiceConnectorGroupId: json['VoiceConnectorGroupId'] as String?,
      voiceConnectorItems: (json['VoiceConnectorItems'] as List?)
          ?.whereNotNull()
          .map((e) => VoiceConnectorItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
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
