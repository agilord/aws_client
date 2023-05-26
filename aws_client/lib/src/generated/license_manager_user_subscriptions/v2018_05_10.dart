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
            signingName: 'license-manager-user-subscriptions',
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// The identity provider of the user.
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance, which provides user-based subscriptions.
  ///
  /// Parameter [username] :
  /// The user name from the identity provider for the user.
  ///
  /// Parameter [domain] :
  /// The domain name of the user.
  Future<AssociateUserResponse> associateUser({
    required IdentityProvider identityProvider,
    required String instanceId,
    required String username,
    String? domain,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'InstanceId': instanceId,
      'Username': username,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/AssociateUser',
      exceptionFnMap: _exceptionFns,
    );
    return AssociateUserResponse.fromJson(response);
  }

  /// Deregisters the identity provider from providing user-based subscriptions.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  Future<DeregisterIdentityProviderResponse> deregisterIdentityProvider({
    required IdentityProvider identityProvider,
    required String product,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance, which provides user-based subscriptions.
  ///
  /// Parameter [username] :
  /// The user name from the identity provider for the user.
  ///
  /// Parameter [domain] :
  /// The domain name of the user.
  Future<DisassociateUserResponse> disassociateUser({
    required IdentityProvider identityProvider,
    required String instanceId,
    required String username,
    String? domain,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'InstanceId': instanceId,
      'Username': username,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/DisassociateUser',
      exceptionFnMap: _exceptionFns,
    );
    return DisassociateUserResponse.fromJson(response);
  }

  /// Lists the identity providers for user-based subscriptions.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListIdentityProvidersResponse> listIdentityProviders({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
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

  /// Lists the user-based subscription products available from an identity
  /// provider.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
  Future<ListProductSubscriptionsResponse> listProductSubscriptions({
    required IdentityProvider identityProvider,
    required String product,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/ListProductSubscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListProductSubscriptionsResponse.fromJson(response);
  }

  /// Lists user associations for an identity provider.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [instanceId] :
  /// The ID of the EC2 instance, which provides user-based subscriptions.
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Parameter [settings] :
  /// The registered identity provider’s product related configuration settings
  /// such as the subnets to provision VPC endpoints.
  Future<RegisterIdentityProviderResponse> registerIdentityProvider({
    required IdentityProvider identityProvider,
    required String product,
    Settings? settings,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      if (settings != null) 'Settings': settings,
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Parameter [username] :
  /// The user name from the identity provider of the user.
  ///
  /// Parameter [domain] :
  /// The domain name of the user.
  Future<StartProductSubscriptionResponse> startProductSubscription({
    required IdentityProvider identityProvider,
    required String product,
    required String username,
    String? domain,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      'Username': username,
      if (domain != null) 'Domain': domain,
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
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [identityProvider] :
  /// An object that specifies details for the identity provider.
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
  ///
  /// Parameter [username] :
  /// The user name from the identity provider for the user.
  ///
  /// Parameter [domain] :
  /// The domain name of the user.
  Future<StopProductSubscriptionResponse> stopProductSubscription({
    required IdentityProvider identityProvider,
    required String product,
    required String username,
    String? domain,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      'Username': username,
      if (domain != null) 'Domain': domain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/user/StopProductSubscription',
      exceptionFnMap: _exceptionFns,
    );
    return StopProductSubscriptionResponse.fromJson(response);
  }

  /// Updates additional product configuration settings for the registered
  /// identity provider.
  ///
  /// May throw [ValidationException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [product] :
  /// The name of the user-based subscription product.
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
  Future<UpdateIdentityProviderSettingsResponse>
      updateIdentityProviderSettings({
    required IdentityProvider identityProvider,
    required String product,
    required UpdateSettings updateSettings,
  }) async {
    final $payload = <String, dynamic>{
      'IdentityProvider': identityProvider,
      'Product': product,
      'UpdateSettings': updateSettings,
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

/// Details about an Active Directory identity provider.
class ActiveDirectoryIdentityProvider {
  /// The directory ID for an Active Directory identity provider.
  final String? directoryId;

  ActiveDirectoryIdentityProvider({
    this.directoryId,
  });

  factory ActiveDirectoryIdentityProvider.fromJson(Map<String, dynamic> json) {
    return ActiveDirectoryIdentityProvider(
      directoryId: json['DirectoryId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final directoryId = this.directoryId;
    return {
      if (directoryId != null) 'DirectoryId': directoryId,
    };
  }
}

class AssociateUserResponse {
  /// Metadata that describes the associate user operation.
  final InstanceUserSummary instanceUserSummary;

  AssociateUserResponse({
    required this.instanceUserSummary,
  });

  factory AssociateUserResponse.fromJson(Map<String, dynamic> json) {
    return AssociateUserResponse(
      instanceUserSummary: InstanceUserSummary.fromJson(
          json['InstanceUserSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUserSummary = this.instanceUserSummary;
    return {
      'InstanceUserSummary': instanceUserSummary,
    };
  }
}

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
          json['IdentityProviderSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummary = this.identityProviderSummary;
    return {
      'IdentityProviderSummary': identityProviderSummary,
    };
  }
}

class DisassociateUserResponse {
  /// Metadata that describes the associate user operation.
  final InstanceUserSummary instanceUserSummary;

  DisassociateUserResponse({
    required this.instanceUserSummary,
  });

  factory DisassociateUserResponse.fromJson(Map<String, dynamic> json) {
    return DisassociateUserResponse(
      instanceUserSummary: InstanceUserSummary.fromJson(
          json['InstanceUserSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceUserSummary = this.instanceUserSummary;
    return {
      'InstanceUserSummary': instanceUserSummary,
    };
  }
}

/// A filter name and value pair that is used to return more specific results
/// from a describe operation. Filters can be used to match a set of resources
/// by specific criteria, such as tags, attributes, or IDs.
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

/// Details about an identity provider.
class IdentityProvider {
  /// An object that details an Active Directory identity provider.
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

/// Describes an identity provider.
class IdentityProviderSummary {
  /// An object that specifies details for the identity provider.
  final IdentityProvider identityProvider;

  /// The name of the user-based subscription product.
  final String product;

  /// An object that details the registered identity provider’s product related
  /// configuration settings such as the subnets to provision VPC endpoints.
  final Settings settings;

  /// The status of an identity provider.
  final String status;

  /// The failure message associated with an identity provider.
  final String? failureMessage;

  IdentityProviderSummary({
    required this.identityProvider,
    required this.product,
    required this.settings,
    required this.status,
    this.failureMessage,
  });

  factory IdentityProviderSummary.fromJson(Map<String, dynamic> json) {
    return IdentityProviderSummary(
      identityProvider: IdentityProvider.fromJson(
          json['IdentityProvider'] as Map<String, dynamic>),
      product: json['Product'] as String,
      settings: Settings.fromJson(json['Settings'] as Map<String, dynamic>),
      status: json['Status'] as String,
      failureMessage: json['FailureMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final identityProvider = this.identityProvider;
    final product = this.product;
    final settings = this.settings;
    final status = this.status;
    final failureMessage = this.failureMessage;
    return {
      'IdentityProvider': identityProvider,
      'Product': product,
      'Settings': settings,
      'Status': status,
      if (failureMessage != null) 'FailureMessage': failureMessage,
    };
  }
}

/// Describes an EC2 instance providing user-based subscriptions.
class InstanceSummary {
  /// The ID of the EC2 instance, which provides user-based subscriptions.
  final String instanceId;

  /// A list of provided user-based subscription products.
  final List<String> products;

  /// The status of an EC2 instance resource.
  final String status;

  /// The date of the last status check.
  final String? lastStatusCheckDate;

  /// The status message for an EC2 instance.
  final String? statusMessage;

  InstanceSummary({
    required this.instanceId,
    required this.products,
    required this.status,
    this.lastStatusCheckDate,
    this.statusMessage,
  });

  factory InstanceSummary.fromJson(Map<String, dynamic> json) {
    return InstanceSummary(
      instanceId: json['InstanceId'] as String,
      products: (json['Products'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: json['Status'] as String,
      lastStatusCheckDate: json['LastStatusCheckDate'] as String?,
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceId = this.instanceId;
    final products = this.products;
    final status = this.status;
    final lastStatusCheckDate = this.lastStatusCheckDate;
    final statusMessage = this.statusMessage;
    return {
      'InstanceId': instanceId,
      'Products': products,
      'Status': status,
      if (lastStatusCheckDate != null)
        'LastStatusCheckDate': lastStatusCheckDate,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Describes users of an EC2 instance providing user-based subscriptions.
class InstanceUserSummary {
  /// An object that specifies details for the identity provider.
  final IdentityProvider identityProvider;

  /// The ID of the EC2 instance, which provides user-based subscriptions.
  final String instanceId;

  /// The status of a user associated with an EC2 instance.
  final String status;

  /// The user name from the identity provider for the user.
  final String username;

  /// The date a user was associated with an EC2 instance.
  final String? associationDate;

  /// The date a user was disassociated from an EC2 instance.
  final String? disassociationDate;

  /// The domain name of the user.
  final String? domain;

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
    this.statusMessage,
  });

  factory InstanceUserSummary.fromJson(Map<String, dynamic> json) {
    return InstanceUserSummary(
      identityProvider: IdentityProvider.fromJson(
          json['IdentityProvider'] as Map<String, dynamic>),
      instanceId: json['InstanceId'] as String,
      status: json['Status'] as String,
      username: json['Username'] as String,
      associationDate: json['AssociationDate'] as String?,
      disassociationDate: json['DisassociationDate'] as String?,
      domain: json['Domain'] as String?,
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
    final statusMessage = this.statusMessage;
    return {
      'IdentityProvider': identityProvider,
      'InstanceId': instanceId,
      'Status': status,
      'Username': username,
      if (associationDate != null) 'AssociationDate': associationDate,
      if (disassociationDate != null) 'DisassociationDate': disassociationDate,
      if (domain != null) 'Domain': domain,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class ListIdentityProvidersResponse {
  /// Metadata that describes the list identity providers operation.
  final List<IdentityProviderSummary> identityProviderSummaries;

  /// Token for the next set of results.
  final String? nextToken;

  ListIdentityProvidersResponse({
    required this.identityProviderSummaries,
    this.nextToken,
  });

  factory ListIdentityProvidersResponse.fromJson(Map<String, dynamic> json) {
    return ListIdentityProvidersResponse(
      identityProviderSummaries: (json['IdentityProviderSummaries'] as List)
          .whereNotNull()
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

class ListInstancesResponse {
  /// Metadata that describes the list instances operation.
  final List<InstanceSummary>? instanceSummaries;

  /// Token for the next set of results.
  final String? nextToken;

  ListInstancesResponse({
    this.instanceSummaries,
    this.nextToken,
  });

  factory ListInstancesResponse.fromJson(Map<String, dynamic> json) {
    return ListInstancesResponse(
      instanceSummaries: (json['InstanceSummaries'] as List?)
          ?.whereNotNull()
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

class ListProductSubscriptionsResponse {
  /// Token for the next set of results.
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
          ?.whereNotNull()
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

class ListUserAssociationsResponse {
  /// Metadata that describes the list user association operation.
  final List<InstanceUserSummary>? instanceUserSummaries;

  /// Token for the next set of results.
  final String? nextToken;

  ListUserAssociationsResponse({
    this.instanceUserSummaries,
    this.nextToken,
  });

  factory ListUserAssociationsResponse.fromJson(Map<String, dynamic> json) {
    return ListUserAssociationsResponse(
      instanceUserSummaries: (json['InstanceUserSummaries'] as List?)
          ?.whereNotNull()
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

/// The summary of the user-based subscription products for a user.
class ProductUserSummary {
  /// An object that specifies details for the identity provider.
  final IdentityProvider identityProvider;

  /// The name of the user-based subscription product.
  final String product;

  /// The status of a product for a user.
  final String status;

  /// The user name from the identity provider of the user.
  final String username;

  /// The domain name of the user.
  final String? domain;

  /// The status message for a product for a user.
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
    this.statusMessage,
    this.subscriptionEndDate,
    this.subscriptionStartDate,
  });

  factory ProductUserSummary.fromJson(Map<String, dynamic> json) {
    return ProductUserSummary(
      identityProvider: IdentityProvider.fromJson(
          json['IdentityProvider'] as Map<String, dynamic>),
      product: json['Product'] as String,
      status: json['Status'] as String,
      username: json['Username'] as String,
      domain: json['Domain'] as String?,
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
    final statusMessage = this.statusMessage;
    final subscriptionEndDate = this.subscriptionEndDate;
    final subscriptionStartDate = this.subscriptionStartDate;
    return {
      'IdentityProvider': identityProvider,
      'Product': product,
      'Status': status,
      'Username': username,
      if (domain != null) 'Domain': domain,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (subscriptionEndDate != null)
        'SubscriptionEndDate': subscriptionEndDate,
      if (subscriptionStartDate != null)
        'SubscriptionStartDate': subscriptionStartDate,
    };
  }
}

class RegisterIdentityProviderResponse {
  /// Metadata that describes the results of an identity provider operation.
  final IdentityProviderSummary identityProviderSummary;

  RegisterIdentityProviderResponse({
    required this.identityProviderSummary,
  });

  factory RegisterIdentityProviderResponse.fromJson(Map<String, dynamic> json) {
    return RegisterIdentityProviderResponse(
      identityProviderSummary: IdentityProviderSummary.fromJson(
          json['IdentityProviderSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummary = this.identityProviderSummary;
    return {
      'IdentityProviderSummary': identityProviderSummary,
    };
  }
}

/// The registered identity provider’s product related configuration settings
/// such as the subnets to provision VPC endpoints, and the security group ID
/// that is associated with the VPC endpoints. The security group should permit
/// inbound TCP port 1688 communication from resources in the VPC.
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
      securityGroupId: json['SecurityGroupId'] as String,
      subnets: (json['Subnets'] as List)
          .whereNotNull()
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

class StartProductSubscriptionResponse {
  /// Metadata that describes the start product subscription operation.
  final ProductUserSummary productUserSummary;

  StartProductSubscriptionResponse({
    required this.productUserSummary,
  });

  factory StartProductSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return StartProductSubscriptionResponse(
      productUserSummary: ProductUserSummary.fromJson(
          json['ProductUserSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final productUserSummary = this.productUserSummary;
    return {
      'ProductUserSummary': productUserSummary,
    };
  }
}

class StopProductSubscriptionResponse {
  /// Metadata that describes the start product subscription operation.
  final ProductUserSummary productUserSummary;

  StopProductSubscriptionResponse({
    required this.productUserSummary,
  });

  factory StopProductSubscriptionResponse.fromJson(Map<String, dynamic> json) {
    return StopProductSubscriptionResponse(
      productUserSummary: ProductUserSummary.fromJson(
          json['ProductUserSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final productUserSummary = this.productUserSummary;
    return {
      'ProductUserSummary': productUserSummary,
    };
  }
}

class UpdateIdentityProviderSettingsResponse {
  final IdentityProviderSummary identityProviderSummary;

  UpdateIdentityProviderSettingsResponse({
    required this.identityProviderSummary,
  });

  factory UpdateIdentityProviderSettingsResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateIdentityProviderSettingsResponse(
      identityProviderSummary: IdentityProviderSummary.fromJson(
          json['IdentityProviderSummary'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final identityProviderSummary = this.identityProviderSummary;
    return {
      'IdentityProviderSummary': identityProviderSummary,
    };
  }
}

/// Updates the registered identity provider’s product related configuration
/// settings such as the subnets to provision VPC endpoints.
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
