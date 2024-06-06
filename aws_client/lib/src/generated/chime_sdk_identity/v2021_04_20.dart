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

/// The Amazon Chime SDK Identity APIs in this section allow software developers
/// to create and manage unique instances of their messaging applications. These
/// APIs provide the overarching framework for creating and sending messages.
/// For more information about the identity APIs, refer to <a
/// href="https://docs.aws.amazon.com/chime/latest/APIReference/API_Operations_Amazon_Chime_SDK_Identity.html">Amazon
/// Chime SDK identity</a>.
class ChimeSdkIdentity {
  final _s.RestJsonProtocol _protocol;
  ChimeSdkIdentity({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'identity-chime',
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

  /// Creates an Amazon Chime SDK messaging <code>AppInstance</code> under an
  /// AWS account. Only SDK messaging customers use this API.
  /// <code>CreateAppInstance</code> supports idempotency behavior as described
  /// in the AWS API Standard.
  ///
  /// identity
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
  /// The unique ID of the request. Use different tokens to create different
  /// <code>AppInstances</code>.
  ///
  /// Parameter [metadata] :
  /// The metadata of the <code>AppInstance</code>. Limited to a 1KB string in
  /// UTF-8.
  ///
  /// Parameter [tags] :
  /// Tags assigned to the <code>AppInstance</code>.
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

  /// Promotes an <code>AppInstanceUser</code> or <code>AppInstanceBot</code> to
  /// an <code>AppInstanceAdmin</code>. The promoted entity can perform the
  /// following actions.
  ///
  /// <ul>
  /// <li>
  /// <code>ChannelModerator</code> actions across all channels in the
  /// <code>AppInstance</code>.
  /// </li>
  /// <li>
  /// <code>DeleteChannelMessage</code> actions.
  /// </li>
  /// </ul>
  /// Only an <code>AppInstanceUser</code> and <code>AppInstanceBot</code> can
  /// be promoted to an <code>AppInstanceAdmin</code> role.
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

  /// Creates a bot under an Amazon Chime <code>AppInstance</code>. The request
  /// consists of a unique <code>Configuration</code> and <code>Name</code> for
  /// that bot.
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
  /// Parameter [configuration] :
  /// Configuration information about the Amazon Lex V2 V2 bot.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique ID for the client making the request. Use different tokens for
  /// different <code>AppInstanceBots</code>.
  ///
  /// Parameter [metadata] :
  /// The request metadata. Limited to a 1KB string in UTF-8.
  ///
  /// Parameter [name] :
  /// The user's name.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the <code>AppInstanceBot</code>.
  Future<CreateAppInstanceBotResponse> createAppInstanceBot({
    required String appInstanceArn,
    required Configuration configuration,
    String? clientRequestToken,
    String? metadata,
    String? name,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'Configuration': configuration,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/app-instance-bots',
      exceptionFnMap: _exceptionFns,
    );
    return CreateAppInstanceBotResponse.fromJson(response);
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
  /// The ARN of the <code>AppInstance</code> request.
  ///
  /// Parameter [appInstanceUserId] :
  /// The user ID of the <code>AppInstance</code>.
  ///
  /// Parameter [name] :
  /// The user's name.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique ID of the request. Use different tokens to request additional
  /// <code>AppInstances</code>.
  ///
  /// Parameter [expirationSettings] :
  /// Settings that control the interval after which the
  /// <code>AppInstanceUser</code> is automatically deleted.
  ///
  /// Parameter [metadata] :
  /// The request's metadata. Limited to a 1KB string in UTF-8.
  ///
  /// Parameter [tags] :
  /// Tags assigned to the <code>AppInstanceUser</code>.
  Future<CreateAppInstanceUserResponse> createAppInstanceUser({
    required String appInstanceArn,
    required String appInstanceUserId,
    required String name,
    String? clientRequestToken,
    ExpirationSettings? expirationSettings,
    String? metadata,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'AppInstanceArn': appInstanceArn,
      'AppInstanceUserId': appInstanceUserId,
      'Name': name,
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
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

  /// Deletes an <code>AppInstance</code> and all associated data
  /// asynchronously.
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
  /// The ARN of the <code>AppInstance</code>.
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
  /// <code>AppInstanceUser</code> or <code>AppInstanceBot</code>. This action
  /// does not delete the user.
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
  /// The ARN of the <code>AppInstance</code>'s administrator.
  ///
  /// Parameter [appInstanceArn] :
  /// The ARN of the <code>AppInstance</code>.
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

  /// Deletes an <code>AppInstanceBot</code>.
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
  /// Parameter [appInstanceBotArn] :
  /// The ARN of the <code>AppInstanceBot</code> being deleted.
  Future<void> deleteAppInstanceBot({
    required String appInstanceBotArn,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instance-bots/${Uri.encodeComponent(appInstanceBotArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes an <code>AppInstanceUser</code>.
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
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the user request being deleted.
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

  /// Deregisters an <code>AppInstanceUserEndpoint</code>.
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
  ///
  /// Parameter [endpointId] :
  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  Future<void> deregisterAppInstanceUserEndpoint({
    required String appInstanceUserArn,
    required String endpointId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}/endpoints/${Uri.encodeComponent(endpointId)}',
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
  /// The ARN of the <code>AppInstance</code>.
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

  /// The <code>AppInstanceBot's</code> information.
  ///
  /// May throw [BadRequestException].
  /// May throw [ForbiddenException].
  /// May throw [ThrottledClientException].
  /// May throw [UnauthorizedClientException].
  /// May throw [NotFoundException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ServiceFailureException].
  ///
  /// Parameter [appInstanceBotArn] :
  /// The ARN of the <code>AppInstanceBot</code>.
  Future<DescribeAppInstanceBotResponse> describeAppInstanceBot({
    required String appInstanceBotArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instance-bots/${Uri.encodeComponent(appInstanceBotArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceBotResponse.fromJson(response);
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
  /// The ARN of the <code>AppInstanceUser</code>.
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

  /// Returns the full details of an <code>AppInstanceUserEndpoint</code>.
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
  ///
  /// Parameter [endpointId] :
  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  Future<DescribeAppInstanceUserEndpointResponse>
      describeAppInstanceUserEndpoint({
    required String appInstanceUserArn,
    required String endpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}/endpoints/${Uri.encodeComponent(endpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeAppInstanceUserEndpointResponse.fromJson(response);
  }

  /// Gets the retention settings for an <code>AppInstance</code>.
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

  /// Returns a list of the administrators in the <code>AppInstance</code>.
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
  /// The ARN of the <code>AppInstance</code>.
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

  /// Lists all <code>AppInstanceBots</code> created under a single
  /// <code>AppInstance</code>.
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
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of requests to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested bots are
  /// returned.
  Future<ListAppInstanceBotsResponse> listAppInstanceBots({
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
      requestUri: '/app-instance-bots',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppInstanceBotsResponse.fromJson(response);
  }

  /// Lists all the <code>AppInstanceUserEndpoints</code> created under a single
  /// <code>AppInstanceUser</code>.
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
  ///
  /// Parameter [maxResults] :
  /// The maximum number of endpoints that you want to return.
  ///
  /// Parameter [nextToken] :
  /// The token passed by previous API calls until all requested endpoints are
  /// returned.
  Future<ListAppInstanceUserEndpointsResponse> listAppInstanceUserEndpoints({
    required String appInstanceUserArn,
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
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}/endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAppInstanceUserEndpointsResponse.fromJson(response);
  }

  /// List all <code>AppInstanceUsers</code> created under a single
  /// <code>AppInstance</code>.
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
  /// number of <code>AppInstances</code>.
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

  /// Lists the tags applied to an Amazon Chime SDK identity resource.
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

  /// Sets the amount of time in days that a given <code>AppInstance</code>
  /// retains data.
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
  /// Parameter [appInstanceRetentionSettings] :
  /// The time in days to retain data. Data type: number.
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

  /// Sets the number of days before the <code>AppInstanceUser</code> is
  /// automatically deleted.
  /// <note>
  /// A background process deletes expired <code>AppInstanceUsers</code> within
  /// 6 hours of expiration. Actual deletion times may vary.
  ///
  /// Expired <code>AppInstanceUsers</code> that have not yet been deleted
  /// appear as active, and you can update their expiration settings. The system
  /// honors the new settings.
  /// </note>
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
  /// Parameter [expirationSettings] :
  /// Settings that control the interval after which an
  /// <code>AppInstanceUser</code> is automatically deleted.
  Future<PutAppInstanceUserExpirationSettingsResponse>
      putAppInstanceUserExpirationSettings({
    required String appInstanceUserArn,
    ExpirationSettings? expirationSettings,
  }) async {
    final $payload = <String, dynamic>{
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}/expiration-settings',
      exceptionFnMap: _exceptionFns,
    );
    return PutAppInstanceUserExpirationSettingsResponse.fromJson(response);
  }

  /// Registers an endpoint under an Amazon Chime <code>AppInstanceUser</code>.
  /// The endpoint receives messages for a user. For push notifications, the
  /// endpoint is a mobile device used to receive mobile push notifications for
  /// a user.
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
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the <code>AppInstanceUser</code>.
  ///
  /// Parameter [endpointAttributes] :
  /// The attributes of an <code>Endpoint</code>.
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to which the endpoint belongs.
  ///
  /// Parameter [type] :
  /// The type of the <code>AppInstanceUserEndpoint</code>. Supported types:
  ///
  /// <ul>
  /// <li>
  /// <code>APNS</code>: The mobile notification service for an Apple device.
  /// </li>
  /// <li>
  /// <code>APNS_SANDBOX</code>: The sandbox environment of the mobile
  /// notification service for an Apple device.
  /// </li>
  /// <li>
  /// <code>GCM</code>: The mobile notification service for an Android device.
  /// </li>
  /// </ul>
  /// Populate the <code>ResourceArn</code> value of each type as
  /// <code>PinpointAppArn</code>.
  ///
  /// Parameter [allowMessages] :
  /// Boolean that controls whether the AppInstanceUserEndpoint is opted in to
  /// receive messages. <code>ALL</code> indicates the endpoint receives all
  /// messages. <code>NONE</code> indicates the endpoint receives no messages.
  ///
  /// Parameter [clientRequestToken] :
  /// The unique ID assigned to the request. Use different tokens to register
  /// other endpoints.
  ///
  /// Parameter [name] :
  /// The name of the <code>AppInstanceUserEndpoint</code>.
  Future<RegisterAppInstanceUserEndpointResponse>
      registerAppInstanceUserEndpoint({
    required String appInstanceUserArn,
    required EndpointAttributes endpointAttributes,
    required String resourceArn,
    required AppInstanceUserEndpointType type,
    AllowMessages? allowMessages,
    String? clientRequestToken,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'EndpointAttributes': endpointAttributes,
      'ResourceArn': resourceArn,
      'Type': type.toValue(),
      if (allowMessages != null) 'AllowMessages': allowMessages.toValue(),
      'ClientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}/endpoints',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterAppInstanceUserEndpointResponse.fromJson(response);
  }

  /// Applies the specified tags to the specified Amazon Chime SDK identity
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

  /// Removes the specified tags from the specified Amazon Chime SDK identity
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
  /// The ARN of the <code>AppInstance</code>.
  ///
  /// Parameter [metadata] :
  /// The metadata that you want to change.
  ///
  /// Parameter [name] :
  /// The name that you want to change.
  Future<UpdateAppInstanceResponse> updateAppInstance({
    required String appInstanceArn,
    required String metadata,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'Metadata': metadata,
      'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/app-instances/${Uri.encodeComponent(appInstanceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppInstanceResponse.fromJson(response);
  }

  /// Updates the name and metadata of an <code>AppInstanceBot</code>.
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
  /// Parameter [appInstanceBotArn] :
  /// The ARN of the <code>AppInstanceBot</code>.
  ///
  /// Parameter [metadata] :
  /// The metadata of the <code>AppInstanceBot</code>.
  ///
  /// Parameter [name] :
  /// The name of the <code>AppInstanceBot</code>.
  ///
  /// Parameter [configuration] :
  /// The configuration for the bot update.
  Future<UpdateAppInstanceBotResponse> updateAppInstanceBot({
    required String appInstanceBotArn,
    required String metadata,
    required String name,
    Configuration? configuration,
  }) async {
    final $payload = <String, dynamic>{
      'Metadata': metadata,
      'Name': name,
      if (configuration != null) 'Configuration': configuration,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instance-bots/${Uri.encodeComponent(appInstanceBotArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppInstanceBotResponse.fromJson(response);
  }

  /// Updates the details of an <code>AppInstanceUser</code>. You can update
  /// names and metadata.
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
  /// Parameter [appInstanceUserArn] :
  /// The ARN of the <code>AppInstanceUser</code>.
  ///
  /// Parameter [metadata] :
  /// The metadata of the <code>AppInstanceUser</code>.
  ///
  /// Parameter [name] :
  /// The name of the <code>AppInstanceUser</code>.
  Future<UpdateAppInstanceUserResponse> updateAppInstanceUser({
    required String appInstanceUserArn,
    required String metadata,
    required String name,
  }) async {
    final $payload = <String, dynamic>{
      'Metadata': metadata,
      'Name': name,
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

  /// Updates the details of an <code>AppInstanceUserEndpoint</code>. You can
  /// update the name and <code>AllowMessage</code> values.
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
  /// Parameter [endpointId] :
  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  ///
  /// Parameter [allowMessages] :
  /// Boolean that controls whether the <code>AppInstanceUserEndpoint</code> is
  /// opted in to receive messages. <code>ALL</code> indicates the endpoint will
  /// receive all messages. <code>NONE</code> indicates the endpoint will
  /// receive no messages.
  ///
  /// Parameter [name] :
  /// The name of the <code>AppInstanceUserEndpoint</code>.
  Future<UpdateAppInstanceUserEndpointResponse> updateAppInstanceUserEndpoint({
    required String appInstanceUserArn,
    required String endpointId,
    AllowMessages? allowMessages,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      if (allowMessages != null) 'AllowMessages': allowMessages.toValue(),
      if (name != null) 'Name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/app-instance-users/${Uri.encodeComponent(appInstanceUserArn)}/endpoints/${Uri.encodeComponent(endpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateAppInstanceUserEndpointResponse.fromJson(response);
  }
}

enum AllowMessages {
  all,
  none,
}

extension AllowMessagesValueExtension on AllowMessages {
  String toValue() {
    switch (this) {
      case AllowMessages.all:
        return 'ALL';
      case AllowMessages.none:
        return 'NONE';
    }
  }
}

extension AllowMessagesFromString on String {
  AllowMessages toAllowMessages() {
    switch (this) {
      case 'ALL':
        return AllowMessages.all;
      case 'NONE':
        return AllowMessages.none;
    }
    throw Exception('$this is not known in enum AllowMessages');
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

/// The name and ARN of the admin for the <code>AppInstance</code>.
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

/// An Amazon Lex V2 chat bot created under an <code>AppInstance</code>.
class AppInstanceBot {
  /// The ARN of the AppInstanceBot.
  final String? appInstanceBotArn;

  /// The data processing instructions for an AppInstanceBot.
  final Configuration? configuration;

  /// The time at which the <code>AppInstanceBot</code> was created.
  final DateTime? createdTimestamp;

  /// The time at which the <code>AppInstanceBot</code> was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata for an AppInstanceBot.
  final String? metadata;

  /// The name of the AppInstanceBot.
  final String? name;

  AppInstanceBot({
    this.appInstanceBotArn,
    this.configuration,
    this.createdTimestamp,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.name,
  });

  factory AppInstanceBot.fromJson(Map<String, dynamic> json) {
    return AppInstanceBot(
      appInstanceBotArn: json['AppInstanceBotArn'] as String?,
      configuration: json['Configuration'] != null
          ? Configuration.fromJson(
              json['Configuration'] as Map<String, dynamic>)
          : null,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceBotArn = this.appInstanceBotArn;
    final configuration = this.configuration;
    final createdTimestamp = this.createdTimestamp;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceBotArn != null) 'AppInstanceBotArn': appInstanceBotArn,
      if (configuration != null) 'Configuration': configuration,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
  }
}

/// High-level information about an AppInstanceBot.
class AppInstanceBotSummary {
  /// The ARN of the AppInstanceBot.
  final String? appInstanceBotArn;

  /// The metadata of the AppInstanceBot.
  final String? metadata;

  /// The name of the AppInstanceBox.
  final String? name;

  AppInstanceBotSummary({
    this.appInstanceBotArn,
    this.metadata,
    this.name,
  });

  factory AppInstanceBotSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceBotSummary(
      appInstanceBotArn: json['AppInstanceBotArn'] as String?,
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceBotArn = this.appInstanceBotArn;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceBotArn != null) 'AppInstanceBotArn': appInstanceBotArn,
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
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

  /// The interval after which an <code>AppInstanceUser</code> is automatically
  /// deleted.
  final ExpirationSettings? expirationSettings;

  /// The time at which the <code>AppInstanceUser</code> was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The metadata of the <code>AppInstanceUser</code>.
  final String? metadata;

  /// The name of the <code>AppInstanceUser</code>.
  final String? name;

  AppInstanceUser({
    this.appInstanceUserArn,
    this.createdTimestamp,
    this.expirationSettings,
    this.lastUpdatedTimestamp,
    this.metadata,
    this.name,
  });

  factory AppInstanceUser.fromJson(Map<String, dynamic> json) {
    return AppInstanceUser(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      expirationSettings: json['ExpirationSettings'] != null
          ? ExpirationSettings.fromJson(
              json['ExpirationSettings'] as Map<String, dynamic>)
          : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      metadata: json['Metadata'] as String?,
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    final createdTimestamp = this.createdTimestamp;
    final expirationSettings = this.expirationSettings;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final metadata = this.metadata;
    final name = this.name;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (metadata != null) 'Metadata': metadata,
      if (name != null) 'Name': name,
    };
  }
}

/// An endpoint under an Amazon Chime <code>AppInstanceUser</code> that receives
/// messages for a user. For push notifications, the endpoint is a mobile device
/// used to receive mobile push notifications for a user.
class AppInstanceUserEndpoint {
  /// Boolean that controls whether the <code>AppInstanceUserEndpoint</code> is
  /// opted in to receive messages. <code>ALL</code> indicates the endpoint will
  /// receive all messages. <code>NONE</code> indicates the endpoint will receive
  /// no messages.
  final AllowMessages? allowMessages;

  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// The time at which an <code>AppInstanceUserEndpoint</code> was created.
  final DateTime? createdTimestamp;

  /// The attributes of an <code>Endpoint</code>.
  final EndpointAttributes? endpointAttributes;

  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  final String? endpointId;

  /// A read-only field that represents the state of an
  /// <code>AppInstanceUserEndpoint</code>. Supported values:
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is active and
  /// able to receive messages. When <code>ACTIVE</code>, the
  /// <code>EndpointStatusReason</code> remains empty.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is inactive
  /// and can't receive message. When <code>INACTIVE</code>, the corresponding
  /// reason will be conveyed through <code>EndpointStatusReason</code>.
  /// </li>
  /// <li>
  /// <code>INVALID_DEVICE_TOKEN</code> indicates that an
  /// <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to invalid
  /// device token
  /// </li>
  /// <li>
  /// <code>INVALID_PINPOINT_ARN</code> indicates that an
  /// <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to an
  /// invalid pinpoint ARN that was input through the <code>ResourceArn</code>
  /// field.
  /// </li>
  /// </ul>
  final EndpointState? endpointState;

  /// The time at which an <code>AppInstanceUserEndpoint</code> was last updated.
  final DateTime? lastUpdatedTimestamp;

  /// The name of the <code>AppInstanceUserEndpoint</code>.
  final String? name;

  /// The ARN of the resource to which the endpoint belongs.
  final String? resourceArn;

  /// The type of the <code>AppInstanceUserEndpoint</code>.
  final AppInstanceUserEndpointType? type;

  AppInstanceUserEndpoint({
    this.allowMessages,
    this.appInstanceUserArn,
    this.createdTimestamp,
    this.endpointAttributes,
    this.endpointId,
    this.endpointState,
    this.lastUpdatedTimestamp,
    this.name,
    this.resourceArn,
    this.type,
  });

  factory AppInstanceUserEndpoint.fromJson(Map<String, dynamic> json) {
    return AppInstanceUserEndpoint(
      allowMessages: (json['AllowMessages'] as String?)?.toAllowMessages(),
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      createdTimestamp: timeStampFromJson(json['CreatedTimestamp']),
      endpointAttributes: json['EndpointAttributes'] != null
          ? EndpointAttributes.fromJson(
              json['EndpointAttributes'] as Map<String, dynamic>)
          : null,
      endpointId: json['EndpointId'] as String?,
      endpointState: json['EndpointState'] != null
          ? EndpointState.fromJson(
              json['EndpointState'] as Map<String, dynamic>)
          : null,
      lastUpdatedTimestamp: timeStampFromJson(json['LastUpdatedTimestamp']),
      name: json['Name'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      type: (json['Type'] as String?)?.toAppInstanceUserEndpointType(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowMessages = this.allowMessages;
    final appInstanceUserArn = this.appInstanceUserArn;
    final createdTimestamp = this.createdTimestamp;
    final endpointAttributes = this.endpointAttributes;
    final endpointId = this.endpointId;
    final endpointState = this.endpointState;
    final lastUpdatedTimestamp = this.lastUpdatedTimestamp;
    final name = this.name;
    final resourceArn = this.resourceArn;
    final type = this.type;
    return {
      if (allowMessages != null) 'AllowMessages': allowMessages.toValue(),
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (createdTimestamp != null)
        'CreatedTimestamp': unixTimestampToJson(createdTimestamp),
      if (endpointAttributes != null) 'EndpointAttributes': endpointAttributes,
      if (endpointId != null) 'EndpointId': endpointId,
      if (endpointState != null) 'EndpointState': endpointState,
      if (lastUpdatedTimestamp != null)
        'LastUpdatedTimestamp': unixTimestampToJson(lastUpdatedTimestamp),
      if (name != null) 'Name': name,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// Summary of the details of an <code>AppInstanceUserEndpoint</code>.
class AppInstanceUserEndpointSummary {
  /// BBoolean that controls whether the <code>AppInstanceUserEndpoint</code> is
  /// opted in to receive messages. <code>ALL</code> indicates the endpoint will
  /// receive all messages. <code>NONE</code> indicates the endpoint will receive
  /// no messages.
  final AllowMessages? allowMessages;

  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  final String? endpointId;

  /// A read-only field that represent the state of an
  /// <code>AppInstanceUserEndpoint</code>.
  final EndpointState? endpointState;

  /// The name of the <code>AppInstanceUserEndpoint</code>.
  final String? name;

  /// The type of the <code>AppInstanceUserEndpoint</code>.
  final AppInstanceUserEndpointType? type;

  AppInstanceUserEndpointSummary({
    this.allowMessages,
    this.appInstanceUserArn,
    this.endpointId,
    this.endpointState,
    this.name,
    this.type,
  });

  factory AppInstanceUserEndpointSummary.fromJson(Map<String, dynamic> json) {
    return AppInstanceUserEndpointSummary(
      allowMessages: (json['AllowMessages'] as String?)?.toAllowMessages(),
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      endpointId: json['EndpointId'] as String?,
      endpointState: json['EndpointState'] != null
          ? EndpointState.fromJson(
              json['EndpointState'] as Map<String, dynamic>)
          : null,
      name: json['Name'] as String?,
      type: (json['Type'] as String?)?.toAppInstanceUserEndpointType(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowMessages = this.allowMessages;
    final appInstanceUserArn = this.appInstanceUserArn;
    final endpointId = this.endpointId;
    final endpointState = this.endpointState;
    final name = this.name;
    final type = this.type;
    return {
      if (allowMessages != null) 'AllowMessages': allowMessages.toValue(),
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (endpointId != null) 'EndpointId': endpointId,
      if (endpointState != null) 'EndpointState': endpointState,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum AppInstanceUserEndpointType {
  apns,
  apnsSandbox,
  gcm,
}

extension AppInstanceUserEndpointTypeValueExtension
    on AppInstanceUserEndpointType {
  String toValue() {
    switch (this) {
      case AppInstanceUserEndpointType.apns:
        return 'APNS';
      case AppInstanceUserEndpointType.apnsSandbox:
        return 'APNS_SANDBOX';
      case AppInstanceUserEndpointType.gcm:
        return 'GCM';
    }
  }
}

extension AppInstanceUserEndpointTypeFromString on String {
  AppInstanceUserEndpointType toAppInstanceUserEndpointType() {
    switch (this) {
      case 'APNS':
        return AppInstanceUserEndpointType.apns;
      case 'APNS_SANDBOX':
        return AppInstanceUserEndpointType.apnsSandbox;
      case 'GCM':
        return AppInstanceUserEndpointType.gcm;
    }
    throw Exception('$this is not known in enum AppInstanceUserEndpointType');
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

/// A structure that contains configuration data.
class Configuration {
  /// The configuration for an Amazon Lex V2 bot.
  final LexConfiguration lex;

  Configuration({
    required this.lex,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      lex: LexConfiguration.fromJson(json['Lex'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final lex = this.lex;
    return {
      'Lex': lex,
    };
  }
}

class CreateAppInstanceAdminResponse {
  /// The ARN and name of the administrator, the ARN of the
  /// <code>AppInstance</code>, and the created and last-updated timestamps. All
  /// timestamps use epoch milliseconds.
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

class CreateAppInstanceBotResponse {
  /// The ARN of the <code>AppinstanceBot</code>.
  final String? appInstanceBotArn;

  CreateAppInstanceBotResponse({
    this.appInstanceBotArn,
  });

  factory CreateAppInstanceBotResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppInstanceBotResponse(
      appInstanceBotArn: json['AppInstanceBotArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceBotArn = this.appInstanceBotArn;
    return {
      if (appInstanceBotArn != null) 'AppInstanceBotArn': appInstanceBotArn,
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

class DescribeAppInstanceBotResponse {
  /// The detials of the <code>AppInstanceBot</code>.
  final AppInstanceBot? appInstanceBot;

  DescribeAppInstanceBotResponse({
    this.appInstanceBot,
  });

  factory DescribeAppInstanceBotResponse.fromJson(Map<String, dynamic> json) {
    return DescribeAppInstanceBotResponse(
      appInstanceBot: json['AppInstanceBot'] != null
          ? AppInstanceBot.fromJson(
              json['AppInstanceBot'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceBot = this.appInstanceBot;
    return {
      if (appInstanceBot != null) 'AppInstanceBot': appInstanceBot,
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

class DescribeAppInstanceUserEndpointResponse {
  /// The full details of an <code>AppInstanceUserEndpoint</code>: the
  /// <code>AppInstanceUserArn</code>, ID, name, type, resource ARN, attributes,
  /// allow messages, state, and created and last updated timestamps. All
  /// timestamps use epoch milliseconds.
  final AppInstanceUserEndpoint? appInstanceUserEndpoint;

  DescribeAppInstanceUserEndpointResponse({
    this.appInstanceUserEndpoint,
  });

  factory DescribeAppInstanceUserEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeAppInstanceUserEndpointResponse(
      appInstanceUserEndpoint: json['AppInstanceUserEndpoint'] != null
          ? AppInstanceUserEndpoint.fromJson(
              json['AppInstanceUserEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserEndpoint = this.appInstanceUserEndpoint;
    return {
      if (appInstanceUserEndpoint != null)
        'AppInstanceUserEndpoint': appInstanceUserEndpoint,
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

/// The attributes of an <code>Endpoint</code>.
class EndpointAttributes {
  /// The device token for the GCM, APNS, and APNS_SANDBOX endpoint types.
  final String deviceToken;

  /// The VOIP device token for the APNS and APNS_SANDBOX endpoint types.
  final String? voipDeviceToken;

  EndpointAttributes({
    required this.deviceToken,
    this.voipDeviceToken,
  });

  factory EndpointAttributes.fromJson(Map<String, dynamic> json) {
    return EndpointAttributes(
      deviceToken: json['DeviceToken'] as String,
      voipDeviceToken: json['VoipDeviceToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceToken = this.deviceToken;
    final voipDeviceToken = this.voipDeviceToken;
    return {
      'DeviceToken': deviceToken,
      if (voipDeviceToken != null) 'VoipDeviceToken': voipDeviceToken,
    };
  }
}

/// A read-only field that represents the state of an
/// <code>AppInstanceUserEndpoint</code>. Supported values:
///
/// <ul>
/// <li>
/// <code>ACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is active and
/// able to receive messages. When <code>ACTIVE</code>, the
/// <code>EndpointStatusReason</code> remains empty.
/// </li>
/// <li>
/// <code>INACTIVE</code>: The <code>AppInstanceUserEndpoint</code> is inactive
/// and can't receive message. When INACTIVE, the corresponding reason will be
/// conveyed through EndpointStatusReason.
/// </li>
/// <li>
/// <code>INVALID_DEVICE_TOKEN</code> indicates that an
/// <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to invalid
/// device token
/// </li>
/// <li>
/// <code>INVALID_PINPOINT_ARN</code> indicates that an
/// <code>AppInstanceUserEndpoint</code> is <code>INACTIVE</code> due to an
/// invalid pinpoint ARN that was input through the <code>ResourceArn</code>
/// field.
/// </li>
/// </ul>
class EndpointState {
  /// Enum that indicates the Status of an <code>AppInstanceUserEndpoint</code>.
  final EndpointStatus status;

  /// The reason for the <code>EndpointStatus</code>.
  final EndpointStatusReason? statusReason;

  EndpointState({
    required this.status,
    this.statusReason,
  });

  factory EndpointState.fromJson(Map<String, dynamic> json) {
    return EndpointState(
      status: (json['Status'] as String).toEndpointStatus(),
      statusReason: (json['StatusReason'] as String?)?.toEndpointStatusReason(),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'Status': status.toValue(),
      if (statusReason != null) 'StatusReason': statusReason.toValue(),
    };
  }
}

enum EndpointStatus {
  active,
  inactive,
}

extension EndpointStatusValueExtension on EndpointStatus {
  String toValue() {
    switch (this) {
      case EndpointStatus.active:
        return 'ACTIVE';
      case EndpointStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension EndpointStatusFromString on String {
  EndpointStatus toEndpointStatus() {
    switch (this) {
      case 'ACTIVE':
        return EndpointStatus.active;
      case 'INACTIVE':
        return EndpointStatus.inactive;
    }
    throw Exception('$this is not known in enum EndpointStatus');
  }
}

enum EndpointStatusReason {
  invalidDeviceToken,
  invalidPinpointArn,
}

extension EndpointStatusReasonValueExtension on EndpointStatusReason {
  String toValue() {
    switch (this) {
      case EndpointStatusReason.invalidDeviceToken:
        return 'INVALID_DEVICE_TOKEN';
      case EndpointStatusReason.invalidPinpointArn:
        return 'INVALID_PINPOINT_ARN';
    }
  }
}

extension EndpointStatusReasonFromString on String {
  EndpointStatusReason toEndpointStatusReason() {
    switch (this) {
      case 'INVALID_DEVICE_TOKEN':
        return EndpointStatusReason.invalidDeviceToken;
      case 'INVALID_PINPOINT_ARN':
        return EndpointStatusReason.invalidPinpointArn;
    }
    throw Exception('$this is not known in enum EndpointStatusReason');
  }
}

enum ExpirationCriterion {
  createdTimestamp,
}

extension ExpirationCriterionValueExtension on ExpirationCriterion {
  String toValue() {
    switch (this) {
      case ExpirationCriterion.createdTimestamp:
        return 'CREATED_TIMESTAMP';
    }
  }
}

extension ExpirationCriterionFromString on String {
  ExpirationCriterion toExpirationCriterion() {
    switch (this) {
      case 'CREATED_TIMESTAMP':
        return ExpirationCriterion.createdTimestamp;
    }
    throw Exception('$this is not known in enum ExpirationCriterion');
  }
}

/// Determines the interval after which an <code>AppInstanceUser</code> is
/// automatically deleted.
class ExpirationSettings {
  /// Specifies the conditions under which an <code>AppInstanceUser</code> will
  /// expire.
  final ExpirationCriterion expirationCriterion;

  /// The period in days after which an <code>AppInstanceUser</code> will be
  /// automatically deleted.
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

/// Specifies the type of message that triggers a bot.
class InvokedBy {
  /// Sets standard messages as the bot trigger. For standard messages:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code>: The bot processes all standard messages.
  /// </li>
  /// <li>
  /// <code>AUTO</code>: The bot responds to ALL messages when the channel has one
  /// other non-hidden member, and responds to MENTIONS when the channel has more
  /// than one other non-hidden member.
  /// </li>
  /// <li>
  /// <code>MENTIONS</code>: The bot processes all standard messages that have a
  /// message attribute with <code>CHIME.mentions</code> and a value of the bot
  /// ARN.
  /// </li>
  /// <li>
  /// <code>NONE</code>: The bot processes no standard messages.
  /// </li>
  /// </ul>
  final StandardMessages standardMessages;

  /// Sets targeted messages as the bot trigger. For targeted messages:
  ///
  /// <ul>
  /// <li>
  /// <code>ALL</code>: The bot processes all <code>TargetedMessages</code> sent
  /// to it. The bot then responds with a targeted message back to the sender.
  /// </li>
  /// <li>
  /// <code>NONE</code>: The bot processes no targeted messages.
  /// </li>
  /// </ul>
  final TargetedMessages targetedMessages;

  InvokedBy({
    required this.standardMessages,
    required this.targetedMessages,
  });

  factory InvokedBy.fromJson(Map<String, dynamic> json) {
    return InvokedBy(
      standardMessages:
          (json['StandardMessages'] as String).toStandardMessages(),
      targetedMessages:
          (json['TargetedMessages'] as String).toTargetedMessages(),
    );
  }

  Map<String, dynamic> toJson() {
    final standardMessages = this.standardMessages;
    final targetedMessages = this.targetedMessages;
    return {
      'StandardMessages': standardMessages.toValue(),
      'TargetedMessages': targetedMessages.toValue(),
    };
  }
}

/// The configuration for an Amazon Lex V2 bot.
class LexConfiguration {
  /// The ARN of the Amazon Lex V2 bot's alias. The ARN uses this format:
  /// <code>arn:aws:lex:REGION:ACCOUNT:bot-alias/MYBOTID/MYBOTALIAS</code>
  final String lexBotAliasArn;

  /// Identifies the Amazon Lex V2 bot's language and locale. The string must
  /// match one of the supported locales in Amazon Lex V2. All of the intents,
  /// slot types, and slots used in the bot must have the same locale. For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/lexv2/latest/dg/how-languages.html">Supported
  /// languages</a> in the <i>Amazon Lex V2 Developer Guide</i>.
  final String localeId;

  /// Specifies the type of message that triggers a bot.
  final InvokedBy? invokedBy;

  /// <important>
  /// <b>Deprecated</b>. Use <code>InvokedBy</code> instead.
  /// </important>
  /// Determines whether the Amazon Lex V2 bot responds to all standard messages.
  /// Control messages are not supported.
  final RespondsTo? respondsTo;

  /// The name of the welcome intent configured in the Amazon Lex V2 bot.
  final String? welcomeIntent;

  LexConfiguration({
    required this.lexBotAliasArn,
    required this.localeId,
    this.invokedBy,
    this.respondsTo,
    this.welcomeIntent,
  });

  factory LexConfiguration.fromJson(Map<String, dynamic> json) {
    return LexConfiguration(
      lexBotAliasArn: json['LexBotAliasArn'] as String,
      localeId: json['LocaleId'] as String,
      invokedBy: json['InvokedBy'] != null
          ? InvokedBy.fromJson(json['InvokedBy'] as Map<String, dynamic>)
          : null,
      respondsTo: (json['RespondsTo'] as String?)?.toRespondsTo(),
      welcomeIntent: json['WelcomeIntent'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lexBotAliasArn = this.lexBotAliasArn;
    final localeId = this.localeId;
    final invokedBy = this.invokedBy;
    final respondsTo = this.respondsTo;
    final welcomeIntent = this.welcomeIntent;
    return {
      'LexBotAliasArn': lexBotAliasArn,
      'LocaleId': localeId,
      if (invokedBy != null) 'InvokedBy': invokedBy,
      if (respondsTo != null) 'RespondsTo': respondsTo.toValue(),
      if (welcomeIntent != null) 'WelcomeIntent': welcomeIntent,
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

class ListAppInstanceBotsResponse {
  /// The ARN of the AppInstance.
  final String? appInstanceArn;

  /// The information for each requested <code>AppInstanceBot</code>.
  final List<AppInstanceBotSummary>? appInstanceBots;

  /// The token passed by previous API calls until all requested bots are
  /// returned.
  final String? nextToken;

  ListAppInstanceBotsResponse({
    this.appInstanceArn,
    this.appInstanceBots,
    this.nextToken,
  });

  factory ListAppInstanceBotsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppInstanceBotsResponse(
      appInstanceArn: json['AppInstanceArn'] as String?,
      appInstanceBots: (json['AppInstanceBots'] as List?)
          ?.whereNotNull()
          .map((e) => AppInstanceBotSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceArn = this.appInstanceArn;
    final appInstanceBots = this.appInstanceBots;
    final nextToken = this.nextToken;
    return {
      if (appInstanceArn != null) 'AppInstanceArn': appInstanceArn,
      if (appInstanceBots != null) 'AppInstanceBots': appInstanceBots,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListAppInstanceUserEndpointsResponse {
  /// The information for each requested <code>AppInstanceUserEndpoint</code>.
  final List<AppInstanceUserEndpointSummary>? appInstanceUserEndpoints;

  /// The token passed by previous API calls until all requested endpoints are
  /// returned.
  final String? nextToken;

  ListAppInstanceUserEndpointsResponse({
    this.appInstanceUserEndpoints,
    this.nextToken,
  });

  factory ListAppInstanceUserEndpointsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAppInstanceUserEndpointsResponse(
      appInstanceUserEndpoints: (json['AppInstanceUserEndpoints'] as List?)
          ?.whereNotNull()
          .map((e) => AppInstanceUserEndpointSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserEndpoints = this.appInstanceUserEndpoints;
    final nextToken = this.nextToken;
    return {
      if (appInstanceUserEndpoints != null)
        'AppInstanceUserEndpoints': appInstanceUserEndpoints,
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

class PutAppInstanceUserExpirationSettingsResponse {
  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// Settings that control the interval after which an
  /// <code>AppInstanceUser</code> is automatically deleted.
  final ExpirationSettings? expirationSettings;

  PutAppInstanceUserExpirationSettingsResponse({
    this.appInstanceUserArn,
    this.expirationSettings,
  });

  factory PutAppInstanceUserExpirationSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return PutAppInstanceUserExpirationSettingsResponse(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      expirationSettings: json['ExpirationSettings'] != null
          ? ExpirationSettings.fromJson(
              json['ExpirationSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    final expirationSettings = this.expirationSettings;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (expirationSettings != null) 'ExpirationSettings': expirationSettings,
    };
  }
}

class RegisterAppInstanceUserEndpointResponse {
  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  final String? endpointId;

  RegisterAppInstanceUserEndpointResponse({
    this.appInstanceUserArn,
    this.endpointId,
  });

  factory RegisterAppInstanceUserEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterAppInstanceUserEndpointResponse(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      endpointId: json['EndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    final endpointId = this.endpointId;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (endpointId != null) 'EndpointId': endpointId,
    };
  }
}

enum RespondsTo {
  standardMessages,
}

extension RespondsToValueExtension on RespondsTo {
  String toValue() {
    switch (this) {
      case RespondsTo.standardMessages:
        return 'STANDARD_MESSAGES';
    }
  }
}

extension RespondsToFromString on String {
  RespondsTo toRespondsTo() {
    switch (this) {
      case 'STANDARD_MESSAGES':
        return RespondsTo.standardMessages;
    }
    throw Exception('$this is not known in enum RespondsTo');
  }
}

enum StandardMessages {
  auto,
  all,
  mentions,
  none,
}

extension StandardMessagesValueExtension on StandardMessages {
  String toValue() {
    switch (this) {
      case StandardMessages.auto:
        return 'AUTO';
      case StandardMessages.all:
        return 'ALL';
      case StandardMessages.mentions:
        return 'MENTIONS';
      case StandardMessages.none:
        return 'NONE';
    }
  }
}

extension StandardMessagesFromString on String {
  StandardMessages toStandardMessages() {
    switch (this) {
      case 'AUTO':
        return StandardMessages.auto;
      case 'ALL':
        return StandardMessages.all;
      case 'MENTIONS':
        return StandardMessages.mentions;
      case 'NONE':
        return StandardMessages.none;
    }
    throw Exception('$this is not known in enum StandardMessages');
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

enum TargetedMessages {
  all,
  none,
}

extension TargetedMessagesValueExtension on TargetedMessages {
  String toValue() {
    switch (this) {
      case TargetedMessages.all:
        return 'ALL';
      case TargetedMessages.none:
        return 'NONE';
    }
  }
}

extension TargetedMessagesFromString on String {
  TargetedMessages toTargetedMessages() {
    switch (this) {
      case 'ALL':
        return TargetedMessages.all;
      case 'NONE':
        return TargetedMessages.none;
    }
    throw Exception('$this is not known in enum TargetedMessages');
  }
}

class UpdateAppInstanceBotResponse {
  /// The ARN of the <code>AppInstanceBot</code>.
  final String? appInstanceBotArn;

  UpdateAppInstanceBotResponse({
    this.appInstanceBotArn,
  });

  factory UpdateAppInstanceBotResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppInstanceBotResponse(
      appInstanceBotArn: json['AppInstanceBotArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceBotArn = this.appInstanceBotArn;
    return {
      if (appInstanceBotArn != null) 'AppInstanceBotArn': appInstanceBotArn,
    };
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

class UpdateAppInstanceUserEndpointResponse {
  /// The ARN of the <code>AppInstanceUser</code>.
  final String? appInstanceUserArn;

  /// The unique identifier of the <code>AppInstanceUserEndpoint</code>.
  final String? endpointId;

  UpdateAppInstanceUserEndpointResponse({
    this.appInstanceUserArn,
    this.endpointId,
  });

  factory UpdateAppInstanceUserEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateAppInstanceUserEndpointResponse(
      appInstanceUserArn: json['AppInstanceUserArn'] as String?,
      endpointId: json['EndpointId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appInstanceUserArn = this.appInstanceUserArn;
    final endpointId = this.endpointId;
    return {
      if (appInstanceUserArn != null) 'AppInstanceUserArn': appInstanceUserArn,
      if (endpointId != null) 'EndpointId': endpointId,
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
