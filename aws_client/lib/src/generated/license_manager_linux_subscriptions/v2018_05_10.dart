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

/// With License Manager, you can discover and track your commercial Linux
/// subscriptions on running Amazon EC2 instances.
class LicenseManagerLinuxSubscriptions {
  final _s.RestJsonProtocol _protocol;
  LicenseManagerLinuxSubscriptions({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'license-manager-linux-subscriptions',
            signingName: 'license-manager-linux-subscriptions',
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

  /// Remove a third-party subscription provider from the Bring Your Own License
  /// (BYOL) subscriptions registered to your account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [subscriptionProviderArn] :
  /// The Amazon Resource Name (ARN) of the subscription provider resource to
  /// deregister.
  Future<void> deregisterSubscriptionProvider({
    required String subscriptionProviderArn,
  }) async {
    final $payload = <String, dynamic>{
      'SubscriptionProviderArn': subscriptionProviderArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/subscription/DeregisterSubscriptionProvider',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get details for a Bring Your Own License (BYOL) subscription that's
  /// registered to your account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [subscriptionProviderArn] :
  /// The Amazon Resource Name (ARN) of the BYOL registration resource to get
  /// details for.
  Future<GetRegisteredSubscriptionProviderResponse>
      getRegisteredSubscriptionProvider({
    required String subscriptionProviderArn,
  }) async {
    final $payload = <String, dynamic>{
      'SubscriptionProviderArn': subscriptionProviderArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/subscription/GetRegisteredSubscriptionProvider',
      exceptionFnMap: _exceptionFns,
    );
    return GetRegisteredSubscriptionProviderResponse.fromJson(response);
  }

  /// Lists the Linux subscriptions service settings for your account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  Future<GetServiceSettingsResponse> getServiceSettings() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/subscription/GetServiceSettings',
      exceptionFnMap: _exceptionFns,
    );
    return GetServiceSettingsResponse.fromJson(response);
  }

  /// Lists the running Amazon EC2 instances that were discovered with
  /// commercial Linux subscriptions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results by your
  /// specified criteria. For example, you can specify <code>Region</code> in
  /// the <code>Name</code>, with the <code>contains</code> operator to list all
  /// subscriptions that match a partial string in the <code>Value</code>, such
  /// as <code>us-west</code>.
  ///
  /// For each filter, you can specify one of the following values for the
  /// <code>Name</code> key to streamline results:
  ///
  /// <ul>
  /// <li>
  /// <code>AccountID</code>
  /// </li>
  /// <li>
  /// <code>AmiID</code>
  /// </li>
  /// <li>
  /// <code>DualSubscription</code>
  /// </li>
  /// <li>
  /// <code>InstanceID</code>
  /// </li>
  /// <li>
  /// <code>InstanceType</code>
  /// </li>
  /// <li>
  /// <code>ProductCode</code>
  /// </li>
  /// <li>
  /// <code>Region</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>UsageOperation</code>
  /// </li>
  /// </ul>
  /// For each filter, you can use one of the following <code>Operator</code>
  /// values to define the behavior of the filter:
  ///
  /// <ul>
  /// <li>
  /// <code>contains</code>
  /// </li>
  /// <li>
  /// <code>equals</code>
  /// </li>
  /// <li>
  /// <code>Notequal</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListLinuxSubscriptionInstancesResponse>
      listLinuxSubscriptionInstances({
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
      requestUri: '/subscription/ListLinuxSubscriptionInstances',
      exceptionFnMap: _exceptionFns,
    );
    return ListLinuxSubscriptionInstancesResponse.fromJson(response);
  }

  /// Lists the Linux subscriptions that have been discovered. If you have
  /// linked your organization, the returned results will include data
  /// aggregated across your accounts in Organizations.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify. For
  /// example, you can filter by the name of <code>Subscription</code> with an
  /// optional operator to see subscriptions that match, partially match, or
  /// don't match a certain subscription's name.
  ///
  /// The valid names for this filter are:
  ///
  /// <ul>
  /// <li>
  /// <code>Subscription</code>
  /// </li>
  /// </ul>
  /// The valid Operators for this filter are:
  ///
  /// <ul>
  /// <li>
  /// <code>contains</code>
  /// </li>
  /// <li>
  /// <code>equals</code>
  /// </li>
  /// <li>
  /// <code>Notequal</code>
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  Future<ListLinuxSubscriptionsResponse> listLinuxSubscriptions({
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
      requestUri: '/subscription/ListLinuxSubscriptions',
      exceptionFnMap: _exceptionFns,
    );
    return ListLinuxSubscriptionsResponse.fromJson(response);
  }

  /// List Bring Your Own License (BYOL) subscription registration resources for
  /// your account.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum items to return in a request.
  ///
  /// Parameter [nextToken] :
  /// A token to specify where to start paginating. This is the nextToken from a
  /// previously truncated response.
  ///
  /// Parameter [subscriptionProviderSources] :
  /// To filter your results, specify which subscription providers to return in
  /// the list.
  Future<ListRegisteredSubscriptionProvidersResponse>
      listRegisteredSubscriptionProviders({
    int? maxResults,
    String? nextToken,
    List<SubscriptionProviderSource>? subscriptionProviderSources,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
      if (subscriptionProviderSources != null)
        'SubscriptionProviderSources':
            subscriptionProviderSources.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/subscription/ListRegisteredSubscriptionProviders',
      exceptionFnMap: _exceptionFns,
    );
    return ListRegisteredSubscriptionProvidersResponse.fromJson(response);
  }

  /// List the metadata tags that are assigned to the specified Amazon Web
  /// Services resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource for which to list metadata
  /// tags.
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

  /// Register the supported third-party subscription provider for your Bring
  /// Your Own License (BYOL) subscription.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [secretArn] :
  /// The Amazon Resource Name (ARN) of the secret where you've stored your
  /// subscription provider's access token. For RHEL subscriptions managed
  /// through the Red Hat Subscription Manager (RHSM), the secret contains your
  /// Red Hat Offline token.
  ///
  /// Parameter [subscriptionProviderSource] :
  /// The supported Linux subscription provider to register.
  ///
  /// Parameter [tags] :
  /// The metadata tags to assign to your registered Linux subscription provider
  /// resource.
  Future<RegisterSubscriptionProviderResponse> registerSubscriptionProvider({
    required String secretArn,
    required SubscriptionProviderSource subscriptionProviderSource,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'SecretArn': secretArn,
      'SubscriptionProviderSource': subscriptionProviderSource.value,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/subscription/RegisterSubscriptionProvider',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterSubscriptionProviderResponse.fromJson(response);
  }

  /// Add metadata tags to the specified Amazon Web Services resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services resource to
  /// which to add the specified metadata tags.
  ///
  /// Parameter [tags] :
  /// The metadata tags to assign to the Amazon Web Services resource. Tags are
  /// formatted as key value pairs.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove one or more metadata tag from the specified Amazon Web Services
  /// resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the Amazon Web Services resource to
  /// remove the metadata tags from.
  ///
  /// Parameter [tagKeys] :
  /// A list of metadata tag keys to remove from the requested resource.
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

  /// Updates the service settings for Linux subscriptions.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [linuxSubscriptionsDiscovery] :
  /// Describes if the discovery of Linux subscriptions is enabled.
  ///
  /// Parameter [linuxSubscriptionsDiscoverySettings] :
  /// The settings defined for Linux subscriptions discovery. The settings
  /// include if Organizations integration has been enabled, and which Regions
  /// data will be aggregated from.
  ///
  /// Parameter [allowUpdate] :
  /// Describes if updates are allowed to the service settings for Linux
  /// subscriptions. If you allow updates, you can aggregate Linux subscription
  /// data in more than one home Region.
  Future<UpdateServiceSettingsResponse> updateServiceSettings({
    required LinuxSubscriptionsDiscovery linuxSubscriptionsDiscovery,
    required LinuxSubscriptionsDiscoverySettings
        linuxSubscriptionsDiscoverySettings,
    bool? allowUpdate,
  }) async {
    final $payload = <String, dynamic>{
      'LinuxSubscriptionsDiscovery': linuxSubscriptionsDiscovery.value,
      'LinuxSubscriptionsDiscoverySettings':
          linuxSubscriptionsDiscoverySettings,
      if (allowUpdate != null) 'AllowUpdate': allowUpdate,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/subscription/UpdateServiceSettings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateServiceSettingsResponse.fromJson(response);
  }
}

class DeregisterSubscriptionProviderResponse {
  DeregisterSubscriptionProviderResponse();

  factory DeregisterSubscriptionProviderResponse.fromJson(
      Map<String, dynamic> _) {
    return DeregisterSubscriptionProviderResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A filter object that is used to return more specific results from a describe
/// operation. Filters can be used to match a set of resources by specific
/// criteria.
class Filter {
  /// The type of name to filter by.
  final String? name;

  /// An operator for filtering results.
  final Operator? operator;

  /// One or more values for the name to filter by.
  final List<String>? values;

  Filter({
    this.name,
    this.operator,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final values = this.values;
    return {
      if (name != null) 'Name': name,
      if (operator != null) 'Operator': operator.value,
      if (values != null) 'Values': values,
    };
  }
}

class GetRegisteredSubscriptionProviderResponse {
  /// The timestamp from the last time License Manager retrieved subscription
  /// details from your registered third-party Linux subscription provider.
  final String? lastSuccessfulDataRetrievalTime;

  /// The Amazon Resource Name (ARN) of the third-party access secret stored in
  /// Secrets Manager for the BYOL registration resource specified in the request.
  final String? secretArn;

  /// The Amazon Resource Name (ARN) for the BYOL registration resource specified
  /// in the request.
  final String? subscriptionProviderArn;

  /// The subscription provider for the BYOL registration resource specified in
  /// the request.
  final SubscriptionProviderSource? subscriptionProviderSource;

  /// The status of the Linux subscription provider access token from the last
  /// successful subscription data request.
  final SubscriptionProviderStatus? subscriptionProviderStatus;

  /// The detailed message from your subscription provider token status.
  final String? subscriptionProviderStatusMessage;

  GetRegisteredSubscriptionProviderResponse({
    this.lastSuccessfulDataRetrievalTime,
    this.secretArn,
    this.subscriptionProviderArn,
    this.subscriptionProviderSource,
    this.subscriptionProviderStatus,
    this.subscriptionProviderStatusMessage,
  });

  factory GetRegisteredSubscriptionProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return GetRegisteredSubscriptionProviderResponse(
      lastSuccessfulDataRetrievalTime:
          json['LastSuccessfulDataRetrievalTime'] as String?,
      secretArn: json['SecretArn'] as String?,
      subscriptionProviderArn: json['SubscriptionProviderArn'] as String?,
      subscriptionProviderSource:
          (json['SubscriptionProviderSource'] as String?)
              ?.let(SubscriptionProviderSource.fromString),
      subscriptionProviderStatus:
          (json['SubscriptionProviderStatus'] as String?)
              ?.let(SubscriptionProviderStatus.fromString),
      subscriptionProviderStatusMessage:
          json['SubscriptionProviderStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastSuccessfulDataRetrievalTime =
        this.lastSuccessfulDataRetrievalTime;
    final secretArn = this.secretArn;
    final subscriptionProviderArn = this.subscriptionProviderArn;
    final subscriptionProviderSource = this.subscriptionProviderSource;
    final subscriptionProviderStatus = this.subscriptionProviderStatus;
    final subscriptionProviderStatusMessage =
        this.subscriptionProviderStatusMessage;
    return {
      if (lastSuccessfulDataRetrievalTime != null)
        'LastSuccessfulDataRetrievalTime': lastSuccessfulDataRetrievalTime,
      if (secretArn != null) 'SecretArn': secretArn,
      if (subscriptionProviderArn != null)
        'SubscriptionProviderArn': subscriptionProviderArn,
      if (subscriptionProviderSource != null)
        'SubscriptionProviderSource': subscriptionProviderSource.value,
      if (subscriptionProviderStatus != null)
        'SubscriptionProviderStatus': subscriptionProviderStatus.value,
      if (subscriptionProviderStatusMessage != null)
        'SubscriptionProviderStatusMessage': subscriptionProviderStatusMessage,
    };
  }
}

class GetServiceSettingsResponse {
  /// The Region in which License Manager displays the aggregated data for Linux
  /// subscriptions.
  final List<String>? homeRegions;

  /// Lists if discovery has been enabled for Linux subscriptions.
  final LinuxSubscriptionsDiscovery? linuxSubscriptionsDiscovery;

  /// Lists the settings defined for Linux subscriptions discovery. The settings
  /// include if Organizations integration has been enabled, and which Regions
  /// data will be aggregated from.
  final LinuxSubscriptionsDiscoverySettings?
      linuxSubscriptionsDiscoverySettings;

  /// Indicates the status of Linux subscriptions settings being applied.
  final Status? status;

  /// A message which details the Linux subscriptions service settings current
  /// status.
  final Map<String, String>? statusMessage;

  GetServiceSettingsResponse({
    this.homeRegions,
    this.linuxSubscriptionsDiscovery,
    this.linuxSubscriptionsDiscoverySettings,
    this.status,
    this.statusMessage,
  });

  factory GetServiceSettingsResponse.fromJson(Map<String, dynamic> json) {
    return GetServiceSettingsResponse(
      homeRegions: (json['HomeRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      linuxSubscriptionsDiscovery:
          (json['LinuxSubscriptionsDiscovery'] as String?)
              ?.let(LinuxSubscriptionsDiscovery.fromString),
      linuxSubscriptionsDiscoverySettings:
          json['LinuxSubscriptionsDiscoverySettings'] != null
              ? LinuxSubscriptionsDiscoverySettings.fromJson(
                  json['LinuxSubscriptionsDiscoverySettings']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)?.let(Status.fromString),
      statusMessage: (json['StatusMessage'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegions = this.homeRegions;
    final linuxSubscriptionsDiscovery = this.linuxSubscriptionsDiscovery;
    final linuxSubscriptionsDiscoverySettings =
        this.linuxSubscriptionsDiscoverySettings;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (homeRegions != null) 'HomeRegions': homeRegions,
      if (linuxSubscriptionsDiscovery != null)
        'LinuxSubscriptionsDiscovery': linuxSubscriptionsDiscovery.value,
      if (linuxSubscriptionsDiscoverySettings != null)
        'LinuxSubscriptionsDiscoverySettings':
            linuxSubscriptionsDiscoverySettings,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

/// Details discovered information about a running instance using Linux
/// subscriptions.
class Instance {
  /// The account ID which owns the instance.
  final String? accountID;

  /// The AMI ID used to launch the instance.
  final String? amiId;

  /// Indicates that you have two different license subscriptions for the same
  /// software on your instance.
  final String? dualSubscription;

  /// The instance ID of the resource.
  final String? instanceID;

  /// The instance type of the resource.
  final String? instanceType;

  /// The time in which the last discovery updated the instance details.
  final String? lastUpdatedTime;

  /// The operating system software version that runs on your instance.
  final String? osVersion;

  /// The product code for the instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/linux-subscriptions-usage-operation.html">Usage
  /// operation values</a> in the <i>License Manager User Guide</i> .
  final List<String>? productCode;

  /// The Region the instance is running in.
  final String? region;

  /// Indicates that your instance uses a BYOL license subscription from a
  /// third-party Linux subscription provider that you've registered with License
  /// Manager.
  final String? registeredWithSubscriptionProvider;

  /// The status of the instance.
  final String? status;

  /// The name of the license subscription that the instance uses.
  final String? subscriptionName;

  /// The timestamp when you registered the third-party Linux subscription
  /// provider for the subscription that the instance uses.
  final String? subscriptionProviderCreateTime;

  /// The timestamp from the last time that the instance synced with the
  /// registered third-party Linux subscription provider.
  final String? subscriptionProviderUpdateTime;

  /// The usage operation of the instance. For more information, see For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/linux-subscriptions-usage-operation.html">Usage
  /// operation values</a> in the <i>License Manager User Guide</i>.
  final String? usageOperation;

  Instance({
    this.accountID,
    this.amiId,
    this.dualSubscription,
    this.instanceID,
    this.instanceType,
    this.lastUpdatedTime,
    this.osVersion,
    this.productCode,
    this.region,
    this.registeredWithSubscriptionProvider,
    this.status,
    this.subscriptionName,
    this.subscriptionProviderCreateTime,
    this.subscriptionProviderUpdateTime,
    this.usageOperation,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      accountID: json['AccountID'] as String?,
      amiId: json['AmiId'] as String?,
      dualSubscription: json['DualSubscription'] as String?,
      instanceID: json['InstanceID'] as String?,
      instanceType: json['InstanceType'] as String?,
      lastUpdatedTime: json['LastUpdatedTime'] as String?,
      osVersion: json['OsVersion'] as String?,
      productCode: (json['ProductCode'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      region: json['Region'] as String?,
      registeredWithSubscriptionProvider:
          json['RegisteredWithSubscriptionProvider'] as String?,
      status: json['Status'] as String?,
      subscriptionName: json['SubscriptionName'] as String?,
      subscriptionProviderCreateTime:
          json['SubscriptionProviderCreateTime'] as String?,
      subscriptionProviderUpdateTime:
          json['SubscriptionProviderUpdateTime'] as String?,
      usageOperation: json['UsageOperation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountID = this.accountID;
    final amiId = this.amiId;
    final dualSubscription = this.dualSubscription;
    final instanceID = this.instanceID;
    final instanceType = this.instanceType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final osVersion = this.osVersion;
    final productCode = this.productCode;
    final region = this.region;
    final registeredWithSubscriptionProvider =
        this.registeredWithSubscriptionProvider;
    final status = this.status;
    final subscriptionName = this.subscriptionName;
    final subscriptionProviderCreateTime = this.subscriptionProviderCreateTime;
    final subscriptionProviderUpdateTime = this.subscriptionProviderUpdateTime;
    final usageOperation = this.usageOperation;
    return {
      if (accountID != null) 'AccountID': accountID,
      if (amiId != null) 'AmiId': amiId,
      if (dualSubscription != null) 'DualSubscription': dualSubscription,
      if (instanceID != null) 'InstanceID': instanceID,
      if (instanceType != null) 'InstanceType': instanceType,
      if (lastUpdatedTime != null) 'LastUpdatedTime': lastUpdatedTime,
      if (osVersion != null) 'OsVersion': osVersion,
      if (productCode != null) 'ProductCode': productCode,
      if (region != null) 'Region': region,
      if (registeredWithSubscriptionProvider != null)
        'RegisteredWithSubscriptionProvider':
            registeredWithSubscriptionProvider,
      if (status != null) 'Status': status,
      if (subscriptionName != null) 'SubscriptionName': subscriptionName,
      if (subscriptionProviderCreateTime != null)
        'SubscriptionProviderCreateTime': subscriptionProviderCreateTime,
      if (subscriptionProviderUpdateTime != null)
        'SubscriptionProviderUpdateTime': subscriptionProviderUpdateTime,
      if (usageOperation != null) 'UsageOperation': usageOperation,
    };
  }
}

enum LinuxSubscriptionsDiscovery {
  enabled('Enabled'),
  disabled('Disabled'),
  ;

  final String value;

  const LinuxSubscriptionsDiscovery(this.value);

  static LinuxSubscriptionsDiscovery fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum LinuxSubscriptionsDiscovery'));
}

/// Lists the settings defined for discovering Linux subscriptions.
class LinuxSubscriptionsDiscoverySettings {
  /// Details if you have enabled resource discovery across your accounts in
  /// Organizations.
  final OrganizationIntegration organizationIntegration;

  /// The Regions in which to discover data for Linux subscriptions.
  final List<String> sourceRegions;

  LinuxSubscriptionsDiscoverySettings({
    required this.organizationIntegration,
    required this.sourceRegions,
  });

  factory LinuxSubscriptionsDiscoverySettings.fromJson(
      Map<String, dynamic> json) {
    return LinuxSubscriptionsDiscoverySettings(
      organizationIntegration: OrganizationIntegration.fromString(
          (json['OrganizationIntegration'] as String)),
      sourceRegions: (json['SourceRegions'] as List)
          .nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationIntegration = this.organizationIntegration;
    final sourceRegions = this.sourceRegions;
    return {
      'OrganizationIntegration': organizationIntegration.value,
      'SourceRegions': sourceRegions,
    };
  }
}

class ListLinuxSubscriptionInstancesResponse {
  /// An array that contains instance objects.
  final List<Instance>? instances;

  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  ListLinuxSubscriptionInstancesResponse({
    this.instances,
    this.nextToken,
  });

  factory ListLinuxSubscriptionInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLinuxSubscriptionInstancesResponse(
      instances: (json['Instances'] as List?)
          ?.nonNulls
          .map((e) => Instance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instances = this.instances;
    final nextToken = this.nextToken;
    return {
      if (instances != null) 'Instances': instances,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListLinuxSubscriptionsResponse {
  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// An array that contains subscription objects.
  final List<Subscription>? subscriptions;

  ListLinuxSubscriptionsResponse({
    this.nextToken,
    this.subscriptions,
  });

  factory ListLinuxSubscriptionsResponse.fromJson(Map<String, dynamic> json) {
    return ListLinuxSubscriptionsResponse(
      nextToken: json['NextToken'] as String?,
      subscriptions: (json['Subscriptions'] as List?)
          ?.nonNulls
          .map((e) => Subscription.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subscriptions = this.subscriptions;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subscriptions != null) 'Subscriptions': subscriptions,
    };
  }
}

class ListRegisteredSubscriptionProvidersResponse {
  /// The next token used for paginated responses. When this field isn't empty,
  /// there are additional elements that the service hasn't included in this
  /// request. Use this token with the next request to retrieve additional
  /// objects.
  final String? nextToken;

  /// The list of BYOL registration resources that fit the criteria you specified
  /// in the request.
  final List<RegisteredSubscriptionProvider>? registeredSubscriptionProviders;

  ListRegisteredSubscriptionProvidersResponse({
    this.nextToken,
    this.registeredSubscriptionProviders,
  });

  factory ListRegisteredSubscriptionProvidersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListRegisteredSubscriptionProvidersResponse(
      nextToken: json['NextToken'] as String?,
      registeredSubscriptionProviders:
          (json['RegisteredSubscriptionProviders'] as List?)
              ?.nonNulls
              .map((e) => RegisteredSubscriptionProvider.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final registeredSubscriptionProviders =
        this.registeredSubscriptionProviders;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (registeredSubscriptionProviders != null)
        'RegisteredSubscriptionProviders': registeredSubscriptionProviders,
    };
  }
}

class ListTagsForResourceResponse {
  /// The metadata tags for the requested resource.
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

enum Operator {
  equal('Equal'),
  notEqual('NotEqual'),
  contains('Contains'),
  ;

  final String value;

  const Operator(this.value);

  static Operator fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum Operator'));
}

enum OrganizationIntegration {
  enabled('Enabled'),
  disabled('Disabled'),
  ;

  final String value;

  const OrganizationIntegration(this.value);

  static OrganizationIntegration fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum OrganizationIntegration'));
}

class RegisterSubscriptionProviderResponse {
  /// The Amazon Resource Name (ARN) of the Linux subscription provider resource
  /// that you registered.
  final String? subscriptionProviderArn;

  /// The Linux subscription provider that you registered.
  final SubscriptionProviderSource? subscriptionProviderSource;

  /// Indicates the status of the registration action for the Linux subscription
  /// provider that you requested.
  final SubscriptionProviderStatus? subscriptionProviderStatus;

  RegisterSubscriptionProviderResponse({
    this.subscriptionProviderArn,
    this.subscriptionProviderSource,
    this.subscriptionProviderStatus,
  });

  factory RegisterSubscriptionProviderResponse.fromJson(
      Map<String, dynamic> json) {
    return RegisterSubscriptionProviderResponse(
      subscriptionProviderArn: json['SubscriptionProviderArn'] as String?,
      subscriptionProviderSource:
          (json['SubscriptionProviderSource'] as String?)
              ?.let(SubscriptionProviderSource.fromString),
      subscriptionProviderStatus:
          (json['SubscriptionProviderStatus'] as String?)
              ?.let(SubscriptionProviderStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final subscriptionProviderArn = this.subscriptionProviderArn;
    final subscriptionProviderSource = this.subscriptionProviderSource;
    final subscriptionProviderStatus = this.subscriptionProviderStatus;
    return {
      if (subscriptionProviderArn != null)
        'SubscriptionProviderArn': subscriptionProviderArn,
      if (subscriptionProviderSource != null)
        'SubscriptionProviderSource': subscriptionProviderSource.value,
      if (subscriptionProviderStatus != null)
        'SubscriptionProviderStatus': subscriptionProviderStatus.value,
    };
  }
}

/// A third-party provider for operating system (OS) platform software and
/// license subscriptions, such as Red Hat. When you register a third-party
/// Linux subscription provider, License Manager can get subscription data from
/// the registered provider.
class RegisteredSubscriptionProvider {
  /// The timestamp from the last time that License Manager accessed third-party
  /// subscription data for your account from your registered Linux subscription
  /// provider.
  final String? lastSuccessfulDataRetrievalTime;

  /// The Amazon Resource Name (ARN) of the Secrets Manager secret that stores
  /// your registered Linux subscription provider access token. For RHEL account
  /// subscriptions, this is the offline token.
  final String? secretArn;

  /// The Amazon Resource Name (ARN) of the Linux subscription provider resource
  /// that you registered.
  final String? subscriptionProviderArn;

  /// A supported third-party Linux subscription provider. License Manager
  /// currently supports Red Hat subscriptions.
  final SubscriptionProviderSource? subscriptionProviderSource;

  /// Indicates the status of your registered Linux subscription provider access
  /// token from the last time License Manager retrieved subscription data. For
  /// RHEL account subscriptions, this is the status of the offline token.
  final SubscriptionProviderStatus? subscriptionProviderStatus;

  /// A detailed message that's associated with your BYOL subscription provider
  /// token status.
  final String? subscriptionProviderStatusMessage;

  RegisteredSubscriptionProvider({
    this.lastSuccessfulDataRetrievalTime,
    this.secretArn,
    this.subscriptionProviderArn,
    this.subscriptionProviderSource,
    this.subscriptionProviderStatus,
    this.subscriptionProviderStatusMessage,
  });

  factory RegisteredSubscriptionProvider.fromJson(Map<String, dynamic> json) {
    return RegisteredSubscriptionProvider(
      lastSuccessfulDataRetrievalTime:
          json['LastSuccessfulDataRetrievalTime'] as String?,
      secretArn: json['SecretArn'] as String?,
      subscriptionProviderArn: json['SubscriptionProviderArn'] as String?,
      subscriptionProviderSource:
          (json['SubscriptionProviderSource'] as String?)
              ?.let(SubscriptionProviderSource.fromString),
      subscriptionProviderStatus:
          (json['SubscriptionProviderStatus'] as String?)
              ?.let(SubscriptionProviderStatus.fromString),
      subscriptionProviderStatusMessage:
          json['SubscriptionProviderStatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final lastSuccessfulDataRetrievalTime =
        this.lastSuccessfulDataRetrievalTime;
    final secretArn = this.secretArn;
    final subscriptionProviderArn = this.subscriptionProviderArn;
    final subscriptionProviderSource = this.subscriptionProviderSource;
    final subscriptionProviderStatus = this.subscriptionProviderStatus;
    final subscriptionProviderStatusMessage =
        this.subscriptionProviderStatusMessage;
    return {
      if (lastSuccessfulDataRetrievalTime != null)
        'LastSuccessfulDataRetrievalTime': lastSuccessfulDataRetrievalTime,
      if (secretArn != null) 'SecretArn': secretArn,
      if (subscriptionProviderArn != null)
        'SubscriptionProviderArn': subscriptionProviderArn,
      if (subscriptionProviderSource != null)
        'SubscriptionProviderSource': subscriptionProviderSource.value,
      if (subscriptionProviderStatus != null)
        'SubscriptionProviderStatus': subscriptionProviderStatus.value,
      if (subscriptionProviderStatusMessage != null)
        'SubscriptionProviderStatusMessage': subscriptionProviderStatusMessage,
    };
  }
}

enum Status {
  inProgress('InProgress'),
  completed('Completed'),
  successful('Successful'),
  failed('Failed'),
  ;

  final String value;

  const Status(this.value);

  static Status fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception('$value is not known in enum Status'));
}

/// An object which details a discovered Linux subscription.
class Subscription {
  /// The total amount of running instances using this subscription.
  final int? instanceCount;

  /// The name of the subscription.
  final String? name;

  /// The type of subscription. The type can be subscription-included with Amazon
  /// EC2, Bring Your Own Subscription model (BYOS), or from the Amazon Web
  /// Services Marketplace. Certain subscriptions may use licensing from the
  /// Amazon Web Services Marketplace as well as OS licensing from Amazon EC2 or
  /// BYOS.
  final String? type;

  Subscription({
    this.instanceCount,
    this.name,
    this.type,
  });

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
      instanceCount: json['InstanceCount'] as int?,
      name: json['Name'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCount = this.instanceCount;
    final name = this.name;
    final type = this.type;
    return {
      if (instanceCount != null) 'InstanceCount': instanceCount,
      if (name != null) 'Name': name,
      if (type != null) 'Type': type,
    };
  }
}

enum SubscriptionProviderSource {
  redHat('RedHat'),
  ;

  final String value;

  const SubscriptionProviderSource(this.value);

  static SubscriptionProviderSource fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SubscriptionProviderSource'));
}

enum SubscriptionProviderStatus {
  active('ACTIVE'),
  invalid('INVALID'),
  pending('PENDING'),
  ;

  final String value;

  const SubscriptionProviderStatus(this.value);

  static SubscriptionProviderStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => throw Exception(
              '$value is not known in enum SubscriptionProviderStatus'));
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

class UpdateServiceSettingsResponse {
  /// The Region in which License Manager displays the aggregated data for Linux
  /// subscriptions.
  final List<String>? homeRegions;

  /// Lists if discovery has been enabled for Linux subscriptions.
  final LinuxSubscriptionsDiscovery? linuxSubscriptionsDiscovery;

  /// The settings defined for Linux subscriptions discovery. The settings include
  /// if Organizations integration has been enabled, and which Regions data will
  /// be aggregated from.
  final LinuxSubscriptionsDiscoverySettings?
      linuxSubscriptionsDiscoverySettings;

  /// Indicates the status of Linux subscriptions settings being applied.
  final Status? status;

  /// A message which details the Linux subscriptions service settings current
  /// status.
  final Map<String, String>? statusMessage;

  UpdateServiceSettingsResponse({
    this.homeRegions,
    this.linuxSubscriptionsDiscovery,
    this.linuxSubscriptionsDiscoverySettings,
    this.status,
    this.statusMessage,
  });

  factory UpdateServiceSettingsResponse.fromJson(Map<String, dynamic> json) {
    return UpdateServiceSettingsResponse(
      homeRegions: (json['HomeRegions'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      linuxSubscriptionsDiscovery:
          (json['LinuxSubscriptionsDiscovery'] as String?)
              ?.let(LinuxSubscriptionsDiscovery.fromString),
      linuxSubscriptionsDiscoverySettings:
          json['LinuxSubscriptionsDiscoverySettings'] != null
              ? LinuxSubscriptionsDiscoverySettings.fromJson(
                  json['LinuxSubscriptionsDiscoverySettings']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)?.let(Status.fromString),
      statusMessage: (json['StatusMessage'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final homeRegions = this.homeRegions;
    final linuxSubscriptionsDiscovery = this.linuxSubscriptionsDiscovery;
    final linuxSubscriptionsDiscoverySettings =
        this.linuxSubscriptionsDiscoverySettings;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (homeRegions != null) 'HomeRegions': homeRegions,
      if (linuxSubscriptionsDiscovery != null)
        'LinuxSubscriptionsDiscovery': linuxSubscriptionsDiscovery.value,
      if (linuxSubscriptionsDiscoverySettings != null)
        'LinuxSubscriptionsDiscoverySettings':
            linuxSubscriptionsDiscoverySettings,
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
