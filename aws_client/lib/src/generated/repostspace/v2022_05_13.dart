// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unintended_html_in_doc_comment
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: unnecessary_brace_in_string_interps

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

import 'v2022_05_13.endpoints.dart' as _endpoints;
export '../../shared/shared.dart' show AwsClientCredentials;

/// AWS re:Post Private is a private version of AWS re:Post for enterprises with
/// Enterprise Support or Enterprise On-Ramp Support plans. It provides access
/// to knowledge and experts to accelerate cloud adoption and increase developer
/// productivity. With your organization-specific private re:Post, you can build
/// an organization-specific developer community that drives efficiencies at
/// scale and provides access to valuable knowledge resources. Additionally,
/// re:Post Private centralizes trusted AWS technical content and offers private
/// discussion forums to improve how your teams collaborate internally and with
/// AWS to remove technical obstacles, accelerate innovation, and scale more
/// efficiently in the cloud.
class Repostspace {
  final _s.RestJsonProtocol _protocol;
  factory Repostspace({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
    bool useFipsEndpoint = false,
    bool useDualStackEndpoint = false,
  }) {
    final service = _s.ServiceMetadata(
      endpointPrefix: 'repostspace',
    );
    return Repostspace._(
      protocol: _s.RestJsonProtocol(
        client: client,
        endpointBuilder: () => _s.Endpoint.fromResolved(
            _endpoints.resolveEndpoint(
                region: region,
                endpoint: endpointUrl,
                useFips: useFipsEndpoint,
                useDualStack: useDualStackEndpoint),
            service: service,
            region: region),
        credentials: credentials,
        credentialsProvider: credentialsProvider,
      ),
    );
  }
  Repostspace._({
    required _s.RestJsonProtocol protocol,
  }) : _protocol = protocol;

  /// Closes the internal HTTP client if none was provided at creation.
  /// If a client was passed as a constructor argument, this becomes a noop.
  ///
  /// It's important to close all clients when it's done being used; failing to
  /// do so can cause the Dart process to hang.
  void close() {
    _protocol.close();
  }

  /// Add role to multiple users or groups in a private re:Post channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessorIds] :
  /// The user or group identifiers to add the role to.
  ///
  /// Parameter [channelId] :
  /// The unique ID of the private re:Post channel.
  ///
  /// Parameter [channelRole] :
  /// The channel role to add to the users or groups.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  Future<BatchAddChannelRoleToAccessorsOutput> batchAddChannelRoleToAccessors({
    required List<String> accessorIds,
    required String channelId,
    required ChannelRole channelRole,
    required String spaceId,
  }) async {
    final $payload = <String, dynamic>{
      'accessorIds': accessorIds,
      'channelRole': channelRole.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/spaces/${Uri.encodeComponent(spaceId)}/channels/${Uri.encodeComponent(channelId)}/roles',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAddChannelRoleToAccessorsOutput.fromJson(response);
  }

  /// Add a role to multiple users or groups in a private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessorIds] :
  /// The user or group accessor identifiers to add the role to.
  ///
  /// Parameter [role] :
  /// The role to add to the users or groups.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  Future<BatchAddRoleOutput> batchAddRole({
    required List<String> accessorIds,
    required Role role,
    required String spaceId,
  }) async {
    final $payload = <String, dynamic>{
      'accessorIds': accessorIds,
      'role': role.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}/roles',
      exceptionFnMap: _exceptionFns,
    );
    return BatchAddRoleOutput.fromJson(response);
  }

  /// Remove a role from multiple users or groups in a private re:Post channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessorIds] :
  /// The users or groups identifiers to remove the role from.
  ///
  /// Parameter [channelId] :
  /// The unique ID of the private re:Post channel.
  ///
  /// Parameter [channelRole] :
  /// The channel role to remove from the users or groups.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  Future<BatchRemoveChannelRoleFromAccessorsOutput>
      batchRemoveChannelRoleFromAccessors({
    required List<String> accessorIds,
    required String channelId,
    required ChannelRole channelRole,
    required String spaceId,
  }) async {
    final $payload = <String, dynamic>{
      'accessorIds': accessorIds,
      'channelRole': channelRole.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/spaces/${Uri.encodeComponent(spaceId)}/channels/${Uri.encodeComponent(channelId)}/roles',
      exceptionFnMap: _exceptionFns,
    );
    return BatchRemoveChannelRoleFromAccessorsOutput.fromJson(response);
  }

  /// Remove a role from multiple users or groups in a private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessorIds] :
  /// The user or group accessor identifiers to remove the role from.
  ///
  /// Parameter [role] :
  /// The role to remove from the users or groups.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  Future<BatchRemoveRoleOutput> batchRemoveRole({
    required List<String> accessorIds,
    required Role role,
    required String spaceId,
  }) async {
    final $payload = <String, dynamic>{
      'accessorIds': accessorIds,
      'role': role.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}/roles',
      exceptionFnMap: _exceptionFns,
    );
    return BatchRemoveRoleOutput.fromJson(response);
  }

  /// Creates a channel in an AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelName] :
  /// The name for the channel. This must be unique per private re:Post.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  ///
  /// Parameter [channelDescription] :
  /// A description for the channel. This is used only to help you identify this
  /// channel.
  Future<CreateChannelOutput> createChannel({
    required String channelName,
    required String spaceId,
    String? channelDescription,
  }) async {
    final $payload = <String, dynamic>{
      'channelName': channelName,
      if (channelDescription != null) 'channelDescription': channelDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}/channels',
      exceptionFnMap: _exceptionFns,
    );
    return CreateChannelOutput.fromJson(response);
  }

  /// Creates an AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// The name for the private re:Post. This must be unique in your account.
  ///
  /// Parameter [subdomain] :
  /// The subdomain that you use to access your AWS re:Post Private private
  /// re:Post. All custom subdomains must be approved by AWS before use. In
  /// addition to your custom subdomain, all private re:Posts are issued an AWS
  /// generated subdomain for immediate use.
  ///
  /// Parameter [tier] :
  /// The pricing tier for the private re:Post.
  ///
  /// Parameter [description] :
  /// A description for the private re:Post. This is used only to help you
  /// identify this private re:Post.
  ///
  /// Parameter [roleArn] :
  /// The IAM role that grants permissions to the private re:Post to convert
  /// unanswered questions into AWS support tickets.
  ///
  /// Parameter [supportedEmailDomains] :
  /// <p/>
  ///
  /// Parameter [tags] :
  /// The list of tags associated with the private re:Post.
  ///
  /// Parameter [userKMSKey] :
  /// The AWS KMS key ARN that’s used for the AWS KMS encryption. If you don't
  /// provide a key, your data is encrypted by default with a key that AWS owns
  /// and manages for you.
  Future<CreateSpaceOutput> createSpace({
    required String name,
    required String subdomain,
    required TierLevel tier,
    String? description,
    String? roleArn,
    SupportedEmailDomainsParameters? supportedEmailDomains,
    Map<String, String>? tags,
    String? userKMSKey,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'subdomain': subdomain,
      'tier': tier.value,
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
      if (supportedEmailDomains != null)
        'supportedEmailDomains': supportedEmailDomains,
      if (tags != null) 'tags': tags,
      if (userKMSKey != null) 'userKMSKey': userKMSKey,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/spaces',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSpaceOutput.fromJson(response);
  }

  /// Deletes an AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  Future<void> deleteSpace({
    required String spaceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the user or group from the list of administrators of the private
  /// re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [adminId] :
  /// The ID of the admin to remove.
  ///
  /// Parameter [spaceId] :
  /// The ID of the private re:Post to remove the admin from.
  Future<void> deregisterAdmin({
    required String adminId,
    required String spaceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/spaces/${Uri.encodeComponent(spaceId)}/admins/${Uri.encodeComponent(adminId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Displays information about a channel in a private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelId] :
  /// The unique ID of the private re:Post channel.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  Future<GetChannelOutput> getChannel({
    required String channelId,
    required String spaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/spaces/${Uri.encodeComponent(spaceId)}/channels/${Uri.encodeComponent(channelId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetChannelOutput.fromJson(response);
  }

  /// Displays information about the AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [spaceId] :
  /// The ID of the private re:Post.
  Future<GetSpaceOutput> getSpace({
    required String spaceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSpaceOutput.fromJson(response);
  }

  /// Returns the list of channel within a private re:Post with some information
  /// about each channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of channels to include in the results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of channel to return. You receive this token
  /// from a previous ListChannels operation.
  Future<ListChannelsOutput> listChannels({
    required String spaceId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}/channels',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListChannelsOutput.fromJson(response);
  }

  /// Returns a list of AWS re:Post Private private re:Posts in the account with
  /// some information about each private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of private re:Posts to include in the results.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of private re:Posts to return. You receive this
  /// token from a previous ListSpaces operation.
  Future<ListSpacesOutput> listSpaces({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/spaces',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSpacesOutput.fromJson(response);
  }

  /// Returns the tags that are associated with the AWS re:Post Private resource
  /// specified by the resourceArn. The only resource that can be tagged is a
  /// private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that the tags are associated with.
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

  /// Adds a user or group to the list of administrators of the private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [adminId] :
  /// The ID of the administrator.
  ///
  /// Parameter [spaceId] :
  /// The ID of the private re:Post.
  Future<void> registerAdmin({
    required String adminId,
    required String spaceId,
  }) async {
    await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/spaces/${Uri.encodeComponent(spaceId)}/admins/${Uri.encodeComponent(adminId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Sends an invitation email to selected users and groups.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [accessorIds] :
  /// The array of identifiers for the users and groups.
  ///
  /// Parameter [body] :
  /// The body of the invite.
  ///
  /// Parameter [spaceId] :
  /// The ID of the private re:Post.
  ///
  /// Parameter [title] :
  /// The title of the invite.
  Future<void> sendInvites({
    required List<String> accessorIds,
    required String body,
    required String spaceId,
    required String title,
  }) async {
    final $payload = <String, dynamic>{
      'accessorIds': accessorIds,
      'body': body,
      'title': title,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}/invite',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associates tags with an AWS re:Post Private resource. Currently, the only
  /// resource that can be tagged is the private re:Post. If you specify a new
  /// tag key for the resource, the tag is appended to the list of tags that are
  /// associated with the resource. If you specify a tag key that’s already
  /// associated with the resource, the new tag value that you specify replaces
  /// the previous value for that tag.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource that the tag is associated with.
  ///
  /// Parameter [tags] :
  /// The list of tag keys and values that must be associated with the resource.
  /// You can associate tag keys only, tags (key and values) only, or a
  /// combination of tag keys and tags.
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

  /// Removes the association of the tag with the AWS re:Post Private resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The key values of the tag.
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

  /// Modifies an existing channel.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [channelId] :
  /// The unique ID of the private re:Post channel.
  ///
  /// Parameter [channelName] :
  /// The name for the channel. This must be unique per private re:Post.
  ///
  /// Parameter [spaceId] :
  /// The unique ID of the private re:Post.
  ///
  /// Parameter [channelDescription] :
  /// A description for the channel. This is used only to help you identify this
  /// channel.
  Future<void> updateChannel({
    required String channelId,
    required String channelName,
    required String spaceId,
    String? channelDescription,
  }) async {
    final $payload = <String, dynamic>{
      'channelName': channelName,
      if (channelDescription != null) 'channelDescription': channelDescription,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/spaces/${Uri.encodeComponent(spaceId)}/channels/${Uri.encodeComponent(channelId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Modifies an existing AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [spaceId] :
  /// The unique ID of this private re:Post.
  ///
  /// Parameter [description] :
  /// A description for the private re:Post. This is used only to help you
  /// identify this private re:Post.
  ///
  /// Parameter [roleArn] :
  /// The IAM role that grants permissions to the private re:Post to convert
  /// unanswered questions into AWS support tickets.
  ///
  /// Parameter [supportedEmailDomains] :
  /// <p/>
  ///
  /// Parameter [tier] :
  /// The pricing tier of this private re:Post.
  Future<void> updateSpace({
    required String spaceId,
    String? description,
    String? roleArn,
    SupportedEmailDomainsParameters? supportedEmailDomains,
    TierLevel? tier,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
      if (supportedEmailDomains != null)
        'supportedEmailDomains': supportedEmailDomains,
      if (tier != null) 'tier': tier.value,
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

/// @nodoc
class BatchAddChannelRoleToAccessorsOutput {
  /// An array of successfully updated identifiers.
  final List<String> addedAccessorIds;

  /// An array of errors that occurred when roles were added.
  final List<BatchError> errors;

  BatchAddChannelRoleToAccessorsOutput({
    required this.addedAccessorIds,
    required this.errors,
  });

  factory BatchAddChannelRoleToAccessorsOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchAddChannelRoleToAccessorsOutput(
      addedAccessorIds: ((json['addedAccessorIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addedAccessorIds = this.addedAccessorIds;
    final errors = this.errors;
    return {
      'addedAccessorIds': addedAccessorIds,
      'errors': errors,
    };
  }
}

/// @nodoc
class BatchAddRoleOutput {
  /// An array of successfully updated accessor identifiers.
  final List<String> addedAccessorIds;

  /// An array of errors that occurred when roles were added.
  final List<BatchError> errors;

  BatchAddRoleOutput({
    required this.addedAccessorIds,
    required this.errors,
  });

  factory BatchAddRoleOutput.fromJson(Map<String, dynamic> json) {
    return BatchAddRoleOutput(
      addedAccessorIds: ((json['addedAccessorIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final addedAccessorIds = this.addedAccessorIds;
    final errors = this.errors;
    return {
      'addedAccessorIds': addedAccessorIds,
      'errors': errors,
    };
  }
}

/// @nodoc
class BatchRemoveChannelRoleFromAccessorsOutput {
  /// An array of errors that occurred when roles were removed.
  final List<BatchError> errors;

  /// An array of successfully updated identifiers.
  final List<String> removedAccessorIds;

  BatchRemoveChannelRoleFromAccessorsOutput({
    required this.errors,
    required this.removedAccessorIds,
  });

  factory BatchRemoveChannelRoleFromAccessorsOutput.fromJson(
      Map<String, dynamic> json) {
    return BatchRemoveChannelRoleFromAccessorsOutput(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
      removedAccessorIds: ((json['removedAccessorIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final removedAccessorIds = this.removedAccessorIds;
    return {
      'errors': errors,
      'removedAccessorIds': removedAccessorIds,
    };
  }
}

/// @nodoc
class BatchRemoveRoleOutput {
  /// An array of errors that occurred when roles were removed.
  final List<BatchError> errors;

  /// An array of successfully updated accessor identifiers.
  final List<String> removedAccessorIds;

  BatchRemoveRoleOutput({
    required this.errors,
    required this.removedAccessorIds,
  });

  factory BatchRemoveRoleOutput.fromJson(Map<String, dynamic> json) {
    return BatchRemoveRoleOutput(
      errors: ((json['errors'] as List?) ?? const [])
          .nonNulls
          .map((e) => BatchError.fromJson(e as Map<String, dynamic>))
          .toList(),
      removedAccessorIds: ((json['removedAccessorIds'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final errors = this.errors;
    final removedAccessorIds = this.removedAccessorIds;
    return {
      'errors': errors,
      'removedAccessorIds': removedAccessorIds,
    };
  }
}

/// @nodoc
class CreateChannelOutput {
  /// The unique ID of the private re:Post channel.
  final String channelId;

  CreateChannelOutput({
    required this.channelId,
  });

  factory CreateChannelOutput.fromJson(Map<String, dynamic> json) {
    return CreateChannelOutput(
      channelId: (json['channelId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    return {
      'channelId': channelId,
    };
  }
}

/// @nodoc
class CreateSpaceOutput {
  /// The unique ID of the private re:Post.
  final String spaceId;

  CreateSpaceOutput({
    required this.spaceId,
  });

  factory CreateSpaceOutput.fromJson(Map<String, dynamic> json) {
    return CreateSpaceOutput(
      spaceId: (json['spaceId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final spaceId = this.spaceId;
    return {
      'spaceId': spaceId,
    };
  }
}

/// @nodoc
class GetChannelOutput {
  /// The unique ID of the private re:Post channel.
  final String channelId;

  /// The name for the channel. This must be unique per private re:Post.
  final String channelName;

  /// The status pf the channel.
  final ChannelStatus channelStatus;

  /// The date when the channel was created.
  final DateTime createDateTime;

  /// The unique ID of the private re:Post.
  final String spaceId;

  /// A description for the channel. This is used only to help you identify this
  /// channel.
  final String? channelDescription;

  /// The channel roles associated to the users and groups of the channel.
  final Map<String, List<ChannelRole>>? channelRoles;

  /// The date when the channel was deleted.
  final DateTime? deleteDateTime;

  GetChannelOutput({
    required this.channelId,
    required this.channelName,
    required this.channelStatus,
    required this.createDateTime,
    required this.spaceId,
    this.channelDescription,
    this.channelRoles,
    this.deleteDateTime,
  });

  factory GetChannelOutput.fromJson(Map<String, dynamic> json) {
    return GetChannelOutput(
      channelId: (json['channelId'] as String?) ?? '',
      channelName: (json['channelName'] as String?) ?? '',
      channelStatus:
          ChannelStatus.fromString((json['channelStatus'] as String?) ?? ''),
      createDateTime: nonNullableTimeStampFromJson(json['createDateTime'] ?? 0),
      spaceId: (json['spaceId'] as String?) ?? '',
      channelDescription: json['channelDescription'] as String?,
      channelRoles: (json['channelRoles'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k,
              (e as List)
                  .nonNulls
                  .map((e) => ChannelRole.fromString((e as String)))
                  .toList())),
      deleteDateTime: timeStampFromJson(json['deleteDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final channelName = this.channelName;
    final channelStatus = this.channelStatus;
    final createDateTime = this.createDateTime;
    final spaceId = this.spaceId;
    final channelDescription = this.channelDescription;
    final channelRoles = this.channelRoles;
    final deleteDateTime = this.deleteDateTime;
    return {
      'channelId': channelId,
      'channelName': channelName,
      'channelStatus': channelStatus.value,
      'createDateTime': iso8601ToJson(createDateTime),
      'spaceId': spaceId,
      if (channelDescription != null) 'channelDescription': channelDescription,
      if (channelRoles != null)
        'channelRoles': channelRoles
            .map((k, e) => MapEntry(k, e.map((e) => e.value).toList())),
      if (deleteDateTime != null)
        'deleteDateTime': iso8601ToJson(deleteDateTime),
    };
  }
}

/// @nodoc
class GetSpaceOutput {
  /// The ARN of the private re:Post.
  final String arn;

  /// The Identity Center identifier for the Application Instance.
  final String clientId;

  /// The configuration status of the private re:Post.
  final ConfigurationStatus configurationStatus;

  /// The date when the private re:Post was created.
  final DateTime createDateTime;

  /// The name of the private re:Post.
  final String name;

  /// The AWS generated subdomain of the private re:Post
  final String randomDomain;

  /// The unique ID of the private re:Post.
  final String spaceId;

  /// The creation or deletion status of the private re:Post.
  final String status;

  /// The storage limit of the private re:Post.
  final int storageLimit;

  /// The pricing tier of the private re:Post.
  final TierLevel tier;

  /// The custom subdomain that you use to access your private re:Post. All custom
  /// subdomains must be approved by AWS before use.
  final String vanityDomain;

  /// The approval status of the custom subdomain.
  final VanityDomainStatus vanityDomainStatus;

  /// <p/>
  final String? applicationArn;

  /// The content size of the private re:Post.
  final int? contentSize;

  /// The IAM role that grants permissions to the private re:Post to convert
  /// unanswered questions into AWS support tickets.
  final String? customerRoleArn;

  /// The date when the private re:Post was deleted.
  final DateTime? deleteDateTime;

  /// The description of the private re:Post.
  final String? description;

  /// The list of groups that are administrators of the private re:Post.
  final List<String>? groupAdmins;

  /// <p/>
  final String? identityStoreId;

  /// A map of accessor identifiers and their roles.
  final Map<String, List<Role>>? roles;

  /// <p/>
  final SupportedEmailDomainsStatus? supportedEmailDomains;

  /// The list of users that are administrators of the private re:Post.
  final List<String>? userAdmins;

  /// The number of users that have onboarded to the private re:Post.
  final int? userCount;

  /// The custom AWS KMS key ARN that’s used for the AWS KMS encryption.
  final String? userKMSKey;

  GetSpaceOutput({
    required this.arn,
    required this.clientId,
    required this.configurationStatus,
    required this.createDateTime,
    required this.name,
    required this.randomDomain,
    required this.spaceId,
    required this.status,
    required this.storageLimit,
    required this.tier,
    required this.vanityDomain,
    required this.vanityDomainStatus,
    this.applicationArn,
    this.contentSize,
    this.customerRoleArn,
    this.deleteDateTime,
    this.description,
    this.groupAdmins,
    this.identityStoreId,
    this.roles,
    this.supportedEmailDomains,
    this.userAdmins,
    this.userCount,
    this.userKMSKey,
  });

  factory GetSpaceOutput.fromJson(Map<String, dynamic> json) {
    return GetSpaceOutput(
      arn: (json['arn'] as String?) ?? '',
      clientId: (json['clientId'] as String?) ?? '',
      configurationStatus: ConfigurationStatus.fromString(
          (json['configurationStatus'] as String?) ?? ''),
      createDateTime: nonNullableTimeStampFromJson(json['createDateTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      randomDomain: (json['randomDomain'] as String?) ?? '',
      spaceId: (json['spaceId'] as String?) ?? '',
      status: (json['status'] as String?) ?? '',
      storageLimit: (json['storageLimit'] as int?) ?? 0,
      tier: TierLevel.fromString((json['tier'] as String?) ?? ''),
      vanityDomain: (json['vanityDomain'] as String?) ?? '',
      vanityDomainStatus: VanityDomainStatus.fromString(
          (json['vanityDomainStatus'] as String?) ?? ''),
      applicationArn: json['applicationArn'] as String?,
      contentSize: json['contentSize'] as int?,
      customerRoleArn: json['customerRoleArn'] as String?,
      deleteDateTime: timeStampFromJson(json['deleteDateTime']),
      description: json['description'] as String?,
      groupAdmins: (json['groupAdmins'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      identityStoreId: json['identityStoreId'] as String?,
      roles: (json['roles'] as Map<String, dynamic>?)?.map((k, e) => MapEntry(
          k,
          (e as List)
              .nonNulls
              .map((e) => Role.fromString((e as String)))
              .toList())),
      supportedEmailDomains: json['supportedEmailDomains'] != null
          ? SupportedEmailDomainsStatus.fromJson(
              json['supportedEmailDomains'] as Map<String, dynamic>)
          : null,
      userAdmins: (json['userAdmins'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      userCount: json['userCount'] as int?,
      userKMSKey: json['userKMSKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientId = this.clientId;
    final configurationStatus = this.configurationStatus;
    final createDateTime = this.createDateTime;
    final name = this.name;
    final randomDomain = this.randomDomain;
    final spaceId = this.spaceId;
    final status = this.status;
    final storageLimit = this.storageLimit;
    final tier = this.tier;
    final vanityDomain = this.vanityDomain;
    final vanityDomainStatus = this.vanityDomainStatus;
    final applicationArn = this.applicationArn;
    final contentSize = this.contentSize;
    final customerRoleArn = this.customerRoleArn;
    final deleteDateTime = this.deleteDateTime;
    final description = this.description;
    final groupAdmins = this.groupAdmins;
    final identityStoreId = this.identityStoreId;
    final roles = this.roles;
    final supportedEmailDomains = this.supportedEmailDomains;
    final userAdmins = this.userAdmins;
    final userCount = this.userCount;
    final userKMSKey = this.userKMSKey;
    return {
      'arn': arn,
      'clientId': clientId,
      'configurationStatus': configurationStatus.value,
      'createDateTime': iso8601ToJson(createDateTime),
      'name': name,
      'randomDomain': randomDomain,
      'spaceId': spaceId,
      'status': status,
      'storageLimit': storageLimit,
      'tier': tier.value,
      'vanityDomain': vanityDomain,
      'vanityDomainStatus': vanityDomainStatus.value,
      if (applicationArn != null) 'applicationArn': applicationArn,
      if (contentSize != null) 'contentSize': contentSize,
      if (customerRoleArn != null) 'customerRoleArn': customerRoleArn,
      if (deleteDateTime != null)
        'deleteDateTime': iso8601ToJson(deleteDateTime),
      if (description != null) 'description': description,
      if (groupAdmins != null) 'groupAdmins': groupAdmins,
      if (identityStoreId != null) 'identityStoreId': identityStoreId,
      if (roles != null)
        'roles':
            roles.map((k, e) => MapEntry(k, e.map((e) => e.value).toList())),
      if (supportedEmailDomains != null)
        'supportedEmailDomains': supportedEmailDomains,
      if (userAdmins != null) 'userAdmins': userAdmins,
      if (userCount != null) 'userCount': userCount,
      if (userKMSKey != null) 'userKMSKey': userKMSKey,
    };
  }
}

/// @nodoc
class ListChannelsOutput {
  /// An array of structures that contain some information about the channels in
  /// the private re:Post.
  final List<ChannelData> channels;

  /// The token that you use when you request the next set of channels.
  final String? nextToken;

  ListChannelsOutput({
    required this.channels,
    this.nextToken,
  });

  factory ListChannelsOutput.fromJson(Map<String, dynamic> json) {
    return ListChannelsOutput(
      channels: ((json['channels'] as List?) ?? const [])
          .nonNulls
          .map((e) => ChannelData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final channels = this.channels;
    final nextToken = this.nextToken;
    return {
      'channels': channels,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListSpacesOutput {
  /// An array of structures that contain some information about the private
  /// re:Posts in the account.
  final List<SpaceData> spaces;

  /// The token that you use when you request the next set of private re:Posts.
  final String? nextToken;

  ListSpacesOutput({
    required this.spaces,
    this.nextToken,
  });

  factory ListSpacesOutput.fromJson(Map<String, dynamic> json) {
    return ListSpacesOutput(
      spaces: ((json['spaces'] as List?) ?? const [])
          .nonNulls
          .map((e) => SpaceData.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final spaces = this.spaces;
    final nextToken = this.nextToken;
    return {
      'spaces': spaces,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The list of tags that are associated with the resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'tags': tags,
    };
  }
}

/// @nodoc
class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class UpdateChannelOutput {
  UpdateChannelOutput();

  factory UpdateChannelOutput.fromJson(Map<String, dynamic> _) {
    return UpdateChannelOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// @nodoc
class TierLevel {
  static const basic = TierLevel._('BASIC');
  static const standard = TierLevel._('STANDARD');

  final String value;

  const TierLevel._(this.value);

  static const values = [basic, standard];

  static TierLevel fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => TierLevel._(value));

  @override
  bool operator ==(other) => other is TierLevel && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// <p/>
///
/// @nodoc
class SupportedEmailDomainsParameters {
  /// <p/>
  final List<String>? allowedDomains;

  /// <p/>
  final FeatureEnableParameter? enabled;

  SupportedEmailDomainsParameters({
    this.allowedDomains,
    this.enabled,
  });

  Map<String, dynamic> toJson() {
    final allowedDomains = this.allowedDomains;
    final enabled = this.enabled;
    return {
      if (allowedDomains != null) 'allowedDomains': allowedDomains,
      if (enabled != null) 'enabled': enabled.value,
    };
  }
}

/// @nodoc
class FeatureEnableParameter {
  static const enabled = FeatureEnableParameter._('ENABLED');
  static const disabled = FeatureEnableParameter._('DISABLED');

  final String value;

  const FeatureEnableParameter._(this.value);

  static const values = [enabled, disabled];

  static FeatureEnableParameter fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FeatureEnableParameter._(value));

  @override
  bool operator ==(other) =>
      other is FeatureEnableParameter && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains some information about a private re:Post in the
/// account.
///
/// @nodoc
class SpaceData {
  /// The ARN of the private re:Post.
  final String arn;

  /// The configuration status of the private re:Post.
  final ConfigurationStatus configurationStatus;

  /// The date when the private re:Post was created.
  final DateTime createDateTime;

  /// The name for the private re:Post.
  final String name;

  /// The AWS generated subdomain of the private re:Post.
  final String randomDomain;

  /// The unique ID of the private re:Post.
  final String spaceId;

  /// The creation/deletion status of the private re:Post.
  final String status;

  /// The storage limit of the private re:Post.
  final int storageLimit;

  /// The pricing tier of the private re:Post.
  final TierLevel tier;

  /// This custom subdomain that you use to access your private re:Post. All
  /// custom subdomains must be approved by AWS before use.
  final String vanityDomain;

  /// This approval status of the custom subdomain.
  final VanityDomainStatus vanityDomainStatus;

  /// The content size of the private re:Post.
  final int? contentSize;

  /// The date when the private re:Post was deleted.
  final DateTime? deleteDateTime;

  /// The description for the private re:Post. This is used only to help you
  /// identify this private re:Post.
  final String? description;

  /// <p/>
  final SupportedEmailDomainsStatus? supportedEmailDomains;

  /// The number of onboarded users to the private re:Post.
  final int? userCount;

  /// The custom AWS KMS key ARN that’s used for the AWS KMS encryption.
  final String? userKMSKey;

  SpaceData({
    required this.arn,
    required this.configurationStatus,
    required this.createDateTime,
    required this.name,
    required this.randomDomain,
    required this.spaceId,
    required this.status,
    required this.storageLimit,
    required this.tier,
    required this.vanityDomain,
    required this.vanityDomainStatus,
    this.contentSize,
    this.deleteDateTime,
    this.description,
    this.supportedEmailDomains,
    this.userCount,
    this.userKMSKey,
  });

  factory SpaceData.fromJson(Map<String, dynamic> json) {
    return SpaceData(
      arn: (json['arn'] as String?) ?? '',
      configurationStatus: ConfigurationStatus.fromString(
          (json['configurationStatus'] as String?) ?? ''),
      createDateTime: nonNullableTimeStampFromJson(json['createDateTime'] ?? 0),
      name: (json['name'] as String?) ?? '',
      randomDomain: (json['randomDomain'] as String?) ?? '',
      spaceId: (json['spaceId'] as String?) ?? '',
      status: (json['status'] as String?) ?? '',
      storageLimit: (json['storageLimit'] as int?) ?? 0,
      tier: TierLevel.fromString((json['tier'] as String?) ?? ''),
      vanityDomain: (json['vanityDomain'] as String?) ?? '',
      vanityDomainStatus: VanityDomainStatus.fromString(
          (json['vanityDomainStatus'] as String?) ?? ''),
      contentSize: json['contentSize'] as int?,
      deleteDateTime: timeStampFromJson(json['deleteDateTime']),
      description: json['description'] as String?,
      supportedEmailDomains: json['supportedEmailDomains'] != null
          ? SupportedEmailDomainsStatus.fromJson(
              json['supportedEmailDomains'] as Map<String, dynamic>)
          : null,
      userCount: json['userCount'] as int?,
      userKMSKey: json['userKMSKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final configurationStatus = this.configurationStatus;
    final createDateTime = this.createDateTime;
    final name = this.name;
    final randomDomain = this.randomDomain;
    final spaceId = this.spaceId;
    final status = this.status;
    final storageLimit = this.storageLimit;
    final tier = this.tier;
    final vanityDomain = this.vanityDomain;
    final vanityDomainStatus = this.vanityDomainStatus;
    final contentSize = this.contentSize;
    final deleteDateTime = this.deleteDateTime;
    final description = this.description;
    final supportedEmailDomains = this.supportedEmailDomains;
    final userCount = this.userCount;
    final userKMSKey = this.userKMSKey;
    return {
      'arn': arn,
      'configurationStatus': configurationStatus.value,
      'createDateTime': iso8601ToJson(createDateTime),
      'name': name,
      'randomDomain': randomDomain,
      'spaceId': spaceId,
      'status': status,
      'storageLimit': storageLimit,
      'tier': tier.value,
      'vanityDomain': vanityDomain,
      'vanityDomainStatus': vanityDomainStatus.value,
      if (contentSize != null) 'contentSize': contentSize,
      if (deleteDateTime != null)
        'deleteDateTime': iso8601ToJson(deleteDateTime),
      if (description != null) 'description': description,
      if (supportedEmailDomains != null)
        'supportedEmailDomains': supportedEmailDomains,
      if (userCount != null) 'userCount': userCount,
      if (userKMSKey != null) 'userKMSKey': userKMSKey,
    };
  }
}

/// @nodoc
class ConfigurationStatus {
  static const configured = ConfigurationStatus._('CONFIGURED');
  static const unconfigured = ConfigurationStatus._('UNCONFIGURED');

  final String value;

  const ConfigurationStatus._(this.value);

  static const values = [configured, unconfigured];

  static ConfigurationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationStatus._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class VanityDomainStatus {
  static const pending = VanityDomainStatus._('PENDING');
  static const approved = VanityDomainStatus._('APPROVED');
  static const unapproved = VanityDomainStatus._('UNAPPROVED');

  final String value;

  const VanityDomainStatus._(this.value);

  static const values = [pending, approved, unapproved];

  static VanityDomainStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => VanityDomainStatus._(value));

  @override
  bool operator ==(other) =>
      other is VanityDomainStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// <p/>
///
/// @nodoc
class SupportedEmailDomainsStatus {
  /// <p/>
  final List<String>? allowedDomains;

  /// <p/>
  final FeatureEnableStatus? enabled;

  SupportedEmailDomainsStatus({
    this.allowedDomains,
    this.enabled,
  });

  factory SupportedEmailDomainsStatus.fromJson(Map<String, dynamic> json) {
    return SupportedEmailDomainsStatus(
      allowedDomains: (json['allowedDomains'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      enabled:
          (json['enabled'] as String?)?.let(FeatureEnableStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedDomains = this.allowedDomains;
    final enabled = this.enabled;
    return {
      if (allowedDomains != null) 'allowedDomains': allowedDomains,
      if (enabled != null) 'enabled': enabled.value,
    };
  }
}

/// @nodoc
class FeatureEnableStatus {
  static const enabled = FeatureEnableStatus._('ENABLED');
  static const disabled = FeatureEnableStatus._('DISABLED');
  static const notAllowed = FeatureEnableStatus._('NOT_ALLOWED');

  final String value;

  const FeatureEnableStatus._(this.value);

  static const values = [enabled, disabled, notAllowed];

  static FeatureEnableStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FeatureEnableStatus._(value));

  @override
  bool operator ==(other) =>
      other is FeatureEnableStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A structure that contains some information about a channel in a private
/// re:Post.
///
/// @nodoc
class ChannelData {
  /// The unique ID of the private re:Post channel.
  final String channelId;

  /// The name for the channel. This must be unique per private re:Post.
  final String channelName;

  /// The status pf the channel.
  final ChannelStatus channelStatus;

  /// The date when the channel was created.
  final DateTime createDateTime;

  /// The number of groups that are part of the channel.
  final int groupCount;

  /// The unique ID of the private re:Post.
  final String spaceId;

  /// The number of users that are part of the channel.
  final int userCount;

  /// A description for the channel. This is used only to help you identify this
  /// channel.
  final String? channelDescription;

  /// The date when the channel was deleted.
  final DateTime? deleteDateTime;

  ChannelData({
    required this.channelId,
    required this.channelName,
    required this.channelStatus,
    required this.createDateTime,
    required this.groupCount,
    required this.spaceId,
    required this.userCount,
    this.channelDescription,
    this.deleteDateTime,
  });

  factory ChannelData.fromJson(Map<String, dynamic> json) {
    return ChannelData(
      channelId: (json['channelId'] as String?) ?? '',
      channelName: (json['channelName'] as String?) ?? '',
      channelStatus:
          ChannelStatus.fromString((json['channelStatus'] as String?) ?? ''),
      createDateTime: nonNullableTimeStampFromJson(json['createDateTime'] ?? 0),
      groupCount: (json['groupCount'] as int?) ?? 0,
      spaceId: (json['spaceId'] as String?) ?? '',
      userCount: (json['userCount'] as int?) ?? 0,
      channelDescription: json['channelDescription'] as String?,
      deleteDateTime: timeStampFromJson(json['deleteDateTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final channelId = this.channelId;
    final channelName = this.channelName;
    final channelStatus = this.channelStatus;
    final createDateTime = this.createDateTime;
    final groupCount = this.groupCount;
    final spaceId = this.spaceId;
    final userCount = this.userCount;
    final channelDescription = this.channelDescription;
    final deleteDateTime = this.deleteDateTime;
    return {
      'channelId': channelId,
      'channelName': channelName,
      'channelStatus': channelStatus.value,
      'createDateTime': iso8601ToJson(createDateTime),
      'groupCount': groupCount,
      'spaceId': spaceId,
      'userCount': userCount,
      if (channelDescription != null) 'channelDescription': channelDescription,
      if (deleteDateTime != null)
        'deleteDateTime': iso8601ToJson(deleteDateTime),
    };
  }
}

/// @nodoc
class ChannelStatus {
  static const created = ChannelStatus._('CREATED');
  static const creating = ChannelStatus._('CREATING');
  static const createFailed = ChannelStatus._('CREATE_FAILED');
  static const deleted = ChannelStatus._('DELETED');
  static const deleting = ChannelStatus._('DELETING');
  static const deleteFailed = ChannelStatus._('DELETE_FAILED');

  final String value;

  const ChannelStatus._(this.value);

  static const values = [
    created,
    creating,
    createFailed,
    deleted,
    deleting,
    deleteFailed
  ];

  static ChannelStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ChannelStatus._(value));

  @override
  bool operator ==(other) => other is ChannelStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class Role {
  static const expert = Role._('EXPERT');
  static const moderator = Role._('MODERATOR');
  static const administrator = Role._('ADMINISTRATOR');
  static const supportrequestor = Role._('SUPPORTREQUESTOR');

  final String value;

  const Role._(this.value);

  static const values = [expert, moderator, administrator, supportrequestor];

  static Role fromString(String value) =>
      values.firstWhere((e) => e.value == value, orElse: () => Role._(value));

  @override
  bool operator ==(other) => other is Role && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// @nodoc
class ChannelRole {
  static const asker = ChannelRole._('ASKER');
  static const expert = ChannelRole._('EXPERT');
  static const moderator = ChannelRole._('MODERATOR');
  static const supportrequestor = ChannelRole._('SUPPORTREQUESTOR');

  final String value;

  const ChannelRole._(this.value);

  static const values = [asker, expert, moderator, supportrequestor];

  static ChannelRole fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ChannelRole._(value));

  @override
  bool operator ==(other) => other is ChannelRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// An error that occurred during a batch operation.
///
/// @nodoc
class BatchError {
  /// The accessor identifier that's related to the error.
  final String accessorId;

  /// The error code.
  final int error;

  /// Description of the error.
  final String message;

  BatchError({
    required this.accessorId,
    required this.error,
    required this.message,
  });

  factory BatchError.fromJson(Map<String, dynamic> json) {
    return BatchError(
      accessorId: (json['accessorId'] as String?) ?? '',
      error: (json['error'] as int?) ?? 0,
      message: (json['message'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final accessorId = this.accessorId;
    final error = this.error;
    final message = this.message;
    return {
      'accessorId': accessorId,
      'error': error,
      'message': message,
    };
  }
}

/// @nodoc
class AccessDeniedException extends _s.GenericAwsException {
  AccessDeniedException({String? type, String? message})
      : super(type: type, code: 'AccessDeniedException', message: message);
}

/// @nodoc
class ConflictException extends _s.GenericAwsException {
  ConflictException({String? type, String? message})
      : super(type: type, code: 'ConflictException', message: message);
}

/// @nodoc
class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

/// @nodoc
class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

/// @nodoc
class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
}

/// @nodoc
class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

/// @nodoc
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
