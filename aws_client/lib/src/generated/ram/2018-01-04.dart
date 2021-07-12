// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// Use AWS Resource Access Manager to share AWS resources between AWS accounts.
/// To share a resource, you create a resource share, associate the resource
/// with the resource share, and specify the principals that can access the
/// resources associated with the resource share. The following principals are
/// supported: AWS accounts, organizational units (OU) from AWS Organizations,
/// and organizations from AWS Organizations.
///
/// For more information, see the <a
/// href="https://docs.aws.amazon.com/ram/latest/userguide/">AWS Resource Access
/// Manager User Guide</a>.
class Ram {
  final _s.RestJsonProtocol _protocol;
  Ram({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ram',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Accepts an invitation to a resource share from another AWS account.
  ///
  /// May throw [MalformedArnException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [ResourceShareInvitationAlreadyAcceptedException].
  /// May throw [ResourceShareInvitationAlreadyRejectedException].
  /// May throw [ResourceShareInvitationExpiredException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [resourceShareInvitationArn] :
  /// The Amazon Resource Name (ARN) of the invitation.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<AcceptResourceShareInvitationResponse> acceptResourceShareInvitation({
    required String resourceShareInvitationArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceShareInvitationArn, 'resourceShareInvitationArn');
    final $payload = <String, dynamic>{
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/acceptresourceshareinvitation',
      exceptionFnMap: _exceptionFns,
    );
    return AcceptResourceShareInvitationResponse.fromJson(response);
  }

  /// Associates the specified resource share with the specified principals and
  /// resources.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [principals] :
  /// The principals to associate with the resource share. The possible values
  /// are IDs of AWS accounts, and the ARNs of organizational units (OU) or
  /// organizations from AWS Organizations.
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources.
  Future<AssociateResourceShareResponse> associateResourceShare({
    required String resourceShareArn,
    String? clientToken,
    List<String>? principals,
    List<String>? resourceArns,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (principals != null) 'principals': principals,
      if (resourceArns != null) 'resourceArns': resourceArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateResourceShareResponse.fromJson(response);
  }

  /// Associates a permission with a resource share.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidClientTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [permissionArn] :
  /// The Amazon Resource Name (ARN) of the AWS RAM permissions to associate
  /// with the resource share.
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [permissionVersion] :
  /// The version of the AWS RAM permissions to associate with the resource
  /// share.
  ///
  /// Parameter [replace] :
  /// Indicates whether the permission should replace the permissions that are
  /// currently associated with the resource share. Use <code>true</code> to
  /// replace the current permissions. Use <code>false</code> to add the
  /// permission to the current permission.
  Future<AssociateResourceSharePermissionResponse>
      associateResourceSharePermission({
    required String permissionArn,
    required String resourceShareArn,
    String? clientToken,
    int? permissionVersion,
    bool? replace,
  }) async {
    ArgumentError.checkNotNull(permissionArn, 'permissionArn');
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
      if (replace != null) 'replace': replace,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/associateresourcesharepermission',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateResourceSharePermissionResponse.fromJson(response);
  }

  /// Creates a resource share.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [TagPolicyViolationException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [name] :
  /// The name of the resource share.
  ///
  /// Parameter [allowExternalPrincipals] :
  /// Indicates whether principals outside your AWS organization can be
  /// associated with a resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [permissionArns] :
  /// The ARNs of the permissions to associate with the resource share. If you
  /// do not specify an ARN for the permission, AWS RAM automatically attaches
  /// the default version of the permission for each resource type.
  ///
  /// Parameter [principals] :
  /// The principals to associate with the resource share. The possible values
  /// are IDs of AWS accounts, the ARN of an OU or organization from AWS
  /// Organizations.
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources to associate with the
  /// resource share.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<CreateResourceShareResponse> createResourceShare({
    required String name,
    bool? allowExternalPrincipals,
    String? clientToken,
    List<String>? permissionArns,
    List<String>? principals,
    List<String>? resourceArns,
    List<Tag>? tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    final $payload = <String, dynamic>{
      'name': name,
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (clientToken != null) 'clientToken': clientToken,
      if (permissionArns != null) 'permissionArns': permissionArns,
      if (principals != null) 'principals': principals,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return CreateResourceShareResponse.fromJson(response);
  }

  /// Deletes the specified resource share.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<DeleteResourceShareResponse> deleteResourceShare({
    required String resourceShareArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $query = <String, List<String>>{
      'resourceShareArn': [resourceShareArn],
      if (clientToken != null) 'clientToken': [clientToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/deleteresourceshare',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourceShareResponse.fromJson(response);
  }

  /// Disassociates the specified principals or resources from the specified
  /// resource share.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidStateTransitionException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [principals] :
  /// The principals.
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARNs) of the resources.
  Future<DisassociateResourceShareResponse> disassociateResourceShare({
    required String resourceShareArn,
    String? clientToken,
    List<String>? principals,
    List<String>? resourceArns,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
      if (principals != null) 'principals': principals,
      if (resourceArns != null) 'resourceArns': resourceArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateResourceShareResponse.fromJson(response);
  }

  /// Disassociates an AWS RAM permission from a resource share.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidParameterException].
  /// May throw [InvalidClientTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidStateTransitionException].
  ///
  /// Parameter [permissionArn] :
  /// The ARN of the permission to disassociate from the resource share.
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<DisassociateResourceSharePermissionResponse>
      disassociateResourceSharePermission({
    required String permissionArn,
    required String resourceShareArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(permissionArn, 'permissionArn');
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/disassociateresourcesharepermission',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateResourceSharePermissionResponse.fromJson(response);
  }

  /// Enables resource sharing within your AWS Organization.
  ///
  /// The caller must be the master account for the AWS Organization.
  ///
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  Future<EnableSharingWithAwsOrganizationResponse>
      enableSharingWithAwsOrganization() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/enablesharingwithawsorganization',
      exceptionFnMap: _exceptionFns,
    );
    return EnableSharingWithAwsOrganizationResponse.fromJson(response);
  }

  /// Gets the contents of an AWS RAM permission in JSON format.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [permissionArn] :
  /// The ARN of the permission.
  ///
  /// Parameter [permissionVersion] :
  /// The identifier for the version of the permission.
  Future<GetPermissionResponse> getPermission({
    required String permissionArn,
    int? permissionVersion,
  }) async {
    ArgumentError.checkNotNull(permissionArn, 'permissionArn');
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      if (permissionVersion != null) 'permissionVersion': permissionVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getpermission',
      exceptionFnMap: _exceptionFns,
    );
    return GetPermissionResponse.fromJson(response);
  }

  /// Gets the policies for the specified resources that you own and have
  /// shared.
  ///
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ResourceArnNotFoundException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [principal] :
  /// The principal.
  Future<GetResourcePoliciesResponse> getResourcePolicies({
    required List<String> resourceArns,
    int? maxResults,
    String? nextToken,
    String? principal,
  }) async {
    ArgumentError.checkNotNull(resourceArns, 'resourceArns');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceArns': resourceArns,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principal != null) 'principal': principal,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourcepolicies',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePoliciesResponse.fromJson(response);
  }

  /// Gets the resources or principals for the resource shares that you own.
  ///
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [associationType] :
  /// The association type. Specify <code>PRINCIPAL</code> to list the
  /// principals that are associated with the specified resource share. Specify
  /// <code>RESOURCE</code> to list the resources that are associated with the
  /// specified resource share.
  ///
  /// Parameter [associationStatus] :
  /// The association status.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [principal] :
  /// The principal. You cannot specify this parameter if the association type
  /// is <code>RESOURCE</code>.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource. You cannot specify this
  /// parameter if the association type is <code>PRINCIPAL</code>.
  ///
  /// Parameter [resourceShareArns] :
  /// The Amazon Resource Names (ARN) of the resource shares.
  Future<GetResourceShareAssociationsResponse> getResourceShareAssociations({
    required ResourceShareAssociationType associationType,
    ResourceShareAssociationStatus? associationStatus,
    int? maxResults,
    String? nextToken,
    String? principal,
    String? resourceArn,
    List<String>? resourceShareArns,
  }) async {
    ArgumentError.checkNotNull(associationType, 'associationType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'associationType': associationType.toValue(),
      if (associationStatus != null)
        'associationStatus': associationStatus.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principal != null) 'principal': principal,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourceshareassociations',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceShareAssociationsResponse.fromJson(response);
  }

  /// Gets the invitations that you have received for resource shares.
  ///
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [InvalidMaxResultsException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [resourceShareArns] :
  /// The Amazon Resource Names (ARN) of the resource shares.
  ///
  /// Parameter [resourceShareInvitationArns] :
  /// The Amazon Resource Names (ARN) of the invitations.
  Future<GetResourceShareInvitationsResponse> getResourceShareInvitations({
    int? maxResults,
    String? nextToken,
    List<String>? resourceShareArns,
    List<String>? resourceShareInvitationArns,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceShareInvitationArns != null)
        'resourceShareInvitationArns': resourceShareInvitationArns,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourceshareinvitations',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceShareInvitationsResponse.fromJson(response);
  }

  /// Gets the resource shares that you own or the resource shares that are
  /// shared with you.
  ///
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceOwner] :
  /// The type of owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [name] :
  /// The name of the resource share.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [permissionArn] :
  /// The Amazon Resource Name (ARN) of the AWS RAM permission that is
  /// associated with the resource share.
  ///
  /// Parameter [resourceShareArns] :
  /// The ARNs of the resource shares.
  ///
  /// Parameter [resourceShareStatus] :
  /// The status of the resource share.
  ///
  /// Parameter [tagFilters] :
  /// One or more tag filters.
  Future<GetResourceSharesResponse> getResourceShares({
    required ResourceOwner resourceOwner,
    int? maxResults,
    String? name,
    String? nextToken,
    String? permissionArn,
    List<String>? resourceShareArns,
    ResourceShareStatus? resourceShareStatus,
    List<TagFilter>? tagFilters,
  }) async {
    ArgumentError.checkNotNull(resourceOwner, 'resourceOwner');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (name != null) 'name': name,
      if (nextToken != null) 'nextToken': nextToken,
      if (permissionArn != null) 'permissionArn': permissionArn,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceShareStatus != null)
        'resourceShareStatus': resourceShareStatus.toValue(),
      if (tagFilters != null) 'tagFilters': tagFilters,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getresourceshares',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourceSharesResponse.fromJson(response);
  }

  /// Lists the resources in a resource share that is shared with you but that
  /// the invitation is still pending for.
  ///
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ResourceShareInvitationAlreadyRejectedException].
  /// May throw [ResourceShareInvitationExpiredException].
  ///
  /// Parameter [resourceShareInvitationArn] :
  /// The Amazon Resource Name (ARN) of the invitation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListPendingInvitationResourcesResponse>
      listPendingInvitationResources({
    required String resourceShareInvitationArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceShareInvitationArn, 'resourceShareInvitationArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listpendinginvitationresources',
      exceptionFnMap: _exceptionFns,
    );
    return ListPendingInvitationResourcesResponse.fromJson(response);
  }

  /// Lists the AWS RAM permissions.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [resourceType] :
  /// Specifies the resource type for which to list permissions. For example, to
  /// list only permissions that apply to EC2 subnets, specify
  /// <code>ec2:Subnet</code>.
  Future<ListPermissionsResponse> listPermissions({
    int? maxResults,
    String? nextToken,
    String? resourceType,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listpermissions',
      exceptionFnMap: _exceptionFns,
    );
    return ListPermissionsResponse.fromJson(response);
  }

  /// Lists the principals that you have shared resources with or that have
  /// shared resources with you.
  ///
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceOwner] :
  /// The type of owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [principals] :
  /// The principals.
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [resourceShareArns] :
  /// The Amazon Resource Names (ARN) of the resource shares.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// Valid values: <code>acm-pca:CertificateAuthority</code> |
  /// <code>appmesh:Mesh</code> | <code>codebuild:Project</code> |
  /// <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code>
  /// | <code>ec2:DedicatedHost</code> | <code>ec2:LocalGatewayRouteTable</code>
  /// | <code>ec2:PrefixList</code> | <code>ec2:Subnet</code> |
  /// <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> |
  /// <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> |
  /// <code>imagebuilder:ImageRecipe</code> |
  /// <code>imagebuilder:ContainerRecipe</code> | <code>glue:Catalog</code> |
  /// <code>glue:Database</code> | <code>glue:Table</code> |
  /// <code>license-manager:LicenseConfiguration</code> I
  /// <code>network-firewall:FirewallPolicy</code> |
  /// <code>network-firewall:StatefulRuleGroup</code> |
  /// <code>network-firewall:StatelessRuleGroup</code> |
  /// <code>outposts:Outpost</code> | <code>resource-groups:Group</code> |
  /// <code>rds:Cluster</code> |
  /// <code>route53resolver:ResolverQueryLogConfig</code> |
  /// <code>route53resolver:ResolverRule</code>
  Future<ListPrincipalsResponse> listPrincipals({
    required ResourceOwner resourceOwner,
    int? maxResults,
    String? nextToken,
    List<String>? principals,
    String? resourceArn,
    List<String>? resourceShareArns,
    String? resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceOwner, 'resourceOwner');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principals != null) 'principals': principals,
      if (resourceArn != null) 'resourceArn': resourceArn,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listprincipals',
      exceptionFnMap: _exceptionFns,
    );
    return ListPrincipalsResponse.fromJson(response);
  }

  /// Lists the AWS RAM permissions that are associated with a resource share.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [InvalidNextTokenException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListResourceSharePermissionsResponse> listResourceSharePermissions({
    required String resourceShareArn,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listresourcesharepermissions',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceSharePermissionsResponse.fromJson(response);
  }

  /// Lists the shareable resource types supported by AWS RAM.
  ///
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListResourceTypesResponse> listResourceTypes({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listresourcetypes',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourceTypesResponse.fromJson(response);
  }

  /// Lists the resources that you added to a resource shares or the resources
  /// that are shared with you.
  ///
  /// May throw [InvalidResourceTypeException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidNextTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceOwner] :
  /// The type of owner.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  ///
  /// Parameter [principal] :
  /// The principal.
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources.
  ///
  /// Parameter [resourceShareArns] :
  /// The Amazon Resource Names (ARN) of the resource shares.
  ///
  /// Parameter [resourceType] :
  /// The resource type.
  ///
  /// Valid values: <code>acm-pca:CertificateAuthority</code> |
  /// <code>appmesh:Mesh</code> | <code>codebuild:Project</code> |
  /// <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code>
  /// | <code>ec2:DedicatedHost</code> | <code>ec2:LocalGatewayRouteTable</code>
  /// | <code>ec2:PrefixList</code> | <code>ec2:Subnet</code> |
  /// <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> |
  /// <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> |
  /// <code>imagebuilder:ImageRecipe</code> |
  /// <code>imagebuilder:ContainerRecipe</code> | <code>glue:Catalog</code> |
  /// <code>glue:Database</code> | <code>glue:Table</code> |
  /// <code>license-manager:LicenseConfiguration</code> I
  /// <code>network-firewall:FirewallPolicy</code> |
  /// <code>network-firewall:StatefulRuleGroup</code> |
  /// <code>network-firewall:StatelessRuleGroup</code> |
  /// <code>outposts:Outpost</code> | <code>resource-groups:Group</code> |
  /// <code>rds:Cluster</code> |
  /// <code>route53resolver:ResolverQueryLogConfig</code> |
  /// <code>route53resolver:ResolverRule</code>
  Future<ListResourcesResponse> listResources({
    required ResourceOwner resourceOwner,
    int? maxResults,
    String? nextToken,
    String? principal,
    List<String>? resourceArns,
    List<String>? resourceShareArns,
    String? resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceOwner, 'resourceOwner');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner.toValue(),
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (principal != null) 'principal': principal,
      if (resourceArns != null) 'resourceArns': resourceArns,
      if (resourceShareArns != null) 'resourceShareArns': resourceShareArns,
      if (resourceType != null) 'resourceType': resourceType,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listresources',
      exceptionFnMap: _exceptionFns,
    );
    return ListResourcesResponse.fromJson(response);
  }

  /// Resource shares that were created by attaching a policy to a resource are
  /// visible only to the resource share owner, and the resource share cannot be
  /// modified in AWS RAM.
  ///
  /// Use this API action to promote the resource share. When you promote the
  /// resource share, it becomes:
  ///
  /// <ul>
  /// <li>
  /// Visible to all principals that it is shared with.
  /// </li>
  /// <li>
  /// Modifiable in AWS RAM.
  /// </li>
  /// </ul>
  ///
  /// May throw [MalformedArnException].
  /// May throw [ResourceShareLimitExceededException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [UnknownResourceException].
  ///
  /// Parameter [resourceShareArn] :
  /// The ARN of the resource share to promote.
  Future<PromoteResourceShareCreatedFromPolicyResponse>
      promoteResourceShareCreatedFromPolicy({
    required String resourceShareArn,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $query = <String, List<String>>{
      'resourceShareArn': [resourceShareArn],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/promoteresourcesharecreatedfrompolicy',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return PromoteResourceShareCreatedFromPolicyResponse.fromJson(response);
  }

  /// Rejects an invitation to a resource share from another AWS account.
  ///
  /// May throw [MalformedArnException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ResourceShareInvitationArnNotFoundException].
  /// May throw [ResourceShareInvitationAlreadyAcceptedException].
  /// May throw [ResourceShareInvitationAlreadyRejectedException].
  /// May throw [ResourceShareInvitationExpiredException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  /// May throw [InvalidClientTokenException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [resourceShareInvitationArn] :
  /// The Amazon Resource Name (ARN) of the invitation.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  Future<RejectResourceShareInvitationResponse> rejectResourceShareInvitation({
    required String resourceShareInvitationArn,
    String? clientToken,
  }) async {
    ArgumentError.checkNotNull(
        resourceShareInvitationArn, 'resourceShareInvitationArn');
    final $payload = <String, dynamic>{
      'resourceShareInvitationArn': resourceShareInvitationArn,
      if (clientToken != null) 'clientToken': clientToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/rejectresourceshareinvitation',
      exceptionFnMap: _exceptionFns,
    );
    return RejectResourceShareInvitationResponse.fromJson(response);
  }

  /// Adds the specified tags to the specified resource share that you own.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MalformedArnException].
  /// May throw [UnknownResourceException].
  /// May throw [TagLimitExceededException].
  /// May throw [ResourceArnNotFoundException].
  /// May throw [TagPolicyViolationException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [tags] :
  /// One or more tags.
  Future<void> tagResource({
    required String resourceShareArn,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tagresource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes the specified tags from the specified resource share that you own.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys of the tags to remove.
  Future<void> untagResource({
    required String resourceShareArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/untagresource',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the specified resource share that you own.
  ///
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnknownResourceException].
  /// May throw [MalformedArnException].
  /// May throw [InvalidClientTokenException].
  /// May throw [InvalidParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerInternalException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [allowExternalPrincipals] :
  /// Indicates whether principals outside your AWS organization can be
  /// associated with a resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [name] :
  /// The name of the resource share.
  Future<UpdateResourceShareResponse> updateResourceShare({
    required String resourceShareArn,
    bool? allowExternalPrincipals,
    String? clientToken,
    String? name,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $payload = <String, dynamic>{
      'resourceShareArn': resourceShareArn,
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (clientToken != null) 'clientToken': clientToken,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateresourceshare',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateResourceShareResponse.fromJson(response);
  }
}

class AcceptResourceShareInvitationResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Information about the invitation.
  final ResourceShareInvitation? resourceShareInvitation;

  AcceptResourceShareInvitationResponse({
    this.clientToken,
    this.resourceShareInvitation,
  });

  factory AcceptResourceShareInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return AcceptResourceShareInvitationResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareInvitation: json['resourceShareInvitation'] != null
          ? ResourceShareInvitation.fromJson(
              json['resourceShareInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareInvitation = this.resourceShareInvitation;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareInvitation != null)
        'resourceShareInvitation': resourceShareInvitation,
    };
  }
}

class AssociateResourceSharePermissionResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Indicates whether the request succeeded.
  final bool? returnValue;

  AssociateResourceSharePermissionResponse({
    this.clientToken,
    this.returnValue,
  });

  factory AssociateResourceSharePermissionResponse.fromJson(
      Map<String, dynamic> json) {
    return AssociateResourceSharePermissionResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class AssociateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Information about the associations.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  AssociateResourceShareResponse({
    this.clientToken,
    this.resourceShareAssociations,
  });

  factory AssociateResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return AssociateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareAssociations = this.resourceShareAssociations;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
    };
  }
}

class CreateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Information about the resource share.
  final ResourceShare? resourceShare;

  CreateResourceShareResponse({
    this.clientToken,
    this.resourceShare,
  });

  factory CreateResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return CreateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShare: json['resourceShare'] != null
          ? ResourceShare.fromJson(
              json['resourceShare'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShare = this.resourceShare;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShare != null) 'resourceShare': resourceShare,
    };
  }
}

class DeleteResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Indicates whether the request succeeded.
  final bool? returnValue;

  DeleteResourceShareResponse({
    this.clientToken,
    this.returnValue,
  });

  factory DeleteResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class DisassociateResourceSharePermissionResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Indicates whether the request succeeded.
  final bool? returnValue;

  DisassociateResourceSharePermissionResponse({
    this.clientToken,
    this.returnValue,
  });

  factory DisassociateResourceSharePermissionResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResourceSharePermissionResponse(
      clientToken: json['clientToken'] as String?,
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final returnValue = this.returnValue;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class DisassociateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Information about the associations.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  DisassociateResourceShareResponse({
    this.clientToken,
    this.resourceShareAssociations,
  });

  factory DisassociateResourceShareResponse.fromJson(
      Map<String, dynamic> json) {
    return DisassociateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareAssociations = this.resourceShareAssociations;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
    };
  }
}

class EnableSharingWithAwsOrganizationResponse {
  /// Indicates whether the request succeeded.
  final bool? returnValue;

  EnableSharingWithAwsOrganizationResponse({
    this.returnValue,
  });

  factory EnableSharingWithAwsOrganizationResponse.fromJson(
      Map<String, dynamic> json) {
    return EnableSharingWithAwsOrganizationResponse(
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class GetPermissionResponse {
  /// Information about the permission.
  final ResourceSharePermissionDetail? permission;

  GetPermissionResponse({
    this.permission,
  });

  factory GetPermissionResponse.fromJson(Map<String, dynamic> json) {
    return GetPermissionResponse(
      permission: json['permission'] != null
          ? ResourceSharePermissionDetail.fromJson(
              json['permission'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final permission = this.permission;
    return {
      if (permission != null) 'permission': permission,
    };
  }
}

class GetResourcePoliciesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// A key policy document, in JSON format.
  final List<String>? policies;

  GetResourcePoliciesResponse({
    this.nextToken,
    this.policies,
  });

  factory GetResourcePoliciesResponse.fromJson(Map<String, dynamic> json) {
    return GetResourcePoliciesResponse(
      nextToken: json['nextToken'] as String?,
      policies: (json['policies'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final policies = this.policies;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (policies != null) 'policies': policies,
    };
  }
}

class GetResourceShareAssociationsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the associations.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  GetResourceShareAssociationsResponse({
    this.nextToken,
    this.resourceShareAssociations,
  });

  factory GetResourceShareAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceShareAssociationsResponse(
      nextToken: json['nextToken'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceShareAssociations = this.resourceShareAssociations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
    };
  }
}

class GetResourceShareInvitationsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the invitations.
  final List<ResourceShareInvitation>? resourceShareInvitations;

  GetResourceShareInvitationsResponse({
    this.nextToken,
    this.resourceShareInvitations,
  });

  factory GetResourceShareInvitationsResponse.fromJson(
      Map<String, dynamic> json) {
    return GetResourceShareInvitationsResponse(
      nextToken: json['nextToken'] as String?,
      resourceShareInvitations: (json['resourceShareInvitations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareInvitation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceShareInvitations = this.resourceShareInvitations;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShareInvitations != null)
        'resourceShareInvitations': resourceShareInvitations,
    };
  }
}

class GetResourceSharesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the resource shares.
  final List<ResourceShare>? resourceShares;

  GetResourceSharesResponse({
    this.nextToken,
    this.resourceShares,
  });

  factory GetResourceSharesResponse.fromJson(Map<String, dynamic> json) {
    return GetResourceSharesResponse(
      nextToken: json['nextToken'] as String?,
      resourceShares: (json['resourceShares'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceShare.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceShares = this.resourceShares;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceShares != null) 'resourceShares': resourceShares,
    };
  }
}

class ListPendingInvitationResourcesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the resources included the resource share.
  final List<Resource>? resources;

  ListPendingInvitationResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListPendingInvitationResourcesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListPendingInvitationResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

class ListPermissionsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the permissions.
  final List<ResourceSharePermissionSummary>? permissions;

  ListPermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) {
    return ListPermissionsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSharePermissionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class ListPrincipalsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The principals.
  final List<Principal>? principals;

  ListPrincipalsResponse({
    this.nextToken,
    this.principals,
  });

  factory ListPrincipalsResponse.fromJson(Map<String, dynamic> json) {
    return ListPrincipalsResponse(
      nextToken: json['nextToken'] as String?,
      principals: (json['principals'] as List?)
          ?.whereNotNull()
          .map((e) => Principal.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final principals = this.principals;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (principals != null) 'principals': principals,
    };
  }
}

class ListResourceSharePermissionsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The permissions associated with the resource share.
  final List<ResourceSharePermissionSummary>? permissions;

  ListResourceSharePermissionsResponse({
    this.nextToken,
    this.permissions,
  });

  factory ListResourceSharePermissionsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListResourceSharePermissionsResponse(
      nextToken: json['nextToken'] as String?,
      permissions: (json['permissions'] as List?)
          ?.whereNotNull()
          .map((e) => ResourceSharePermissionSummary.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final permissions = this.permissions;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (permissions != null) 'permissions': permissions,
    };
  }
}

class ListResourceTypesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// The shareable resource types supported by AWS RAM.
  final List<ServiceNameAndResourceType>? resourceTypes;

  ListResourceTypesResponse({
    this.nextToken,
    this.resourceTypes,
  });

  factory ListResourceTypesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourceTypesResponse(
      nextToken: json['nextToken'] as String?,
      resourceTypes: (json['resourceTypes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServiceNameAndResourceType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resourceTypes = this.resourceTypes;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resourceTypes != null) 'resourceTypes': resourceTypes,
    };
  }
}

class ListResourcesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  final String? nextToken;

  /// Information about the resources.
  final List<Resource>? resources;

  ListResourcesResponse({
    this.nextToken,
    this.resources,
  });

  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) {
    return ListResourcesResponse(
      nextToken: json['nextToken'] as String?,
      resources: (json['resources'] as List?)
          ?.whereNotNull()
          .map((e) => Resource.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final resources = this.resources;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (resources != null) 'resources': resources,
    };
  }
}

/// Describes a principal for use with AWS Resource Access Manager.
class Principal {
  /// The time when the principal was associated with the resource share.
  final DateTime? creationTime;

  /// Indicates whether the principal belongs to the same AWS organization as the
  /// AWS account that owns the resource share.
  final bool? external;

  /// The ID of the principal.
  final String? id;

  /// The time when the association was last updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String? resourceShareArn;

  Principal({
    this.creationTime,
    this.external,
    this.id,
    this.lastUpdatedTime,
    this.resourceShareArn,
  });

  factory Principal.fromJson(Map<String, dynamic> json) {
    return Principal(
      creationTime: timeStampFromJson(json['creationTime']),
      external: json['external'] as bool?,
      id: json['id'] as String?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      resourceShareArn: json['resourceShareArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final external = this.external;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceShareArn = this.resourceShareArn;
    return {
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (external != null) 'external': external,
      if (id != null) 'id': id,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
    };
  }
}

class PromoteResourceShareCreatedFromPolicyResponse {
  /// Indicates whether the request succeeded.
  final bool? returnValue;

  PromoteResourceShareCreatedFromPolicyResponse({
    this.returnValue,
  });

  factory PromoteResourceShareCreatedFromPolicyResponse.fromJson(
      Map<String, dynamic> json) {
    return PromoteResourceShareCreatedFromPolicyResponse(
      returnValue: json['returnValue'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final returnValue = this.returnValue;
    return {
      if (returnValue != null) 'returnValue': returnValue,
    };
  }
}

class RejectResourceShareInvitationResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Information about the invitation.
  final ResourceShareInvitation? resourceShareInvitation;

  RejectResourceShareInvitationResponse({
    this.clientToken,
    this.resourceShareInvitation,
  });

  factory RejectResourceShareInvitationResponse.fromJson(
      Map<String, dynamic> json) {
    return RejectResourceShareInvitationResponse(
      clientToken: json['clientToken'] as String?,
      resourceShareInvitation: json['resourceShareInvitation'] != null
          ? ResourceShareInvitation.fromJson(
              json['resourceShareInvitation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShareInvitation = this.resourceShareInvitation;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShareInvitation != null)
        'resourceShareInvitation': resourceShareInvitation,
    };
  }
}

/// Describes a resource associated with a resource share.
class Resource {
  /// The Amazon Resource Name (ARN) of the resource.
  final String? arn;

  /// The time when the resource was associated with the resource share.
  final DateTime? creationTime;

  /// The time when the association was last updated.
  final DateTime? lastUpdatedTime;

  /// The ARN of the resource group. This value is returned only if the resource
  /// is a resource group.
  final String? resourceGroupArn;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String? resourceShareArn;

  /// The status of the resource.
  final ResourceStatus? status;

  /// A message about the status of the resource.
  final String? statusMessage;

  /// The resource type.
  final String? type;

  Resource({
    this.arn,
    this.creationTime,
    this.lastUpdatedTime,
    this.resourceGroupArn,
    this.resourceShareArn,
    this.status,
    this.statusMessage,
    this.type,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      resourceGroupArn: json['resourceGroupArn'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      status: (json['status'] as String?)?.toResourceStatus(),
      statusMessage: json['statusMessage'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceGroupArn = this.resourceGroupArn;
    final resourceShareArn = this.resourceShareArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceGroupArn != null) 'resourceGroupArn': resourceGroupArn,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (type != null) 'type': type,
    };
  }
}

enum ResourceOwner {
  self,
  otherAccounts,
}

extension on ResourceOwner {
  String toValue() {
    switch (this) {
      case ResourceOwner.self:
        return 'SELF';
      case ResourceOwner.otherAccounts:
        return 'OTHER-ACCOUNTS';
    }
  }
}

extension on String {
  ResourceOwner toResourceOwner() {
    switch (this) {
      case 'SELF':
        return ResourceOwner.self;
      case 'OTHER-ACCOUNTS':
        return ResourceOwner.otherAccounts;
    }
    throw Exception('$this is not known in enum ResourceOwner');
  }
}

/// Describes a resource share.
class ResourceShare {
  /// Indicates whether principals outside your AWS organization can be associated
  /// with a resource share.
  final bool? allowExternalPrincipals;

  /// The time when the resource share was created.
  final DateTime? creationTime;

  /// Indicates how the resource share was created. Possible values include:
  ///
  /// <ul>
  /// <li>
  /// <code>CREATED_FROM_POLICY</code> - Indicates that the resource share was
  /// created from an AWS Identity and Access Management (AWS IAM) policy attached
  /// to a resource. These resource shares are visible only to the AWS account
  /// that created it. They cannot be modified in AWS RAM.
  /// </li>
  /// <li>
  /// <code>PROMOTING_TO_STANDARD</code> - The resource share is in the process of
  /// being promoted. For more information, see
  /// <a>PromoteResourceShareCreatedFromPolicy</a>.
  /// </li>
  /// <li>
  /// <code>STANDARD</code> - Indicates that the resource share was created in AWS
  /// RAM using the console or APIs. These resource shares are visible to all
  /// principals. They can be modified in AWS RAM.
  /// </li>
  /// </ul>
  final ResourceShareFeatureSet? featureSet;

  /// The time when the resource share was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the resource share.
  final String? name;

  /// The ID of the AWS account that owns the resource share.
  final String? owningAccountId;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String? resourceShareArn;

  /// The status of the resource share.
  final ResourceShareStatus? status;

  /// A message about the status of the resource share.
  final String? statusMessage;

  /// The tags for the resource share.
  final List<Tag>? tags;

  ResourceShare({
    this.allowExternalPrincipals,
    this.creationTime,
    this.featureSet,
    this.lastUpdatedTime,
    this.name,
    this.owningAccountId,
    this.resourceShareArn,
    this.status,
    this.statusMessage,
    this.tags,
  });

  factory ResourceShare.fromJson(Map<String, dynamic> json) {
    return ResourceShare(
      allowExternalPrincipals: json['allowExternalPrincipals'] as bool?,
      creationTime: timeStampFromJson(json['creationTime']),
      featureSet: (json['featureSet'] as String?)?.toResourceShareFeatureSet(),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      owningAccountId: json['owningAccountId'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      status: (json['status'] as String?)?.toResourceShareStatus(),
      statusMessage: json['statusMessage'] as String?,
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final allowExternalPrincipals = this.allowExternalPrincipals;
    final creationTime = this.creationTime;
    final featureSet = this.featureSet;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final owningAccountId = this.owningAccountId;
    final resourceShareArn = this.resourceShareArn;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final tags = this.tags;
    return {
      if (allowExternalPrincipals != null)
        'allowExternalPrincipals': allowExternalPrincipals,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (featureSet != null) 'featureSet': featureSet.toValue(),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (owningAccountId != null) 'owningAccountId': owningAccountId,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Describes an association with a resource share.
class ResourceShareAssociation {
  /// The associated entity. For resource associations, this is the ARN of the
  /// resource. For principal associations, this is the ID of an AWS account or
  /// the ARN of an OU or organization from AWS Organizations.
  final String? associatedEntity;

  /// The association type.
  final ResourceShareAssociationType? associationType;

  /// The time when the association was created.
  final DateTime? creationTime;

  /// Indicates whether the principal belongs to the same AWS organization as the
  /// AWS account that owns the resource share.
  final bool? external;

  /// The time when the association was last updated.
  final DateTime? lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String? resourceShareArn;

  /// The name of the resource share.
  final String? resourceShareName;

  /// The status of the association.
  final ResourceShareAssociationStatus? status;

  /// A message about the status of the association.
  final String? statusMessage;

  ResourceShareAssociation({
    this.associatedEntity,
    this.associationType,
    this.creationTime,
    this.external,
    this.lastUpdatedTime,
    this.resourceShareArn,
    this.resourceShareName,
    this.status,
    this.statusMessage,
  });

  factory ResourceShareAssociation.fromJson(Map<String, dynamic> json) {
    return ResourceShareAssociation(
      associatedEntity: json['associatedEntity'] as String?,
      associationType: (json['associationType'] as String?)
          ?.toResourceShareAssociationType(),
      creationTime: timeStampFromJson(json['creationTime']),
      external: json['external'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      status: (json['status'] as String?)?.toResourceShareAssociationStatus(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatedEntity = this.associatedEntity;
    final associationType = this.associationType;
    final creationTime = this.creationTime;
    final external = this.external;
    final lastUpdatedTime = this.lastUpdatedTime;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareName = this.resourceShareName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (associatedEntity != null) 'associatedEntity': associatedEntity,
      if (associationType != null) 'associationType': associationType.toValue(),
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (external != null) 'external': external,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

enum ResourceShareAssociationStatus {
  associating,
  associated,
  failed,
  disassociating,
  disassociated,
}

extension on ResourceShareAssociationStatus {
  String toValue() {
    switch (this) {
      case ResourceShareAssociationStatus.associating:
        return 'ASSOCIATING';
      case ResourceShareAssociationStatus.associated:
        return 'ASSOCIATED';
      case ResourceShareAssociationStatus.failed:
        return 'FAILED';
      case ResourceShareAssociationStatus.disassociating:
        return 'DISASSOCIATING';
      case ResourceShareAssociationStatus.disassociated:
        return 'DISASSOCIATED';
    }
  }
}

extension on String {
  ResourceShareAssociationStatus toResourceShareAssociationStatus() {
    switch (this) {
      case 'ASSOCIATING':
        return ResourceShareAssociationStatus.associating;
      case 'ASSOCIATED':
        return ResourceShareAssociationStatus.associated;
      case 'FAILED':
        return ResourceShareAssociationStatus.failed;
      case 'DISASSOCIATING':
        return ResourceShareAssociationStatus.disassociating;
      case 'DISASSOCIATED':
        return ResourceShareAssociationStatus.disassociated;
    }
    throw Exception(
        '$this is not known in enum ResourceShareAssociationStatus');
  }
}

enum ResourceShareAssociationType {
  principal,
  resource,
}

extension on ResourceShareAssociationType {
  String toValue() {
    switch (this) {
      case ResourceShareAssociationType.principal:
        return 'PRINCIPAL';
      case ResourceShareAssociationType.resource:
        return 'RESOURCE';
    }
  }
}

extension on String {
  ResourceShareAssociationType toResourceShareAssociationType() {
    switch (this) {
      case 'PRINCIPAL':
        return ResourceShareAssociationType.principal;
      case 'RESOURCE':
        return ResourceShareAssociationType.resource;
    }
    throw Exception('$this is not known in enum ResourceShareAssociationType');
  }
}

enum ResourceShareFeatureSet {
  createdFromPolicy,
  promotingToStandard,
  standard,
}

extension on ResourceShareFeatureSet {
  String toValue() {
    switch (this) {
      case ResourceShareFeatureSet.createdFromPolicy:
        return 'CREATED_FROM_POLICY';
      case ResourceShareFeatureSet.promotingToStandard:
        return 'PROMOTING_TO_STANDARD';
      case ResourceShareFeatureSet.standard:
        return 'STANDARD';
    }
  }
}

extension on String {
  ResourceShareFeatureSet toResourceShareFeatureSet() {
    switch (this) {
      case 'CREATED_FROM_POLICY':
        return ResourceShareFeatureSet.createdFromPolicy;
      case 'PROMOTING_TO_STANDARD':
        return ResourceShareFeatureSet.promotingToStandard;
      case 'STANDARD':
        return ResourceShareFeatureSet.standard;
    }
    throw Exception('$this is not known in enum ResourceShareFeatureSet');
  }
}

/// Describes an invitation to join a resource share.
class ResourceShareInvitation {
  /// The date and time when the invitation was sent.
  final DateTime? invitationTimestamp;

  /// The ID of the AWS account that received the invitation.
  final String? receiverAccountId;

  /// The Amazon Resource Name (ARN) of the IAM user or IAM role that received the
  /// invitation.
  final String? receiverArn;

  /// The Amazon Resource Name (ARN) of the resource share.
  final String? resourceShareArn;

  /// To view the resources associated with a pending resource share invitation,
  /// use <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_ListPendingInvitationResources.html">
  /// ListPendingInvitationResources</a>.
  final List<ResourceShareAssociation>? resourceShareAssociations;

  /// The Amazon Resource Name (ARN) of the invitation.
  final String? resourceShareInvitationArn;

  /// The name of the resource share.
  final String? resourceShareName;

  /// The ID of the AWS account that sent the invitation.
  final String? senderAccountId;

  /// The status of the invitation.
  final ResourceShareInvitationStatus? status;

  ResourceShareInvitation({
    this.invitationTimestamp,
    this.receiverAccountId,
    this.receiverArn,
    this.resourceShareArn,
    this.resourceShareAssociations,
    this.resourceShareInvitationArn,
    this.resourceShareName,
    this.senderAccountId,
    this.status,
  });

  factory ResourceShareInvitation.fromJson(Map<String, dynamic> json) {
    return ResourceShareInvitation(
      invitationTimestamp: timeStampFromJson(json['invitationTimestamp']),
      receiverAccountId: json['receiverAccountId'] as String?,
      receiverArn: json['receiverArn'] as String?,
      resourceShareArn: json['resourceShareArn'] as String?,
      resourceShareAssociations: (json['resourceShareAssociations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ResourceShareAssociation.fromJson(e as Map<String, dynamic>))
          .toList(),
      resourceShareInvitationArn: json['resourceShareInvitationArn'] as String?,
      resourceShareName: json['resourceShareName'] as String?,
      senderAccountId: json['senderAccountId'] as String?,
      status: (json['status'] as String?)?.toResourceShareInvitationStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final invitationTimestamp = this.invitationTimestamp;
    final receiverAccountId = this.receiverAccountId;
    final receiverArn = this.receiverArn;
    final resourceShareArn = this.resourceShareArn;
    final resourceShareAssociations = this.resourceShareAssociations;
    final resourceShareInvitationArn = this.resourceShareInvitationArn;
    final resourceShareName = this.resourceShareName;
    final senderAccountId = this.senderAccountId;
    final status = this.status;
    return {
      if (invitationTimestamp != null)
        'invitationTimestamp': unixTimestampToJson(invitationTimestamp),
      if (receiverAccountId != null) 'receiverAccountId': receiverAccountId,
      if (receiverArn != null) 'receiverArn': receiverArn,
      if (resourceShareArn != null) 'resourceShareArn': resourceShareArn,
      if (resourceShareAssociations != null)
        'resourceShareAssociations': resourceShareAssociations,
      if (resourceShareInvitationArn != null)
        'resourceShareInvitationArn': resourceShareInvitationArn,
      if (resourceShareName != null) 'resourceShareName': resourceShareName,
      if (senderAccountId != null) 'senderAccountId': senderAccountId,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum ResourceShareInvitationStatus {
  pending,
  accepted,
  rejected,
  expired,
}

extension on ResourceShareInvitationStatus {
  String toValue() {
    switch (this) {
      case ResourceShareInvitationStatus.pending:
        return 'PENDING';
      case ResourceShareInvitationStatus.accepted:
        return 'ACCEPTED';
      case ResourceShareInvitationStatus.rejected:
        return 'REJECTED';
      case ResourceShareInvitationStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension on String {
  ResourceShareInvitationStatus toResourceShareInvitationStatus() {
    switch (this) {
      case 'PENDING':
        return ResourceShareInvitationStatus.pending;
      case 'ACCEPTED':
        return ResourceShareInvitationStatus.accepted;
      case 'REJECTED':
        return ResourceShareInvitationStatus.rejected;
      case 'EXPIRED':
        return ResourceShareInvitationStatus.expired;
    }
    throw Exception('$this is not known in enum ResourceShareInvitationStatus');
  }
}

/// Information about an AWS RAM permission.
class ResourceSharePermissionDetail {
  /// The ARN of the permission.
  final String? arn;

  /// The date and time when the permission was created.
  final DateTime? creationTime;

  /// Specifies whether the version of the permission is set to the default
  /// version for this permission.
  final bool? defaultVersion;

  /// Specifies whether the version of the permission is set to the default
  /// version for this resource type.
  final bool? isResourceTypeDefault;

  /// The date and time when the permission was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the permission.
  final String? name;

  /// The permission's effect and actions in JSON format. The <code>effect</code>
  /// indicates whether the actions are allowed or denied. The
  /// <code>actions</code> list the API actions to which the principal is granted
  /// or denied access.
  final String? permission;

  /// The resource type to which the permission applies.
  final String? resourceType;

  /// The identifier for the version of the permission.
  final String? version;

  ResourceSharePermissionDetail({
    this.arn,
    this.creationTime,
    this.defaultVersion,
    this.isResourceTypeDefault,
    this.lastUpdatedTime,
    this.name,
    this.permission,
    this.resourceType,
    this.version,
  });

  factory ResourceSharePermissionDetail.fromJson(Map<String, dynamic> json) {
    return ResourceSharePermissionDetail(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      defaultVersion: json['defaultVersion'] as bool?,
      isResourceTypeDefault: json['isResourceTypeDefault'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      permission: json['permission'] as String?,
      resourceType: json['resourceType'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultVersion = this.defaultVersion;
    final isResourceTypeDefault = this.isResourceTypeDefault;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final permission = this.permission;
    final resourceType = this.resourceType;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (isResourceTypeDefault != null)
        'isResourceTypeDefault': isResourceTypeDefault,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (permission != null) 'permission': permission,
      if (resourceType != null) 'resourceType': resourceType,
      if (version != null) 'version': version,
    };
  }
}

/// Information about a permission that is associated with a resource share.
class ResourceSharePermissionSummary {
  /// The ARN of the permission.
  final String? arn;

  /// The date and time when the permission was created.
  final DateTime? creationTime;

  /// Specifies whether the version of the permission is set to the default
  /// version for this permission.
  final bool? defaultVersion;

  /// Specifies whether the version of the permission is set to the default
  /// version for this resource type.
  final bool? isResourceTypeDefault;

  /// The date and time when the permission was last updated.
  final DateTime? lastUpdatedTime;

  /// The name of the permission.
  final String? name;

  /// The type of resource to which the permission applies.
  final String? resourceType;

  /// The current status of the permission.
  final String? status;

  /// The identifier for the version of the permission.
  final String? version;

  ResourceSharePermissionSummary({
    this.arn,
    this.creationTime,
    this.defaultVersion,
    this.isResourceTypeDefault,
    this.lastUpdatedTime,
    this.name,
    this.resourceType,
    this.status,
    this.version,
  });

  factory ResourceSharePermissionSummary.fromJson(Map<String, dynamic> json) {
    return ResourceSharePermissionSummary(
      arn: json['arn'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      defaultVersion: json['defaultVersion'] as bool?,
      isResourceTypeDefault: json['isResourceTypeDefault'] as bool?,
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      name: json['name'] as String?,
      resourceType: json['resourceType'] as String?,
      status: json['status'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationTime = this.creationTime;
    final defaultVersion = this.defaultVersion;
    final isResourceTypeDefault = this.isResourceTypeDefault;
    final lastUpdatedTime = this.lastUpdatedTime;
    final name = this.name;
    final resourceType = this.resourceType;
    final status = this.status;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (defaultVersion != null) 'defaultVersion': defaultVersion,
      if (isResourceTypeDefault != null)
        'isResourceTypeDefault': isResourceTypeDefault,
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (name != null) 'name': name,
      if (resourceType != null) 'resourceType': resourceType,
      if (status != null) 'status': status,
      if (version != null) 'version': version,
    };
  }
}

enum ResourceShareStatus {
  pending,
  active,
  failed,
  deleting,
  deleted,
}

extension on ResourceShareStatus {
  String toValue() {
    switch (this) {
      case ResourceShareStatus.pending:
        return 'PENDING';
      case ResourceShareStatus.active:
        return 'ACTIVE';
      case ResourceShareStatus.failed:
        return 'FAILED';
      case ResourceShareStatus.deleting:
        return 'DELETING';
      case ResourceShareStatus.deleted:
        return 'DELETED';
    }
  }
}

extension on String {
  ResourceShareStatus toResourceShareStatus() {
    switch (this) {
      case 'PENDING':
        return ResourceShareStatus.pending;
      case 'ACTIVE':
        return ResourceShareStatus.active;
      case 'FAILED':
        return ResourceShareStatus.failed;
      case 'DELETING':
        return ResourceShareStatus.deleting;
      case 'DELETED':
        return ResourceShareStatus.deleted;
    }
    throw Exception('$this is not known in enum ResourceShareStatus');
  }
}

enum ResourceStatus {
  available,
  zonalResourceInaccessible,
  limitExceeded,
  unavailable,
  pending,
}

extension on ResourceStatus {
  String toValue() {
    switch (this) {
      case ResourceStatus.available:
        return 'AVAILABLE';
      case ResourceStatus.zonalResourceInaccessible:
        return 'ZONAL_RESOURCE_INACCESSIBLE';
      case ResourceStatus.limitExceeded:
        return 'LIMIT_EXCEEDED';
      case ResourceStatus.unavailable:
        return 'UNAVAILABLE';
      case ResourceStatus.pending:
        return 'PENDING';
    }
  }
}

extension on String {
  ResourceStatus toResourceStatus() {
    switch (this) {
      case 'AVAILABLE':
        return ResourceStatus.available;
      case 'ZONAL_RESOURCE_INACCESSIBLE':
        return ResourceStatus.zonalResourceInaccessible;
      case 'LIMIT_EXCEEDED':
        return ResourceStatus.limitExceeded;
      case 'UNAVAILABLE':
        return ResourceStatus.unavailable;
      case 'PENDING':
        return ResourceStatus.pending;
    }
    throw Exception('$this is not known in enum ResourceStatus');
  }
}

/// Information about the shareable resource types and the AWS services to which
/// they belong.
class ServiceNameAndResourceType {
  /// The shareable resource types.
  final String? resourceType;

  /// The name of the AWS services to which the resources belong.
  final String? serviceName;

  ServiceNameAndResourceType({
    this.resourceType,
    this.serviceName,
  });

  factory ServiceNameAndResourceType.fromJson(Map<String, dynamic> json) {
    return ServiceNameAndResourceType(
      resourceType: json['resourceType'] as String?,
      serviceName: json['serviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceType = this.resourceType;
    final serviceName = this.serviceName;
    return {
      if (resourceType != null) 'resourceType': resourceType,
      if (serviceName != null) 'serviceName': serviceName,
    };
  }
}

/// Information about a tag.
class Tag {
  /// The key of the tag.
  final String? key;

  /// The value of the tag.
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['key'] as String?,
      value: json['value'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'key': key,
      if (value != null) 'value': value,
    };
  }
}

/// Used to filter information based on tags.
class TagFilter {
  /// The tag key.
  final String? tagKey;

  /// The tag values.
  final List<String>? tagValues;

  TagFilter({
    this.tagKey,
    this.tagValues,
  });

  factory TagFilter.fromJson(Map<String, dynamic> json) {
    return TagFilter(
      tagKey: json['tagKey'] as String?,
      tagValues: (json['tagValues'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final tagKey = this.tagKey;
    final tagValues = this.tagValues;
    return {
      if (tagKey != null) 'tagKey': tagKey,
      if (tagValues != null) 'tagValues': tagValues,
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

class UpdateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  final String? clientToken;

  /// Information about the resource share.
  final ResourceShare? resourceShare;

  UpdateResourceShareResponse({
    this.clientToken,
    this.resourceShare,
  });

  factory UpdateResourceShareResponse.fromJson(Map<String, dynamic> json) {
    return UpdateResourceShareResponse(
      clientToken: json['clientToken'] as String?,
      resourceShare: json['resourceShare'] != null
          ? ResourceShare.fromJson(
              json['resourceShare'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final clientToken = this.clientToken;
    final resourceShare = this.resourceShare;
    return {
      if (clientToken != null) 'clientToken': clientToken,
      if (resourceShare != null) 'resourceShare': resourceShare,
    };
  }
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InvalidClientTokenException extends _s.GenericAwsException {
  InvalidClientTokenException({String? type, String? message})
      : super(
            type: type, code: 'InvalidClientTokenException', message: message);
}

class InvalidMaxResultsException extends _s.GenericAwsException {
  InvalidMaxResultsException({String? type, String? message})
      : super(type: type, code: 'InvalidMaxResultsException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String? type, String? message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidResourceTypeException extends _s.GenericAwsException {
  InvalidResourceTypeException({String? type, String? message})
      : super(
            type: type, code: 'InvalidResourceTypeException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class MalformedArnException extends _s.GenericAwsException {
  MalformedArnException({String? type, String? message})
      : super(type: type, code: 'MalformedArnException', message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class ResourceArnNotFoundException extends _s.GenericAwsException {
  ResourceArnNotFoundException({String? type, String? message})
      : super(
            type: type, code: 'ResourceArnNotFoundException', message: message);
}

class ResourceShareInvitationAlreadyAcceptedException
    extends _s.GenericAwsException {
  ResourceShareInvitationAlreadyAcceptedException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationAlreadyAcceptedException',
            message: message);
}

class ResourceShareInvitationAlreadyRejectedException
    extends _s.GenericAwsException {
  ResourceShareInvitationAlreadyRejectedException(
      {String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationAlreadyRejectedException',
            message: message);
}

class ResourceShareInvitationArnNotFoundException
    extends _s.GenericAwsException {
  ResourceShareInvitationArnNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationArnNotFoundException',
            message: message);
}

class ResourceShareInvitationExpiredException extends _s.GenericAwsException {
  ResourceShareInvitationExpiredException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareInvitationExpiredException',
            message: message);
}

class ResourceShareLimitExceededException extends _s.GenericAwsException {
  ResourceShareLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceShareLimitExceededException',
            message: message);
}

class ServerInternalException extends _s.GenericAwsException {
  ServerInternalException({String? type, String? message})
      : super(type: type, code: 'ServerInternalException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String? type, String? message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class TagPolicyViolationException extends _s.GenericAwsException {
  TagPolicyViolationException({String? type, String? message})
      : super(
            type: type, code: 'TagPolicyViolationException', message: message);
}

class UnknownResourceException extends _s.GenericAwsException {
  UnknownResourceException({String? type, String? message})
      : super(type: type, code: 'UnknownResourceException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InvalidClientTokenException': (type, message) =>
      InvalidClientTokenException(type: type, message: message),
  'InvalidMaxResultsException': (type, message) =>
      InvalidMaxResultsException(type: type, message: message),
  'InvalidNextTokenException': (type, message) =>
      InvalidNextTokenException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'InvalidResourceTypeException': (type, message) =>
      InvalidResourceTypeException(type: type, message: message),
  'InvalidStateTransitionException': (type, message) =>
      InvalidStateTransitionException(type: type, message: message),
  'MalformedArnException': (type, message) =>
      MalformedArnException(type: type, message: message),
  'MissingRequiredParameterException': (type, message) =>
      MissingRequiredParameterException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'ResourceArnNotFoundException': (type, message) =>
      ResourceArnNotFoundException(type: type, message: message),
  'ResourceShareInvitationAlreadyAcceptedException': (type, message) =>
      ResourceShareInvitationAlreadyAcceptedException(
          type: type, message: message),
  'ResourceShareInvitationAlreadyRejectedException': (type, message) =>
      ResourceShareInvitationAlreadyRejectedException(
          type: type, message: message),
  'ResourceShareInvitationArnNotFoundException': (type, message) =>
      ResourceShareInvitationArnNotFoundException(type: type, message: message),
  'ResourceShareInvitationExpiredException': (type, message) =>
      ResourceShareInvitationExpiredException(type: type, message: message),
  'ResourceShareLimitExceededException': (type, message) =>
      ResourceShareLimitExceededException(type: type, message: message),
  'ServerInternalException': (type, message) =>
      ServerInternalException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'TagLimitExceededException': (type, message) =>
      TagLimitExceededException(type: type, message: message),
  'TagPolicyViolationException': (type, message) =>
      TagPolicyViolationException(type: type, message: message),
  'UnknownResourceException': (type, message) =>
      UnknownResourceException(type: type, message: message),
};
