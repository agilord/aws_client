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
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Associates the specified sign-in delegate groups with the specified Amazon
  /// Chime account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Adds up to 50 members to a chat room in an Amazon Chime Enterprise
  /// account. Members can be users or bots. The member role designates whether
  /// the member is a chat room administrator or a general chat room member.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Creates a bot for an Amazon Chime Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Uses the join token and call metadata in a meeting request (From number,
  /// To number, and so forth) to initiate an outbound call to a public switched
  /// telephone network (PSTN) and join them into a Chime meeting. Also ensures
  /// that the From number belongs to the customer.
  ///
  /// To play welcome audio or implement an interactive voice response (IVR),
  /// use the <code>CreateSipMediaApplicationCall</code> action with the
  /// corresponding SIP media application ID.
  /// <important>
  /// <b>This API is not available in a dedicated namespace.</b>
  /// </important>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Creates an order for phone numbers to be provisioned. For toll-free
  /// numbers, you cannot use the Amazon Chime Business Calling product type.
  /// For numbers outside the U.S., you must use the Amazon Chime SIP Media
  /// Application Dial-In product type.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      'ProductType': productType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/phone-number-orders',
      exceptionFnMap: _exceptionFns,
    );
    return CreatePhoneNumberOrderResponse.fromJson(response);
  }

  /// Creates a chat room for the specified Amazon Chime Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (role != null) 'Role': role.value,
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

  /// Creates a user under the specified Amazon Chime account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (userType != null) 'UserType': userType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [UnprocessableEntityException].
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

  /// Deletes the events configuration that allows a bot to receive outgoing
  /// events.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedClientException].
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

  /// Moves the specified phone number into the <b>Deletion queue</b>. A phone
  /// number must be disassociated from any users or Amazon Chime Voice
  /// Connectors before it can be deleted.
  ///
  /// Deleted phone numbers remain in the <b>Deletion queue</b> for 7 days
  /// before they are deleted permanently.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Deletes a chat room in an Amazon Chime Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Disassociates the primary provisioned phone number from the specified
  /// Amazon Chime user.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Disassociates the specified sign-in delegate groups from the specified
  /// Amazon Chime account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Retrieves details for the specified bot, such as bot email address, bot
  /// type, status, and display name.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Gets details for an events configuration that allows a bot to receive
  /// outgoing events, such as an HTTPS endpoint or Lambda function ARN.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  Future<GetGlobalSettingsResponse> getGlobalSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetGlobalSettingsResponse.fromJson(response);
  }

  /// Retrieves details for the specified phone number ID, such as associations,
  /// capabilities, and product type.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  Future<GetPhoneNumberSettingsResponse> getPhoneNumberSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/settings/phone-number',
      exceptionFnMap: _exceptionFns,
    );
    return GetPhoneNumberSettingsResponse.fromJson(response);
  }

  /// Gets the retention settings for the specified Amazon Chime Enterprise
  /// account. For more information about retention settings, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/chat-retention.html">Managing
  /// Chat Retention Policies</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Retrieves details for the specified user ID, such as primary email
  /// address, license type,and personal meeting PIN.
  ///
  /// To retrieve user details with an email address instead of a user ID, use
  /// the <a>ListUsers</a> action, and then filter by email address.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Sends email to a maximum of 50 users, inviting them to the specified
  /// Amazon Chime <code>Team</code> account. Only <code>Team</code> account
  /// types are currently supported for this action.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (userType != null) 'UserType': userType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Lists the bots associated with the administrator's Amazon Chime Enterprise
  /// account ID.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Lists the phone number orders for the administrator's Amazon Chime
  /// account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (filterName != null) 'filter-name': [filterName.value],
      if (filterValue != null) 'filter-value': [filterValue],
      if (maxResults != null) 'max-results': [maxResults.toString()],
      if (nextToken != null) 'next-token': [nextToken],
      if (productType != null) 'product-type': [productType.value],
      if (status != null) 'status': [status.value],
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

  /// Lists the membership details for the specified room in an Amazon Chime
  /// Enterprise account, such as the members' IDs, email addresses, and names.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Lists supported phone number countries.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  ///
  /// Parameter [productType] :
  /// The phone number product type.
  Future<ListSupportedPhoneNumberCountriesResponse>
      listSupportedPhoneNumberCountries({
    required PhoneNumberProductType productType,
  }) async {
    final $query = <String, List<String>>{
      'product-type': [productType.value],
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

  /// Lists the users that belong to the specified Amazon Chime account. You can
  /// specify an email address to list only the user that the email address
  /// belongs to.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (userType != null) 'user-type': [userType.value],
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

  /// Logs out the specified user from all of the devices they are currently
  /// logged into.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Creates an events configuration that allows a bot to receive outgoing
  /// events sent by Amazon Chime. Choose either an HTTPS endpoint or a Lambda
  /// function ARN. For more information, see <a>Bot</a>.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Redacts the specified message from the specified Amazon Chime
  /// conversation.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ResourceLimitExceededException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [AccessDeniedException].
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (phoneNumberType != null) 'phone-number-type': [phoneNumberType.value],
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

  /// Updates account details for the specified Amazon Chime account. Currently,
  /// only account name and default license updates are supported for this
  /// action.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (defaultLicense != null) 'DefaultLicense': defaultLicense.value,
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Updates the status of the specified bot, such as starting or stopping the
  /// bot from running in your Amazon Chime Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Updates global settings for the administrator's AWS account, such as
  /// Amazon Chime Business Calling and Amazon Chime Voice Connector settings.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ConflictException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (productType != null) 'ProductType': productType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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

  /// Updates room details, such as the room name, for a room in an Amazon Chime
  /// Enterprise account.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (role != null) 'Role': role.value,
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

  /// Updates user details for a specified user ID. Currently, only
  /// <code>LicenseType</code> updates are supported for this action.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
      if (licenseType != null) 'LicenseType': licenseType.value,
      if (userType != null) 'UserType': userType.value,
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
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [NotFoundException].
  /// May throw [ServiceFailureException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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

class DeleteAccountResponse {
  DeleteAccountResponse();

  factory DeleteAccountResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAccountResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

class InviteUsersResponse {
  /// The email invitation details.
  final List<Invite>? invites;

  InviteUsersResponse({
    this.invites,
  });

  factory InviteUsersResponse.fromJson(Map<String, dynamic> json) {
    return InviteUsersResponse(
      invites: (json['Invites'] as List?)
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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

class LogoutUserResponse {
  LogoutUserResponse();

  factory LogoutUserResponse.fromJson(Map<String, dynamic> _) {
    return LogoutUserResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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
          ?.nonNulls
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
      telephony: TelephonySettings.fromJson(
          (json['Telephony'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final telephony = this.telephony;
    return {
      'Telephony': telephony,
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
      inboundCalling: (json['InboundCalling'] as bool?) ?? false,
      outboundCalling: (json['OutboundCalling'] as bool?) ?? false,
      sms: (json['SMS'] as bool?) ?? false,
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
      userId: (json['UserId'] as String?) ?? '',
      accountId: json['AccountId'] as String?,
      alexaForBusinessMetadata: json['AlexaForBusinessMetadata'] != null
          ? AlexaForBusinessMetadata.fromJson(
              json['AlexaForBusinessMetadata'] as Map<String, dynamic>)
          : null,
      displayName: json['DisplayName'] as String?,
      invitedOn: timeStampFromJson(json['InvitedOn']),
      licenseType: (json['LicenseType'] as String?)?.let(License.fromString),
      personalPIN: json['PersonalPIN'] as String?,
      primaryEmail: json['PrimaryEmail'] as String?,
      primaryProvisionedNumber: json['PrimaryProvisionedNumber'] as String?,
      registeredOn: timeStampFromJson(json['RegisteredOn']),
      userInvitationStatus: (json['UserInvitationStatus'] as String?)
          ?.let(InviteStatus.fromString),
      userRegistrationStatus: (json['UserRegistrationStatus'] as String?)
          ?.let(RegistrationStatus.fromString),
      userType: (json['UserType'] as String?)?.let(UserType.fromString),
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
      if (licenseType != null) 'LicenseType': licenseType.value,
      if (personalPIN != null) 'PersonalPIN': personalPIN,
      if (primaryEmail != null) 'PrimaryEmail': primaryEmail,
      if (primaryProvisionedNumber != null)
        'PrimaryProvisionedNumber': primaryProvisionedNumber,
      if (registeredOn != null) 'RegisteredOn': iso8601ToJson(registeredOn),
      if (userInvitationStatus != null)
        'UserInvitationStatus': userInvitationStatus.value,
      if (userRegistrationStatus != null)
        'UserRegistrationStatus': userRegistrationStatus.value,
      if (userType != null) 'UserType': userType.value,
    };
  }
}

class License {
  static const basic = License._('Basic');
  static const plus = License._('Plus');
  static const pro = License._('Pro');
  static const proTrial = License._('ProTrial');

  final String value;

  const License._(this.value);

  static const values = [basic, plus, pro, proTrial];

  static License fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => License._(value));

  @override
  bool operator ==(other) => other is License && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class UserType {
  static const privateUser = UserType._('PrivateUser');
  static const sharedDevice = UserType._('SharedDevice');

  final String value;

  const UserType._(this.value);

  static const values = [privateUser, sharedDevice];

  static UserType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => UserType._(value));

  @override
  bool operator ==(other) => other is UserType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class RegistrationStatus {
  static const unregistered = RegistrationStatus._('Unregistered');
  static const registered = RegistrationStatus._('Registered');
  static const suspended = RegistrationStatus._('Suspended');

  final String value;

  const RegistrationStatus._(this.value);

  static const values = [unregistered, registered, suspended];

  static RegistrationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RegistrationStatus._(value));

  @override
  bool operator ==(other) =>
      other is RegistrationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class InviteStatus {
  static const pending = InviteStatus._('Pending');
  static const accepted = InviteStatus._('Accepted');
  static const failed = InviteStatus._('Failed');

  final String value;

  const InviteStatus._(this.value);

  static const values = [pending, accepted, failed];

  static InviteStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => InviteStatus._(value));

  @override
  bool operator ==(other) => other is InviteStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      role: (json['Role'] as String?)?.let(RoomMembershipRole.fromString),
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
      if (role != null) 'Role': role.value,
      if (roomId != null) 'RoomId': roomId,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
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
      memberType: (json['MemberType'] as String?)?.let(MemberType.fromString),
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
      if (memberType != null) 'MemberType': memberType.value,
    };
  }
}

class RoomMembershipRole {
  static const administrator = RoomMembershipRole._('Administrator');
  static const member = RoomMembershipRole._('Member');

  final String value;

  const RoomMembershipRole._(this.value);

  static const values = [administrator, member];

  static RoomMembershipRole fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RoomMembershipRole._(value));

  @override
  bool operator ==(other) =>
      other is RoomMembershipRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class MemberType {
  static const user = MemberType._('User');
  static const bot = MemberType._('Bot');
  static const webhook = MemberType._('Webhook');

  final String value;

  const MemberType._(this.value);

  static const values = [user, bot, webhook];

  static MemberType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => MemberType._(value));

  @override
  bool operator ==(other) => other is MemberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          ?.nonNulls
          .map(
              (e) => PhoneNumberAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      callingName: json['CallingName'] as String?,
      callingNameStatus: (json['CallingNameStatus'] as String?)
          ?.let(CallingNameStatus.fromString),
      capabilities: json['Capabilities'] != null
          ? PhoneNumberCapabilities.fromJson(
              json['Capabilities'] as Map<String, dynamic>)
          : null,
      country: json['Country'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      deletionTimestamp: timeStampFromJson(json['DeletionTimestamp']),
      e164PhoneNumber: json['E164PhoneNumber'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
      productType: (json['ProductType'] as String?)
          ?.let(PhoneNumberProductType.fromString),
      status: (json['Status'] as String?)?.let(PhoneNumberStatus.fromString),
      type: (json['Type'] as String?)?.let(PhoneNumberType.fromString),
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
        'CallingNameStatus': callingNameStatus.value,
      if (capabilities != null) 'Capabilities': capabilities,
      if (country != null) 'Country': country,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (deletionTimestamp != null)
        'DeletionTimestamp': iso8601ToJson(deletionTimestamp),
      if (e164PhoneNumber != null) 'E164PhoneNumber': e164PhoneNumber,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
      if (productType != null) 'ProductType': productType.value,
      if (status != null) 'Status': status.value,
      if (type != null) 'Type': type.value,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

class PhoneNumberType {
  static const local = PhoneNumberType._('Local');
  static const tollFree = PhoneNumberType._('TollFree');

  final String value;

  const PhoneNumberType._(this.value);

  static const values = [local, tollFree];

  static PhoneNumberType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberType._(value));

  @override
  bool operator ==(other) => other is PhoneNumberType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PhoneNumberProductType {
  static const businessCalling = PhoneNumberProductType._('BusinessCalling');
  static const voiceConnector = PhoneNumberProductType._('VoiceConnector');
  static const sipMediaApplicationDialIn =
      PhoneNumberProductType._('SipMediaApplicationDialIn');

  final String value;

  const PhoneNumberProductType._(this.value);

  static const values = [
    businessCalling,
    voiceConnector,
    sipMediaApplicationDialIn
  ];

  static PhoneNumberProductType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberProductType._(value));

  @override
  bool operator ==(other) =>
      other is PhoneNumberProductType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PhoneNumberStatus {
  static const acquireInProgress = PhoneNumberStatus._('AcquireInProgress');
  static const acquireFailed = PhoneNumberStatus._('AcquireFailed');
  static const unassigned = PhoneNumberStatus._('Unassigned');
  static const assigned = PhoneNumberStatus._('Assigned');
  static const releaseInProgress = PhoneNumberStatus._('ReleaseInProgress');
  static const deleteInProgress = PhoneNumberStatus._('DeleteInProgress');
  static const releaseFailed = PhoneNumberStatus._('ReleaseFailed');
  static const deleteFailed = PhoneNumberStatus._('DeleteFailed');

  final String value;

  const PhoneNumberStatus._(this.value);

  static const values = [
    acquireInProgress,
    acquireFailed,
    unassigned,
    assigned,
    releaseInProgress,
    deleteInProgress,
    releaseFailed,
    deleteFailed
  ];

  static PhoneNumberStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberStatus._(value));

  @override
  bool operator ==(other) => other is PhoneNumberStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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

class CallingNameStatus {
  static const unassigned = CallingNameStatus._('Unassigned');
  static const updateInProgress = CallingNameStatus._('UpdateInProgress');
  static const updateSucceeded = CallingNameStatus._('UpdateSucceeded');
  static const updateFailed = CallingNameStatus._('UpdateFailed');

  final String value;

  const CallingNameStatus._(this.value);

  static const values = [
    unassigned,
    updateInProgress,
    updateSucceeded,
    updateFailed
  ];

  static CallingNameStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CallingNameStatus._(value));

  @override
  bool operator ==(other) => other is CallingNameStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      name:
          (json['Name'] as String?)?.let(PhoneNumberAssociationName.fromString),
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
      if (name != null) 'Name': name.value,
      if (value != null) 'Value': value,
    };
  }
}

class PhoneNumberAssociationName {
  static const accountId = PhoneNumberAssociationName._('AccountId');
  static const userId = PhoneNumberAssociationName._('UserId');
  static const voiceConnectorId =
      PhoneNumberAssociationName._('VoiceConnectorId');
  static const voiceConnectorGroupId =
      PhoneNumberAssociationName._('VoiceConnectorGroupId');
  static const sipRuleId = PhoneNumberAssociationName._('SipRuleId');

  final String value;

  const PhoneNumberAssociationName._(this.value);

  static const values = [
    accountId,
    userId,
    voiceConnectorId,
    voiceConnectorGroupId,
    sipRuleId
  ];

  static PhoneNumberAssociationName fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberAssociationName._(value));

  @override
  bool operator ==(other) =>
      other is PhoneNumberAssociationName && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      botType: (json['BotType'] as String?)?.let(BotType.fromString),
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
      if (botType != null) 'BotType': botType.value,
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

class BotType {
  static const chatBot = BotType._('ChatBot');

  final String value;

  const BotType._(this.value);

  static const values = [chatBot];

  static BotType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BotType._(value));

  @override
  bool operator ==(other) => other is BotType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      accountId: (json['AccountId'] as String?) ?? '',
      awsAccountId: (json['AwsAccountId'] as String?) ?? '',
      name: (json['Name'] as String?) ?? '',
      accountStatus:
          (json['AccountStatus'] as String?)?.let(AccountStatus.fromString),
      accountType:
          (json['AccountType'] as String?)?.let(AccountType.fromString),
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      defaultLicense:
          (json['DefaultLicense'] as String?)?.let(License.fromString),
      signinDelegateGroups: (json['SigninDelegateGroups'] as List?)
          ?.nonNulls
          .map((e) => SigninDelegateGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      supportedLicenses: (json['SupportedLicenses'] as List?)
          ?.nonNulls
          .map((e) => License.fromString((e as String)))
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
      if (accountStatus != null) 'AccountStatus': accountStatus.value,
      if (accountType != null) 'AccountType': accountType.value,
      if (createdTimestamp != null)
        'CreatedTimestamp': iso8601ToJson(createdTimestamp),
      if (defaultLicense != null) 'DefaultLicense': defaultLicense.value,
      if (signinDelegateGroups != null)
        'SigninDelegateGroups': signinDelegateGroups,
      if (supportedLicenses != null)
        'SupportedLicenses': supportedLicenses.map((e) => e.value).toList(),
    };
  }
}

class AccountType {
  static const team = AccountType._('Team');
  static const enterpriseDirectory = AccountType._('EnterpriseDirectory');
  static const enterpriseLWA = AccountType._('EnterpriseLWA');
  static const enterpriseOIDC = AccountType._('EnterpriseOIDC');

  final String value;

  const AccountType._(this.value);

  static const values = [
    team,
    enterpriseDirectory,
    enterpriseLWA,
    enterpriseOIDC
  ];

  static AccountType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccountType._(value));

  @override
  bool operator ==(other) => other is AccountType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class AccountStatus {
  static const suspended = AccountStatus._('Suspended');
  static const active = AccountStatus._('Active');

  final String value;

  const AccountStatus._(this.value);

  static const values = [suspended, active];

  static AccountStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AccountStatus._(value));

  @override
  bool operator ==(other) => other is AccountStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          ?.nonNulls
          .map((e) => PhoneNumberType.fromString((e as String)))
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
            supportedPhoneNumberTypes.map((e) => e.value).toList(),
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
          ?.nonNulls
          .map((e) => OrderedPhoneNumber.fromJson(e as Map<String, dynamic>))
          .toList(),
      phoneNumberOrderId: json['PhoneNumberOrderId'] as String?,
      productType: (json['ProductType'] as String?)
          ?.let(PhoneNumberProductType.fromString),
      status:
          (json['Status'] as String?)?.let(PhoneNumberOrderStatus.fromString),
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
      if (productType != null) 'ProductType': productType.value,
      if (status != null) 'Status': status.value,
      if (updatedTimestamp != null)
        'UpdatedTimestamp': iso8601ToJson(updatedTimestamp),
    };
  }
}

class PhoneNumberOrderStatus {
  static const processing = PhoneNumberOrderStatus._('Processing');
  static const successful = PhoneNumberOrderStatus._('Successful');
  static const failed = PhoneNumberOrderStatus._('Failed');
  static const partial = PhoneNumberOrderStatus._('Partial');

  final String value;

  const PhoneNumberOrderStatus._(this.value);

  static const values = [processing, successful, failed, partial];

  static PhoneNumberOrderStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PhoneNumberOrderStatus._(value));

  @override
  bool operator ==(other) =>
      other is PhoneNumberOrderStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      status:
          (json['Status'] as String?)?.let(OrderedPhoneNumberStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final e164PhoneNumber = this.e164PhoneNumber;
    final status = this.status;
    return {
      if (e164PhoneNumber != null) 'E164PhoneNumber': e164PhoneNumber,
      if (status != null) 'Status': status.value,
    };
  }
}

class OrderedPhoneNumberStatus {
  static const processing = OrderedPhoneNumberStatus._('Processing');
  static const acquired = OrderedPhoneNumberStatus._('Acquired');
  static const failed = OrderedPhoneNumberStatus._('Failed');

  final String value;

  const OrderedPhoneNumberStatus._(this.value);

  static const values = [processing, acquired, failed];

  static OrderedPhoneNumberStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OrderedPhoneNumberStatus._(value));

  @override
  bool operator ==(other) =>
      other is OrderedPhoneNumberStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      emailStatus:
          (json['EmailStatus'] as String?)?.let(EmailStatus.fromString),
      inviteId: json['InviteId'] as String?,
      status: (json['Status'] as String?)?.let(InviteStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final emailAddress = this.emailAddress;
    final emailStatus = this.emailStatus;
    final inviteId = this.inviteId;
    final status = this.status;
    return {
      if (emailAddress != null) 'EmailAddress': emailAddress,
      if (emailStatus != null) 'EmailStatus': emailStatus.value,
      if (inviteId != null) 'InviteId': inviteId,
      if (status != null) 'Status': status.value,
    };
  }
}

class EmailStatus {
  static const notSent = EmailStatus._('NotSent');
  static const sent = EmailStatus._('Sent');
  static const failed = EmailStatus._('Failed');

  final String value;

  const EmailStatus._(this.value);

  static const values = [notSent, sent, failed];

  static EmailStatus fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => EmailStatus._(value));

  @override
  bool operator ==(other) => other is EmailStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ErrorCode {
  static const badRequest = ErrorCode._('BadRequest');
  static const conflict = ErrorCode._('Conflict');
  static const forbidden = ErrorCode._('Forbidden');
  static const notFound = ErrorCode._('NotFound');
  static const preconditionFailed = ErrorCode._('PreconditionFailed');
  static const resourceLimitExceeded = ErrorCode._('ResourceLimitExceeded');
  static const serviceFailure = ErrorCode._('ServiceFailure');
  static const accessDenied = ErrorCode._('AccessDenied');
  static const serviceUnavailable = ErrorCode._('ServiceUnavailable');
  static const throttled = ErrorCode._('Throttled');
  static const throttling = ErrorCode._('Throttling');
  static const unauthorized = ErrorCode._('Unauthorized');
  static const unprocessable = ErrorCode._('Unprocessable');
  static const voiceConnectorGroupAssociationsExist =
      ErrorCode._('VoiceConnectorGroupAssociationsExist');
  static const phoneNumberAssociationsExist =
      ErrorCode._('PhoneNumberAssociationsExist');

  final String value;

  const ErrorCode._(this.value);

  static const values = [
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
    phoneNumberAssociationsExist
  ];

  static ErrorCode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ErrorCode._(value));

  @override
  bool operator ==(other) => other is ErrorCode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      errorCode: (json['ErrorCode'] as String?)?.let(ErrorCode.fromString),
      errorMessage: json['ErrorMessage'] as String?,
      userId: json['UserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final userId = this.userId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.value,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (userId != null) 'UserId': userId,
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
      if (licenseType != null) 'LicenseType': licenseType.value,
      if (userType != null) 'UserType': userType.value,
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
      errorCode: (json['ErrorCode'] as String?)?.let(ErrorCode.fromString),
      errorMessage: json['ErrorMessage'] as String?,
      phoneNumberId: json['PhoneNumberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final phoneNumberId = this.phoneNumberId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.value,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (phoneNumberId != null) 'PhoneNumberId': phoneNumberId,
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
      if (productType != null) 'ProductType': productType.value,
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
      errorCode: (json['ErrorCode'] as String?)?.let(ErrorCode.fromString),
      errorMessage: json['ErrorMessage'] as String?,
      memberId: json['MemberId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorCode = this.errorCode;
    final errorMessage = this.errorMessage;
    final memberId = this.memberId;
    return {
      if (errorCode != null) 'ErrorCode': errorCode.value,
      if (errorMessage != null) 'ErrorMessage': errorMessage,
      if (memberId != null) 'MemberId': memberId,
    };
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
      if (role != null) 'Role': role.value,
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
