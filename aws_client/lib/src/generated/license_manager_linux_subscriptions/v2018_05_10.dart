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

  /// Lists the Linux subscriptions service settings.
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
  /// An array of structures that you can use to filter the results to those
  /// that match one or more sets of key-value pairs that you specify. For
  /// example, you can filter by the name of <code>AmiID</code> with an optional
  /// operator to see subscriptions that match, partially match, or don't match
  /// a certain Amazon Machine Image (AMI) ID.
  ///
  /// The valid names for this filter are:
  ///
  /// <ul>
  /// <li>
  /// <code>AmiID</code>
  /// </li>
  /// <li>
  /// <code>InstanceID</code>
  /// </li>
  /// <li>
  /// <code>AccountID</code>
  /// </li>
  /// <li>
  /// <code>Status</code>
  /// </li>
  /// <li>
  /// <code>Region</code>
  /// </li>
  /// <li>
  /// <code>UsageOperation</code>
  /// </li>
  /// <li>
  /// <code>ProductCode</code>
  /// </li>
  /// <li>
  /// <code>InstanceType</code>
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
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
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
  /// Maximum number of results to return in a single call.
  ///
  /// Parameter [nextToken] :
  /// Token for the next set of results.
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
      'LinuxSubscriptionsDiscovery': linuxSubscriptionsDiscovery.toValue(),
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
      if (operator != null) 'Operator': operator.toValue(),
      if (values != null) 'Values': values,
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      linuxSubscriptionsDiscovery:
          (json['LinuxSubscriptionsDiscovery'] as String?)
              ?.toLinuxSubscriptionsDiscovery(),
      linuxSubscriptionsDiscoverySettings:
          json['LinuxSubscriptionsDiscoverySettings'] != null
              ? LinuxSubscriptionsDiscoverySettings.fromJson(
                  json['LinuxSubscriptionsDiscoverySettings']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)?.toStatus(),
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
        'LinuxSubscriptionsDiscovery': linuxSubscriptionsDiscovery.toValue(),
      if (linuxSubscriptionsDiscoverySettings != null)
        'LinuxSubscriptionsDiscoverySettings':
            linuxSubscriptionsDiscoverySettings,
      if (status != null) 'Status': status.toValue(),
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

  /// The instance ID of the resource.
  final String? instanceID;

  /// The instance type of the resource.
  final String? instanceType;

  /// The time in which the last discovery updated the instance details.
  final String? lastUpdatedTime;

  /// The product code for the instance. For more information, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/linux-subscriptions-usage-operation.html">Usage
  /// operation values</a> in the <i>License Manager User Guide</i> .
  final List<String>? productCode;

  /// The Region the instance is running in.
  final String? region;

  /// The status of the instance.
  final String? status;

  /// The name of the subscription being used by the instance.
  final String? subscriptionName;

  /// The usage operation of the instance. For more information, see For more
  /// information, see <a
  /// href="https://docs.aws.amazon.com/license-manager/latest/userguide/linux-subscriptions-usage-operation.html">Usage
  /// operation values</a> in the <i>License Manager User Guide</i>.
  final String? usageOperation;

  Instance({
    this.accountID,
    this.amiId,
    this.instanceID,
    this.instanceType,
    this.lastUpdatedTime,
    this.productCode,
    this.region,
    this.status,
    this.subscriptionName,
    this.usageOperation,
  });

  factory Instance.fromJson(Map<String, dynamic> json) {
    return Instance(
      accountID: json['AccountID'] as String?,
      amiId: json['AmiId'] as String?,
      instanceID: json['InstanceID'] as String?,
      instanceType: json['InstanceType'] as String?,
      lastUpdatedTime: json['LastUpdatedTime'] as String?,
      productCode: (json['ProductCode'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      region: json['Region'] as String?,
      status: json['Status'] as String?,
      subscriptionName: json['SubscriptionName'] as String?,
      usageOperation: json['UsageOperation'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountID = this.accountID;
    final amiId = this.amiId;
    final instanceID = this.instanceID;
    final instanceType = this.instanceType;
    final lastUpdatedTime = this.lastUpdatedTime;
    final productCode = this.productCode;
    final region = this.region;
    final status = this.status;
    final subscriptionName = this.subscriptionName;
    final usageOperation = this.usageOperation;
    return {
      if (accountID != null) 'AccountID': accountID,
      if (amiId != null) 'AmiId': amiId,
      if (instanceID != null) 'InstanceID': instanceID,
      if (instanceType != null) 'InstanceType': instanceType,
      if (lastUpdatedTime != null) 'LastUpdatedTime': lastUpdatedTime,
      if (productCode != null) 'ProductCode': productCode,
      if (region != null) 'Region': region,
      if (status != null) 'Status': status,
      if (subscriptionName != null) 'SubscriptionName': subscriptionName,
      if (usageOperation != null) 'UsageOperation': usageOperation,
    };
  }
}

enum LinuxSubscriptionsDiscovery {
  enabled,
  disabled,
}

extension LinuxSubscriptionsDiscoveryValueExtension
    on LinuxSubscriptionsDiscovery {
  String toValue() {
    switch (this) {
      case LinuxSubscriptionsDiscovery.enabled:
        return 'Enabled';
      case LinuxSubscriptionsDiscovery.disabled:
        return 'Disabled';
    }
  }
}

extension LinuxSubscriptionsDiscoveryFromString on String {
  LinuxSubscriptionsDiscovery toLinuxSubscriptionsDiscovery() {
    switch (this) {
      case 'Enabled':
        return LinuxSubscriptionsDiscovery.enabled;
      case 'Disabled':
        return LinuxSubscriptionsDiscovery.disabled;
    }
    throw Exception('$this is not known in enum LinuxSubscriptionsDiscovery');
  }
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
      organizationIntegration: (json['OrganizationIntegration'] as String)
          .toOrganizationIntegration(),
      sourceRegions: (json['SourceRegions'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final organizationIntegration = this.organizationIntegration;
    final sourceRegions = this.sourceRegions;
    return {
      'OrganizationIntegration': organizationIntegration.toValue(),
      'SourceRegions': sourceRegions,
    };
  }
}

class ListLinuxSubscriptionInstancesResponse {
  /// An array that contains instance objects.
  final List<Instance>? instances;

  /// Token for the next set of results.
  final String? nextToken;

  ListLinuxSubscriptionInstancesResponse({
    this.instances,
    this.nextToken,
  });

  factory ListLinuxSubscriptionInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return ListLinuxSubscriptionInstancesResponse(
      instances: (json['Instances'] as List?)
          ?.whereNotNull()
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
  /// Token for the next set of results.
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
          ?.whereNotNull()
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

enum Operator {
  equal,
  notEqual,
  contains,
}

extension OperatorValueExtension on Operator {
  String toValue() {
    switch (this) {
      case Operator.equal:
        return 'Equal';
      case Operator.notEqual:
        return 'NotEqual';
      case Operator.contains:
        return 'Contains';
    }
  }
}

extension OperatorFromString on String {
  Operator toOperator() {
    switch (this) {
      case 'Equal':
        return Operator.equal;
      case 'NotEqual':
        return Operator.notEqual;
      case 'Contains':
        return Operator.contains;
    }
    throw Exception('$this is not known in enum Operator');
  }
}

enum OrganizationIntegration {
  enabled,
  disabled,
}

extension OrganizationIntegrationValueExtension on OrganizationIntegration {
  String toValue() {
    switch (this) {
      case OrganizationIntegration.enabled:
        return 'Enabled';
      case OrganizationIntegration.disabled:
        return 'Disabled';
    }
  }
}

extension OrganizationIntegrationFromString on String {
  OrganizationIntegration toOrganizationIntegration() {
    switch (this) {
      case 'Enabled':
        return OrganizationIntegration.enabled;
      case 'Disabled':
        return OrganizationIntegration.disabled;
    }
    throw Exception('$this is not known in enum OrganizationIntegration');
  }
}

enum Status {
  inProgress,
  completed,
  successful,
  failed,
}

extension StatusValueExtension on Status {
  String toValue() {
    switch (this) {
      case Status.inProgress:
        return 'InProgress';
      case Status.completed:
        return 'Completed';
      case Status.successful:
        return 'Successful';
      case Status.failed:
        return 'Failed';
    }
  }
}

extension StatusFromString on String {
  Status toStatus() {
    switch (this) {
      case 'InProgress':
        return Status.inProgress;
      case 'Completed':
        return Status.completed;
      case 'Successful':
        return Status.successful;
      case 'Failed':
        return Status.failed;
    }
    throw Exception('$this is not known in enum Status');
  }
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
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      linuxSubscriptionsDiscovery:
          (json['LinuxSubscriptionsDiscovery'] as String?)
              ?.toLinuxSubscriptionsDiscovery(),
      linuxSubscriptionsDiscoverySettings:
          json['LinuxSubscriptionsDiscoverySettings'] != null
              ? LinuxSubscriptionsDiscoverySettings.fromJson(
                  json['LinuxSubscriptionsDiscoverySettings']
                      as Map<String, dynamic>)
              : null,
      status: (json['Status'] as String?)?.toStatus(),
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
        'LinuxSubscriptionsDiscovery': linuxSubscriptionsDiscovery.toValue(),
      if (linuxSubscriptionsDiscoverySettings != null)
        'LinuxSubscriptionsDiscoverySettings':
            linuxSubscriptionsDiscoverySettings,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
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
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
