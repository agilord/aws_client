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

/// This API reference provides descriptions, syntax, and other details about
/// each of the actions and data types for AWS Systems Manager for SAP. The
/// topic for each action shows the API request parameters and responses.
class SsmSap {
  final _s.RestJsonProtocol _protocol;
  SsmSap({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'ssm-sap',
            signingName: 'ssm-sap',
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

  /// Removes permissions associated with the target database.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [actionType] :
  /// Delete or restore the permissions on the target database.
  ///
  /// Parameter [sourceResourceArn] :
  /// The Amazon Resource Name (ARN) of the source resource.
  Future<DeleteResourcePermissionOutput> deleteResourcePermission({
    required String resourceArn,
    PermissionActionType? actionType,
    String? sourceResourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      if (actionType != null) 'ActionType': actionType.toValue(),
      if (sourceResourceArn != null) 'SourceResourceArn': sourceResourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/delete-resource-permission',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteResourcePermissionOutput.fromJson(response);
  }

  /// Deregister an SAP application with AWS Systems Manager for SAP. This
  /// action does not aﬀect the existing setup of your SAP workloads on Amazon
  /// EC2.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  Future<void> deregisterApplication({
    required String applicationId,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deregister-application',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Gets an application registered with AWS Systems Manager for SAP. It also
  /// returns the components of the application.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [appRegistryArn] :
  /// The Amazon Resource Name (ARN) of the application registry.
  ///
  /// Parameter [applicationArn] :
  /// The Amazon Resource Name (ARN) of the application.
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  Future<GetApplicationOutput> getApplication({
    String? appRegistryArn,
    String? applicationArn,
    String? applicationId,
  }) async {
    final $payload = <String, dynamic>{
      if (appRegistryArn != null) 'AppRegistryArn': appRegistryArn,
      if (applicationArn != null) 'ApplicationArn': applicationArn,
      if (applicationId != null) 'ApplicationId': applicationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-application',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationOutput.fromJson(response);
  }

  /// Gets the component of an application registered with AWS Systems Manager
  /// for SAP.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [componentId] :
  /// The ID of the component.
  Future<GetComponentOutput> getComponent({
    required String applicationId,
    required String componentId,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      'ComponentId': componentId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-component',
      exceptionFnMap: _exceptionFns,
    );
    return GetComponentOutput.fromJson(response);
  }

  /// Gets the SAP HANA database of an application registered with AWS Systems
  /// Manager for SAP.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [componentId] :
  /// The ID of the component.
  ///
  /// Parameter [databaseArn] :
  /// The Amazon Resource Name (ARN) of the database.
  ///
  /// Parameter [databaseId] :
  /// The ID of the database.
  Future<GetDatabaseOutput> getDatabase({
    String? applicationId,
    String? componentId,
    String? databaseArn,
    String? databaseId,
  }) async {
    final $payload = <String, dynamic>{
      if (applicationId != null) 'ApplicationId': applicationId,
      if (componentId != null) 'ComponentId': componentId,
      if (databaseArn != null) 'DatabaseArn': databaseArn,
      if (databaseId != null) 'DatabaseId': databaseId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-database',
      exceptionFnMap: _exceptionFns,
    );
    return GetDatabaseOutput.fromJson(response);
  }

  /// Gets the details of an operation by specifying the operation ID.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [operationId] :
  /// The ID of the operation.
  Future<GetOperationOutput> getOperation({
    required String operationId,
  }) async {
    final $payload = <String, dynamic>{
      'OperationId': operationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-operation',
      exceptionFnMap: _exceptionFns,
    );
    return GetOperationOutput.fromJson(response);
  }

  /// Gets permissions associated with the target database.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [actionType] :
  /// <p/>
  Future<GetResourcePermissionOutput> getResourcePermission({
    required String resourceArn,
    PermissionActionType? actionType,
  }) async {
    final $payload = <String, dynamic>{
      'ResourceArn': resourceArn,
      if (actionType != null) 'ActionType': actionType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-resource-permission',
      exceptionFnMap: _exceptionFns,
    );
    return GetResourcePermissionOutput.fromJson(response);
  }

  /// Lists all the applications registered with AWS Systems Manager for SAP.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListApplicationsOutput> listApplications({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-applications',
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsOutput.fromJson(response);
  }

  /// Lists all the components registered with AWS Systems Manager for SAP.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// If you do not specify a value for MaxResults, the request returns 50 items
  /// per page by default.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListComponentsOutput> listComponents({
    String? applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (applicationId != null) 'ApplicationId': applicationId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-components',
      exceptionFnMap: _exceptionFns,
    );
    return ListComponentsOutput.fromJson(response);
  }

  /// Lists the SAP HANA databases of an application registered with AWS Systems
  /// Manager for SAP.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [componentId] :
  /// The ID of the component.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value. If you do not specify a value for MaxResults, the request returns
  /// 50 items per page by default.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListDatabasesOutput> listDatabases({
    String? applicationId,
    String? componentId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      if (applicationId != null) 'ApplicationId': applicationId,
      if (componentId != null) 'ComponentId': componentId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-databases',
      exceptionFnMap: _exceptionFns,
    );
    return ListDatabasesOutput.fromJson(response);
  }

  /// Lists the operations performed by AWS Systems Manager for SAP.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [filters] :
  /// The filters of an operation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value. If you do not specify a value for MaxResults, the request returns
  /// 50 items per page by default.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListOperationsOutput> listOperations({
    required String applicationId,
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-operations',
      exceptionFnMap: _exceptionFns,
    );
    return ListOperationsOutput.fromJson(response);
  }

  /// Lists all tags on an SAP HANA application and/or database registered with
  /// AWS Systems Manager for SAP.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
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

  /// Adds permissions to the target database.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [actionType] :
  /// <p/>
  ///
  /// Parameter [resourceArn] :
  /// <p/>
  ///
  /// Parameter [sourceResourceArn] :
  /// <p/>
  Future<PutResourcePermissionOutput> putResourcePermission({
    required PermissionActionType actionType,
    required String resourceArn,
    required String sourceResourceArn,
  }) async {
    final $payload = <String, dynamic>{
      'ActionType': actionType.toValue(),
      'ResourceArn': resourceArn,
      'SourceResourceArn': sourceResourceArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/put-resource-permission',
      exceptionFnMap: _exceptionFns,
    );
    return PutResourcePermissionOutput.fromJson(response);
  }

  /// Register an SAP application with AWS Systems Manager for SAP. You must
  /// meet the following requirements before registering.
  ///
  /// The SAP application you want to register with AWS Systems Manager for SAP
  /// is running on Amazon EC2.
  ///
  /// AWS Systems Manager Agent must be setup on an Amazon EC2 instance along
  /// with the required IAM permissions.
  ///
  /// Amazon EC2 instance(s) must have access to the secrets created in AWS
  /// Secrets Manager to manage SAP applications and components.
  ///
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [applicationType] :
  /// The type of the application.
  ///
  /// Parameter [credentials] :
  /// The credentials of the SAP application.
  ///
  /// Parameter [instances] :
  /// The Amazon EC2 instances on which your SAP application is running.
  ///
  /// Parameter [sapInstanceNumber] :
  /// The SAP instance number of the application.
  ///
  /// Parameter [sid] :
  /// The System ID of the application.
  ///
  /// Parameter [tags] :
  /// The tags to be attached to the SAP application.
  Future<RegisterApplicationOutput> registerApplication({
    required String applicationId,
    required ApplicationType applicationType,
    required List<ApplicationCredential> credentials,
    required List<String> instances,
    String? sapInstanceNumber,
    String? sid,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      'ApplicationType': applicationType.toValue(),
      'Credentials': credentials,
      'Instances': instances,
      if (sapInstanceNumber != null) 'SapInstanceNumber': sapInstanceNumber,
      if (sid != null) 'Sid': sid,
      if (tags != null) 'Tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/register-application',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterApplicationOutput.fromJson(response);
  }

  /// Creates tag for a resource by specifying the ARN.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags on a resource.
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

  /// Delete the tags for a resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// Adds/updates or removes credentials for applications registered with AWS
  /// Systems Manager for SAP.
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

  /// Updates the settings of an application registered with AWS Systems Manager
  /// for SAP.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [credentialsToAddOrUpdate] :
  /// The credentials to be added or updated.
  ///
  /// Parameter [credentialsToRemove] :
  /// The credentials to be removed.
  Future<UpdateApplicationSettingsOutput> updateApplicationSettings({
    required String applicationId,
    List<ApplicationCredential>? credentialsToAddOrUpdate,
    List<ApplicationCredential>? credentialsToRemove,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      if (credentialsToAddOrUpdate != null)
        'CredentialsToAddOrUpdate': credentialsToAddOrUpdate,
      if (credentialsToRemove != null)
        'CredentialsToRemove': credentialsToRemove,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/update-application-settings',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationSettingsOutput.fromJson(response);
  }
}

/// An SAP application registered with AWS Systems Manager for SAP.
class Application {
  /// The Amazon Resource Name (ARN) of the Application Registry.
  final String? appRegistryArn;

  /// The Amazon Resource Name (ARN) of the application.
  final String? arn;

  /// The components of the application.
  final List<String>? components;

  /// The ID of the application.
  final String? id;

  /// The time at which the application was last updated.
  final DateTime? lastUpdated;

  /// The status of the application.
  final ApplicationStatus? status;

  /// The status message.
  final String? statusMessage;

  /// The type of the application.
  final ApplicationType? type;

  Application({
    this.appRegistryArn,
    this.arn,
    this.components,
    this.id,
    this.lastUpdated,
    this.status,
    this.statusMessage,
    this.type,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      appRegistryArn: json['AppRegistryArn'] as String?,
      arn: json['Arn'] as String?,
      components: (json['Components'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['Id'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      status: (json['Status'] as String?)?.toApplicationStatus(),
      statusMessage: json['StatusMessage'] as String?,
      type: (json['Type'] as String?)?.toApplicationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final appRegistryArn = this.appRegistryArn;
    final arn = this.arn;
    final components = this.components;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (appRegistryArn != null) 'AppRegistryArn': appRegistryArn,
      if (arn != null) 'Arn': arn,
      if (components != null) 'Components': components,
      if (id != null) 'Id': id,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

/// The credentials of your SAP application.
class ApplicationCredential {
  /// The type of the application credentials.
  final CredentialType credentialType;

  /// The name of the SAP HANA database.
  final String databaseName;

  /// The secret ID created in AWS Secrets Manager to store the credentials of the
  /// SAP application.
  final String secretId;

  ApplicationCredential({
    required this.credentialType,
    required this.databaseName,
    required this.secretId,
  });

  factory ApplicationCredential.fromJson(Map<String, dynamic> json) {
    return ApplicationCredential(
      credentialType: (json['CredentialType'] as String).toCredentialType(),
      databaseName: json['DatabaseName'] as String,
      secretId: json['SecretId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final credentialType = this.credentialType;
    final databaseName = this.databaseName;
    final secretId = this.secretId;
    return {
      'CredentialType': credentialType.toValue(),
      'DatabaseName': databaseName,
      'SecretId': secretId,
    };
  }
}

enum ApplicationStatus {
  activated,
  starting,
  stopped,
  stopping,
  failed,
  registering,
  deleting,
  unknown,
}

extension ApplicationStatusValueExtension on ApplicationStatus {
  String toValue() {
    switch (this) {
      case ApplicationStatus.activated:
        return 'ACTIVATED';
      case ApplicationStatus.starting:
        return 'STARTING';
      case ApplicationStatus.stopped:
        return 'STOPPED';
      case ApplicationStatus.stopping:
        return 'STOPPING';
      case ApplicationStatus.failed:
        return 'FAILED';
      case ApplicationStatus.registering:
        return 'REGISTERING';
      case ApplicationStatus.deleting:
        return 'DELETING';
      case ApplicationStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension ApplicationStatusFromString on String {
  ApplicationStatus toApplicationStatus() {
    switch (this) {
      case 'ACTIVATED':
        return ApplicationStatus.activated;
      case 'STARTING':
        return ApplicationStatus.starting;
      case 'STOPPED':
        return ApplicationStatus.stopped;
      case 'STOPPING':
        return ApplicationStatus.stopping;
      case 'FAILED':
        return ApplicationStatus.failed;
      case 'REGISTERING':
        return ApplicationStatus.registering;
      case 'DELETING':
        return ApplicationStatus.deleting;
      case 'UNKNOWN':
        return ApplicationStatus.unknown;
    }
    throw Exception('$this is not known in enum ApplicationStatus');
  }
}

/// The summary of the SAP application registered with AWS Systems Manager for
/// SAP.
class ApplicationSummary {
  /// The Amazon Resource Name (ARN) of the application.
  final String? arn;

  /// The ID of the application.
  final String? id;

  /// The tags on the application.
  final Map<String, String>? tags;

  /// The type of the application.
  final ApplicationType? type;

  ApplicationSummary({
    this.arn,
    this.id,
    this.tags,
    this.type,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      arn: json['Arn'] as String?,
      id: json['Id'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toApplicationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final id = this.id;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (id != null) 'Id': id,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ApplicationType {
  hana,
}

extension ApplicationTypeValueExtension on ApplicationType {
  String toValue() {
    switch (this) {
      case ApplicationType.hana:
        return 'HANA';
    }
  }
}

extension ApplicationTypeFromString on String {
  ApplicationType toApplicationType() {
    switch (this) {
      case 'HANA':
        return ApplicationType.hana;
    }
    throw Exception('$this is not known in enum ApplicationType');
  }
}

/// The SAP component of your application.
class Component {
  /// The ID of the application.
  final String? applicationId;

  /// The ID of the component.
  final String? componentId;

  /// The type of the component.
  final ComponentType? componentType;

  /// The SAP HANA databases of the component.
  final List<String>? databases;

  /// The hosts of the component.
  final List<Host>? hosts;

  /// The time at which the component was last updated.
  final DateTime? lastUpdated;

  /// The primary host of the component.
  final String? primaryHost;

  /// The status of the component.
  final ComponentStatus? status;

  Component({
    this.applicationId,
    this.componentId,
    this.componentType,
    this.databases,
    this.hosts,
    this.lastUpdated,
    this.primaryHost,
    this.status,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      applicationId: json['ApplicationId'] as String?,
      componentId: json['ComponentId'] as String?,
      componentType: (json['ComponentType'] as String?)?.toComponentType(),
      databases: (json['Databases'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      hosts: (json['Hosts'] as List?)
          ?.whereNotNull()
          .map((e) => Host.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      primaryHost: json['PrimaryHost'] as String?,
      status: (json['Status'] as String?)?.toComponentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final componentId = this.componentId;
    final componentType = this.componentType;
    final databases = this.databases;
    final hosts = this.hosts;
    final lastUpdated = this.lastUpdated;
    final primaryHost = this.primaryHost;
    final status = this.status;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (componentId != null) 'ComponentId': componentId,
      if (componentType != null) 'ComponentType': componentType.toValue(),
      if (databases != null) 'Databases': databases,
      if (hosts != null) 'Hosts': hosts,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (primaryHost != null) 'PrimaryHost': primaryHost,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum ComponentStatus {
  activated,
}

extension ComponentStatusValueExtension on ComponentStatus {
  String toValue() {
    switch (this) {
      case ComponentStatus.activated:
        return 'ACTIVATED';
    }
  }
}

extension ComponentStatusFromString on String {
  ComponentStatus toComponentStatus() {
    switch (this) {
      case 'ACTIVATED':
        return ComponentStatus.activated;
    }
    throw Exception('$this is not known in enum ComponentStatus');
  }
}

/// The summary of the component.
class ComponentSummary {
  /// The ID of the application.
  final String? applicationId;

  /// The ID of the component.
  final String? componentId;

  /// The type of the component.
  final ComponentType? componentType;

  /// The tags of the component.
  final Map<String, String>? tags;

  ComponentSummary({
    this.applicationId,
    this.componentId,
    this.componentType,
    this.tags,
  });

  factory ComponentSummary.fromJson(Map<String, dynamic> json) {
    return ComponentSummary(
      applicationId: json['ApplicationId'] as String?,
      componentId: json['ComponentId'] as String?,
      componentType: (json['ComponentType'] as String?)?.toComponentType(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final componentId = this.componentId;
    final componentType = this.componentType;
    final tags = this.tags;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (componentId != null) 'ComponentId': componentId,
      if (componentType != null) 'ComponentType': componentType.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ComponentType {
  hana,
}

extension ComponentTypeValueExtension on ComponentType {
  String toValue() {
    switch (this) {
      case ComponentType.hana:
        return 'HANA';
    }
  }
}

extension ComponentTypeFromString on String {
  ComponentType toComponentType() {
    switch (this) {
      case 'HANA':
        return ComponentType.hana;
    }
    throw Exception('$this is not known in enum ComponentType');
  }
}

enum CredentialType {
  admin,
}

extension CredentialTypeValueExtension on CredentialType {
  String toValue() {
    switch (this) {
      case CredentialType.admin:
        return 'ADMIN';
    }
  }
}

extension CredentialTypeFromString on String {
  CredentialType toCredentialType() {
    switch (this) {
      case 'ADMIN':
        return CredentialType.admin;
    }
    throw Exception('$this is not known in enum CredentialType');
  }
}

/// The SAP HANA database of the application registered with AWS Systems Manager
/// for SAP.
class Database {
  /// The ID of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the database.
  final String? arn;

  /// The ID of the component.
  final String? componentId;

  /// The credentials of the database.
  final List<ApplicationCredential>? credentials;

  /// The ID of the SAP HANA database.
  final String? databaseId;

  /// The name of the database.
  final String? databaseName;

  /// The type of the database.
  final DatabaseType? databaseType;

  /// The time at which the database was last updated.
  final DateTime? lastUpdated;

  /// The primary host of the database.
  final String? primaryHost;

  /// The SQL port of the database.
  final int? sQLPort;

  /// The status of the database.
  final DatabaseStatus? status;

  Database({
    this.applicationId,
    this.arn,
    this.componentId,
    this.credentials,
    this.databaseId,
    this.databaseName,
    this.databaseType,
    this.lastUpdated,
    this.primaryHost,
    this.sQLPort,
    this.status,
  });

  factory Database.fromJson(Map<String, dynamic> json) {
    return Database(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      componentId: json['ComponentId'] as String?,
      credentials: (json['Credentials'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseId: json['DatabaseId'] as String?,
      databaseName: json['DatabaseName'] as String?,
      databaseType: (json['DatabaseType'] as String?)?.toDatabaseType(),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      primaryHost: json['PrimaryHost'] as String?,
      sQLPort: json['SQLPort'] as int?,
      status: (json['Status'] as String?)?.toDatabaseStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final componentId = this.componentId;
    final credentials = this.credentials;
    final databaseId = this.databaseId;
    final databaseName = this.databaseName;
    final databaseType = this.databaseType;
    final lastUpdated = this.lastUpdated;
    final primaryHost = this.primaryHost;
    final sQLPort = this.sQLPort;
    final status = this.status;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (componentId != null) 'ComponentId': componentId,
      if (credentials != null) 'Credentials': credentials,
      if (databaseId != null) 'DatabaseId': databaseId,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (databaseType != null) 'DatabaseType': databaseType.toValue(),
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (primaryHost != null) 'PrimaryHost': primaryHost,
      if (sQLPort != null) 'SQLPort': sQLPort,
      if (status != null) 'Status': status.toValue(),
    };
  }
}

enum DatabaseStatus {
  running,
  starting,
  stopped,
  warning,
  unknown,
}

extension DatabaseStatusValueExtension on DatabaseStatus {
  String toValue() {
    switch (this) {
      case DatabaseStatus.running:
        return 'RUNNING';
      case DatabaseStatus.starting:
        return 'STARTING';
      case DatabaseStatus.stopped:
        return 'STOPPED';
      case DatabaseStatus.warning:
        return 'WARNING';
      case DatabaseStatus.unknown:
        return 'UNKNOWN';
    }
  }
}

extension DatabaseStatusFromString on String {
  DatabaseStatus toDatabaseStatus() {
    switch (this) {
      case 'RUNNING':
        return DatabaseStatus.running;
      case 'STARTING':
        return DatabaseStatus.starting;
      case 'STOPPED':
        return DatabaseStatus.stopped;
      case 'WARNING':
        return DatabaseStatus.warning;
      case 'UNKNOWN':
        return DatabaseStatus.unknown;
    }
    throw Exception('$this is not known in enum DatabaseStatus');
  }
}

/// The summary of the database.
class DatabaseSummary {
  /// The ID of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the database.
  final String? arn;

  /// The ID of the component.
  final String? componentId;

  /// The ID of the database.
  final String? databaseId;

  /// The type of the database.
  final DatabaseType? databaseType;

  /// The tags of the database.
  final Map<String, String>? tags;

  DatabaseSummary({
    this.applicationId,
    this.arn,
    this.componentId,
    this.databaseId,
    this.databaseType,
    this.tags,
  });

  factory DatabaseSummary.fromJson(Map<String, dynamic> json) {
    return DatabaseSummary(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      componentId: json['ComponentId'] as String?,
      databaseId: json['DatabaseId'] as String?,
      databaseType: (json['DatabaseType'] as String?)?.toDatabaseType(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final componentId = this.componentId;
    final databaseId = this.databaseId;
    final databaseType = this.databaseType;
    final tags = this.tags;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (componentId != null) 'ComponentId': componentId,
      if (databaseId != null) 'DatabaseId': databaseId,
      if (databaseType != null) 'DatabaseType': databaseType.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum DatabaseType {
  system,
  tenant,
}

extension DatabaseTypeValueExtension on DatabaseType {
  String toValue() {
    switch (this) {
      case DatabaseType.system:
        return 'SYSTEM';
      case DatabaseType.tenant:
        return 'TENANT';
    }
  }
}

extension DatabaseTypeFromString on String {
  DatabaseType toDatabaseType() {
    switch (this) {
      case 'SYSTEM':
        return DatabaseType.system;
      case 'TENANT':
        return DatabaseType.tenant;
    }
    throw Exception('$this is not known in enum DatabaseType');
  }
}

class DeleteResourcePermissionOutput {
  /// The policy that removes permissions on the target database.
  final String? policy;

  DeleteResourcePermissionOutput({
    this.policy,
  });

  factory DeleteResourcePermissionOutput.fromJson(Map<String, dynamic> json) {
    return DeleteResourcePermissionOutput(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class DeregisterApplicationOutput {
  DeregisterApplicationOutput();

  factory DeregisterApplicationOutput.fromJson(Map<String, dynamic> _) {
    return DeregisterApplicationOutput();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A specific result obtained by specifying the name, value, and operator.
class Filter {
  /// The name of the filter. Filter names are case-sensitive.
  final String name;

  /// The operator for the filter.
  final FilterOperator operator;

  /// The filter values. Filter values are case-sensitive. If you specify multiple
  /// values for a filter, the values are joined with an OR, and the request
  /// returns all results that match any of the specified values
  final String value;

  Filter({
    required this.name,
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      'Name': name,
      'Operator': operator.toValue(),
      'Value': value,
    };
  }
}

enum FilterOperator {
  equals,
  greaterThanOrEquals,
  lessThanOrEquals,
}

extension FilterOperatorValueExtension on FilterOperator {
  String toValue() {
    switch (this) {
      case FilterOperator.equals:
        return 'Equals';
      case FilterOperator.greaterThanOrEquals:
        return 'GreaterThanOrEquals';
      case FilterOperator.lessThanOrEquals:
        return 'LessThanOrEquals';
    }
  }
}

extension FilterOperatorFromString on String {
  FilterOperator toFilterOperator() {
    switch (this) {
      case 'Equals':
        return FilterOperator.equals;
      case 'GreaterThanOrEquals':
        return FilterOperator.greaterThanOrEquals;
      case 'LessThanOrEquals':
        return FilterOperator.lessThanOrEquals;
    }
    throw Exception('$this is not known in enum FilterOperator');
  }
}

class GetApplicationOutput {
  /// Returns all of the metadata of an application registered with AWS Systems
  /// Manager for SAP.
  final Application? application;

  /// The tags of a registered application.
  final Map<String, String>? tags;

  GetApplicationOutput({
    this.application,
    this.tags,
  });

  factory GetApplicationOutput.fromJson(Map<String, dynamic> json) {
    return GetApplicationOutput(
      application: json['Application'] != null
          ? Application.fromJson(json['Application'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    final tags = this.tags;
    return {
      if (application != null) 'Application': application,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetComponentOutput {
  /// The component of an application registered with AWS Systems Manager for SAP.
  final Component? component;

  GetComponentOutput({
    this.component,
  });

  factory GetComponentOutput.fromJson(Map<String, dynamic> json) {
    return GetComponentOutput(
      component: json['Component'] != null
          ? Component.fromJson(json['Component'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    return {
      if (component != null) 'Component': component,
    };
  }
}

class GetDatabaseOutput {
  /// The SAP HANA database of an application registered with AWS Systems Manager
  /// for SAP.
  final Database? database;

  /// The tags of a database.
  final Map<String, String>? tags;

  GetDatabaseOutput({
    this.database,
    this.tags,
  });

  factory GetDatabaseOutput.fromJson(Map<String, dynamic> json) {
    return GetDatabaseOutput(
      database: json['Database'] != null
          ? Database.fromJson(json['Database'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final database = this.database;
    final tags = this.tags;
    return {
      if (database != null) 'Database': database,
      if (tags != null) 'Tags': tags,
    };
  }
}

class GetOperationOutput {
  /// Returns the details of an operation.
  final Operation? operation;

  GetOperationOutput({
    this.operation,
  });

  factory GetOperationOutput.fromJson(Map<String, dynamic> json) {
    return GetOperationOutput(
      operation: json['Operation'] != null
          ? Operation.fromJson(json['Operation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final operation = this.operation;
    return {
      if (operation != null) 'Operation': operation,
    };
  }
}

class GetResourcePermissionOutput {
  /// <p/>
  final String? policy;

  GetResourcePermissionOutput({
    this.policy,
  });

  factory GetResourcePermissionOutput.fromJson(Map<String, dynamic> json) {
    return GetResourcePermissionOutput(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

/// Describes the properties of the Dedicated Host.
class Host {
  /// The IP address of the Dedicated Host.
  final String? hostIp;

  /// The name of the Dedicated Host.
  final String? hostName;

  /// The role of the Dedicated Host.
  final HostRole? hostRole;

  /// The instance ID of the instance on the Dedicated Host.
  final String? instanceId;

  Host({
    this.hostIp,
    this.hostName,
    this.hostRole,
    this.instanceId,
  });

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      hostIp: json['HostIp'] as String?,
      hostName: json['HostName'] as String?,
      hostRole: (json['HostRole'] as String?)?.toHostRole(),
      instanceId: json['InstanceId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final hostIp = this.hostIp;
    final hostName = this.hostName;
    final hostRole = this.hostRole;
    final instanceId = this.instanceId;
    return {
      if (hostIp != null) 'HostIp': hostIp,
      if (hostName != null) 'HostName': hostName,
      if (hostRole != null) 'HostRole': hostRole.toValue(),
      if (instanceId != null) 'InstanceId': instanceId,
    };
  }
}

enum HostRole {
  leader,
  worker,
  standby,
  unknown,
}

extension HostRoleValueExtension on HostRole {
  String toValue() {
    switch (this) {
      case HostRole.leader:
        return 'LEADER';
      case HostRole.worker:
        return 'WORKER';
      case HostRole.standby:
        return 'STANDBY';
      case HostRole.unknown:
        return 'UNKNOWN';
    }
  }
}

extension HostRoleFromString on String {
  HostRole toHostRole() {
    switch (this) {
      case 'LEADER':
        return HostRole.leader;
      case 'WORKER':
        return HostRole.worker;
      case 'STANDBY':
        return HostRole.standby;
      case 'UNKNOWN':
        return HostRole.unknown;
    }
    throw Exception('$this is not known in enum HostRole');
  }
}

class ListApplicationsOutput {
  /// The applications registered with AWS Systems Manager for SAP.
  final List<ApplicationSummary>? applications;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListApplicationsOutput({
    this.applications,
    this.nextToken,
  });

  factory ListApplicationsOutput.fromJson(Map<String, dynamic> json) {
    return ListApplicationsOutput(
      applications: (json['Applications'] as List?)
          ?.whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      if (applications != null) 'Applications': applications,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListComponentsOutput {
  /// List of components registered with AWS System Manager for SAP.
  final List<ComponentSummary>? components;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListComponentsOutput({
    this.components,
    this.nextToken,
  });

  factory ListComponentsOutput.fromJson(Map<String, dynamic> json) {
    return ListComponentsOutput(
      components: (json['Components'] as List?)
          ?.whereNotNull()
          .map((e) => ComponentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final components = this.components;
    final nextToken = this.nextToken;
    return {
      if (components != null) 'Components': components,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListDatabasesOutput {
  /// The SAP HANA databases of an application.
  final List<DatabaseSummary>? databases;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListDatabasesOutput({
    this.databases,
    this.nextToken,
  });

  factory ListDatabasesOutput.fromJson(Map<String, dynamic> json) {
    return ListDatabasesOutput(
      databases: (json['Databases'] as List?)
          ?.whereNotNull()
          .map((e) => DatabaseSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final databases = this.databases;
    final nextToken = this.nextToken;
    return {
      if (databases != null) 'Databases': databases,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListOperationsOutput {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// List of operations performed by AWS Systems Manager for SAP.
  final List<Operation>? operations;

  ListOperationsOutput({
    this.nextToken,
    this.operations,
  });

  factory ListOperationsOutput.fromJson(Map<String, dynamic> json) {
    return ListOperationsOutput(
      nextToken: json['NextToken'] as String?,
      operations: (json['Operations'] as List?)
          ?.whereNotNull()
          .map((e) => Operation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final operations = this.operations;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (operations != null) 'Operations': operations,
    };
  }
}

class ListTagsForResourceResponse {
  /// <p/>
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

/// The operations performed by AWS Systems Manager for SAP.
class Operation {
  /// The end time of the operation.
  final DateTime? endTime;

  /// The ID of the operation.
  final String? id;

  /// The time at which the operation was last updated.
  final DateTime? lastUpdatedTime;

  /// The properties of the operation.
  final Map<String, String>? properties;

  /// The Amazon Resource Name (ARN) of the operation.
  final String? resourceArn;

  /// The resource ID of the operation.
  final String? resourceId;

  /// The resource type of the operation.
  final String? resourceType;

  /// The start time of the operation.
  final DateTime? startTime;

  /// The status of the operation.
  final OperationStatus? status;

  /// The status message of the operation.
  final String? statusMessage;

  /// The type of the operation.
  final String? type;

  Operation({
    this.endTime,
    this.id,
    this.lastUpdatedTime,
    this.properties,
    this.resourceArn,
    this.resourceId,
    this.resourceType,
    this.startTime,
    this.status,
    this.statusMessage,
    this.type,
  });

  factory Operation.fromJson(Map<String, dynamic> json) {
    return Operation(
      endTime: timeStampFromJson(json['EndTime']),
      id: json['Id'] as String?,
      lastUpdatedTime: timeStampFromJson(json['LastUpdatedTime']),
      properties: (json['Properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      resourceArn: json['ResourceArn'] as String?,
      resourceId: json['ResourceId'] as String?,
      resourceType: json['ResourceType'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.toOperationStatus(),
      statusMessage: json['StatusMessage'] as String?,
      type: json['Type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final id = this.id;
    final lastUpdatedTime = this.lastUpdatedTime;
    final properties = this.properties;
    final resourceArn = this.resourceArn;
    final resourceId = this.resourceId;
    final resourceType = this.resourceType;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (id != null) 'Id': id,
      if (lastUpdatedTime != null)
        'LastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (properties != null) 'Properties': properties,
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceId != null) 'ResourceId': resourceId,
      if (resourceType != null) 'ResourceType': resourceType,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (type != null) 'Type': type,
    };
  }
}

enum OperationStatus {
  inprogress,
  success,
  error,
}

extension OperationStatusValueExtension on OperationStatus {
  String toValue() {
    switch (this) {
      case OperationStatus.inprogress:
        return 'INPROGRESS';
      case OperationStatus.success:
        return 'SUCCESS';
      case OperationStatus.error:
        return 'ERROR';
    }
  }
}

extension OperationStatusFromString on String {
  OperationStatus toOperationStatus() {
    switch (this) {
      case 'INPROGRESS':
        return OperationStatus.inprogress;
      case 'SUCCESS':
        return OperationStatus.success;
      case 'ERROR':
        return OperationStatus.error;
    }
    throw Exception('$this is not known in enum OperationStatus');
  }
}

enum PermissionActionType {
  restore,
}

extension PermissionActionTypeValueExtension on PermissionActionType {
  String toValue() {
    switch (this) {
      case PermissionActionType.restore:
        return 'RESTORE';
    }
  }
}

extension PermissionActionTypeFromString on String {
  PermissionActionType toPermissionActionType() {
    switch (this) {
      case 'RESTORE':
        return PermissionActionType.restore;
    }
    throw Exception('$this is not known in enum PermissionActionType');
  }
}

class PutResourcePermissionOutput {
  /// <p/>
  final String? policy;

  PutResourcePermissionOutput({
    this.policy,
  });

  factory PutResourcePermissionOutput.fromJson(Map<String, dynamic> json) {
    return PutResourcePermissionOutput(
      policy: json['Policy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final policy = this.policy;
    return {
      if (policy != null) 'Policy': policy,
    };
  }
}

class RegisterApplicationOutput {
  /// The application registered with AWS Systems Manager for SAP.
  final Application? application;

  /// The ID of the operation.
  final String? operationId;

  RegisterApplicationOutput({
    this.application,
    this.operationId,
  });

  factory RegisterApplicationOutput.fromJson(Map<String, dynamic> json) {
    return RegisterApplicationOutput(
      application: json['Application'] != null
          ? Application.fromJson(json['Application'] as Map<String, dynamic>)
          : null,
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    final operationId = this.operationId;
    return {
      if (application != null) 'Application': application,
      if (operationId != null) 'OperationId': operationId,
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

class UpdateApplicationSettingsOutput {
  /// The update message.
  final String? message;

  /// The IDs of the operations.
  final List<String>? operationIds;

  UpdateApplicationSettingsOutput({
    this.message,
    this.operationIds,
  });

  factory UpdateApplicationSettingsOutput.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationSettingsOutput(
      message: json['Message'] as String?,
      operationIds: (json['OperationIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final message = this.message;
    final operationIds = this.operationIds;
    return {
      if (message != null) 'Message': message,
      if (operationIds != null) 'OperationIds': operationIds,
    };
  }
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

class ValidationException extends _s.GenericAwsException {
  ValidationException({String? type, String? message})
      : super(type: type, code: 'ValidationException', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConflictException': (type, message) =>
      ConflictException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
