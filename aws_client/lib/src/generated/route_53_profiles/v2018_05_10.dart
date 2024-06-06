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

/// With Amazon Route 53 Profiles you can share Route 53 configurations with
/// VPCs and AWS accounts
class Route53Profiles {
  final _s.RestJsonProtocol _protocol;
  Route53Profiles({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'route53profiles',
            signingName: 'route53profiles',
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

  /// Associates a Route 53 Profiles profile with a VPC. A VPC can have only one
  /// Profile associated with it, but a Profile can be associated with 1000 of
  /// VPCs (and you can request a higher quota). For more information, see <a
  /// href="https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html#limits-api-entities">https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/DNSLimitations.html#limits-api-entities</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ResourceExistsException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// A name for the association.
  ///
  /// Parameter [profileId] :
  /// ID of the Profile.
  ///
  /// Parameter [resourceId] :
  /// The ID of the VPC.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to identify the Profile
  /// association.
  Future<AssociateProfileResponse> associateProfile({
    required String name,
    required String profileId,
    required String resourceId,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ProfileId': profileId,
      'ResourceId': resourceId,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/profileassociation',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateProfileResponse.fromJson(response);
  }

  /// Associates a DNS reource configuration to a Route 53 Profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// Name for the resource association.
  ///
  /// Parameter [profileId] :
  /// ID of the Profile.
  ///
  /// Parameter [resourceArn] :
  /// Amazon resource number, ARN, of the DNS resource.
  ///
  /// Parameter [resourceProperties] :
  /// If you are adding a DNS Firewall rule group, include also a priority. The
  /// priority indicates the processing order for the rule groups, starting with
  /// the priority assinged the lowest value.
  ///
  /// The allowed values for priority are between 100 and 9900.
  Future<AssociateResourceToProfileResponse> associateResourceToProfile({
    required String name,
    required String profileId,
    required String resourceArn,
    String? resourceProperties,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ProfileId': profileId,
      'ResourceArn': resourceArn,
      if (resourceProperties != null) 'ResourceProperties': resourceProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/profileresourceassociation',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateResourceToProfileResponse.fromJson(response);
  }

  /// Creates an empty Route 53 Profile.
  ///
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [name] :
  /// A name for the Profile.
  ///
  /// Parameter [clientToken] :
  /// <code>ClientToken</code> is an idempotency token that ensures a call to
  /// <code>CreateProfile</code> completes only once. You choose the value to
  /// pass. For example, an issue might prevent you from getting a response from
  /// <code>CreateProfile</code>. In this case, safely retry your call to
  /// <code>CreateProfile</code> by using the same <code>CreateProfile</code>
  /// parameter value.
  ///
  /// Parameter [tags] :
  /// A list of the tag keys and values that you want to associate with the
  /// Route 53 Profile.
  Future<CreateProfileResponse> createProfile({
    required String name,
    String? clientToken,
    List<Tag>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'Name': name,
      'ClientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/profile',
      exceptionFnMap: _exceptionFns,
    );
    return CreateProfileResponse.fromJson(response);
  }

  /// Deletes the specified Route 53 Profile. Before you can delete a profile,
  /// you must first disassociate it from all VPCs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [profileId] :
  /// The ID of the Profile that you want to delete.
  Future<DeleteProfileResponse> deleteProfile({
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteProfileResponse.fromJson(response);
  }

  /// Dissociates a specified Route 53 Profile from the specified VPC.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// ID of the Profile.
  ///
  /// Parameter [resourceId] :
  /// The ID of the VPC.
  Future<DisassociateProfileResponse> disassociateProfile({
    required String profileId,
    required String resourceId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/profileassociation/Profileid/${Uri.encodeComponent(profileId)}/resourceid/${Uri.encodeComponent(resourceId)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateProfileResponse.fromJson(response);
  }

  /// Dissoaciated a specified resource, from the Route 53 Profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [profileId] :
  /// The ID of the Profile.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  Future<DisassociateResourceFromProfileResponse>
      disassociateResourceFromProfile({
    required String profileId,
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/profileresourceassociation/profileid/${Uri.encodeComponent(profileId)}/resourcearn/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateResourceFromProfileResponse.fromJson(response);
  }

  /// Returns information about a specified Route 53 Profile, such as whether
  /// whether the Profile is shared, and the current status of the Profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileId] :
  /// ID of the Profile.
  Future<GetProfileResponse> getProfile({
    required String profileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/profile/${Uri.encodeComponent(profileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileResponse.fromJson(response);
  }

  /// Retrieves a Route 53 Profile association for a VPC. A VPC can have only
  /// one Profile association, but a Profile can be associated with up to 5000
  /// VPCs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileAssociationId] :
  /// The identifier of the association you want to get information about.
  Future<GetProfileAssociationResponse> getProfileAssociation({
    required String profileAssociationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profileassociation/${Uri.encodeComponent(profileAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileAssociationResponse.fromJson(response);
  }

  /// Returns information about a specified Route 53 Profile resource
  /// association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [profileResourceAssociationId] :
  ///
  /// The ID of the profile resource association that you want to get
  /// information about.
  ///
  Future<GetProfileResourceAssociationResponse> getProfileResourceAssociation({
    required String profileResourceAssociationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profileresourceassociation/${Uri.encodeComponent(profileResourceAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetProfileResourceAssociationResponse.fromJson(response);
  }

  /// Lists all the VPCs that the specified Route 53 Profile is associated with.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want to return for this request. If
  /// more objects are available, in the response, a <code>NextToken</code>
  /// value, which you can use in a subsequent call to get the next batch of
  /// objects, is provided.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, up to 100
  /// objects are returned.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, at most the number of objects
  /// specified by <code>MaxResults</code> is returned. If more objects are
  /// available for retrieval, a <code>NextToken</code> value is returned in the
  /// response. To retrieve the next batch of objects, use the token that was
  /// returned for the prior request in your next request.
  ///
  /// Parameter [profileId] :
  /// ID of the Profile.
  ///
  /// Parameter [resourceId] :
  /// ID of the VPC.
  Future<ListProfileAssociationsResponse> listProfileAssociations({
    int? maxResults,
    String? nextToken,
    String? profileId,
    String? resourceId,
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
      if (profileId != null) 'profileId': [profileId],
      if (resourceId != null) 'resourceId': [resourceId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/profileassociations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileAssociationsResponse.fromJson(response);
  }

  /// Lists all the resource associations for the specified Route 53 Profile.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [profileId] :
  /// The ID of the Profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want to return for this request. If
  /// more objects are available, in the response, a <code>NextToken</code>
  /// value, which you can use in a subsequent call to get the next batch of
  /// objects, is provided.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, up to 100
  /// objects are returned.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, at most the number of objects
  /// specified by <code>MaxResults</code> is returned. If more objects are
  /// available for retrieval, a <code>NextToken</code> value is returned in the
  /// response. To retrieve the next batch of objects, use the token that was
  /// returned for the prior request in your next request.
  ///
  /// Parameter [resourceType] :
  /// ID of a resource if you want information on only one type.
  Future<ListProfileResourceAssociationsResponse>
      listProfileResourceAssociations({
    required String profileId,
    int? maxResults,
    String? nextToken,
    String? resourceType,
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
      if (resourceType != null) 'resourceType': [resourceType],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/profileresourceassociations/profileid/${Uri.encodeComponent(profileId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfileResourceAssociationsResponse.fromJson(response);
  }

  /// Lists all the Route 53 Profiles associated with your Amazon Web Services
  /// account.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InvalidNextTokenException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects that you want to return for this request. If
  /// more objects are available, in the response, a <code>NextToken</code>
  /// value, which you can use in a subsequent call to get the next batch of
  /// objects, is provided.
  ///
  /// If you don't specify a value for <code>MaxResults</code>, up to 100
  /// objects are returned.
  ///
  /// Parameter [nextToken] :
  /// For the first call to this list request, omit this value.
  ///
  /// When you request a list of objects, at most the number of objects
  /// specified by <code>MaxResults</code> is returned. If more objects are
  /// available for retrieval, a <code>NextToken</code> value is returned in the
  /// response. To retrieve the next batch of objects, use the token that was
  /// returned for the prior request in your next request.
  Future<ListProfilesResponse> listProfiles({
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
      requestUri: '/profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListProfilesResponse.fromJson(response);
  }

  /// Lists the tags that you associated with the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that you want to list the
  /// tags for.
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

  /// Adds one or more tags to a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that you want to add tags
  /// to.
  ///
  /// Parameter [tags] :
  /// The tags that you want to add to the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes one or more tags from a specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) for the resource that you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tags that you want to remove to the specified resource.
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

  /// Updates the specified Route 53 Profile resourse association.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [InternalServiceErrorException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [profileResourceAssociationId] :
  /// ID of the resource association.
  ///
  /// Parameter [name] :
  /// Name of the resource association.
  ///
  /// Parameter [resourceProperties] :
  /// If you are adding a DNS Firewall rule group, include also a priority. The
  /// priority indicates the processing order for the rule groups, starting with
  /// the priority assinged the lowest value.
  ///
  /// The allowed values for priority are between 100 and 9900.
  Future<UpdateProfileResourceAssociationResponse>
      updateProfileResourceAssociation({
    required String profileResourceAssociationId,
    String? name,
    String? resourceProperties,
  }) async {
    final $payload = <String, dynamic>{
      if (name != null) 'Name': name,
      if (resourceProperties != null) 'ResourceProperties': resourceProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/profileresourceassociation/${Uri.encodeComponent(profileResourceAssociationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateProfileResourceAssociationResponse.fromJson(response);
  }
}

class AssociateProfileResponse {
  /// The association that you just created. The association has an ID that you
  /// can use to identify it in other requests, like update and delete.
  final ProfileAssociation? profileAssociation;

  AssociateProfileResponse({
    this.profileAssociation,
  });

  factory AssociateProfileResponse.fromJson(Map<String, dynamic> json) {
    return AssociateProfileResponse(
      profileAssociation: json['ProfileAssociation'] != null
          ? ProfileAssociation.fromJson(
              json['ProfileAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileAssociation = this.profileAssociation;
    return {
      if (profileAssociation != null) 'ProfileAssociation': profileAssociation,
    };
  }
}

class AssociateResourceToProfileResponse {
  /// Infromation about the <code>AssociateResourceToProfile</code>, including a
  /// status message.
  final ProfileResourceAssociation? profileResourceAssociation;

  AssociateResourceToProfileResponse({
    this.profileResourceAssociation,
  });

  factory AssociateResourceToProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateResourceToProfileResponse(
      profileResourceAssociation: json['ProfileResourceAssociation'] != null
          ? ProfileResourceAssociation.fromJson(
              json['ProfileResourceAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileResourceAssociation = this.profileResourceAssociation;
    return {
      if (profileResourceAssociation != null)
        'ProfileResourceAssociation': profileResourceAssociation,
    };
  }
}

class CreateProfileResponse {
  /// The Profile that you just created.
  final Profile? profile;

  CreateProfileResponse({
    this.profile,
  });

  factory CreateProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateProfileResponse(
      profile: json['Profile'] != null
          ? Profile.fromJson(json['Profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      if (profile != null) 'Profile': profile,
    };
  }
}

class DeleteProfileResponse {
  /// Information about the <code>DeleteProfile</code> request, including the
  /// status of the request.
  final Profile? profile;

  DeleteProfileResponse({
    this.profile,
  });

  factory DeleteProfileResponse.fromJson(Map<String, dynamic> json) {
    return DeleteProfileResponse(
      profile: json['Profile'] != null
          ? Profile.fromJson(json['Profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      if (profile != null) 'Profile': profile,
    };
  }
}

class DisassociateProfileResponse {
  /// Information about the <code>DisassociateProfile</code> request.
  final ProfileAssociation? profileAssociation;

  DisassociateProfileResponse({
    this.profileAssociation,
  });

  factory DisassociateProfileResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateProfileResponse(
      profileAssociation: json['ProfileAssociation'] != null
          ? ProfileAssociation.fromJson(
              json['ProfileAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileAssociation = this.profileAssociation;
    return {
      if (profileAssociation != null) 'ProfileAssociation': profileAssociation,
    };
  }
}

class DisassociateResourceFromProfileResponse {
  /// Information about the <code>DisassociateResourceFromProfile</code> request,
  /// including the status of the request.
  final ProfileResourceAssociation? profileResourceAssociation;

  DisassociateResourceFromProfileResponse({
    this.profileResourceAssociation,
  });

  factory DisassociateResourceFromProfileResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResourceFromProfileResponse(
      profileResourceAssociation: json['ProfileResourceAssociation'] != null
          ? ProfileResourceAssociation.fromJson(
              json['ProfileResourceAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileResourceAssociation = this.profileResourceAssociation;
    return {
      if (profileResourceAssociation != null)
        'ProfileResourceAssociation': profileResourceAssociation,
    };
  }
}

class GetProfileAssociationResponse {
  /// Information about the Profile association that you specified in a
  /// <code>GetProfileAssociation</code> request.
  final ProfileAssociation? profileAssociation;

  GetProfileAssociationResponse({
    this.profileAssociation,
  });

  factory GetProfileAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileAssociationResponse(
      profileAssociation: json['ProfileAssociation'] != null
          ? ProfileAssociation.fromJson(
              json['ProfileAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileAssociation = this.profileAssociation;
    return {
      if (profileAssociation != null) 'ProfileAssociation': profileAssociation,
    };
  }
}

class GetProfileResourceAssociationResponse {
  /// Information about the Profile resource association that you specified in a
  /// <code>GetProfileResourceAssociation</code> request.
  final ProfileResourceAssociation? profileResourceAssociation;

  GetProfileResourceAssociationResponse({
    this.profileResourceAssociation,
  });

  factory GetProfileResourceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetProfileResourceAssociationResponse(
      profileResourceAssociation: json['ProfileResourceAssociation'] != null
          ? ProfileResourceAssociation.fromJson(
              json['ProfileResourceAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileResourceAssociation = this.profileResourceAssociation;
    return {
      if (profileResourceAssociation != null)
        'ProfileResourceAssociation': profileResourceAssociation,
    };
  }
}

class GetProfileResponse {
  /// Information about the Profile, including the status of the Profile.
  final Profile? profile;

  GetProfileResponse({
    this.profile,
  });

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetProfileResponse(
      profile: json['Profile'] != null
          ? Profile.fromJson(json['Profile'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profile = this.profile;
    return {
      if (profile != null) 'Profile': profile,
    };
  }
}

class ListProfileAssociationsResponse {
  /// If more than <code>MaxResults</code> profile associations match the
  /// specified criteria, you can submit another
  /// <code>ListProfileAssociations</code> request to get the next group of
  /// results. In the next request, specify the value of <code>NextToken</code>
  /// from the previous response.
  final String? nextToken;

  /// A complex type that containts settings information about the profile's VPC
  /// associations.
  final List<ProfileAssociation>? profileAssociations;

  ListProfileAssociationsResponse({
    this.nextToken,
    this.profileAssociations,
  });

  factory ListProfileAssociationsResponse.fromJson(Map<String, dynamic> json) {
    return ListProfileAssociationsResponse(
      nextToken: json['NextToken'] as String?,
      profileAssociations: (json['ProfileAssociations'] as List?)
          ?.whereNotNull()
          .map((e) => ProfileAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final profileAssociations = this.profileAssociations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (profileAssociations != null)
        'ProfileAssociations': profileAssociations,
    };
  }
}

class ListProfileResourceAssociationsResponse {
  /// If more than <code>MaxResults</code> resource associations match the
  /// specified criteria, you can submit another
  /// <code>ListProfileResourceAssociations</code> request to get the next group
  /// of results. In the next request, specify the value of <code>NextToken</code>
  /// from the previous response.
  final String? nextToken;

  /// Information about the profile resource association that you specified in a
  /// <code>GetProfileResourceAssociation</code> request.
  final List<ProfileResourceAssociation>? profileResourceAssociations;

  ListProfileResourceAssociationsResponse({
    this.nextToken,
    this.profileResourceAssociations,
  });

  factory ListProfileResourceAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListProfileResourceAssociationsResponse(
      nextToken: json['NextToken'] as String?,
      profileResourceAssociations: (json['ProfileResourceAssociations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ProfileResourceAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final profileResourceAssociations = this.profileResourceAssociations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (profileResourceAssociations != null)
        'ProfileResourceAssociations': profileResourceAssociations,
    };
  }
}

class ListProfilesResponse {
  /// If more than <code>MaxResults</code> resource associations match the
  /// specified criteria, you can submit another <code>ListProfiles</code> request
  /// to get the next group of results. In the next request, specify the value of
  /// <code>NextToken</code> from the previous response.
  final String? nextToken;

  /// Summary information about the Profiles.
  final List<ProfileSummary>? profileSummaries;

  ListProfilesResponse({
    this.nextToken,
    this.profileSummaries,
  });

  factory ListProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListProfilesResponse(
      nextToken: json['NextToken'] as String?,
      profileSummaries: (json['ProfileSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => ProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final profileSummaries = this.profileSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (profileSummaries != null) 'ProfileSummaries': profileSummaries,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags that are associated with the resource that you specified in the
  /// <code>ListTagsForResource</code> request.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'Tags': tags,
    };
  }
}

/// A complex type that includes settings for a Route 53 Profile.
class Profile {
  /// The Amazon Resource Name (ARN) of the Profile.
  final String? arn;

  /// The <code>ClientToken</code> value that was assigned when the Profile was
  /// created.
  final String? clientToken;

  /// The date and time that the Profile was created, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final DateTime? creationTime;

  /// ID of the Profile.
  final String? id;

  /// The date and time that the Profile was modified, in Unix time format and
  /// Coordinated Universal Time (UTC).
  final DateTime? modificationTime;

  /// Name of the Profile.
  final String? name;

  /// Amazon Web Services account ID of the Profile owner.
  final String? ownerId;

  /// Sharing status for the Profile.
  final ShareStatus? shareStatus;

  /// The status for the Profile.
  final ProfileStatus? status;

  /// Status message that includes additiona information about the Profile.
  final String? statusMessage;

  Profile({
    this.arn,
    this.clientToken,
    this.creationTime,
    this.id,
    this.modificationTime,
    this.name,
    this.ownerId,
    this.shareStatus,
    this.status,
    this.statusMessage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      arn: json['Arn'] as String?,
      clientToken: json['ClientToken'] as String?,
      creationTime: timeStampFromJson(json['CreationTime']),
      id: json['Id'] as String?,
      modificationTime: timeStampFromJson(json['ModificationTime']),
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
      status: (json['Status'] as String?)?.toProfileStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientToken = this.clientToken;
    final creationTime = this.creationTime;
    final id = this.id;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final ownerId = this.ownerId;
    final shareStatus = this.shareStatus;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (arn != null) 'Arn': arn,
      if (clientToken != null) 'ClientToken': clientToken,
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (id != null) 'Id': id,
      if (modificationTime != null)
        'ModificationTime': unixTimestampToJson(modificationTime),
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// An association between a Route 53 Profile and a VPC.
class ProfileAssociation {
  /// The date and time that the Profile association was created, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final DateTime? creationTime;

  /// ID of the Profile association.
  final String? id;

  /// The date and time that the Profile association was modified, in Unix time
  /// format and Coordinated Universal Time (UTC).
  final DateTime? modificationTime;

  /// Name of the Profile association.
  final String? name;

  /// Amazon Web Services account ID of the Profile association owner.
  final String? ownerId;

  /// ID of the Profile.
  final String? profileId;

  /// The Amazon Resource Name (ARN) of the VPC.
  final String? resourceId;

  /// Status of the Profile association.
  final ProfileStatus? status;

  /// Additional information about the Profile association.
  final String? statusMessage;

  ProfileAssociation({
    this.creationTime,
    this.id,
    this.modificationTime,
    this.name,
    this.ownerId,
    this.profileId,
    this.resourceId,
    this.status,
    this.statusMessage,
  });

  factory ProfileAssociation.fromJson(Map<String, dynamic> json) {
    return ProfileAssociation(
      creationTime: timeStampFromJson(json['CreationTime']),
      id: json['Id'] as String?,
      modificationTime: timeStampFromJson(json['ModificationTime']),
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      profileId: json['ProfileId'] as String?,
      resourceId: json['ResourceId'] as String?,
      status: (json['Status'] as String?)?.toProfileStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final ownerId = this.ownerId;
    final profileId = this.profileId;
    final resourceId = this.resourceId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (id != null) 'Id': id,
      if (modificationTime != null)
        'ModificationTime': unixTimestampToJson(modificationTime),
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (profileId != null) 'ProfileId': profileId,
      if (resourceId != null) 'ResourceId': resourceId,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// The association between a Route 53 Profile and resources.
class ProfileResourceAssociation {
  /// The date and time that the Profile resource association was created, in Unix
  /// time format and Coordinated Universal Time (UTC).
  final DateTime? creationTime;

  /// ID of the Profile resource association.
  final String? id;

  /// The date and time that the Profile resource association was modified, in
  /// Unix time format and Coordinated Universal Time (UTC).
  final DateTime? modificationTime;

  /// Name of the Profile resource association.
  final String? name;

  /// Amazon Web Services account ID of the Profile resource association owner.
  final String? ownerId;

  /// Profile ID of the Profile that the resources are associated with.
  final String? profileId;

  /// The Amazon Resource Name (ARN) of the resource association.
  final String? resourceArn;

  /// If the DNS resource is a DNS Firewall rule group, this indicates the
  /// priority.
  final String? resourceProperties;

  /// Resource type, such as a private hosted zone, or DNS Firewall rule group.
  final String? resourceType;

  /// Status of the Profile resource association.
  final ProfileStatus? status;

  /// Additional information about the Profile resource association.
  final String? statusMessage;

  ProfileResourceAssociation({
    this.creationTime,
    this.id,
    this.modificationTime,
    this.name,
    this.ownerId,
    this.profileId,
    this.resourceArn,
    this.resourceProperties,
    this.resourceType,
    this.status,
    this.statusMessage,
  });

  factory ProfileResourceAssociation.fromJson(Map<String, dynamic> json) {
    return ProfileResourceAssociation(
      creationTime: timeStampFromJson(json['CreationTime']),
      id: json['Id'] as String?,
      modificationTime: timeStampFromJson(json['ModificationTime']),
      name: json['Name'] as String?,
      ownerId: json['OwnerId'] as String?,
      profileId: json['ProfileId'] as String?,
      resourceArn: json['ResourceArn'] as String?,
      resourceProperties: json['ResourceProperties'] as String?,
      resourceType: json['ResourceType'] as String?,
      status: (json['Status'] as String?)?.toProfileStatus(),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final id = this.id;
    final modificationTime = this.modificationTime;
    final name = this.name;
    final ownerId = this.ownerId;
    final profileId = this.profileId;
    final resourceArn = this.resourceArn;
    final resourceProperties = this.resourceProperties;
    final resourceType = this.resourceType;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (id != null) 'Id': id,
      if (modificationTime != null)
        'ModificationTime': unixTimestampToJson(modificationTime),
      if (name != null) 'Name': name,
      if (ownerId != null) 'OwnerId': ownerId,
      if (profileId != null) 'ProfileId': profileId,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceProperties != null) 'ResourceProperties': resourceProperties,
      if (resourceType != null) 'ResourceType': resourceType,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

enum ProfileStatus {
  complete,
  deleting,
  updating,
  creating,
  deleted,
  failed,
}

extension ProfileStatusValueExtension on ProfileStatus {
  String toValue() {
    switch (this) {
      case ProfileStatus.complete:
        return 'COMPLETE';
      case ProfileStatus.deleting:
        return 'DELETING';
      case ProfileStatus.updating:
        return 'UPDATING';
      case ProfileStatus.creating:
        return 'CREATING';
      case ProfileStatus.deleted:
        return 'DELETED';
      case ProfileStatus.failed:
        return 'FAILED';
    }
  }
}

extension ProfileStatusFromString on String {
  ProfileStatus toProfileStatus() {
    switch (this) {
      case 'COMPLETE':
        return ProfileStatus.complete;
      case 'DELETING':
        return ProfileStatus.deleting;
      case 'UPDATING':
        return ProfileStatus.updating;
      case 'CREATING':
        return ProfileStatus.creating;
      case 'DELETED':
        return ProfileStatus.deleted;
      case 'FAILED':
        return ProfileStatus.failed;
    }
    throw Exception('$this is not known in enum ProfileStatus');
  }
}

/// Summary information about a Route 53 Profile.
class ProfileSummary {
  /// The Amazon Resource Name (ARN) of the Profile.
  final String? arn;

  /// ID of the Profile.
  final String? id;

  /// Name of the Profile.
  final String? name;

  /// Share status of the Profile.
  final ShareStatus? shareStatus;

  ProfileSummary({
    this.arn,
    this.id,
    this.name,
    this.shareStatus,
  });

  factory ProfileSummary.fromJson(Map<String, dynamic> json) {
    return ProfileSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      shareStatus: (json['ShareStatus'] as String?)?.toShareStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final name = this.name;
    final shareStatus = this.shareStatus;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (shareStatus != null) 'ShareStatus': shareStatus.toValue(),
    };
  }
}

enum ShareStatus {
  notShared,
  sharedWithMe,
  sharedByMe,
}

extension ShareStatusValueExtension on ShareStatus {
  String toValue() {
    switch (this) {
      case ShareStatus.notShared:
        return 'NOT_SHARED';
      case ShareStatus.sharedWithMe:
        return 'SHARED_WITH_ME';
      case ShareStatus.sharedByMe:
        return 'SHARED_BY_ME';
    }
  }
}

extension ShareStatusFromString on String {
  ShareStatus toShareStatus() {
    switch (this) {
      case 'NOT_SHARED':
        return ShareStatus.notShared;
      case 'SHARED_WITH_ME':
        return ShareStatus.sharedWithMe;
      case 'SHARED_BY_ME':
        return ShareStatus.sharedByMe;
    }
    throw Exception('$this is not known in enum ShareStatus');
  }
}

/// Tag for the Profile.
class Tag {
  /// Key associated with the <code>Tag</code>.
  final String key;

  /// Value for the Tag.
  final String value;

  Tag({
    required this.key,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      'Key': key,
      'Value': value,
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

class UntagResourceResponse {
  UntagResourceResponse();

  factory UntagResourceResponse.fromJson(Map<String, dynamic> _) {
    return UntagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateProfileResourceAssociationResponse {
  /// Information about the <code>UpdateProfileResourceAssociation</code> request,
  /// including a status message.
  final ProfileResourceAssociation? profileResourceAssociation;

  UpdateProfileResourceAssociationResponse({
    this.profileResourceAssociation,
  });

  factory UpdateProfileResourceAssociationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateProfileResourceAssociationResponse(
      profileResourceAssociation: json['ProfileResourceAssociation'] != null
          ? ProfileResourceAssociation.fromJson(
              json['ProfileResourceAssociation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final profileResourceAssociation = this.profileResourceAssociation;
    return {
      if (profileResourceAssociation != null)
        'ProfileResourceAssociation': profileResourceAssociation,
    };
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

class InternalServiceErrorException extends _s.GenericAwsException {
  InternalServiceErrorException({String? type, String? message})
      : super(
            type: type,
            code: 'InternalServiceErrorException',
            message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceExistsException extends _s.GenericAwsException {
  ResourceExistsException({String? type, String? message})
      : super(type: type, code: 'ResourceExistsException', message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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
  'InternalServiceErrorException': (type, message) =>
      InternalServiceErrorException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceExistsException': (type, message) =>
      ResourceExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
