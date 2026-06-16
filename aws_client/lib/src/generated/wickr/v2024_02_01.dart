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

/// Welcome to the <i>Amazon Web Services Wickr API Reference</i>.
///
/// The Amazon Web Services Wickr application programming interface (API) is
/// designed for administrators to perform key tasks, such as creating and
/// managing Amazon Web Services Wickr, networks, users, security groups, bots
/// and more. This guide provides detailed information about the Amazon Web
/// Services Wickr API, including operations, types, inputs and outputs, and
/// error codes. You can use an Amazon Web Services SDK, the Amazon Web Services
/// Command Line Interface (Amazon Web Services CLI, or the REST API to make API
/// calls for Amazon Web Services Wickr.
///
/// <i>Using Amazon Web Services SDK</i>
///
/// The SDK clients authenticate your requests by using access keys that you
/// provide. For more information, see <a
/// href="https://docs.aws.amazon.com/sdkref/latest/guide/access.html">Authentication
/// and access using Amazon Web Services SDKs and tools</a> in the <i>Amazon Web
/// Services SDKs and Tools Reference Guide</i>.
///
/// <i>Using Amazon Web Services CLI</i>
///
/// Use your access keys with the Amazon Web Services CLI to make API calls. For
/// more information about setting up the Amazon Web Services CLI, see <a
/// href="https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html">Getting
/// started with the Amazon Web Services CLI</a> in the <i>Amazon Web Services
/// Command Line Interface User Guide for Version 2</i>.
///
/// <i>Using REST APIs</i>
///
/// If you use REST to make API calls, you must authenticate your request by
/// providing a signature. Amazon Web Services Wickr supports Signature Version
/// 4. For more information, see <a
/// href="https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_sigv.html">Amazon
/// Web Services Signature Version 4 for API requests</a> in the <i>Amazon Web
/// Services Identity and Access Management User Guide</i>.
///
/// Access and permissions to the APIs can be controlled by Amazon Web Services
/// Identity and Access Management. The managed policy <a
/// href="https://docs.aws.amazon.com/wickr/latest/adminguide/security-iam-awsmanpol.html#security-iam-awsmanpol-AWSWickrFullAccess">Amazon
/// Web ServicesWickrFullAccess</a> grants full administrative permission to the
/// Amazon Web Services Wickr service APIs. For more information on restricting
/// access to specific operations, see <a
/// href="https://docs.aws.amazon.com/wickr/latest/adminguide/security-iam.html">Identity
/// and access management for Amazon Web Services Wickr </a> in the <i>Amazon
/// Web Services Wickr Administration Guide</i>.
///
/// <i>Types of Errors</i>:
///
/// The Amazon Web Services Wickr APIs provide an HTTP interface. HTTP defines
/// ranges of HTTP Status Codes for different types of error responses.
/// <ol>
/// <li>
/// Client errors are indicated by HTTP Status Code class of 4xx
/// </li>
/// <li>
/// Service errors are indicated by HTTP Status Code class of 5xx
/// </li> </ol>
/// In this reference guide, the documentation for each API has an Errors
/// section that includes a brief discussion about HTTP status codes. We
/// recommend looking there as part of your investigation when you get an error.
///
/// <i>Regional availability</i>
///
/// The Amazon Web Services Wickr API is available in several Amazon Web
/// Services Regions and it provides an endpoint for each of these Regions. For
/// a list of all the Regions and endpoints where the API is currently
/// available, see <a
/// href="https://docs.aws.amazon.com/general/latest/gr/wickr.html">Amazon Web
/// Services Wickr endpoints and quotas</a> in the <i>Amazon Web Services
/// General Reference Guide</i>.
/// <note>
/// Wickr API endpoints are region-specific and include a region code in the
/// format: <code>https://admin.wickr.[regioncode].amazonaws.com</code>. For
/// example, for the US East (N.Virginia) <code>us-east-1</code>, the API
/// endpoint is <code>https://admin.wickr.us-east-1.amazonaws.com</code>.
/// </note>
class Wickr {
  final _s.RestJsonProtocol _protocol;
  Wickr({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'admin.wickr',
            signingName: 'wickr',
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

  /// Creates multiple users in a specified Wickr network. This operation allows
  /// you to provision multiple user accounts simultaneously, optionally
  /// specifying security groups, and validation requirements for each user.
  /// <note>
  /// <code>codeValidation</code>, <code>inviteCode</code>, and
  /// <code>inviteCodeTtl</code> are restricted to networks under preview only.
  /// </note>
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where users will be created.
  ///
  /// Parameter [users] :
  /// A list of user objects containing the details for each user to be created,
  /// including username, name, security groups, and optional invite codes.
  /// Maximum 50 users per batch request.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency. If you retry a
  /// request with the same client token, the service will return the same
  /// response without creating duplicate users.
  Future<BatchCreateUserResponse> batchCreateUser({
    required String networkId,
    required List<BatchCreateUserRequestItem> users,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'users': users,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/users',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchCreateUserResponse.fromJson(response);
  }

  /// Deletes multiple users from a specified Wickr network. This operation
  /// permanently removes user accounts and their associated data from the
  /// network.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which users will be deleted.
  ///
  /// Parameter [userIds] :
  /// A list of user IDs identifying the users to be deleted from the network.
  /// Maximum 50 users per batch request.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency. If you retry a
  /// request with the same client token, the service will return the same
  /// response without attempting to delete users again.
  Future<BatchDeleteUserResponse> batchDeleteUser({
    required String networkId,
    required List<String> userIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'userIds': userIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/users/batch-delete',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteUserResponse.fromJson(response);
  }

  /// Looks up multiple user usernames from their unique username hashes
  /// (unames). This operation allows you to retrieve the email addresses
  /// associated with a list of username hashes.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where the users will be looked up.
  ///
  /// Parameter [unames] :
  /// A list of username hashes (unames) to look up. Each uname is a unique
  /// identifier for a user's username. Maximum 50 unames per batch request.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  Future<BatchLookupUserUnameResponse> batchLookupUserUname({
    required String networkId,
    required List<String> unames,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'unames': unames,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/users/uname-lookup',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchLookupUserUnameResponse.fromJson(response);
  }

  /// Resends invitation codes to multiple users who have pending invitations in
  /// a Wickr network. This operation is useful when users haven't accepted
  /// their initial invitations or when invitations have expired.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where users will be reinvited.
  ///
  /// Parameter [userIds] :
  /// A list of user IDs identifying the users to be reinvited to the network.
  /// Maximum 50 users per batch request.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  Future<BatchReinviteUserResponse> batchReinviteUser({
    required String networkId,
    required List<String> userIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'userIds': userIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/users/re-invite',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchReinviteUserResponse.fromJson(response);
  }

  /// Resets multiple devices for a specific user in a Wickr network. This
  /// operation forces the selected devices to log out and requires users to
  /// re-authenticate, which is useful for security purposes or when devices
  /// need to be revoked.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [appIds] :
  /// A list of application IDs identifying the specific devices to be reset for
  /// the user. Maximum 50 devices per batch request.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the user whose devices will be
  /// reset.
  ///
  /// Parameter [userId] :
  /// The ID of the user whose devices will be reset.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  Future<BatchResetDevicesForUserResponse> batchResetDevicesForUser({
    required List<String> appIds,
    required String networkId,
    required String userId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'appIds': appIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/users/${Uri.encodeComponent(userId)}/devices',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchResetDevicesForUserResponse.fromJson(response);
  }

  /// Suspends or unsuspends multiple users in a Wickr network. Suspended users
  /// cannot access the network until they are unsuspended. This operation is
  /// useful for temporarily restricting access without deleting user accounts.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where users will be suspended or unsuspended.
  ///
  /// Parameter [suspend] :
  /// A boolean value indicating whether to suspend (true) or unsuspend (false)
  /// the specified users.
  ///
  /// Parameter [userIds] :
  /// A list of user IDs identifying the users whose suspend status will be
  /// toggled. Maximum 50 users per batch request.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  Future<BatchToggleUserSuspendStatusResponse> batchToggleUserSuspendStatus({
    required String networkId,
    required bool suspend,
    required List<String> userIds,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $query = <String, List<String>>{
      'suspend': [suspend.toString()],
    };
    final $payload = <String, dynamic>{
      'userIds': userIds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/users/toggleSuspend',
      queryParams: $query,
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return BatchToggleUserSuspendStatusResponse.fromJson(response);
  }

  /// Creates a new bot in a specified Wickr network. Bots are automated
  /// accounts that can send and receive messages, enabling integration with
  /// external systems and automation of tasks.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [challenge] :
  /// The password for the bot account.
  ///
  /// Parameter [groupId] :
  /// The ID of the security group to which the bot will be assigned.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where the bot will be created.
  ///
  /// Parameter [username] :
  /// The username for the bot. This must be unique within the network and
  /// follow the network's naming conventions.
  ///
  /// Parameter [displayName] :
  /// The display name for the bot that will be visible to users in the network.
  Future<CreateBotResponse> createBot({
    required String challenge,
    required String groupId,
    required String networkId,
    required String username,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      'challenge': challenge,
      'groupId': groupId,
      'username': username,
      if (displayName != null) 'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/bots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateBotResponse.fromJson(response);
  }

  /// Creates a data retention bot in a Wickr network. Data retention bots are
  /// specialized bots that handle message archiving and compliance by capturing
  /// and storing messages for regulatory or organizational requirements.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where the data retention bot will be created.
  Future<CreateDataRetentionBotResponse> createDataRetentionBot({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/data-retention-bots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataRetentionBotResponse.fromJson(response);
  }

  /// Creates a new challenge password for the data retention bot. This password
  /// is used for authentication when the bot connects to the network.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the data retention bot.
  Future<CreateDataRetentionBotChallengeResponse>
      createDataRetentionBotChallenge({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/data-retention-bots/challenge',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataRetentionBotChallengeResponse.fromJson(response);
  }

  /// Creates a new Wickr network with specified access level and configuration.
  /// This operation provisions a new communication network for your
  /// organization.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [accessLevel] :
  /// The access level for the network. Valid values are STANDARD or PREMIUM,
  /// which determine the features and capabilities available to network
  /// members.
  ///
  /// Parameter [networkName] :
  /// The name for the new network. Must be between 1 and 20 characters.
  ///
  /// Parameter [enablePremiumFreeTrial] :
  /// Specifies whether to enable a premium free trial for the network. It is
  /// optional and has a default value as false. When set to true, the network
  /// starts with premium features for a limited trial period.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The ARN of the Amazon Web Services KMS customer managed key to use for
  /// encrypting sensitive data in the network.
  Future<CreateNetworkResponse> createNetwork({
    required AccessLevel accessLevel,
    required String networkName,
    bool? enablePremiumFreeTrial,
    String? encryptionKeyArn,
  }) async {
    final $payload = <String, dynamic>{
      'accessLevel': accessLevel.value,
      'networkName': networkName,
      if (enablePremiumFreeTrial != null)
        'enablePremiumFreeTrial': enablePremiumFreeTrial,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks',
      exceptionFnMap: _exceptionFns,
    );
    return CreateNetworkResponse.fromJson(response);
  }

  /// Creates a new security group in a Wickr network. Security groups allow you
  /// to organize users and control their permissions, features, and security
  /// settings.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [name] :
  /// The name for the new security group.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where the security group will be created.
  ///
  /// Parameter [securityGroupSettings] :
  /// The configuration settings for the security group, including permissions,
  /// federation settings, and feature controls.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  Future<CreateSecurityGroupResponse> createSecurityGroup({
    required String name,
    required String networkId,
    required SecurityGroupSettingsRequest securityGroupSettings,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'name': name,
      'securityGroupSettings': securityGroupSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/security-groups',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateSecurityGroupResponse.fromJson(response);
  }

  /// Deletes a bot from a specified Wickr network. This operation permanently
  /// removes the bot account and its associated data from the network.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot to be deleted.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which the bot will be deleted.
  Future<DeleteBotResponse> deleteBot({
    required String botId,
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/bots/${Uri.encodeComponent(botId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteBotResponse.fromJson(response);
  }

  /// Deletes the data retention bot from a Wickr network. This operation
  /// permanently removes the bot and all its associated data from the database.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which the data retention bot will be
  /// deleted.
  Future<DeleteDataRetentionBotResponse> deleteDataRetentionBot({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/data-retention-bots',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteDataRetentionBotResponse.fromJson(response);
  }

  /// Deletes a Wickr network and all its associated resources, including users,
  /// bots, security groups, and settings. This operation is permanent and
  /// cannot be undone.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network to delete.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency. If you retry a
  /// request with the same client token, the service will return the same
  /// response without attempting to delete the network again.
  Future<DeleteNetworkResponse> deleteNetwork({
    required String networkId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteNetworkResponse.fromJson(response);
  }

  /// Deletes a security group from a Wickr network. This operation cannot be
  /// performed on the default security group.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [groupId] :
  /// The unique identifier of the security group to delete.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which the security group will be deleted.
  Future<DeleteSecurityGroupResponse> deleteSecurityGroup({
    required String groupId,
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/security-groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteSecurityGroupResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific bot in a Wickr network,
  /// including its status, group membership, and authentication details.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot to retrieve.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the bot.
  Future<GetBotResponse> getBot({
    required String botId,
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/bots/${Uri.encodeComponent(botId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotResponse.fromJson(response);
  }

  /// Retrieves the count of bots in a Wickr network, categorized by their
  /// status (pending, active, and total).
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which to retrieve bot counts.
  Future<GetBotsCountResponse> getBotsCount({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/bots/count',
      exceptionFnMap: _exceptionFns,
    );
    return GetBotsCountResponse.fromJson(response);
  }

  /// Retrieves information about the data retention bot in a Wickr network,
  /// including its status and whether the data retention service is enabled.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the data retention bot.
  Future<GetDataRetentionBotResponse> getDataRetentionBot({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/data-retention-bots',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataRetentionBotResponse.fromJson(response);
  }

  /// Retrieves historical guest user count data for a Wickr network, showing
  /// the number of guest users per billing period over the past 90 days.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which to retrieve guest user history.
  Future<GetGuestUserHistoryCountResponse> getGuestUserHistoryCount({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/guest-users/count',
      exceptionFnMap: _exceptionFns,
    );
    return GetGuestUserHistoryCountResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific Wickr network, including
  /// its configuration, access level, and status.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network to retrieve.
  Future<GetNetworkResponse> getNetwork({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkResponse.fromJson(response);
  }

  /// Retrieves all network-level settings for a Wickr network, including client
  /// metrics, data retention, and other configuration options.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network whose settings will be retrieved.
  Future<GetNetworkSettingsResponse> getNetworkSettings({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return GetNetworkSettingsResponse.fromJson(response);
  }

  /// Retrieves the OpenID Connect (OIDC) configuration for a Wickr network,
  /// including SSO settings and optional token information if access token
  /// parameters are provided.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network whose OIDC configuration will be retrieved.
  ///
  /// Parameter [certificate] :
  /// The CA certificate for secure communication with the OIDC provider
  /// (optional).
  ///
  /// Parameter [clientId] :
  /// The OAuth client ID for retrieving access tokens (optional).
  ///
  /// Parameter [clientSecret] :
  /// The OAuth client secret for retrieving access tokens (optional).
  ///
  /// Parameter [code] :
  /// The authorization code for retrieving access tokens (optional).
  ///
  /// Parameter [codeVerifier] :
  /// The PKCE code verifier for enhanced security in the OAuth flow (optional).
  ///
  /// Parameter [grantType] :
  /// The OAuth grant type for retrieving access tokens (optional).
  ///
  /// Parameter [redirectUri] :
  /// The redirect URI for the OAuth flow (optional).
  ///
  /// Parameter [url] :
  /// The URL for the OIDC provider (optional).
  Future<GetOidcInfoResponse> getOidcInfo({
    required String networkId,
    String? certificate,
    String? clientId,
    String? clientSecret,
    String? code,
    String? codeVerifier,
    String? grantType,
    String? redirectUri,
    String? url,
  }) async {
    final $query = <String, List<String>>{
      if (certificate != null) 'certificate': [certificate],
      if (clientId != null) 'clientId': [clientId],
      if (clientSecret != null) 'clientSecret': [clientSecret],
      if (code != null) 'code': [code],
      if (codeVerifier != null) 'codeVerifier': [codeVerifier],
      if (grantType != null) 'grantType': [grantType],
      if (redirectUri != null) 'redirectUri': [redirectUri],
      if (url != null) 'url': [url],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/oidc',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetOidcInfoResponse.fromJson(response);
  }

  /// Retrieves the OpenTDF integration configuration for a Wickr network.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which OpenTDF integration will be
  /// retrieved.
  Future<GetOpentdfConfigResponse> getOpentdfConfig({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/tdf',
      exceptionFnMap: _exceptionFns,
    );
    return GetOpentdfConfigResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific security group in a Wickr
  /// network, including its settings, member counts, and configuration.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [groupId] :
  /// The unique identifier of the security group to retrieve.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the security group.
  Future<GetSecurityGroupResponse> getSecurityGroup({
    required String groupId,
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/security-groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSecurityGroupResponse.fromJson(response);
  }

  /// Retrieves detailed information about a specific user in a Wickr network,
  /// including their profile, status, and activity history.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the user.
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user to retrieve.
  ///
  /// Parameter [endTime] :
  /// The end time for filtering the user's last activity. Only activity before
  /// this timestamp will be considered. Time is specified in epoch seconds.
  ///
  /// Parameter [startTime] :
  /// The start time for filtering the user's last activity. Only activity after
  /// this timestamp will be considered. Time is specified in epoch seconds.
  Future<GetUserResponse> getUser({
    required String networkId,
    required String userId,
    DateTime? endTime,
    DateTime? startTime,
  }) async {
    final $query = <String, List<String>>{
      if (endTime != null)
        'endTime': [_s.unixTimestampToJson(endTime).toString().toString()],
      if (startTime != null)
        'startTime': [_s.unixTimestampToJson(startTime).toString().toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/users/${Uri.encodeComponent(userId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetUserResponse.fromJson(response);
  }

  /// Retrieves the count of users in a Wickr network, categorized by their
  /// status (pending, active, rejected) and showing how many users can still be
  /// added.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which to retrieve user counts.
  Future<GetUsersCountResponse> getUsersCount({
    required String networkId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/users/count',
      exceptionFnMap: _exceptionFns,
    );
    return GetUsersCountResponse.fromJson(response);
  }

  /// Retrieves a paginated list of guest users who have been blocked from a
  /// Wickr network. You can filter and sort the results.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which to list blocked guest users.
  ///
  /// Parameter [admin] :
  /// Filter results to only include blocked guest users that were blocked by
  /// this administrator.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of blocked guest users to return in a single page.
  /// Valid range is 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The field to sort blocked guest users by. Accepted values include
  /// 'username', 'admin', and 'modified'.
  ///
  /// Parameter [username] :
  /// Filter results to only include blocked guest users with usernames matching
  /// this value.
  Future<ListBlockedGuestUsersResponse> listBlockedGuestUsers({
    required String networkId,
    String? admin,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
    String? username,
  }) async {
    final $query = <String, List<String>>{
      if (admin != null) 'admin': [admin],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
      if (username != null) 'username': [username],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/guest-users/blocklist',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBlockedGuestUsersResponse.fromJson(response);
  }

  /// Retrieves a paginated list of bots in a specified Wickr network. You can
  /// filter and sort the results based on various criteria.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which to list bots.
  ///
  /// Parameter [displayName] :
  /// Filter results to only include bots with display names matching this
  /// value.
  ///
  /// Parameter [groupId] :
  /// Filter results to only include bots belonging to this security group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of bots to return in a single page. Valid range is
  /// 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The fields to sort bots by. Multiple fields can be specified by separating
  /// them with '+'. Accepted values include 'username', 'firstName',
  /// 'displayName', 'status', and 'groupId'.
  ///
  /// Parameter [status] :
  /// Filter results to only include bots with this status (1 for pending, 2 for
  /// active).
  ///
  /// Parameter [username] :
  /// Filter results to only include bots with usernames matching this value.
  Future<ListBotsResponse> listBots({
    required String networkId,
    String? displayName,
    String? groupId,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
    int? status,
    String? username,
  }) async {
    final $query = <String, List<String>>{
      if (displayName != null) 'displayName': [displayName],
      if (groupId != null) 'groupId': [groupId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
      if (status != null) 'status': [status.toString()],
      if (username != null) 'username': [username],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/bots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBotsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of devices associated with a specific user in a
  /// Wickr network. This operation returns information about all devices where
  /// the user has logged into Wickr.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the user.
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user whose devices will be listed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of devices to return in a single page. Valid range is
  /// 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The fields to sort devices by. Multiple fields can be specified by
  /// separating them with '+'. Accepted values include 'lastlogin', 'type',
  /// 'suspend', and 'created'.
  Future<ListDevicesForUserResponse> listDevicesForUser({
    required String networkId,
    required String userId,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/users/${Uri.encodeComponent(userId)}/devices',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDevicesForUserResponse.fromJson(response);
  }

  /// Retrieves a paginated list of guest users who have communicated with your
  /// Wickr network. Guest users are external users from federated networks who
  /// can communicate with network members.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which to list guest users.
  ///
  /// Parameter [billingPeriod] :
  /// Filter results to only include guest users from this billing period (e.g.,
  /// '2024-01').
  ///
  /// Parameter [maxResults] :
  /// The maximum number of guest users to return in a single page. Valid range
  /// is 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The field to sort guest users by. Accepted values include 'username' and
  /// 'billingPeriod'.
  ///
  /// Parameter [username] :
  /// Filter results to only include guest users with usernames matching this
  /// value.
  Future<ListGuestUsersResponse> listGuestUsers({
    required String networkId,
    String? billingPeriod,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
    String? username,
  }) async {
    final $query = <String, List<String>>{
      if (billingPeriod != null) 'billingPeriod': [billingPeriod],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
      if (username != null) 'username': [username],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/guest-users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListGuestUsersResponse.fromJson(response);
  }

  /// Retrieves a paginated list of all Wickr networks associated with your
  /// Amazon Web Services account. You can sort the results by network ID or
  /// name.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of networks to return in a single page. Valid range is
  /// 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The field to sort networks by. Accepted values are 'networkId' and
  /// 'networkName'. Default is 'networkId'.
  Future<ListNetworksResponse> listNetworks({
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListNetworksResponse.fromJson(response);
  }

  /// Retrieves a paginated list of security groups in a specified Wickr
  /// network. You can sort the results by various criteria.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which to list security groups.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of security groups to return in a single page. Valid
  /// range is 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The field to sort security groups by. Accepted values include 'id' and
  /// 'name'.
  Future<ListSecurityGroupsResponse> listSecurityGroups({
    required String networkId,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/security-groups',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityGroupsResponse.fromJson(response);
  }

  /// Retrieves a paginated list of users who belong to a specific security
  /// group in a Wickr network.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [groupId] :
  /// The unique identifier of the security group whose users will be listed.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the security group.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of users to return in a single page. Valid range is
  /// 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The field to sort users by. Multiple fields can be specified by separating
  /// them with '+'. Accepted values include 'username', 'firstName', and
  /// 'lastName'.
  Future<ListSecurityGroupUsersResponse> listSecurityGroupUsers({
    required String groupId,
    required String networkId,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
  }) async {
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/security-groups/${Uri.encodeComponent(groupId)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSecurityGroupUsersResponse.fromJson(response);
  }

  /// Retrieves a paginated list of users in a specified Wickr network. You can
  /// filter and sort the results based on various criteria such as name,
  /// status, or security group membership.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network from which to list users.
  ///
  /// Parameter [firstName] :
  /// Filter results to only include users with first names matching this value.
  ///
  /// Parameter [groupId] :
  /// Filter results to only include users belonging to this security group.
  ///
  /// Parameter [lastName] :
  /// Filter results to only include users with last names matching this value.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of users to return in a single page. Valid range is
  /// 1-100. Default is 10.
  ///
  /// Parameter [nextToken] :
  /// The token for retrieving the next page of results. This is returned from a
  /// previous request when there are more results available.
  ///
  /// Parameter [sortDirection] :
  /// The direction to sort results. Valid values are 'ASC' (ascending) or
  /// 'DESC' (descending). Default is 'DESC'.
  ///
  /// Parameter [sortFields] :
  /// The fields to sort users by. Multiple fields can be specified by
  /// separating them with '+'. Accepted values include 'username', 'firstName',
  /// 'lastName', 'status', and 'groupId'.
  ///
  /// Parameter [status] :
  /// Filter results to only include users with this status (1 for pending, 2
  /// for active).
  ///
  /// Parameter [username] :
  /// Filter results to only include users with usernames matching this value.
  Future<ListUsersResponse> listUsers({
    required String networkId,
    String? firstName,
    String? groupId,
    String? lastName,
    int? maxResults,
    String? nextToken,
    SortDirection? sortDirection,
    String? sortFields,
    int? status,
    String? username,
  }) async {
    final $query = <String, List<String>>{
      if (firstName != null) 'firstName': [firstName],
      if (groupId != null) 'groupId': [groupId],
      if (lastName != null) 'lastName': [lastName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sortDirection != null) 'sortDirection': [sortDirection.value],
      if (sortFields != null) 'sortFields': [sortFields],
      if (status != null) 'status': [status.toString()],
      if (username != null) 'username': [username],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/users',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListUsersResponse.fromJson(response);
  }

  /// Registers and saves an OpenID Connect (OIDC) configuration for a Wickr
  /// network, enabling Single Sign-On (SSO) authentication through an identity
  /// provider.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [companyId] :
  /// Custom identifier your end users will use to sign in with SSO.
  ///
  /// Parameter [issuer] :
  /// The issuer URL of the OIDC provider (e.g., 'https://login.example.com').
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which OIDC will be configured.
  ///
  /// Parameter [scopes] :
  /// The OAuth scopes to request from the OIDC provider (e.g., 'openid profile
  /// email').
  ///
  /// Parameter [customUsername] :
  /// A custom field mapping to extract the username from the OIDC token
  /// (optional).
  /// <note>
  /// The customUsername is only required if you use something other than email
  /// as the username field.
  /// </note>
  ///
  /// Parameter [extraAuthParams] :
  /// Additional authentication parameters to include in the OIDC flow
  /// (optional).
  ///
  /// Parameter [secret] :
  /// The client secret for authenticating with the OIDC provider (optional).
  ///
  /// Parameter [ssoTokenBufferMinutes] :
  /// The buffer time in minutes before the SSO token expires to refresh it
  /// (optional).
  ///
  /// Parameter [userId] :
  /// Unique identifier provided by your identity provider to authenticate the
  /// access request. Also referred to as clientID.
  Future<RegisterOidcConfigResponse> registerOidcConfig({
    required String companyId,
    required String issuer,
    required String networkId,
    required String scopes,
    String? customUsername,
    String? extraAuthParams,
    String? secret,
    int? ssoTokenBufferMinutes,
    String? userId,
  }) async {
    final $payload = <String, dynamic>{
      'companyId': companyId,
      'issuer': issuer,
      'scopes': scopes,
      if (customUsername != null) 'customUsername': customUsername,
      if (extraAuthParams != null) 'extraAuthParams': extraAuthParams,
      if (secret != null) 'secret': secret,
      if (ssoTokenBufferMinutes != null)
        'ssoTokenBufferMinutes': ssoTokenBufferMinutes,
      if (userId != null) 'userId': userId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/oidc/save',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterOidcConfigResponse.fromJson(response);
  }

  /// Tests an OpenID Connect (OIDC) configuration for a Wickr network by
  /// validating the connection to the identity provider and retrieving its
  /// supported capabilities.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [issuer] :
  /// The issuer URL of the OIDC provider to test.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which the OIDC configuration will be
  /// tested.
  ///
  /// Parameter [scopes] :
  /// The OAuth scopes to test with the OIDC provider.
  ///
  /// Parameter [certificate] :
  /// The CA certificate for secure communication with the OIDC provider
  /// (optional).
  ///
  /// Parameter [extraAuthParams] :
  /// Additional authentication parameters to include in the test (optional).
  Future<RegisterOidcConfigTestResponse> registerOidcConfigTest({
    required String issuer,
    required String networkId,
    required String scopes,
    String? certificate,
    String? extraAuthParams,
  }) async {
    final $payload = <String, dynamic>{
      'issuer': issuer,
      'scopes': scopes,
      if (certificate != null) 'certificate': certificate,
      if (extraAuthParams != null) 'extraAuthParams': extraAuthParams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/oidc/test',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterOidcConfigTestResponse.fromJson(response);
  }

  /// Registers and saves OpenTDF configuration for a Wickr network, enabling
  /// attribute-based access control for Wickr through an OpenTDF provider.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [clientId] :
  /// The OIDC client ID used for authenticating with the OpenTDF provider.
  ///
  /// Parameter [clientSecret] :
  /// The OIDC client secret used for authenticating with the OpenTDF provider
  ///
  /// Parameter [domain] :
  /// The domain of the OpenTDF server.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network for which OpenTDF integration will be
  /// configured.
  ///
  /// Parameter [provider] :
  /// The provider of the OpenTDF platform.
  /// <note>
  /// Currently only Virtru is supported as the OpenTDF provider.
  /// </note>
  ///
  /// Parameter [dryRun] :
  /// Perform dry-run test connection of OpenTDF configuration (optional).
  Future<RegisterOpentdfConfigResponse> registerOpentdfConfig({
    required String clientId,
    required String clientSecret,
    required String domain,
    required String networkId,
    required String provider,
    bool? dryRun,
  }) async {
    final $query = <String, List<String>>{
      if (dryRun != null) 'dryRun': [dryRun.toString()],
    };
    final $payload = <String, dynamic>{
      'clientId': clientId,
      'clientSecret': clientSecret,
      'domain': domain,
      'provider': provider,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/tdf',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return RegisterOpentdfConfigResponse.fromJson(response);
  }

  /// Updates the properties of an existing bot in a Wickr network. This
  /// operation allows you to modify the bot's display name, security group,
  /// password, or suspension status.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [botId] :
  /// The unique identifier of the bot to update.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the bot to update.
  ///
  /// Parameter [challenge] :
  /// The new password for the bot account.
  ///
  /// Parameter [displayName] :
  /// The new display name for the bot.
  ///
  /// Parameter [groupId] :
  /// The ID of the new security group to assign the bot to.
  ///
  /// Parameter [suspend] :
  /// Set to true to suspend the bot or false to unsuspend it. Omit this field
  /// for standard updates that don't affect suspension status.
  Future<UpdateBotResponse> updateBot({
    required String botId,
    required String networkId,
    String? challenge,
    String? displayName,
    String? groupId,
    bool? suspend,
  }) async {
    final $payload = <String, dynamic>{
      if (challenge != null) 'challenge': challenge,
      if (displayName != null) 'displayName': displayName,
      if (groupId != null) 'groupId': groupId,
      if (suspend != null) 'suspend': suspend,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/bots/${Uri.encodeComponent(botId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateBotResponse.fromJson(response);
  }

  /// Updates the data retention bot settings, allowing you to enable or disable
  /// the data retention service, or acknowledge the public key message.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [actionType] :
  /// The action to perform. Valid values are 'ENABLE' (to enable the data
  /// retention service), 'DISABLE' (to disable the service), or
  /// 'PUBKEY_MSG_ACK' (to acknowledge the public key message).
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the data retention bot.
  Future<UpdateDataRetentionResponse> updateDataRetention({
    required DataRetentionActionType actionType,
    required String networkId,
  }) async {
    final $payload = <String, dynamic>{
      'actionType': actionType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/data-retention-bots',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateDataRetentionResponse.fromJson(response);
  }

  /// Updates the block status of a guest user in a Wickr network. This
  /// operation allows you to block or unblock a guest user from accessing the
  /// network.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [block] :
  /// Set to true to block the guest user or false to unblock them.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network where the guest user's status will be updated.
  ///
  /// Parameter [usernameHash] :
  /// The username hash (unique identifier) of the guest user to update.
  Future<UpdateGuestUserResponse> updateGuestUser({
    required bool block,
    required String networkId,
    required String usernameHash,
  }) async {
    final $payload = <String, dynamic>{
      'block': block,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/guest-users/${Uri.encodeComponent(usernameHash)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateGuestUserResponse.fromJson(response);
  }

  /// Updates the properties of an existing Wickr network, such as its name or
  /// encryption key configuration.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network to update.
  ///
  /// Parameter [networkName] :
  /// The new name for the network. Must be between 1 and 20 characters.
  ///
  /// Parameter [clientToken] :
  /// A unique identifier for this request to ensure idempotency.
  ///
  /// Parameter [encryptionKeyArn] :
  /// The ARN of the Amazon Web Services KMS customer managed key to use for
  /// encrypting sensitive data in the network.
  Future<UpdateNetworkResponse> updateNetwork({
    required String networkId,
    required String networkName,
    String? clientToken,
    String? encryptionKeyArn,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'networkName': networkName,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkResponse.fromJson(response);
  }

  /// Updates network-level settings for a Wickr network. You can modify
  /// settings such as client metrics, data retention, and other network-wide
  /// options.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network whose settings will be updated.
  ///
  /// Parameter [settings] :
  /// A map of setting names to their new values. Each setting should be
  /// provided with its appropriate type (boolean, string, number, etc.).
  Future<UpdateNetworkSettingsResponse> updateNetworkSettings({
    required String networkId,
    required NetworkSettings settings,
  }) async {
    final $payload = <String, dynamic>{
      'settings': settings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/settings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateNetworkSettingsResponse.fromJson(response);
  }

  /// Updates the properties of an existing security group in a Wickr network,
  /// such as its name or settings.
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [groupId] :
  /// The unique identifier of the security group to update.
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the security group to update.
  ///
  /// Parameter [name] :
  /// The new name for the security group.
  ///
  /// Parameter [securityGroupSettings] :
  /// The updated configuration settings for the security group.
  ///
  /// Federation mode - 0 (Local federation), 1 (Restricted federation), 2
  /// (Global federation)
  Future<UpdateSecurityGroupResponse> updateSecurityGroup({
    required String groupId,
    required String networkId,
    String? name,
    SecurityGroupSettings? securityGroupSettings,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'name': name,
      if (securityGroupSettings != null)
        'securityGroupSettings': securityGroupSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/networks/${Uri.encodeComponent(networkId)}/security-groups/${Uri.encodeComponent(groupId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSecurityGroupResponse.fromJson(response);
  }

  /// Updates the properties of an existing user in a Wickr network. This
  /// operation allows you to modify the user's name, password, security group
  /// membership, and invite code settings.
  /// <note>
  /// <code>codeValidation</code>, <code>inviteCode</code>, and
  /// <code>inviteCodeTtl</code> are restricted to networks under preview only.
  /// </note>
  ///
  /// May throw [BadRequestError].
  /// May throw [ForbiddenError].
  /// May throw [InternalServerError].
  /// May throw [RateLimitError].
  /// May throw [ResourceNotFoundError].
  /// May throw [UnauthorizedError].
  /// May throw [ValidationError].
  ///
  /// Parameter [networkId] :
  /// The ID of the Wickr network containing the user to update.
  ///
  /// Parameter [userId] :
  /// The unique identifier of the user to update.
  ///
  /// Parameter [userDetails] :
  /// An object containing the user details to be updated, such as name,
  /// password, security groups, and invite code settings.
  Future<UpdateUserResponse> updateUser({
    required String networkId,
    required String userId,
    UpdateUserDetails? userDetails,
  }) async {
    final $payload = <String, dynamic>{
      'userId': userId,
      if (userDetails != null) 'userDetails': userDetails,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/networks/${Uri.encodeComponent(networkId)}/users',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateUserResponse.fromJson(response);
  }
}

class BatchCreateUserResponse {
  /// A list of user creation attempts that failed, including error details
  /// explaining why each user could not be created.
  final List<BatchUserErrorResponseItem>? failed;

  /// A message indicating the overall result of the batch operation.
  final String? message;

  /// A list of user objects that were successfully created, including their
  /// assigned user IDs and invite codes.
  final List<User>? successful;

  BatchCreateUserResponse({
    this.failed,
    this.message,
    this.successful,
  });

  factory BatchCreateUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchCreateUserResponse(
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserErrorResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final message = this.message;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (message != null) 'message': message,
      if (successful != null) 'successful': successful,
    };
  }
}

class BatchDeleteUserResponse {
  /// A list of user deletion attempts that failed, including error details
  /// explaining why each user could not be deleted.
  final List<BatchUserErrorResponseItem>? failed;

  /// A message indicating the overall result of the batch deletion operation.
  final String? message;

  /// A list of user IDs that were successfully deleted from the network.
  final List<BatchUserSuccessResponseItem>? successful;

  BatchDeleteUserResponse({
    this.failed,
    this.message,
    this.successful,
  });

  factory BatchDeleteUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteUserResponse(
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserErrorResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserSuccessResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final message = this.message;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (message != null) 'message': message,
      if (successful != null) 'successful': successful,
    };
  }
}

class BatchLookupUserUnameResponse {
  /// A list of username hash lookup attempts that failed, including error details
  /// explaining why each lookup failed.
  final List<BatchUnameErrorResponseItem>? failed;

  /// A message indicating the overall result of the batch lookup operation.
  final String? message;

  /// A list of successfully resolved username hashes with their corresponding
  /// email addresses.
  final List<BatchUnameSuccessResponseItem>? successful;

  BatchLookupUserUnameResponse({
    this.failed,
    this.message,
    this.successful,
  });

  factory BatchLookupUserUnameResponse.fromJson(Map<String, dynamic> json) {
    return BatchLookupUserUnameResponse(
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUnameErrorResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUnameSuccessResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final message = this.message;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (message != null) 'message': message,
      if (successful != null) 'successful': successful,
    };
  }
}

class BatchReinviteUserResponse {
  /// A list of reinvitation attempts that failed, including error details
  /// explaining why each user could not be reinvited.
  final List<BatchUserErrorResponseItem>? failed;

  /// A message indicating the overall result of the batch reinvitation operation.
  final String? message;

  /// A list of user IDs that were successfully reinvited.
  final List<BatchUserSuccessResponseItem>? successful;

  BatchReinviteUserResponse({
    this.failed,
    this.message,
    this.successful,
  });

  factory BatchReinviteUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchReinviteUserResponse(
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserErrorResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserSuccessResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final message = this.message;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (message != null) 'message': message,
      if (successful != null) 'successful': successful,
    };
  }
}

class BatchResetDevicesForUserResponse {
  /// A list of device reset attempts that failed, including error details
  /// explaining why each device could not be reset.
  final List<BatchDeviceErrorResponseItem>? failed;

  /// A message indicating the overall result of the batch device reset operation.
  final String? message;

  /// A list of application IDs that were successfully reset.
  final List<BatchDeviceSuccessResponseItem>? successful;

  BatchResetDevicesForUserResponse({
    this.failed,
    this.message,
    this.successful,
  });

  factory BatchResetDevicesForUserResponse.fromJson(Map<String, dynamic> json) {
    return BatchResetDevicesForUserResponse(
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchDeviceErrorResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) => BatchDeviceSuccessResponseItem.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final message = this.message;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (message != null) 'message': message,
      if (successful != null) 'successful': successful,
    };
  }
}

class BatchToggleUserSuspendStatusResponse {
  /// A list of suspend status toggle attempts that failed, including error
  /// details explaining why each user's status could not be changed.
  final List<BatchUserErrorResponseItem>? failed;

  /// A message indicating the overall result of the batch suspend status toggle
  /// operation.
  final String? message;

  /// A list of user IDs whose suspend status was successfully toggled.
  final List<BatchUserSuccessResponseItem>? successful;

  BatchToggleUserSuspendStatusResponse({
    this.failed,
    this.message,
    this.successful,
  });

  factory BatchToggleUserSuspendStatusResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchToggleUserSuspendStatusResponse(
      failed: (json['failed'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserErrorResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      successful: (json['successful'] as List?)
          ?.nonNulls
          .map((e) =>
              BatchUserSuccessResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final message = this.message;
    final successful = this.successful;
    return {
      if (failed != null) 'failed': failed,
      if (message != null) 'message': message,
      if (successful != null) 'successful': successful,
    };
  }
}

class CreateBotResponse {
  /// The unique identifier assigned to the newly created bot.
  final String botId;

  /// The display name of the newly created bot.
  final String? displayName;

  /// The ID of the security group to which the bot was assigned.
  final String? groupId;

  /// A message indicating the result of the bot creation operation.
  final String? message;

  /// The ID of the network where the bot was created.
  final String? networkId;

  /// The username of the newly created bot.
  final String? username;

  CreateBotResponse({
    required this.botId,
    this.displayName,
    this.groupId,
    this.message,
    this.networkId,
    this.username,
  });

  factory CreateBotResponse.fromJson(Map<String, dynamic> json) {
    return CreateBotResponse(
      botId: (json['botId'] as String?) ?? '',
      displayName: json['displayName'] as String?,
      groupId: json['groupId'] as String?,
      message: json['message'] as String?,
      networkId: json['networkId'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final displayName = this.displayName;
    final groupId = this.groupId;
    final message = this.message;
    final networkId = this.networkId;
    final username = this.username;
    return {
      'botId': botId,
      if (displayName != null) 'displayName': displayName,
      if (groupId != null) 'groupId': groupId,
      if (message != null) 'message': message,
      if (networkId != null) 'networkId': networkId,
      if (username != null) 'username': username,
    };
  }
}

class CreateDataRetentionBotResponse {
  /// A message indicating that the data retention bot was successfully
  /// provisioned.
  final String? message;

  CreateDataRetentionBotResponse({
    this.message,
  });

  factory CreateDataRetentionBotResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataRetentionBotResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class CreateDataRetentionBotChallengeResponse {
  /// The newly generated challenge password for the data retention bot.
  final String challenge;

  CreateDataRetentionBotChallengeResponse({
    required this.challenge,
  });

  factory CreateDataRetentionBotChallengeResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateDataRetentionBotChallengeResponse(
      challenge: (json['challenge'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final challenge = this.challenge;
    return {
      'challenge': challenge,
    };
  }
}

class CreateNetworkResponse {
  /// The ARN of the KMS key being used to encrypt sensitive data in the network.
  final String? encryptionKeyArn;

  /// The unique identifier assigned to the newly created network.
  final String? networkId;

  /// The name of the newly created network.
  final String? networkName;

  CreateNetworkResponse({
    this.encryptionKeyArn,
    this.networkId,
    this.networkName,
  });

  factory CreateNetworkResponse.fromJson(Map<String, dynamic> json) {
    return CreateNetworkResponse(
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      networkId: json['networkId'] as String?,
      networkName: json['networkName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyArn = this.encryptionKeyArn;
    final networkId = this.networkId;
    final networkName = this.networkName;
    return {
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (networkId != null) 'networkId': networkId,
      if (networkName != null) 'networkName': networkName,
    };
  }
}

class CreateSecurityGroupResponse {
  /// The details of the newly created security group, including its ID, name, and
  /// settings.
  final SecurityGroup securityGroup;

  CreateSecurityGroupResponse({
    required this.securityGroup,
  });

  factory CreateSecurityGroupResponse.fromJson(Map<String, dynamic> json) {
    return CreateSecurityGroupResponse(
      securityGroup: SecurityGroup.fromJson(
          (json['securityGroup'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroup = this.securityGroup;
    return {
      'securityGroup': securityGroup,
    };
  }
}

class DeleteBotResponse {
  /// A message indicating the result of the bot deletion operation.
  final String? message;

  DeleteBotResponse({
    this.message,
  });

  factory DeleteBotResponse.fromJson(Map<String, dynamic> json) {
    return DeleteBotResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class DeleteDataRetentionBotResponse {
  /// A message indicating that the data retention bot and all associated data
  /// were successfully deleted.
  final String? message;

  DeleteDataRetentionBotResponse({
    this.message,
  });

  factory DeleteDataRetentionBotResponse.fromJson(Map<String, dynamic> json) {
    return DeleteDataRetentionBotResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class DeleteNetworkResponse {
  /// A message indicating that the network deletion has been initiated
  /// successfully.
  final String? message;

  DeleteNetworkResponse({
    this.message,
  });

  factory DeleteNetworkResponse.fromJson(Map<String, dynamic> json) {
    return DeleteNetworkResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class DeleteSecurityGroupResponse {
  /// The ID of the security group that was deleted.
  final String? groupId;

  /// A message indicating the result of the security group deletion operation.
  final String? message;

  /// The ID of the network from which the security group was deleted.
  final String? networkId;

  DeleteSecurityGroupResponse({
    this.groupId,
    this.message,
    this.networkId,
  });

  factory DeleteSecurityGroupResponse.fromJson(Map<String, dynamic> json) {
    return DeleteSecurityGroupResponse(
      groupId: json['groupId'] as String?,
      message: json['message'] as String?,
      networkId: json['networkId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final groupId = this.groupId;
    final message = this.message;
    final networkId = this.networkId;
    return {
      if (groupId != null) 'groupId': groupId,
      if (message != null) 'message': message,
      if (networkId != null) 'networkId': networkId,
    };
  }
}

class GetBotResponse {
  /// The unique identifier of the bot.
  final String? botId;

  /// The display name of the bot that is visible to users.
  final String? displayName;

  /// The ID of the security group to which the bot belongs.
  final String? groupId;

  /// Indicates whether the bot has a password set.
  final bool? hasChallenge;

  /// The timestamp of the bot's last login.
  final String? lastLogin;

  /// The public key of the bot used for encryption.
  final String? pubkey;

  /// The current status of the bot (1 for pending, 2 for active).
  final int? status;

  /// Indicates whether the bot is currently suspended.
  final bool? suspended;

  /// The unique username hash identifier for the bot.
  final String? uname;

  /// The username of the bot.
  final String? username;

  GetBotResponse({
    this.botId,
    this.displayName,
    this.groupId,
    this.hasChallenge,
    this.lastLogin,
    this.pubkey,
    this.status,
    this.suspended,
    this.uname,
    this.username,
  });

  factory GetBotResponse.fromJson(Map<String, dynamic> json) {
    return GetBotResponse(
      botId: json['botId'] as String?,
      displayName: json['displayName'] as String?,
      groupId: json['groupId'] as String?,
      hasChallenge: json['hasChallenge'] as bool?,
      lastLogin: json['lastLogin'] as String?,
      pubkey: json['pubkey'] as String?,
      status: json['status'] as int?,
      suspended: json['suspended'] as bool?,
      uname: json['uname'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final displayName = this.displayName;
    final groupId = this.groupId;
    final hasChallenge = this.hasChallenge;
    final lastLogin = this.lastLogin;
    final pubkey = this.pubkey;
    final status = this.status;
    final suspended = this.suspended;
    final uname = this.uname;
    final username = this.username;
    return {
      if (botId != null) 'botId': botId,
      if (displayName != null) 'displayName': displayName,
      if (groupId != null) 'groupId': groupId,
      if (hasChallenge != null) 'hasChallenge': hasChallenge,
      if (lastLogin != null) 'lastLogin': lastLogin,
      if (pubkey != null) 'pubkey': pubkey,
      if (status != null) 'status': status,
      if (suspended != null) 'suspended': suspended,
      if (uname != null) 'uname': uname,
      if (username != null) 'username': username,
    };
  }
}

class GetBotsCountResponse {
  /// The number of bots with active status.
  final int active;

  /// The number of bots with pending status (invited but not yet activated).
  final int pending;

  /// The total number of bots in the network (active and pending).
  final int total;

  GetBotsCountResponse({
    required this.active,
    required this.pending,
    required this.total,
  });

  factory GetBotsCountResponse.fromJson(Map<String, dynamic> json) {
    return GetBotsCountResponse(
      active: (json['active'] as int?) ?? 0,
      pending: (json['pending'] as int?) ?? 0,
      total: (json['total'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final pending = this.pending;
    final total = this.total;
    return {
      'active': active,
      'pending': pending,
      'total': total,
    };
  }
}

class GetDataRetentionBotResponse {
  /// Indicates whether a data retention bot exists in the network.
  final bool? botExists;

  /// The name of the data retention bot.
  final String? botName;

  /// Indicates whether the data retention bot is active and operational.
  final bool? isBotActive;

  /// Indicates whether the data retention bot has been registered with the
  /// network.
  final bool? isDataRetentionBotRegistered;

  /// Indicates whether the data retention service is enabled for the network.
  final bool? isDataRetentionServiceEnabled;

  /// Indicates whether the public key message has been acknowledged by the bot.
  final bool? isPubkeyMsgAcked;

  GetDataRetentionBotResponse({
    this.botExists,
    this.botName,
    this.isBotActive,
    this.isDataRetentionBotRegistered,
    this.isDataRetentionServiceEnabled,
    this.isPubkeyMsgAcked,
  });

  factory GetDataRetentionBotResponse.fromJson(Map<String, dynamic> json) {
    return GetDataRetentionBotResponse(
      botExists: json['botExists'] as bool?,
      botName: json['botName'] as String?,
      isBotActive: json['isBotActive'] as bool?,
      isDataRetentionBotRegistered:
          json['isDataRetentionBotRegistered'] as bool?,
      isDataRetentionServiceEnabled:
          json['isDataRetentionServiceEnabled'] as bool?,
      isPubkeyMsgAcked: json['isPubkeyMsgAcked'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final botExists = this.botExists;
    final botName = this.botName;
    final isBotActive = this.isBotActive;
    final isDataRetentionBotRegistered = this.isDataRetentionBotRegistered;
    final isDataRetentionServiceEnabled = this.isDataRetentionServiceEnabled;
    final isPubkeyMsgAcked = this.isPubkeyMsgAcked;
    return {
      if (botExists != null) 'botExists': botExists,
      if (botName != null) 'botName': botName,
      if (isBotActive != null) 'isBotActive': isBotActive,
      if (isDataRetentionBotRegistered != null)
        'isDataRetentionBotRegistered': isDataRetentionBotRegistered,
      if (isDataRetentionServiceEnabled != null)
        'isDataRetentionServiceEnabled': isDataRetentionServiceEnabled,
      if (isPubkeyMsgAcked != null) 'isPubkeyMsgAcked': isPubkeyMsgAcked,
    };
  }
}

class GetGuestUserHistoryCountResponse {
  /// A list of historical guest user counts, organized by month and billing
  /// period.
  final List<GuestUserHistoryCount> history;

  GetGuestUserHistoryCountResponse({
    required this.history,
  });

  factory GetGuestUserHistoryCountResponse.fromJson(Map<String, dynamic> json) {
    return GetGuestUserHistoryCountResponse(
      history: ((json['history'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuestUserHistoryCount.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final history = this.history;
    return {
      'history': history,
    };
  }
}

class GetNetworkResponse {
  /// The access level of the network (STANDARD or PREMIUM), which determines
  /// available features and capabilities.
  final AccessLevel accessLevel;

  /// The Amazon Web Services account ID that owns the network.
  final String awsAccountId;

  /// The Amazon Resource Name (ARN) of the network.
  final String networkArn;

  /// The unique identifier of the network.
  final String networkId;

  /// The name of the network.
  final String networkName;

  /// The ARN of the Amazon Web Services KMS customer managed key used for
  /// encrypting sensitive data in the network.
  final String? encryptionKeyArn;

  /// The expiration date and time for the network's free trial period, if
  /// applicable.
  final String? freeTrialExpiration;

  /// The SSO redirect URI migration state, managed by the SSO redirect migration
  /// wizard. Values: 0 (not started), 1 (in progress), or 2 (completed).
  final int? migrationState;

  /// The current standing or status of the network.
  final int? standing;

  GetNetworkResponse({
    required this.accessLevel,
    required this.awsAccountId,
    required this.networkArn,
    required this.networkId,
    required this.networkName,
    this.encryptionKeyArn,
    this.freeTrialExpiration,
    this.migrationState,
    this.standing,
  });

  factory GetNetworkResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkResponse(
      accessLevel:
          AccessLevel.fromString((json['accessLevel'] as String?) ?? ''),
      awsAccountId: (json['awsAccountId'] as String?) ?? '',
      networkArn: (json['networkArn'] as String?) ?? '',
      networkId: (json['networkId'] as String?) ?? '',
      networkName: (json['networkName'] as String?) ?? '',
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      freeTrialExpiration: json['freeTrialExpiration'] as String?,
      migrationState: json['migrationState'] as int?,
      standing: json['standing'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLevel = this.accessLevel;
    final awsAccountId = this.awsAccountId;
    final networkArn = this.networkArn;
    final networkId = this.networkId;
    final networkName = this.networkName;
    final encryptionKeyArn = this.encryptionKeyArn;
    final freeTrialExpiration = this.freeTrialExpiration;
    final migrationState = this.migrationState;
    final standing = this.standing;
    return {
      'accessLevel': accessLevel.value,
      'awsAccountId': awsAccountId,
      'networkArn': networkArn,
      'networkId': networkId,
      'networkName': networkName,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (freeTrialExpiration != null)
        'freeTrialExpiration': freeTrialExpiration,
      if (migrationState != null) 'migrationState': migrationState,
      if (standing != null) 'standing': standing,
    };
  }
}

class GetNetworkSettingsResponse {
  /// A list of network settings, where each setting includes a name, value, and
  /// type.
  final List<Setting> settings;

  GetNetworkSettingsResponse({
    required this.settings,
  });

  factory GetNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetNetworkSettingsResponse(
      settings: ((json['settings'] as List?) ?? const [])
          .nonNulls
          .map((e) => Setting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    return {
      'settings': settings,
    };
  }
}

class GetOidcInfoResponse {
  /// The OpenID Connect configuration information for the network, including
  /// issuer, client ID, scopes, and other SSO settings.
  final OidcConfigInfo? openidConnectInfo;

  /// OAuth token information including access token, refresh token, and
  /// expiration details (only present if token parameters were provided in the
  /// request).
  final OidcTokenInfo? tokenInfo;

  GetOidcInfoResponse({
    this.openidConnectInfo,
    this.tokenInfo,
  });

  factory GetOidcInfoResponse.fromJson(Map<String, dynamic> json) {
    return GetOidcInfoResponse(
      openidConnectInfo: json['openidConnectInfo'] != null
          ? OidcConfigInfo.fromJson(
              json['openidConnectInfo'] as Map<String, dynamic>)
          : null,
      tokenInfo: json['tokenInfo'] != null
          ? OidcTokenInfo.fromJson(json['tokenInfo'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final openidConnectInfo = this.openidConnectInfo;
    final tokenInfo = this.tokenInfo;
    return {
      if (openidConnectInfo != null) 'openidConnectInfo': openidConnectInfo,
      if (tokenInfo != null) 'tokenInfo': tokenInfo,
    };
  }
}

class GetOpentdfConfigResponse {
  /// The OIDC client ID used for authenticating with the OpenTDF provider.
  final String clientId;

  /// The OIDC client secret used for authenticating with the OpenTDF provider.
  final String clientSecret;

  /// The domain of the OpenTDF server.
  final String domain;

  /// The provider of the OpenTDF platform.
  final String provider;

  GetOpentdfConfigResponse({
    required this.clientId,
    required this.clientSecret,
    required this.domain,
    required this.provider,
  });

  factory GetOpentdfConfigResponse.fromJson(Map<String, dynamic> json) {
    return GetOpentdfConfigResponse(
      clientId: (json['clientId'] as String?) ?? '',
      clientSecret: (json['clientSecret'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      provider: (json['provider'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final domain = this.domain;
    final provider = this.provider;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      'domain': domain,
      'provider': provider,
    };
  }
}

class GetSecurityGroupResponse {
  /// The detailed information about the security group, including all its
  /// settings and member counts.
  final SecurityGroup securityGroup;

  GetSecurityGroupResponse({
    required this.securityGroup,
  });

  factory GetSecurityGroupResponse.fromJson(Map<String, dynamic> json) {
    return GetSecurityGroupResponse(
      securityGroup: SecurityGroup.fromJson(
          (json['securityGroup'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroup = this.securityGroup;
    return {
      'securityGroup': securityGroup,
    };
  }
}

class GetUserResponse {
  /// The unique identifier of the user.
  final String userId;

  /// The first name of the user.
  final String? firstName;

  /// Indicates whether the user has administrator privileges in the network.
  final bool? isAdmin;

  /// The timestamp of the user's last activity in the network, specified in epoch
  /// seconds.
  final int? lastActivity;

  /// The timestamp of the user's last login to the network, specified in epoch
  /// seconds.
  final int? lastLogin;

  /// The last name of the user.
  final String? lastName;

  /// A list of security group IDs to which the user belongs.
  final List<String>? securityGroupIds;

  /// The current status of the user (1 for pending, 2 for active).
  final int? status;

  /// Indicates whether the user is currently suspended.
  final bool? suspended;

  /// The email address or username of the user.
  final String? username;

  GetUserResponse({
    required this.userId,
    this.firstName,
    this.isAdmin,
    this.lastActivity,
    this.lastLogin,
    this.lastName,
    this.securityGroupIds,
    this.status,
    this.suspended,
    this.username,
  });

  factory GetUserResponse.fromJson(Map<String, dynamic> json) {
    return GetUserResponse(
      userId: (json['userId'] as String?) ?? '',
      firstName: json['firstName'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      lastActivity: json['lastActivity'] as int?,
      lastLogin: json['lastLogin'] as int?,
      lastName: json['lastName'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: json['status'] as int?,
      suspended: json['suspended'] as bool?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final firstName = this.firstName;
    final isAdmin = this.isAdmin;
    final lastActivity = this.lastActivity;
    final lastLogin = this.lastLogin;
    final lastName = this.lastName;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final suspended = this.suspended;
    final username = this.username;
    return {
      'userId': userId,
      if (firstName != null) 'firstName': firstName,
      if (isAdmin != null) 'isAdmin': isAdmin,
      if (lastActivity != null) 'lastActivity': lastActivity,
      if (lastLogin != null) 'lastLogin': lastLogin,
      if (lastName != null) 'lastName': lastName,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status,
      if (suspended != null) 'suspended': suspended,
      if (username != null) 'username': username,
    };
  }
}

class GetUsersCountResponse {
  /// The number of users with active status in the network.
  final int active;

  /// The number of users with pending status (invited but not yet accepted).
  final int pending;

  /// The number of users who have rejected network invitations.
  final int rejected;

  /// The number of additional users that can be added to the network while
  /// maintaining premium free trial eligibility.
  final int remaining;

  /// The total number of users in the network (active and pending combined).
  final int total;

  GetUsersCountResponse({
    required this.active,
    required this.pending,
    required this.rejected,
    required this.remaining,
    required this.total,
  });

  factory GetUsersCountResponse.fromJson(Map<String, dynamic> json) {
    return GetUsersCountResponse(
      active: (json['active'] as int?) ?? 0,
      pending: (json['pending'] as int?) ?? 0,
      rejected: (json['rejected'] as int?) ?? 0,
      remaining: (json['remaining'] as int?) ?? 0,
      total: (json['total'] as int?) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    final active = this.active;
    final pending = this.pending;
    final rejected = this.rejected;
    final remaining = this.remaining;
    final total = this.total;
    return {
      'active': active,
      'pending': pending,
      'rejected': rejected,
      'remaining': remaining,
      'total': total,
    };
  }
}

class ListBlockedGuestUsersResponse {
  /// A list of blocked guest user objects within the current page.
  final List<BlockedGuestUser> blocklist;

  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  ListBlockedGuestUsersResponse({
    required this.blocklist,
    this.nextToken,
  });

  factory ListBlockedGuestUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListBlockedGuestUsersResponse(
      blocklist: ((json['blocklist'] as List?) ?? const [])
          .nonNulls
          .map((e) => BlockedGuestUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final blocklist = this.blocklist;
    final nextToken = this.nextToken;
    return {
      'blocklist': blocklist,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBotsResponse {
  /// A list of bot objects matching the specified filters and within the current
  /// page.
  final List<Bot> bots;

  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  ListBotsResponse({
    required this.bots,
    this.nextToken,
  });

  factory ListBotsResponse.fromJson(Map<String, dynamic> json) {
    return ListBotsResponse(
      bots: ((json['bots'] as List?) ?? const [])
          .nonNulls
          .map((e) => Bot.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bots = this.bots;
    final nextToken = this.nextToken;
    return {
      'bots': bots,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDevicesForUserResponse {
  /// A list of device objects associated with the user within the current page.
  final List<BasicDeviceObject> devices;

  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  ListDevicesForUserResponse({
    required this.devices,
    this.nextToken,
  });

  factory ListDevicesForUserResponse.fromJson(Map<String, dynamic> json) {
    return ListDevicesForUserResponse(
      devices: ((json['devices'] as List?) ?? const [])
          .nonNulls
          .map((e) => BasicDeviceObject.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final devices = this.devices;
    final nextToken = this.nextToken;
    return {
      'devices': devices,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListGuestUsersResponse {
  /// A list of guest user objects within the current page.
  final List<GuestUser> guestlist;

  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  ListGuestUsersResponse({
    required this.guestlist,
    this.nextToken,
  });

  factory ListGuestUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListGuestUsersResponse(
      guestlist: ((json['guestlist'] as List?) ?? const [])
          .nonNulls
          .map((e) => GuestUser.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final guestlist = this.guestlist;
    final nextToken = this.nextToken;
    return {
      'guestlist': guestlist,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListNetworksResponse {
  /// A list of network objects for the Amazon Web Services account.
  final List<Network> networks;

  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  ListNetworksResponse({
    required this.networks,
    this.nextToken,
  });

  factory ListNetworksResponse.fromJson(Map<String, dynamic> json) {
    return ListNetworksResponse(
      networks: ((json['networks'] as List?) ?? const [])
          .nonNulls
          .map((e) => Network.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networks = this.networks;
    final nextToken = this.nextToken;
    return {
      'networks': networks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSecurityGroupsResponse {
  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  /// A list of security group objects in the current page.
  final List<SecurityGroup>? securityGroups;

  ListSecurityGroupsResponse({
    this.nextToken,
    this.securityGroups,
  });

  factory ListSecurityGroupsResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityGroupsResponse(
      nextToken: json['nextToken'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => SecurityGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final securityGroups = this.securityGroups;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

class ListSecurityGroupUsersResponse {
  /// A list of user objects belonging to the security group within the current
  /// page.
  final List<User> users;

  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  ListSecurityGroupUsersResponse({
    required this.users,
    this.nextToken,
  });

  factory ListSecurityGroupUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListSecurityGroupUsersResponse(
      users: ((json['users'] as List?) ?? const [])
          .nonNulls
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final users = this.users;
    final nextToken = this.nextToken;
    return {
      'users': users,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListUsersResponse {
  /// The token to use for retrieving the next page of results. If this is not
  /// present, there are no more results.
  final String? nextToken;

  /// A list of user objects matching the specified filters and within the current
  /// page.
  final List<User>? users;

  ListUsersResponse({
    this.nextToken,
    this.users,
  });

  factory ListUsersResponse.fromJson(Map<String, dynamic> json) {
    return ListUsersResponse(
      nextToken: json['nextToken'] as String?,
      users: (json['users'] as List?)
          ?.nonNulls
          .map((e) => User.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final users = this.users;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (users != null) 'users': users,
    };
  }
}

class RegisterOidcConfigResponse {
  /// Custom identifier your end users will use to sign in with SSO.
  final String companyId;

  /// The issuer URL of the OIDC provider.
  final String issuer;

  /// The OAuth scopes configured for the application.
  final String scopes;

  /// The unique identifier for the registered OIDC application.
  final int? applicationId;

  /// The name of the registered OIDC application.
  final String? applicationName;

  /// The CA certificate used for secure communication with the OIDC provider.
  final String? caCertificate;

  /// The OAuth client ID assigned to the application.
  final String? clientId;

  /// The OAuth client secret for the application.
  final String? clientSecret;

  /// The custom field mapping used for extracting the username.
  final String? customUsername;

  /// The additional authentication parameters configured for the OIDC flow.
  final String? extraAuthParams;

  /// The redirect URL configured for the OAuth flow.
  final String? redirectUrl;

  /// The client secret for authenticating with the OIDC provider.
  final String? secret;

  /// The buffer time in minutes before the SSO token expires.
  final int? ssoTokenBufferMinutes;

  /// The claim field being used as the user identifier.
  final String? userId;

  RegisterOidcConfigResponse({
    required this.companyId,
    required this.issuer,
    required this.scopes,
    this.applicationId,
    this.applicationName,
    this.caCertificate,
    this.clientId,
    this.clientSecret,
    this.customUsername,
    this.extraAuthParams,
    this.redirectUrl,
    this.secret,
    this.ssoTokenBufferMinutes,
    this.userId,
  });

  factory RegisterOidcConfigResponse.fromJson(Map<String, dynamic> json) {
    return RegisterOidcConfigResponse(
      companyId: (json['companyId'] as String?) ?? '',
      issuer: (json['issuer'] as String?) ?? '',
      scopes: (json['scopes'] as String?) ?? '',
      applicationId: json['applicationId'] as int?,
      applicationName: json['applicationName'] as String?,
      caCertificate: json['caCertificate'] as String?,
      clientId: json['clientId'] as String?,
      clientSecret: json['clientSecret'] as String?,
      customUsername: json['customUsername'] as String?,
      extraAuthParams: json['extraAuthParams'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      secret: json['secret'] as String?,
      ssoTokenBufferMinutes: json['ssoTokenBufferMinutes'] as int?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final companyId = this.companyId;
    final issuer = this.issuer;
    final scopes = this.scopes;
    final applicationId = this.applicationId;
    final applicationName = this.applicationName;
    final caCertificate = this.caCertificate;
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final customUsername = this.customUsername;
    final extraAuthParams = this.extraAuthParams;
    final redirectUrl = this.redirectUrl;
    final secret = this.secret;
    final ssoTokenBufferMinutes = this.ssoTokenBufferMinutes;
    final userId = this.userId;
    return {
      'companyId': companyId,
      'issuer': issuer,
      'scopes': scopes,
      if (applicationId != null) 'applicationId': applicationId,
      if (applicationName != null) 'applicationName': applicationName,
      if (caCertificate != null) 'caCertificate': caCertificate,
      if (clientId != null) 'clientId': clientId,
      if (clientSecret != null) 'clientSecret': clientSecret,
      if (customUsername != null) 'customUsername': customUsername,
      if (extraAuthParams != null) 'extraAuthParams': extraAuthParams,
      if (redirectUrl != null) 'redirectUrl': redirectUrl,
      if (secret != null) 'secret': secret,
      if (ssoTokenBufferMinutes != null)
        'ssoTokenBufferMinutes': ssoTokenBufferMinutes,
      if (userId != null) 'userId': userId,
    };
  }
}

class RegisterOidcConfigTestResponse {
  /// The authorization endpoint URL discovered from the OIDC provider.
  final String? authorizationEndpoint;

  /// The end session endpoint URL for logging out users from the OIDC provider.
  final String? endSessionEndpoint;

  /// The OAuth grant types supported by the OIDC provider.
  final List<String>? grantTypesSupported;

  /// The issuer URL confirmed by the OIDC provider.
  final String? issuer;

  /// The logout endpoint URL for terminating user sessions.
  final String? logoutEndpoint;

  /// Indicates whether the provider supports Microsoft multi-refresh tokens.
  final bool? microsoftMultiRefreshToken;

  /// The OAuth response types supported by the OIDC provider.
  final List<String>? responseTypesSupported;

  /// The token revocation endpoint URL for invalidating tokens.
  final String? revocationEndpoint;

  /// The OAuth scopes supported by the OIDC provider.
  final List<String>? scopesSupported;

  /// The token endpoint URL discovered from the OIDC provider.
  final String? tokenEndpoint;

  /// The authentication methods supported by the token endpoint.
  final List<String>? tokenEndpointAuthMethodsSupported;

  /// The user info endpoint URL discovered from the OIDC provider.
  final String? userinfoEndpoint;

  RegisterOidcConfigTestResponse({
    this.authorizationEndpoint,
    this.endSessionEndpoint,
    this.grantTypesSupported,
    this.issuer,
    this.logoutEndpoint,
    this.microsoftMultiRefreshToken,
    this.responseTypesSupported,
    this.revocationEndpoint,
    this.scopesSupported,
    this.tokenEndpoint,
    this.tokenEndpointAuthMethodsSupported,
    this.userinfoEndpoint,
  });

  factory RegisterOidcConfigTestResponse.fromJson(Map<String, dynamic> json) {
    return RegisterOidcConfigTestResponse(
      authorizationEndpoint: json['authorizationEndpoint'] as String?,
      endSessionEndpoint: json['endSessionEndpoint'] as String?,
      grantTypesSupported: (json['grantTypesSupported'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      issuer: json['issuer'] as String?,
      logoutEndpoint: json['logoutEndpoint'] as String?,
      microsoftMultiRefreshToken: json['microsoftMultiRefreshToken'] as bool?,
      responseTypesSupported: (json['responseTypesSupported'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      revocationEndpoint: json['revocationEndpoint'] as String?,
      scopesSupported: (json['scopesSupported'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      tokenEndpoint: json['tokenEndpoint'] as String?,
      tokenEndpointAuthMethodsSupported:
          (json['tokenEndpointAuthMethodsSupported'] as List?)
              ?.nonNulls
              .map((e) => e as String)
              .toList(),
      userinfoEndpoint: json['userinfoEndpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final authorizationEndpoint = this.authorizationEndpoint;
    final endSessionEndpoint = this.endSessionEndpoint;
    final grantTypesSupported = this.grantTypesSupported;
    final issuer = this.issuer;
    final logoutEndpoint = this.logoutEndpoint;
    final microsoftMultiRefreshToken = this.microsoftMultiRefreshToken;
    final responseTypesSupported = this.responseTypesSupported;
    final revocationEndpoint = this.revocationEndpoint;
    final scopesSupported = this.scopesSupported;
    final tokenEndpoint = this.tokenEndpoint;
    final tokenEndpointAuthMethodsSupported =
        this.tokenEndpointAuthMethodsSupported;
    final userinfoEndpoint = this.userinfoEndpoint;
    return {
      if (authorizationEndpoint != null)
        'authorizationEndpoint': authorizationEndpoint,
      if (endSessionEndpoint != null) 'endSessionEndpoint': endSessionEndpoint,
      if (grantTypesSupported != null)
        'grantTypesSupported': grantTypesSupported,
      if (issuer != null) 'issuer': issuer,
      if (logoutEndpoint != null) 'logoutEndpoint': logoutEndpoint,
      if (microsoftMultiRefreshToken != null)
        'microsoftMultiRefreshToken': microsoftMultiRefreshToken,
      if (responseTypesSupported != null)
        'responseTypesSupported': responseTypesSupported,
      if (revocationEndpoint != null) 'revocationEndpoint': revocationEndpoint,
      if (scopesSupported != null) 'scopesSupported': scopesSupported,
      if (tokenEndpoint != null) 'tokenEndpoint': tokenEndpoint,
      if (tokenEndpointAuthMethodsSupported != null)
        'tokenEndpointAuthMethodsSupported': tokenEndpointAuthMethodsSupported,
      if (userinfoEndpoint != null) 'userinfoEndpoint': userinfoEndpoint,
    };
  }
}

class RegisterOpentdfConfigResponse {
  /// The OIDC client ID used for authenticating with the OpenTDF provider.
  final String clientId;

  /// The OIDC client secret used for authenticating with the OpenTDF provider.
  final String clientSecret;

  /// The domain of the OpenTDF server.
  final String domain;

  /// The provider of the OpenTDF platform.
  final String provider;

  RegisterOpentdfConfigResponse({
    required this.clientId,
    required this.clientSecret,
    required this.domain,
    required this.provider,
  });

  factory RegisterOpentdfConfigResponse.fromJson(Map<String, dynamic> json) {
    return RegisterOpentdfConfigResponse(
      clientId: (json['clientId'] as String?) ?? '',
      clientSecret: (json['clientSecret'] as String?) ?? '',
      domain: (json['domain'] as String?) ?? '',
      provider: (json['provider'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final domain = this.domain;
    final provider = this.provider;
    return {
      'clientId': clientId,
      'clientSecret': clientSecret,
      'domain': domain,
      'provider': provider,
    };
  }
}

class UpdateBotResponse {
  /// A message indicating the result of the bot update operation.
  final String? message;

  UpdateBotResponse({
    this.message,
  });

  factory UpdateBotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateBotResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class UpdateDataRetentionResponse {
  /// A message indicating the result of the update operation.
  final String? message;

  UpdateDataRetentionResponse({
    this.message,
  });

  factory UpdateDataRetentionResponse.fromJson(Map<String, dynamic> json) {
    return UpdateDataRetentionResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class UpdateGuestUserResponse {
  /// A message indicating the result of the update operation.
  final String? message;

  UpdateGuestUserResponse({
    this.message,
  });

  factory UpdateGuestUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateGuestUserResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class UpdateNetworkResponse {
  /// A message indicating that the network was updated successfully.
  final String? message;

  UpdateNetworkResponse({
    this.message,
  });

  factory UpdateNetworkResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkResponse(
      message: json['message'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    return {
      if (message != null) 'message': message,
    };
  }
}

class UpdateNetworkSettingsResponse {
  /// A list of the updated network settings, showing the new values for each
  /// modified setting.
  final List<Setting> settings;

  UpdateNetworkSettingsResponse({
    required this.settings,
  });

  factory UpdateNetworkSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateNetworkSettingsResponse(
      settings: ((json['settings'] as List?) ?? const [])
          .nonNulls
          .map((e) => Setting.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final settings = this.settings;
    return {
      'settings': settings,
    };
  }
}

class UpdateSecurityGroupResponse {
  /// The updated security group details, including the new settings.
  final SecurityGroup securityGroup;

  UpdateSecurityGroupResponse({
    required this.securityGroup,
  });

  factory UpdateSecurityGroupResponse.fromJson(Map<String, dynamic> json) {
    return UpdateSecurityGroupResponse(
      securityGroup: SecurityGroup.fromJson(
          (json['securityGroup'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroup = this.securityGroup;
    return {
      'securityGroup': securityGroup,
    };
  }
}

class UpdateUserResponse {
  /// The ID of the network where the user was updated.
  final String networkId;

  /// Indicates whether the user is suspended after the update.
  final bool suspended;

  /// The unique identifier of the updated user.
  final String userId;

  /// Indicates whether the user can be verified through a custom invite code.
  final bool? codeValidation;

  /// The updated first name of the user.
  final String? firstName;

  /// The updated invite code for the user, if applicable.
  final String? inviteCode;

  /// The expiration time of the user's invite code, specified in epoch seconds.
  final int? inviteExpiration;

  /// The updated last name of the user.
  final String? lastName;

  /// The middle name of the user (currently not used).
  final String? middleName;

  /// The timestamp when the user was last modified, specified in epoch seconds.
  final int? modified;

  /// The list of security group IDs to which the user now belongs after the
  /// update.
  final List<String>? securityGroupIds;

  /// The user's status after the update.
  final int? status;

  UpdateUserResponse({
    required this.networkId,
    required this.suspended,
    required this.userId,
    this.codeValidation,
    this.firstName,
    this.inviteCode,
    this.inviteExpiration,
    this.lastName,
    this.middleName,
    this.modified,
    this.securityGroupIds,
    this.status,
  });

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      networkId: (json['networkId'] as String?) ?? '',
      suspended: (json['suspended'] as bool?) ?? false,
      userId: (json['userId'] as String?) ?? '',
      codeValidation: json['codeValidation'] as bool?,
      firstName: json['firstName'] as String?,
      inviteCode: json['inviteCode'] as String?,
      inviteExpiration: json['inviteExpiration'] as int?,
      lastName: json['lastName'] as String?,
      middleName: json['middleName'] as String?,
      modified: json['modified'] as int?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkId = this.networkId;
    final suspended = this.suspended;
    final userId = this.userId;
    final codeValidation = this.codeValidation;
    final firstName = this.firstName;
    final inviteCode = this.inviteCode;
    final inviteExpiration = this.inviteExpiration;
    final lastName = this.lastName;
    final middleName = this.middleName;
    final modified = this.modified;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    return {
      'networkId': networkId,
      'suspended': suspended,
      'userId': userId,
      if (codeValidation != null) 'codeValidation': codeValidation,
      if (firstName != null) 'firstName': firstName,
      if (inviteCode != null) 'inviteCode': inviteCode,
      if (inviteExpiration != null) 'inviteExpiration': inviteExpiration,
      if (lastName != null) 'lastName': lastName,
      if (middleName != null) 'middleName': middleName,
      if (modified != null) 'modified': modified,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (status != null) 'status': status,
    };
  }
}

/// Contains the modifiable details for updating an existing user, including
/// name, password, security group membership, and invitation settings.
/// <note>
/// A user can only be assigned to a single security group. Attempting to add a
/// user to multiple security groups is not supported and will result in an
/// error.
/// </note>
class UpdateUserDetails {
  /// Indicates whether the user can be verified through a custom invite code.
  final bool? codeValidation;

  /// The new first name for the user.
  final String? firstName;

  /// A new custom invite code for the user.
  final String? inviteCode;

  /// The new time-to-live for the invite code in days.
  final int? inviteCodeTtl;

  /// The new last name for the user.
  final String? lastName;

  /// The updated list of security group IDs to which the user should belong.
  final List<String>? securityGroupIds;

  /// The new username or email address for the user.
  final String? username;

  UpdateUserDetails({
    this.codeValidation,
    this.firstName,
    this.inviteCode,
    this.inviteCodeTtl,
    this.lastName,
    this.securityGroupIds,
    this.username,
  });

  Map<String, dynamic> toJson() {
    final codeValidation = this.codeValidation;
    final firstName = this.firstName;
    final inviteCode = this.inviteCode;
    final inviteCodeTtl = this.inviteCodeTtl;
    final lastName = this.lastName;
    final securityGroupIds = this.securityGroupIds;
    final username = this.username;
    return {
      if (codeValidation != null) 'codeValidation': codeValidation,
      if (firstName != null) 'firstName': firstName,
      if (inviteCode != null) 'inviteCode': inviteCode,
      if (inviteCodeTtl != null) 'inviteCodeTtl': inviteCodeTtl,
      if (lastName != null) 'lastName': lastName,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (username != null) 'username': username,
    };
  }
}

/// Represents a security group in a Wickr network, containing membership
/// statistics, configuration, and all permission settings that apply to its
/// members.
class SecurityGroup {
  /// The number of active user members currently in the security group.
  final int activeMembers;

  /// The number of bot members currently in the security group.
  final int botMembers;

  /// The unique identifier of the security group.
  final String id;

  /// Indicates whether this is the default security group for the network. Each
  /// network has only one default group.
  final bool isDefault;

  /// The timestamp when the security group was last modified, specified in epoch
  /// seconds.
  final int modified;

  /// The human-readable name of the security group.
  final String name;

  /// The comprehensive configuration settings that define capabilities and
  /// restrictions for members of this security group.
  final SecurityGroupSettings securityGroupSettings;

  /// The GUID of the Active Directory group associated with this security group,
  /// if synchronized with LDAP.
  final String? activeDirectoryGuid;

  SecurityGroup({
    required this.activeMembers,
    required this.botMembers,
    required this.id,
    required this.isDefault,
    required this.modified,
    required this.name,
    required this.securityGroupSettings,
    this.activeDirectoryGuid,
  });

  factory SecurityGroup.fromJson(Map<String, dynamic> json) {
    return SecurityGroup(
      activeMembers: (json['activeMembers'] as int?) ?? 0,
      botMembers: (json['botMembers'] as int?) ?? 0,
      id: (json['id'] as String?) ?? '',
      isDefault: (json['isDefault'] as bool?) ?? false,
      modified: (json['modified'] as int?) ?? 0,
      name: (json['name'] as String?) ?? '',
      securityGroupSettings: SecurityGroupSettings.fromJson(
          (json['securityGroupSettings'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      activeDirectoryGuid: json['activeDirectoryGuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeMembers = this.activeMembers;
    final botMembers = this.botMembers;
    final id = this.id;
    final isDefault = this.isDefault;
    final modified = this.modified;
    final name = this.name;
    final securityGroupSettings = this.securityGroupSettings;
    final activeDirectoryGuid = this.activeDirectoryGuid;
    return {
      'activeMembers': activeMembers,
      'botMembers': botMembers,
      'id': id,
      'isDefault': isDefault,
      'modified': modified,
      'name': name,
      'securityGroupSettings': securityGroupSettings,
      if (activeDirectoryGuid != null)
        'activeDirectoryGuid': activeDirectoryGuid,
    };
  }
}

/// Comprehensive configuration settings that define all user capabilities,
/// restrictions, and features for members of a security group. These settings
/// control everything from calling permissions to federation settings to
/// security policies.
class SecurityGroupSettings {
  /// Requires users to reauthenticate every time they return to the application,
  /// providing an additional layer of security.
  final bool? alwaysReauthenticate;

  /// Configuration values for ATAK (Android Team Awareness Kit) package
  /// integration, when ATAK is enabled.
  final List<String>? atakPackageValues;

  /// The calling feature permissions and settings that control what types of
  /// calls users can initiate and participate in.
  final CallingSettings? calling;

  /// Enables automatic checking for Wickr client updates to ensure users stay
  /// current with the latest version.
  final bool? checkForUpdates;

  /// Enables ATAK (Android Team Awareness Kit) integration for tactical
  /// communication and situational awareness.
  final bool? enableAtak;

  /// Allow users to report crashes.
  final bool? enableCrashReports;

  /// Specifies whether users can download files from messages to their devices.
  final bool? enableFileDownload;

  /// Allows users to communicate with guest users from other Wickr networks and
  /// federated external networks.
  final bool? enableGuestFederation;

  /// Enables message preview text in push notifications, allowing users to see
  /// message content before opening the app.
  final bool? enableNotificationPreview;

  /// Allow users to avoid censorship when they are geo-blocked or have network
  /// limitations.
  final bool? enableOpenAccessOption;

  /// Enables restricted global federation, limiting external communication to
  /// only specified permitted networks.
  final bool? enableRestrictedGlobalFederation;

  /// The local federation mode controlling how users can communicate with other
  /// networks. Values: 0 (none), 1 (federated), 2 (restricted).
  final int? federationMode;

  /// Enables file sharing capabilities, allowing users to send and receive files
  /// in conversations.
  final bool? filesEnabled;

  /// Defines the number of failed login attempts before data stored on the device
  /// is reset. Should be less than lockoutThreshold.
  final int? forceDeviceLockout;

  /// Automatically enable and enforce Wickr open access on all devices. Valid
  /// only if enableOpenAccessOption settings is enabled.
  final bool? forceOpenAccess;

  /// Allow user approved bots to read messages in rooms without using a slash
  /// command.
  final bool? forceReadReceipts;

  /// Allows users to communicate with users on other Wickr instances (Wickr
  /// Enterprise) outside the current network.
  final bool? globalFederation;

  /// Enforces a two-factor authentication when a user adds a new device to their
  /// account.
  final bool? isAtoEnabled;

  /// Enables automatic preview of links shared in messages, showing webpage
  /// thumbnails and descriptions.
  final bool? isLinkPreviewEnabled;

  /// Allows map integration in location sharing, enabling users to view shared
  /// locations on interactive maps. Only allowed when location setting is
  /// enabled.
  final bool? locationAllowMaps;

  /// Enables location sharing features, allowing users to share their current
  /// location with others.
  final bool? locationEnabled;

  /// The number of failed password attempts before a user account is locked out.
  final int? lockoutThreshold;

  /// The maximum file size in bytes that will be automatically downloaded without
  /// user confirmation. Only allowed if fileDownload is enabled. Valid Values
  /// [512000 (low_quality), 7340032 (high_quality) ]
  final int? maxAutoDownloadSize;

  /// The maximum burn-on-read (BOR) time in seconds, which determines how long
  /// messages remain visible before auto-deletion after being read.
  final int? maxBor;

  /// Maximum session duration in minutes for non-SSO users. Set to 0 to disable.
  /// Valid range is 60 to 525600 (1 hour to 365 days).
  final int? maxNonSsoSessionMinutes;

  /// The maximum time-to-live (TTL) in seconds for messages, after which they
  /// will be automatically deleted from all devices.
  final int? maxTtl;

  /// Enables message forwarding, allowing users to forward messages from one
  /// conversation to another.
  final bool? messageForwardingEnabled;

  /// The password complexity requirements that users must follow when creating or
  /// changing passwords.
  final PasswordRequirements? passwordRequirements;

  /// A list of network IDs that are permitted for local federation when
  /// federation mode is set to restricted.
  final List<String>? permittedNetworks;

  /// A list of permitted Wickr networks for global federation, restricting
  /// communication to specific approved networks.
  final List<WickrAwsNetworks>? permittedWickrAwsNetworks;

  /// A list of permitted Wickr Enterprise networks for global federation,
  /// restricting communication to specific approved networks.
  final List<PermittedWickrEnterpriseNetwork>? permittedWickrEnterpriseNetworks;

  /// Enables presence indicators that show whether users are online, away, or
  /// offline.
  final bool? presenceEnabled;

  /// A list of pre-defined quick response message templates that users can send
  /// with a single tap.
  final List<String>? quickResponses;

  /// Users will get a master recovery key that can be used to securely sign in to
  /// their Wickr account without having access to their primary device for
  /// authentication. Available in SSO enabled network.
  final bool? showMasterRecoveryKey;

  /// The message shredder configuration that controls secure deletion of messages
  /// and files from devices.
  final ShredderSettings? shredder;

  /// The duration for which users SSO session remains inactive before
  /// automatically logging them out for security. Available in SSO enabled
  /// network.
  final int? ssoMaxIdleMinutes;

  SecurityGroupSettings({
    this.alwaysReauthenticate,
    this.atakPackageValues,
    this.calling,
    this.checkForUpdates,
    this.enableAtak,
    this.enableCrashReports,
    this.enableFileDownload,
    this.enableGuestFederation,
    this.enableNotificationPreview,
    this.enableOpenAccessOption,
    this.enableRestrictedGlobalFederation,
    this.federationMode,
    this.filesEnabled,
    this.forceDeviceLockout,
    this.forceOpenAccess,
    this.forceReadReceipts,
    this.globalFederation,
    this.isAtoEnabled,
    this.isLinkPreviewEnabled,
    this.locationAllowMaps,
    this.locationEnabled,
    this.lockoutThreshold,
    this.maxAutoDownloadSize,
    this.maxBor,
    this.maxNonSsoSessionMinutes,
    this.maxTtl,
    this.messageForwardingEnabled,
    this.passwordRequirements,
    this.permittedNetworks,
    this.permittedWickrAwsNetworks,
    this.permittedWickrEnterpriseNetworks,
    this.presenceEnabled,
    this.quickResponses,
    this.showMasterRecoveryKey,
    this.shredder,
    this.ssoMaxIdleMinutes,
  });

  factory SecurityGroupSettings.fromJson(Map<String, dynamic> json) {
    return SecurityGroupSettings(
      alwaysReauthenticate: json['alwaysReauthenticate'] as bool?,
      atakPackageValues: (json['atakPackageValues'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      calling: json['calling'] != null
          ? CallingSettings.fromJson(json['calling'] as Map<String, dynamic>)
          : null,
      checkForUpdates: json['checkForUpdates'] as bool?,
      enableAtak: json['enableAtak'] as bool?,
      enableCrashReports: json['enableCrashReports'] as bool?,
      enableFileDownload: json['enableFileDownload'] as bool?,
      enableGuestFederation: json['enableGuestFederation'] as bool?,
      enableNotificationPreview: json['enableNotificationPreview'] as bool?,
      enableOpenAccessOption: json['enableOpenAccessOption'] as bool?,
      enableRestrictedGlobalFederation:
          json['enableRestrictedGlobalFederation'] as bool?,
      federationMode: json['federationMode'] as int?,
      filesEnabled: json['filesEnabled'] as bool?,
      forceDeviceLockout: json['forceDeviceLockout'] as int?,
      forceOpenAccess: json['forceOpenAccess'] as bool?,
      forceReadReceipts: json['forceReadReceipts'] as bool?,
      globalFederation: json['globalFederation'] as bool?,
      isAtoEnabled: json['isAtoEnabled'] as bool?,
      isLinkPreviewEnabled: json['isLinkPreviewEnabled'] as bool?,
      locationAllowMaps: json['locationAllowMaps'] as bool?,
      locationEnabled: json['locationEnabled'] as bool?,
      lockoutThreshold: json['lockoutThreshold'] as int?,
      maxAutoDownloadSize: json['maxAutoDownloadSize'] as int?,
      maxBor: json['maxBor'] as int?,
      maxNonSsoSessionMinutes: json['maxNonSsoSessionMinutes'] as int?,
      maxTtl: json['maxTtl'] as int?,
      messageForwardingEnabled: json['messageForwardingEnabled'] as bool?,
      passwordRequirements: json['passwordRequirements'] != null
          ? PasswordRequirements.fromJson(
              json['passwordRequirements'] as Map<String, dynamic>)
          : null,
      permittedNetworks: (json['permittedNetworks'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      permittedWickrAwsNetworks: (json['permittedWickrAwsNetworks'] as List?)
          ?.nonNulls
          .map((e) => WickrAwsNetworks.fromJson(e as Map<String, dynamic>))
          .toList(),
      permittedWickrEnterpriseNetworks:
          (json['permittedWickrEnterpriseNetworks'] as List?)
              ?.nonNulls
              .map((e) => PermittedWickrEnterpriseNetwork.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      presenceEnabled: json['presenceEnabled'] as bool?,
      quickResponses: (json['quickResponses'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      showMasterRecoveryKey: json['showMasterRecoveryKey'] as bool?,
      shredder: json['shredder'] != null
          ? ShredderSettings.fromJson(json['shredder'] as Map<String, dynamic>)
          : null,
      ssoMaxIdleMinutes: json['ssoMaxIdleMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final alwaysReauthenticate = this.alwaysReauthenticate;
    final atakPackageValues = this.atakPackageValues;
    final calling = this.calling;
    final checkForUpdates = this.checkForUpdates;
    final enableAtak = this.enableAtak;
    final enableCrashReports = this.enableCrashReports;
    final enableFileDownload = this.enableFileDownload;
    final enableGuestFederation = this.enableGuestFederation;
    final enableNotificationPreview = this.enableNotificationPreview;
    final enableOpenAccessOption = this.enableOpenAccessOption;
    final enableRestrictedGlobalFederation =
        this.enableRestrictedGlobalFederation;
    final federationMode = this.federationMode;
    final filesEnabled = this.filesEnabled;
    final forceDeviceLockout = this.forceDeviceLockout;
    final forceOpenAccess = this.forceOpenAccess;
    final forceReadReceipts = this.forceReadReceipts;
    final globalFederation = this.globalFederation;
    final isAtoEnabled = this.isAtoEnabled;
    final isLinkPreviewEnabled = this.isLinkPreviewEnabled;
    final locationAllowMaps = this.locationAllowMaps;
    final locationEnabled = this.locationEnabled;
    final lockoutThreshold = this.lockoutThreshold;
    final maxAutoDownloadSize = this.maxAutoDownloadSize;
    final maxBor = this.maxBor;
    final maxNonSsoSessionMinutes = this.maxNonSsoSessionMinutes;
    final maxTtl = this.maxTtl;
    final messageForwardingEnabled = this.messageForwardingEnabled;
    final passwordRequirements = this.passwordRequirements;
    final permittedNetworks = this.permittedNetworks;
    final permittedWickrAwsNetworks = this.permittedWickrAwsNetworks;
    final permittedWickrEnterpriseNetworks =
        this.permittedWickrEnterpriseNetworks;
    final presenceEnabled = this.presenceEnabled;
    final quickResponses = this.quickResponses;
    final showMasterRecoveryKey = this.showMasterRecoveryKey;
    final shredder = this.shredder;
    final ssoMaxIdleMinutes = this.ssoMaxIdleMinutes;
    return {
      if (alwaysReauthenticate != null)
        'alwaysReauthenticate': alwaysReauthenticate,
      if (atakPackageValues != null) 'atakPackageValues': atakPackageValues,
      if (calling != null) 'calling': calling,
      if (checkForUpdates != null) 'checkForUpdates': checkForUpdates,
      if (enableAtak != null) 'enableAtak': enableAtak,
      if (enableCrashReports != null) 'enableCrashReports': enableCrashReports,
      if (enableFileDownload != null) 'enableFileDownload': enableFileDownload,
      if (enableGuestFederation != null)
        'enableGuestFederation': enableGuestFederation,
      if (enableNotificationPreview != null)
        'enableNotificationPreview': enableNotificationPreview,
      if (enableOpenAccessOption != null)
        'enableOpenAccessOption': enableOpenAccessOption,
      if (enableRestrictedGlobalFederation != null)
        'enableRestrictedGlobalFederation': enableRestrictedGlobalFederation,
      if (federationMode != null) 'federationMode': federationMode,
      if (filesEnabled != null) 'filesEnabled': filesEnabled,
      if (forceDeviceLockout != null) 'forceDeviceLockout': forceDeviceLockout,
      if (forceOpenAccess != null) 'forceOpenAccess': forceOpenAccess,
      if (forceReadReceipts != null) 'forceReadReceipts': forceReadReceipts,
      if (globalFederation != null) 'globalFederation': globalFederation,
      if (isAtoEnabled != null) 'isAtoEnabled': isAtoEnabled,
      if (isLinkPreviewEnabled != null)
        'isLinkPreviewEnabled': isLinkPreviewEnabled,
      if (locationAllowMaps != null) 'locationAllowMaps': locationAllowMaps,
      if (locationEnabled != null) 'locationEnabled': locationEnabled,
      if (lockoutThreshold != null) 'lockoutThreshold': lockoutThreshold,
      if (maxAutoDownloadSize != null)
        'maxAutoDownloadSize': maxAutoDownloadSize,
      if (maxBor != null) 'maxBor': maxBor,
      if (maxNonSsoSessionMinutes != null)
        'maxNonSsoSessionMinutes': maxNonSsoSessionMinutes,
      if (maxTtl != null) 'maxTtl': maxTtl,
      if (messageForwardingEnabled != null)
        'messageForwardingEnabled': messageForwardingEnabled,
      if (passwordRequirements != null)
        'passwordRequirements': passwordRequirements,
      if (permittedNetworks != null) 'permittedNetworks': permittedNetworks,
      if (permittedWickrAwsNetworks != null)
        'permittedWickrAwsNetworks': permittedWickrAwsNetworks,
      if (permittedWickrEnterpriseNetworks != null)
        'permittedWickrEnterpriseNetworks': permittedWickrEnterpriseNetworks,
      if (presenceEnabled != null) 'presenceEnabled': presenceEnabled,
      if (quickResponses != null) 'quickResponses': quickResponses,
      if (showMasterRecoveryKey != null)
        'showMasterRecoveryKey': showMasterRecoveryKey,
      if (shredder != null) 'shredder': shredder,
      if (ssoMaxIdleMinutes != null) 'ssoMaxIdleMinutes': ssoMaxIdleMinutes,
    };
  }
}

/// Defines the calling feature permissions and settings for users in a security
/// group, controlling what types of calls users can initiate and participate
/// in.
class CallingSettings {
  /// Specifies whether users can start one-to-one calls.
  final bool? canStart11Call;

  /// Specifies whether users can make video calls (as opposed to audio-only
  /// calls). Valid only when audio call(canStart11Call) is enabled.
  final bool? canVideoCall;

  /// When enabled, forces all calls to use TCP protocol instead of UDP for
  /// network traversal.
  final bool? forceTcpCall;

  CallingSettings({
    this.canStart11Call,
    this.canVideoCall,
    this.forceTcpCall,
  });

  factory CallingSettings.fromJson(Map<String, dynamic> json) {
    return CallingSettings(
      canStart11Call: json['canStart11Call'] as bool?,
      canVideoCall: json['canVideoCall'] as bool?,
      forceTcpCall: json['forceTcpCall'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final canStart11Call = this.canStart11Call;
    final canVideoCall = this.canVideoCall;
    final forceTcpCall = this.forceTcpCall;
    return {
      if (canStart11Call != null) 'canStart11Call': canStart11Call,
      if (canVideoCall != null) 'canVideoCall': canVideoCall,
      if (forceTcpCall != null) 'forceTcpCall': forceTcpCall,
    };
  }
}

/// Defines password complexity requirements for users in a security group,
/// including minimum length and character type requirements.
class PasswordRequirements {
  /// The minimum number of lowercase letters required in passwords.
  final int? lowercase;

  /// The minimum password length in characters.
  final int? minLength;

  /// The minimum number of numeric characters required in passwords.
  final int? numbers;

  /// The minimum number of special symbol characters required in passwords.
  final int? symbols;

  /// The minimum number of uppercase letters required in passwords.
  final int? uppercase;

  PasswordRequirements({
    this.lowercase,
    this.minLength,
    this.numbers,
    this.symbols,
    this.uppercase,
  });

  factory PasswordRequirements.fromJson(Map<String, dynamic> json) {
    return PasswordRequirements(
      lowercase: json['lowercase'] as int?,
      minLength: json['minLength'] as int?,
      numbers: json['numbers'] as int?,
      symbols: json['symbols'] as int?,
      uppercase: json['uppercase'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final lowercase = this.lowercase;
    final minLength = this.minLength;
    final numbers = this.numbers;
    final symbols = this.symbols;
    final uppercase = this.uppercase;
    return {
      if (lowercase != null) 'lowercase': lowercase,
      if (minLength != null) 'minLength': minLength,
      if (numbers != null) 'numbers': numbers,
      if (symbols != null) 'symbols': symbols,
      if (uppercase != null) 'uppercase': uppercase,
    };
  }
}

/// Configuration for the Wickr shredder feature, which writes random data over
/// free memory and disk space on client devices. You can configure your Wickr
/// shredder intensity using the parameters below.
/// <note>
/// Secure Shredder will not write over files that are permanently stored on the
/// device or saved outside of the Wickr client. Wickr Network Administrators
/// are able to disable file downloads within Security Group Settings.
/// </note>
class ShredderSettings {
  /// Specifies whether users can manually trigger the shredder to delete content.
  final bool? canProcessManually;

  /// Controls the rate (MB/minute) at which the shredder function runs on
  /// clients. Valid Values: Must be one of [0, 20, 60, 100].
  /// <note>
  /// A higher intensity setting could lead to higher battery usage on mobile
  /// devices.
  /// </note>
  final int? intensity;

  ShredderSettings({
    this.canProcessManually,
    this.intensity,
  });

  factory ShredderSettings.fromJson(Map<String, dynamic> json) {
    return ShredderSettings(
      canProcessManually: json['canProcessManually'] as bool?,
      intensity: json['intensity'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final canProcessManually = this.canProcessManually;
    final intensity = this.intensity;
    return {
      if (canProcessManually != null) 'canProcessManually': canProcessManually,
      if (intensity != null) 'intensity': intensity,
    };
  }
}

/// Identifies a Wickr enterprise network that is permitted for global
/// federation, allowing users to communicate with members of the specified
/// network.
class PermittedWickrEnterpriseNetwork {
  /// The domain identifier for the permitted Wickr enterprise network.
  final String domain;

  /// The network ID of the permitted Wickr enterprise network.
  final String networkId;

  PermittedWickrEnterpriseNetwork({
    required this.domain,
    required this.networkId,
  });

  factory PermittedWickrEnterpriseNetwork.fromJson(Map<String, dynamic> json) {
    return PermittedWickrEnterpriseNetwork(
      domain: (json['domain'] as String?) ?? '',
      networkId: (json['networkId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final domain = this.domain;
    final networkId = this.networkId;
    return {
      'domain': domain,
      'networkId': networkId,
    };
  }
}

/// Identifies a Amazon Web Services Wickr network by region and network ID,
/// used for configuring permitted networks for global federation.
class WickrAwsNetworks {
  /// The network ID of the Wickr Amazon Web Services network.
  final String networkId;

  /// The Amazon Web Services region identifier where the network is hosted (e.g.,
  /// 'us-east-1').
  final String region;

  WickrAwsNetworks({
    required this.networkId,
    required this.region,
  });

  factory WickrAwsNetworks.fromJson(Map<String, dynamic> json) {
    return WickrAwsNetworks(
      networkId: (json['networkId'] as String?) ?? '',
      region: (json['region'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final networkId = this.networkId;
    final region = this.region;
    return {
      'networkId': networkId,
      'region': region,
    };
  }
}

/// Represents a single network-level configuration setting with its name,
/// value, and data type. Settings control network-wide behaviors and features.
class Setting {
  /// The name of the network setting (e.g., 'enableClientMetrics',
  /// 'dataRetention').
  final String optionName;

  /// The data type of the setting value (e.g., 'boolean', 'string', 'number').
  final String type;

  /// The current value of the setting as a string. Boolean values are represented
  /// as 'true' or 'false'.
  final String value;

  Setting({
    required this.optionName,
    required this.type,
    required this.value,
  });

  factory Setting.fromJson(Map<String, dynamic> json) {
    return Setting(
      optionName: (json['optionName'] as String?) ?? '',
      type: (json['type'] as String?) ?? '',
      value: (json['value'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final optionName = this.optionName;
    final type = this.type;
    final value = this.value;
    return {
      'optionName': optionName,
      'type': type,
      'value': value,
    };
  }
}

/// Contains network-level configuration settings that apply to all users and
/// security groups within a Wickr network.
class NetworkSettings {
  /// Consent popup configuration for the network, displayed to users on login.
  final ConsentPopupConfig? consentPopup;

  /// Indicates whether the data retention feature is enabled for the network.
  /// When true, messages are captured by the data retention bot for compliance
  /// and archiving purposes.
  final bool? dataRetention;

  /// Allows Wickr clients to send anonymized performance and usage metrics to the
  /// Wickr backend server for service improvement and troubleshooting.
  final bool? enableClientMetrics;

  /// Configuration for OpenTDF integration at the network level, enforcing ABAC
  /// decision making when operating in TDF enabled rooms.
  final bool? enableTrustedDataFormat;

  /// Configuration for read receipts at the network level, controlling the
  /// default behavior for whether senders can see when their messages have been
  /// read.
  final ReadReceiptConfig? readReceiptConfig;

  NetworkSettings({
    this.consentPopup,
    this.dataRetention,
    this.enableClientMetrics,
    this.enableTrustedDataFormat,
    this.readReceiptConfig,
  });

  Map<String, dynamic> toJson() {
    final consentPopup = this.consentPopup;
    final dataRetention = this.dataRetention;
    final enableClientMetrics = this.enableClientMetrics;
    final enableTrustedDataFormat = this.enableTrustedDataFormat;
    final readReceiptConfig = this.readReceiptConfig;
    return {
      if (consentPopup != null) 'consentPopup': consentPopup,
      if (dataRetention != null) 'dataRetention': dataRetention,
      if (enableClientMetrics != null)
        'enableClientMetrics': enableClientMetrics,
      if (enableTrustedDataFormat != null)
        'enableTrustedDataFormat': enableTrustedDataFormat,
      if (readReceiptConfig != null) 'readReceiptConfig': readReceiptConfig,
    };
  }
}

/// Configuration for read receipts at the network level, controlling whether
/// senders can see when their messages have been read.
class ReadReceiptConfig {
  /// The read receipt status mode for the network.
  final Status? status;

  ReadReceiptConfig({
    this.status,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    return {
      if (status != null) 'status': status.value,
    };
  }
}

/// Consent popup configuration displayed to users on login.
class ConsentPopupConfig {
  /// Whether the consent popup is enabled. When set to true, the popup is
  /// displayed to users on login.
  final bool enabled;

  /// Label for the close button on the consent popup. Maximum 20 characters.
  /// Defaults to "Acknowledge" if not provided.
  final String? closeButtonLabel;

  /// Body content of the consent popup in Markdown format. Maximum 5000
  /// characters.
  final String? content;

  /// Header text displayed at the top of the consent popup. Maximum 100
  /// characters.
  final String? header;

  ConsentPopupConfig({
    required this.enabled,
    this.closeButtonLabel,
    this.content,
    this.header,
  });

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final closeButtonLabel = this.closeButtonLabel;
    final content = this.content;
    final header = this.header;
    return {
      'enabled': enabled,
      if (closeButtonLabel != null) 'closeButtonLabel': closeButtonLabel,
      if (content != null) 'content': content,
      if (header != null) 'header': header,
    };
  }
}

class Status {
  static const disabled = Status._('DISABLED');
  static const enabled = Status._('ENABLED');
  static const forceEnabled = Status._('FORCE_ENABLED');

  final String value;

  const Status._(this.value);

  static const values = [disabled, enabled, forceEnabled];

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Status._(value));

  @override
  bool operator ==(other) => other is Status && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class DataRetentionActionType {
  static const enable = DataRetentionActionType._('ENABLE');
  static const disable = DataRetentionActionType._('DISABLE');
  static const pubkeyMsgAck = DataRetentionActionType._('PUBKEY_MSG_ACK');

  final String value;

  const DataRetentionActionType._(this.value);

  static const values = [enable, disable, pubkeyMsgAck];

  static DataRetentionActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DataRetentionActionType._(value));

  @override
  bool operator ==(other) =>
      other is DataRetentionActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a user account in a Wickr network with detailed profile
/// information, status, security settings, and authentication details.
/// <note>
/// codeValidation, inviteCode and inviteCodeTtl are restricted to networks
/// under preview only.
/// </note>
class User {
  /// The phone number minus country code, used for cloud deployments.
  final String? cell;

  /// The number of failed password attempts for enterprise deployments, used for
  /// account lockout policies.
  final int? challengeFailures;

  /// Indicates whether the user can be verified through a custom invite code.
  final bool? codeValidation;

  /// The country code for the user's phone number, used for cloud deployments.
  final String? countryCode;

  /// The first name of the user.
  final String? firstName;

  /// The invitation code for this user, used during registration to join the
  /// network.
  final String? inviteCode;

  /// Indicates whether the user has administrator privileges in the network.
  final bool? isAdmin;

  /// Indicates whether the user's email invitation code has expired, applicable
  /// to cloud deployments.
  final bool? isInviteExpired;

  /// Indicates whether this account is a user (as opposed to a bot or other
  /// account type).
  final bool? isUser;

  /// The last name of the user.
  final String? lastName;

  /// Indicates whether one-time password (OTP) authentication is enabled for the
  /// user.
  final bool? otpEnabled;

  /// The SCIM (System for Cross-domain Identity Management) identifier for the
  /// user, used for identity synchronization. Currently not used.
  final String? scimId;

  /// A list of security group IDs to which the user is assigned, determining
  /// their permissions and feature access.
  final List<String>? securityGroups;

  /// The current status of the user (1 for pending invitation, 2 for active).
  final int? status;

  /// Indicates whether the user is currently suspended and unable to access the
  /// network.
  final bool? suspended;

  /// The descriptive type of the user account (e.g., 'user').
  final String? type;

  /// The unique identifier for the user.
  final String? uname;

  /// The unique identifier for the user within the network.
  final String? userId;

  /// The email address or username of the user. For bots, this must end in 'bot'.
  final String? username;

  User({
    this.cell,
    this.challengeFailures,
    this.codeValidation,
    this.countryCode,
    this.firstName,
    this.inviteCode,
    this.isAdmin,
    this.isInviteExpired,
    this.isUser,
    this.lastName,
    this.otpEnabled,
    this.scimId,
    this.securityGroups,
    this.status,
    this.suspended,
    this.type,
    this.uname,
    this.userId,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cell: json['cell'] as String?,
      challengeFailures: json['challengeFailures'] as int?,
      codeValidation: json['codeValidation'] as bool?,
      countryCode: json['countryCode'] as String?,
      firstName: json['firstName'] as String?,
      inviteCode: json['inviteCode'] as String?,
      isAdmin: json['isAdmin'] as bool?,
      isInviteExpired: json['isInviteExpired'] as bool?,
      isUser: json['isUser'] as bool?,
      lastName: json['lastName'] as String?,
      otpEnabled: json['otpEnabled'] as bool?,
      scimId: json['scimId'] as String?,
      securityGroups: (json['securityGroups'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      status: json['status'] as int?,
      suspended: json['suspended'] as bool?,
      type: json['type'] as String?,
      uname: json['uname'] as String?,
      userId: json['userId'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cell = this.cell;
    final challengeFailures = this.challengeFailures;
    final codeValidation = this.codeValidation;
    final countryCode = this.countryCode;
    final firstName = this.firstName;
    final inviteCode = this.inviteCode;
    final isAdmin = this.isAdmin;
    final isInviteExpired = this.isInviteExpired;
    final isUser = this.isUser;
    final lastName = this.lastName;
    final otpEnabled = this.otpEnabled;
    final scimId = this.scimId;
    final securityGroups = this.securityGroups;
    final status = this.status;
    final suspended = this.suspended;
    final type = this.type;
    final uname = this.uname;
    final userId = this.userId;
    final username = this.username;
    return {
      if (cell != null) 'cell': cell,
      if (challengeFailures != null) 'challengeFailures': challengeFailures,
      if (codeValidation != null) 'codeValidation': codeValidation,
      if (countryCode != null) 'countryCode': countryCode,
      if (firstName != null) 'firstName': firstName,
      if (inviteCode != null) 'inviteCode': inviteCode,
      if (isAdmin != null) 'isAdmin': isAdmin,
      if (isInviteExpired != null) 'isInviteExpired': isInviteExpired,
      if (isUser != null) 'isUser': isUser,
      if (lastName != null) 'lastName': lastName,
      if (otpEnabled != null) 'otpEnabled': otpEnabled,
      if (scimId != null) 'scimId': scimId,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (status != null) 'status': status,
      if (suspended != null) 'suspended': suspended,
      if (type != null) 'type': type,
      if (uname != null) 'uname': uname,
      if (userId != null) 'userId': userId,
      if (username != null) 'username': username,
    };
  }
}

class SortDirection {
  static const asc = SortDirection._('ASC');
  static const desc = SortDirection._('DESC');

  final String value;

  const SortDirection._(this.value);

  static const values = [asc, desc];

  static SortDirection fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => SortDirection._(value));

  @override
  bool operator ==(other) => other is SortDirection && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a Wickr network with all its configuration and status
/// information.
class Network {
  /// The access level of the network (STANDARD or PREMIUM), which determines
  /// available features and capabilities.
  final AccessLevel accessLevel;

  /// The Amazon Web Services account ID that owns the network.
  final String awsAccountId;

  /// The Amazon Resource Name (ARN) of the network.
  final String networkArn;

  /// The unique identifier of the network.
  final String networkId;

  /// The name of the network.
  final String networkName;

  /// The ARN of the Amazon Web Services KMS customer managed key used for
  /// encrypting sensitive data in the network.
  final String? encryptionKeyArn;

  /// The expiration date and time for the network's free trial period, if
  /// applicable.
  final String? freeTrialExpiration;

  /// The SSO redirect URI migration state, managed by the SSO redirect migration
  /// wizard. Values: 0 (not started), 1 (in progress), or 2 (completed).
  final int? migrationState;

  /// The current standing or status of the network.
  final int? standing;

  Network({
    required this.accessLevel,
    required this.awsAccountId,
    required this.networkArn,
    required this.networkId,
    required this.networkName,
    this.encryptionKeyArn,
    this.freeTrialExpiration,
    this.migrationState,
    this.standing,
  });

  factory Network.fromJson(Map<String, dynamic> json) {
    return Network(
      accessLevel:
          AccessLevel.fromString((json['accessLevel'] as String?) ?? ''),
      awsAccountId: (json['awsAccountId'] as String?) ?? '',
      networkArn: (json['networkArn'] as String?) ?? '',
      networkId: (json['networkId'] as String?) ?? '',
      networkName: (json['networkName'] as String?) ?? '',
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      freeTrialExpiration: json['freeTrialExpiration'] as String?,
      migrationState: json['migrationState'] as int?,
      standing: json['standing'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessLevel = this.accessLevel;
    final awsAccountId = this.awsAccountId;
    final networkArn = this.networkArn;
    final networkId = this.networkId;
    final networkName = this.networkName;
    final encryptionKeyArn = this.encryptionKeyArn;
    final freeTrialExpiration = this.freeTrialExpiration;
    final migrationState = this.migrationState;
    final standing = this.standing;
    return {
      'accessLevel': accessLevel.value,
      'awsAccountId': awsAccountId,
      'networkArn': networkArn,
      'networkId': networkId,
      'networkName': networkName,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (freeTrialExpiration != null)
        'freeTrialExpiration': freeTrialExpiration,
      if (migrationState != null) 'migrationState': migrationState,
      if (standing != null) 'standing': standing,
    };
  }
}

class AccessLevel {
  static const standard = AccessLevel._('STANDARD');
  static const premium = AccessLevel._('PREMIUM');

  final String value;

  const AccessLevel._(this.value);

  static const values = [standard, premium];

  static AccessLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => AccessLevel._(value));

  @override
  bool operator ==(other) => other is AccessLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a guest user who has accessed the network from a federated Wickr
/// network.
class GuestUser {
  /// The billing period when this guest user accessed the network (e.g.,
  /// '2024-01').
  final String billingPeriod;

  /// The username of the guest user.
  final String username;

  /// The unique username hash identifier for the guest user.
  final String usernameHash;

  GuestUser({
    required this.billingPeriod,
    required this.username,
    required this.usernameHash,
  });

  factory GuestUser.fromJson(Map<String, dynamic> json) {
    return GuestUser(
      billingPeriod: (json['billingPeriod'] as String?) ?? '',
      username: (json['username'] as String?) ?? '',
      usernameHash: (json['usernameHash'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final billingPeriod = this.billingPeriod;
    final username = this.username;
    final usernameHash = this.usernameHash;
    return {
      'billingPeriod': billingPeriod,
      'username': username,
      'usernameHash': usernameHash,
    };
  }
}

/// Represents a device where a user has logged into Wickr, containing
/// information about the device's type, status, and login history.
class BasicDeviceObject {
  /// The unique application ID for the Wickr app on this device.
  final String? appId;

  /// The timestamp when the device first appeared in the Wickr database.
  final String? created;

  /// The timestamp when the device last successfully logged into Wickr. This is
  /// also used to determine SSO idle time.
  final String? lastLogin;

  /// The current status of the device, either 'Active' or 'Reset' depending on
  /// whether the device is currently active or has been marked for reset.
  final String? statusText;

  /// Indicates whether the device is suspended.
  final bool? suspend;

  /// The operating system of the device (e.g., 'MacOSX', 'Windows', 'iOS',
  /// 'Android').
  final String? type;

  BasicDeviceObject({
    this.appId,
    this.created,
    this.lastLogin,
    this.statusText,
    this.suspend,
    this.type,
  });

  factory BasicDeviceObject.fromJson(Map<String, dynamic> json) {
    return BasicDeviceObject(
      appId: json['appId'] as String?,
      created: json['created'] as String?,
      lastLogin: json['lastLogin'] as String?,
      statusText: json['statusText'] as String?,
      suspend: json['suspend'] as bool?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final created = this.created;
    final lastLogin = this.lastLogin;
    final statusText = this.statusText;
    final suspend = this.suspend;
    final type = this.type;
    return {
      if (appId != null) 'appId': appId,
      if (created != null) 'created': created,
      if (lastLogin != null) 'lastLogin': lastLogin,
      if (statusText != null) 'statusText': statusText,
      if (suspend != null) 'suspend': suspend,
      if (type != null) 'type': type,
    };
  }
}

/// Represents a bot account in a Wickr network with all its informational
/// fields.
class Bot {
  /// The unique identifier of the bot.
  final String? botId;

  /// The display name of the bot that is visible to users.
  final String? displayName;

  /// The ID of the security group to which the bot belongs.
  final String? groupId;

  /// Indicates whether the bot has a password set.
  final bool? hasChallenge;

  /// The timestamp of the bot's last login.
  final String? lastLogin;

  /// The public key of the bot used for encryption.
  final String? pubkey;

  /// The current status of the bot (1 for pending, 2 for active).
  final int? status;

  /// Indicates whether the bot is currently suspended.
  final bool? suspended;

  /// The unique username hash identifier for the bot.
  final String? uname;

  /// The username of the bot.
  final String? username;

  Bot({
    this.botId,
    this.displayName,
    this.groupId,
    this.hasChallenge,
    this.lastLogin,
    this.pubkey,
    this.status,
    this.suspended,
    this.uname,
    this.username,
  });

  factory Bot.fromJson(Map<String, dynamic> json) {
    return Bot(
      botId: json['botId'] as String?,
      displayName: json['displayName'] as String?,
      groupId: json['groupId'] as String?,
      hasChallenge: json['hasChallenge'] as bool?,
      lastLogin: json['lastLogin'] as String?,
      pubkey: json['pubkey'] as String?,
      status: json['status'] as int?,
      suspended: json['suspended'] as bool?,
      uname: json['uname'] as String?,
      username: json['username'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final botId = this.botId;
    final displayName = this.displayName;
    final groupId = this.groupId;
    final hasChallenge = this.hasChallenge;
    final lastLogin = this.lastLogin;
    final pubkey = this.pubkey;
    final status = this.status;
    final suspended = this.suspended;
    final uname = this.uname;
    final username = this.username;
    return {
      if (botId != null) 'botId': botId,
      if (displayName != null) 'displayName': displayName,
      if (groupId != null) 'groupId': groupId,
      if (hasChallenge != null) 'hasChallenge': hasChallenge,
      if (lastLogin != null) 'lastLogin': lastLogin,
      if (pubkey != null) 'pubkey': pubkey,
      if (status != null) 'status': status,
      if (suspended != null) 'suspended': suspended,
      if (uname != null) 'uname': uname,
      if (username != null) 'username': username,
    };
  }
}

/// Represents a guest user who has been blocked from accessing a Wickr network.
class BlockedGuestUser {
  /// The username of the administrator who blocked this guest user.
  final String admin;

  /// The timestamp when the guest user was blocked or last modified.
  final String modified;

  /// The username of the blocked guest user.
  final String username;

  /// The unique username hash identifier for the blocked guest user.
  final String usernameHash;

  BlockedGuestUser({
    required this.admin,
    required this.modified,
    required this.username,
    required this.usernameHash,
  });

  factory BlockedGuestUser.fromJson(Map<String, dynamic> json) {
    return BlockedGuestUser(
      admin: (json['admin'] as String?) ?? '',
      modified: (json['modified'] as String?) ?? '',
      username: (json['username'] as String?) ?? '',
      usernameHash: (json['usernameHash'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final admin = this.admin;
    final modified = this.modified;
    final username = this.username;
    final usernameHash = this.usernameHash;
    return {
      'admin': admin,
      'modified': modified,
      'username': username,
      'usernameHash': usernameHash,
    };
  }
}

/// Contains the OpenID Connect (OIDC) configuration information for Single
/// Sign-On (SSO) authentication, including identity provider settings and
/// client credentials.
class OidcConfigInfo {
  /// Custom identifier your end users will use to sign in with SSO.
  final String companyId;

  /// The issuer URL of the identity provider, which serves as the base URL for
  /// OIDC endpoints and configuration discovery.
  final String issuer;

  /// The OAuth scopes requested from the identity provider, which determine what
  /// user information is accessible (e.g., 'openid profile email').
  final String scopes;

  /// The unique identifier for the registered OIDC application. Valid range is
  /// 1-10.
  final int? applicationId;

  /// The name of the OIDC application as registered with the identity provider.
  final String? applicationName;

  /// The X.509 CA certificate for validating SSL/TLS connections to the identity
  /// provider when using self-signed or enterprise certificates.
  final String? caCertificate;

  /// The OAuth client ID assigned by the identity provider for authentication
  /// requests.
  final String? clientId;

  /// The OAuth client secret used to authenticate the application with the
  /// identity provider.
  final String? clientSecret;

  /// A custom field mapping to extract the username from the OIDC token when the
  /// standard username claim is insufficient.
  final String? customUsername;

  /// Additional authentication parameters to include in the OIDC authorization
  /// request as a query string. Useful for provider-specific extensions.
  final String? extraAuthParams;

  /// The callback URL where the identity provider redirects users after
  /// successful authentication. This URL must be registered with the identity
  /// provider.
  final String? redirectUrl;

  /// An additional secret credential used by the identity provider for
  /// authentication.
  final String? secret;

  /// The grace period in minutes before the SSO token expires when the system
  /// should proactively refresh the token to maintain seamless user access.
  final int? ssoTokenBufferMinutes;

  /// The claim field from the OIDC token to use as the unique user identifier
  /// (e.g., 'email', 'sub', or a custom claim).
  final String? userId;

  OidcConfigInfo({
    required this.companyId,
    required this.issuer,
    required this.scopes,
    this.applicationId,
    this.applicationName,
    this.caCertificate,
    this.clientId,
    this.clientSecret,
    this.customUsername,
    this.extraAuthParams,
    this.redirectUrl,
    this.secret,
    this.ssoTokenBufferMinutes,
    this.userId,
  });

  factory OidcConfigInfo.fromJson(Map<String, dynamic> json) {
    return OidcConfigInfo(
      companyId: (json['companyId'] as String?) ?? '',
      issuer: (json['issuer'] as String?) ?? '',
      scopes: (json['scopes'] as String?) ?? '',
      applicationId: json['applicationId'] as int?,
      applicationName: json['applicationName'] as String?,
      caCertificate: json['caCertificate'] as String?,
      clientId: json['clientId'] as String?,
      clientSecret: json['clientSecret'] as String?,
      customUsername: json['customUsername'] as String?,
      extraAuthParams: json['extraAuthParams'] as String?,
      redirectUrl: json['redirectUrl'] as String?,
      secret: json['secret'] as String?,
      ssoTokenBufferMinutes: json['ssoTokenBufferMinutes'] as int?,
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final companyId = this.companyId;
    final issuer = this.issuer;
    final scopes = this.scopes;
    final applicationId = this.applicationId;
    final applicationName = this.applicationName;
    final caCertificate = this.caCertificate;
    final clientId = this.clientId;
    final clientSecret = this.clientSecret;
    final customUsername = this.customUsername;
    final extraAuthParams = this.extraAuthParams;
    final redirectUrl = this.redirectUrl;
    final secret = this.secret;
    final ssoTokenBufferMinutes = this.ssoTokenBufferMinutes;
    final userId = this.userId;
    return {
      'companyId': companyId,
      'issuer': issuer,
      'scopes': scopes,
      if (applicationId != null) 'applicationId': applicationId,
      if (applicationName != null) 'applicationName': applicationName,
      if (caCertificate != null) 'caCertificate': caCertificate,
      if (clientId != null) 'clientId': clientId,
      if (clientSecret != null) 'clientSecret': clientSecret,
      if (customUsername != null) 'customUsername': customUsername,
      if (extraAuthParams != null) 'extraAuthParams': extraAuthParams,
      if (redirectUrl != null) 'redirectUrl': redirectUrl,
      if (secret != null) 'secret': secret,
      if (ssoTokenBufferMinutes != null)
        'ssoTokenBufferMinutes': ssoTokenBufferMinutes,
      if (userId != null) 'userId': userId,
    };
  }
}

/// Contains OAuth token information returned from the identity provider,
/// including access tokens, ID tokens, and PKCE parameters used for secure
/// authentication.
class OidcTokenInfo {
  /// The OAuth access token that can be used to access protected resources on
  /// behalf of the authenticated user.
  final String? accessToken;

  /// The PKCE code challenge, a transformed version of the code verifier sent
  /// during the authorization request for verification.
  final String? codeChallenge;

  /// The PKCE (Proof Key for Code Exchange) code verifier, a cryptographically
  /// random string used to enhance security in the OAuth flow.
  final String? codeVerifier;

  /// The lifetime of the access token in seconds, indicating when the token will
  /// expire and need to be refreshed.
  final int? expiresIn;

  /// The OpenID Connect ID token containing user identity information and
  /// authentication context as a signed JWT.
  final String? idToken;

  /// The OAuth refresh token that can be used to obtain new access tokens without
  /// requiring the user to re-authenticate.
  final String? refreshToken;

  /// The type of access token issued, typically 'Bearer', which indicates how the
  /// token should be used in API requests.
  final String? tokenType;

  OidcTokenInfo({
    this.accessToken,
    this.codeChallenge,
    this.codeVerifier,
    this.expiresIn,
    this.idToken,
    this.refreshToken,
    this.tokenType,
  });

  factory OidcTokenInfo.fromJson(Map<String, dynamic> json) {
    return OidcTokenInfo(
      accessToken: json['accessToken'] as String?,
      codeChallenge: json['codeChallenge'] as String?,
      codeVerifier: json['codeVerifier'] as String?,
      expiresIn: json['expiresIn'] as int?,
      idToken: json['idToken'] as String?,
      refreshToken: json['refreshToken'] as String?,
      tokenType: json['tokenType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accessToken = this.accessToken;
    final codeChallenge = this.codeChallenge;
    final codeVerifier = this.codeVerifier;
    final expiresIn = this.expiresIn;
    final idToken = this.idToken;
    final refreshToken = this.refreshToken;
    final tokenType = this.tokenType;
    return {
      if (accessToken != null) 'accessToken': accessToken,
      if (codeChallenge != null) 'codeChallenge': codeChallenge,
      if (codeVerifier != null) 'codeVerifier': codeVerifier,
      if (expiresIn != null) 'expiresIn': expiresIn,
      if (idToken != null) 'idToken': idToken,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (tokenType != null) 'tokenType': tokenType,
    };
  }
}

/// Contains the count of guest users for a specific billing period, used for
/// tracking historical guest user activity.
class GuestUserHistoryCount {
  /// The number of guest users who have communicated with your Wickr network
  /// during this billing period.
  final String count;

  /// The month and billing period in YYYY_MM format (e.g., '2024_01').
  final String month;

  GuestUserHistoryCount({
    required this.count,
    required this.month,
  });

  factory GuestUserHistoryCount.fromJson(Map<String, dynamic> json) {
    return GuestUserHistoryCount(
      count: (json['count'] as String?) ?? '',
      month: (json['month'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final count = this.count;
    final month = this.month;
    return {
      'count': count,
      'month': month,
    };
  }
}

/// Contains the security group configuration settings that can be specified
/// when creating or updating a security group. This is a subset of
/// SecurityGroupSettings containing only the modifiable federation and security
/// settings.
class SecurityGroupSettingsRequest {
  /// Guest users let you work with people outside your organization that only
  /// have limited access to Wickr. Only valid when federationMode is set to
  /// Global.
  final bool? enableGuestFederation;

  /// Enables restricted global federation to limit communication to specific
  /// permitted networks only. Requires globalFederation to be enabled.
  final bool? enableRestrictedGlobalFederation;

  /// The local federation mode. Values: 0 (none), 1 (federated - all networks), 2
  /// (restricted - only permitted networks).
  final int? federationMode;

  /// Allow users to securely federate with all Amazon Web Services Wickr networks
  /// and Amazon Web Services Enterprise networks.
  final bool? globalFederation;

  /// The number of failed password attempts before a user account is locked out.
  final int? lockoutThreshold;

  /// A list of network IDs that are permitted for local federation when
  /// federation mode is set to restricted.
  final List<String>? permittedNetworks;

  /// A list of permitted Amazon Web Services Wickr networks for restricted global
  /// federation.
  final List<WickrAwsNetworks>? permittedWickrAwsNetworks;

  /// A list of permitted Wickr Enterprise networks for restricted global
  /// federation.
  final List<PermittedWickrEnterpriseNetwork>? permittedWickrEnterpriseNetworks;

  SecurityGroupSettingsRequest({
    this.enableGuestFederation,
    this.enableRestrictedGlobalFederation,
    this.federationMode,
    this.globalFederation,
    this.lockoutThreshold,
    this.permittedNetworks,
    this.permittedWickrAwsNetworks,
    this.permittedWickrEnterpriseNetworks,
  });

  Map<String, dynamic> toJson() {
    final enableGuestFederation = this.enableGuestFederation;
    final enableRestrictedGlobalFederation =
        this.enableRestrictedGlobalFederation;
    final federationMode = this.federationMode;
    final globalFederation = this.globalFederation;
    final lockoutThreshold = this.lockoutThreshold;
    final permittedNetworks = this.permittedNetworks;
    final permittedWickrAwsNetworks = this.permittedWickrAwsNetworks;
    final permittedWickrEnterpriseNetworks =
        this.permittedWickrEnterpriseNetworks;
    return {
      if (enableGuestFederation != null)
        'enableGuestFederation': enableGuestFederation,
      if (enableRestrictedGlobalFederation != null)
        'enableRestrictedGlobalFederation': enableRestrictedGlobalFederation,
      if (federationMode != null) 'federationMode': federationMode,
      if (globalFederation != null) 'globalFederation': globalFederation,
      if (lockoutThreshold != null) 'lockoutThreshold': lockoutThreshold,
      if (permittedNetworks != null) 'permittedNetworks': permittedNetworks,
      if (permittedWickrAwsNetworks != null)
        'permittedWickrAwsNetworks': permittedWickrAwsNetworks,
      if (permittedWickrEnterpriseNetworks != null)
        'permittedWickrEnterpriseNetworks': permittedWickrEnterpriseNetworks,
    };
  }
}

/// Contains error information for a user operation that failed in a batch user
/// request.
class BatchUserErrorResponseItem {
  /// The user ID associated with the failed operation.
  final String userId;

  /// The field that caused the error.
  final String? field;

  /// A description of why the user operation failed.
  final String? reason;

  BatchUserErrorResponseItem({
    required this.userId,
    this.field,
    this.reason,
  });

  factory BatchUserErrorResponseItem.fromJson(Map<String, dynamic> json) {
    return BatchUserErrorResponseItem(
      userId: (json['userId'] as String?) ?? '',
      field: json['field'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    final field = this.field;
    final reason = this.reason;
    return {
      'userId': userId,
      if (field != null) 'field': field,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Contains information about a user that was successfully processed in a batch
/// user operation.
class BatchUserSuccessResponseItem {
  /// The user ID that was successfully processed.
  final String userId;

  BatchUserSuccessResponseItem({
    required this.userId,
  });

  factory BatchUserSuccessResponseItem.fromJson(Map<String, dynamic> json) {
    return BatchUserSuccessResponseItem(
      userId: (json['userId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final userId = this.userId;
    return {
      'userId': userId,
    };
  }
}

/// Contains error information for a device operation that failed in a batch
/// device request.
class BatchDeviceErrorResponseItem {
  /// The application ID of the device that failed to be processed.
  final String appId;

  /// The field that caused the error.
  final String? field;

  /// A description of why the device operation failed.
  final String? reason;

  BatchDeviceErrorResponseItem({
    required this.appId,
    this.field,
    this.reason,
  });

  factory BatchDeviceErrorResponseItem.fromJson(Map<String, dynamic> json) {
    return BatchDeviceErrorResponseItem(
      appId: (json['appId'] as String?) ?? '',
      field: json['field'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final field = this.field;
    final reason = this.reason;
    return {
      'appId': appId,
      if (field != null) 'field': field,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Contains information about a device that was successfully processed in a
/// batch device operation.
class BatchDeviceSuccessResponseItem {
  /// The application ID of the device that was successfully processed.
  final String appId;

  BatchDeviceSuccessResponseItem({
    required this.appId,
  });

  factory BatchDeviceSuccessResponseItem.fromJson(Map<String, dynamic> json) {
    return BatchDeviceSuccessResponseItem(
      appId: (json['appId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    return {
      'appId': appId,
    };
  }
}

/// Contains error information for a username hash lookup that failed in a batch
/// uname lookup request.
class BatchUnameErrorResponseItem {
  /// The username hash that failed to be looked up.
  final String uname;

  /// The field that caused the error.
  final String? field;

  /// A description of why the username hash lookup failed.
  final String? reason;

  BatchUnameErrorResponseItem({
    required this.uname,
    this.field,
    this.reason,
  });

  factory BatchUnameErrorResponseItem.fromJson(Map<String, dynamic> json) {
    return BatchUnameErrorResponseItem(
      uname: (json['uname'] as String?) ?? '',
      field: json['field'] as String?,
      reason: json['reason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uname = this.uname;
    final field = this.field;
    final reason = this.reason;
    return {
      'uname': uname,
      if (field != null) 'field': field,
      if (reason != null) 'reason': reason,
    };
  }
}

/// Contains information about a username hash that was successfully resolved in
/// a batch uname lookup operation.
class BatchUnameSuccessResponseItem {
  /// The username hash that was successfully resolved.
  final String uname;

  /// The email address or username corresponding to the username hash.
  final String username;

  BatchUnameSuccessResponseItem({
    required this.uname,
    required this.username,
  });

  factory BatchUnameSuccessResponseItem.fromJson(Map<String, dynamic> json) {
    return BatchUnameSuccessResponseItem(
      uname: (json['uname'] as String?) ?? '',
      username: (json['username'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final uname = this.uname;
    final username = this.username;
    return {
      'uname': uname,
      'username': username,
    };
  }
}

/// Contains the details for a single user to be created in a batch user
/// creation request.
/// <note>
/// A user can only be assigned to a single security group. Attempting to add a
/// user to multiple security groups is not supported and will result in an
/// error.
/// </note> <note>
/// <code>codeValidation</code>, <code>inviteCode</code>, and
/// <code>inviteCodeTtl</code> are restricted to networks under preview only.
/// </note>
class BatchCreateUserRequestItem {
  /// A list of security group IDs to which the user should be assigned.
  final List<String> securityGroupIds;

  /// The email address or username for the user. Must be unique within the
  /// network.
  final String username;

  /// Indicates whether the user can be verified through a custom invite code.
  final bool? codeValidation;

  /// The first name of the user.
  final String? firstName;

  /// A custom invite code for the user. If not provided, one will be generated
  /// automatically.
  final String? inviteCode;

  /// The time-to-live for the invite code in days. After this period, the invite
  /// code will expire.
  final int? inviteCodeTtl;

  /// The last name of the user.
  final String? lastName;

  BatchCreateUserRequestItem({
    required this.securityGroupIds,
    required this.username,
    this.codeValidation,
    this.firstName,
    this.inviteCode,
    this.inviteCodeTtl,
    this.lastName,
  });

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final username = this.username;
    final codeValidation = this.codeValidation;
    final firstName = this.firstName;
    final inviteCode = this.inviteCode;
    final inviteCodeTtl = this.inviteCodeTtl;
    final lastName = this.lastName;
    return {
      'securityGroupIds': securityGroupIds,
      'username': username,
      if (codeValidation != null) 'codeValidation': codeValidation,
      if (firstName != null) 'firstName': firstName,
      if (inviteCode != null) 'inviteCode': inviteCode,
      if (inviteCodeTtl != null) 'inviteCodeTtl': inviteCodeTtl,
      if (lastName != null) 'lastName': lastName,
    };
  }
}

class BadRequestError extends _s.GenericAwsException {
  BadRequestError({String? type, String? message})
      : super(type: type, code: 'BadRequestError', message: message);
}

class ForbiddenError extends _s.GenericAwsException {
  ForbiddenError({String? type, String? message})
      : super(type: type, code: 'ForbiddenError', message: message);
}

class InternalServerError extends _s.GenericAwsException {
  InternalServerError({String? type, String? message})
      : super(type: type, code: 'InternalServerError', message: message);
}

class RateLimitError extends _s.GenericAwsException {
  RateLimitError({String? type, String? message})
      : super(type: type, code: 'RateLimitError', message: message);
}

class ResourceNotFoundError extends _s.GenericAwsException {
  ResourceNotFoundError({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundError', message: message);
}

class UnauthorizedError extends _s.GenericAwsException {
  UnauthorizedError({String? type, String? message})
      : super(type: type, code: 'UnauthorizedError', message: message);
}

class ValidationError extends _s.GenericAwsException {
  ValidationError({String? type, String? message})
      : super(type: type, code: 'ValidationError', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'BadRequestError': (type, message) =>
      BadRequestError(type: type, message: message),
  'ForbiddenError': (type, message) =>
      ForbiddenError(type: type, message: message),
  'InternalServerError': (type, message) =>
      InternalServerError(type: type, message: message),
  'RateLimitError': (type, message) =>
      RateLimitError(type: type, message: message),
  'ResourceNotFoundError': (type, message) =>
      ResourceNotFoundError(type: type, message: message),
  'UnauthorizedError': (type, message) =>
      UnauthorizedError(type: type, message: message),
  'ValidationError': (type, message) =>
      ValidationError(type: type, message: message),
};
