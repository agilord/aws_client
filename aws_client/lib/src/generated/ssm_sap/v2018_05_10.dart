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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
      if (actionType != null) 'ActionType': actionType.value,
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
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
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

  /// Gets the details of a configuration check operation by specifying the
  /// operation ID.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [operationId] :
  /// The ID of the configuration check operation.
  Future<GetConfigurationCheckOperationOutput> getConfigurationCheckOperation({
    required String operationId,
  }) async {
    final $payload = <String, dynamic>{
      'OperationId': operationId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/get-configuration-check-operation',
      exceptionFnMap: _exceptionFns,
    );
    return GetConfigurationCheckOperationOutput.fromJson(response);
  }

  /// Gets the SAP HANA database of an application registered with AWS Systems
  /// Manager for SAP.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
      if (actionType != null) 'ActionType': actionType.value,
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
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

  /// Lists all configuration check types supported by AWS Systems Manager for
  /// SAP.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListConfigurationCheckDefinitionsOutput>
      listConfigurationCheckDefinitions({
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
      requestUri: '/list-configuration-check-definitions',
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationCheckDefinitionsOutput.fromJson(response);
  }

  /// Lists the configuration check operations performed by AWS Systems Manager
  /// for SAP.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [filters] :
  /// The filters of an operation.
  ///
  /// Parameter [listMode] :
  /// The mode for listing configuration check operations. Defaults to
  /// "LATEST_PER_CHECK".
  ///
  /// <ul>
  /// <li>
  /// LATEST_PER_CHECK - Will list the latest configuration check operation per
  /// check type.
  /// </li>
  /// <li>
  /// ALL_OPERATIONS - Will list all configuration check operations performed on
  /// the application.
  /// </li>
  /// </ul>
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListConfigurationCheckOperationsOutput>
      listConfigurationCheckOperations({
    required String applicationId,
    List<Filter>? filters,
    ConfigurationCheckOperationListingMode? listMode,
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
      if (listMode != null) 'ListMode': listMode.value,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-configuration-check-operations',
      exceptionFnMap: _exceptionFns,
    );
    return ListConfigurationCheckOperationsOutput.fromJson(response);
  }

  /// Lists the SAP HANA databases of an application registered with AWS Systems
  /// Manager for SAP.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
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

  /// Lists the sub-check results of a specified configuration check operation.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [operationId] :
  /// The ID of the configuration check operation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSubCheckResultsOutput> listSubCheckResults({
    required String operationId,
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
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-sub-check-results',
      exceptionFnMap: _exceptionFns,
    );
    return ListSubCheckResultsOutput.fromJson(response);
  }

  /// Lists the rules of a specified sub-check belonging to a configuration
  /// check operation.
  ///
  /// May throw [InternalServerException].
  /// May throw [ValidationException].
  ///
  /// Parameter [subCheckResultId] :
  /// The ID of the sub check result.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return with a single call. To retrieve
  /// the remaining results, make another call with the returned nextToken
  /// value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next page of results.
  Future<ListSubCheckRuleResultsOutput> listSubCheckRuleResults({
    required String subCheckResultId,
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
      'SubCheckResultId': subCheckResultId,
      if (maxResults != null) 'MaxResults': maxResults,
      if (nextToken != null) 'NextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/list-sub-check-rule-results',
      exceptionFnMap: _exceptionFns,
    );
    return ListSubCheckRuleResultsOutput.fromJson(response);
  }

  /// Lists all tags on an SAP HANA application and/or database registered with
  /// AWS Systems Manager for SAP.
  ///
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
      'ActionType': actionType.value,
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// Parameter [componentsInfo] :
  /// This is an optional parameter for component details to which the SAP ABAP
  /// application is attached, such as Web Dispatcher.
  ///
  /// This is an array of ApplicationComponent objects. You may input 0 to 5
  /// items.
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
    List<ComponentInfo>? componentsInfo,
    List<ApplicationCredential>? credentials,
    String? databaseArn,
    String? sapInstanceNumber,
    String? sid,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      'ApplicationType': applicationType.value,
      'Instances': instances,
      if (componentsInfo != null) 'ComponentsInfo': componentsInfo,
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
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

  /// Initiates configuration check operations against a specified application.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [configurationCheckIds] :
  /// The list of configuration checks to perform.
  Future<StartConfigurationChecksOutput> startConfigurationChecks({
    required String applicationId,
    List<ConfigurationCheckType>? configurationCheckIds,
  }) async {
    final $payload = <String, dynamic>{
      'ApplicationId': applicationId,
      if (configurationCheckIds != null)
        'ConfigurationCheckIds':
            configurationCheckIds.map((e) => e.value).toList(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/start-configuration-checks',
      exceptionFnMap: _exceptionFns,
    );
    return StartConfigurationChecksOutput.fromJson(response);
  }

  /// Request is an operation to stop an application.
  ///
  /// Parameter <code>ApplicationId</code> is required. Parameters
  /// <code>StopConnectedEntity</code> and
  /// <code>IncludeEc2InstanceShutdown</code> are optional.
  ///
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
        'StopConnectedEntity': stopConnectedEntity.value,
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
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ConflictException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
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
  /// May throw [ConflictException].
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [UnauthorizedException].
  /// May throw [ValidationException].
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

class GetConfigurationCheckOperationOutput {
  /// Returns the details of a configuration check operation.
  final ConfigurationCheckOperation? configurationCheckOperation;

  GetConfigurationCheckOperationOutput({
    this.configurationCheckOperation,
  });

  factory GetConfigurationCheckOperationOutput.fromJson(
      Map<String, dynamic> json) {
    return GetConfigurationCheckOperationOutput(
      configurationCheckOperation: json['ConfigurationCheckOperation'] != null
          ? ConfigurationCheckOperation.fromJson(
              json['ConfigurationCheckOperation'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationCheckOperation = this.configurationCheckOperation;
    return {
      if (configurationCheckOperation != null)
        'ConfigurationCheckOperation': configurationCheckOperation,
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
          ?.nonNulls
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
          ?.nonNulls
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

class ListConfigurationCheckDefinitionsOutput {
  /// The configuration check types supported by AWS Systems Manager for SAP.
  final List<ConfigurationCheckDefinition>? configurationChecks;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListConfigurationCheckDefinitionsOutput({
    this.configurationChecks,
    this.nextToken,
  });

  factory ListConfigurationCheckDefinitionsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListConfigurationCheckDefinitionsOutput(
      configurationChecks: (json['ConfigurationChecks'] as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationCheckDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationChecks = this.configurationChecks;
    final nextToken = this.nextToken;
    return {
      if (configurationChecks != null)
        'ConfigurationChecks': configurationChecks,
      if (nextToken != null) 'NextToken': nextToken,
    };
  }
}

class ListConfigurationCheckOperationsOutput {
  /// The configuration check operations performed by AWS Systems Manager for SAP.
  final List<ConfigurationCheckOperation>? configurationCheckOperations;

  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListConfigurationCheckOperationsOutput({
    this.configurationCheckOperations,
    this.nextToken,
  });

  factory ListConfigurationCheckOperationsOutput.fromJson(
      Map<String, dynamic> json) {
    return ListConfigurationCheckOperationsOutput(
      configurationCheckOperations: (json['ConfigurationCheckOperations']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationCheckOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['NextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configurationCheckOperations = this.configurationCheckOperations;
    final nextToken = this.nextToken;
    return {
      if (configurationCheckOperations != null)
        'ConfigurationCheckOperations': configurationCheckOperations,
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
          ?.nonNulls
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
          ?.nonNulls
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
          ?.nonNulls
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

class ListSubCheckResultsOutput {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The sub-check results of a configuration check operation.
  final List<SubCheckResult>? subCheckResults;

  ListSubCheckResultsOutput({
    this.nextToken,
    this.subCheckResults,
  });

  factory ListSubCheckResultsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubCheckResultsOutput(
      nextToken: json['NextToken'] as String?,
      subCheckResults: (json['SubCheckResults'] as List?)
          ?.nonNulls
          .map((e) => SubCheckResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final subCheckResults = this.subCheckResults;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (subCheckResults != null) 'SubCheckResults': subCheckResults,
    };
  }
}

class ListSubCheckRuleResultsOutput {
  /// The token to use to retrieve the next page of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The rule results of a sub-check belonging to a configuration check
  /// operation.
  final List<RuleResult>? ruleResults;

  ListSubCheckRuleResultsOutput({
    this.nextToken,
    this.ruleResults,
  });

  factory ListSubCheckRuleResultsOutput.fromJson(Map<String, dynamic> json) {
    return ListSubCheckRuleResultsOutput(
      nextToken: json['NextToken'] as String?,
      ruleResults: (json['RuleResults'] as List?)
          ?.nonNulls
          .map((e) => RuleResult.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final ruleResults = this.ruleResults;
    return {
      if (nextToken != null) 'NextToken': nextToken,
      if (ruleResults != null) 'RuleResults': ruleResults,
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

class StartConfigurationChecksOutput {
  /// The configuration check operations that were started.
  final List<ConfigurationCheckOperation>? configurationCheckOperations;

  StartConfigurationChecksOutput({
    this.configurationCheckOperations,
  });

  factory StartConfigurationChecksOutput.fromJson(Map<String, dynamic> json) {
    return StartConfigurationChecksOutput(
      configurationCheckOperations: (json['ConfigurationCheckOperations']
              as List?)
          ?.nonNulls
          .map((e) =>
              ConfigurationCheckOperation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final configurationCheckOperations = this.configurationCheckOperations;
    return {
      if (configurationCheckOperations != null)
        'ConfigurationCheckOperations': configurationCheckOperations,
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
          ?.nonNulls
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
      'BackintMode': backintMode.value,
      'EnsureNoBackupInProcess': ensureNoBackupInProcess,
    };
  }
}

class BackintMode {
  static const awsBackup = BackintMode._('AWSBackup');

  final String value;

  const BackintMode._(this.value);

  static const values = [awsBackup];

  static BackintMode fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => BackintMode._(value));

  @override
  bool operator ==(other) => other is BackintMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      credentialType:
          CredentialType.fromString((json['CredentialType'] as String?) ?? ''),
      databaseName: (json['DatabaseName'] as String?) ?? '',
      secretId: (json['SecretId'] as String?) ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final credentialType = this.credentialType;
    final databaseName = this.databaseName;
    final secretId = this.secretId;
    return {
      'CredentialType': credentialType.value,
      'DatabaseName': databaseName,
      'SecretId': secretId,
    };
  }
}

class CredentialType {
  static const admin = CredentialType._('ADMIN');

  final String value;

  const CredentialType._(this.value);

  static const values = [admin];

  static CredentialType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => CredentialType._(value));

  @override
  bool operator ==(other) => other is CredentialType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConnectedEntityType {
  static const dbms = ConnectedEntityType._('DBMS');

  final String value;

  const ConnectedEntityType._(this.value);

  static const values = [dbms];

  static ConnectedEntityType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConnectedEntityType._(value));

  @override
  bool operator ==(other) =>
      other is ConnectedEntityType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a configuration check operation that has been executed against an
/// application.
class ConfigurationCheckOperation {
  /// The ID of the application against which the configuration check was
  /// performed.
  final String? applicationId;

  /// A description of the configuration check that was performed.
  final String? configurationCheckDescription;

  /// The unique identifier of the configuration check that was performed.
  final ConfigurationCheckType? configurationCheckId;

  /// The name of the configuration check that was performed.
  final String? configurationCheckName;

  /// The time at which the configuration check operation completed.
  final DateTime? endTime;

  /// The unique identifier of the configuration check operation.
  final String? id;

  /// A summary of all the rule results, showing counts for each status type.
  final RuleStatusCounts? ruleStatusCounts;

  /// The time at which the configuration check operation started.
  final DateTime? startTime;

  /// The current status of the configuration check operation.
  final OperationStatus? status;

  /// A message providing additional details about the status of the configuration
  /// check operation.
  final String? statusMessage;

  ConfigurationCheckOperation({
    this.applicationId,
    this.configurationCheckDescription,
    this.configurationCheckId,
    this.configurationCheckName,
    this.endTime,
    this.id,
    this.ruleStatusCounts,
    this.startTime,
    this.status,
    this.statusMessage,
  });

  factory ConfigurationCheckOperation.fromJson(Map<String, dynamic> json) {
    return ConfigurationCheckOperation(
      applicationId: json['ApplicationId'] as String?,
      configurationCheckDescription:
          json['ConfigurationCheckDescription'] as String?,
      configurationCheckId: (json['ConfigurationCheckId'] as String?)
          ?.let(ConfigurationCheckType.fromString),
      configurationCheckName: json['ConfigurationCheckName'] as String?,
      endTime: timeStampFromJson(json['EndTime']),
      id: json['Id'] as String?,
      ruleStatusCounts: json['RuleStatusCounts'] != null
          ? RuleStatusCounts.fromJson(
              json['RuleStatusCounts'] as Map<String, dynamic>)
          : null,
      startTime: timeStampFromJson(json['StartTime']),
      status: (json['Status'] as String?)?.let(OperationStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final configurationCheckDescription = this.configurationCheckDescription;
    final configurationCheckId = this.configurationCheckId;
    final configurationCheckName = this.configurationCheckName;
    final endTime = this.endTime;
    final id = this.id;
    final ruleStatusCounts = this.ruleStatusCounts;
    final startTime = this.startTime;
    final status = this.status;
    final statusMessage = this.statusMessage;
    return {
      if (applicationId != null) 'ApplicationId': applicationId,
      if (configurationCheckDescription != null)
        'ConfigurationCheckDescription': configurationCheckDescription,
      if (configurationCheckId != null)
        'ConfigurationCheckId': configurationCheckId.value,
      if (configurationCheckName != null)
        'ConfigurationCheckName': configurationCheckName,
      if (endTime != null) 'EndTime': unixTimestampToJson(endTime),
      if (id != null) 'Id': id,
      if (ruleStatusCounts != null) 'RuleStatusCounts': ruleStatusCounts,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
    };
  }
}

class OperationStatus {
  static const inprogress = OperationStatus._('INPROGRESS');
  static const success = OperationStatus._('SUCCESS');
  static const error = OperationStatus._('ERROR');

  final String value;

  const OperationStatus._(this.value);

  static const values = [inprogress, success, error];

  static OperationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperationStatus._(value));

  @override
  bool operator ==(other) => other is OperationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConfigurationCheckType {
  static const sapCheck_01 = ConfigurationCheckType._('SAP_CHECK_01');
  static const sapCheck_02 = ConfigurationCheckType._('SAP_CHECK_02');
  static const sapCheck_03 = ConfigurationCheckType._('SAP_CHECK_03');

  final String value;

  const ConfigurationCheckType._(this.value);

  static const values = [sapCheck_01, sapCheck_02, sapCheck_03];

  static ConfigurationCheckType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationCheckType._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationCheckType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// A summary of rule results, providing counts for each status type.
class RuleStatusCounts {
  /// The number of rules that failed.
  final int? failed;

  /// The number of rules that returned informational results.
  final int? info;

  /// The number of rules that passed.
  final int? passed;

  /// The number of rules with unknown status.
  final int? unknown;

  /// The number of rules that returned warnings.
  final int? warning;

  RuleStatusCounts({
    this.failed,
    this.info,
    this.passed,
    this.unknown,
    this.warning,
  });

  factory RuleStatusCounts.fromJson(Map<String, dynamic> json) {
    return RuleStatusCounts(
      failed: json['Failed'] as int?,
      info: json['Info'] as int?,
      passed: json['Passed'] as int?,
      unknown: json['Unknown'] as int?,
      warning: json['Warning'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final info = this.info;
    final passed = this.passed;
    final unknown = this.unknown;
    final warning = this.warning;
    return {
      if (failed != null) 'Failed': failed,
      if (info != null) 'Info': info,
      if (passed != null) 'Passed': passed,
      if (unknown != null) 'Unknown': unknown,
      if (warning != null) 'Warning': warning,
    };
  }
}

/// An SAP application registered with AWS Systems Manager for SAP.
class Application {
  /// The Amazon Resource Name (ARN) of the Application Registry.
  final String? appRegistryArn;

  /// The Amazon Resource Name (ARN) of the application.
  final String? arn;

  /// The Amazon Resource Names of the associated AWS Systems Manager for SAP
  /// applications.
  final List<String>? associatedApplicationArns;

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
    this.associatedApplicationArns,
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
      associatedApplicationArns: (json['AssociatedApplicationArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      components: (json['Components'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      discoveryStatus: (json['DiscoveryStatus'] as String?)
          ?.let(ApplicationDiscoveryStatus.fromString),
      id: json['Id'] as String?,
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      status: (json['Status'] as String?)?.let(ApplicationStatus.fromString),
      statusMessage: json['StatusMessage'] as String?,
      type: (json['Type'] as String?)?.let(ApplicationType.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final appRegistryArn = this.appRegistryArn;
    final arn = this.arn;
    final associatedApplicationArns = this.associatedApplicationArns;
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
      if (associatedApplicationArns != null)
        'AssociatedApplicationArns': associatedApplicationArns,
      if (components != null) 'Components': components,
      if (discoveryStatus != null) 'DiscoveryStatus': discoveryStatus.value,
      if (id != null) 'Id': id,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (type != null) 'Type': type.value,
    };
  }
}

class ApplicationType {
  static const hana = ApplicationType._('HANA');
  static const sapAbap = ApplicationType._('SAP_ABAP');

  final String value;

  const ApplicationType._(this.value);

  static const values = [hana, sapAbap];

  static ApplicationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationType._(value));

  @override
  bool operator ==(other) => other is ApplicationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ApplicationStatus {
  static const activated = ApplicationStatus._('ACTIVATED');
  static const starting = ApplicationStatus._('STARTING');
  static const stopped = ApplicationStatus._('STOPPED');
  static const stopping = ApplicationStatus._('STOPPING');
  static const failed = ApplicationStatus._('FAILED');
  static const registering = ApplicationStatus._('REGISTERING');
  static const deleting = ApplicationStatus._('DELETING');
  static const unknown = ApplicationStatus._('UNKNOWN');

  final String value;

  const ApplicationStatus._(this.value);

  static const values = [
    activated,
    starting,
    stopped,
    stopping,
    failed,
    registering,
    deleting,
    unknown
  ];

  static ApplicationStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationStatus._(value));

  @override
  bool operator ==(other) => other is ApplicationStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ApplicationDiscoveryStatus {
  static const success = ApplicationDiscoveryStatus._('SUCCESS');
  static const registrationFailed =
      ApplicationDiscoveryStatus._('REGISTRATION_FAILED');
  static const refreshFailed = ApplicationDiscoveryStatus._('REFRESH_FAILED');
  static const registering = ApplicationDiscoveryStatus._('REGISTERING');
  static const deleting = ApplicationDiscoveryStatus._('DELETING');

  final String value;

  const ApplicationDiscoveryStatus._(this.value);

  static const values = [
    success,
    registrationFailed,
    refreshFailed,
    registering,
    deleting
  ];

  static ApplicationDiscoveryStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ApplicationDiscoveryStatus._(value));

  @override
  bool operator ==(other) =>
      other is ApplicationDiscoveryStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// This is information about the component of your SAP application, such as Web
/// Dispatcher.
class ComponentInfo {
  /// This string is the type of the component.
  ///
  /// Accepted value is <code>WD</code>.
  final ComponentType componentType;

  /// This is the Amazon EC2 instance on which your SAP component is running.
  ///
  /// Accepted values are alphanumeric.
  final String ec2InstanceId;

  /// This string is the SAP System ID of the component.
  ///
  /// Accepted values are alphanumeric.
  final String sid;

  ComponentInfo({
    required this.componentType,
    required this.ec2InstanceId,
    required this.sid,
  });

  Map<String, dynamic> toJson() {
    final componentType = this.componentType;
    final ec2InstanceId = this.ec2InstanceId;
    final sid = this.sid;
    return {
      'ComponentType': componentType.value,
      'Ec2InstanceId': ec2InstanceId,
      'Sid': sid,
    };
  }
}

class ComponentType {
  static const hana = ComponentType._('HANA');
  static const hanaNode = ComponentType._('HANA_NODE');
  static const abap = ComponentType._('ABAP');
  static const ascs = ComponentType._('ASCS');
  static const dialog = ComponentType._('DIALOG');
  static const webdisp = ComponentType._('WEBDISP');
  static const wd = ComponentType._('WD');
  static const ers = ComponentType._('ERS');

  final String value;

  const ComponentType._(this.value);

  static const values = [hana, hanaNode, abap, ascs, dialog, webdisp, wd, ers];

  static ComponentType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComponentType._(value));

  @override
  bool operator ==(other) => other is ComponentType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class PermissionActionType {
  static const restore = PermissionActionType._('RESTORE');

  final String value;

  const PermissionActionType._(this.value);

  static const values = [restore];

  static PermissionActionType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => PermissionActionType._(value));

  @override
  bool operator ==(other) =>
      other is PermissionActionType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the result of a single rule within a configuration check.
class RuleResult {
  /// A description of what the rule validates.
  final String? description;

  /// The unique identifier of the rule result.
  final String? id;

  /// A message providing details about the rule result.
  final String? message;

  /// Additional metadata associated with the rule result.
  final Map<String, String>? metadata;

  /// The status of the rule result.
  final RuleResultStatus? status;

  RuleResult({
    this.description,
    this.id,
    this.message,
    this.metadata,
    this.status,
  });

  factory RuleResult.fromJson(Map<String, dynamic> json) {
    return RuleResult(
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      message: json['Message'] as String?,
      metadata: (json['Metadata'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      status: (json['Status'] as String?)?.let(RuleResultStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final message = this.message;
    final metadata = this.metadata;
    final status = this.status;
    return {
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (message != null) 'Message': message,
      if (metadata != null) 'Metadata': metadata,
      if (status != null) 'Status': status.value,
    };
  }
}

class RuleResultStatus {
  static const passed = RuleResultStatus._('PASSED');
  static const failed = RuleResultStatus._('FAILED');
  static const warning = RuleResultStatus._('WARNING');
  static const info = RuleResultStatus._('INFO');
  static const unknown = RuleResultStatus._('UNKNOWN');

  final String value;

  const RuleResultStatus._(this.value);

  static const values = [passed, failed, warning, info, unknown];

  static RuleResultStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => RuleResultStatus._(value));

  @override
  bool operator ==(other) => other is RuleResultStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents the result of a sub-check within a configuration check operation.
class SubCheckResult {
  /// A description of what the sub-check validates.
  final String? description;

  /// The unique identifier of the sub-check result.
  final String? id;

  /// The name of the sub-check.
  final String? name;

  /// A list of references or documentation links related to the sub-check.
  final List<String>? references;

  SubCheckResult({
    this.description,
    this.id,
    this.name,
    this.references,
  });

  factory SubCheckResult.fromJson(Map<String, dynamic> json) {
    return SubCheckResult(
      description: json['Description'] as String?,
      id: json['Id'] as String?,
      name: json['Name'] as String?,
      references: (json['References'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final id = this.id;
    final name = this.name;
    final references = this.references;
    return {
      if (description != null) 'Description': description,
      if (id != null) 'Id': id,
      if (name != null) 'Name': name,
      if (references != null) 'References': references,
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
      status: (json['Status'] as String?)?.let(OperationStatus.fromString),
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
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (type != null) 'Type': type,
    };
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
      'Operator': operator.value,
      'Value': value,
    };
  }
}

class FilterOperator {
  static const equals = FilterOperator._('Equals');
  static const greaterThanOrEquals = FilterOperator._('GreaterThanOrEquals');
  static const lessThanOrEquals = FilterOperator._('LessThanOrEquals');

  final String value;

  const FilterOperator._(this.value);

  static const values = [equals, greaterThanOrEquals, lessThanOrEquals];

  static FilterOperator fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => FilterOperator._(value));

  @override
  bool operator ==(other) => other is FilterOperator && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      status: (json['Status'] as String?)?.let(OperationEventStatus.fromString),
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
      if (status != null) 'Status': status.value,
      if (statusMessage != null) 'StatusMessage': statusMessage,
      if (timestamp != null) 'Timestamp': unixTimestampToJson(timestamp),
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

class OperationEventStatus {
  static const inProgress = OperationEventStatus._('IN_PROGRESS');
  static const completed = OperationEventStatus._('COMPLETED');
  static const failed = OperationEventStatus._('FAILED');

  final String value;

  const OperationEventStatus._(this.value);

  static const values = [inProgress, completed, failed];

  static OperationEventStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperationEventStatus._(value));

  @override
  bool operator ==(other) =>
      other is OperationEventStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      databaseType:
          (json['DatabaseType'] as String?)?.let(DatabaseType.fromString),
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
      if (databaseType != null) 'DatabaseType': databaseType.value,
      if (tags != null) 'Tags': tags,
    };
  }
}

class DatabaseType {
  static const system = DatabaseType._('SYSTEM');
  static const tenant = DatabaseType._('TENANT');

  final String value;

  const DatabaseType._(this.value);

  static const values = [system, tenant];

  static DatabaseType fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => DatabaseType._(value));

  @override
  bool operator ==(other) => other is DatabaseType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ConfigurationCheckOperationListingMode {
  static const allOperations =
      ConfigurationCheckOperationListingMode._('ALL_OPERATIONS');
  static const latestPerCheck =
      ConfigurationCheckOperationListingMode._('LATEST_PER_CHECK');

  final String value;

  const ConfigurationCheckOperationListingMode._(this.value);

  static const values = [allOperations, latestPerCheck];

  static ConfigurationCheckOperationListingMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ConfigurationCheckOperationListingMode._(value));

  @override
  bool operator ==(other) =>
      other is ConfigurationCheckOperationListingMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

/// Represents a configuration check definition supported by AWS Systems Manager
/// for SAP.
class ConfigurationCheckDefinition {
  /// The list of SSMSAP application types that this configuration check can be
  /// evaluated against.
  final List<ApplicationType>? applicableApplicationTypes;

  /// A description of what the configuration check validates.
  final String? description;

  /// The unique identifier of the configuration check.
  final ConfigurationCheckType? id;

  /// The name of the configuration check.
  final String? name;

  ConfigurationCheckDefinition({
    this.applicableApplicationTypes,
    this.description,
    this.id,
    this.name,
  });

  factory ConfigurationCheckDefinition.fromJson(Map<String, dynamic> json) {
    return ConfigurationCheckDefinition(
      applicableApplicationTypes: (json['ApplicableApplicationTypes'] as List?)
          ?.nonNulls
          .map((e) => ApplicationType.fromString((e as String)))
          .toList(),
      description: json['Description'] as String?,
      id: (json['Id'] as String?)?.let(ConfigurationCheckType.fromString),
      name: json['Name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicableApplicationTypes = this.applicableApplicationTypes;
    final description = this.description;
    final id = this.id;
    final name = this.name;
    return {
      if (applicableApplicationTypes != null)
        'ApplicableApplicationTypes':
            applicableApplicationTypes.map((e) => e.value).toList(),
      if (description != null) 'Description': description,
      if (id != null) 'Id': id.value,
      if (name != null) 'Name': name,
    };
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
      componentType:
          (json['ComponentType'] as String?)?.let(ComponentType.fromString),
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
      if (componentType != null) 'ComponentType': componentType.value,
      if (tags != null) 'Tags': tags,
    };
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
      discoveryStatus: (json['DiscoveryStatus'] as String?)
          ?.let(ApplicationDiscoveryStatus.fromString),
      id: json['Id'] as String?,
      tags: (json['Tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['Type'] as String?)?.let(ApplicationType.fromString),
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
      if (discoveryStatus != null) 'DiscoveryStatus': discoveryStatus.value,
      if (id != null) 'Id': id,
      if (tags != null) 'Tags': tags,
      if (type != null) 'Type': type.value,
    };
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

  /// The Amazon Resource Names of the connected AWS Systems Manager for SAP
  /// components.
  final List<String>? connectedComponentArns;

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
    this.connectedComponentArns,
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
      connectedComponentArns: (json['ConnectedComponentArns'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      credentials: (json['Credentials'] as List?)
          ?.nonNulls
          .map((e) => ApplicationCredential.fromJson(e as Map<String, dynamic>))
          .toList(),
      databaseId: json['DatabaseId'] as String?,
      databaseName: json['DatabaseName'] as String?,
      databaseType:
          (json['DatabaseType'] as String?)?.let(DatabaseType.fromString),
      lastUpdated: timeStampFromJson(json['LastUpdated']),
      primaryHost: json['PrimaryHost'] as String?,
      sQLPort: json['SQLPort'] as int?,
      status: (json['Status'] as String?)?.let(DatabaseStatus.fromString),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final componentId = this.componentId;
    final connectedComponentArns = this.connectedComponentArns;
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
      if (connectedComponentArns != null)
        'ConnectedComponentArns': connectedComponentArns,
      if (credentials != null) 'Credentials': credentials,
      if (databaseId != null) 'DatabaseId': databaseId,
      if (databaseName != null) 'DatabaseName': databaseName,
      if (databaseType != null) 'DatabaseType': databaseType.value,
      if (lastUpdated != null) 'LastUpdated': unixTimestampToJson(lastUpdated),
      if (primaryHost != null) 'PrimaryHost': primaryHost,
      if (sQLPort != null) 'SQLPort': sQLPort,
      if (status != null) 'Status': status.value,
    };
  }
}

class DatabaseStatus {
  static const running = DatabaseStatus._('RUNNING');
  static const starting = DatabaseStatus._('STARTING');
  static const stopped = DatabaseStatus._('STOPPED');
  static const warning = DatabaseStatus._('WARNING');
  static const unknown = DatabaseStatus._('UNKNOWN');
  static const error = DatabaseStatus._('ERROR');
  static const stopping = DatabaseStatus._('STOPPING');

  final String value;

  const DatabaseStatus._(this.value);

  static const values = [
    running,
    starting,
    stopped,
    warning,
    unknown,
    error,
    stopping
  ];

  static DatabaseStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DatabaseStatus._(value));

  @override
  bool operator ==(other) => other is DatabaseStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      componentId: json['ComponentId'] as String?,
      componentType:
          (json['ComponentType'] as String?)?.let(ComponentType.fromString),
      databaseConnection: json['DatabaseConnection'] != null
          ? DatabaseConnection.fromJson(
              json['DatabaseConnection'] as Map<String, dynamic>)
          : null,
      databases: (json['Databases'] as List?)
          ?.nonNulls
          .map((e) => e as String)
          .toList(),
      hdbVersion: json['HdbVersion'] as String?,
      hosts: (json['Hosts'] as List?)
          ?.nonNulls
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
      status: (json['Status'] as String?)?.let(ComponentStatus.fromString),
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
      if (componentType != null) 'ComponentType': componentType.value,
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
      if (status != null) 'Status': status.value,
      if (systemNumber != null) 'SystemNumber': systemNumber,
    };
  }
}

class ComponentStatus {
  static const activated = ComponentStatus._('ACTIVATED');
  static const starting = ComponentStatus._('STARTING');
  static const stopped = ComponentStatus._('STOPPED');
  static const stopping = ComponentStatus._('STOPPING');
  static const running = ComponentStatus._('RUNNING');
  static const runningWithError = ComponentStatus._('RUNNING_WITH_ERROR');
  static const undefined = ComponentStatus._('UNDEFINED');

  final String value;

  const ComponentStatus._(this.value);

  static const values = [
    activated,
    starting,
    stopped,
    stopping,
    running,
    runningWithError,
    undefined
  ];

  static ComponentStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ComponentStatus._(value));

  @override
  bool operator ==(other) => other is ComponentStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      clusterStatus:
          (json['ClusterStatus'] as String?)?.let(ClusterStatus.fromString),
      enqueueReplication: json['EnqueueReplication'] as bool?,
      hsrOperationMode:
          (json['HsrOperationMode'] as String?)?.let(OperationMode.fromString),
      hsrReplicationMode: (json['HsrReplicationMode'] as String?)
          ?.let(ReplicationMode.fromString),
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
      if (clusterStatus != null) 'ClusterStatus': clusterStatus.value,
      if (enqueueReplication != null) 'EnqueueReplication': enqueueReplication,
      if (hsrOperationMode != null) 'HsrOperationMode': hsrOperationMode.value,
      if (hsrReplicationMode != null)
        'HsrReplicationMode': hsrReplicationMode.value,
      if (hsrTier != null) 'HsrTier': hsrTier,
    };
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
          ?.nonNulls
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
          ?.let(DatabaseConnectionMethod.fromString),
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
        'DatabaseConnectionMethod': databaseConnectionMethod.value,
    };
  }
}

class DatabaseConnectionMethod {
  static const direct = DatabaseConnectionMethod._('DIRECT');
  static const overlay = DatabaseConnectionMethod._('OVERLAY');

  final String value;

  const DatabaseConnectionMethod._(this.value);

  static const values = [direct, overlay];

  static DatabaseConnectionMethod fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => DatabaseConnectionMethod._(value));

  @override
  bool operator ==(other) =>
      other is DatabaseConnectionMethod && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      hostRole: (json['HostRole'] as String?)?.let(HostRole.fromString),
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
      if (hostRole != null) 'HostRole': hostRole.value,
      if (instanceId != null) 'InstanceId': instanceId,
      if (osVersion != null) 'OsVersion': osVersion,
    };
  }
}

class HostRole {
  static const leader = HostRole._('LEADER');
  static const worker = HostRole._('WORKER');
  static const standby = HostRole._('STANDBY');
  static const unknown = HostRole._('UNKNOWN');

  final String value;

  const HostRole._(this.value);

  static const values = [leader, worker, standby, unknown];

  static HostRole fromString(String value) => values
      .firstWhere((e) => e.value == value, orElse: () => HostRole._(value));

  @override
  bool operator ==(other) => other is HostRole && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
      allocationType:
          (json['AllocationType'] as String?)?.let(AllocationType.fromString),
      ipAddress: json['IpAddress'] as String?,
      primary: json['Primary'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final allocationType = this.allocationType;
    final ipAddress = this.ipAddress;
    final primary = this.primary;
    return {
      if (allocationType != null) 'AllocationType': allocationType.value,
      if (ipAddress != null) 'IpAddress': ipAddress,
      if (primary != null) 'Primary': primary,
    };
  }
}

class AllocationType {
  static const vpcSubnet = AllocationType._('VPC_SUBNET');
  static const elasticIp = AllocationType._('ELASTIC_IP');
  static const overlay = AllocationType._('OVERLAY');
  static const unknown = AllocationType._('UNKNOWN');

  final String value;

  const AllocationType._(this.value);

  static const values = [vpcSubnet, elasticIp, overlay, unknown];

  static AllocationType fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => AllocationType._(value));

  @override
  bool operator ==(other) => other is AllocationType && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ReplicationMode {
  static const primary = ReplicationMode._('PRIMARY');
  static const none = ReplicationMode._('NONE');
  static const sync = ReplicationMode._('SYNC');
  static const syncmem = ReplicationMode._('SYNCMEM');
  static const async = ReplicationMode._('ASYNC');

  final String value;

  const ReplicationMode._(this.value);

  static const values = [primary, none, sync, syncmem, async];

  static ReplicationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ReplicationMode._(value));

  @override
  bool operator ==(other) => other is ReplicationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class OperationMode {
  static const primary = OperationMode._('PRIMARY');
  static const logreplay = OperationMode._('LOGREPLAY');
  static const deltaDatashipping = OperationMode._('DELTA_DATASHIPPING');
  static const logreplayReadaccess = OperationMode._('LOGREPLAY_READACCESS');
  static const none = OperationMode._('NONE');

  final String value;

  const OperationMode._(this.value);

  static const values = [
    primary,
    logreplay,
    deltaDatashipping,
    logreplayReadaccess,
    none
  ];

  static OperationMode fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => OperationMode._(value));

  @override
  bool operator ==(other) => other is OperationMode && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
}

class ClusterStatus {
  static const online = ClusterStatus._('ONLINE');
  static const standby = ClusterStatus._('STANDBY');
  static const maintenance = ClusterStatus._('MAINTENANCE');
  static const offline = ClusterStatus._('OFFLINE');
  static const none = ClusterStatus._('NONE');

  final String value;

  const ClusterStatus._(this.value);

  static const values = [online, standby, maintenance, offline, none];

  static ClusterStatus fromString(String value) =>
      values.firstWhere((e) => e.value == value,
          orElse: () => ClusterStatus._(value));

  @override
  bool operator ==(other) => other is ClusterStatus && other.value == value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => value;
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
