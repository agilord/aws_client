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

part '2018-01-04.g.dart';

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
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
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
    @_s.required String resourceShareInvitationArn,
    String clientToken,
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
  /// The principals.
  ///
  /// Parameter [resourceArns] :
  /// The Amazon Resource Names (ARN) of the resources.
  Future<AssociateResourceShareResponse> associateResourceShare({
    @_s.required String resourceShareArn,
    String clientToken,
    List<String> principals,
    List<String> resourceArns,
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
  /// The ARN of the AWS RAM permission to associate with the resource share.
  ///
  /// Parameter [resourceShareArn] :
  /// The Amazon Resource Name (ARN) of the resource share.
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [replace] :
  /// Indicates whether the permission should replace the permissions that are
  /// currently associated with the resource share. Use <code>true</code> to
  /// replace the current permissions. Use <code>false</code> to add the
  /// permission to the current permission.
  Future<AssociateResourceSharePermissionResponse>
      associateResourceSharePermission({
    @_s.required String permissionArn,
    @_s.required String resourceShareArn,
    String clientToken,
    bool replace,
  }) async {
    ArgumentError.checkNotNull(permissionArn, 'permissionArn');
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $payload = <String, dynamic>{
      'permissionArn': permissionArn,
      'resourceShareArn': resourceShareArn,
      if (clientToken != null) 'clientToken': clientToken,
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
    @_s.required String name,
    bool allowExternalPrincipals,
    String clientToken,
    List<String> permissionArns,
    List<String> principals,
    List<String> resourceArns,
    List<Tag> tags,
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
    @_s.required String resourceShareArn,
    String clientToken,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $query = <String, List<String>>{
      if (resourceShareArn != null) 'resourceShareArn': [resourceShareArn],
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
    @_s.required String resourceShareArn,
    String clientToken,
    List<String> principals,
    List<String> resourceArns,
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
    @_s.required String permissionArn,
    @_s.required String resourceShareArn,
    String clientToken,
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
    @_s.required String permissionArn,
    int permissionVersion,
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
    @_s.required List<String> resourceArns,
    int maxResults,
    String nextToken,
    String principal,
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
    @_s.required ResourceShareAssociationType associationType,
    ResourceShareAssociationStatus associationStatus,
    int maxResults,
    String nextToken,
    String principal,
    String resourceArn,
    List<String> resourceShareArns,
  }) async {
    ArgumentError.checkNotNull(associationType, 'associationType');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'associationType': associationType?.toValue() ?? '',
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

  /// Gets the invitations for resource sharing that you've received.
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
    int maxResults,
    String nextToken,
    List<String> resourceShareArns,
    List<String> resourceShareInvitationArns,
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
  /// Parameter [resourceShareArns] :
  /// The Amazon Resource Names (ARN) of the resource shares.
  ///
  /// Parameter [resourceShareStatus] :
  /// The status of the resource share.
  ///
  /// Parameter [tagFilters] :
  /// One or more tag filters.
  Future<GetResourceSharesResponse> getResourceShares({
    @_s.required ResourceOwner resourceOwner,
    int maxResults,
    String name,
    String nextToken,
    List<String> resourceShareArns,
    ResourceShareStatus resourceShareStatus,
    List<TagFilter> tagFilters,
  }) async {
    ArgumentError.checkNotNull(resourceOwner, 'resourceOwner');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner?.toValue() ?? '',
      if (maxResults != null) 'maxResults': maxResults,
      if (name != null) 'name': name,
      if (nextToken != null) 'nextToken': nextToken,
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
    @_s.required String resourceShareInvitationArn,
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
    String resourceType,
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
  /// Valid values: <code>codebuild:Project</code> |
  /// <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code>
  /// | <code>ec2:DedicatedHost</code> | <code>ec2:Subnet</code> |
  /// <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> |
  /// <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> |
  /// <code>imagebuilder:ImageRecipe</code> |
  /// <code>license-manager:LicenseConfiguration</code> I
  /// <code>resource-groups:Group</code> | <code>rds:Cluster</code> |
  /// <code>route53resolver:ResolverRule</code>
  Future<ListPrincipalsResponse> listPrincipals({
    @_s.required ResourceOwner resourceOwner,
    int maxResults,
    String nextToken,
    List<String> principals,
    String resourceArn,
    List<String> resourceShareArns,
    String resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceOwner, 'resourceOwner');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner?.toValue() ?? '',
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
    @_s.required String resourceShareArn,
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
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
  /// Valid values: <code>codebuild:Project</code> |
  /// <code>codebuild:ReportGroup</code> | <code>ec2:CapacityReservation</code>
  /// | <code>ec2:DedicatedHost</code> | <code>ec2:Subnet</code> |
  /// <code>ec2:TrafficMirrorTarget</code> | <code>ec2:TransitGateway</code> |
  /// <code>imagebuilder:Component</code> | <code>imagebuilder:Image</code> |
  /// <code>imagebuilder:ImageRecipe</code> |
  /// <code>license-manager:LicenseConfiguration</code> I
  /// <code>resource-groups:Group</code> | <code>rds:Cluster</code> |
  /// <code>route53resolver:ResolverRule</code>
  Future<ListResourcesResponse> listResources({
    @_s.required ResourceOwner resourceOwner,
    int maxResults,
    String nextToken,
    String principal,
    List<String> resourceArns,
    List<String> resourceShareArns,
    String resourceType,
  }) async {
    ArgumentError.checkNotNull(resourceOwner, 'resourceOwner');
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      500,
    );
    final $payload = <String, dynamic>{
      'resourceOwner': resourceOwner?.toValue() ?? '',
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
    @_s.required String resourceShareArn,
  }) async {
    ArgumentError.checkNotNull(resourceShareArn, 'resourceShareArn');
    final $query = <String, List<String>>{
      if (resourceShareArn != null) 'resourceShareArn': [resourceShareArn],
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
    @_s.required String resourceShareInvitationArn,
    String clientToken,
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
    @_s.required String resourceShareArn,
    @_s.required List<Tag> tags,
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
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceShareArn,
    @_s.required List<String> tagKeys,
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
    return UntagResourceResponse.fromJson(response);
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
    @_s.required String resourceShareArn,
    bool allowExternalPrincipals,
    String clientToken,
    String name,
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

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AcceptResourceShareInvitationResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Information about the invitation.
  @_s.JsonKey(name: 'resourceShareInvitation')
  final ResourceShareInvitation resourceShareInvitation;

  AcceptResourceShareInvitationResponse({
    this.clientToken,
    this.resourceShareInvitation,
  });
  factory AcceptResourceShareInvitationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AcceptResourceShareInvitationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateResourceSharePermissionResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Indicates whether the request succeeded.
  @_s.JsonKey(name: 'returnValue')
  final bool returnValue;

  AssociateResourceSharePermissionResponse({
    this.clientToken,
    this.returnValue,
  });
  factory AssociateResourceSharePermissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$AssociateResourceSharePermissionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AssociateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Information about the associations.
  @_s.JsonKey(name: 'resourceShareAssociations')
  final List<ResourceShareAssociation> resourceShareAssociations;

  AssociateResourceShareResponse({
    this.clientToken,
    this.resourceShareAssociations,
  });
  factory AssociateResourceShareResponse.fromJson(Map<String, dynamic> json) =>
      _$AssociateResourceShareResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Information about the resource share.
  @_s.JsonKey(name: 'resourceShare')
  final ResourceShare resourceShare;

  CreateResourceShareResponse({
    this.clientToken,
    this.resourceShare,
  });
  factory CreateResourceShareResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateResourceShareResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Indicates whether the request succeeded.
  @_s.JsonKey(name: 'returnValue')
  final bool returnValue;

  DeleteResourceShareResponse({
    this.clientToken,
    this.returnValue,
  });
  factory DeleteResourceShareResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteResourceShareResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateResourceSharePermissionResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Indicates whether the request succeeded.
  @_s.JsonKey(name: 'returnValue')
  final bool returnValue;

  DisassociateResourceSharePermissionResponse({
    this.clientToken,
    this.returnValue,
  });
  factory DisassociateResourceSharePermissionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateResourceSharePermissionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Information about the associations.
  @_s.JsonKey(name: 'resourceShareAssociations')
  final List<ResourceShareAssociation> resourceShareAssociations;

  DisassociateResourceShareResponse({
    this.clientToken,
    this.resourceShareAssociations,
  });
  factory DisassociateResourceShareResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DisassociateResourceShareResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class EnableSharingWithAwsOrganizationResponse {
  /// Indicates whether the request succeeded.
  @_s.JsonKey(name: 'returnValue')
  final bool returnValue;

  EnableSharingWithAwsOrganizationResponse({
    this.returnValue,
  });
  factory EnableSharingWithAwsOrganizationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$EnableSharingWithAwsOrganizationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetPermissionResponse {
  /// Information about the permission.
  @_s.JsonKey(name: 'permission')
  final ResourceSharePermissionDetail permission;

  GetPermissionResponse({
    this.permission,
  });
  factory GetPermissionResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPermissionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourcePoliciesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A key policy document, in JSON format.
  @_s.JsonKey(name: 'policies')
  final List<String> policies;

  GetResourcePoliciesResponse({
    this.nextToken,
    this.policies,
  });
  factory GetResourcePoliciesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourcePoliciesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceShareAssociationsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the associations.
  @_s.JsonKey(name: 'resourceShareAssociations')
  final List<ResourceShareAssociation> resourceShareAssociations;

  GetResourceShareAssociationsResponse({
    this.nextToken,
    this.resourceShareAssociations,
  });
  factory GetResourceShareAssociationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResourceShareAssociationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceShareInvitationsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the invitations.
  @_s.JsonKey(name: 'resourceShareInvitations')
  final List<ResourceShareInvitation> resourceShareInvitations;

  GetResourceShareInvitationsResponse({
    this.nextToken,
    this.resourceShareInvitations,
  });
  factory GetResourceShareInvitationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetResourceShareInvitationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetResourceSharesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the resource shares.
  @_s.JsonKey(name: 'resourceShares')
  final List<ResourceShare> resourceShares;

  GetResourceSharesResponse({
    this.nextToken,
    this.resourceShares,
  });
  factory GetResourceSharesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResourceSharesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPendingInvitationResourcesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the resources included the resource share.
  @_s.JsonKey(name: 'resources')
  final List<Resource> resources;

  ListPendingInvitationResourcesResponse({
    this.nextToken,
    this.resources,
  });
  factory ListPendingInvitationResourcesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListPendingInvitationResourcesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPermissionsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the permissions.
  @_s.JsonKey(name: 'permissions')
  final List<ResourceSharePermissionSummary> permissions;

  ListPermissionsResponse({
    this.nextToken,
    this.permissions,
  });
  factory ListPermissionsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListPrincipalsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The principals.
  @_s.JsonKey(name: 'principals')
  final List<Principal> principals;

  ListPrincipalsResponse({
    this.nextToken,
    this.principals,
  });
  factory ListPrincipalsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListPrincipalsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceSharePermissionsResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The permissions associated with the resource share.
  @_s.JsonKey(name: 'permissions')
  final List<ResourceSharePermissionSummary> permissions;

  ListResourceSharePermissionsResponse({
    this.nextToken,
    this.permissions,
  });
  factory ListResourceSharePermissionsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListResourceSharePermissionsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourceTypesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The shareable resource types supported by AWS RAM.
  @_s.JsonKey(name: 'resourceTypes')
  final List<ServiceNameAndResourceType> resourceTypes;

  ListResourceTypesResponse({
    this.nextToken,
    this.resourceTypes,
  });
  factory ListResourceTypesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourceTypesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListResourcesResponse {
  /// The token to use to retrieve the next page of results. This value is
  /// <code>null</code> when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the resources.
  @_s.JsonKey(name: 'resources')
  final List<Resource> resources;

  ListResourcesResponse({
    this.nextToken,
    this.resources,
  });
  factory ListResourcesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResourcesResponseFromJson(json);
}

/// Describes a principal for use with AWS Resource Access Manager.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Principal {
  /// The time when the principal was associated with the resource share.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// Indicates whether the principal belongs to the same AWS organization as the
  /// AWS account that owns the resource share.
  @_s.JsonKey(name: 'external')
  final bool external;

  /// The ID of the principal.
  @_s.JsonKey(name: 'id')
  final String id;

  /// The time when the association was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the resource share.
  @_s.JsonKey(name: 'resourceShareArn')
  final String resourceShareArn;

  Principal({
    this.creationTime,
    this.external,
    this.id,
    this.lastUpdatedTime,
    this.resourceShareArn,
  });
  factory Principal.fromJson(Map<String, dynamic> json) =>
      _$PrincipalFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PromoteResourceShareCreatedFromPolicyResponse {
  /// Indicates whether the request succeeded.
  @_s.JsonKey(name: 'returnValue')
  final bool returnValue;

  PromoteResourceShareCreatedFromPolicyResponse({
    this.returnValue,
  });
  factory PromoteResourceShareCreatedFromPolicyResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PromoteResourceShareCreatedFromPolicyResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RejectResourceShareInvitationResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Information about the invitation.
  @_s.JsonKey(name: 'resourceShareInvitation')
  final ResourceShareInvitation resourceShareInvitation;

  RejectResourceShareInvitationResponse({
    this.clientToken,
    this.resourceShareInvitation,
  });
  factory RejectResourceShareInvitationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$RejectResourceShareInvitationResponseFromJson(json);
}

/// Describes a resource associated with a resource share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Resource {
  /// The Amazon Resource Name (ARN) of the resource.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time when the resource was associated with the resource share.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The time when the association was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The ARN of the resource group. This value is returned only if the resource
  /// is a resource group.
  @_s.JsonKey(name: 'resourceGroupArn')
  final String resourceGroupArn;

  /// The Amazon Resource Name (ARN) of the resource share.
  @_s.JsonKey(name: 'resourceShareArn')
  final String resourceShareArn;

  /// The status of the resource.
  @_s.JsonKey(name: 'status')
  final ResourceStatus status;

  /// A message about the status of the resource.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The resource type.
  @_s.JsonKey(name: 'type')
  final String type;

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
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

enum ResourceOwner {
  @_s.JsonValue('SELF')
  self,
  @_s.JsonValue('OTHER-ACCOUNTS')
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
    throw Exception('Unknown enum value: $this');
  }
}

/// Describes a resource share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceShare {
  /// Indicates whether principals outside your AWS organization can be associated
  /// with a resource share.
  @_s.JsonKey(name: 'allowExternalPrincipals')
  final bool allowExternalPrincipals;

  /// The time when the resource share was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

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
  @_s.JsonKey(name: 'featureSet')
  final ResourceShareFeatureSet featureSet;

  /// The time when the resource share was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The name of the resource share.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID of the AWS account that owns the resource share.
  @_s.JsonKey(name: 'owningAccountId')
  final String owningAccountId;

  /// The Amazon Resource Name (ARN) of the resource share.
  @_s.JsonKey(name: 'resourceShareArn')
  final String resourceShareArn;

  /// The status of the resource share.
  @_s.JsonKey(name: 'status')
  final ResourceShareStatus status;

  /// A message about the status of the resource share.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The tags for the resource share.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

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
  factory ResourceShare.fromJson(Map<String, dynamic> json) =>
      _$ResourceShareFromJson(json);
}

/// Describes an association with a resource share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceShareAssociation {
  /// The associated entity. For resource associations, this is the ARN of the
  /// resource. For principal associations, this is the ID of an AWS account or
  /// the ARN of an OU or organization from AWS Organizations.
  @_s.JsonKey(name: 'associatedEntity')
  final String associatedEntity;

  /// The association type.
  @_s.JsonKey(name: 'associationType')
  final ResourceShareAssociationType associationType;

  /// The time when the association was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// Indicates whether the principal belongs to the same AWS organization as the
  /// AWS account that owns the resource share.
  @_s.JsonKey(name: 'external')
  final bool external;

  /// The time when the association was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The Amazon Resource Name (ARN) of the resource share.
  @_s.JsonKey(name: 'resourceShareArn')
  final String resourceShareArn;

  /// The name of the resource share.
  @_s.JsonKey(name: 'resourceShareName')
  final String resourceShareName;

  /// The status of the association.
  @_s.JsonKey(name: 'status')
  final ResourceShareAssociationStatus status;

  /// A message about the status of the association.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

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
  factory ResourceShareAssociation.fromJson(Map<String, dynamic> json) =>
      _$ResourceShareAssociationFromJson(json);
}

enum ResourceShareAssociationStatus {
  @_s.JsonValue('ASSOCIATING')
  associating,
  @_s.JsonValue('ASSOCIATED')
  associated,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DISASSOCIATING')
  disassociating,
  @_s.JsonValue('DISASSOCIATED')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceShareAssociationType {
  @_s.JsonValue('PRINCIPAL')
  principal,
  @_s.JsonValue('RESOURCE')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceShareFeatureSet {
  @_s.JsonValue('CREATED_FROM_POLICY')
  createdFromPolicy,
  @_s.JsonValue('PROMOTING_TO_STANDARD')
  promotingToStandard,
  @_s.JsonValue('STANDARD')
  standard,
}

/// Describes an invitation to join a resource share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceShareInvitation {
  /// The date and time when the invitation was sent.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'invitationTimestamp')
  final DateTime invitationTimestamp;

  /// The ID of the AWS account that received the invitation.
  @_s.JsonKey(name: 'receiverAccountId')
  final String receiverAccountId;

  /// The Amazon Resource Name (ARN) of the resource share.
  @_s.JsonKey(name: 'resourceShareArn')
  final String resourceShareArn;

  /// To view the resources associated with a pending resource share invitation,
  /// use <a
  /// href="https://docs.aws.amazon.com/ram/latest/APIReference/API_ListPendingInvitationResources.html">
  /// ListPendingInvitationResources</a>.
  @_s.JsonKey(name: 'resourceShareAssociations')
  final List<ResourceShareAssociation> resourceShareAssociations;

  /// The Amazon Resource Name (ARN) of the invitation.
  @_s.JsonKey(name: 'resourceShareInvitationArn')
  final String resourceShareInvitationArn;

  /// The name of the resource share.
  @_s.JsonKey(name: 'resourceShareName')
  final String resourceShareName;

  /// The ID of the AWS account that sent the invitation.
  @_s.JsonKey(name: 'senderAccountId')
  final String senderAccountId;

  /// The status of the invitation.
  @_s.JsonKey(name: 'status')
  final ResourceShareInvitationStatus status;

  ResourceShareInvitation({
    this.invitationTimestamp,
    this.receiverAccountId,
    this.resourceShareArn,
    this.resourceShareAssociations,
    this.resourceShareInvitationArn,
    this.resourceShareName,
    this.senderAccountId,
    this.status,
  });
  factory ResourceShareInvitation.fromJson(Map<String, dynamic> json) =>
      _$ResourceShareInvitationFromJson(json);
}

enum ResourceShareInvitationStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ACCEPTED')
  accepted,
  @_s.JsonValue('REJECTED')
  rejected,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// Information about an AWS RAM permission.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceSharePermissionDetail {
  /// The ARN of the permission.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time when the permission was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The identifier for the version of the permission that is set as the default
  /// version.
  @_s.JsonKey(name: 'defaultVersion')
  final bool defaultVersion;

  /// The date and time when the permission was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The name of the permission.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The permission's effect and actions in JSON format. The <code>effect</code>
  /// indicates whether the actions are allowed or denied. The
  /// <code>actions</code> list the API actions to which the principal is granted
  /// or denied access.
  @_s.JsonKey(name: 'permission')
  final String permission;

  /// The resource type to which the permission applies.
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  /// The identifier for the version of the permission.
  @_s.JsonKey(name: 'version')
  final String version;

  ResourceSharePermissionDetail({
    this.arn,
    this.creationTime,
    this.defaultVersion,
    this.lastUpdatedTime,
    this.name,
    this.permission,
    this.resourceType,
    this.version,
  });
  factory ResourceSharePermissionDetail.fromJson(Map<String, dynamic> json) =>
      _$ResourceSharePermissionDetailFromJson(json);
}

/// Information about a permission that is associated with a resource share.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ResourceSharePermissionSummary {
  /// The ARN of the permission.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The date and time when the permission was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The identifier for the version of the permission that is set as the default
  /// version.
  @_s.JsonKey(name: 'defaultVersion')
  final bool defaultVersion;

  /// The date and time when the permission was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedTime')
  final DateTime lastUpdatedTime;

  /// The name of the permission.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The type of resource to which the permission applies.
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  /// The current status of the permission.
  @_s.JsonKey(name: 'status')
  final String status;

  /// The identifier for the version of the permission.
  @_s.JsonKey(name: 'version')
  final String version;

  ResourceSharePermissionSummary({
    this.arn,
    this.creationTime,
    this.defaultVersion,
    this.lastUpdatedTime,
    this.name,
    this.resourceType,
    this.status,
    this.version,
  });
  factory ResourceSharePermissionSummary.fromJson(Map<String, dynamic> json) =>
      _$ResourceSharePermissionSummaryFromJson(json);
}

enum ResourceShareStatus {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
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
    throw Exception('Unknown enum value: $this');
  }
}

enum ResourceStatus {
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('ZONAL_RESOURCE_INACCESSIBLE')
  zonalResourceInaccessible,
  @_s.JsonValue('LIMIT_EXCEEDED')
  limitExceeded,
  @_s.JsonValue('UNAVAILABLE')
  unavailable,
  @_s.JsonValue('PENDING')
  pending,
}

/// Information about the shareable resource types and the AWS services to which
/// they belong.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServiceNameAndResourceType {
  /// The shareable resource types.
  @_s.JsonKey(name: 'resourceType')
  final String resourceType;

  /// The name of the AWS services to which the resources belong.
  @_s.JsonKey(name: 'serviceName')
  final String serviceName;

  ServiceNameAndResourceType({
    this.resourceType,
    this.serviceName,
  });
  factory ServiceNameAndResourceType.fromJson(Map<String, dynamic> json) =>
      _$ServiceNameAndResourceTypeFromJson(json);
}

/// Information about a tag.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The key of the tag.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The value of the tag.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

/// Used to filter information based on tags.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TagFilter {
  /// The tag key.
  @_s.JsonKey(name: 'tagKey')
  final String tagKey;

  /// The tag values.
  @_s.JsonKey(name: 'tagValues')
  final List<String> tagValues;

  TagFilter({
    this.tagKey,
    this.tagValues,
  });
  Map<String, dynamic> toJson() => _$TagFilterToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateResourceShareResponse {
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @_s.JsonKey(name: 'clientToken')
  final String clientToken;

  /// Information about the resource share.
  @_s.JsonKey(name: 'resourceShare')
  final ResourceShare resourceShare;

  UpdateResourceShareResponse({
    this.clientToken,
    this.resourceShare,
  });
  factory UpdateResourceShareResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateResourceShareResponseFromJson(json);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InvalidClientTokenException extends _s.GenericAwsException {
  InvalidClientTokenException({String type, String message})
      : super(
            type: type, code: 'InvalidClientTokenException', message: message);
}

class InvalidMaxResultsException extends _s.GenericAwsException {
  InvalidMaxResultsException({String type, String message})
      : super(type: type, code: 'InvalidMaxResultsException', message: message);
}

class InvalidNextTokenException extends _s.GenericAwsException {
  InvalidNextTokenException({String type, String message})
      : super(type: type, code: 'InvalidNextTokenException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class InvalidResourceTypeException extends _s.GenericAwsException {
  InvalidResourceTypeException({String type, String message})
      : super(
            type: type, code: 'InvalidResourceTypeException', message: message);
}

class InvalidStateTransitionException extends _s.GenericAwsException {
  InvalidStateTransitionException({String type, String message})
      : super(
            type: type,
            code: 'InvalidStateTransitionException',
            message: message);
}

class MalformedArnException extends _s.GenericAwsException {
  MalformedArnException({String type, String message})
      : super(type: type, code: 'MalformedArnException', message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String type, String message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class ResourceArnNotFoundException extends _s.GenericAwsException {
  ResourceArnNotFoundException({String type, String message})
      : super(
            type: type, code: 'ResourceArnNotFoundException', message: message);
}

class ResourceShareInvitationAlreadyAcceptedException
    extends _s.GenericAwsException {
  ResourceShareInvitationAlreadyAcceptedException({String type, String message})
      : super(
            type: type,
            code: 'ResourceShareInvitationAlreadyAcceptedException',
            message: message);
}

class ResourceShareInvitationAlreadyRejectedException
    extends _s.GenericAwsException {
  ResourceShareInvitationAlreadyRejectedException({String type, String message})
      : super(
            type: type,
            code: 'ResourceShareInvitationAlreadyRejectedException',
            message: message);
}

class ResourceShareInvitationArnNotFoundException
    extends _s.GenericAwsException {
  ResourceShareInvitationArnNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'ResourceShareInvitationArnNotFoundException',
            message: message);
}

class ResourceShareInvitationExpiredException extends _s.GenericAwsException {
  ResourceShareInvitationExpiredException({String type, String message})
      : super(
            type: type,
            code: 'ResourceShareInvitationExpiredException',
            message: message);
}

class ResourceShareLimitExceededException extends _s.GenericAwsException {
  ResourceShareLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ResourceShareLimitExceededException',
            message: message);
}

class ServerInternalException extends _s.GenericAwsException {
  ServerInternalException({String type, String message})
      : super(type: type, code: 'ServerInternalException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class TagLimitExceededException extends _s.GenericAwsException {
  TagLimitExceededException({String type, String message})
      : super(type: type, code: 'TagLimitExceededException', message: message);
}

class TagPolicyViolationException extends _s.GenericAwsException {
  TagPolicyViolationException({String type, String message})
      : super(
            type: type, code: 'TagPolicyViolationException', message: message);
}

class UnknownResourceException extends _s.GenericAwsException {
  UnknownResourceException({String type, String message})
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
