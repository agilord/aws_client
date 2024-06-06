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
class RePostPrivate {
  final _s.RestJsonProtocol _protocol;
  RePostPrivate({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'repostspace',
            signingName: 'repostspace',
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

  /// Creates an AWS re:Post Private private re:Post.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
    Map<String, String>? tags,
    String? userKMSKey,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'subdomain': subdomain,
      'tier': tier.toValue(),
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Displays information about the AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Returns a list of AWS re:Post Private private re:Posts in the account with
  /// some information about each private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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

  /// Modifies an existing AWS re:Post Private private re:Post.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
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
  /// Parameter [tier] :
  /// The pricing tier of this private re:Post.
  Future<void> updateSpace({
    required String spaceId,
    String? description,
    String? roleArn,
    TierLevel? tier,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (roleArn != null) 'roleArn': roleArn,
      if (tier != null) 'tier': tier.toValue(),
    };
    await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/spaces/${Uri.encodeComponent(spaceId)}',
      exceptionFnMap: _exceptionFns,
    );
  }
}

enum ConfigurationStatus {
  configured,
  unconfigured,
}

extension ConfigurationStatusValueExtension on ConfigurationStatus {
  String toValue() {
    switch (this) {
      case ConfigurationStatus.configured:
        return 'CONFIGURED';
      case ConfigurationStatus.unconfigured:
        return 'UNCONFIGURED';
    }
  }
}

extension ConfigurationStatusFromString on String {
  ConfigurationStatus toConfigurationStatus() {
    switch (this) {
      case 'CONFIGURED':
        return ConfigurationStatus.configured;
      case 'UNCONFIGURED':
        return ConfigurationStatus.unconfigured;
    }
    throw Exception('$this is not known in enum ConfigurationStatus');
  }
}

class CreateSpaceOutput {
  /// The unique ID of the private re:Post.
  final String spaceId;

  CreateSpaceOutput({
    required this.spaceId,
  });

  factory CreateSpaceOutput.fromJson(Map<String, dynamic> json) {
    return CreateSpaceOutput(
      spaceId: json['spaceId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final spaceId = this.spaceId;
    return {
      'spaceId': spaceId,
    };
  }
}

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
    this.contentSize,
    this.customerRoleArn,
    this.deleteDateTime,
    this.description,
    this.groupAdmins,
    this.userAdmins,
    this.userCount,
    this.userKMSKey,
  });

  factory GetSpaceOutput.fromJson(Map<String, dynamic> json) {
    return GetSpaceOutput(
      arn: json['arn'] as String,
      clientId: json['clientId'] as String,
      configurationStatus:
          (json['configurationStatus'] as String).toConfigurationStatus(),
      createDateTime:
          nonNullableTimeStampFromJson(json['createDateTime'] as Object),
      name: json['name'] as String,
      randomDomain: json['randomDomain'] as String,
      spaceId: json['spaceId'] as String,
      status: json['status'] as String,
      storageLimit: json['storageLimit'] as int,
      tier: (json['tier'] as String).toTierLevel(),
      vanityDomain: json['vanityDomain'] as String,
      vanityDomainStatus:
          (json['vanityDomainStatus'] as String).toVanityDomainStatus(),
      contentSize: json['contentSize'] as int?,
      customerRoleArn: json['customerRoleArn'] as String?,
      deleteDateTime: timeStampFromJson(json['deleteDateTime']),
      description: json['description'] as String?,
      groupAdmins: (json['groupAdmins'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      userAdmins: (json['userAdmins'] as List?)
          ?.whereNotNull()
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
    final contentSize = this.contentSize;
    final customerRoleArn = this.customerRoleArn;
    final deleteDateTime = this.deleteDateTime;
    final description = this.description;
    final groupAdmins = this.groupAdmins;
    final userAdmins = this.userAdmins;
    final userCount = this.userCount;
    final userKMSKey = this.userKMSKey;
    return {
      'arn': arn,
      'clientId': clientId,
      'configurationStatus': configurationStatus.toValue(),
      'createDateTime': iso8601ToJson(createDateTime),
      'name': name,
      'randomDomain': randomDomain,
      'spaceId': spaceId,
      'status': status,
      'storageLimit': storageLimit,
      'tier': tier.toValue(),
      'vanityDomain': vanityDomain,
      'vanityDomainStatus': vanityDomainStatus.toValue(),
      if (contentSize != null) 'contentSize': contentSize,
      if (customerRoleArn != null) 'customerRoleArn': customerRoleArn,
      if (deleteDateTime != null)
        'deleteDateTime': iso8601ToJson(deleteDateTime),
      if (description != null) 'description': description,
      if (groupAdmins != null) 'groupAdmins': groupAdmins,
      if (userAdmins != null) 'userAdmins': userAdmins,
      if (userCount != null) 'userCount': userCount,
      if (userKMSKey != null) 'userKMSKey': userKMSKey,
    };
  }
}

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
      spaces: (json['spaces'] as List)
          .whereNotNull()
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

/// A structure that contains some information about a private re:Post in the
/// account.
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
    this.userCount,
    this.userKMSKey,
  });

  factory SpaceData.fromJson(Map<String, dynamic> json) {
    return SpaceData(
      arn: json['arn'] as String,
      configurationStatus:
          (json['configurationStatus'] as String).toConfigurationStatus(),
      createDateTime:
          nonNullableTimeStampFromJson(json['createDateTime'] as Object),
      name: json['name'] as String,
      randomDomain: json['randomDomain'] as String,
      spaceId: json['spaceId'] as String,
      status: json['status'] as String,
      storageLimit: json['storageLimit'] as int,
      tier: (json['tier'] as String).toTierLevel(),
      vanityDomain: json['vanityDomain'] as String,
      vanityDomainStatus:
          (json['vanityDomainStatus'] as String).toVanityDomainStatus(),
      contentSize: json['contentSize'] as int?,
      deleteDateTime: timeStampFromJson(json['deleteDateTime']),
      description: json['description'] as String?,
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
    final userCount = this.userCount;
    final userKMSKey = this.userKMSKey;
    return {
      'arn': arn,
      'configurationStatus': configurationStatus.toValue(),
      'createDateTime': iso8601ToJson(createDateTime),
      'name': name,
      'randomDomain': randomDomain,
      'spaceId': spaceId,
      'status': status,
      'storageLimit': storageLimit,
      'tier': tier.toValue(),
      'vanityDomain': vanityDomain,
      'vanityDomainStatus': vanityDomainStatus.toValue(),
      if (contentSize != null) 'contentSize': contentSize,
      if (deleteDateTime != null)
        'deleteDateTime': iso8601ToJson(deleteDateTime),
      if (description != null) 'description': description,
      if (userCount != null) 'userCount': userCount,
      if (userKMSKey != null) 'userKMSKey': userKMSKey,
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

enum TierLevel {
  basic,
  standard,
}

extension TierLevelValueExtension on TierLevel {
  String toValue() {
    switch (this) {
      case TierLevel.basic:
        return 'BASIC';
      case TierLevel.standard:
        return 'STANDARD';
    }
  }
}

extension TierLevelFromString on String {
  TierLevel toTierLevel() {
    switch (this) {
      case 'BASIC':
        return TierLevel.basic;
      case 'STANDARD':
        return TierLevel.standard;
    }
    throw Exception('$this is not known in enum TierLevel');
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

enum VanityDomainStatus {
  pending,
  approved,
  unapproved,
}

extension VanityDomainStatusValueExtension on VanityDomainStatus {
  String toValue() {
    switch (this) {
      case VanityDomainStatus.pending:
        return 'PENDING';
      case VanityDomainStatus.approved:
        return 'APPROVED';
      case VanityDomainStatus.unapproved:
        return 'UNAPPROVED';
    }
  }
}

extension VanityDomainStatusFromString on String {
  VanityDomainStatus toVanityDomainStatus() {
    switch (this) {
      case 'PENDING':
        return VanityDomainStatus.pending;
      case 'APPROVED':
        return VanityDomainStatus.approved;
      case 'UNAPPROVED':
        return VanityDomainStatus.unapproved;
    }
    throw Exception('$this is not known in enum VanityDomainStatus');
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
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
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
