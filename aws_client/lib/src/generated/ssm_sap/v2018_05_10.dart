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
  /// May throw [UnauthorizedException].
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
  /// May throw [UnauthorizedException].
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
  /// Parameter [filters] :
  /// The filter of name, value, and operator.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListApplicationsOutput> listApplications({
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
      if (filters != null) 'Filters': filters,
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
  /// May throw [UnauthorizedException].
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

  /// Returns a list of operations events.
  ///
  /// Available parameters include <code>OperationID</code>, as well as optional
  /// parameters <code>MaxResults</code>, <code>NextToken</code>, and
  /// <code>Filters</code>.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [operationId] :
  /// The ID of the operation.
  ///
  /// Parameter [filters] :
  /// Optionally specify filters to narrow the returned operation event items.
  ///
  /// Valid filter names include <code>status</code>, <code>resourceID</code>,
  /// and <code>resourceType</code>. The valid operator for all three filters is
  /// <code>Equals</code>.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// If you do not specify a value for <code>MaxResults</code>, the request
  /// returns 50 items per page by default.
  ///
  /// Parameter [nextToken] :
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  Future<ListOperationEventsOutput> listOperationEvents({
    required String operationId,
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
      'OperationId': operationId,
      if (filters != null) 'Filters': filters,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-operation-events',
      exceptionFnMap: _exceptionFns,
    );
    return ListOperationEventsOutput.fromJson(response);
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
  /// May throw [ResourceNotFoundException].
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
  /// Parameter [instances] :
  /// The Amazon EC2 instances on which your SAP application is running.
  ///
  /// Parameter [credentials] :
  /// The credentials of the SAP application.
  ///
  /// Parameter [databaseArn] :
  /// The Amazon Resource Name of the SAP HANA database.
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
    required List<String> instances,
    List<ApplicationCredential>? credentials,
    String? databaseArn,
    String? sapInstanceNumber,
    String? sid,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      'ApplicationType': applicationType.toValue(),
      'Instances': instances,
      if (credentials != null) 'Credentials': credentials,
      if (databaseArn != null) 'DatabaseArn': databaseArn,
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

  /// Request is an operation which starts an application.
  ///
  /// Parameter <code>ApplicationId</code> is required.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  Future<StartApplicationOutput> startApplication({
    required String applicationId,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-application',
      exceptionFnMap: _exceptionFns,
    );
    return StartApplicationOutput.fromJson(response);
  }

  /// Refreshes a registered application.
  ///
  /// May throw [UnauthorizedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  Future<StartApplicationRefreshOutput> startApplicationRefresh({
    required String applicationId,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-application-refresh',
      exceptionFnMap: _exceptionFns,
    );
    return StartApplicationRefreshOutput.fromJson(response);
  }

  /// Request is an operation to stop an application.
  ///
  /// Parameter <code>ApplicationId</code> is required. Parameters
  /// <code>StopConnectedEntity</code> and
  /// <code>IncludeEc2InstanceShutdown</code> are optional.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [includeEc2InstanceShutdown] :
  /// Boolean. If included and if set to <code>True</code>, the StopApplication
  /// operation will shut down the associated Amazon EC2 instance in addition to
  /// the application.
  ///
  /// Parameter [stopConnectedEntity] :
  /// Specify the <code>ConnectedEntityType</code>. Accepted type is
  /// <code>DBMS</code>.
  ///
  /// If this parameter is included, the connected DBMS (Database Management
  /// System) will be stopped.
  Future<StopApplicationOutput> stopApplication({
    required String applicationId,
    bool? includeEc2InstanceShutdown,
    ConnectedEntityType? stopConnectedEntity,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      if (includeEc2InstanceShutdown != null)
        'IncludeEc2InstanceShutdown': includeEc2InstanceShutdown,
      if (stopConnectedEntity != null)
        'StopConnectedEntity': stopConnectedEntity.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/stop-application',
      exceptionFnMap: _exceptionFns,
    );
    return StopApplicationOutput.fromJson(response);
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
  /// May throw [UnauthorizedException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [backint] :
  /// Installation of AWS Backint Agent for SAP HANA.
  ///
  /// Parameter [credentialsToAddOrUpdate] :
  /// The credentials to be added or updated.
  ///
  /// Parameter [credentialsToRemove] :
  /// The credentials to be removed.
  ///
  /// Parameter [databaseArn] :
  /// The Amazon Resource Name of the SAP HANA database that replaces the
  /// current SAP HANA connection with the SAP_ABAP application.
  Future<UpdateApplicationSettingsOutput> updateApplicationSettings({
    required String applicationId,
    BackintConfig? backint,
    List<ApplicationCredential>? credentialsToAddOrUpdate,
    List<ApplicationCredential>? credentialsToRemove,
    String? databaseArn,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      if (backint != null) 'Backint': backint,
      if (credentialsToAddOrUpdate != null)
        'CredentialsToAddOrUpdate': credentialsToAddOrUpdate,
      if (credentialsToRemove != null)
        'CredentialsToRemove': credentialsToRemove,
      if (databaseArn != null) 'DatabaseArn': databaseArn,
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

enum AllocationType {
  vpcSubnet,
  elasticIp,
  overlay,
  unknown,
}

extension AllocationTypeValueExtension on AllocationType {
  String toValue() {
    switch (this) {
      case AllocationType.vpcSubnet:
        return 'VPC_SUBNET';
      case AllocationType.elasticIp:
        return 'ELASTIC_IP';
      case AllocationType.overlay:
        return 'OVERLAY';
      case AllocationType.unknown:
        return 'UNKNOWN';
    }
  }
}

extension AllocationTypeFromString on String {
  AllocationType toAllocationType() {
    switch (this) {
      case 'VPC_SUBNET':
        return AllocationType.vpcSubnet;
      case 'ELASTIC_IP':
        return AllocationType.elasticIp;
      case 'OVERLAY':
        return AllocationType.overlay;
      case 'UNKNOWN':
        return AllocationType.unknown;
    }
    throw Exception('$this is not known in enum AllocationType');
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

  /// The latest discovery result for the application.
  final ApplicationDiscoveryStatus? discoveryStatus;

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
    this.discoveryStatus,
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
      discoveryStatus:
          (json['DiscoveryStatus'] as String?)?.toApplicationDiscoveryStatus(),
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
    final discoveryStatus = this.discoveryStatus;
    final id = this.id;
    final lastUpdated = this.lastUpdated;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (appRegistryArn != null) 'AppRegistryArn': appRegistryArn,
      if (arn != null) 'Arn': arn,
      if (components != null) 'Components': components,
      if (discoveryStatus != null) 'DiscoveryStatus': discoveryStatus.toValue(),
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

enum ApplicationDiscoveryStatus {
  success,
  registrationFailed,
  refreshFailed,
  registering,
  deleting,
}

extension ApplicationDiscoveryStatusValueExtension
    on ApplicationDiscoveryStatus {
  String toValue() {
    switch (this) {
      case ApplicationDiscoveryStatus.success:
        return 'SUCCESS';
      case ApplicationDiscoveryStatus.registrationFailed:
        return 'REGISTRATION_FAILED';
      case ApplicationDiscoveryStatus.refreshFailed:
        return 'REFRESH_FAILED';
      case ApplicationDiscoveryStatus.registering:
        return 'REGISTERING';
      case ApplicationDiscoveryStatus.deleting:
        return 'DELETING';
    }
  }
}

extension ApplicationDiscoveryStatusFromString on String {
  ApplicationDiscoveryStatus toApplicationDiscoveryStatus() {
    switch (this) {
      case 'SUCCESS':
        return ApplicationDiscoveryStatus.success;
      case 'REGISTRATION_FAILED':
        return ApplicationDiscoveryStatus.registrationFailed;
      case 'REFRESH_FAILED':
        return ApplicationDiscoveryStatus.refreshFailed;
      case 'REGISTERING':
        return ApplicationDiscoveryStatus.registering;
      case 'DELETING':
        return ApplicationDiscoveryStatus.deleting;
    }
    throw Exception('$this is not known in enum ApplicationDiscoveryStatus');
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

  /// The status of the latest discovery.
  final ApplicationDiscoveryStatus? discoveryStatus;

  /// The ID of the application.
  final String? id;

  /// The tags on the application.
  final Map<String, String>? tags;

  /// The type of the application.
  final ApplicationType? type;

  ApplicationSummary({
    this.arn,
    this.discoveryStatus,
    this.id,
    this.tags,
    this.type,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      arn: json['Arn'] as String?,
      discoveryStatus:
          (json['DiscoveryStatus'] as String?)?.toApplicationDiscoveryStatus(),
      id: json['Id'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.toApplicationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final discoveryStatus = this.discoveryStatus;
    final id = this.id;
    final tags = this.tags;
    final type = this.type;
    return {
      if (arn != null) 'Arn': arn,
      if (discoveryStatus != null) 'DiscoveryStatus': discoveryStatus.toValue(),
      if (id != null) 'Id': id,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.toValue(),
    };
  }
}

enum ApplicationType {
  hana,
  sapAbap,
}

extension ApplicationTypeValueExtension on ApplicationType {
  String toValue() {
    switch (this) {
      case ApplicationType.hana:
        return 'HANA';
      case ApplicationType.sapAbap:
        return 'SAP_ABAP';
    }
  }
}

extension ApplicationTypeFromString on String {
  ApplicationType toApplicationType() {
    switch (this) {
      case 'HANA':
        return ApplicationType.hana;
      case 'SAP_ABAP':
        return ApplicationType.sapAbap;
    }
    throw Exception('$this is not known in enum ApplicationType');
  }
}

/// Describes the properties of the associated host.
class AssociatedHost {
  /// The ID of the Amazon EC2 instance.
  final String? ec2InstanceId;

  /// The name of the host.
  final String? hostname;

  /// The IP addresses of the associated host.
  final List<IpAddressMember>? ipAddresses;

  /// The version of the operating system.
  final String? osVersion;

  AssociatedHost({
    this.ec2InstanceId,
    this.hostname,
    this.ipAddresses,
    this.osVersion,
  });

  factory AssociatedHost.fromJson(Map<String, dynamic> json) {
    return AssociatedHost(
      ec2InstanceId: json['Ec2InstanceId'] as String?,
      hostname: json['Hostname'] as String?,
      ipAddresses: (json['IpAddresses'] as List?)
          ?.whereNotNull()
          .map((e) => IpAddressMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      osVersion: json['OsVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceId = this.ec2InstanceId;
    final hostname = this.hostname;
    final ipAddresses = this.ipAddresses;
    final osVersion = this.osVersion;
    return {
      if (ec2InstanceId != null) 'Ec2InstanceId': ec2InstanceId,
      if (hostname != null) 'Hostname': hostname,
      if (ipAddresses != null) 'IpAddresses': ipAddresses,
      if (osVersion != null) 'OsVersion': osVersion,
    };
  }
}

/// Configuration parameters for AWS Backint Agent for SAP HANA. You can backup
/// your SAP HANA database with AWS Backup or Amazon S3.
class BackintConfig {
  /// AWS service for your database backup.
  final BackintMode backintMode;

  /// <p/>
  final bool ensureNoBackupInProcess;

  BackintConfig({
    required this.backintMode,
    required this.ensureNoBackupInProcess,
  });

  Map<String, dynamic> toJson() {
    final backintMode = this.backintMode;
    final ensureNoBackupInProcess = this.ensureNoBackupInProcess;
    return {
      'BackintMode': backintMode.toValue(),
      'EnsureNoBackupInProcess': ensureNoBackupInProcess,
    };
  }
}

enum BackintMode {
  awsBackup,
}

extension BackintModeValueExtension on BackintMode {
  String toValue() {
    switch (this) {
      case BackintMode.awsBackup:
        return 'AWSBackup';
    }
  }
}

extension BackintModeFromString on String {
  BackintMode toBackintMode() {
    switch (this) {
      case 'AWSBackup':
        return BackintMode.awsBackup;
    }
    throw Exception('$this is not known in enum BackintMode');
  }
}

enum ClusterStatus {
  online,
  standby,
  maintenance,
  offline,
  none,
}

extension ClusterStatusValueExtension on ClusterStatus {
  String toValue() {
    switch (this) {
      case ClusterStatus.online:
        return 'ONLINE';
      case ClusterStatus.standby:
        return 'STANDBY';
      case ClusterStatus.maintenance:
        return 'MAINTENANCE';
      case ClusterStatus.offline:
        return 'OFFLINE';
      case ClusterStatus.none:
        return 'NONE';
    }
  }
}

extension ClusterStatusFromString on String {
  ClusterStatus toClusterStatus() {
    switch (this) {
      case 'ONLINE':
        return ClusterStatus.online;
      case 'STANDBY':
        return ClusterStatus.standby;
      case 'MAINTENANCE':
        return ClusterStatus.maintenance;
      case 'OFFLINE':
        return ClusterStatus.offline;
      case 'NONE':
        return ClusterStatus.none;
    }
    throw Exception('$this is not known in enum ClusterStatus');
  }
}

/// The SAP component of your application.
class Component {
  /// The ID of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the component.
  final String? arn;

  /// The associated host of the component.
  final AssociatedHost? associatedHost;

  /// The child components of a highly available environment. For example, in a
  /// highly available SAP on AWS workload, the child component consists of the
  /// primary and secondar instances.
  final List<String>? childComponents;

  /// The ID of the component.
  final String? componentId;

  /// The type of the component.
  final ComponentType? componentType;

  /// The connection specifications for the database of the component.
  final DatabaseConnection? databaseConnection;

  /// The SAP HANA databases of the component.
  final List<String>? databases;

  /// The SAP HANA version of the component.
  final String? hdbVersion;

  /// The hosts of the component.
  final List<Host>? hosts;

  /// The time at which the component was last updated.
  final DateTime? lastUpdated;

  /// The parent component of a highly available environment. For example, in a
  /// highly available SAP on AWS workload, the parent component consists of the
  /// entire setup, including the child components.
  final String? parentComponent;

  /// The primary host of the component.
  final String? primaryHost;

  /// Details of the SAP HANA system replication for the component.
  final Resilience? resilience;

  /// The SAP feature of the component.
  final String? sapFeature;

  /// The hostname of the component.
  final String? sapHostname;

  /// The kernel version of the component.
  final String? sapKernelVersion;

  /// The SAP System Identifier of the application component.
  final String? sid;

  /// The status of the component.
  ///
  /// <ul>
  /// <li>
  /// ACTIVATED - this status has been deprecated.
  /// </li>
  /// <li>
  /// STARTING - the component is in the process of being started.
  /// </li>
  /// <li>
  /// STOPPED - the component is not running.
  /// </li>
  /// <li>
  /// STOPPING - the component is in the process of being stopped.
  /// </li>
  /// <li>
  /// RUNNING - the component is running.
  /// </li>
  /// <li>
  /// RUNNING_WITH_ERROR - one or more child component(s) of the parent component
  /// is not running. Call <a
  /// href="https://docs.aws.amazon.com/ssmsap/latest/APIReference/API_GetComponent.html">
  /// <code>GetComponent</code> </a> to review the status of each child component.
  /// </li>
  /// <li>
  /// UNDEFINED - AWS Systems Manager for SAP cannot provide the component status
  /// based on the discovered information. Verify your SAP application.
  /// </li>
  /// </ul>
  final ComponentStatus? status;

  /// The SAP system number of the application component.
  final String? systemNumber;

  Component({
    this.applicationId,
    this.arn,
    this.associatedHost,
    this.childComponents,
    this.componentId,
    this.componentType,
    this.databaseConnection,
    this.databases,
    this.hdbVersion,
    this.hosts,
    this.lastUpdated,
    this.parentComponent,
    this.primaryHost,
    this.resilience,
    this.sapFeature,
    this.sapHostname,
    this.sapKernelVersion,
    this.sid,
    this.status,
    this.systemNumber,
  });

  factory Component.fromJson(Map<String, dynamic> json) {
    return Component(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      associatedHost: json['AssociatedHost'] != null
          ? AssociatedHost.fromJson(
              json['AssociatedHost'] as Map<String, dynamic>)
          : null,
      childComponents: (json['ChildComponents'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      componentId: json['ComponentId'] as String?,
      componentType: (json['ComponentType'] as String?)?.toComponentType(),
      databaseConnection: json['DatabaseConnection'] != null
          ? DatabaseConnection.fromJson(
              json['DatabaseConnection'] as Map<String, dynamic>)
          : null,
      databases: (json['Databases'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      hdbVersion: json['HdbVersion'] as String?,
      hosts: (json['Hosts'] as List?)
          ?.whereNotNull()
          .map((e) => Host.fromJson(e as Map<String, dynamic>))
          .toList(),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      parentComponent: json['ParentComponent'] as String?,
      primaryHost: json['PrimaryHost'] as String?,
      resilience: json['Resilience'] != null
          ? Resilience.fromJson(json['Resilience'] as Map<String, dynamic>)
          : null,
      sapFeature: json['SapFeature'] as String?,
      sapHostname: json['SapHostname'] as String?,
      sapKernelVersion: json['SapKernelVersion'] as String?,
      sid: json['Sid'] as String?,
      status: (json['Status'] as String?)?.toComponentStatus(),
      systemNumber: json['SystemNumber'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final associatedHost = this.associatedHost;
    final childComponents = this.childComponents;
    final componentId = this.componentId;
    final componentType = this.componentType;
    final databaseConnection = this.databaseConnection;
    final databases = this.databases;
    final hdbVersion = this.hdbVersion;
    final hosts = this.hosts;
    final lastUpdated = this.lastUpdated;
    final parentComponent = this.parentComponent;
    final primaryHost = this.primaryHost;
    final resilience = this.resilience;
    final sapFeature = this.sapFeature;
    final sapHostname = this.sapHostname;
    final sapKernelVersion = this.sapKernelVersion;
    final sid = this.sid;
    final status = this.status;
    final systemNumber = this.systemNumber;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (associatedHost != null) 'AssociatedHost': associatedHost,
      if (childComponents != null) 'ChildComponents': childComponents,
      if (componentId != null) 'ComponentId': componentId,
      if (componentType != null) 'ComponentType': componentType.toValue(),
      if (databaseConnection != null) 'DatabaseConnection': databaseConnection,
      if (databases != null) 'Databases': databases,
      if (hdbVersion != null) 'HdbVersion': hdbVersion,
      if (hosts != null) 'Hosts': hosts,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (parentComponent != null) 'ParentComponent': parentComponent,
      if (primaryHost != null) 'PrimaryHost': primaryHost,
      if (resilience != null) 'Resilience': resilience,
      if (sapFeature != null) 'SapFeature': sapFeature,
      if (sapHostname != null) 'SapHostname': sapHostname,
      if (sapKernelVersion != null) 'SapKernelVersion': sapKernelVersion,
      if (sid != null) 'Sid': sid,
      if (status != null) 'Status': status.toValue(),
      if (systemNumber != null) 'SystemNumber': systemNumber,
    };
  }
}

enum ComponentStatus {
  activated,
  starting,
  stopped,
  stopping,
  running,
  runningWithError,
  undefined,
}

extension ComponentStatusValueExtension on ComponentStatus {
  String toValue() {
    switch (this) {
      case ComponentStatus.activated:
        return 'ACTIVATED';
      case ComponentStatus.starting:
        return 'STARTING';
      case ComponentStatus.stopped:
        return 'STOPPED';
      case ComponentStatus.stopping:
        return 'STOPPING';
      case ComponentStatus.running:
        return 'RUNNING';
      case ComponentStatus.runningWithError:
        return 'RUNNING_WITH_ERROR';
      case ComponentStatus.undefined:
        return 'UNDEFINED';
    }
  }
}

extension ComponentStatusFromString on String {
  ComponentStatus toComponentStatus() {
    switch (this) {
      case 'ACTIVATED':
        return ComponentStatus.activated;
      case 'STARTING':
        return ComponentStatus.starting;
      case 'STOPPED':
        return ComponentStatus.stopped;
      case 'STOPPING':
        return ComponentStatus.stopping;
      case 'RUNNING':
        return ComponentStatus.running;
      case 'RUNNING_WITH_ERROR':
        return ComponentStatus.runningWithError;
      case 'UNDEFINED':
        return ComponentStatus.undefined;
    }
    throw Exception('$this is not known in enum ComponentStatus');
  }
}

/// The summary of the component.
class ComponentSummary {
  /// The ID of the application.
  final String? applicationId;

  /// The Amazon Resource Name (ARN) of the component summary.
  final String? arn;

  /// The ID of the component.
  final String? componentId;

  /// The type of the component.
  final ComponentType? componentType;

  /// The tags of the component.
  final Map<String, String>? tags;

  ComponentSummary({
    this.applicationId,
    this.arn,
    this.componentId,
    this.componentType,
    this.tags,
  });

  factory ComponentSummary.fromJson(Map<String, dynamic> json) {
    return ComponentSummary(
      applicationId: json['ApplicationId'] as String?,
      arn: json['Arn'] as String?,
      componentId: json['ComponentId'] as String?,
      componentType: (json['ComponentType'] as String?)?.toComponentType(),
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final componentId = this.componentId;
    final componentType = this.componentType;
    final tags = this.tags;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (arn != null) 'Arn': arn,
      if (componentId != null) 'ComponentId': componentId,
      if (componentType != null) 'ComponentType': componentType.toValue(),
      if (tags != null) 'Tags': tags,
    };
  }
}

enum ComponentType {
  hana,
  hanaNode,
  abap,
  ascs,
  dialog,
  webdisp,
  wd,
  ers,
}

extension ComponentTypeValueExtension on ComponentType {
  String toValue() {
    switch (this) {
      case ComponentType.hana:
        return 'HANA';
      case ComponentType.hanaNode:
        return 'HANA_NODE';
      case ComponentType.abap:
        return 'ABAP';
      case ComponentType.ascs:
        return 'ASCS';
      case ComponentType.dialog:
        return 'DIALOG';
      case ComponentType.webdisp:
        return 'WEBDISP';
      case ComponentType.wd:
        return 'WD';
      case ComponentType.ers:
        return 'ERS';
    }
  }
}

extension ComponentTypeFromString on String {
  ComponentType toComponentType() {
    switch (this) {
      case 'HANA':
        return ComponentType.hana;
      case 'HANA_NODE':
        return ComponentType.hanaNode;
      case 'ABAP':
        return ComponentType.abap;
      case 'ASCS':
        return ComponentType.ascs;
      case 'DIALOG':
        return ComponentType.dialog;
      case 'WEBDISP':
        return ComponentType.webdisp;
      case 'WD':
        return ComponentType.wd;
      case 'ERS':
        return ComponentType.ers;
    }
    throw Exception('$this is not known in enum ComponentType');
  }
}

enum ConnectedEntityType {
  dbms,
}

extension ConnectedEntityTypeValueExtension on ConnectedEntityType {
  String toValue() {
    switch (this) {
      case ConnectedEntityType.dbms:
        return 'DBMS';
    }
  }
}

extension ConnectedEntityTypeFromString on String {
  ConnectedEntityType toConnectedEntityType() {
    switch (this) {
      case 'DBMS':
        return ConnectedEntityType.dbms;
    }
    throw Exception('$this is not known in enum ConnectedEntityType');
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

/// The connection specifications for the database.
class DatabaseConnection {
  /// The IP address for connection.
  final String? connectionIp;

  /// The Amazon Resource Name of the connected SAP HANA database.
  final String? databaseArn;

  /// The method of connection.
  final DatabaseConnectionMethod? databaseConnectionMethod;

  DatabaseConnection({
    this.connectionIp,
    this.databaseArn,
    this.databaseConnectionMethod,
  });

  factory DatabaseConnection.fromJson(Map<String, dynamic> json) {
    return DatabaseConnection(
      connectionIp: json['ConnectionIp'] as String?,
      databaseArn: json['DatabaseArn'] as String?,
      databaseConnectionMethod: (json['DatabaseConnectionMethod'] as String?)
          ?.toDatabaseConnectionMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final connectionIp = this.connectionIp;
    final databaseArn = this.databaseArn;
    final databaseConnectionMethod = this.databaseConnectionMethod;
    return {
      if (connectionIp != null) 'ConnectionIp': connectionIp,
      if (databaseArn != null) 'DatabaseArn': databaseArn,
      if (databaseConnectionMethod != null)
        'DatabaseConnectionMethod': databaseConnectionMethod.toValue(),
    };
  }
}

enum DatabaseConnectionMethod {
  direct,
  overlay,
}

extension DatabaseConnectionMethodValueExtension on DatabaseConnectionMethod {
  String toValue() {
    switch (this) {
      case DatabaseConnectionMethod.direct:
        return 'DIRECT';
      case DatabaseConnectionMethod.overlay:
        return 'OVERLAY';
    }
  }
}

extension DatabaseConnectionMethodFromString on String {
  DatabaseConnectionMethod toDatabaseConnectionMethod() {
    switch (this) {
      case 'DIRECT':
        return DatabaseConnectionMethod.direct;
      case 'OVERLAY':
        return DatabaseConnectionMethod.overlay;
    }
    throw Exception('$this is not known in enum DatabaseConnectionMethod');
  }
}

enum DatabaseStatus {
  running,
  starting,
  stopped,
  warning,
  unknown,
  error,
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
      case DatabaseStatus.error:
        return 'ERROR';
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
      case 'ERROR':
        return DatabaseStatus.error;
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

  /// The tags of a component.
  final Map<String, String>? tags;

  GetComponentOutput({
    this.component,
    this.tags,
  });

  factory GetComponentOutput.fromJson(Map<String, dynamic> json) {
    return GetComponentOutput(
      component: json['Component'] != null
          ? Component.fromJson(json['Component'] as Map<String, dynamic>)
          : null,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final component = this.component;
    final tags = this.tags;
    return {
      if (component != null) 'Component': component,
      if (tags != null) 'Tags': tags,
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
  /// The ID of Amazon EC2 instance.
  final String? eC2InstanceId;

  /// The IP address of the Dedicated Host.
  final String? hostIp;

  /// The name of the Dedicated Host.
  final String? hostName;

  /// The role of the Dedicated Host.
  final HostRole? hostRole;

  /// The instance ID of the instance on the Dedicated Host.
  final String? instanceId;

  /// The version of the operating system.
  final String? osVersion;

  Host({
    this.eC2InstanceId,
    this.hostIp,
    this.hostName,
    this.hostRole,
    this.instanceId,
    this.osVersion,
  });

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      eC2InstanceId: json['EC2InstanceId'] as String?,
      hostIp: json['HostIp'] as String?,
      hostName: json['HostName'] as String?,
      hostRole: (json['HostRole'] as String?)?.toHostRole(),
      instanceId: json['InstanceId'] as String?,
      osVersion: json['OsVersion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final eC2InstanceId = this.eC2InstanceId;
    final hostIp = this.hostIp;
    final hostName = this.hostName;
    final hostRole = this.hostRole;
    final instanceId = this.instanceId;
    final osVersion = this.osVersion;
    return {
      if (eC2InstanceId != null) 'EC2InstanceId': eC2InstanceId,
      if (hostIp != null) 'HostIp': hostIp,
      if (hostName != null) 'HostName': hostName,
      if (hostRole != null) 'HostRole': hostRole.toValue(),
      if (instanceId != null) 'InstanceId': instanceId,
      if (osVersion != null) 'OsVersion': osVersion,
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

/// Provides information of the IP address.
class IpAddressMember {
  /// The type of allocation for the IP address.
  final AllocationType? allocationType;

  /// The IP address.
  final String? ipAddress;

  /// The primary IP address.
  final bool? primary;

  IpAddressMember({
    this.allocationType,
    this.ipAddress,
    this.primary,
  });

  factory IpAddressMember.fromJson(Map<String, dynamic> json) {
    return IpAddressMember(
      allocationType: (json['AllocationType'] as String?)?.toAllocationType(),
      ipAddress: json['IpAddress'] as String?,
      primary: json['Primary'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationType = this.allocationType;
    final ipAddress = this.ipAddress;
    final primary = this.primary;
    return {
      if (allocationType != null) 'AllocationType': allocationType.toValue(),
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (primary != null) 'Primary': primary,
    };
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

class ListOperationEventsOutput {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// A returned list of operation events that meet the filter criteria.
  final List<OperationEvent>? operationEvents;

  ListOperationEventsOutput({
    this.nextToken,
    this.operationEvents,
  });

  factory ListOperationEventsOutput.fromJson(Map<String, dynamic> json) {
    return ListOperationEventsOutput(
      nextToken: json['NextToken'] as String?,
      operationEvents: (json['OperationEvents'] as List?)
          ?.whereNotNull()
          .map((e) => OperationEvent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final operationEvents = this.operationEvents;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (operationEvents != null) 'OperationEvents': operationEvents,
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

/// An operation event returns details for an operation, including key
/// milestones which can be used to monitor and track operations in progress.
///
/// Operation events contain:
///
/// <ul>
/// <li>
/// Description string
/// </li>
/// <li>
/// Resource, including its ARN and type
/// </li>
/// <li>
/// Status
/// </li>
/// <li>
/// StatusMessage string
/// </li>
/// <li>
/// TimeStamp
/// </li>
/// </ul>
/// Operation event examples include StartApplication or StopApplication.
class OperationEvent {
  /// A description of the operation event. For example, "Stop the EC2 instance
  /// i-abcdefgh987654321".
  final String? description;

  /// The resource involved in the operations event.
  ///
  /// Contains <code>ResourceArn</code> ARN and <code>ResourceType</code>.
  final Resource? resource;

  /// The status of the operation event. The possible statuses are:
  /// <code>IN_PROGRESS</code>, <code>COMPLETED</code>, and <code>FAILED</code>.
  final OperationEventStatus? status;

  /// The status message relating to a specific operation event.
  final String? statusMessage;

  /// The timestamp of the specified operation event.
  final DateTime? timestamp;

  OperationEvent({
    this.description,
    this.resource,
    this.status,
    this.statusMessage,
    this.timestamp,
  });

  factory OperationEvent.fromJson(Map<String, dynamic> json) {
    return OperationEvent(
      description: json['Description'] as String?,
      resource: json['Resource'] != null
          ? Resource.fromJson(json['Resource'] as Map<String, dynamic>)
          : null,
      status: (json['Status'] as String?)?.toOperationEventStatus(),
      statusMessage: json['StatusMessage'] as String?,
      timestamp: timeStampFromJson(json['Timestamp']),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final resource = this.resource;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final timestamp = this.timestamp;
    return {
      if (description != null) 'Description': description,
      if (resource != null) 'Resource': resource,
      if (status != null) 'Status': status.toValue(),
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
    };
  }
}

enum OperationEventStatus {
  inProgress,
  completed,
  failed,
}

extension OperationEventStatusValueExtension on OperationEventStatus {
  String toValue() {
    switch (this) {
      case OperationEventStatus.inProgress:
        return 'IN_PROGRESS';
      case OperationEventStatus.completed:
        return 'COMPLETED';
      case OperationEventStatus.failed:
        return 'FAILED';
    }
  }
}

extension OperationEventStatusFromString on String {
  OperationEventStatus toOperationEventStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return OperationEventStatus.inProgress;
      case 'COMPLETED':
        return OperationEventStatus.completed;
      case 'FAILED':
        return OperationEventStatus.failed;
    }
    throw Exception('$this is not known in enum OperationEventStatus');
  }
}

enum OperationMode {
  primary,
  logreplay,
  deltaDatashipping,
  logreplayReadaccess,
  none,
}

extension OperationModeValueExtension on OperationMode {
  String toValue() {
    switch (this) {
      case OperationMode.primary:
        return 'PRIMARY';
      case OperationMode.logreplay:
        return 'LOGREPLAY';
      case OperationMode.deltaDatashipping:
        return 'DELTA_DATASHIPPING';
      case OperationMode.logreplayReadaccess:
        return 'LOGREPLAY_READACCESS';
      case OperationMode.none:
        return 'NONE';
    }
  }
}

extension OperationModeFromString on String {
  OperationMode toOperationMode() {
    switch (this) {
      case 'PRIMARY':
        return OperationMode.primary;
      case 'LOGREPLAY':
        return OperationMode.logreplay;
      case 'DELTA_DATASHIPPING':
        return OperationMode.deltaDatashipping;
      case 'LOGREPLAY_READACCESS':
        return OperationMode.logreplayReadaccess;
      case 'NONE':
        return OperationMode.none;
    }
    throw Exception('$this is not known in enum OperationMode');
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

enum ReplicationMode {
  primary,
  none,
  sync,
  syncmem,
  async,
}

extension ReplicationModeValueExtension on ReplicationMode {
  String toValue() {
    switch (this) {
      case ReplicationMode.primary:
        return 'PRIMARY';
      case ReplicationMode.none:
        return 'NONE';
      case ReplicationMode.sync:
        return 'SYNC';
      case ReplicationMode.syncmem:
        return 'SYNCMEM';
      case ReplicationMode.async:
        return 'ASYNC';
    }
  }
}

extension ReplicationModeFromString on String {
  ReplicationMode toReplicationMode() {
    switch (this) {
      case 'PRIMARY':
        return ReplicationMode.primary;
      case 'NONE':
        return ReplicationMode.none;
      case 'SYNC':
        return ReplicationMode.sync;
      case 'SYNCMEM':
        return ReplicationMode.syncmem;
      case 'ASYNC':
        return ReplicationMode.async;
    }
    throw Exception('$this is not known in enum ReplicationMode');
  }
}

/// Details of the SAP HANA system replication for the instance.
class Resilience {
  /// The cluster status of the component.
  final ClusterStatus? clusterStatus;

  /// Indicates if or not enqueue replication is enabled for the ASCS component.
  final bool? enqueueReplication;

  /// The operation mode of the component.
  final OperationMode? hsrOperationMode;

  /// The replication mode of the component.
  final ReplicationMode? hsrReplicationMode;

  /// The tier of the component.
  final String? hsrTier;

  Resilience({
    this.clusterStatus,
    this.enqueueReplication,
    this.hsrOperationMode,
    this.hsrReplicationMode,
    this.hsrTier,
  });

  factory Resilience.fromJson(Map<String, dynamic> json) {
    return Resilience(
      clusterStatus: (json['ClusterStatus'] as String?)?.toClusterStatus(),
      enqueueReplication: json['EnqueueReplication'] as bool?,
      hsrOperationMode:
          (json['HsrOperationMode'] as String?)?.toOperationMode(),
      hsrReplicationMode:
          (json['HsrReplicationMode'] as String?)?.toReplicationMode(),
      hsrTier: json['HsrTier'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final clusterStatus = this.clusterStatus;
    final enqueueReplication = this.enqueueReplication;
    final hsrOperationMode = this.hsrOperationMode;
    final hsrReplicationMode = this.hsrReplicationMode;
    final hsrTier = this.hsrTier;
    return {
      if (clusterStatus != null) 'ClusterStatus': clusterStatus.toValue(),
      if (enqueueReplication != null) 'EnqueueReplication': enqueueReplication,
      if (hsrOperationMode != null)
        'HsrOperationMode': hsrOperationMode.toValue(),
      if (hsrReplicationMode != null)
        'HsrReplicationMode': hsrReplicationMode.toValue(),
      if (hsrTier != null) 'HsrTier': hsrTier,
    };
  }
}

/// The resource contains a <code>ResourceArn</code> and the
/// <code>ResourceType</code>.
class Resource {
  /// The Amazon Resource Name (ARN) of the source resource.
  ///
  /// Example of <code>ResourceArn</code>:
  /// "<code>arn:aws:ec2:us-east-1:111111111111:instance/i-abcdefgh987654321</code>"
  final String? resourceArn;

  /// The resource type.
  ///
  /// Example of <code>ResourceType</code>:
  /// "<code>AWS::SystemsManagerSAP::Component</code>" or
  /// "<code>AWS::EC2::Instance</code>".
  final String? resourceType;

  Resource({
    this.resourceArn,
    this.resourceType,
  });

  factory Resource.fromJson(Map<String, dynamic> json) {
    return Resource(
      resourceArn: json['ResourceArn'] as String?,
      resourceType: json['ResourceType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final resourceArn = this.resourceArn;
    final resourceType = this.resourceType;
    return {
      if (resourceArn != null) 'ResourceArn': resourceArn,
      if (resourceType != null) 'ResourceType': resourceType,
    };
  }
}

class StartApplicationOutput {
  /// The ID of the operation.
  final String? operationId;

  StartApplicationOutput({
    this.operationId,
  });

  factory StartApplicationOutput.fromJson(Map<String, dynamic> json) {
    return StartApplicationOutput(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class StartApplicationRefreshOutput {
  /// The ID of the operation.
  final String? operationId;

  StartApplicationRefreshOutput({
    this.operationId,
  });

  factory StartApplicationRefreshOutput.fromJson(Map<String, dynamic> json) {
    return StartApplicationRefreshOutput(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
      if (operationId != null) 'OperationId': operationId,
    };
  }
}

class StopApplicationOutput {
  /// The ID of the operation.
  final String? operationId;

  StopApplicationOutput({
    this.operationId,
  });

  factory StopApplicationOutput.fromJson(Map<String, dynamic> json) {
    return StopApplicationOutput(
      operationId: json['OperationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final operationId = this.operationId;
    return {
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

class UnauthorizedException extends _s.GenericAwsException {
  UnauthorizedException({String? type, String? message})
      : super(type: type, code: 'UnauthorizedException', message: message);
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
  'UnauthorizedException': (type, message) =>
      UnauthorizedException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
