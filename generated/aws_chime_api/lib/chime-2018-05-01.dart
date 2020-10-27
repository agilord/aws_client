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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822FromJson,
        rfc822ToJson,
        iso8601FromJson,
        iso8601ToJson,
        unixTimestampFromJson,
        unixTimestampToJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

part 'chime-2018-05-01.g.dart';

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
/// </dd> <dt>Using REST API</dt> <dd>
/// If you use REST to make API calls, you must authenticate your request by
/// providing a signature. Amazon Chime supports signature version 4. For more
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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: 'chime',
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required String accountId,
    @_s.required String e164PhoneNumber,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(e164PhoneNumber, 'e164PhoneNumber');
    _s.validateStringPattern(
      'e164PhoneNumber',
      e164PhoneNumber,
      r'''^\+?[1-9]\d{1,14}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{
      'E164PhoneNumber': e164PhoneNumber,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}?operation=associate-phone-number',
      exceptionFnMap: _exceptionFns,
    );
    return AssociatePhoneNumberWithUserResponse.fromJson(response);
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
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [forceAssociate] :
  /// If true, associates the provided phone numbers with the provided Amazon
  /// Chime Voice Connector and removes any previously existing associations. If
  /// false, does not associate any phone numbers that have previously existing
  /// associations.
  Future<AssociatePhoneNumbersWithVoiceConnectorResponse>
      associatePhoneNumbersWithVoiceConnector({
    @_s.required String voiceConnectorId,
    List<String> e164PhoneNumbers,
    bool forceAssociate,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
      if (forceAssociate != null) 'ForceAssociate': forceAssociate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}?operation=associate-phone-numbers',
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
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [forceAssociate] :
  /// If true, associates the provided phone numbers with the provided Amazon
  /// Chime Voice Connector Group and removes any previously existing
  /// associations. If false, does not associate any phone numbers that have
  /// previously existing associations.
  Future<AssociatePhoneNumbersWithVoiceConnectorGroupResponse>
      associatePhoneNumbersWithVoiceConnectorGroup({
    @_s.required String voiceConnectorGroupId,
    List<String> e164PhoneNumbers,
    bool forceAssociate,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
      if (forceAssociate != null) 'ForceAssociate': forceAssociate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId.toString())}?operation=associate-phone-numbers',
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
    @_s.required String accountId,
    @_s.required List<SigninDelegateGroup> signinDelegateGroups,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(signinDelegateGroups, 'signinDelegateGroups');
    final $payload = <String, dynamic>{
      'SigninDelegateGroups': signinDelegateGroups,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}?operation=associate-signin-delegate-groups',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateSigninDelegateGroupsWithAccountResponse.fromJson(response);
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
    @_s.required List<CreateAttendeeRequestItem> attendees,
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendees, 'attendees');
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Attendees': attendees,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees?operation=batch-create',
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
    @_s.required String accountId,
    @_s.required List<MembershipItem> membershipItemList,
    @_s.required String roomId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(membershipItemList, 'membershipItemList');
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'MembershipItemList': membershipItemList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}/memberships?operation=batch-create',
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
    @_s.required List<String> phoneNumberIds,
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
    @_s.required String accountId,
    @_s.required List<String> userIdList,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userIdList, 'userIdList');
    final $payload = <String, dynamic>{
      'UserIdList': userIdList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users?operation=suspend',
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
    @_s.required String accountId,
    @_s.required List<String> userIdList,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userIdList, 'userIdList');
    final $payload = <String, dynamic>{
      'UserIdList': userIdList,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users?operation=unsuspend',
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
    @_s.required
        List<UpdatePhoneNumberRequestItem> updatePhoneNumberRequestItems,
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
    @_s.required String accountId,
    @_s.required List<UpdateUserRequestItem> updateUserRequestItems,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        updateUserRequestItems, 'updateUserRequestItems');
    final $payload = <String, dynamic>{
      'UpdateUserRequestItems': updateUserRequestItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users',
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
    @_s.required String name,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
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
  /// The Amazon Chime SDK external user ID. Links the attendee to an identity
  /// managed by a builder application.
  ///
  /// Parameter [meetingId] :
  /// The Amazon Chime SDK meeting ID.
  ///
  /// Parameter [tags] :
  /// The tag key-value pairs.
  Future<CreateAttendeeResponse> createAttendee({
    @_s.required String externalUserId,
    @_s.required String meetingId,
    List<Tag> tags,
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
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'ExternalUserId': externalUserId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees',
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
    @_s.required String accountId,
    @_s.required String displayName,
    String domain,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(displayName, 'displayName');
    _s.validateStringPattern(
      'domain',
      domain,
      r'''.*\S.*''',
    );
    final $payload = <String, dynamic>{
      'DisplayName': displayName,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(accountId.toString())}/bots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotResponse.fromJson(response);
  }

  /// Creates a new Amazon Chime SDK meeting in the specified media Region with
  /// no initial attendees. For more information about the Amazon Chime SDK, see
  /// <a
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
  /// The Region in which to create the meeting. Available values:
  /// <code>ap-northeast-1</code>, <code>ap-southeast-1</code>,
  /// <code>ap-southeast-2</code>, <code>ca-central-1</code>,
  /// <code>eu-central-1</code>, <code>eu-north-1</code>,
  /// <code>eu-west-1</code>, <code>eu-west-2</code>, <code>eu-west-3</code>,
  /// <code>sa-east-1</code>, <code>us-east-1</code>, <code>us-east-2</code>,
  /// <code>us-west-1</code>, <code>us-west-2</code>.
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
    @_s.required String clientRequestToken,
    String externalMeetingId,
    String mediaRegion,
    String meetingHostId,
    MeetingNotificationConfiguration notificationsConfiguration,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[-_a-zA-Z0-9]*''',
      isRequired: true,
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
      'ClientRequestToken': clientRequestToken,
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
    @_s.required List<String> e164PhoneNumbers,
    @_s.required PhoneNumberProductType productType,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(productType, 'productType');
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      'ProductType': productType?.toValue(),
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
    @_s.required List<String> capabilities,
    @_s.required List<String> participantPhoneNumbers,
    @_s.required String voiceConnectorId,
    int expiryMinutes,
    GeoMatchLevel geoMatchLevel,
    GeoMatchParams geoMatchParams,
    String name,
    NumberSelectionBehavior numberSelectionBehavior,
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
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'expiryMinutes',
      expiryMinutes,
      1,
      1152921504606846976,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''^$|^[a-zA-Z0-9 ]{0,30}$''',
    );
    final $payload = <String, dynamic>{
      'Capabilities': capabilities,
      'ParticipantPhoneNumbers': participantPhoneNumbers,
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
      if (geoMatchLevel != null) 'GeoMatchLevel': geoMatchLevel?.toValue(),
      if (geoMatchParams != null) 'GeoMatchParams': geoMatchParams,
      if (name != null) 'Name': name,
      if (numberSelectionBehavior != null)
        'NumberSelectionBehavior': numberSelectionBehavior?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/proxy-sessions',
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
    @_s.required String accountId,
    @_s.required String name,
    String clientRequestToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      2,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[-_a-zA-Z0-9]*''',
    );
    final $payload = <String, dynamic>{
      'Name': name,
      if (clientRequestToken != null) 'ClientRequestToken': clientRequestToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms',
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
    @_s.required String accountId,
    @_s.required String memberId,
    @_s.required String roomId,
    RoomMembershipRole role,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringPattern(
      'memberId',
      memberId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'MemberId': memberId,
      if (role != null) 'Role': role?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}/memberships',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRoomMembershipResponse.fromJson(response);
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
    @_s.required String accountId,
    String email,
    UserType userType,
    String username,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'email',
      email,
      r'''.+@.+\..+''',
    );
    final $payload = <String, dynamic>{
      if (email != null) 'Email': email,
      if (userType != null) 'UserType': userType?.toValue(),
      if (username != null) 'Username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users?operation=create',
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
    @_s.required String name,
    @_s.required bool requireEncryption,
    VoiceConnectorAwsRegion awsRegion,
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
      if (awsRegion != null) 'AwsRegion': awsRegion?.toValue(),
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
    @_s.required String name,
    List<VoiceConnectorItem> voiceConnectorItems,
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
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/accounts/${Uri.encodeComponent(accountId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAccountResponse.fromJson(response);
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
    @_s.required String attendeeId,
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    _s.validateStringPattern(
      'attendeeId',
      attendeeId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees/${Uri.encodeComponent(attendeeId.toString())}',
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
    @_s.required String accountId,
    @_s.required String botId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botId, 'botId');
    _s.validateStringPattern(
      'botId',
      botId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots/${Uri.encodeComponent(botId.toString())}/events-configuration',
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
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId.toString())}',
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
    @_s.required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId.toString())}',
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
    @_s.required String proxySessionId,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(proxySessionId, 'proxySessionId');
    _s.validateStringLength(
      'proxySessionId',
      proxySessionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'proxySessionId',
      proxySessionId,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/proxy-sessions/${Uri.encodeComponent(proxySessionId.toString())}',
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
    @_s.required String accountId,
    @_s.required String roomId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}',
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
    @_s.required String accountId,
    @_s.required String memberId,
    @_s.required String roomId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringPattern(
      'memberId',
      memberId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}/memberships/${Uri.encodeComponent(memberId.toString())}',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}',
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
    @_s.required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the origination settings for the specified Amazon Chime Voice
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
  Future<void> deleteVoiceConnectorOrigination({
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/origination',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/programmable-numbers/proxy',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes the termination settings for the specified Amazon Chime Voice
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
  Future<void> deleteVoiceConnectorTermination({
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    await _protocol.send(
      payload: $payload,
      method: 'DELETE',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination',
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
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  ///
  /// Parameter [usernames] :
  /// The RFC2617 compliant username associated with the SIP credentials, in
  /// US-ASCII format.
  Future<void> deleteVoiceConnectorTerminationCredentials({
    @_s.required String voiceConnectorId,
    List<String> usernames,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (usernames != null) 'Usernames': usernames,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination/credentials?operation=delete',
      exceptionFnMap: _exceptionFns,
    );
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
    @_s.required String accountId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}?operation=disassociate-phone-number',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociatePhoneNumberFromUserResponse.fromJson(response);
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
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  Future<DisassociatePhoneNumbersFromVoiceConnectorResponse>
      disassociatePhoneNumbersFromVoiceConnector({
    @_s.required String voiceConnectorId,
    List<String> e164PhoneNumbers,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}?operation=disassociate-phone-numbers',
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
  /// Parameter [voiceConnectorGroupId] :
  /// The Amazon Chime Voice Connector group ID.
  ///
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  Future<DisassociatePhoneNumbersFromVoiceConnectorGroupResponse>
      disassociatePhoneNumbersFromVoiceConnectorGroup({
    @_s.required String voiceConnectorGroupId,
    List<String> e164PhoneNumbers,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (e164PhoneNumbers != null) 'E164PhoneNumbers': e164PhoneNumbers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId.toString())}?operation=disassociate-phone-numbers',
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
    @_s.required String accountId,
    @_s.required List<String> groupNames,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(groupNames, 'groupNames');
    final $payload = <String, dynamic>{
      'GroupNames': groupNames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}?operation=disassociate-signin-delegate-groups',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateSigninDelegateGroupsFromAccountResponse.fromJson(
        response);
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
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts/${Uri.encodeComponent(accountId.toString())}',
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
    @_s.required String accountId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetAccountSettingsResponse.fromJson(response);
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
    @_s.required String attendeeId,
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    _s.validateStringPattern(
      'attendeeId',
      attendeeId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees/${Uri.encodeComponent(attendeeId.toString())}',
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
    @_s.required String accountId,
    @_s.required String botId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botId, 'botId');
    _s.validateStringPattern(
      'botId',
      botId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots/${Uri.encodeComponent(botId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String botId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botId, 'botId');
    _s.validateStringPattern(
      'botId',
      botId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots/${Uri.encodeComponent(botId.toString())}/events-configuration',
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
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMeetingResponse.fromJson(response);
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
    @_s.required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId.toString())}',
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
    @_s.required String phoneNumberOrderId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberOrderId, 'phoneNumberOrderId');
    _s.validateStringPattern(
      'phoneNumberOrderId',
      phoneNumberOrderId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/phone-number-orders/${Uri.encodeComponent(phoneNumberOrderId.toString())}',
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
    @_s.required String proxySessionId,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(proxySessionId, 'proxySessionId');
    _s.validateStringLength(
      'proxySessionId',
      proxySessionId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'proxySessionId',
      proxySessionId,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/proxy-sessions/${Uri.encodeComponent(proxySessionId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProxySessionResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String roomId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetRoomResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringPattern(
      'userId',
      userId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}',
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
    @_s.required String accountId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    ArgumentError.checkNotNull(userId, 'userId');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}/settings',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorResponse.fromJson(response);
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
    @_s.required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetVoiceConnectorGroupResponse.fromJson(response);
  }

  /// Retrieves the logging configuration details for the specified Amazon Chime
  /// Voice Connector. Shows whether SIP message logs are enabled for sending to
  /// Amazon CloudWatch Logs.
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/logging-configuration',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/origination',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/programmable-numbers/proxy',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/streaming-configuration',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination/health',
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
    @_s.required String accountId,
    @_s.required List<String> userEmailList,
    UserType userType,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userEmailList, 'userEmailList');
    final $payload = <String, dynamic>{
      'UserEmailList': userEmailList,
      if (userType != null) 'UserType': userType?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users?operation=add',
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
    int maxResults,
    String name,
    String nextToken,
    String userEmail,
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
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
    );
    _s.validateStringPattern(
      'userEmail',
      userEmail,
      r'''.+@.+\..+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (name != null) _s.toQueryParam('name', name),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
      if (userEmail != null) _s.toQueryParam('user-email', userEmail),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/accounts$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListAccountsResponse.fromJson(response);
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
    @_s.required String attendeeId,
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    _s.validateStringPattern(
      'attendeeId',
      attendeeId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees/${Uri.encodeComponent(attendeeId.toString())}/tags',
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
    @_s.required String meetingId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees$_query',
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
    @_s.required String accountId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListBotsResponse.fromJson(response);
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
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings/${Uri.encodeComponent(meetingId.toString())}/tags',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/meetings$_query',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-number-orders$_query',
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
    PhoneNumberAssociationName filterName,
    String filterValue,
    int maxResults,
    String nextToken,
    PhoneNumberProductType productType,
    PhoneNumberStatus status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (filterName != null) _s.toQueryParam('filter-name', filterName),
      if (filterValue != null) _s.toQueryParam('filter-value', filterValue),
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
      if (productType != null) _s.toQueryParam('product-type', productType),
      if (status != null) _s.toQueryParam('status', status),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/phone-numbers$_query',
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
    @_s.required String voiceConnectorId,
    int maxResults,
    String nextToken,
    ProxySessionStatus status,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringLength(
      'voiceConnectorId',
      voiceConnectorId,
      1,
      128,
      isRequired: true,
    );
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
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
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
      if (status != null) _s.toQueryParam('status', status),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/proxy-sessions$_query',
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
    @_s.required String accountId,
    @_s.required String roomId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}/memberships$_query',
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
    @_s.required String accountId,
    int maxResults,
    String memberId,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (memberId != null) _s.toQueryParam('member-id', memberId),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms$_query',
      exceptionFnMap: _exceptionFns,
    );
    return ListRoomsResponse.fromJson(response);
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
    @_s.required String resourceARN,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn[\/\:\-\_\.a-zA-Z0-9]+$''',
      isRequired: true,
    );
    var _query = '';
    _query = '?${[
      if (resourceARN != null) _s.toQueryParam('arn', resourceARN),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags$_query',
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
    @_s.required String accountId,
    int maxResults,
    String nextToken,
    String userEmail,
    UserType userType,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      200,
    );
    _s.validateStringPattern(
      'userEmail',
      userEmail,
      r'''.+@.+\..+''',
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
      if (userEmail != null) _s.toQueryParam('user-email', userEmail),
      if (userType != null) _s.toQueryParam('user-type', userType),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users$_query',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connector-groups$_query',
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination/credentials',
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      99,
    );
    var _query = '';
    _query = '?${[
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/voice-connectors$_query',
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
    @_s.required String accountId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringPattern(
      'userId',
      userId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}?operation=logout',
      exceptionFnMap: _exceptionFns,
    );
    return LogoutUserResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String botId,
    String lambdaFunctionArn,
    String outboundEventsHTTPSEndpoint,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botId, 'botId');
    _s.validateStringPattern(
      'botId',
      botId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (lambdaFunctionArn != null) 'LambdaFunctionArn': lambdaFunctionArn,
      if (outboundEventsHTTPSEndpoint != null)
        'OutboundEventsHTTPSEndpoint': outboundEventsHTTPSEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots/${Uri.encodeComponent(botId.toString())}/events-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutEventsConfigurationResponse.fromJson(response);
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
    @_s.required LoggingConfiguration loggingConfiguration,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(loggingConfiguration, 'loggingConfiguration');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'LoggingConfiguration': loggingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/logging-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorLoggingConfigurationResponse.fromJson(response);
  }

  /// Adds origination settings for the specified Amazon Chime Voice Connector.
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
    @_s.required Origination origination,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(origination, 'origination');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Origination': origination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/origination',
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
    @_s.required int defaultSessionExpiryMinutes,
    @_s.required List<String> phoneNumberPoolCountries,
    @_s.required String voiceConnectorId,
    bool disabled,
    String fallBackPhoneNumber,
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
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'fallBackPhoneNumber',
      fallBackPhoneNumber,
      r'''^\+?[1-9]\d{1,14}$''',
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
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/programmable-numbers/proxy',
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
    @_s.required StreamingConfiguration streamingConfiguration,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(
        streamingConfiguration, 'streamingConfiguration');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'StreamingConfiguration': streamingConfiguration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/streaming-configuration',
      exceptionFnMap: _exceptionFns,
    );
    return PutVoiceConnectorStreamingConfigurationResponse.fromJson(response);
  }

  /// Adds termination settings for the specified Amazon Chime Voice Connector.
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
    @_s.required Termination termination,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(termination, 'termination');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Termination': termination,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination',
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
    @_s.required String voiceConnectorId,
    List<Credential> credentials,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (credentials != null) 'Credentials': credentials,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/termination/credentials?operation=put',
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
    @_s.required String accountId,
    @_s.required String botId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botId, 'botId');
    _s.validateStringPattern(
      'botId',
      botId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots/${Uri.encodeComponent(botId.toString())}?operation=regenerate-security-token',
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
    @_s.required String accountId,
    @_s.required String userId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringPattern(
      'userId',
      userId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}?operation=reset-personal-pin',
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
    @_s.required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    _s.validateStringPattern(
      'phoneNumberId',
      phoneNumberId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{};
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId.toString())}?operation=restore',
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
    String areaCode,
    String city,
    String country,
    int maxResults,
    String nextToken,
    String state,
    String tollFreePrefix,
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
    _s.validateStringPattern(
      'tollFreePrefix',
      tollFreePrefix,
      r'''^8(00|33|44|55|66|77|88)$''',
    );
    var _query = '';
    _query = '?${[
      if (areaCode != null) _s.toQueryParam('area-code', areaCode),
      if (city != null) _s.toQueryParam('city', city),
      if (country != null) _s.toQueryParam('country', country),
      if (maxResults != null) _s.toQueryParam('max-results', maxResults),
      if (nextToken != null) _s.toQueryParam('next-token', nextToken),
      if (state != null) _s.toQueryParam('state', state),
      if (tollFreePrefix != null)
        _s.toQueryParam('toll-free-prefix', tollFreePrefix),
    ].where((e) => e != null).join('&')}';
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/search?type=phone-numbers$_query',
      exceptionFnMap: _exceptionFns,
    );
    return SearchAvailablePhoneNumbersResponse.fromJson(response);
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
    @_s.required String attendeeId,
    @_s.required String meetingId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    _s.validateStringPattern(
      'attendeeId',
      attendeeId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees/${Uri.encodeComponent(attendeeId.toString())}/tags?operation=add',
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
    @_s.required String meetingId,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/tags?operation=add',
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
    @_s.required String resourceARN,
    @_s.required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn[\/\:\-\_\.a-zA-Z0-9]+$''',
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
    @_s.required String attendeeId,
    @_s.required String meetingId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(attendeeId, 'attendeeId');
    _s.validateStringPattern(
      'attendeeId',
      attendeeId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/attendees/${Uri.encodeComponent(attendeeId.toString())}/tags?operation=delete',
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
    @_s.required String meetingId,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'TagKeys': tagKeys,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/meetings/${Uri.encodeComponent(meetingId.toString())}/tags?operation=delete',
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
    @_s.required String resourceARN,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceARN, 'resourceARN');
    _s.validateStringLength(
      'resourceARN',
      resourceARN,
      1,
      1024,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceARN',
      resourceARN,
      r'''^arn[\/\:\-\_\.a-zA-Z0-9]+$''',
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
    @_s.required String accountId,
    String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      1,
      100,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
    );
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/accounts/${Uri.encodeComponent(accountId.toString())}',
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
    @_s.required String accountId,
    @_s.required AccountSettings accountSettings,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(accountSettings, 'accountSettings');
    final $payload = <String, dynamic>{
      'AccountSettings': accountSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountSettingsResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String botId,
    bool disabled,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(botId, 'botId');
    _s.validateStringPattern(
      'botId',
      botId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (disabled != null) 'Disabled': disabled,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/bots/${Uri.encodeComponent(botId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotResponse.fromJson(response);
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
    @_s.required BusinessCallingSettings businessCalling,
    @_s.required VoiceConnectorSettings voiceConnector,
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
    @_s.required String phoneNumberId,
    String callingName,
    PhoneNumberProductType productType,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    _s.validateStringPattern(
      'callingName',
      callingName,
      r'''^$|^[a-zA-Z0-9 ]{2,15}$''',
    );
    final $payload = <String, dynamic>{
      if (callingName != null) 'CallingName': callingName,
      if (productType != null) 'ProductType': productType?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/phone-numbers/${Uri.encodeComponent(phoneNumberId.toString())}',
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
    @_s.required String callingName,
  }) async {
    ArgumentError.checkNotNull(callingName, 'callingName');
    _s.validateStringPattern(
      'callingName',
      callingName,
      r'''^$|^[a-zA-Z0-9 ]{2,15}$''',
      isRequired: true,
    );
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
    @_s.required List<String> capabilities,
    @_s.required String proxySessionId,
    @_s.required String voiceConnectorId,
    int expiryMinutes,
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
    _s.validateStringPattern(
      'proxySessionId',
      proxySessionId,
      r'''.*\S.*''',
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
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateNumRange(
      'expiryMinutes',
      expiryMinutes,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'Capabilities': capabilities,
      if (expiryMinutes != null) 'ExpiryMinutes': expiryMinutes,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}/proxy-sessions/${Uri.encodeComponent(proxySessionId.toString())}',
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
    @_s.required String accountId,
    @_s.required String roomId,
    String name,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}',
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
    @_s.required String accountId,
    @_s.required String memberId,
    @_s.required String roomId,
    RoomMembershipRole role,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(memberId, 'memberId');
    _s.validateStringPattern(
      'memberId',
      memberId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(roomId, 'roomId');
    _s.validateStringPattern(
      'roomId',
      roomId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (role != null) 'Role': role?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/rooms/${Uri.encodeComponent(roomId.toString())}/memberships/${Uri.encodeComponent(memberId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRoomMembershipResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String userId,
    AlexaForBusinessMetadata alexaForBusinessMetadata,
    License licenseType,
    UserType userType,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(userId, 'userId');
    _s.validateStringPattern(
      'userId',
      userId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      if (alexaForBusinessMetadata != null)
        'AlexaForBusinessMetadata': alexaForBusinessMetadata,
      if (licenseType != null) 'LicenseType': licenseType?.toValue(),
      if (userType != null) 'UserType': userType?.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}',
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
    @_s.required String accountId,
    @_s.required String userId,
    @_s.required UserSettings userSettings,
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
          '/accounts/${Uri.encodeComponent(accountId.toString())}/users/${Uri.encodeComponent(userId.toString())}/settings',
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
    @_s.required String name,
    @_s.required bool requireEncryption,
    @_s.required String voiceConnectorId,
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
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'RequireEncryption': requireEncryption,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connectors/${Uri.encodeComponent(voiceConnectorId.toString())}',
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
    @_s.required String name,
    @_s.required String voiceConnectorGroupId,
    @_s.required List<VoiceConnectorItem> voiceConnectorItems,
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
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(voiceConnectorItems, 'voiceConnectorItems');
    final $payload = <String, dynamic>{
      'Name': name,
      'VoiceConnectorItems': voiceConnectorItems,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateVoiceConnectorGroupResponse.fromJson(response);
  }
}

/// The Amazon Chime account details. An AWS account can have multiple Amazon
/// Chime accounts.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Account {
  /// The Amazon Chime account ID.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The AWS account ID.
  @_s.JsonKey(name: 'AwsAccountId')
  final String awsAccountId;

  /// The Amazon Chime account name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The Amazon Chime account type. For more information about different account
  /// types, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ag/manage-chime-account.html">Managing
  /// Your Amazon Chime Accounts</a> in the <i>Amazon Chime Administration
  /// Guide</i>.
  @_s.JsonKey(name: 'AccountType')
  final AccountType accountType;

  /// The Amazon Chime account creation timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The default license for the Amazon Chime account.
  @_s.JsonKey(name: 'DefaultLicense')
  final License defaultLicense;

  /// The sign-in delegate groups associated with the account.
  @_s.JsonKey(name: 'SigninDelegateGroups')
  final List<SigninDelegateGroup> signinDelegateGroups;

  /// Supported licenses for the Amazon Chime account.
  @_s.JsonKey(name: 'SupportedLicenses')
  final List<String> supportedLicenses;

  Account({
    @_s.required this.accountId,
    @_s.required this.awsAccountId,
    @_s.required this.name,
    this.accountType,
    this.createdTimestamp,
    this.defaultLicense,
    this.signinDelegateGroups,
    this.supportedLicenses,
  });
  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);
}

/// Settings related to the Amazon Chime account. This includes settings that
/// start or stop remote control of shared screens, or start or stop the
/// dial-out option in the Amazon Chime web application. For more information
/// about these settings, see <a
/// href="https://docs.aws.amazon.com/chime/latest/ag/policies.html">Use the
/// Policies Page</a> in the <i>Amazon Chime Administration Guide</i>.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AccountSettings {
  /// Setting that stops or starts remote control of shared screens during
  /// meetings.
  @_s.JsonKey(name: 'DisableRemoteControl')
  final bool disableRemoteControl;

  /// Setting that allows meeting participants to choose the <b>Call me at a phone
  /// number</b> option. For more information, see <a
  /// href="https://docs.aws.amazon.com/chime/latest/ug/chime-join-meeting.html">Join
  /// a Meeting without the Amazon Chime App</a>.
  @_s.JsonKey(name: 'EnableDialOut')
  final bool enableDialOut;

  AccountSettings({
    this.disableRemoteControl,
    this.enableDialOut,
  });
  factory AccountSettings.fromJson(Map<String, dynamic> json) =>
      _$AccountSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AccountSettingsToJson(this);
}

enum AccountType {
  @_s.JsonValue('Team')
  team,
  @_s.JsonValue('EnterpriseDirectory')
  enterpriseDirectory,
  @_s.JsonValue('EnterpriseLWA')
  enterpriseLWA,
  @_s.JsonValue('EnterpriseOIDC')
  enterpriseOIDC,
}

/// The Alexa for Business metadata associated with an Amazon Chime user, used
/// to integrate Alexa for Business with a device.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AlexaForBusinessMetadata {
  /// The ARN of the room resource.
  @_s.JsonKey(name: 'AlexaForBusinessRoomArn')
  final String alexaForBusinessRoomArn;

  /// Starts or stops Alexa for Business.
  @_s.JsonKey(name: 'IsAlexaForBusinessEnabled')
  final bool isAlexaForBusinessEnabled;

  AlexaForBusinessMetadata({
    this.alexaForBusinessRoomArn,
    this.isAlexaForBusinessEnabled,
  });
  factory AlexaForBusinessMetadata.fromJson(Map<String, dynamic> json) =>
      _$AlexaForBusinessMetadataFromJson(json);

  Map<String, dynamic> toJson() => _$AlexaForBusinessMetadataToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatePhoneNumberWithUserResponse {
  AssociatePhoneNumberWithUserResponse();
  factory AssociatePhoneNumberWithUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociatePhoneNumberWithUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatePhoneNumbersWithVoiceConnectorGroupResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  @_s.JsonKey(name: 'PhoneNumberErrors')
  final List<PhoneNumberError> phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorGroupResponse({
    this.phoneNumberErrors,
  });
  factory AssociatePhoneNumbersWithVoiceConnectorGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociatePhoneNumbersWithVoiceConnectorGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociatePhoneNumbersWithVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  @_s.JsonKey(name: 'PhoneNumberErrors')
  final List<PhoneNumberError> phoneNumberErrors;

  AssociatePhoneNumbersWithVoiceConnectorResponse({
    this.phoneNumberErrors,
  });
  factory AssociatePhoneNumbersWithVoiceConnectorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociatePhoneNumbersWithVoiceConnectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateSigninDelegateGroupsWithAccountResponse {
  AssociateSigninDelegateGroupsWithAccountResponse();
  factory AssociateSigninDelegateGroupsWithAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateSigninDelegateGroupsWithAccountResponseFromJson(json);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Attendee {
  /// The Amazon Chime SDK attendee ID.
  @_s.JsonKey(name: 'AttendeeId')
  final String attendeeId;

  /// The Amazon Chime SDK external user ID. Links the attendee to an identity
  /// managed by a builder application.
  @_s.JsonKey(name: 'ExternalUserId')
  final String externalUserId;

  /// The join token used by the Amazon Chime SDK attendee.
  @_s.JsonKey(name: 'JoinToken')
  final String joinToken;

  Attendee({
    this.attendeeId,
    this.externalUserId,
    this.joinToken,
  });
  factory Attendee.fromJson(Map<String, dynamic> json) =>
      _$AttendeeFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateAttendeeResponse {
  /// The attendee information, including attendees IDs and join tokens.
  @_s.JsonKey(name: 'Attendees')
  final List<Attendee> attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  @_s.JsonKey(name: 'Errors')
  final List<CreateAttendeeError> errors;

  BatchCreateAttendeeResponse({
    this.attendees,
    this.errors,
  });
  factory BatchCreateAttendeeResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchCreateAttendeeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchCreateRoomMembershipResponse {
  /// If the action fails for one or more of the member IDs in the request, a list
  /// of the member IDs is returned, along with error codes and error messages.
  @_s.JsonKey(name: 'Errors')
  final List<MemberError> errors;

  BatchCreateRoomMembershipResponse({
    this.errors,
  });
  factory BatchCreateRoomMembershipResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchCreateRoomMembershipResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeletePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  @_s.JsonKey(name: 'PhoneNumberErrors')
  final List<PhoneNumberError> phoneNumberErrors;

  BatchDeletePhoneNumberResponse({
    this.phoneNumberErrors,
  });
  factory BatchDeletePhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeletePhoneNumberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchSuspendUserResponse {
  /// If the <a>BatchSuspendUser</a> action fails for one or more of the user IDs
  /// in the request, a list of the user IDs is returned, along with error codes
  /// and error messages.
  @_s.JsonKey(name: 'UserErrors')
  final List<UserError> userErrors;

  BatchSuspendUserResponse({
    this.userErrors,
  });
  factory BatchSuspendUserResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchSuspendUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUnsuspendUserResponse {
  /// If the <a>BatchUnsuspendUser</a> action fails for one or more of the user
  /// IDs in the request, a list of the user IDs is returned, along with error
  /// codes and error messages.
  @_s.JsonKey(name: 'UserErrors')
  final List<UserError> userErrors;

  BatchUnsuspendUserResponse({
    this.userErrors,
  });
  factory BatchUnsuspendUserResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUnsuspendUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdatePhoneNumberResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  @_s.JsonKey(name: 'PhoneNumberErrors')
  final List<PhoneNumberError> phoneNumberErrors;

  BatchUpdatePhoneNumberResponse({
    this.phoneNumberErrors,
  });
  factory BatchUpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdatePhoneNumberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchUpdateUserResponse {
  /// If the <a>BatchUpdateUser</a> action fails for one or more of the user IDs
  /// in the request, a list of the user IDs is returned, along with error codes
  /// and error messages.
  @_s.JsonKey(name: 'UserErrors')
  final List<UserError> userErrors;

  BatchUpdateUserResponse({
    this.userErrors,
  });
  factory BatchUpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchUpdateUserResponseFromJson(json);
}

/// A resource that allows Enterprise account administrators to configure an
/// interface to receive events from Amazon Chime.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Bot {
  /// The bot email address.
  @_s.JsonKey(name: 'BotEmail')
  final String botEmail;

  /// The bot ID.
  @_s.JsonKey(name: 'BotId')
  final String botId;

  /// The bot type.
  @_s.JsonKey(name: 'BotType')
  final BotType botType;

  /// The bot creation timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// When true, the bot is stopped from running in your account.
  @_s.JsonKey(name: 'Disabled')
  final bool disabled;

  /// The bot display name.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// The security token used to authenticate Amazon Chime with the outgoing event
  /// endpoint.
  @_s.JsonKey(name: 'SecurityToken')
  final String securityToken;

  /// The updated bot timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  /// The unique ID for the bot user.
  @_s.JsonKey(name: 'UserId')
  final String userId;

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
  factory Bot.fromJson(Map<String, dynamic> json) => _$BotFromJson(json);
}

enum BotType {
  @_s.JsonValue('ChatBot')
  chatBot,
}

/// The Amazon Chime Business Calling settings for the administrator's AWS
/// account. Includes any Amazon S3 buckets designated for storing call detail
/// records.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BusinessCallingSettings {
  /// The Amazon S3 bucket designated for call detail record storage.
  @_s.JsonKey(name: 'CdrBucket')
  final String cdrBucket;

  BusinessCallingSettings({
    this.cdrBucket,
  });
  factory BusinessCallingSettings.fromJson(Map<String, dynamic> json) =>
      _$BusinessCallingSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessCallingSettingsToJson(this);
}

enum CallingNameStatus {
  @_s.JsonValue('Unassigned')
  unassigned,
  @_s.JsonValue('UpdateInProgress')
  updateInProgress,
  @_s.JsonValue('UpdateSucceeded')
  updateSucceeded,
  @_s.JsonValue('UpdateFailed')
  updateFailed,
}

enum Capability {
  @_s.JsonValue('Voice')
  voice,
  @_s.JsonValue('SMS')
  sms,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccountResponse {
  /// The Amazon Chime account details.
  @_s.JsonKey(name: 'Account')
  final Account account;

  CreateAccountResponse({
    this.account,
  });
  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseFromJson(json);
}

/// The list of errors returned when errors are encountered during the
/// BatchCreateAttendee and CreateAttendee actions. This includes external user
/// IDs, error codes, and error messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAttendeeError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final String errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The Amazon Chime SDK external user ID. Links the attendee to an identity
  /// managed by a builder application.
  @_s.JsonKey(name: 'ExternalUserId')
  final String externalUserId;

  CreateAttendeeError({
    this.errorCode,
    this.errorMessage,
    this.externalUserId,
  });
  factory CreateAttendeeError.fromJson(Map<String, dynamic> json) =>
      _$CreateAttendeeErrorFromJson(json);
}

/// The Amazon Chime SDK attendee fields to create, used with the
/// BatchCreateAttendee action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class CreateAttendeeRequestItem {
  /// The Amazon Chime SDK external user ID. Links the attendee to an identity
  /// managed by a builder application.
  @_s.JsonKey(name: 'ExternalUserId')
  final String externalUserId;

  /// The tag key-value pairs.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  CreateAttendeeRequestItem({
    @_s.required this.externalUserId,
    this.tags,
  });
  Map<String, dynamic> toJson() => _$CreateAttendeeRequestItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAttendeeResponse {
  /// The attendee information, including attendee ID and join token.
  @_s.JsonKey(name: 'Attendee')
  final Attendee attendee;

  CreateAttendeeResponse({
    this.attendee,
  });
  factory CreateAttendeeResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAttendeeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateBotResponse {
  /// The bot details.
  @_s.JsonKey(name: 'Bot')
  final Bot bot;

  CreateBotResponse({
    this.bot,
  });
  factory CreateBotResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateBotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMeetingResponse {
  /// The meeting information, including the meeting ID and
  /// <code>MediaPlacement</code>.
  @_s.JsonKey(name: 'Meeting')
  final Meeting meeting;

  CreateMeetingResponse({
    this.meeting,
  });
  factory CreateMeetingResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMeetingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreatePhoneNumberOrderResponse {
  /// The phone number order details.
  @_s.JsonKey(name: 'PhoneNumberOrder')
  final PhoneNumberOrder phoneNumberOrder;

  CreatePhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });
  factory CreatePhoneNumberOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$CreatePhoneNumberOrderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateProxySessionResponse {
  /// The proxy session details.
  @_s.JsonKey(name: 'ProxySession')
  final ProxySession proxySession;

  CreateProxySessionResponse({
    this.proxySession,
  });
  factory CreateProxySessionResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateProxySessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRoomMembershipResponse {
  /// The room membership details.
  @_s.JsonKey(name: 'RoomMembership')
  final RoomMembership roomMembership;

  CreateRoomMembershipResponse({
    this.roomMembership,
  });
  factory CreateRoomMembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomMembershipResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRoomResponse {
  /// The room details.
  @_s.JsonKey(name: 'Room')
  final Room room;

  CreateRoomResponse({
    this.room,
  });
  factory CreateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateUserResponse {
  @_s.JsonKey(name: 'User')
  final User user;

  CreateUserResponse({
    this.user,
  });
  factory CreateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVoiceConnectorGroupResponse {
  /// The Amazon Chime Voice Connector group details.
  @_s.JsonKey(name: 'VoiceConnectorGroup')
  final VoiceConnectorGroup voiceConnectorGroup;

  CreateVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });
  factory CreateVoiceConnectorGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateVoiceConnectorGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  @_s.JsonKey(name: 'VoiceConnector')
  final VoiceConnector voiceConnector;

  CreateVoiceConnectorResponse({
    this.voiceConnector,
  });
  factory CreateVoiceConnectorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateVoiceConnectorResponseFromJson(json);
}

/// The SIP credentials used to authenticate requests to your Amazon Chime Voice
/// Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Credential {
  /// The RFC2617 compliant password associated with the SIP credentials, in
  /// US-ASCII format.
  @_s.JsonKey(name: 'Password')
  final String password;

  /// The RFC2617 compliant user name associated with the SIP credentials, in
  /// US-ASCII format.
  @_s.JsonKey(name: 'Username')
  final String username;

  Credential({
    this.password,
    this.username,
  });
  Map<String, dynamic> toJson() => _$CredentialToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAccountResponse {
  DeleteAccountResponse();
  factory DeleteAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociatePhoneNumberFromUserResponse {
  DisassociatePhoneNumberFromUserResponse();
  factory DisassociatePhoneNumberFromUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociatePhoneNumberFromUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociatePhoneNumbersFromVoiceConnectorGroupResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  @_s.JsonKey(name: 'PhoneNumberErrors')
  final List<PhoneNumberError> phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorGroupResponse({
    this.phoneNumberErrors,
  });
  factory DisassociatePhoneNumbersFromVoiceConnectorGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociatePhoneNumbersFromVoiceConnectorGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociatePhoneNumbersFromVoiceConnectorResponse {
  /// If the action fails for one or more of the phone numbers in the request, a
  /// list of the phone numbers is returned, along with error codes and error
  /// messages.
  @_s.JsonKey(name: 'PhoneNumberErrors')
  final List<PhoneNumberError> phoneNumberErrors;

  DisassociatePhoneNumbersFromVoiceConnectorResponse({
    this.phoneNumberErrors,
  });
  factory DisassociatePhoneNumbersFromVoiceConnectorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociatePhoneNumbersFromVoiceConnectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateSigninDelegateGroupsFromAccountResponse {
  DisassociateSigninDelegateGroupsFromAccountResponse();
  factory DisassociateSigninDelegateGroupsFromAccountResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateSigninDelegateGroupsFromAccountResponseFromJson(json);
}

enum EmailStatus {
  @_s.JsonValue('NotSent')
  notSent,
  @_s.JsonValue('Sent')
  sent,
  @_s.JsonValue('Failed')
  failed,
}

enum ErrorCode {
  @_s.JsonValue('BadRequest')
  badRequest,
  @_s.JsonValue('Conflict')
  conflict,
  @_s.JsonValue('Forbidden')
  forbidden,
  @_s.JsonValue('NotFound')
  notFound,
  @_s.JsonValue('PreconditionFailed')
  preconditionFailed,
  @_s.JsonValue('ResourceLimitExceeded')
  resourceLimitExceeded,
  @_s.JsonValue('ServiceFailure')
  serviceFailure,
  @_s.JsonValue('AccessDenied')
  accessDenied,
  @_s.JsonValue('ServiceUnavailable')
  serviceUnavailable,
  @_s.JsonValue('Throttled')
  throttled,
  @_s.JsonValue('Unauthorized')
  unauthorized,
  @_s.JsonValue('Unprocessable')
  unprocessable,
  @_s.JsonValue('VoiceConnectorGroupAssociationsExist')
  voiceConnectorGroupAssociationsExist,
  @_s.JsonValue('PhoneNumberAssociationsExist')
  phoneNumberAssociationsExist,
}

/// The configuration that allows a bot to receive outgoing events. Can be
/// either an HTTPS endpoint or a Lambda function ARN.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EventsConfiguration {
  /// The bot ID.
  @_s.JsonKey(name: 'BotId')
  final String botId;

  /// Lambda function ARN that allows a bot to receive outgoing events.
  @_s.JsonKey(name: 'LambdaFunctionArn')
  final String lambdaFunctionArn;

  /// HTTPS endpoint that allows a bot to receive outgoing events.
  @_s.JsonKey(name: 'OutboundEventsHTTPSEndpoint')
  final String outboundEventsHTTPSEndpoint;

  EventsConfiguration({
    this.botId,
    this.lambdaFunctionArn,
    this.outboundEventsHTTPSEndpoint,
  });
  factory EventsConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EventsConfigurationFromJson(json);
}

enum GeoMatchLevel {
  @_s.JsonValue('Country')
  country,
  @_s.JsonValue('AreaCode')
  areaCode,
}

extension on GeoMatchLevel {
  String toValue() {
    switch (this) {
      case GeoMatchLevel.country:
        return 'Country';
      case GeoMatchLevel.areaCode:
        return 'AreaCode';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The country and area code for a proxy phone number in a proxy phone session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class GeoMatchParams {
  /// The area code.
  @_s.JsonKey(name: 'AreaCode')
  final String areaCode;

  /// The country.
  @_s.JsonKey(name: 'Country')
  final String country;

  GeoMatchParams({
    @_s.required this.areaCode,
    @_s.required this.country,
  });
  factory GeoMatchParams.fromJson(Map<String, dynamic> json) =>
      _$GeoMatchParamsFromJson(json);

  Map<String, dynamic> toJson() => _$GeoMatchParamsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccountResponse {
  /// The Amazon Chime account details.
  @_s.JsonKey(name: 'Account')
  final Account account;

  GetAccountResponse({
    this.account,
  });
  factory GetAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAccountSettingsResponse {
  /// The Amazon Chime account settings.
  @_s.JsonKey(name: 'AccountSettings')
  final AccountSettings accountSettings;

  GetAccountSettingsResponse({
    this.accountSettings,
  });
  factory GetAccountSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAccountSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAttendeeResponse {
  /// The Amazon Chime SDK attendee information.
  @_s.JsonKey(name: 'Attendee')
  final Attendee attendee;

  GetAttendeeResponse({
    this.attendee,
  });
  factory GetAttendeeResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAttendeeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetBotResponse {
  /// The chat bot details.
  @_s.JsonKey(name: 'Bot')
  final Bot bot;

  GetBotResponse({
    this.bot,
  });
  factory GetBotResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetEventsConfigurationResponse {
  /// The events configuration details.
  @_s.JsonKey(name: 'EventsConfiguration')
  final EventsConfiguration eventsConfiguration;

  GetEventsConfigurationResponse({
    this.eventsConfiguration,
  });
  factory GetEventsConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetEventsConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetGlobalSettingsResponse {
  /// The Amazon Chime Business Calling settings.
  @_s.JsonKey(name: 'BusinessCalling')
  final BusinessCallingSettings businessCalling;

  /// The Amazon Chime Voice Connector settings.
  @_s.JsonKey(name: 'VoiceConnector')
  final VoiceConnectorSettings voiceConnector;

  GetGlobalSettingsResponse({
    this.businessCalling,
    this.voiceConnector,
  });
  factory GetGlobalSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetGlobalSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetMeetingResponse {
  /// The Amazon Chime SDK meeting information.
  @_s.JsonKey(name: 'Meeting')
  final Meeting meeting;

  GetMeetingResponse({
    this.meeting,
  });
  factory GetMeetingResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMeetingResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPhoneNumberOrderResponse {
  /// The phone number order details.
  @_s.JsonKey(name: 'PhoneNumberOrder')
  final PhoneNumberOrder phoneNumberOrder;

  GetPhoneNumberOrderResponse({
    this.phoneNumberOrder,
  });
  factory GetPhoneNumberOrderResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPhoneNumberOrderResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPhoneNumberResponse {
  /// The phone number details.
  @_s.JsonKey(name: 'PhoneNumber')
  final PhoneNumber phoneNumber;

  GetPhoneNumberResponse({
    this.phoneNumber,
  });
  factory GetPhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPhoneNumberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPhoneNumberSettingsResponse {
  /// The default outbound calling name for the account.
  @_s.JsonKey(name: 'CallingName')
  final String callingName;

  /// The updated outbound calling name timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CallingNameUpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime callingNameUpdatedTimestamp;

  GetPhoneNumberSettingsResponse({
    this.callingName,
    this.callingNameUpdatedTimestamp,
  });
  factory GetPhoneNumberSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPhoneNumberSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetProxySessionResponse {
  /// The proxy session details.
  @_s.JsonKey(name: 'ProxySession')
  final ProxySession proxySession;

  GetProxySessionResponse({
    this.proxySession,
  });
  factory GetProxySessionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetProxySessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetRoomResponse {
  /// The room details.
  @_s.JsonKey(name: 'Room')
  final Room room;

  GetRoomResponse({
    this.room,
  });
  factory GetRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRoomResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserResponse {
  /// The user details.
  @_s.JsonKey(name: 'User')
  final User user;

  GetUserResponse({
    this.user,
  });
  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetUserSettingsResponse {
  /// The user settings.
  @_s.JsonKey(name: 'UserSettings')
  final UserSettings userSettings;

  GetUserSettingsResponse({
    this.userSettings,
  });
  factory GetUserSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorGroupResponse {
  /// The Amazon Chime Voice Connector group details.
  @_s.JsonKey(name: 'VoiceConnectorGroup')
  final VoiceConnectorGroup voiceConnectorGroup;

  GetVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });
  factory GetVoiceConnectorGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVoiceConnectorGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorLoggingConfigurationResponse {
  /// The logging configuration details.
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  GetVoiceConnectorLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  factory GetVoiceConnectorLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVoiceConnectorLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorOriginationResponse {
  /// The origination setting details.
  @_s.JsonKey(name: 'Origination')
  final Origination origination;

  GetVoiceConnectorOriginationResponse({
    this.origination,
  });
  factory GetVoiceConnectorOriginationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVoiceConnectorOriginationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorProxyResponse {
  /// The proxy configuration details.
  @_s.JsonKey(name: 'Proxy')
  final Proxy proxy;

  GetVoiceConnectorProxyResponse({
    this.proxy,
  });
  factory GetVoiceConnectorProxyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVoiceConnectorProxyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorResponse {
  /// The Amazon Chime Voice Connector details.
  @_s.JsonKey(name: 'VoiceConnector')
  final VoiceConnector voiceConnector;

  GetVoiceConnectorResponse({
    this.voiceConnector,
  });
  factory GetVoiceConnectorResponse.fromJson(Map<String, dynamic> json) =>
      _$GetVoiceConnectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorStreamingConfigurationResponse {
  /// The streaming configuration details.
  @_s.JsonKey(name: 'StreamingConfiguration')
  final StreamingConfiguration streamingConfiguration;

  GetVoiceConnectorStreamingConfigurationResponse({
    this.streamingConfiguration,
  });
  factory GetVoiceConnectorStreamingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVoiceConnectorStreamingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorTerminationHealthResponse {
  /// The termination health details.
  @_s.JsonKey(name: 'TerminationHealth')
  final TerminationHealth terminationHealth;

  GetVoiceConnectorTerminationHealthResponse({
    this.terminationHealth,
  });
  factory GetVoiceConnectorTerminationHealthResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVoiceConnectorTerminationHealthResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetVoiceConnectorTerminationResponse {
  /// The termination setting details.
  @_s.JsonKey(name: 'Termination')
  final Termination termination;

  GetVoiceConnectorTerminationResponse({
    this.termination,
  });
  factory GetVoiceConnectorTerminationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVoiceConnectorTerminationResponseFromJson(json);
}

/// Invitation object returned after emailing users to invite them to join the
/// Amazon Chime <code>Team</code> account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Invite {
  /// The email address to which the invite is sent.
  @_s.JsonKey(name: 'EmailAddress')
  final String emailAddress;

  /// The status of the invite email.
  @_s.JsonKey(name: 'EmailStatus')
  final EmailStatus emailStatus;

  /// The invite ID.
  @_s.JsonKey(name: 'InviteId')
  final String inviteId;

  /// The status of the invite.
  @_s.JsonKey(name: 'Status')
  final InviteStatus status;

  Invite({
    this.emailAddress,
    this.emailStatus,
    this.inviteId,
    this.status,
  });
  factory Invite.fromJson(Map<String, dynamic> json) => _$InviteFromJson(json);
}

enum InviteStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Accepted')
  accepted,
  @_s.JsonValue('Failed')
  failed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class InviteUsersResponse {
  /// The email invitation details.
  @_s.JsonKey(name: 'Invites')
  final List<Invite> invites;

  InviteUsersResponse({
    this.invites,
  });
  factory InviteUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$InviteUsersResponseFromJson(json);
}

enum License {
  @_s.JsonValue('Basic')
  basic,
  @_s.JsonValue('Plus')
  plus,
  @_s.JsonValue('Pro')
  pro,
  @_s.JsonValue('ProTrial')
  proTrial,
}

extension on License {
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
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAccountsResponse {
  /// List of Amazon Chime accounts and account details.
  @_s.JsonKey(name: 'Accounts')
  final List<Account> accounts;

  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAccountsResponse({
    this.accounts,
    this.nextToken,
  });
  factory ListAccountsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAccountsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAttendeeTagsResponse {
  /// A list of tag key-value pairs.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListAttendeeTagsResponse({
    this.tags,
  });
  factory ListAttendeeTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAttendeeTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAttendeesResponse {
  /// The Amazon Chime SDK attendee information.
  @_s.JsonKey(name: 'Attendees')
  final List<Attendee> attendees;

  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAttendeesResponse({
    this.attendees,
    this.nextToken,
  });
  factory ListAttendeesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAttendeesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListBotsResponse {
  /// List of bots and bot details.
  @_s.JsonKey(name: 'Bots')
  final List<Bot> bots;

  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListBotsResponse({
    this.bots,
    this.nextToken,
  });
  factory ListBotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListBotsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMeetingTagsResponse {
  /// A list of tag key-value pairs.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListMeetingTagsResponse({
    this.tags,
  });
  factory ListMeetingTagsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMeetingTagsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListMeetingsResponse {
  /// The Amazon Chime SDK meeting information.
  @_s.JsonKey(name: 'Meetings')
  final List<Meeting> meetings;

  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListMeetingsResponse({
    this.meetings,
    this.nextToken,
  });
  factory ListMeetingsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListMeetingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPhoneNumberOrdersResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The phone number order details.
  @_s.JsonKey(name: 'PhoneNumberOrders')
  final List<PhoneNumberOrder> phoneNumberOrders;

  ListPhoneNumberOrdersResponse({
    this.nextToken,
    this.phoneNumberOrders,
  });
  factory ListPhoneNumberOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPhoneNumberOrdersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPhoneNumbersResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The phone number details.
  @_s.JsonKey(name: 'PhoneNumbers')
  final List<PhoneNumber> phoneNumbers;

  ListPhoneNumbersResponse({
    this.nextToken,
    this.phoneNumbers,
  });
  factory ListPhoneNumbersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPhoneNumbersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListProxySessionsResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The proxy session details.
  @_s.JsonKey(name: 'ProxySessions')
  final List<ProxySession> proxySessions;

  ListProxySessionsResponse({
    this.nextToken,
    this.proxySessions,
  });
  factory ListProxySessionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProxySessionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoomMembershipsResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The room membership details.
  @_s.JsonKey(name: 'RoomMemberships')
  final List<RoomMembership> roomMemberships;

  ListRoomMembershipsResponse({
    this.nextToken,
    this.roomMemberships,
  });
  factory ListRoomMembershipsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRoomMembershipsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRoomsResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The room details.
  @_s.JsonKey(name: 'Rooms')
  final List<Room> rooms;

  ListRoomsResponse({
    this.nextToken,
    this.rooms,
  });
  factory ListRoomsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRoomsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// A list of tag-key value pairs.
  @_s.JsonKey(name: 'Tags')
  final List<Tag> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListUsersResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of users and user details.
  @_s.JsonKey(name: 'Users')
  final List<User> users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });
  factory ListUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListUsersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVoiceConnectorGroupsResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The details of the Amazon Chime Voice Connector groups.
  @_s.JsonKey(name: 'VoiceConnectorGroups')
  final List<VoiceConnectorGroup> voiceConnectorGroups;

  ListVoiceConnectorGroupsResponse({
    this.nextToken,
    this.voiceConnectorGroups,
  });
  factory ListVoiceConnectorGroupsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListVoiceConnectorGroupsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVoiceConnectorTerminationCredentialsResponse {
  /// A list of user names.
  @_s.JsonKey(name: 'Usernames')
  final List<String> usernames;

  ListVoiceConnectorTerminationCredentialsResponse({
    this.usernames,
  });
  factory ListVoiceConnectorTerminationCredentialsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListVoiceConnectorTerminationCredentialsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListVoiceConnectorsResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// The details of the Amazon Chime Voice Connectors.
  @_s.JsonKey(name: 'VoiceConnectors')
  final List<VoiceConnector> voiceConnectors;

  ListVoiceConnectorsResponse({
    this.nextToken,
    this.voiceConnectors,
  });
  factory ListVoiceConnectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListVoiceConnectorsResponseFromJson(json);
}

/// The logging configuration associated with an Amazon Chime Voice Connector.
/// Specifies whether SIP message logs are enabled for sending to Amazon
/// CloudWatch Logs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingConfiguration {
  /// When true, enables SIP message logs for sending to Amazon CloudWatch Logs.
  @_s.JsonKey(name: 'EnableSIPLogs')
  final bool enableSIPLogs;

  LoggingConfiguration({
    this.enableSIPLogs,
  });
  factory LoggingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$LoggingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingConfigurationToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LogoutUserResponse {
  LogoutUserResponse();
  factory LogoutUserResponse.fromJson(Map<String, dynamic> json) =>
      _$LogoutUserResponseFromJson(json);
}

/// A set of endpoints used by clients to connect to the media service group for
/// a Amazon Chime SDK meeting.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MediaPlacement {
  /// The audio fallback URL.
  @_s.JsonKey(name: 'AudioFallbackUrl')
  final String audioFallbackUrl;

  /// The audio host URL.
  @_s.JsonKey(name: 'AudioHostUrl')
  final String audioHostUrl;

  /// The screen data URL.
  @_s.JsonKey(name: 'ScreenDataUrl')
  final String screenDataUrl;

  /// The screen sharing URL.
  @_s.JsonKey(name: 'ScreenSharingUrl')
  final String screenSharingUrl;

  /// The screen viewing URL.
  @_s.JsonKey(name: 'ScreenViewingUrl')
  final String screenViewingUrl;

  /// The signaling URL.
  @_s.JsonKey(name: 'SignalingUrl')
  final String signalingUrl;

  /// The turn control URL.
  @_s.JsonKey(name: 'TurnControlUrl')
  final String turnControlUrl;

  MediaPlacement({
    this.audioFallbackUrl,
    this.audioHostUrl,
    this.screenDataUrl,
    this.screenSharingUrl,
    this.screenViewingUrl,
    this.signalingUrl,
    this.turnControlUrl,
  });
  factory MediaPlacement.fromJson(Map<String, dynamic> json) =>
      _$MediaPlacementFromJson(json);
}

/// A meeting created using the Amazon Chime SDK.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Meeting {
  /// The external meeting ID.
  @_s.JsonKey(name: 'ExternalMeetingId')
  final String externalMeetingId;

  /// The media placement for the meeting.
  @_s.JsonKey(name: 'MediaPlacement')
  final MediaPlacement mediaPlacement;

  /// The Region in which to create the meeting. Available values:
  /// <code>ap-northeast-1</code>, <code>ap-southeast-1</code>,
  /// <code>ap-southeast-2</code>, <code>ca-central-1</code>,
  /// <code>eu-central-1</code>, <code>eu-north-1</code>, <code>eu-west-1</code>,
  /// <code>eu-west-2</code>, <code>eu-west-3</code>, <code>sa-east-1</code>,
  /// <code>us-east-1</code>, <code>us-east-2</code>, <code>us-west-1</code>,
  /// <code>us-west-2</code>.
  @_s.JsonKey(name: 'MediaRegion')
  final String mediaRegion;

  /// The Amazon Chime SDK meeting ID.
  @_s.JsonKey(name: 'MeetingId')
  final String meetingId;

  Meeting({
    this.externalMeetingId,
    this.mediaPlacement,
    this.mediaRegion,
    this.meetingId,
  });
  factory Meeting.fromJson(Map<String, dynamic> json) =>
      _$MeetingFromJson(json);
}

/// The configuration for resource targets to receive notifications when Amazon
/// Chime SDK meeting and attendee events occur.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MeetingNotificationConfiguration {
  /// The SNS topic ARN.
  @_s.JsonKey(name: 'SnsTopicArn')
  final String snsTopicArn;

  /// The SQS queue ARN.
  @_s.JsonKey(name: 'SqsQueueArn')
  final String sqsQueueArn;

  MeetingNotificationConfiguration({
    this.snsTopicArn,
    this.sqsQueueArn,
  });
  Map<String, dynamic> toJson() =>
      _$MeetingNotificationConfigurationToJson(this);
}

/// The member details, such as email address, name, member ID, and member type.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Member {
  /// The Amazon Chime account ID.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The member email address.
  @_s.JsonKey(name: 'Email')
  final String email;

  /// The member name.
  @_s.JsonKey(name: 'FullName')
  final String fullName;

  /// The member ID (user ID or bot ID).
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  /// The member type.
  @_s.JsonKey(name: 'MemberType')
  final MemberType memberType;

  Member({
    this.accountId,
    this.email,
    this.fullName,
    this.memberId,
    this.memberType,
  });
  factory Member.fromJson(Map<String, dynamic> json) => _$MemberFromJson(json);
}

/// The list of errors returned when a member action results in an error.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MemberError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The member ID.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  MemberError({
    this.errorCode,
    this.errorMessage,
    this.memberId,
  });
  factory MemberError.fromJson(Map<String, dynamic> json) =>
      _$MemberErrorFromJson(json);
}

enum MemberType {
  @_s.JsonValue('User')
  user,
  @_s.JsonValue('Bot')
  bot,
  @_s.JsonValue('Webhook')
  webhook,
}

/// Membership details, such as member ID and member role.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class MembershipItem {
  /// The member ID.
  @_s.JsonKey(name: 'MemberId')
  final String memberId;

  /// The member role.
  @_s.JsonKey(name: 'Role')
  final RoomMembershipRole role;

  MembershipItem({
    this.memberId,
    this.role,
  });
  Map<String, dynamic> toJson() => _$MembershipItemToJson(this);
}

enum NumberSelectionBehavior {
  @_s.JsonValue('PreferSticky')
  preferSticky,
  @_s.JsonValue('AvoidSticky')
  avoidSticky,
}

extension on NumberSelectionBehavior {
  String toValue() {
    switch (this) {
      case NumberSelectionBehavior.preferSticky:
        return 'PreferSticky';
      case NumberSelectionBehavior.avoidSticky:
        return 'AvoidSticky';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A phone number for which an order has been placed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class OrderedPhoneNumber {
  /// The phone number, in E.164 format.
  @_s.JsonKey(name: 'E164PhoneNumber')
  final String e164PhoneNumber;

  /// The phone number status.
  @_s.JsonKey(name: 'Status')
  final OrderedPhoneNumberStatus status;

  OrderedPhoneNumber({
    this.e164PhoneNumber,
    this.status,
  });
  factory OrderedPhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$OrderedPhoneNumberFromJson(json);
}

enum OrderedPhoneNumberStatus {
  @_s.JsonValue('Processing')
  processing,
  @_s.JsonValue('Acquired')
  acquired,
  @_s.JsonValue('Failed')
  failed,
}

/// Origination settings enable your SIP hosts to receive inbound calls using
/// your Amazon Chime Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Origination {
  /// When origination settings are disabled, inbound calls are not enabled for
  /// your Amazon Chime Voice Connector.
  @_s.JsonKey(name: 'Disabled')
  final bool disabled;

  /// The call distribution properties defined for your SIP hosts. Valid range:
  /// Minimum value of 1. Maximum value of 20.
  @_s.JsonKey(name: 'Routes')
  final List<OriginationRoute> routes;

  Origination({
    this.disabled,
    this.routes,
  });
  factory Origination.fromJson(Map<String, dynamic> json) =>
      _$OriginationFromJson(json);

  Map<String, dynamic> toJson() => _$OriginationToJson(this);
}

/// Origination routes define call distribution properties for your SIP hosts to
/// receive inbound calls using your Amazon Chime Voice Connector. Limit: Ten
/// origination routes for each Amazon Chime Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OriginationRoute {
  /// The FQDN or IP address to contact for origination traffic.
  @_s.JsonKey(name: 'Host')
  final String host;

  /// The designated origination route port. Defaults to 5060.
  @_s.JsonKey(name: 'Port')
  final int port;

  /// The priority associated with the host, with 1 being the highest priority.
  /// Higher priority hosts are attempted first.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The protocol to use for the origination route. Encryption-enabled Amazon
  /// Chime Voice Connectors use TCP protocol by default.
  @_s.JsonKey(name: 'Protocol')
  final OriginationRouteProtocol protocol;

  /// The weight associated with the host. If hosts are equal in priority, calls
  /// are distributed among them based on their relative weight.
  @_s.JsonKey(name: 'Weight')
  final int weight;

  OriginationRoute({
    this.host,
    this.port,
    this.priority,
    this.protocol,
    this.weight,
  });
  factory OriginationRoute.fromJson(Map<String, dynamic> json) =>
      _$OriginationRouteFromJson(json);

  Map<String, dynamic> toJson() => _$OriginationRouteToJson(this);
}

enum OriginationRouteProtocol {
  @_s.JsonValue('TCP')
  tcp,
  @_s.JsonValue('UDP')
  udp,
}

/// The phone number and proxy phone number for a participant in an Amazon Chime
/// Voice Connector proxy session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Participant {
  /// The participant's phone number.
  @_s.JsonKey(name: 'PhoneNumber')
  final String phoneNumber;

  /// The participant's proxy phone number.
  @_s.JsonKey(name: 'ProxyPhoneNumber')
  final String proxyPhoneNumber;

  Participant({
    this.phoneNumber,
    this.proxyPhoneNumber,
  });
  factory Participant.fromJson(Map<String, dynamic> json) =>
      _$ParticipantFromJson(json);
}

/// A phone number used for Amazon Chime Business Calling or an Amazon Chime
/// Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumber {
  /// The phone number associations.
  @_s.JsonKey(name: 'Associations')
  final List<PhoneNumberAssociation> associations;

  /// The outbound calling name associated with the phone number.
  @_s.JsonKey(name: 'CallingName')
  final String callingName;

  /// The outbound calling name status.
  @_s.JsonKey(name: 'CallingNameStatus')
  final CallingNameStatus callingNameStatus;

  /// The phone number capabilities.
  @_s.JsonKey(name: 'Capabilities')
  final PhoneNumberCapabilities capabilities;

  /// The phone number creation timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The deleted phone number timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'DeletionTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime deletionTimestamp;

  /// The phone number, in E.164 format.
  @_s.JsonKey(name: 'E164PhoneNumber')
  final String e164PhoneNumber;

  /// The phone number ID.
  @_s.JsonKey(name: 'PhoneNumberId')
  final String phoneNumberId;

  /// The phone number product type.
  @_s.JsonKey(name: 'ProductType')
  final PhoneNumberProductType productType;

  /// The phone number status.
  @_s.JsonKey(name: 'Status')
  final PhoneNumberStatus status;

  /// The phone number type.
  @_s.JsonKey(name: 'Type')
  final PhoneNumberType type;

  /// The updated phone number timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

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
  factory PhoneNumber.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberFromJson(json);
}

/// The phone number associations, such as Amazon Chime account ID, Amazon Chime
/// user ID, Amazon Chime Voice Connector ID, or Amazon Chime Voice Connector
/// group ID.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberAssociation {
  /// The timestamp of the phone number association, in ISO 8601 format.
  @_s.JsonKey(
      name: 'AssociatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime associatedTimestamp;

  /// Defines the association with an Amazon Chime account ID, user ID, Amazon
  /// Chime Voice Connector ID, or Amazon Chime Voice Connector group ID.
  @_s.JsonKey(name: 'Name')
  final PhoneNumberAssociationName name;

  /// Contains the ID for the entity specified in Name.
  @_s.JsonKey(name: 'Value')
  final String value;

  PhoneNumberAssociation({
    this.associatedTimestamp,
    this.name,
    this.value,
  });
  factory PhoneNumberAssociation.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberAssociationFromJson(json);
}

enum PhoneNumberAssociationName {
  @_s.JsonValue('AccountId')
  accountId,
  @_s.JsonValue('UserId')
  userId,
  @_s.JsonValue('VoiceConnectorId')
  voiceConnectorId,
  @_s.JsonValue('VoiceConnectorGroupId')
  voiceConnectorGroupId,
}

/// The phone number capabilities for Amazon Chime Business Calling phone
/// numbers, such as enabled inbound and outbound calling and text messaging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberCapabilities {
  /// Allows or denies inbound calling for the specified phone number.
  @_s.JsonKey(name: 'InboundCall')
  final bool inboundCall;

  /// Allows or denies inbound MMS messaging for the specified phone number.
  @_s.JsonKey(name: 'InboundMMS')
  final bool inboundMMS;

  /// Allows or denies inbound SMS messaging for the specified phone number.
  @_s.JsonKey(name: 'InboundSMS')
  final bool inboundSMS;

  /// Allows or denies outbound calling for the specified phone number.
  @_s.JsonKey(name: 'OutboundCall')
  final bool outboundCall;

  /// Allows or denies outbound MMS messaging for the specified phone number.
  @_s.JsonKey(name: 'OutboundMMS')
  final bool outboundMMS;

  /// Allows or denies outbound SMS messaging for the specified phone number.
  @_s.JsonKey(name: 'OutboundSMS')
  final bool outboundSMS;

  PhoneNumberCapabilities({
    this.inboundCall,
    this.inboundMMS,
    this.inboundSMS,
    this.outboundCall,
    this.outboundMMS,
    this.outboundSMS,
  });
  factory PhoneNumberCapabilities.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberCapabilitiesFromJson(json);
}

/// If the phone number action fails for one or more of the phone numbers in the
/// request, a list of the phone numbers is returned, along with error codes and
/// error messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The phone number ID for which the action failed.
  @_s.JsonKey(name: 'PhoneNumberId')
  final String phoneNumberId;

  PhoneNumberError({
    this.errorCode,
    this.errorMessage,
    this.phoneNumberId,
  });
  factory PhoneNumberError.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberErrorFromJson(json);
}

/// The details of a phone number order created for Amazon Chime.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PhoneNumberOrder {
  /// The phone number order creation timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The ordered phone number details, such as the phone number in E.164 format
  /// and the phone number status.
  @_s.JsonKey(name: 'OrderedPhoneNumbers')
  final List<OrderedPhoneNumber> orderedPhoneNumbers;

  /// The phone number order ID.
  @_s.JsonKey(name: 'PhoneNumberOrderId')
  final String phoneNumberOrderId;

  /// The phone number order product type.
  @_s.JsonKey(name: 'ProductType')
  final PhoneNumberProductType productType;

  /// The status of the phone number order.
  @_s.JsonKey(name: 'Status')
  final PhoneNumberOrderStatus status;

  /// The updated phone number order timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  PhoneNumberOrder({
    this.createdTimestamp,
    this.orderedPhoneNumbers,
    this.phoneNumberOrderId,
    this.productType,
    this.status,
    this.updatedTimestamp,
  });
  factory PhoneNumberOrder.fromJson(Map<String, dynamic> json) =>
      _$PhoneNumberOrderFromJson(json);
}

enum PhoneNumberOrderStatus {
  @_s.JsonValue('Processing')
  processing,
  @_s.JsonValue('Successful')
  successful,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Partial')
  partial,
}

enum PhoneNumberProductType {
  @_s.JsonValue('BusinessCalling')
  businessCalling,
  @_s.JsonValue('VoiceConnector')
  voiceConnector,
}

extension on PhoneNumberProductType {
  String toValue() {
    switch (this) {
      case PhoneNumberProductType.businessCalling:
        return 'BusinessCalling';
      case PhoneNumberProductType.voiceConnector:
        return 'VoiceConnector';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum PhoneNumberStatus {
  @_s.JsonValue('AcquireInProgress')
  acquireInProgress,
  @_s.JsonValue('AcquireFailed')
  acquireFailed,
  @_s.JsonValue('Unassigned')
  unassigned,
  @_s.JsonValue('Assigned')
  assigned,
  @_s.JsonValue('ReleaseInProgress')
  releaseInProgress,
  @_s.JsonValue('DeleteInProgress')
  deleteInProgress,
  @_s.JsonValue('ReleaseFailed')
  releaseFailed,
  @_s.JsonValue('DeleteFailed')
  deleteFailed,
}

enum PhoneNumberType {
  @_s.JsonValue('Local')
  local,
  @_s.JsonValue('TollFree')
  tollFree,
}

/// The proxy configuration for an Amazon Chime Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Proxy {
  /// The default number of minutes allowed for proxy sessions.
  @_s.JsonKey(name: 'DefaultSessionExpiryMinutes')
  final int defaultSessionExpiryMinutes;

  /// When true, stops proxy sessions from being created on the specified Amazon
  /// Chime Voice Connector.
  @_s.JsonKey(name: 'Disabled')
  final bool disabled;

  /// The phone number to route calls to after a proxy session expires.
  @_s.JsonKey(name: 'FallBackPhoneNumber')
  final String fallBackPhoneNumber;

  /// The countries for proxy phone numbers to be selected from.
  @_s.JsonKey(name: 'PhoneNumberCountries')
  final List<String> phoneNumberCountries;

  Proxy({
    this.defaultSessionExpiryMinutes,
    this.disabled,
    this.fallBackPhoneNumber,
    this.phoneNumberCountries,
  });
  factory Proxy.fromJson(Map<String, dynamic> json) => _$ProxyFromJson(json);
}

/// The proxy session for an Amazon Chime Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ProxySession {
  /// The proxy session capabilities.
  @_s.JsonKey(name: 'Capabilities')
  final List<String> capabilities;

  /// The created timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The ended timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'EndedTimestamp', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime endedTimestamp;

  /// The number of minutes allowed for the proxy session.
  @_s.JsonKey(name: 'ExpiryMinutes')
  final int expiryMinutes;

  /// The preference for matching the country or area code of the proxy phone
  /// number with that of the first participant.
  @_s.JsonKey(name: 'GeoMatchLevel')
  final GeoMatchLevel geoMatchLevel;

  /// The country and area code for the proxy phone number.
  @_s.JsonKey(name: 'GeoMatchParams')
  final GeoMatchParams geoMatchParams;

  /// The name of the proxy session.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The preference for proxy phone number reuse, or stickiness, between the same
  /// participants across sessions.
  @_s.JsonKey(name: 'NumberSelectionBehavior')
  final NumberSelectionBehavior numberSelectionBehavior;

  /// The proxy session participants.
  @_s.JsonKey(name: 'Participants')
  final List<Participant> participants;

  /// The proxy session ID.
  @_s.JsonKey(name: 'ProxySessionId')
  final String proxySessionId;

  /// The status of the proxy session.
  @_s.JsonKey(name: 'Status')
  final ProxySessionStatus status;

  /// The updated timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  /// The Amazon Chime voice connector ID.
  @_s.JsonKey(name: 'VoiceConnectorId')
  final String voiceConnectorId;

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
  factory ProxySession.fromJson(Map<String, dynamic> json) =>
      _$ProxySessionFromJson(json);
}

enum ProxySessionStatus {
  @_s.JsonValue('Open')
  open,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Closed')
  closed,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutEventsConfigurationResponse {
  @_s.JsonKey(name: 'EventsConfiguration')
  final EventsConfiguration eventsConfiguration;

  PutEventsConfigurationResponse({
    this.eventsConfiguration,
  });
  factory PutEventsConfigurationResponse.fromJson(Map<String, dynamic> json) =>
      _$PutEventsConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutVoiceConnectorLoggingConfigurationResponse {
  /// The updated logging configuration details.
  @_s.JsonKey(name: 'LoggingConfiguration')
  final LoggingConfiguration loggingConfiguration;

  PutVoiceConnectorLoggingConfigurationResponse({
    this.loggingConfiguration,
  });
  factory PutVoiceConnectorLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutVoiceConnectorLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutVoiceConnectorOriginationResponse {
  /// The updated origination setting details.
  @_s.JsonKey(name: 'Origination')
  final Origination origination;

  PutVoiceConnectorOriginationResponse({
    this.origination,
  });
  factory PutVoiceConnectorOriginationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutVoiceConnectorOriginationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutVoiceConnectorProxyResponse {
  /// The proxy configuration details.
  @_s.JsonKey(name: 'Proxy')
  final Proxy proxy;

  PutVoiceConnectorProxyResponse({
    this.proxy,
  });
  factory PutVoiceConnectorProxyResponse.fromJson(Map<String, dynamic> json) =>
      _$PutVoiceConnectorProxyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutVoiceConnectorStreamingConfigurationResponse {
  /// The updated streaming configuration details.
  @_s.JsonKey(name: 'StreamingConfiguration')
  final StreamingConfiguration streamingConfiguration;

  PutVoiceConnectorStreamingConfigurationResponse({
    this.streamingConfiguration,
  });
  factory PutVoiceConnectorStreamingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutVoiceConnectorStreamingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutVoiceConnectorTerminationResponse {
  /// The updated termination setting details.
  @_s.JsonKey(name: 'Termination')
  final Termination termination;

  PutVoiceConnectorTerminationResponse({
    this.termination,
  });
  factory PutVoiceConnectorTerminationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutVoiceConnectorTerminationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegenerateSecurityTokenResponse {
  @_s.JsonKey(name: 'Bot')
  final Bot bot;

  RegenerateSecurityTokenResponse({
    this.bot,
  });
  factory RegenerateSecurityTokenResponse.fromJson(Map<String, dynamic> json) =>
      _$RegenerateSecurityTokenResponseFromJson(json);
}

enum RegistrationStatus {
  @_s.JsonValue('Unregistered')
  unregistered,
  @_s.JsonValue('Registered')
  registered,
  @_s.JsonValue('Suspended')
  suspended,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResetPersonalPINResponse {
  /// The user details and new personal meeting PIN.
  @_s.JsonKey(name: 'User')
  final User user;

  ResetPersonalPINResponse({
    this.user,
  });
  factory ResetPersonalPINResponse.fromJson(Map<String, dynamic> json) =>
      _$ResetPersonalPINResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestorePhoneNumberResponse {
  /// The phone number details.
  @_s.JsonKey(name: 'PhoneNumber')
  final PhoneNumber phoneNumber;

  RestorePhoneNumberResponse({
    this.phoneNumber,
  });
  factory RestorePhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$RestorePhoneNumberResponseFromJson(json);
}

/// The Amazon Chime chat room details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Room {
  /// The Amazon Chime account ID.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The identifier of the room creator.
  @_s.JsonKey(name: 'CreatedBy')
  final String createdBy;

  /// The room creation timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The room name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The room ID.
  @_s.JsonKey(name: 'RoomId')
  final String roomId;

  /// The room update timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  Room({
    this.accountId,
    this.createdBy,
    this.createdTimestamp,
    this.name,
    this.roomId,
    this.updatedTimestamp,
  });
  factory Room.fromJson(Map<String, dynamic> json) => _$RoomFromJson(json);
}

/// The room membership details.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RoomMembership {
  /// The identifier of the user that invited the room member.
  @_s.JsonKey(name: 'InvitedBy')
  final String invitedBy;
  @_s.JsonKey(name: 'Member')
  final Member member;

  /// The membership role.
  @_s.JsonKey(name: 'Role')
  final RoomMembershipRole role;

  /// The room ID.
  @_s.JsonKey(name: 'RoomId')
  final String roomId;

  /// The room membership update timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  RoomMembership({
    this.invitedBy,
    this.member,
    this.role,
    this.roomId,
    this.updatedTimestamp,
  });
  factory RoomMembership.fromJson(Map<String, dynamic> json) =>
      _$RoomMembershipFromJson(json);
}

enum RoomMembershipRole {
  @_s.JsonValue('Administrator')
  administrator,
  @_s.JsonValue('Member')
  member,
}

extension on RoomMembershipRole {
  String toValue() {
    switch (this) {
      case RoomMembershipRole.administrator:
        return 'Administrator';
      case RoomMembershipRole.member:
        return 'Member';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SearchAvailablePhoneNumbersResponse {
  /// List of phone numbers, in E.164 format.
  @_s.JsonKey(name: 'E164PhoneNumbers')
  final List<String> e164PhoneNumbers;

  SearchAvailablePhoneNumbersResponse({
    this.e164PhoneNumbers,
  });
  factory SearchAvailablePhoneNumbersResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SearchAvailablePhoneNumbersResponseFromJson(json);
}

/// An Active Directory (AD) group whose members are granted permission to act
/// as delegates.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SigninDelegateGroup {
  /// The group name.
  @_s.JsonKey(name: 'GroupName')
  final String groupName;

  SigninDelegateGroup({
    this.groupName,
  });
  factory SigninDelegateGroup.fromJson(Map<String, dynamic> json) =>
      _$SigninDelegateGroupFromJson(json);

  Map<String, dynamic> toJson() => _$SigninDelegateGroupToJson(this);
}

/// The streaming configuration associated with an Amazon Chime Voice Connector.
/// Specifies whether media streaming is enabled for sending to Amazon Kinesis,
/// and shows the retention period for the Amazon Kinesis data, in hours.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamingConfiguration {
  /// The retention period, in hours, for the Amazon Kinesis data.
  @_s.JsonKey(name: 'DataRetentionInHours')
  final int dataRetentionInHours;

  /// When true, media streaming to Amazon Kinesis is turned off.
  @_s.JsonKey(name: 'Disabled')
  final bool disabled;

  StreamingConfiguration({
    @_s.required this.dataRetentionInHours,
    this.disabled,
  });
  factory StreamingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$StreamingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingConfigurationToJson(this);
}

/// Describes a tag applied to a resource.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'Key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'Value')
  final String value;

  Tag({
    @_s.required this.key,
    @_s.required this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Settings that allow management of telephony permissions for an Amazon Chime
/// user, such as inbound and outbound calling and text messaging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class TelephonySettings {
  /// Allows or denies inbound calling.
  @_s.JsonKey(name: 'InboundCalling')
  final bool inboundCalling;

  /// Allows or denies outbound calling.
  @_s.JsonKey(name: 'OutboundCalling')
  final bool outboundCalling;

  /// Allows or denies SMS messaging.
  @_s.JsonKey(name: 'SMS')
  final bool sms;

  TelephonySettings({
    @_s.required this.inboundCalling,
    @_s.required this.outboundCalling,
    @_s.required this.sms,
  });
  factory TelephonySettings.fromJson(Map<String, dynamic> json) =>
      _$TelephonySettingsFromJson(json);

  Map<String, dynamic> toJson() => _$TelephonySettingsToJson(this);
}

/// Termination settings enable your SIP hosts to make outbound calls using your
/// Amazon Chime Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Termination {
  /// The countries to which calls are allowed, in ISO 3166-1 alpha-2 format.
  /// Required.
  @_s.JsonKey(name: 'CallingRegions')
  final List<String> callingRegions;

  /// The IP addresses allowed to make calls, in CIDR format. Required.
  @_s.JsonKey(name: 'CidrAllowedList')
  final List<String> cidrAllowedList;

  /// The limit on calls per second. Max value based on account service quota.
  /// Default value of 1.
  @_s.JsonKey(name: 'CpsLimit')
  final int cpsLimit;

  /// The default caller ID phone number.
  @_s.JsonKey(name: 'DefaultPhoneNumber')
  final String defaultPhoneNumber;

  /// When termination settings are disabled, outbound calls can not be made.
  @_s.JsonKey(name: 'Disabled')
  final bool disabled;

  Termination({
    this.callingRegions,
    this.cidrAllowedList,
    this.cpsLimit,
    this.defaultPhoneNumber,
    this.disabled,
  });
  factory Termination.fromJson(Map<String, dynamic> json) =>
      _$TerminationFromJson(json);

  Map<String, dynamic> toJson() => _$TerminationToJson(this);
}

/// The termination health details, including the source IP address and
/// timestamp of the last successful SIP <code>OPTIONS</code> message from your
/// SIP infrastructure.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminationHealth {
  /// The source IP address.
  @_s.JsonKey(name: 'Source')
  final String source;

  /// The timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'Timestamp', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime timestamp;

  TerminationHealth({
    this.source,
    this.timestamp,
  });
  factory TerminationHealth.fromJson(Map<String, dynamic> json) =>
      _$TerminationHealthFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAccountResponse {
  /// The updated Amazon Chime account details.
  @_s.JsonKey(name: 'Account')
  final Account account;

  UpdateAccountResponse({
    this.account,
  });
  factory UpdateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAccountSettingsResponse {
  UpdateAccountSettingsResponse();
  factory UpdateAccountSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAccountSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateBotResponse {
  /// The updated bot details.
  @_s.JsonKey(name: 'Bot')
  final Bot bot;

  UpdateBotResponse({
    this.bot,
  });
  factory UpdateBotResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBotResponseFromJson(json);
}

/// The phone number ID, product type, or calling name fields to update, used
/// with the <a>BatchUpdatePhoneNumber</a> and <a>UpdatePhoneNumber</a> actions.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdatePhoneNumberRequestItem {
  /// The phone number ID to update.
  @_s.JsonKey(name: 'PhoneNumberId')
  final String phoneNumberId;

  /// The outbound calling name to update.
  @_s.JsonKey(name: 'CallingName')
  final String callingName;

  /// The product type to update.
  @_s.JsonKey(name: 'ProductType')
  final PhoneNumberProductType productType;

  UpdatePhoneNumberRequestItem({
    @_s.required this.phoneNumberId,
    this.callingName,
    this.productType,
  });
  Map<String, dynamic> toJson() => _$UpdatePhoneNumberRequestItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdatePhoneNumberResponse {
  /// The updated phone number details.
  @_s.JsonKey(name: 'PhoneNumber')
  final PhoneNumber phoneNumber;

  UpdatePhoneNumberResponse({
    this.phoneNumber,
  });
  factory UpdatePhoneNumberResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdatePhoneNumberResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateProxySessionResponse {
  /// The proxy session details.
  @_s.JsonKey(name: 'ProxySession')
  final ProxySession proxySession;

  UpdateProxySessionResponse({
    this.proxySession,
  });
  factory UpdateProxySessionResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateProxySessionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRoomMembershipResponse {
  /// The room membership details.
  @_s.JsonKey(name: 'RoomMembership')
  final RoomMembership roomMembership;

  UpdateRoomMembershipResponse({
    this.roomMembership,
  });
  factory UpdateRoomMembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoomMembershipResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRoomResponse {
  /// The room details.
  @_s.JsonKey(name: 'Room')
  final Room room;

  UpdateRoomResponse({
    this.room,
  });
  factory UpdateRoomResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRoomResponseFromJson(json);
}

/// The user ID and user fields to update, used with the <a>BatchUpdateUser</a>
/// action.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class UpdateUserRequestItem {
  /// The user ID.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// The Alexa for Business metadata.
  @_s.JsonKey(name: 'AlexaForBusinessMetadata')
  final AlexaForBusinessMetadata alexaForBusinessMetadata;

  /// The user license type.
  @_s.JsonKey(name: 'LicenseType')
  final License licenseType;

  /// The user type.
  @_s.JsonKey(name: 'UserType')
  final UserType userType;

  UpdateUserRequestItem({
    @_s.required this.userId,
    this.alexaForBusinessMetadata,
    this.licenseType,
    this.userType,
  });
  Map<String, dynamic> toJson() => _$UpdateUserRequestItemToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateUserResponse {
  /// The updated user details.
  @_s.JsonKey(name: 'User')
  final User user;

  UpdateUserResponse({
    this.user,
  });
  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVoiceConnectorGroupResponse {
  /// The updated Amazon Chime Voice Connector group details.
  @_s.JsonKey(name: 'VoiceConnectorGroup')
  final VoiceConnectorGroup voiceConnectorGroup;

  UpdateVoiceConnectorGroupResponse({
    this.voiceConnectorGroup,
  });
  factory UpdateVoiceConnectorGroupResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateVoiceConnectorGroupResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateVoiceConnectorResponse {
  /// The updated Amazon Chime Voice Connector details.
  @_s.JsonKey(name: 'VoiceConnector')
  final VoiceConnector voiceConnector;

  UpdateVoiceConnectorResponse({
    this.voiceConnector,
  });
  factory UpdateVoiceConnectorResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateVoiceConnectorResponseFromJson(json);
}

/// The user on the Amazon Chime account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class User {
  /// The user ID.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  /// The Amazon Chime account ID.
  @_s.JsonKey(name: 'AccountId')
  final String accountId;

  /// The Alexa for Business metadata.
  @_s.JsonKey(name: 'AlexaForBusinessMetadata')
  final AlexaForBusinessMetadata alexaForBusinessMetadata;

  /// The display name of the user.
  @_s.JsonKey(name: 'DisplayName')
  final String displayName;

  /// Date and time when the user is invited to the Amazon Chime account, in ISO
  /// 8601 format.
  @_s.JsonKey(
      name: 'InvitedOn', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime invitedOn;

  /// The license type for the user.
  @_s.JsonKey(name: 'LicenseType')
  final License licenseType;

  /// The user's personal meeting PIN.
  @_s.JsonKey(name: 'PersonalPIN')
  final String personalPIN;

  /// The primary email address of the user.
  @_s.JsonKey(name: 'PrimaryEmail')
  final String primaryEmail;

  /// The primary phone number associated with the user.
  @_s.JsonKey(name: 'PrimaryProvisionedNumber')
  final String primaryProvisionedNumber;

  /// Date and time when the user is registered, in ISO 8601 format.
  @_s.JsonKey(
      name: 'RegisteredOn', fromJson: iso8601FromJson, toJson: iso8601ToJson)
  final DateTime registeredOn;

  /// The user invite status.
  @_s.JsonKey(name: 'UserInvitationStatus')
  final InviteStatus userInvitationStatus;

  /// The user registration status.
  @_s.JsonKey(name: 'UserRegistrationStatus')
  final RegistrationStatus userRegistrationStatus;

  /// The user type.
  @_s.JsonKey(name: 'UserType')
  final UserType userType;

  User({
    @_s.required this.userId,
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
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// The list of errors returned when errors are encountered during the
/// <a>BatchSuspendUser</a>, <a>BatchUnsuspendUser</a>, or
/// <a>BatchUpdateUser</a> actions. This includes user IDs, error codes, and
/// error messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UserError {
  /// The error code.
  @_s.JsonKey(name: 'ErrorCode')
  final ErrorCode errorCode;

  /// The error message.
  @_s.JsonKey(name: 'ErrorMessage')
  final String errorMessage;

  /// The user ID for which the action failed.
  @_s.JsonKey(name: 'UserId')
  final String userId;

  UserError({
    this.errorCode,
    this.errorMessage,
    this.userId,
  });
  factory UserError.fromJson(Map<String, dynamic> json) =>
      _$UserErrorFromJson(json);
}

/// Settings associated with an Amazon Chime user, including inbound and
/// outbound calling and text messaging.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserSettings {
  /// The telephony settings associated with the user.
  @_s.JsonKey(name: 'Telephony')
  final TelephonySettings telephony;

  UserSettings({
    @_s.required this.telephony,
  });
  factory UserSettings.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$UserSettingsToJson(this);
}

enum UserType {
  @_s.JsonValue('PrivateUser')
  privateUser,
  @_s.JsonValue('SharedDevice')
  sharedDevice,
}

extension on UserType {
  String toValue() {
    switch (this) {
      case UserType.privateUser:
        return 'PrivateUser';
      case UserType.sharedDevice:
        return 'SharedDevice';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Amazon Chime Voice Connector configuration, including outbound host name
/// and encryption settings.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VoiceConnector {
  /// The AWS Region in which the Amazon Chime Voice Connector is created.
  /// Default: <code>us-east-1</code>.
  @_s.JsonKey(name: 'AwsRegion')
  final VoiceConnectorAwsRegion awsRegion;

  /// The Amazon Chime Voice Connector creation timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The name of the Amazon Chime Voice Connector.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The outbound host name for the Amazon Chime Voice Connector.
  @_s.JsonKey(name: 'OutboundHostName')
  final String outboundHostName;

  /// Designates whether encryption is required for the Amazon Chime Voice
  /// Connector.
  @_s.JsonKey(name: 'RequireEncryption')
  final bool requireEncryption;

  /// The updated Amazon Chime Voice Connector timestamp, in ISO 8601 format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  /// The Amazon Chime Voice Connector ID.
  @_s.JsonKey(name: 'VoiceConnectorId')
  final String voiceConnectorId;

  VoiceConnector({
    this.awsRegion,
    this.createdTimestamp,
    this.name,
    this.outboundHostName,
    this.requireEncryption,
    this.updatedTimestamp,
    this.voiceConnectorId,
  });
  factory VoiceConnector.fromJson(Map<String, dynamic> json) =>
      _$VoiceConnectorFromJson(json);
}

enum VoiceConnectorAwsRegion {
  @_s.JsonValue('us-east-1')
  usEast_1,
  @_s.JsonValue('us-west-2')
  usWest_2,
}

extension on VoiceConnectorAwsRegion {
  String toValue() {
    switch (this) {
      case VoiceConnectorAwsRegion.usEast_1:
        return 'us-east-1';
      case VoiceConnectorAwsRegion.usWest_2:
        return 'us-west-2';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The Amazon Chime Voice Connector group configuration, including associated
/// Amazon Chime Voice Connectors. You can include Amazon Chime Voice Connectors
/// from different AWS Regions in your group. This creates a fault tolerant
/// mechanism for fallback in case of availability events.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VoiceConnectorGroup {
  /// The Amazon Chime Voice Connector group creation timestamp, in ISO 8601
  /// format.
  @_s.JsonKey(
      name: 'CreatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime createdTimestamp;

  /// The name of the Amazon Chime Voice Connector group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The updated Amazon Chime Voice Connector group timestamp, in ISO 8601
  /// format.
  @_s.JsonKey(
      name: 'UpdatedTimestamp',
      fromJson: iso8601FromJson,
      toJson: iso8601ToJson)
  final DateTime updatedTimestamp;

  /// The Amazon Chime Voice Connector group ID.
  @_s.JsonKey(name: 'VoiceConnectorGroupId')
  final String voiceConnectorGroupId;

  /// The Amazon Chime Voice Connectors to which to route inbound calls.
  @_s.JsonKey(name: 'VoiceConnectorItems')
  final List<VoiceConnectorItem> voiceConnectorItems;

  VoiceConnectorGroup({
    this.createdTimestamp,
    this.name,
    this.updatedTimestamp,
    this.voiceConnectorGroupId,
    this.voiceConnectorItems,
  });
  factory VoiceConnectorGroup.fromJson(Map<String, dynamic> json) =>
      _$VoiceConnectorGroupFromJson(json);
}

/// For Amazon Chime Voice Connector groups, the Amazon Chime Voice Connectors
/// to which to route inbound calls. Includes priority configuration settings.
/// Limit: 3 <code>VoiceConnectorItems</code> per Amazon Chime Voice Connector
/// group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VoiceConnectorItem {
  /// The priority associated with the Amazon Chime Voice Connector, with 1 being
  /// the highest priority. Higher priority Amazon Chime Voice Connectors are
  /// attempted first.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The Amazon Chime Voice Connector ID.
  @_s.JsonKey(name: 'VoiceConnectorId')
  final String voiceConnectorId;

  VoiceConnectorItem({
    @_s.required this.priority,
    @_s.required this.voiceConnectorId,
  });
  factory VoiceConnectorItem.fromJson(Map<String, dynamic> json) =>
      _$VoiceConnectorItemFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceConnectorItemToJson(this);
}

/// The Amazon Chime Voice Connector settings. Includes any Amazon S3 buckets
/// designated for storing call detail records.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VoiceConnectorSettings {
  /// The Amazon S3 bucket designated for call detail record storage.
  @_s.JsonKey(name: 'CdrBucket')
  final String cdrBucket;

  VoiceConnectorSettings({
    this.cdrBucket,
  });
  factory VoiceConnectorSettings.fromJson(Map<String, dynamic> json) =>
      _$VoiceConnectorSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$VoiceConnectorSettingsToJson(this);
}

class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String type, String message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

class BadRequestException extends _s.GenericAwsException {
  BadRequestException({String type, String message})
      : super(type: type, code: 'BadRequestException', message: message);
}

class ConflictException extends _s.GenericAwsException {
  ConflictException({String type, String message})
      : super(type: type, code: 'ConflictException', message: message);
}

class ForbiddenException extends _s.GenericAwsException {
  ForbiddenException({String type, String message})
      : super(type: type, code: 'ForbiddenException', message: message);
}

class NotFoundException extends _s.GenericAwsException {
  NotFoundException({String type, String message})
      : super(type: type, code: 'NotFoundException', message: message);
}

class ResourceLimitExceededException extends _s.GenericAwsException {
  ResourceLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceLimitExceededException',
            message: message);
}

class ServiceFailureException extends _s.GenericAwsException {
  ServiceFailureException({String type, String message})
      : super(type: type, code: 'ServiceFailureException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottledClientException extends _s.GenericAwsException {
  ThrottledClientException({String type, String message})
      : super(type: type, code: 'ThrottledClientException', message: message);
}

class UnauthorizedClientException extends _s.GenericAwsException {
  UnauthorizedClientException({String type, String message})
      : super(
            type: type, code: 'UnauthorizedClientException', message: message);
}

class UnprocessableEntityException extends _s.GenericAwsException {
  UnprocessableEntityException({String type, String message})
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
