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

/// With License Manager, you can create user-based subscriptions to utilize
/// licensed software with a per user subscription fee on Amazon EC2 instances.
class LicenseManagerUserSubscriptions {
  final _s.RestJsonProtocol _protocol;
  LicenseManagerUserSubscriptions({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'license-manager-user-subscriptions',
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

  /// Associates the user to an EC2 instance to utilize user-based
  /// subscriptions.
  /// <note>
  /// Your estimated bill for charges on the number of users and related costs
  /// will take 48 hours to appear for billing periods that haven't closed
  /// (marked as <b>Pending</b> billing status) in Amazon Web Services Billing.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/invoice.html">Viewing
  /// your monthly charges</a> in the <i>Amazon Web Services Billing User
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProvider] :
  /// The identity provider for the user.
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance that provides the user-based subscription.
  ///
  /// Parameter [username] :
  /// The user name from the identity provider.
  ///
  /// Parameter [domain] :
  /// The domain name of the Active Directory that contains information for the
  /// user to associate.
  ///
  /// Parameter [tags] :
  /// The tags that apply for the user association.
  Future<AssociateUserResponse> associateUser({
    required IdentityProvider identityProvider,
    required String instanceId,
    required String username,
    String? domain,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'InstanceId': instanceId,
      'Username': username,
      if (domain != null) 'Domain': domain,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/AssociateUser',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateUserResponse.fromJson(response);
  }

  /// Creates a network endpoint for the Remote Desktop Services (RDS) license
  /// server.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProviderArn] :
  /// The Amazon Resource Name (ARN) that identifies the
  /// <code>IdentityProvider</code> resource that contains details about a
  /// registered identity provider. In the case of Active Directory, that can be
  /// a self-managed Active Directory or an Amazon Web Services Managed Active
  /// Directory that contains user identity details.
  ///
  /// Parameter [licenseServerSettings] :
  /// The <code>LicenseServerSettings</code> resource to create for the
  /// endpoint. The settings include the type of license server and the Secrets
  /// Manager secret that enables administrators to add or remove users
  /// associated with the license server.
  ///
  /// Parameter [tags] :
  /// The tags that apply for the license server endpoint.
  Future<CreateLicenseServerEndpointResponse> createLicenseServerEndpoint({
    required String identityProviderArn,
    required LicenseServerSettings licenseServerSettings,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProviderArn': identityProviderArn,
      'LicenseServerSettings': licenseServerSettings,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/license-server/CreateLicenseServerEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLicenseServerEndpointResponse.fromJson(response);
  }

  /// Deletes a <code>LicenseServerEndpoint</code> resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseServerEndpointArn] :
  /// The Amazon Resource Name (ARN) that identifies the
  /// <code>LicenseServerEndpoint</code> resource to delete.
  ///
  /// Parameter [serverType] :
  /// The type of License Server that the delete request refers to.
  Future<DeleteLicenseServerEndpointResponse> deleteLicenseServerEndpoint({
    required String licenseServerEndpointArn,
    required ServerType serverType,
  }) async {
    final $payload = <String, dynamic>{
      'LicenseServerEndpointArn': licenseServerEndpointArn,
      'ServerType': serverType.value,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/license-server/DeleteLicenseServerEndpoint',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteLicenseServerEndpointResponse.fromJson(response);
  }

  /// Deregisters the Active Directory identity provider from License Manager
  /// user-based subscriptions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the Active Directory identity
  /// provider.
  ///
  /// Parameter [identityProviderArn] :
  /// The Amazon Resource Name (ARN) that identifies the identity provider to
  /// deregister.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Valid values: <code>VISUAL_STUDIO_ENTERPRISE</code> |
  /// <code>VISUAL_STUDIO_PROFESSIONAL</code> |
  /// <code>OFFICE_PROFESSIONAL_PLUS</code> |
  /// <code>REMOTE_DESKTOP_SERVICES</code>
  Future<DeregisterIdentityProviderResponse> deregisterIdentityProvider({
    IdentityProvider? identityProvider,
    String? identityProviderArn,
    String? product,
  }) async {
    final $payload = <String, dynamic>{
      if (identityProvider != null) 'IdentityProvider': identityProvider,
      if (identityProviderArn != null)
        'IdentityProviderArn': identityProviderArn,
      if (product != null) 'Product': product,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identity-provider/DeregisterIdentityProvider',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterIdentityProviderResponse.fromJson(response);
  }

  /// Disassociates the user from an EC2 instance providing user-based
  /// subscriptions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain name of the Active Directory that contains information for the
  /// user to disassociate.
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the Active Directory identity
  /// provider.
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance which provides user-based subscriptions.
  ///
  /// Parameter [instanceUserArn] :
  /// The Amazon Resource Name (ARN) of the user to disassociate from the EC2
  /// instance.
  ///
  /// Parameter [username] :
  /// The user name from the Active Directory identity provider for the user.
  Future<DisassociateUserResponse> disassociateUser({
    String? domain,
    IdentityProvider? identityProvider,
    String? instanceId,
    String? instanceUserArn,
    String? username,
  }) async {
    final $payload = <String, dynamic>{
      if (domain != null) 'Domain': domain,
      if (identityProvider != null) 'IdentityProvider': identityProvider,
      if (instanceId != null) 'InstanceId': instanceId,
      if (instanceUserArn != null) 'InstanceUserArn': instanceUserArn,
      if (username != null) 'Username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/DisassociateUser',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateUserResponse.fromJson(response);
  }

  /// Lists the Active Directory identity providers for user-based
  /// subscriptions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// You can use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// Product
  /// </li>
  /// <li>
  /// DirectoryId
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from a single request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListIdentityProvidersResponse> listIdentityProviders({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identity-provider/ListIdentityProviders',
      exceptionFnMap: _exceptionFns,
    );
    return ListIdentityProvidersResponse.fromJson(response);
  }

  /// Lists the EC2 instances providing user-based subscriptions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// You can use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// Status
  /// </li>
  /// <li>
  /// InstanceId
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from a single request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListInstancesResponse> listInstances({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/instance/ListInstances',
      exceptionFnMap: _exceptionFns,
    );
    return ListInstancesResponse.fromJson(response);
  }

  /// List the Remote Desktop Services (RDS) License Server endpoints
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// You can use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// IdentityProviderArn
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from a single request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListLicenseServerEndpointsResponse> listLicenseServerEndpoints({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/license-server/ListLicenseServerEndpoints',
      exceptionFnMap: _exceptionFns,
    );
    return ListLicenseServerEndpointsResponse.fromJson(response);
  }

  /// Lists the user-based subscription products available from an identity
  /// provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [filters] :
  /// You can use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// Status
  /// </li>
  /// <li>
  /// Username
  /// </li>
  /// <li>
  /// Domain
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from a single request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Valid values: <code>VISUAL_STUDIO_ENTERPRISE</code> |
  /// <code>VISUAL_STUDIO_PROFESSIONAL</code> |
  /// <code>OFFICE_PROFESSIONAL_PLUS</code> |
  /// <code>REMOTE_DESKTOP_SERVICES</code>
  Future<ListProductSubscriptionsResponse> listProductSubscriptions({
    required IdentityProvider identityProvider,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? product,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (product != null) 'Product': product,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/ListProductSubscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListProductSubscriptionsResponse.fromJson(response);
  }

  /// Returns the list of tags for the specified resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource whose tags you want to
  /// retrieve.
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

  /// Lists user associations for an identity provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance, which provides user-based subscriptions.
  ///
  /// Parameter [filters] :
  /// You can use the following filters to streamline results:
  ///
  /// <ul>
  /// <li>
  /// Status
  /// </li>
  /// <li>
  /// Username
  /// </li>
  /// <li>
  /// Domain
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return from a single request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListUserAssociationsResponse> listUserAssociations({
    required IdentityProvider identityProvider,
    required String instanceId,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'InstanceId': instanceId,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/ListUserAssociations',
      exceptionFnMap: _exceptionFns,
    );
    return ListUserAssociationsResponse.fromJson(response);
  }

  /// Registers an identity provider for user-based subscriptions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider to register.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Valid values: <code>VISUAL_STUDIO_ENTERPRISE</code> |
  /// <code>VISUAL_STUDIO_PROFESSIONAL</code> |
  /// <code>OFFICE_PROFESSIONAL_PLUS</code> |
  /// <code>REMOTE_DESKTOP_SERVICES</code>
  ///
  /// Parameter [settings] :
  /// The registered identity provider’s product related configuration settings
  /// such as the subnets to provision VPC endpoints.
  ///
  /// Parameter [tags] :
  /// The tags that apply to the identity provider's registration.
  Future<RegisterIdentityProviderResponse> registerIdentityProvider({
    required IdentityProvider identityProvider,
    required String product,
    Settings? settings,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      if (settings != null) 'Settings': settings,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identity-provider/RegisterIdentityProvider',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterIdentityProviderResponse.fromJson(response);
  }

  /// Starts a product subscription for a user with the specified identity
  /// provider.
  /// <note>
  /// Your estimated bill for charges on the number of users and related costs
  /// will take 48 hours to appear for billing periods that haven't closed
  /// (marked as <b>Pending</b> billing status) in Amazon Web Services Billing.
  /// For more information, see <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/invoice.html">Viewing
  /// your monthly charges</a> in the <i>Amazon Web Services Billing User
  /// Guide</i>.
  /// </note>
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Valid values: <code>VISUAL_STUDIO_ENTERPRISE</code> |
  /// <code>VISUAL_STUDIO_PROFESSIONAL</code> |
  /// <code>OFFICE_PROFESSIONAL_PLUS</code> |
  /// <code>REMOTE_DESKTOP_SERVICES</code>
  ///
  /// Parameter [username] :
  /// The user name from the identity provider of the user.
  ///
  /// Parameter [domain] :
  /// The domain name of the Active Directory that contains the user for whom to
  /// start the product subscription.
  ///
  /// Parameter [tags] :
  /// The tags that apply to the product subscription.
  Future<StartProductSubscriptionResponse> startProductSubscription({
    required IdentityProvider identityProvider,
    required String product,
    required String username,
    String? domain,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      'Username': username,
      if (domain != null) 'Domain': domain,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/StartProductSubscription',
      exceptionFnMap: _exceptionFns,
    );
    return StartProductSubscriptionResponse.fromJson(response);
  }

  /// Stops a product subscription for a user with the specified identity
  /// provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [domain] :
  /// The domain name of the Active Directory that contains the user for whom to
  /// stop the product subscription.
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Valid values: <code>VISUAL_STUDIO_ENTERPRISE</code> |
  /// <code>VISUAL_STUDIO_PROFESSIONAL</code> |
  /// <code>OFFICE_PROFESSIONAL_PLUS</code> |
  /// <code>REMOTE_DESKTOP_SERVICES</code>
  ///
  /// Parameter [productUserArn] :
  /// The Amazon Resource Name (ARN) of the product user.
  ///
  /// Parameter [username] :
  /// The user name from the identity provider for the user.
  Future<StopProductSubscriptionResponse> stopProductSubscription({
    String? domain,
    IdentityProvider? identityProvider,
    String? product,
    String? productUserArn,
    String? username,
  }) async {
    final $payload = <String, dynamic>{
      if (domain != null) 'Domain': domain,
      if (identityProvider != null) 'IdentityProvider': identityProvider,
      if (product != null) 'Product': product,
      if (productUserArn != null) 'ProductUserArn': productUserArn,
      if (username != null) 'Username': username,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/StopProductSubscription',
      exceptionFnMap: _exceptionFns,
    );
    return StopProductSubscriptionResponse.fromJson(response);
  }

  /// Adds tags to a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to tag.
  ///
  /// Parameter [tags] :
  /// The tags to apply to the specified resource.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes tags from a resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource that you want to remove
  /// tags from.
  ///
  /// Parameter [tagKeys] :
  /// The tag keys to remove from the resource.
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

  /// Updates additional product configuration settings for the registered
  /// identity provider.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [updateSettings] :
  /// Updates the registered identity provider’s product related configuration
  /// settings. You can update any combination of settings in a single operation
  /// such as the:
  ///
  /// <ul>
  /// <li>
  /// Subnets which you want to add to provision VPC endpoints.
  /// </li>
  /// <li>
  /// Subnets which you want to remove the VPC endpoints from.
  /// </li>
  /// <li>
  /// Security group ID which permits traffic to the VPC endpoints.
  /// </li>
  /// </ul>
  ///
  /// Parameter [identityProviderArn] :
  /// The Amazon Resource Name (ARN) of the identity provider to update.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Valid values: <code>VISUAL_STUDIO_ENTERPRISE</code> |
  /// <code>VISUAL_STUDIO_PROFESSIONAL</code> |
  /// <code>OFFICE_PROFESSIONAL_PLUS</code> |
  /// <code>REMOTE_DESKTOP_SERVICES</code>
  Future<UpdateIdentityProviderSettingsResponse>
      updateIdentityProviderSettings({
    required UpdateSettings updateSettings,
    IdentityProvider? identityProvider,
    String? identityProviderArn,
    String? product,
  }) async {
    final $payload = <String, dynamic>{
      'UpdateSettings': updateSettings,
      if (identityProvider != null) 'IdentityProvider': identityProvider,
      if (identityProviderArn != null)
        'IdentityProviderArn': identityProviderArn,
      if (product != null) 'Product': product,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/identity-provider/UpdateIdentityProviderSettings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateIdentityProviderSettingsResponse.fromJson(response);
  }
}

/// @nodoc
class AssociateUserResponse {
  /// Metadata that describes the associate user operation.
  final InstanceUserSummary instanceUserSummary;

  AssociateUserResponse({
    required this.instanceUserSummary,
  });

  factory AssociateUserResponse.fromJson(Map<String, dynamic> json) {
    return AssociateUserResponse(
      instanceUserSummary: InstanceUserSummary.fromJson(
          (json['InstanceUserSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUserSummary = this.instanceUserSummary;
    return {
      'InstanceUserSummary': instanceUserSummary,
    };
  }
}

/// @nodoc
class CreateLicenseServerEndpointResponse {
  /// The Amazon Resource Name (ARN) of the identity provider specified in the
  /// request.
  final String? identityProviderArn;

  /// The ARN of the <code>LicenseServerEndpoint</code> resource.
  final String? licenseServerEndpointArn;

  CreateLicenseServerEndpointResponse({
    this.identityProviderArn,
    this.licenseServerEndpointArn,
  });

  factory CreateLicenseServerEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLicenseServerEndpointResponse(
      identityProviderArn: json['IdentityProviderArn'] as String?,
      licenseServerEndpointArn: json['LicenseServerEndpointArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderArn = this.identityProviderArn;
    final licenseServerEndpointArn = this.licenseServerEndpointArn;
    return {
      if (identityProviderArn != null)
        'IdentityProviderArn': identityProviderArn,
      if (licenseServerEndpointArn != null)
        'LicenseServerEndpointArn': licenseServerEndpointArn,
    };
  }
}

/// @nodoc
class DeleteLicenseServerEndpointResponse {
  /// Shows details from the <code>LicenseServerEndpoint</code> resource that was
  /// deleted.
  final LicenseServerEndpoint? licenseServerEndpoint;

  DeleteLicenseServerEndpointResponse({
    this.licenseServerEndpoint,
  });

  factory DeleteLicenseServerEndpointResponse.fromJson(
      Map<String, dynamic> json) {
    return DeleteLicenseServerEndpointResponse(
      licenseServerEndpoint: json['LicenseServerEndpoint'] != null
          ? LicenseServerEndpoint.fromJson(
              json['LicenseServerEndpoint'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseServerEndpoint = this.licenseServerEndpoint;
    return {
      if (licenseServerEndpoint != null)
        'LicenseServerEndpoint': licenseServerEndpoint,
    };
  }
}

/// @nodoc
class DeregisterIdentityProviderResponse {
  /// Metadata that describes the results of an identity provider operation.
  final IdentityProviderSummary identityProviderSummary;

  DeregisterIdentityProviderResponse({
    required this.identityProviderSummary,
  });

  factory DeregisterIdentityProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return DeregisterIdentityProviderResponse(
      identityProviderSummary: IdentityProviderSummary.fromJson(
          (json['IdentityProviderSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummary = this.identityProviderSummary;
    return {
      'IdentityProviderSummary': identityProviderSummary,
    };
  }
}

/// @nodoc
class DisassociateUserResponse {
  /// Metadata that describes the associate user operation.
  final InstanceUserSummary instanceUserSummary;

  DisassociateUserResponse({
    required this.instanceUserSummary,
  });

  factory DisassociateUserResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateUserResponse(
      instanceUserSummary: InstanceUserSummary.fromJson(
          (json['InstanceUserSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUserSummary = this.instanceUserSummary;
    return {
      'InstanceUserSummary': instanceUserSummary,
    };
  }
}

/// @nodoc
class ListIdentityProvidersResponse {
  /// An array of <code>IdentityProviderSummary</code> resources that contain
  /// details about the Active Directory identity providers that meet the request
  /// criteria.
  final List<IdentityProviderSummary> identityProviderSummaries;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListIdentityProvidersResponse({
    required this.identityProviderSummaries,
    this.nextToken,
  });

  factory ListIdentityProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentityProvidersResponse(
      identityProviderSummaries:
          ((json['IdentityProviderSummaries'] as List?) ?? const [])
              .nonNulls
              .map((e) =>
                  IdentityProviderSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummaries = this.identityProviderSummaries;
    final nextToken = this.nextToken;
    return {
      'IdentityProviderSummaries': identityProviderSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListInstancesResponse {
  /// An array of <code>InstanceSummary</code> resources that contain details
  /// about the instances that provide user-based subscriptions and also meet the
  /// request criteria.
  final List<InstanceSummary>? instanceSummaries;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListInstancesResponse({
    this.instanceSummaries,
    this.nextToken,
  });

  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstancesResponse(
      instanceSummaries: (json['InstanceSummaries'] as List?)
          ?.nonNulls
          .map((e) => InstanceSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceSummaries = this.instanceSummaries;
    final nextToken = this.nextToken;
    return {
      if (instanceSummaries != null) 'InstanceSummaries': instanceSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListLicenseServerEndpointsResponse {
  /// An array of <code>LicenseServerEndpoint</code> resources that contain
  /// detailed information about the RDS License Servers that meet the request
  /// criteria.
  final List<LicenseServerEndpoint>? licenseServerEndpoints;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListLicenseServerEndpointsResponse({
    this.licenseServerEndpoints,
    this.nextToken,
  });

  factory ListLicenseServerEndpointsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLicenseServerEndpointsResponse(
      licenseServerEndpoints: (json['LicenseServerEndpoints'] as List?)
          ?.nonNulls
          .map((e) => LicenseServerEndpoint.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseServerEndpoints = this.licenseServerEndpoints;
    final nextToken = this.nextToken;
    return {
      if (licenseServerEndpoints != null)
        'LicenseServerEndpoints': licenseServerEndpoints,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class ListProductSubscriptionsResponse {
  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// Metadata that describes the list product subscriptions operation.
  final List<ProductUserSummary>? productUserSummaries;

  ListProductSubscriptionsResponse({
    this.nextToken,
    this.productUserSummaries,
  });

  factory ListProductSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListProductSubscriptionsResponse(
      nextToken: json['NextToken'] as String?,
      productUserSummaries: (json['ProductUserSummaries'] as List?)
          ?.nonNulls
          .map((e) => ProductUserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final productUserSummaries = this.productUserSummaries;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (productUserSummaries != null)
        'ProductUserSummaries': productUserSummaries,
    };
  }
}

/// @nodoc
class ListTagsForResourceResponse {
  /// The tags for the specified resource.
  final Map<String, String>? tags;

  ListTagsForResourceResponse({
    this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      if (tags != null) 'Tags': tags,
    };
  }
}

/// @nodoc
class ListUserAssociationsResponse {
  /// Metadata that describes the list user association operation.
  final List<InstanceUserSummary>? instanceUserSummaries;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListUserAssociationsResponse({
    this.instanceUserSummaries,
    this.nextToken,
  });

  factory ListUserAssociationsResponse.fromJson(Map<String, dynamic> json) {
    return ListUserAssociationsResponse(
      instanceUserSummaries: (json['InstanceUserSummaries'] as List?)
          ?.nonNulls
          .map((e) => InstanceUserSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUserSummaries = this.instanceUserSummaries;
    final nextToken = this.nextToken;
    return {
      if (instanceUserSummaries != null)
        'InstanceUserSummaries': instanceUserSummaries,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

/// @nodoc
class RegisterIdentityProviderResponse {
  /// Metadata that describes the results of an identity provider operation.
  final IdentityProviderSummary identityProviderSummary;

  RegisterIdentityProviderResponse({
    required this.identityProviderSummary,
  });

  factory RegisterIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return RegisterIdentityProviderResponse(
      identityProviderSummary: IdentityProviderSummary.fromJson(
          (json['IdentityProviderSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummary = this.identityProviderSummary;
    return {
      'IdentityProviderSummary': identityProviderSummary,
    };
  }
}

/// @nodoc
class StartProductSubscriptionResponse {
  /// Metadata that describes the start product subscription operation.
  final ProductUserSummary productUserSummary;

  StartProductSubscriptionResponse({
    required this.productUserSummary,
  });

  factory StartProductSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return StartProductSubscriptionResponse(
      productUserSummary: ProductUserSummary.fromJson(
          (json['ProductUserSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final productUserSummary = this.productUserSummary;
    return {
      'ProductUserSummary': productUserSummary,
    };
  }
}

/// @nodoc
class StopProductSubscriptionResponse {
  /// Metadata that describes the start product subscription operation.
  final ProductUserSummary productUserSummary;

  StopProductSubscriptionResponse({
    required this.productUserSummary,
  });

  factory StopProductSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return StopProductSubscriptionResponse(
      productUserSummary: ProductUserSummary.fromJson(
          (json['ProductUserSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final productUserSummary = this.productUserSummary;
    return {
      'ProductUserSummary': productUserSummary,
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
class UpdateIdentityProviderSettingsResponse {
  final IdentityProviderSummary identityProviderSummary;

  UpdateIdentityProviderSettingsResponse({
    required this.identityProviderSummary,
  });

  factory UpdateIdentityProviderSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateIdentityProviderSettingsResponse(
      identityProviderSummary: IdentityProviderSummary.fromJson(
          (json['IdentityProviderSummary'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummary = this.identityProviderSummary;
    return {
      'IdentityProviderSummary': identityProviderSummary,
    };
  }
}

/// Describes an identity provider.
///
/// @nodoc
class IdentityProviderSummary {
  /// The <code>IdentityProvider</code> resource contains information about an
  /// identity provider.
  final IdentityProvider identityProvider;

  /// The name of the user-based subscription product.
  final String product;

  /// The <code>Settings</code> resource contains details about the registered
  /// identity provider’s product related configuration settings, such as the
  /// subnets to provision VPC endpoints.
  final Settings settings;

  /// The status of the identity provider.
  final String status;

  /// The failure message associated with an identity provider.
  final String? failureMessage;

  /// The Amazon Resource Name (ARN) of the identity provider.
  final String? identityProviderArn;

  /// The AWS Account ID of the owner of this resource.
  final String? ownerAccountId;

  IdentityProviderSummary({
    required this.identityProvider,
    required this.product,
    required this.settings,
    required this.status,
    this.failureMessage,
    this.identityProviderArn,
    this.ownerAccountId,
  });

  factory IdentityProviderSummary.fromJson(Map<String, dynamic> json) {
    return IdentityProviderSummary(
      identityProvider: IdentityProvider.fromJson(
          (json['IdentityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      product: (json['Product'] as String?) ?? '',
      settings: Settings.fromJson((json['Settings'] as Map<String, dynamic>?) ??
          const <String, dynamic>{}),
      status: (json['Status'] as String?) ?? '',
      failureMessage: json['FailureMessage'] as String?,
      identityProviderArn: json['IdentityProviderArn'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    final product = this.product;
    final settings = this.settings;
    final status = this.status;
    final failureMessage = this.failureMessage;
    final identityProviderArn = this.identityProviderArn;
    final ownerAccountId = this.ownerAccountId;
    return {
      'IdentityProvider': identityProvider,
      'Product': product,
      'Settings': settings,
      'Status': status,
      if (failureMessage != null) 'FailureMessage': failureMessage,
      if (identityProviderArn != null)
        'IdentityProviderArn': identityProviderArn,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
    };
  }
}

/// Refers to an identity provider.
///
/// @nodoc
class IdentityProvider {
  /// The <code>ActiveDirectoryIdentityProvider</code> resource contains settings
  /// and other details about a specific Active Directory identity provider.
  final ActiveDirectoryIdentityProvider? activeDirectoryIdentityProvider;

  IdentityProvider({
    this.activeDirectoryIdentityProvider,
  });

  factory IdentityProvider.fromJson(Map<String, dynamic> json) {
    return IdentityProvider(
      activeDirectoryIdentityProvider:
          json['ActiveDirectoryIdentityProvider'] != null
              ? ActiveDirectoryIdentityProvider.fromJson(
                  json['ActiveDirectoryIdentityProvider']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectoryIdentityProvider =
        this.activeDirectoryIdentityProvider;
    return {
      if (activeDirectoryIdentityProvider != null)
        'ActiveDirectoryIdentityProvider': activeDirectoryIdentityProvider,
    };
  }
}

/// The registered identity provider’s product related configuration settings
/// such as the subnets to provision VPC endpoints, and the security group ID
/// that is associated with the VPC endpoints. The security group should permit
/// inbound TCP port 1688 communication from resources in the VPC.
///
/// @nodoc
class Settings {
  /// A security group ID that allows inbound TCP port 1688 communication between
  /// resources in your VPC and the VPC endpoint for activation servers.
  final String securityGroupId;

  /// The subnets defined for the registered identity provider.
  final List<String> subnets;

  Settings({
    required this.securityGroupId,
    required this.subnets,
  });

  factory Settings.fromJson(Map<String, dynamic> json) {
    return Settings(
      securityGroupId: (json['SecurityGroupId'] as String?) ?? '',
      subnets: ((json['Subnets'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupId = this.securityGroupId;
    final subnets = this.subnets;
    return {
      'SecurityGroupId': securityGroupId,
      'Subnets': subnets,
    };
  }
}

/// Details about an Active Directory identity provider.
///
/// @nodoc
class ActiveDirectoryIdentityProvider {
  /// The <code>ActiveDirectorySettings</code> resource contains details about the
  /// Active Directory, including network access details such as domain name and
  /// IP addresses, and the credential provider for user administration.
  final ActiveDirectorySettings? activeDirectorySettings;

  /// The type of Active Directory – either a self-managed Active Directory or an
  /// Amazon Web Services Managed Active Directory.
  final ActiveDirectoryType? activeDirectoryType;

  /// The directory ID for an Active Directory identity provider.
  final String? directoryId;

  /// Whether this directory is shared from an Amazon Web Services Managed Active
  /// Directory. The default value is false.
  final bool? isSharedActiveDirectory;

  ActiveDirectoryIdentityProvider({
    this.activeDirectorySettings,
    this.activeDirectoryType,
    this.directoryId,
    this.isSharedActiveDirectory,
  });

  factory ActiveDirectoryIdentityProvider.fromJson(Map<String, dynamic> json) {
    return ActiveDirectoryIdentityProvider(
      activeDirectorySettings: json['ActiveDirectorySettings'] != null
          ? ActiveDirectorySettings.fromJson(
              json['ActiveDirectorySettings'] as Map<String, dynamic>)
          : null,
      activeDirectoryType: (json['ActiveDirectoryType'] as String?)
          ?.let(ActiveDirectoryType.fromString),
      directoryId: json['DirectoryId'] as String?,
      isSharedActiveDirectory: json['IsSharedActiveDirectory'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final activeDirectorySettings = this.activeDirectorySettings;
    final activeDirectoryType = this.activeDirectoryType;
    final directoryId = this.directoryId;
    final isSharedActiveDirectory = this.isSharedActiveDirectory;
    return {
      if (activeDirectorySettings != null)
        'ActiveDirectorySettings': activeDirectorySettings,
      if (activeDirectoryType != null)
        'ActiveDirectoryType': activeDirectoryType.value,
      if (directoryId != null) 'DirectoryId': directoryId,
      if (isSharedActiveDirectory != null)
        'IsSharedActiveDirectory': isSharedActiveDirectory,
    };
  }
}

/// Contains network access and credential details that are needed for user
/// administration in the Active Directory.
///
/// @nodoc
class ActiveDirectorySettings {
  /// Points to the <code>CredentialsProvider</code> resource that contains
  /// information about the credential provider for user administration.
  final CredentialsProvider? domainCredentialsProvider;

  /// A list of domain IPv4 addresses that are used for the Active Directory.
  final List<String>? domainIpv4List;

  /// A list of domain IPv6 addresses that are used for the Active Directory.
  final List<String>? domainIpv6List;

  /// The domain name for the Active Directory.
  final String? domainName;

  /// The <code>DomainNetworkSettings</code> resource contains an array of subnets
  /// that apply for the Active Directory.
  final DomainNetworkSettings? domainNetworkSettings;

  ActiveDirectorySettings({
    this.domainCredentialsProvider,
    this.domainIpv4List,
    this.domainIpv6List,
    this.domainName,
    this.domainNetworkSettings,
  });

  factory ActiveDirectorySettings.fromJson(Map<String, dynamic> json) {
    return ActiveDirectorySettings(
      domainCredentialsProvider: json['DomainCredentialsProvider'] != null
          ? CredentialsProvider.fromJson(
              json['DomainCredentialsProvider'] as Map<String, dynamic>)
          : null,
      domainIpv4List: (json['DomainIpv4List'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      domainIpv6List: (json['DomainIpv6List'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      domainName: json['DomainName'] as String?,
      domainNetworkSettings: json['DomainNetworkSettings'] != null
          ? DomainNetworkSettings.fromJson(
              json['DomainNetworkSettings'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final domainCredentialsProvider = this.domainCredentialsProvider;
    final domainIpv4List = this.domainIpv4List;
    final domainIpv6List = this.domainIpv6List;
    final domainName = this.domainName;
    final domainNetworkSettings = this.domainNetworkSettings;
    return {
      if (domainCredentialsProvider != null)
        'DomainCredentialsProvider': domainCredentialsProvider,
      if (domainIpv4List != null) 'DomainIpv4List': domainIpv4List,
      if (domainIpv6List != null) 'DomainIpv6List': domainIpv6List,
      if (domainName != null) 'DomainName': domainName,
      if (domainNetworkSettings != null)
        'DomainNetworkSettings': domainNetworkSettings,
    };
  }
}

/// @nodoc
class ActiveDirectoryType {
  static const selfManaged = ActiveDirectoryType._('SELF_MANAGED');
  static const awsManaged = ActiveDirectoryType._('AWS_MANAGED');

  final String value;

  const ActiveDirectoryType._(this.value);

  static const values = [selfManaged, awsManaged];

  static ActiveDirectoryType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ActiveDirectoryType._(value));

  @override
  bool operator ==(other) =>
      other is ActiveDirectoryType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Contains information about the credential provider for user administration.
///
/// @nodoc
class CredentialsProvider {
  /// Identifies the Secrets Manager secret that contains credentials needed for
  /// user administration in the Active Directory.
  final SecretsManagerCredentialsProvider? secretsManagerCredentialsProvider;

  CredentialsProvider({
    this.secretsManagerCredentialsProvider,
  });

  factory CredentialsProvider.fromJson(Map<String, dynamic> json) {
    return CredentialsProvider(
      secretsManagerCredentialsProvider:
          json['SecretsManagerCredentialsProvider'] != null
              ? SecretsManagerCredentialsProvider.fromJson(
                  json['SecretsManagerCredentialsProvider']
                      as Map<String, dynamic>)
              : null,
    );
  }

  Map<String, dynamic> toJson() {
    final secretsManagerCredentialsProvider =
        this.secretsManagerCredentialsProvider;
    return {
      if (secretsManagerCredentialsProvider != null)
        'SecretsManagerCredentialsProvider': secretsManagerCredentialsProvider,
    };
  }
}

/// Contains network settings for the Active Directory domain.
///
/// @nodoc
class DomainNetworkSettings {
  /// Contains a list of subnets that apply for the Active Directory domain.
  final List<String> subnets;

  DomainNetworkSettings({
    required this.subnets,
  });

  factory DomainNetworkSettings.fromJson(Map<String, dynamic> json) {
    return DomainNetworkSettings(
      subnets: ((json['Subnets'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    return {
      'Subnets': subnets,
    };
  }
}

/// Contains a credentials secret that's stored in Secrets Manager.
///
/// @nodoc
class SecretsManagerCredentialsProvider {
  /// The ID of the Secrets Manager secret that contains credentials.
  final String? secretId;

  SecretsManagerCredentialsProvider({
    this.secretId,
  });

  factory SecretsManagerCredentialsProvider.fromJson(
      Map<String, dynamic> json) {
    return SecretsManagerCredentialsProvider(
      secretId: json['SecretId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final secretId = this.secretId;
    return {
      if (secretId != null) 'SecretId': secretId,
    };
  }
}

/// Updates the registered identity provider’s product related configuration
/// settings such as the subnets to provision VPC endpoints.
///
/// @nodoc
class UpdateSettings {
  /// The ID of one or more subnets in which License Manager will create a VPC
  /// endpoint for products that require connectivity to activation servers.
  final List<String> addSubnets;

  /// The ID of one or more subnets to remove.
  final List<String> removeSubnets;

  /// A security group ID that allows inbound TCP port 1688 communication between
  /// resources in your VPC and the VPC endpoints for activation servers.
  final String? securityGroupId;

  UpdateSettings({
    required this.addSubnets,
    required this.removeSubnets,
    this.securityGroupId,
  });

  Map<String, dynamic> toJson() {
    final addSubnets = this.addSubnets;
    final removeSubnets = this.removeSubnets;
    final securityGroupId = this.securityGroupId;
    return {
      'AddSubnets': addSubnets,
      'RemoveSubnets': removeSubnets,
      if (securityGroupId != null) 'SecurityGroupId': securityGroupId,
    };
  }
}

/// A summary of the user-based subscription products for a specific user.
///
/// @nodoc
class ProductUserSummary {
  /// An object that specifies details for the identity provider.
  final IdentityProvider identityProvider;

  /// The name of the user-based subscription product.
  final String product;

  /// The status of a product for this user.
  final String status;

  /// The user name from the identity provider for this product user.
  final String username;

  /// The domain name of the Active Directory that contains the user information
  /// for the product subscription.
  final String? domain;

  /// The Amazon Resource Name (ARN) for this product user.
  final String? productUserArn;

  /// The status message for a product for this user.
  final String? statusMessage;

  /// The end date of a subscription.
  final String? subscriptionEndDate;

  /// The start date of a subscription.
  final String? subscriptionStartDate;

  ProductUserSummary({
    required this.identityProvider,
    required this.product,
    required this.status,
    required this.username,
    this.domain,
    this.productUserArn,
    this.statusMessage,
    this.subscriptionEndDate,
    this.subscriptionStartDate,
  });

  factory ProductUserSummary.fromJson(Map<String, dynamic> json) {
    return ProductUserSummary(
      identityProvider: IdentityProvider.fromJson(
          (json['IdentityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      product: (json['Product'] as String?) ?? '',
      status: (json['Status'] as String?) ?? '',
      username: (json['Username'] as String?) ?? '',
      domain: json['Domain'] as String?,
      productUserArn: json['ProductUserArn'] as String?,
      statusMessage: json['StatusMessage'] as String?,
      subscriptionEndDate: json['SubscriptionEndDate'] as String?,
      subscriptionStartDate: json['SubscriptionStartDate'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    final product = this.product;
    final status = this.status;
    final username = this.username;
    final domain = this.domain;
    final productUserArn = this.productUserArn;
    final statusMessage = this.statusMessage;
    final subscriptionEndDate = this.subscriptionEndDate;
    final subscriptionStartDate = this.subscriptionStartDate;
    return {
      'IdentityProvider': identityProvider,
      'Product': product,
      'Status': status,
      'Username': username,
      if (domain != null) 'Domain': domain,
      if (productUserArn != null) 'ProductUserArn': productUserArn,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (subscriptionEndDate != null)
        'SubscriptionEndDate': subscriptionEndDate,
      if (subscriptionStartDate != null)
        'SubscriptionStartDate': subscriptionStartDate,
    };
  }
}

/// Describes users of an EC2 instance providing user-based subscriptions.
///
/// @nodoc
class InstanceUserSummary {
  /// The <code>IdentityProvider</code> resource specifies details about the
  /// identity provider.
  final IdentityProvider identityProvider;

  /// The ID of the EC2 instance that provides user-based subscriptions.
  final String instanceId;

  /// The status of a user associated with an EC2 instance.
  final String status;

  /// The user name from the identity provider for the user.
  final String username;

  /// The date a user was associated with an EC2 instance.
  final String? associationDate;

  /// The date a user was disassociated from an EC2 instance.
  final String? disassociationDate;

  /// The domain name of the Active Directory that contains the user information
  /// for the product subscription.
  final String? domain;

  /// The Amazon Resource Name (ARN) that identifies the instance user.
  final String? instanceUserArn;

  /// The status message for users of an EC2 instance.
  final String? statusMessage;

  InstanceUserSummary({
    required this.identityProvider,
    required this.instanceId,
    required this.status,
    required this.username,
    this.associationDate,
    this.disassociationDate,
    this.domain,
    this.instanceUserArn,
    this.statusMessage,
  });

  factory InstanceUserSummary.fromJson(Map<String, dynamic> json) {
    return InstanceUserSummary(
      identityProvider: IdentityProvider.fromJson(
          (json['IdentityProvider'] as Map<String, dynamic>?) ??
              const <String, dynamic>{}),
      instanceId: (json['InstanceId'] as String?) ?? '',
      status: (json['Status'] as String?) ?? '',
      username: (json['Username'] as String?) ?? '',
      associationDate: json['AssociationDate'] as String?,
      disassociationDate: json['DisassociationDate'] as String?,
      domain: json['Domain'] as String?,
      instanceUserArn: json['InstanceUserArn'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    final instanceId = this.instanceId;
    final status = this.status;
    final username = this.username;
    final associationDate = this.associationDate;
    final disassociationDate = this.disassociationDate;
    final domain = this.domain;
    final instanceUserArn = this.instanceUserArn;
    final statusMessage = this.statusMessage;
    return {
      'IdentityProvider': identityProvider,
      'InstanceId': instanceId,
      'Status': status,
      'Username': username,
      if (associationDate != null) 'AssociationDate': associationDate,
      if (disassociationDate != null) 'DisassociationDate': disassociationDate,
      if (domain != null) 'Domain': domain,
      if (instanceUserArn != null) 'InstanceUserArn': instanceUserArn,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// A filter name and value pair that is used to return more specific results
/// from a describe or list operation. You can use filters can be used to match
/// a set of resources by specific criteria, such as tags, attributes, or IDs.
///
/// @nodoc
class Filter {
  /// The name of an attribute to use as a filter.
  final String? attribute;

  /// The type of search (For example, eq, geq, leq)
  final String? operation;

  /// Value of the filter.
  final String? value;

  Filter({
    this.attribute,
    this.operation,
    this.value,
  });

  Map<String, dynamic> toJson() {
    final attribute = this.attribute;
    final operation = this.operation;
    final value = this.value;
    return {
      if (attribute != null) 'Attribute': attribute,
      if (operation != null) 'Operation': operation,
      if (value != null) 'Value': value,
    };
  }
}

/// Contains details about a network endpoint for a Remote Desktop Services
/// (RDS) license server.
///
/// @nodoc
class LicenseServerEndpoint {
  /// The timestamp when License Manager created the license server endpoint.
  final DateTime? creationTime;

  /// The Amazon Resource Name (ARN) of the identity provider that's associated
  /// with the RDS license server endpoint.
  final String? identityProviderArn;

  /// The ARN of the <code>ServerEndpoint</code> resource for the RDS license
  /// server.
  final String? licenseServerEndpointArn;

  /// The ID of the license server endpoint.
  final String? licenseServerEndpointId;

  /// The current state of the provisioning process for the RDS license server
  /// endpoint
  final LicenseServerEndpointProvisioningStatus?
      licenseServerEndpointProvisioningStatus;

  /// An array of <code>LicenseServer</code> resources that represent the license
  /// servers that are accessed through this endpoint.
  final List<LicenseServer>? licenseServers;

  /// The <code>ServerEndpoint</code> resource contains the network address of the
  /// RDS license server endpoint.
  final ServerEndpoint? serverEndpoint;

  /// The type of license server.
  final ServerType? serverType;

  /// The message associated with the provisioning status, if there is one.
  final String? statusMessage;

  LicenseServerEndpoint({
    this.creationTime,
    this.identityProviderArn,
    this.licenseServerEndpointArn,
    this.licenseServerEndpointId,
    this.licenseServerEndpointProvisioningStatus,
    this.licenseServers,
    this.serverEndpoint,
    this.serverType,
    this.statusMessage,
  });

  factory LicenseServerEndpoint.fromJson(Map<String, dynamic> json) {
    return LicenseServerEndpoint(
      creationTime: timeStampFromJson(json['CreationTime']),
      identityProviderArn: json['IdentityProviderArn'] as String?,
      licenseServerEndpointArn: json['LicenseServerEndpointArn'] as String?,
      licenseServerEndpointId: json['LicenseServerEndpointId'] as String?,
      licenseServerEndpointProvisioningStatus:
          (json['LicenseServerEndpointProvisioningStatus'] as String?)
              ?.let(LicenseServerEndpointProvisioningStatus.fromString),
      licenseServers: (json['LicenseServers'] as List?)
          ?.nonNulls
          .map((e) => LicenseServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverEndpoint: json['ServerEndpoint'] != null
          ? ServerEndpoint.fromJson(
              json['ServerEndpoint'] as Map<String, dynamic>)
          : null,
      serverType: (json['ServerType'] as String?)?.let(ServerType.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final identityProviderArn = this.identityProviderArn;
    final licenseServerEndpointArn = this.licenseServerEndpointArn;
    final licenseServerEndpointId = this.licenseServerEndpointId;
    final licenseServerEndpointProvisioningStatus =
        this.licenseServerEndpointProvisioningStatus;
    final licenseServers = this.licenseServers;
    final serverEndpoint = this.serverEndpoint;
    final serverType = this.serverType;
    final statusMessage = this.statusMessage;
    return {
      if (creationTime != null)
        'CreationTime': unixTimestampToJson(creationTime),
      if (identityProviderArn != null)
        'IdentityProviderArn': identityProviderArn,
      if (licenseServerEndpointArn != null)
        'LicenseServerEndpointArn': licenseServerEndpointArn,
      if (licenseServerEndpointId != null)
        'LicenseServerEndpointId': licenseServerEndpointId,
      if (licenseServerEndpointProvisioningStatus != null)
        'LicenseServerEndpointProvisioningStatus':
            licenseServerEndpointProvisioningStatus.value,
      if (licenseServers != null) 'LicenseServers': licenseServers,
      if (serverEndpoint != null) 'ServerEndpoint': serverEndpoint,
      if (serverType != null) 'ServerType': serverType.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// @nodoc
class ServerType {
  static const rdsSal = ServerType._('RDS_SAL');

  final String value;

  const ServerType._(this.value);

  static const values = [rdsSal];

  static ServerType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => ServerType._(value));

  @override
  bool operator ==(other) => other is ServerType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A network endpoint through which you can access one or more servers.
///
/// @nodoc
class ServerEndpoint {
  /// The network address of the endpoint.
  final String? endpoint;

  ServerEndpoint({
    this.endpoint,
  });

  factory ServerEndpoint.fromJson(Map<String, dynamic> json) {
    return ServerEndpoint(
      endpoint: json['Endpoint'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endpoint = this.endpoint;
    return {
      if (endpoint != null) 'Endpoint': endpoint,
    };
  }
}

/// @nodoc
class LicenseServerEndpointProvisioningStatus {
  static const provisioning =
      LicenseServerEndpointProvisioningStatus._('PROVISIONING');
  static const provisioningFailed =
      LicenseServerEndpointProvisioningStatus._('PROVISIONING_FAILED');
  static const provisioned =
      LicenseServerEndpointProvisioningStatus._('PROVISIONED');
  static const deleting = LicenseServerEndpointProvisioningStatus._('DELETING');
  static const deletionFailed =
      LicenseServerEndpointProvisioningStatus._('DELETION_FAILED');
  static const deleted = LicenseServerEndpointProvisioningStatus._('DELETED');

  final String value;

  const LicenseServerEndpointProvisioningStatus._(this.value);

  static const values = [
    provisioning,
    provisioningFailed,
    provisioned,
    deleting,
    deletionFailed,
    deleted
  ];

  static LicenseServerEndpointProvisioningStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LicenseServerEndpointProvisioningStatus._(value));

  @override
  bool operator ==(other) =>
      other is LicenseServerEndpointProvisioningStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Information about a Remote Desktop Services (RDS) license server.
///
/// @nodoc
class LicenseServer {
  /// The health status of the RDS license server.
  final LicenseServerHealthStatus? healthStatus;

  /// A list of domain IPv4 addresses that are used for the RDS license server.
  final String? ipv4Address;

  /// A list of domain IPv6 addresses that are used for the RDS license server.
  final String? ipv6Address;

  /// The current state of the provisioning process for the RDS license server.
  final LicenseServerEndpointProvisioningStatus? provisioningStatus;

  LicenseServer({
    this.healthStatus,
    this.ipv4Address,
    this.ipv6Address,
    this.provisioningStatus,
  });

  factory LicenseServer.fromJson(Map<String, dynamic> json) {
    return LicenseServer(
      healthStatus: (json['HealthStatus'] as String?)
          ?.let(LicenseServerHealthStatus.fromString),
      ipv4Address: json['Ipv4Address'] as String?,
      ipv6Address: json['Ipv6Address'] as String?,
      provisioningStatus: (json['ProvisioningStatus'] as String?)
          ?.let(LicenseServerEndpointProvisioningStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final healthStatus = this.healthStatus;
    final ipv4Address = this.ipv4Address;
    final ipv6Address = this.ipv6Address;
    final provisioningStatus = this.provisioningStatus;
    return {
      if (healthStatus != null) 'HealthStatus': healthStatus.value,
      if (ipv4Address != null) 'Ipv4Address': ipv4Address,
      if (ipv6Address != null) 'Ipv6Address': ipv6Address,
      if (provisioningStatus != null)
        'ProvisioningStatus': provisioningStatus.value,
    };
  }
}

/// @nodoc
class LicenseServerHealthStatus {
  static const healthy = LicenseServerHealthStatus._('HEALTHY');
  static const unhealthy = LicenseServerHealthStatus._('UNHEALTHY');
  static const notApplicable = LicenseServerHealthStatus._('NOT_APPLICABLE');

  final String value;

  const LicenseServerHealthStatus._(this.value);

  static const values = [healthy, unhealthy, notApplicable];

  static LicenseServerHealthStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => LicenseServerHealthStatus._(value));

  @override
  bool operator ==(other) =>
      other is LicenseServerHealthStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Describes an EC2 instance providing user-based subscriptions.
///
/// @nodoc
class InstanceSummary {
  /// The ID of the EC2 instance, which provides user-based subscriptions.
  final String instanceId;

  /// A list of provided user-based subscription products.
  final List<String> products;

  /// The status of an EC2 instance resource.
  final String status;

  /// The <code>IdentityProvider</code> resource specifies details about the
  /// identity provider.
  final IdentityProvider? identityProvider;

  /// The date of the last status check.
  final String? lastStatusCheckDate;

  /// The AWS Account ID of the owner of this resource.
  final String? ownerAccountId;

  /// The status message for an EC2 instance.
  final String? statusMessage;

  InstanceSummary({
    required this.instanceId,
    required this.products,
    required this.status,
    this.identityProvider,
    this.lastStatusCheckDate,
    this.ownerAccountId,
    this.statusMessage,
  });

  factory InstanceSummary.fromJson(Map<String, dynamic> json) {
    return InstanceSummary(
      instanceId: (json['InstanceId'] as String?) ?? '',
      products: ((json['Products'] as List?) ?? const [])
          .nonNulls
          .map((e) => e as String)
          .toList(),
      status: (json['Status'] as String?) ?? '',
      identityProvider: json['IdentityProvider'] != null
          ? IdentityProvider.fromJson(
              json['IdentityProvider'] as Map<String, dynamic>)
          : null,
      lastStatusCheckDate: json['LastStatusCheckDate'] as String?,
      ownerAccountId: json['OwnerAccountId'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final products = this.products;
    final status = this.status;
    final identityProvider = this.identityProvider;
    final lastStatusCheckDate = this.lastStatusCheckDate;
    final ownerAccountId = this.ownerAccountId;
    final statusMessage = this.statusMessage;
    return {
      'InstanceId': instanceId,
      'Products': products,
      'Status': status,
      if (identityProvider != null) 'IdentityProvider': identityProvider,
      if (lastStatusCheckDate != null)
        'LastStatusCheckDate': lastStatusCheckDate,
      if (ownerAccountId != null) 'OwnerAccountId': ownerAccountId,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// The settings to configure your license server.
///
/// @nodoc
class LicenseServerSettings {
  /// The <code>ServerSettings</code> resource contains the settings for your
  /// server.
  final ServerSettings serverSettings;

  /// The type of license server.
  final ServerType serverType;

  LicenseServerSettings({
    required this.serverSettings,
    required this.serverType,
  });

  Map<String, dynamic> toJson() {
    final serverSettings = this.serverSettings;
    final serverType = this.serverType;
    return {
      'ServerSettings': serverSettings,
      'ServerType': serverType.value,
    };
  }
}

/// Contains settings for a specific server.
///
/// @nodoc
class ServerSettings {
  /// The <code>RdsSalSettings</code> resource contains settings to configure a
  /// specific Remote Desktop Services (RDS) license server.
  final RdsSalSettings? rdsSalSettings;

  ServerSettings({
    this.rdsSalSettings,
  });

  Map<String, dynamic> toJson() {
    final rdsSalSettings = this.rdsSalSettings;
    return {
      if (rdsSalSettings != null) 'RdsSalSettings': rdsSalSettings,
    };
  }
}

/// Server settings that are specific to a Remote Desktop Services (RDS) license
/// server.
///
/// @nodoc
class RdsSalSettings {
  /// The <code>CredentialsProvider</code> resource contains a reference to the
  /// credentials provider that's used for RDS license server user administration.
  final CredentialsProvider rdsSalCredentialsProvider;

  RdsSalSettings({
    required this.rdsSalCredentialsProvider,
  });

  Map<String, dynamic> toJson() {
    final rdsSalCredentialsProvider = this.rdsSalCredentialsProvider;
    return {
      'RdsSalCredentialsProvider': rdsSalCredentialsProvider,
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
