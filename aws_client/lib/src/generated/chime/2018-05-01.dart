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
        Uint8ListConverter,
        Uint8ListListConverter,
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        timeStampFromJson,
        RfcDateTimeConverter,
        IsoDateTimeConverter,
        UnixDateTimeConverter,
        StringJsonConverter,
        Base64JsonConverter;

export '../../shared/shared.dart' show AwsClientCredentials;

part '2018-05-01.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'chime',
          ),
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
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=associate-phone-number',
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
    @_s.required List<String> e164PhoneNumbers,
    @_s.required String voiceConnectorId,
    bool forceAssociate,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required List<String> e164PhoneNumbers,
    @_s.required String voiceConnectorGroupId,
    bool forceAssociate,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
          '/accounts/${Uri.encodeComponent(accountId)}?operation=associate-signin-delegate-groups',
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
  /// Parameter [clientRequestToken] :
  /// The <code>ClientRequestToken</code> of the app instance.
  ///
  /// Parameter [name] :
  /// The name of the app instance.
  ///
  /// Parameter [metadata] :
  /// The metadata of the app instance. Limited to a 1KB string in UTF-8.
  Future<CreateAppInstanceResponse> createAppInstance({
    @_s.required String clientRequestToken,
    @_s.required String name,
    String metadata,
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'Name': name,
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
    @_s.required String appInstanceAdminArn,
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceAdminArn, 'appInstanceAdminArn');
    _s.validateStringLength(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
  /// Parameter [clientRequestToken] :
  /// The token assigned to the user requesting an app instance.
  ///
  /// Parameter [name] :
  /// The user's name.
  ///
  /// Parameter [metadata] :
  /// The request's metadata. Limited to a 1KB string in UTF-8.
  Future<CreateAppInstanceUserResponse> createAppInstanceUser({
    @_s.required String appInstanceArn,
    @_s.required String appInstanceUserId,
    @_s.required String clientRequestToken,
    @_s.required String name,
    String metadata,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'appInstanceUserId',
      appInstanceUserId,
      r'''[A-Za-z0-9][A-Za-z0-9\:\-\_\.\@]{3,50}[A-Za-z0-9]''',
      isRequired: true,
    );
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
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
    );
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'AppInstanceUserId': appInstanceUserId,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'Name': name,
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
  /// Parameter [clientRequestToken] :
  /// The client token for the request. An <code>Idempotency</code> token.
  ///
  /// Parameter [name] :
  /// The name of the channel.
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
    @_s.required String appInstanceArn,
    @_s.required String clientRequestToken,
    @_s.required String name,
    String metadata,
    ChannelMode mode,
    ChannelPrivacy privacy,
    List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      256,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
    );
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'Name': name,
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
    @_s.required String channelArn,
    @_s.required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'memberArn',
      memberArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String memberArn,
    @_s.required ChannelMembershipType type,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'memberArn',
      memberArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(type, 'type');
    final $payload = <String, dynamic>{
      'MemberArn': memberArn,
      'Type': type?.toValue() ?? '',
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
    @_s.required String channelArn,
    @_s.required String channelModeratorArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'channelModeratorArn',
      channelModeratorArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String fromPhoneNumber,
    @_s.required String joinToken,
    @_s.required String meetingId,
    @_s.required String toPhoneNumber,
  }) async {
    ArgumentError.checkNotNull(fromPhoneNumber, 'fromPhoneNumber');
    _s.validateStringPattern(
      'fromPhoneNumber',
      fromPhoneNumber,
      r'''^\+?[1-9]\d{1,14}$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(joinToken, 'joinToken');
    _s.validateStringLength(
      'joinToken',
      joinToken,
      2,
      2048,
      isRequired: true,
    );
    _s.validateStringPattern(
      'joinToken',
      joinToken,
      r'''^[a-zA-Z0-9+/]+$''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(toPhoneNumber, 'toPhoneNumber');
    _s.validateStringPattern(
      'toPhoneNumber',
      toPhoneNumber,
      r'''^\+?[1-9]\d{1,14}$''',
      isRequired: true,
    );
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
  /// Parameter [clientRequestToken] :
  /// The unique identifier for the client request. Use a different token for
  /// different meetings.
  ///
  /// Parameter [attendees] :
  /// The request containing the attendees to create.
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
    @_s.required String clientRequestToken,
    List<CreateAttendeeRequestItem> attendees,
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
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (attendees != null) 'Attendees': attendees,
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
    @_s.required List<String> e164PhoneNumbers,
    @_s.required PhoneNumberProductType productType,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(productType, 'productType');
    final $payload = <String, dynamic>{
      'E164PhoneNumbers': e164PhoneNumbers,
      'ProductType': productType?.toValue() ?? '',
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
    @_s.required List<Capability> capabilities,
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
      'Capabilities': capabilities?.map((e) => e?.toValue() ?? '')?.toList(),
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
    @_s.required String awsRegion,
    @_s.required List<SipMediaApplicationEndpoint> endpoints,
    String name,
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
    @_s.required String sipMediaApplicationId,
    String fromPhoneNumber,
    String toPhoneNumber,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringPattern(
      'fromPhoneNumber',
      fromPhoneNumber,
      r'''^\+?[1-9]\d{1,14}$''',
    );
    _s.validateStringPattern(
      'toPhoneNumber',
      toPhoneNumber,
      r'''^\+?[1-9]\d{1,14}$''',
    );
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
    @_s.required String name,
    @_s.required List<SipRuleTargetApplication> targetApplications,
    @_s.required SipRuleTriggerType triggerType,
    @_s.required String triggerValue,
    bool disabled,
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
    _s.validateStringPattern(
      'triggerValue',
      triggerValue,
      r'''.*\S.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'Name': name,
      'TargetApplications': targetApplications,
      'TriggerType': triggerType?.toValue() ?? '',
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
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteAccountResponse.fromJson(response);
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
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceAdminArn,
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceAdminArn, 'appInstanceAdminArn');
    _s.validateStringLength(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceUserArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'memberArn',
      memberArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'memberArn',
      memberArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String messageId,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''[-_a-zA-Z0-9]*''',
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
    @_s.required String channelArn,
    @_s.required String channelModeratorArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'channelModeratorArn',
      channelModeratorArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String meetingId,
  }) async {
    ArgumentError.checkNotNull(meetingId, 'meetingId');
    _s.validateStringPattern(
      'meetingId',
      meetingId,
      r'''[a-fA-F0-9]{8}(?:-[a-fA-F0-9]{4}){3}-[a-fA-F0-9]{12}''',
      isRequired: true,
    );
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
    @_s.required String phoneNumberId,
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
    @_s.required String sipMediaApplicationId,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String sipRuleId,
  }) async {
    ArgumentError.checkNotNull(sipRuleId, 'sipRuleId');
    _s.validateStringPattern(
      'sipRuleId',
      sipRuleId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required List<String> usernames,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(usernames, 'usernames');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceAdminArn,
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceAdminArn, 'appInstanceAdminArn');
    _s.validateStringLength(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceAdminArn',
      appInstanceAdminArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceUserArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'memberArn',
      memberArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String memberArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'memberArn',
      memberArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceUserArn,
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (appInstanceUserArn != null)
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
    @_s.required String appInstanceUserArn,
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
    final $query = <String, List<String>>{
      if (appInstanceUserArn != null)
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
    @_s.required String channelArn,
    @_s.required String channelModeratorArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'channelModeratorArn',
      channelModeratorArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String accountId,
    @_s.required String userId,
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
  /// Parameter [e164PhoneNumbers] :
  /// List of phone numbers, in E.164 format.
  ///
  /// Parameter [voiceConnectorId] :
  /// The Amazon Chime Voice Connector ID.
  Future<DisassociatePhoneNumbersFromVoiceConnectorResponse>
      disassociatePhoneNumbersFromVoiceConnector({
    @_s.required List<String> e164PhoneNumbers,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required List<String> e164PhoneNumbers,
    @_s.required String voiceConnectorGroupId,
  }) async {
    ArgumentError.checkNotNull(e164PhoneNumbers, 'e164PhoneNumbers');
    ArgumentError.checkNotNull(voiceConnectorGroupId, 'voiceConnectorGroupId');
    _s.validateStringPattern(
      'voiceConnectorGroupId',
      voiceConnectorGroupId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
          '/accounts/${Uri.encodeComponent(accountId)}?operation=disassociate-signin-delegate-groups',
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
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceArn,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String channelArn,
    @_s.required String messageId,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''[-_a-zA-Z0-9]*''',
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
    @_s.required String phoneNumberId,
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
    @_s.required String sipMediaApplicationId,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String sipMediaApplicationId,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String sipRuleId,
  }) async {
    ArgumentError.checkNotNull(sipRuleId, 'sipRuleId');
    _s.validateStringPattern(
      'sipRuleId',
      sipRuleId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String accountId,
    @_s.required String userId,
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
    @_s.required String appInstanceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String appInstanceArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
    );
    final $query = <String, List<String>>{
      if (appInstanceArn != null) 'app-instance-arn': [appInstanceArn],
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
    int maxResults,
    String nextToken,
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String channelArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String channelArn,
    int maxResults,
    String nextToken,
    ChannelMembershipType type,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    String appInstanceUserArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String channelArn,
    int maxResults,
    String nextToken,
    DateTime notAfter,
    DateTime notBefore,
    SortOrder sortOrder,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String channelArn,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    @_s.required String appInstanceArn,
    int maxResults,
    String nextToken,
    ChannelPrivacy privacy,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
    );
    final $query = <String, List<String>>{
      if (appInstanceArn != null) 'app-instance-arn': [appInstanceArn],
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
    String appInstanceUserArn,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''.*''',
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
    String sipMediaApplicationId,
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
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
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
    final $query = <String, List<String>>{
      if (resourceARN != null) 'arn': [resourceARN],
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/users/${Uri.encodeComponent(userId)}?operation=logout',
      exceptionFnMap: _exceptionFns,
    );
    return LogoutUserResponse.fromJson(response);
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
    @_s.required String appInstanceArn,
    @_s.required AppInstanceRetentionSettings appInstanceRetentionSettings,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String appInstanceArn,
    @_s.required
        List<AppInstanceStreamingConfiguration>
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
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required String accountId,
    @_s.required RetentionSettings retentionSettings,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String sipMediaApplicationId,
    SipMediaApplicationLoggingConfiguration
        sipMediaApplicationLoggingConfiguration,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required EmergencyCallingConfiguration emergencyCallingConfiguration,
    @_s.required String voiceConnectorId,
  }) async {
    ArgumentError.checkNotNull(
        emergencyCallingConfiguration, 'emergencyCallingConfiguration');
    ArgumentError.checkNotNull(voiceConnectorId, 'voiceConnectorId');
    _s.validateStringPattern(
      'voiceConnectorId',
      voiceConnectorId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String channelArn,
    @_s.required String messageId,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''[-_a-zA-Z0-9]*''',
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
    @_s.required String accountId,
    @_s.required String conversationId,
    @_s.required String messageId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(conversationId, 'conversationId');
    _s.validateStringPattern(
      'conversationId',
      conversationId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''.*\S.*''',
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/conversations/${Uri.encodeComponent(conversationId)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
      exceptionFnMap: _exceptionFns,
    );
    return RedactConversationMessageResponse.fromJson(response);
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
    @_s.required String accountId,
    @_s.required String messageId,
    @_s.required String roomId,
  }) async {
    ArgumentError.checkNotNull(accountId, 'accountId');
    _s.validateStringPattern(
      'accountId',
      accountId,
      r'''.*\S.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(messageId, 'messageId');
    _s.validateStringPattern(
      'messageId',
      messageId,
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
      method: 'POST',
      requestUri:
          '/accounts/${Uri.encodeComponent(accountId)}/rooms/${Uri.encodeComponent(roomId)}/messages/${Uri.encodeComponent(messageId)}?operation=redact',
      exceptionFnMap: _exceptionFns,
    );
    return RedactRoomMessageResponse.fromJson(response);
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
    @_s.required String phoneNumberId,
  }) async {
    ArgumentError.checkNotNull(phoneNumberId, 'phoneNumberId');
    _s.validateStringPattern(
      'phoneNumberId',
      phoneNumberId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
  /// Parameter [clientRequestToken] :
  /// The <code>Idempotency</code> token for each client request.
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
  /// Parameter [metadata] :
  /// The optional metadata for each message.
  Future<SendChannelMessageResponse> sendChannelMessage({
    @_s.required String channelArn,
    @_s.required String clientRequestToken,
    @_s.required String content,
    @_s.required ChannelMessagePersistenceType persistence,
    @_s.required ChannelMessageType type,
    String metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
      isRequired: true,
    );
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
    ArgumentError.checkNotNull(content, 'content');
    _s.validateStringLength(
      'content',
      content,
      1,
      4096,
      isRequired: true,
    );
    _s.validateStringPattern(
      'content',
      content,
      r'''[\s\S]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(persistence, 'persistence');
    ArgumentError.checkNotNull(type, 'type');
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
    );
    final $payload = <String, dynamic>{
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'Content': content,
      'Persistence': persistence?.toValue() ?? '',
      'Type': type?.toValue() ?? '',
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
      requestUri: '/accounts/${Uri.encodeComponent(accountId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAccountSettingsResponse.fromJson(response);
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
    @_s.required String appInstanceArn,
    @_s.required String name,
    String metadata,
  }) async {
    ArgumentError.checkNotNull(appInstanceArn, 'appInstanceArn');
    _s.validateStringLength(
      'appInstanceArn',
      appInstanceArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceArn',
      appInstanceArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
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
    @_s.required String appInstanceUserArn,
    @_s.required String name,
    String metadata,
  }) async {
    ArgumentError.checkNotNull(appInstanceUserArn, 'appInstanceUserArn');
    _s.validateStringLength(
      'appInstanceUserArn',
      appInstanceUserArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'appInstanceUserArn',
      appInstanceUserArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''.*\S.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
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
    @_s.required String channelArn,
    @_s.required ChannelMode mode,
    @_s.required String name,
    String metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'name',
      name,
      r'''[\u0009\u000A\u000D\u0020-\u007E\u0085\u00A0-\uD7FF\uE000-\uFFFD\u10000-\u10FFFF]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
    );
    final $payload = <String, dynamic>{
      'Mode': mode?.toValue() ?? '',
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
    @_s.required String channelArn,
    @_s.required String messageId,
    String content,
    String metadata,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    _s.validateStringPattern(
      'messageId',
      messageId,
      r'''[-_a-zA-Z0-9]*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'content',
      content,
      0,
      4096,
    );
    _s.validateStringPattern(
      'content',
      content,
      r'''[\s\S]*''',
    );
    _s.validateStringLength(
      'metadata',
      metadata,
      0,
      1024,
    );
    _s.validateStringPattern(
      'metadata',
      metadata,
      r'''.*''',
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
    @_s.required String channelArn,
  }) async {
    ArgumentError.checkNotNull(channelArn, 'channelArn');
    _s.validateStringLength(
      'channelArn',
      channelArn,
      5,
      1600,
      isRequired: true,
    );
    _s.validateStringPattern(
      'channelArn',
      channelArn,
      r'''arn:[a-z0-9-\.]{1,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[a-z0-9-\.]{0,63}:[^/].{0,1023}''',
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
    @_s.required List<Capability> capabilities,
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
      'Capabilities': capabilities?.map((e) => e?.toValue() ?? '')?.toList(),
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
    @_s.required String sipMediaApplicationId,
    List<SipMediaApplicationEndpoint> endpoints,
    String name,
  }) async {
    ArgumentError.checkNotNull(sipMediaApplicationId, 'sipMediaApplicationId');
    _s.validateStringPattern(
      'sipMediaApplicationId',
      sipMediaApplicationId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
    @_s.required String name,
    @_s.required String sipRuleId,
    bool disabled,
    List<SipRuleTargetApplication> targetApplications,
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
    _s.validateStringPattern(
      'sipRuleId',
      sipRuleId,
      r'''.*\S.*''',
      isRequired: true,
    );
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
          '/voice-connector-groups/${Uri.encodeComponent(voiceConnectorGroupId)}',
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The default license for the Amazon Chime account.
  @_s.JsonKey(name: 'DefaultLicense')
  final License defaultLicense;

  /// The sign-in delegate groups associated with the account.
  @_s.JsonKey(name: 'SigninDelegateGroups')
  final List<SigninDelegateGroup> signinDelegateGroups;

  /// Supported licenses for the Amazon Chime account.
  @_s.JsonKey(name: 'SupportedLicenses')
  final List<License> supportedLicenses;

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

/// An instance of a Chime messaging application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstance {
  /// The ARN of the messaging instance.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  /// The time at which an app instance was created. In epoch milliseconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The time an app instance was last updated. In epoch milliseconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The metadata of an app instance.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The name of an app instance.
  @_s.JsonKey(name: 'Name')
  final String name;

  AppInstance({
    this.appInstanceArn,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.name,
  });
  factory AppInstance.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceFromJson(json);
}

/// Promotes a user to the administrator role for the duration of an app
/// instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstanceAdmin {
  /// The name and metadata of the app instance administrator.
  @_s.JsonKey(name: 'Admin')
  final Identity admin;

  /// The ARN of the app instance administrator.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  /// The time at which an administrator was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  AppInstanceAdmin({
    this.admin,
    this.appInstanceArn,
    this.createdTimestamp,
  });
  factory AppInstanceAdmin.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceAdminFromJson(json);
}

/// The identity and metadata of an administrator.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstanceAdminSummary {
  /// The name and metadata of the app instance administrator.
  @_s.JsonKey(name: 'Admin')
  final Identity admin;

  AppInstanceAdminSummary({
    this.admin,
  });
  factory AppInstanceAdminSummary.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceAdminSummaryFromJson(json);
}

enum AppInstanceDataType {
  @_s.JsonValue('Channel')
  channel,
  @_s.JsonValue('ChannelMessage')
  channelMessage,
}

/// The length of time in days to retain messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AppInstanceRetentionSettings {
  /// The length of time in days to retain a channel.
  @_s.JsonKey(name: 'ChannelRetentionSettings')
  final ChannelRetentionSettings channelRetentionSettings;

  AppInstanceRetentionSettings({
    this.channelRetentionSettings,
  });
  factory AppInstanceRetentionSettings.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceRetentionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$AppInstanceRetentionSettingsToJson(this);
}

/// The streaming configuration of an app instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AppInstanceStreamingConfiguration {
  /// The data type of the app instance.
  @_s.JsonKey(name: 'AppInstanceDataType')
  final AppInstanceDataType appInstanceDataType;

  /// The resource ARN.
  @_s.JsonKey(name: 'ResourceArn')
  final String resourceArn;

  AppInstanceStreamingConfiguration({
    @_s.required this.appInstanceDataType,
    @_s.required this.resourceArn,
  });
  factory AppInstanceStreamingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$AppInstanceStreamingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$AppInstanceStreamingConfigurationToJson(this);
}

/// The summary data for an app instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstanceSummary {
  /// The app instance ARN.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  /// The metadata of the app instance summary.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The name of the app instance summary.
  @_s.JsonKey(name: 'Name')
  final String name;

  AppInstanceSummary({
    this.appInstanceArn,
    this.metadata,
    this.name,
  });
  factory AppInstanceSummary.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceSummaryFromJson(json);
}

/// The app instance user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstanceUser {
  /// The ARN of the app instance user.
  @_s.JsonKey(name: 'AppInstanceUserArn')
  final String appInstanceUserArn;

  /// The time at which the app instance user was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The time at which the app instance user was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The metadata of the app instance user.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The name of the app instance user.
  @_s.JsonKey(name: 'Name')
  final String name;

  AppInstanceUser({
    this.appInstanceUserArn,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.name,
  });
  factory AppInstanceUser.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceUserFromJson(json);
}

/// Lists the channels to which app instance users belong.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstanceUserMembershipSummary {
  /// The time at which a summary was last read.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'ReadMarkerTimestamp')
  final DateTime readMarkerTimestamp;

  /// The type of channel summary,
  @_s.JsonKey(name: 'Type')
  final ChannelMembershipType type;

  AppInstanceUserMembershipSummary({
    this.readMarkerTimestamp,
    this.type,
  });
  factory AppInstanceUserMembershipSummary.fromJson(
          Map<String, dynamic> json) =>
      _$AppInstanceUserMembershipSummaryFromJson(json);
}

/// The app instance user summary data .
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppInstanceUserSummary {
  /// The ARN of the app instance user.
  @_s.JsonKey(name: 'AppInstanceUserArn')
  final String appInstanceUserArn;

  /// The metadata in an app instance user summary.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The name in an app instance user summary.
  @_s.JsonKey(name: 'Name')
  final String name;

  AppInstanceUserSummary({
    this.appInstanceUserArn,
    this.metadata,
    this.name,
  });
  factory AppInstanceUserSummary.fromJson(Map<String, dynamic> json) =>
      _$AppInstanceUserSummaryFromJson(json);
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

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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

extension on Capability {
  String toValue() {
    switch (this) {
      case Capability.voice:
        return 'Voice';
      case Capability.sms:
        return 'SMS';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Creates a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Channel {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The administrator who created the channel.
  @_s.JsonKey(name: 'CreatedBy')
  final Identity createdBy;

  /// The time at which the administrator created the channel.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The time at which a member sent the last message in a session.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastMessageTimestamp')
  final DateTime lastMessageTimestamp;

  /// The time at which a channel was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The metadata of the channel.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The mode of the channel.
  @_s.JsonKey(name: 'Mode')
  final ChannelMode mode;

  /// The name of the channel.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The channel's privacy setting, <code>PUBLIC</code> or <code>HIDDEN</code>.
  @_s.JsonKey(name: 'Privacy')
  final ChannelPrivacy privacy;

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
  factory Channel.fromJson(Map<String, dynamic> json) =>
      _$ChannelFromJson(json);
}

/// Bans a user from a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelBan {
  /// The ARN of the channel from which a member is being banned.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The parameter of the action.
  @_s.JsonKey(name: 'CreatedBy')
  final Identity createdBy;

  /// The time at which the ban was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The member being banned from the channel.
  @_s.JsonKey(name: 'Member')
  final Identity member;

  ChannelBan({
    this.channelArn,
    this.createdBy,
    this.createdTimestamp,
    this.member,
  });
  factory ChannelBan.fromJson(Map<String, dynamic> json) =>
      _$ChannelBanFromJson(json);
}

/// The summary data for the channel ban.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelBanSummary {
  /// The member being banned from a channel.
  @_s.JsonKey(name: 'Member')
  final Identity member;

  ChannelBanSummary({
    this.member,
  });
  factory ChannelBanSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelBanSummaryFromJson(json);
}

/// Creates a channel member.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelMembership {
  /// The ARN of the member's channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The time at which the channel membership was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The identifier of the member who invited another member. Taken from the
  /// message header.
  @_s.JsonKey(name: 'InvitedBy')
  final Identity invitedBy;

  /// The time at which a channel membership was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The data of the channel member.
  @_s.JsonKey(name: 'Member')
  final Identity member;

  /// The membership type set for the channel member.
  @_s.JsonKey(name: 'Type')
  final ChannelMembershipType type;

  ChannelMembership({
    this.channelArn,
    this.createdTimestamp,
    this.invitedBy,
    this.lastUpdatedTimestamp,
    this.member,
    this.type,
  });
  factory ChannelMembership.fromJson(Map<String, dynamic> json) =>
      _$ChannelMembershipFromJson(json);
}

/// Returns the channel membership summary data for an app instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelMembershipForAppInstanceUserSummary {
  /// Returns the channel membership data for an app instance.
  @_s.JsonKey(name: 'AppInstanceUserMembershipSummary')
  final AppInstanceUserMembershipSummary appInstanceUserMembershipSummary;
  @_s.JsonKey(name: 'ChannelSummary')
  final ChannelSummary channelSummary;

  ChannelMembershipForAppInstanceUserSummary({
    this.appInstanceUserMembershipSummary,
    this.channelSummary,
  });
  factory ChannelMembershipForAppInstanceUserSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ChannelMembershipForAppInstanceUserSummaryFromJson(json);
}

/// The summary data of a channel membership.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelMembershipSummary {
  /// A member's summary data.
  @_s.JsonKey(name: 'Member')
  final Identity member;

  ChannelMembershipSummary({
    this.member,
  });
  factory ChannelMembershipSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelMembershipSummaryFromJson(json);
}

enum ChannelMembershipType {
  @_s.JsonValue('DEFAULT')
  $default,
  @_s.JsonValue('HIDDEN')
  hidden,
}

extension on ChannelMembershipType {
  String toValue() {
    switch (this) {
      case ChannelMembershipType.$default:
        return 'DEFAULT';
      case ChannelMembershipType.hidden:
        return 'HIDDEN';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Creates a message in a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelMessage {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The message content.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The time at which the message was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The time at which a message was edited.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastEditedTimestamp')
  final DateTime lastEditedTimestamp;

  /// The time at which a message was updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The ID of a message.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  /// The message metadata.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;
  @_s.JsonKey(name: 'Persistence')
  final ChannelMessagePersistenceType persistence;

  /// Hides the content of a message. The message still exists on the back end,
  /// but this action only returns metadata.
  @_s.JsonKey(name: 'Redacted')
  final bool redacted;

  /// The message sender.
  @_s.JsonKey(name: 'Sender')
  final Identity sender;

  /// The message type.
  @_s.JsonKey(name: 'Type')
  final ChannelMessageType type;

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
  factory ChannelMessage.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageFromJson(json);
}

enum ChannelMessagePersistenceType {
  @_s.JsonValue('PERSISTENT')
  persistent,
  @_s.JsonValue('NON_PERSISTENT')
  nonPersistent,
}

extension on ChannelMessagePersistenceType {
  String toValue() {
    switch (this) {
      case ChannelMessagePersistenceType.persistent:
        return 'PERSISTENT';
      case ChannelMessagePersistenceType.nonPersistent:
        return 'NON_PERSISTENT';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// A summary of the messages in a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelMessageSummary {
  /// The content of the message summary.
  @_s.JsonKey(name: 'Content')
  final String content;

  /// The time at which the message summary was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastEditedTimestamp')
  final DateTime lastEditedTimestamp;
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastUpdatedTimestamp')
  final DateTime lastUpdatedTimestamp;

  /// The ID of the message summary.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  /// The metadata of the message summary.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// Redacts the content of a message summary.
  @_s.JsonKey(name: 'Redacted')
  final bool redacted;

  /// The sender of the message summary.
  @_s.JsonKey(name: 'Sender')
  final Identity sender;

  /// The type of message summary.
  @_s.JsonKey(name: 'Type')
  final ChannelMessageType type;

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
  factory ChannelMessageSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelMessageSummaryFromJson(json);
}

enum ChannelMessageType {
  @_s.JsonValue('STANDARD')
  standard,
  @_s.JsonValue('CONTROL')
  control,
}

extension on ChannelMessageType {
  String toValue() {
    switch (this) {
      case ChannelMessageType.standard:
        return 'STANDARD';
      case ChannelMessageType.control:
        return 'CONTROL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum ChannelMode {
  @_s.JsonValue('UNRESTRICTED')
  unrestricted,
  @_s.JsonValue('RESTRICTED')
  restricted,
}

extension on ChannelMode {
  String toValue() {
    switch (this) {
      case ChannelMode.unrestricted:
        return 'UNRESTRICTED';
      case ChannelMode.restricted:
        return 'RESTRICTED';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Returns the summary data for a moderated channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelModeratedByAppInstanceUserSummary {
  @_s.JsonKey(name: 'ChannelSummary')
  final ChannelSummary channelSummary;

  ChannelModeratedByAppInstanceUserSummary({
    this.channelSummary,
  });
  factory ChannelModeratedByAppInstanceUserSummary.fromJson(
          Map<String, dynamic> json) =>
      _$ChannelModeratedByAppInstanceUserSummaryFromJson(json);
}

/// Creates a moderator on a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelModerator {
  /// The ARN of the moderator's channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The member who created the moderator.
  @_s.JsonKey(name: 'CreatedBy')
  final Identity createdBy;

  /// The time at which the moderator was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The moderator's data.
  @_s.JsonKey(name: 'Moderator')
  final Identity moderator;

  ChannelModerator({
    this.channelArn,
    this.createdBy,
    this.createdTimestamp,
    this.moderator,
  });
  factory ChannelModerator.fromJson(Map<String, dynamic> json) =>
      _$ChannelModeratorFromJson(json);
}

/// Summary data of the moderators in a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelModeratorSummary {
  /// The data for a moderator.
  @_s.JsonKey(name: 'Moderator')
  final Identity moderator;

  ChannelModeratorSummary({
    this.moderator,
  });
  factory ChannelModeratorSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelModeratorSummaryFromJson(json);
}

enum ChannelPrivacy {
  @_s.JsonValue('PUBLIC')
  public,
  @_s.JsonValue('PRIVATE')
  private,
}

extension on ChannelPrivacy {
  String toValue() {
    switch (this) {
      case ChannelPrivacy.public:
        return 'PUBLIC';
      case ChannelPrivacy.private:
        return 'PRIVATE';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// The retention settings for a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ChannelRetentionSettings {
  /// The time in days to retain a channel.
  @_s.JsonKey(name: 'RetentionDays')
  final int retentionDays;

  ChannelRetentionSettings({
    this.retentionDays,
  });
  factory ChannelRetentionSettings.fromJson(Map<String, dynamic> json) =>
      _$ChannelRetentionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ChannelRetentionSettingsToJson(this);
}

/// The summary data for a channel.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ChannelSummary {
  /// The ARN of the channel summary.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The time at which the last message in a channel was sent.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'LastMessageTimestamp')
  final DateTime lastMessageTimestamp;

  /// The metadata of the channel summary.
  @_s.JsonKey(name: 'Metadata')
  final String metadata;

  /// The summary mode of the channel.
  @_s.JsonKey(name: 'Mode')
  final ChannelMode mode;

  /// The parameter of the action.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The privacy setting of the channel being summarized, <code>PUBLIC</code> or
  /// <code>HIDDEN</code>.
  @_s.JsonKey(name: 'Privacy')
  final ChannelPrivacy privacy;

  ChannelSummary({
    this.channelArn,
    this.lastMessageTimestamp,
    this.metadata,
    this.mode,
    this.name,
    this.privacy,
  });
  factory ChannelSummary.fromJson(Map<String, dynamic> json) =>
      _$ChannelSummaryFromJson(json);
}

/// The retention settings that determine how long to retain chat conversation
/// messages for an Amazon Chime Enterprise account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ConversationRetentionSettings {
  /// The number of days for which to retain chat conversation messages.
  @_s.JsonKey(name: 'RetentionDays')
  final int retentionDays;

  ConversationRetentionSettings({
    this.retentionDays,
  });
  factory ConversationRetentionSettings.fromJson(Map<String, dynamic> json) =>
      _$ConversationRetentionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$ConversationRetentionSettingsToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAccountResponse {
  @_s.JsonKey(name: 'Account')
  final Account account;

  CreateAccountResponse({
    this.account,
  });
  factory CreateAccountResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAccountResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppInstanceAdminResponse {
  /// The name and ARN of the admin for the app instance.
  @_s.JsonKey(name: 'AppInstanceAdmin')
  final Identity appInstanceAdmin;

  /// The ARN of the of the admin for the app instance.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  CreateAppInstanceAdminResponse({
    this.appInstanceAdmin,
    this.appInstanceArn,
  });
  factory CreateAppInstanceAdminResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppInstanceAdminResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppInstanceResponse {
  /// The Amazon Resource Number (ARN) of the app instance.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  CreateAppInstanceResponse({
    this.appInstanceArn,
  });
  factory CreateAppInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppInstanceUserResponse {
  /// The user's ARN.
  @_s.JsonKey(name: 'AppInstanceUserArn')
  final String appInstanceUserArn;

  CreateAppInstanceUserResponse({
    this.appInstanceUserArn,
  });
  factory CreateAppInstanceUserResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppInstanceUserResponseFromJson(json);
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

  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
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
  /// The Amazon Chime SDK external user ID. An idempotency token. Links the
  /// attendee to an identity managed by a builder application. If you create an
  /// attendee with the same external user id, the service returns the existing
  /// record.
  ///
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
class CreateChannelBanResponse {
  /// The ARN of the response to the ban request.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The <code>ChannelArn</code> and <code>BannedIdentity</code> of the member in
  /// the ban response.
  @_s.JsonKey(name: 'Member')
  final Identity member;

  CreateChannelBanResponse({
    this.channelArn,
    this.member,
  });
  factory CreateChannelBanResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelBanResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelMembershipResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The ARN and metadata of the member being added.
  @_s.JsonKey(name: 'Member')
  final Identity member;

  CreateChannelMembershipResponse({
    this.channelArn,
    this.member,
  });
  factory CreateChannelMembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelMembershipResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelModeratorResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The ARNs of the channel and the moderator.
  @_s.JsonKey(name: 'ChannelModerator')
  final Identity channelModerator;

  CreateChannelModeratorResponse({
    this.channelArn,
    this.channelModerator,
  });
  factory CreateChannelModeratorResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelModeratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateChannelResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  CreateChannelResponse({
    this.channelArn,
  });
  factory CreateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateChannelResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateMeetingDialOutResponse {
  /// Unique ID that tracks API calls.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  CreateMeetingDialOutResponse({
    this.transactionId,
  });
  factory CreateMeetingDialOutResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateMeetingDialOutResponseFromJson(json);
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
class CreateMeetingWithAttendeesResponse {
  /// The attendee information, including attendees IDs and join tokens.
  @_s.JsonKey(name: 'Attendees')
  final List<Attendee> attendees;

  /// If the action fails for one or more of the attendees in the request, a list
  /// of the attendees is returned, along with error codes and error messages.
  @_s.JsonKey(name: 'Errors')
  final List<CreateAttendeeError> errors;
  @_s.JsonKey(name: 'Meeting')
  final Meeting meeting;

  CreateMeetingWithAttendeesResponse({
    this.attendees,
    this.errors,
    this.meeting,
  });
  factory CreateMeetingWithAttendeesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateMeetingWithAttendeesResponseFromJson(json);
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
class CreateSipMediaApplicationCallResponse {
  /// The actual call.
  @_s.JsonKey(name: 'SipMediaApplicationCall')
  final SipMediaApplicationCall sipMediaApplicationCall;

  CreateSipMediaApplicationCallResponse({
    this.sipMediaApplicationCall,
  });
  factory CreateSipMediaApplicationCallResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSipMediaApplicationCallResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSipMediaApplicationResponse {
  /// The Sip media application details.
  @_s.JsonKey(name: 'SipMediaApplication')
  final SipMediaApplication sipMediaApplication;

  CreateSipMediaApplicationResponse({
    this.sipMediaApplication,
  });
  factory CreateSipMediaApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateSipMediaApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSipRuleResponse {
  /// Returns the SIP rule information, including the rule ID, triggers, and
  /// target applications.
  @_s.JsonKey(name: 'SipRule')
  final SipRule sipRule;

  CreateSipRuleResponse({
    this.sipRule,
  });
  factory CreateSipRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSipRuleResponseFromJson(json);
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

/// The Dialed Number Identification Service (DNIS) emergency calling
/// configuration details associated with an Amazon Chime Voice Connector's
/// emergency calling configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DNISEmergencyCallingConfiguration {
  /// The country from which emergency calls are allowed, in ISO 3166-1 alpha-2
  /// format.
  @_s.JsonKey(name: 'CallingCountry')
  final String callingCountry;

  /// The DNIS phone number to route emergency calls to, in E.164 format.
  @_s.JsonKey(name: 'EmergencyPhoneNumber')
  final String emergencyPhoneNumber;

  /// The DNIS phone number to route test emergency calls to, in E.164 format.
  @_s.JsonKey(name: 'TestPhoneNumber')
  final String testPhoneNumber;

  DNISEmergencyCallingConfiguration({
    @_s.required this.callingCountry,
    @_s.required this.emergencyPhoneNumber,
    this.testPhoneNumber,
  });
  factory DNISEmergencyCallingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$DNISEmergencyCallingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$DNISEmergencyCallingConfigurationToJson(this);
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
class DescribeAppInstanceAdminResponse {
  /// The ARN and name of the app instance user, the ARN of the app instance, and
  /// the created and last-updated timestamps. All timestamps use epoch
  /// milliseconds.
  @_s.JsonKey(name: 'AppInstanceAdmin')
  final AppInstanceAdmin appInstanceAdmin;

  DescribeAppInstanceAdminResponse({
    this.appInstanceAdmin,
  });
  factory DescribeAppInstanceAdminResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeAppInstanceAdminResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAppInstanceResponse {
  /// The ARN, metadata, created and last-updated timestamps, and the name of the
  /// app instance. All timestamps use epoch milliseconds.
  @_s.JsonKey(name: 'AppInstance')
  final AppInstance appInstance;

  DescribeAppInstanceResponse({
    this.appInstance,
  });
  factory DescribeAppInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAppInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeAppInstanceUserResponse {
  /// The name of the app instance user.
  @_s.JsonKey(name: 'AppInstanceUser')
  final AppInstanceUser appInstanceUser;

  DescribeAppInstanceUserResponse({
    this.appInstanceUser,
  });
  factory DescribeAppInstanceUserResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeAppInstanceUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelBanResponse {
  /// The the details of the ban.
  @_s.JsonKey(name: 'ChannelBan')
  final ChannelBan channelBan;

  DescribeChannelBanResponse({
    this.channelBan,
  });
  factory DescribeChannelBanResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeChannelBanResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelMembershipForAppInstanceUserResponse {
  /// The channel to which a user belongs.
  @_s.JsonKey(name: 'ChannelMembership')
  final ChannelMembershipForAppInstanceUserSummary channelMembership;

  DescribeChannelMembershipForAppInstanceUserResponse({
    this.channelMembership,
  });
  factory DescribeChannelMembershipForAppInstanceUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeChannelMembershipForAppInstanceUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelMembershipResponse {
  /// The details of the membership.
  @_s.JsonKey(name: 'ChannelMembership')
  final ChannelMembership channelMembership;

  DescribeChannelMembershipResponse({
    this.channelMembership,
  });
  factory DescribeChannelMembershipResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeChannelMembershipResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelModeratedByAppInstanceUserResponse {
  /// The moderated channel.
  @_s.JsonKey(name: 'Channel')
  final ChannelModeratedByAppInstanceUserSummary channel;

  DescribeChannelModeratedByAppInstanceUserResponse({
    this.channel,
  });
  factory DescribeChannelModeratedByAppInstanceUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeChannelModeratedByAppInstanceUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelModeratorResponse {
  /// The details of the channel moderator.
  @_s.JsonKey(name: 'ChannelModerator')
  final ChannelModerator channelModerator;

  DescribeChannelModeratorResponse({
    this.channelModerator,
  });
  factory DescribeChannelModeratorResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeChannelModeratorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeChannelResponse {
  /// The channel details.
  @_s.JsonKey(name: 'Channel')
  final Channel channel;

  DescribeChannelResponse({
    this.channel,
  });
  factory DescribeChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeChannelResponseFromJson(json);
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

/// The emergency calling configuration details associated with an Amazon Chime
/// Voice Connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class EmergencyCallingConfiguration {
  /// The Dialed Number Identification Service (DNIS) emergency calling
  /// configuration details.
  @_s.JsonKey(name: 'DNIS')
  final List<DNISEmergencyCallingConfiguration> dnis;

  EmergencyCallingConfiguration({
    this.dnis,
  });
  factory EmergencyCallingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$EmergencyCallingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$EmergencyCallingConfigurationToJson(this);
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
  @_s.JsonValue('Throttling')
  throttling,
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
class GetAppInstanceRetentionSettingsResponse {
  /// The retention settings for the app instance.
  @_s.JsonKey(name: 'AppInstanceRetentionSettings')
  final AppInstanceRetentionSettings appInstanceRetentionSettings;

  /// The timestamp representing the time at which the specified items are
  /// retained, in Epoch Seconds.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'InitiateDeletionTimestamp')
  final DateTime initiateDeletionTimestamp;

  GetAppInstanceRetentionSettingsResponse({
    this.appInstanceRetentionSettings,
    this.initiateDeletionTimestamp,
  });
  factory GetAppInstanceRetentionSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAppInstanceRetentionSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppInstanceStreamingConfigurationsResponse {
  /// The streaming settings.
  @_s.JsonKey(name: 'AppInstanceStreamingConfigurations')
  final List<AppInstanceStreamingConfiguration>
      appInstanceStreamingConfigurations;

  GetAppInstanceStreamingConfigurationsResponse({
    this.appInstanceStreamingConfigurations,
  });
  factory GetAppInstanceStreamingConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAppInstanceStreamingConfigurationsResponseFromJson(json);
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
class GetChannelMessageResponse {
  /// The details of and content in the message.
  @_s.JsonKey(name: 'ChannelMessage')
  final ChannelMessage channelMessage;

  GetChannelMessageResponse({
    this.channelMessage,
  });
  factory GetChannelMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$GetChannelMessageResponseFromJson(json);
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
class GetMessagingSessionEndpointResponse {
  /// The endpoint returned in the response.
  @_s.JsonKey(name: 'Endpoint')
  final MessagingSessionEndpoint endpoint;

  GetMessagingSessionEndpointResponse({
    this.endpoint,
  });
  factory GetMessagingSessionEndpointResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetMessagingSessionEndpointResponseFromJson(json);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CallingNameUpdatedTimestamp')
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
class GetRetentionSettingsResponse {
  /// The timestamp representing the time at which the specified items are
  /// permanently deleted, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'InitiateDeletionTimestamp')
  final DateTime initiateDeletionTimestamp;

  /// The retention settings.
  @_s.JsonKey(name: 'RetentionSettings')
  final RetentionSettings retentionSettings;

  GetRetentionSettingsResponse({
    this.initiateDeletionTimestamp,
    this.retentionSettings,
  });
  factory GetRetentionSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetRetentionSettingsResponseFromJson(json);
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
class GetSipMediaApplicationLoggingConfigurationResponse {
  /// The actual logging configuration.
  @_s.JsonKey(name: 'SipMediaApplicationLoggingConfiguration')
  final SipMediaApplicationLoggingConfiguration
      sipMediaApplicationLoggingConfiguration;

  GetSipMediaApplicationLoggingConfigurationResponse({
    this.sipMediaApplicationLoggingConfiguration,
  });
  factory GetSipMediaApplicationLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSipMediaApplicationLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSipMediaApplicationResponse {
  /// The SIP media application details.
  @_s.JsonKey(name: 'SipMediaApplication')
  final SipMediaApplication sipMediaApplication;

  GetSipMediaApplicationResponse({
    this.sipMediaApplication,
  });
  factory GetSipMediaApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSipMediaApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetSipRuleResponse {
  /// The SIP rule details.
  @_s.JsonKey(name: 'SipRule')
  final SipRule sipRule;

  GetSipRuleResponse({
    this.sipRule,
  });
  factory GetSipRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSipRuleResponseFromJson(json);
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
class GetVoiceConnectorEmergencyCallingConfigurationResponse {
  /// The emergency calling configuration details.
  @_s.JsonKey(name: 'EmergencyCallingConfiguration')
  final EmergencyCallingConfiguration emergencyCallingConfiguration;

  GetVoiceConnectorEmergencyCallingConfigurationResponse({
    this.emergencyCallingConfiguration,
  });
  factory GetVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetVoiceConnectorEmergencyCallingConfigurationResponseFromJson(json);
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

/// The ARN and name of a user.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Identity {
  /// The ARN in an Identity.
  @_s.JsonKey(name: 'Arn')
  final String arn;

  /// The name in an Identity.
  @_s.JsonKey(name: 'Name')
  final String name;

  Identity({
    this.arn,
    this.name,
  });
  factory Identity.fromJson(Map<String, dynamic> json) =>
      _$IdentityFromJson(json);
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
  /// The list of accounts.
  @_s.JsonKey(name: 'Accounts')
  final List<Account> accounts;

  /// The account's user token.
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
class ListAppInstanceAdminsResponse {
  /// The information for each administrator.
  @_s.JsonKey(name: 'AppInstanceAdmins')
  final List<AppInstanceAdminSummary> appInstanceAdmins;

  /// The ARN of the app instance.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  /// The token returned from previous API requests until the number of
  /// administrators is reached.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAppInstanceAdminsResponse({
    this.appInstanceAdmins,
    this.appInstanceArn,
    this.nextToken,
  });
  factory ListAppInstanceAdminsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppInstanceAdminsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppInstanceUsersResponse {
  /// The ARN of the app instance.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  /// The information for each of the requested app instance users.
  @_s.JsonKey(name: 'AppInstanceUsers')
  final List<AppInstanceUserSummary> appInstanceUsers;

  /// The token passed by previous API calls until all requested users are
  /// returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAppInstanceUsersResponse({
    this.appInstanceArn,
    this.appInstanceUsers,
    this.nextToken,
  });
  factory ListAppInstanceUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppInstanceUsersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppInstancesResponse {
  /// The information for each app instance.
  @_s.JsonKey(name: 'AppInstances')
  final List<AppInstanceSummary> appInstances;

  /// The token passed by previous API requests until the maximum number of app
  /// instances is reached.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListAppInstancesResponse({
    this.appInstances,
    this.nextToken,
  });
  factory ListAppInstancesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppInstancesResponseFromJson(json);
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
class ListChannelBansResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The information for each requested ban.
  @_s.JsonKey(name: 'ChannelBans')
  final List<ChannelBanSummary> channelBans;

  /// The token passed by previous API calls until all requested bans are
  /// returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelBansResponse({
    this.channelArn,
    this.channelBans,
    this.nextToken,
  });
  factory ListChannelBansResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelBansResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelMembershipsForAppInstanceUserResponse {
  /// The token passed by previous API calls until all requested users are
  /// returned.
  @_s.JsonKey(name: 'ChannelMemberships')
  final List<ChannelMembershipForAppInstanceUserSummary> channelMemberships;

  /// The token passed by previous API calls until all requested users are
  /// returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelMembershipsForAppInstanceUserResponse({
    this.channelMemberships,
    this.nextToken,
  });
  factory ListChannelMembershipsForAppInstanceUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListChannelMembershipsForAppInstanceUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelMembershipsResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The information for the requested channel memberships.
  @_s.JsonKey(name: 'ChannelMemberships')
  final List<ChannelMembershipSummary> channelMemberships;

  /// The token passed by previous API calls until all requested channel
  /// memberships are returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelMembershipsResponse({
    this.channelArn,
    this.channelMemberships,
    this.nextToken,
  });
  factory ListChannelMembershipsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelMembershipsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelMessagesResponse {
  /// The ARN of the channel containing the requested messages.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The information about and content of each requested message.
  @_s.JsonKey(name: 'ChannelMessages')
  final List<ChannelMessageSummary> channelMessages;

  /// The token passed by previous API calls until all requested messages are
  /// returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelMessagesResponse({
    this.channelArn,
    this.channelMessages,
    this.nextToken,
  });
  factory ListChannelMessagesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelMessagesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelModeratorsResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The information about and names of each moderator.
  @_s.JsonKey(name: 'ChannelModerators')
  final List<ChannelModeratorSummary> channelModerators;

  /// The token passed by previous API calls until all requested moderators are
  /// returned.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelModeratorsResponse({
    this.channelArn,
    this.channelModerators,
    this.nextToken,
  });
  factory ListChannelModeratorsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelModeratorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelsModeratedByAppInstanceUserResponse {
  /// The moderated channels in the request.
  @_s.JsonKey(name: 'Channels')
  final List<ChannelModeratedByAppInstanceUserSummary> channels;

  /// The token returned from previous API requests until the number of channels
  /// moderated by the user is reached.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelsModeratedByAppInstanceUserResponse({
    this.channels,
    this.nextToken,
  });
  factory ListChannelsModeratedByAppInstanceUserResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListChannelsModeratedByAppInstanceUserResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListChannelsResponse {
  /// The information about each channel.
  @_s.JsonKey(name: 'Channels')
  final List<ChannelSummary> channels;

  /// The token returned from previous API requests until the number of channels
  /// is reached.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  ListChannelsResponse({
    this.channels,
    this.nextToken,
  });
  factory ListChannelsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListChannelsResponseFromJson(json);
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
class ListSipMediaApplicationsResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of SIP media applications and application details.
  @_s.JsonKey(name: 'SipMediaApplications')
  final List<SipMediaApplication> sipMediaApplications;

  ListSipMediaApplicationsResponse({
    this.nextToken,
    this.sipMediaApplications,
  });
  factory ListSipMediaApplicationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSipMediaApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSipRulesResponse {
  /// The token to use to retrieve the next page of results.
  @_s.JsonKey(name: 'NextToken')
  final String nextToken;

  /// List of SIP rules and rule details.
  @_s.JsonKey(name: 'SipRules')
  final List<SipRule> sipRules;

  ListSipRulesResponse({
    this.nextToken,
    this.sipRules,
  });
  factory ListSipRulesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSipRulesResponseFromJson(json);
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
  /// <code>af-south-1</code>, <code>ap-northeast-1</code>,
  /// <code>ap-northeast-2</code>, <code>ap-south-1</code>,
  /// <code>ap-southeast-1</code>, <code>ap-southeast-2</code>,
  /// <code>ca-central-1</code>, <code>eu-central-1</code>,
  /// <code>eu-north-1</code>, <code>eu-south-1</code>, <code>eu-west-1</code>,
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
/// Chime SDK meeting and attendee events occur. The Amazon Chime SDK supports
/// resource targets located in the US East (N. Virginia) AWS Region
/// (<code>us-east-1</code>).
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

/// The endpoint of a meeting session.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class MessagingSessionEndpoint {
  /// The URL of a meeting session endpoint.
  @_s.JsonKey(name: 'Url')
  final String url;

  MessagingSessionEndpoint({
    this.url,
  });
  factory MessagingSessionEndpoint.fromJson(Map<String, dynamic> json) =>
      _$MessagingSessionEndpointFromJson(json);
}

enum NotificationTarget {
  @_s.JsonValue('EventBridge')
  eventBridge,
  @_s.JsonValue('SNS')
  sns,
  @_s.JsonValue('SQS')
  sqs,
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The deleted phone number timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'DeletionTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'AssociatedTimestamp')
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
  @_s.JsonValue('SipRuleId')
  sipRuleId,
}

extension on PhoneNumberAssociationName {
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
    throw Exception('Unknown enum value: $this');
  }
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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

extension on PhoneNumberStatus {
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
    throw Exception('Unknown enum value: $this');
  }
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
  final List<Capability> capabilities;

  /// The created timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The ended timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'EndedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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

extension on ProxySessionStatus {
  String toValue() {
    switch (this) {
      case ProxySessionStatus.open:
        return 'Open';
      case ProxySessionStatus.inProgress:
        return 'InProgress';
      case ProxySessionStatus.closed:
        return 'Closed';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAppInstanceRetentionSettingsResponse {
  /// The time in days to retain data. Data type: number.
  @_s.JsonKey(name: 'AppInstanceRetentionSettings')
  final AppInstanceRetentionSettings appInstanceRetentionSettings;

  /// The time at which the API deletes data.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'InitiateDeletionTimestamp')
  final DateTime initiateDeletionTimestamp;

  PutAppInstanceRetentionSettingsResponse({
    this.appInstanceRetentionSettings,
    this.initiateDeletionTimestamp,
  });
  factory PutAppInstanceRetentionSettingsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAppInstanceRetentionSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAppInstanceStreamingConfigurationsResponse {
  /// The streaming configurations of an app instance.
  @_s.JsonKey(name: 'AppInstanceStreamingConfigurations')
  final List<AppInstanceStreamingConfiguration>
      appInstanceStreamingConfigurations;

  PutAppInstanceStreamingConfigurationsResponse({
    this.appInstanceStreamingConfigurations,
  });
  factory PutAppInstanceStreamingConfigurationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAppInstanceStreamingConfigurationsResponseFromJson(json);
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
class PutRetentionSettingsResponse {
  /// The timestamp representing the time at which the specified items are
  /// permanently deleted, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'InitiateDeletionTimestamp')
  final DateTime initiateDeletionTimestamp;

  /// The retention settings.
  @_s.JsonKey(name: 'RetentionSettings')
  final RetentionSettings retentionSettings;

  PutRetentionSettingsResponse({
    this.initiateDeletionTimestamp,
    this.retentionSettings,
  });
  factory PutRetentionSettingsResponse.fromJson(Map<String, dynamic> json) =>
      _$PutRetentionSettingsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutSipMediaApplicationLoggingConfigurationResponse {
  /// The actual logging configuration.
  @_s.JsonKey(name: 'SipMediaApplicationLoggingConfiguration')
  final SipMediaApplicationLoggingConfiguration
      sipMediaApplicationLoggingConfiguration;

  PutSipMediaApplicationLoggingConfigurationResponse({
    this.sipMediaApplicationLoggingConfiguration,
  });
  factory PutSipMediaApplicationLoggingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutSipMediaApplicationLoggingConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutVoiceConnectorEmergencyCallingConfigurationResponse {
  /// The emergency calling configuration details.
  @_s.JsonKey(name: 'EmergencyCallingConfiguration')
  final EmergencyCallingConfiguration emergencyCallingConfiguration;

  PutVoiceConnectorEmergencyCallingConfigurationResponse({
    this.emergencyCallingConfiguration,
  });
  factory PutVoiceConnectorEmergencyCallingConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutVoiceConnectorEmergencyCallingConfigurationResponseFromJson(json);
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
class RedactChannelMessageResponse {
  /// The ARN of the channel containing the messages that you want to redact.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The ID of the message being redacted.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  RedactChannelMessageResponse({
    this.channelArn,
    this.messageId,
  });
  factory RedactChannelMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$RedactChannelMessageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RedactConversationMessageResponse {
  RedactConversationMessageResponse();
  factory RedactConversationMessageResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RedactConversationMessageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RedactRoomMessageResponse {
  RedactRoomMessageResponse();
  factory RedactRoomMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$RedactRoomMessageResponseFromJson(json);
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

/// The retention settings for an Amazon Chime Enterprise account that determine
/// how long to retain items such as chat room messages and chat conversation
/// messages.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RetentionSettings {
  /// The chat conversation retention settings.
  @_s.JsonKey(name: 'ConversationRetentionSettings')
  final ConversationRetentionSettings conversationRetentionSettings;

  /// The chat room retention settings.
  @_s.JsonKey(name: 'RoomRetentionSettings')
  final RoomRetentionSettings roomRetentionSettings;

  RetentionSettings({
    this.conversationRetentionSettings,
    this.roomRetentionSettings,
  });
  factory RetentionSettings.fromJson(Map<String, dynamic> json) =>
      _$RetentionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RetentionSettingsToJson(this);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The room name.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The room ID.
  @_s.JsonKey(name: 'RoomId')
  final String roomId;

  /// The room update timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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

/// The retention settings that determine how long to retain chat room messages
/// for an Amazon Chime Enterprise account.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RoomRetentionSettings {
  /// The number of days for which to retain chat room messages.
  @_s.JsonKey(name: 'RetentionDays')
  final int retentionDays;

  RoomRetentionSettings({
    this.retentionDays,
  });
  factory RoomRetentionSettings.fromJson(Map<String, dynamic> json) =>
      _$RoomRetentionSettingsFromJson(json);

  Map<String, dynamic> toJson() => _$RoomRetentionSettingsToJson(this);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SendChannelMessageResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The ID string assigned to each message.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  SendChannelMessageResponse({
    this.channelArn,
    this.messageId,
  });
  factory SendChannelMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SendChannelMessageResponseFromJson(json);
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

/// The SIP media application details, including name and endpoints. An AWS
/// account can have multiple SIP media applications.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SipMediaApplication {
  /// The AWS Region in which the SIP media application is created.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// The SIP media application creation timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// List of endpoints for SIP media application. Currently, only one endpoint
  /// per SIP media application is permitted.
  @_s.JsonKey(name: 'Endpoints')
  final List<SipMediaApplicationEndpoint> endpoints;

  /// The name of the SIP media application.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The SIP media application ID.
  @_s.JsonKey(name: 'SipMediaApplicationId')
  final String sipMediaApplicationId;

  /// The SIP media application updated timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
  final DateTime updatedTimestamp;

  SipMediaApplication({
    this.awsRegion,
    this.createdTimestamp,
    this.endpoints,
    this.name,
    this.sipMediaApplicationId,
    this.updatedTimestamp,
  });
  factory SipMediaApplication.fromJson(Map<String, dynamic> json) =>
      _$SipMediaApplicationFromJson(json);
}

/// A <code>Call</code> instance for a SIP media application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SipMediaApplicationCall {
  /// The transaction ID of a call.
  @_s.JsonKey(name: 'TransactionId')
  final String transactionId;

  SipMediaApplicationCall({
    this.transactionId,
  });
  factory SipMediaApplicationCall.fromJson(Map<String, dynamic> json) =>
      _$SipMediaApplicationCallFromJson(json);
}

/// Endpoints to specify as part of a SIP media application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SipMediaApplicationEndpoint {
  /// Valid Amazon Resource Name (ARN) of the Lambda function of the same AWS
  /// Region where the SIP media application is created.
  @_s.JsonKey(name: 'LambdaArn')
  final String lambdaArn;

  SipMediaApplicationEndpoint({
    this.lambdaArn,
  });
  factory SipMediaApplicationEndpoint.fromJson(Map<String, dynamic> json) =>
      _$SipMediaApplicationEndpointFromJson(json);

  Map<String, dynamic> toJson() => _$SipMediaApplicationEndpointToJson(this);
}

/// Logging configuration of the SIP media application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SipMediaApplicationLoggingConfiguration {
  /// Enables application message logs for the SIP media application.
  @_s.JsonKey(name: 'EnableSipMediaApplicationMessageLogs')
  final bool enableSipMediaApplicationMessageLogs;

  SipMediaApplicationLoggingConfiguration({
    this.enableSipMediaApplicationMessageLogs,
  });
  factory SipMediaApplicationLoggingConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$SipMediaApplicationLoggingConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SipMediaApplicationLoggingConfigurationToJson(this);
}

/// The SIP rule details, including name, triggers, and target applications. An
/// AWS account can have multiple SIP rules.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SipRule {
  /// The SIP rule created timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// Indicates if the SIP rule is enabled or disabled. You must disable a rule
  /// before you can delete it.
  @_s.JsonKey(name: 'Disabled')
  final bool disabled;

  /// The name of the SIP rule.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The SIP rule ID.
  @_s.JsonKey(name: 'SipRuleId')
  final String sipRuleId;

  /// List of SIP media applications with priority and AWS Region. You can only
  /// use one SIP application per AWS Region and priority combination.
  @_s.JsonKey(name: 'TargetApplications')
  final List<SipRuleTargetApplication> targetApplications;

  /// The type of trigger whose value is assigned to the SIP rule in
  /// <code>TriggerValue</code>.
  @_s.JsonKey(name: 'TriggerType')
  final SipRuleTriggerType triggerType;

  /// If <code>TriggerType</code> is <code>RequestUriHostname</code>, then the
  /// value can be the outbound host name of the Amazon Chime Voice Connector. If
  /// <code>TriggerType</code> is <code>ToPhoneNumber</code>, then the value can
  /// be a customer-owned phone number in E164 format. <code>SipRule</code> is
  /// triggered when a SIP rule requests host name or <code>ToPhoneNumber</code>
  /// matches in the incoming SIP request.
  @_s.JsonKey(name: 'TriggerValue')
  final String triggerValue;

  /// The SIP rule updated timestamp, in ISO 8601 format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
  final DateTime updatedTimestamp;

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
  factory SipRule.fromJson(Map<String, dynamic> json) =>
      _$SipRuleFromJson(json);
}

/// Target SIP media application along with other details like priority and AWS
/// Region to be specified in the SIP rule. Only one SIP rule per AWS Region can
/// be provided.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SipRuleTargetApplication {
  /// AWS Region of target application.
  @_s.JsonKey(name: 'AwsRegion')
  final String awsRegion;

  /// Priority of the SIP media application in the target list.
  @_s.JsonKey(name: 'Priority')
  final int priority;

  /// The SIP media application ID.
  @_s.JsonKey(name: 'SipMediaApplicationId')
  final String sipMediaApplicationId;

  SipRuleTargetApplication({
    this.awsRegion,
    this.priority,
    this.sipMediaApplicationId,
  });
  factory SipRuleTargetApplication.fromJson(Map<String, dynamic> json) =>
      _$SipRuleTargetApplicationFromJson(json);

  Map<String, dynamic> toJson() => _$SipRuleTargetApplicationToJson(this);
}

enum SipRuleTriggerType {
  @_s.JsonValue('ToPhoneNumber')
  toPhoneNumber,
  @_s.JsonValue('RequestUriHostname')
  requestUriHostname,
}

extension on SipRuleTriggerType {
  String toValue() {
    switch (this) {
      case SipRuleTriggerType.toPhoneNumber:
        return 'ToPhoneNumber';
      case SipRuleTriggerType.requestUriHostname:
        return 'RequestUriHostname';
    }
    throw Exception('Unknown enum value: $this');
  }
}

enum SortOrder {
  @_s.JsonValue('ASCENDING')
  ascending,
  @_s.JsonValue('DESCENDING')
  descending,
}

extension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
    throw Exception('Unknown enum value: $this');
  }
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

  /// The streaming notification targets.
  @_s.JsonKey(name: 'StreamingNotificationTargets')
  final List<StreamingNotificationTarget> streamingNotificationTargets;

  StreamingConfiguration({
    @_s.required this.dataRetentionInHours,
    this.disabled,
    this.streamingNotificationTargets,
  });
  factory StreamingConfiguration.fromJson(Map<String, dynamic> json) =>
      _$StreamingConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingConfigurationToJson(this);
}

/// The targeted recipient for a streaming configuration notification.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class StreamingNotificationTarget {
  /// The streaming notification target.
  @_s.JsonKey(name: 'NotificationTarget')
  final NotificationTarget notificationTarget;

  StreamingNotificationTarget({
    @_s.required this.notificationTarget,
  });
  factory StreamingNotificationTarget.fromJson(Map<String, dynamic> json) =>
      _$StreamingNotificationTargetFromJson(json);

  Map<String, dynamic> toJson() => _$StreamingNotificationTargetToJson(this);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'Timestamp')
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
class UpdateAppInstanceResponse {
  /// The ARN of the app instance.
  @_s.JsonKey(name: 'AppInstanceArn')
  final String appInstanceArn;

  UpdateAppInstanceResponse({
    this.appInstanceArn,
  });
  factory UpdateAppInstanceResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppInstanceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAppInstanceUserResponse {
  /// The ARN of the app instance user.
  @_s.JsonKey(name: 'AppInstanceUserArn')
  final String appInstanceUserArn;

  UpdateAppInstanceUserResponse({
    this.appInstanceUserArn,
  });
  factory UpdateAppInstanceUserResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppInstanceUserResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelMessageResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  /// The ID string of the message being updated.
  @_s.JsonKey(name: 'MessageId')
  final String messageId;

  UpdateChannelMessageResponse({
    this.channelArn,
    this.messageId,
  });
  factory UpdateChannelMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelMessageResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelReadMarkerResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  UpdateChannelReadMarkerResponse({
    this.channelArn,
  });
  factory UpdateChannelReadMarkerResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelReadMarkerResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateChannelResponse {
  /// The ARN of the channel.
  @_s.JsonKey(name: 'ChannelArn')
  final String channelArn;

  UpdateChannelResponse({
    this.channelArn,
  });
  factory UpdateChannelResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateChannelResponseFromJson(json);
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSipMediaApplicationResponse {
  /// The updated SIP media application details.
  @_s.JsonKey(name: 'SipMediaApplication')
  final SipMediaApplication sipMediaApplication;

  UpdateSipMediaApplicationResponse({
    this.sipMediaApplication,
  });
  factory UpdateSipMediaApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$UpdateSipMediaApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSipRuleResponse {
  /// Updated SIP rule details.
  @_s.JsonKey(name: 'SipRule')
  final SipRule sipRule;

  UpdateSipRuleResponse({
    this.sipRule,
  });
  factory UpdateSipRuleResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateSipRuleResponseFromJson(json);
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'InvitedOn')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'RegisteredOn')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'CreatedTimestamp')
  final DateTime createdTimestamp;

  /// The name of the Amazon Chime Voice Connector group.
  @_s.JsonKey(name: 'Name')
  final String name;

  /// The updated Amazon Chime Voice Connector group timestamp, in ISO 8601
  /// format.
  @IsoDateTimeConverter()
  @_s.JsonKey(name: 'UpdatedTimestamp')
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
