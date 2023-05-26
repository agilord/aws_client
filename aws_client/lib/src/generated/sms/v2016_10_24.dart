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

/// <important>
/// <b>Product update</b>
///
/// We recommend <a
/// href="http://aws.amazon.com/application-migration-service">Amazon Web
/// Services Application Migration Service</a> (Amazon Web Services MGN) as the
/// primary migration service for lift-and-shift migrations. If Amazon Web
/// Services MGN is unavailable in a specific Amazon Web Services Region, you
/// can use the Server Migration Service APIs through March 2023.
/// </important>
/// Server Migration Service (Server Migration Service) makes it easier and
/// faster for you to migrate your on-premises workloads to Amazon Web Services.
/// To learn more about Server Migration Service, see the following resources:
///
/// <ul>
/// <li>
/// <a href="http://aws.amazon.com/server-migration-service/">Server Migration
/// Service product page</a>
/// </li>
/// <li>
/// <a
/// href="https://docs.aws.amazon.com/server-migration-service/latest/userguide/">Server
/// Migration Service User Guide</a>
/// </li>
/// </ul>
class Sms {
  final _s.JsonProtocol _protocol;
  Sms({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sms',
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

  /// Creates an application. An application consists of one or more server
  /// groups. Each server group contain one or more servers.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [clientToken] :
  /// A unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of application creation.
  ///
  /// Parameter [description] :
  /// The description of the new application
  ///
  /// Parameter [name] :
  /// The name of the new application.
  ///
  /// Parameter [roleName] :
  /// The name of the service role in the customer's account to be used by
  /// Server Migration Service.
  ///
  /// Parameter [serverGroups] :
  /// The server groups to include in the application.
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the application.
  Future<CreateAppResponse> createApp({
    String? clientToken,
    String? description,
    String? name,
    String? roleName,
    List<ServerGroup>? serverGroups,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.CreateApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (clientToken != null) 'clientToken': clientToken,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
        if (roleName != null) 'roleName': roleName,
        if (serverGroups != null) 'serverGroups': serverGroups,
        if (tags != null) 'tags': tags,
      },
    );

    return CreateAppResponse.fromJson(jsonResponse.body);
  }

  /// Creates a replication job. The replication job schedules periodic
  /// replication runs to replicate your server to Amazon Web Services. Each
  /// replication run creates an Amazon Machine Image (AMI).
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ServerCannotBeReplicatedException].
  /// May throw [ReplicationJobAlreadyExistsException].
  /// May throw [NoConnectorsAvailableException].
  /// May throw [InternalError].
  /// May throw [TemporarilyUnavailableException].
  ///
  /// Parameter [seedReplicationTime] :
  /// The seed replication time.
  ///
  /// Parameter [serverId] :
  /// The ID of the server.
  ///
  /// Parameter [description] :
  /// The description of the replication job.
  ///
  /// Parameter [encrypted] :
  /// Indicates whether the replication job produces encrypted AMIs.
  ///
  /// Parameter [frequency] :
  /// The time between consecutive replication runs, in hours.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key for replication jobs that produce encrypted AMIs.
  /// This value can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// KMS key ID
  /// </li>
  /// <li>
  /// KMS key alias
  /// </li>
  /// <li>
  /// ARN referring to the KMS key ID
  /// </li>
  /// <li>
  /// ARN referring to the KMS key alias
  /// </li>
  /// </ul>
  /// If encrypted is <i>true</i> but a KMS key ID is not specified, the
  /// customer's default KMS key for Amazon EBS is used.
  ///
  /// Parameter [licenseType] :
  /// The license type to be used for the AMI created by a successful
  /// replication run.
  ///
  /// Parameter [numberOfRecentAmisToKeep] :
  /// The maximum number of SMS-created AMIs to retain. The oldest is deleted
  /// after the maximum number is reached and a new AMI is created.
  ///
  /// Parameter [roleName] :
  /// The name of the IAM role to be used by the Server Migration Service.
  ///
  /// Parameter [runOnce] :
  /// Indicates whether to run the replication job one time.
  Future<CreateReplicationJobResponse> createReplicationJob({
    required DateTime seedReplicationTime,
    required String serverId,
    String? description,
    bool? encrypted,
    int? frequency,
    String? kmsKeyId,
    LicenseType? licenseType,
    int? numberOfRecentAmisToKeep,
    String? roleName,
    bool? runOnce,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.CreateReplicationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'seedReplicationTime': unixTimestampToJson(seedReplicationTime),
        'serverId': serverId,
        if (description != null) 'description': description,
        if (encrypted != null) 'encrypted': encrypted,
        if (frequency != null) 'frequency': frequency,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (licenseType != null) 'licenseType': licenseType.toValue(),
        if (numberOfRecentAmisToKeep != null)
          'numberOfRecentAmisToKeep': numberOfRecentAmisToKeep,
        if (roleName != null) 'roleName': roleName,
        if (runOnce != null) 'runOnce': runOnce,
      },
    );

    return CreateReplicationJobResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified application. Optionally deletes the launched stack
  /// associated with the application and all Server Migration Service
  /// replication jobs for servers in the application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [forceStopAppReplication] :
  /// Indicates whether to stop all replication jobs corresponding to the
  /// servers in the application while deleting the application.
  ///
  /// Parameter [forceTerminateApp] :
  /// Indicates whether to terminate the stack corresponding to the application
  /// while deleting the application.
  Future<void> deleteApp({
    String? appId,
    bool? forceStopAppReplication,
    bool? forceTerminateApp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.DeleteApp'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
        if (forceStopAppReplication != null)
          'forceStopAppReplication': forceStopAppReplication,
        if (forceTerminateApp != null) 'forceTerminateApp': forceTerminateApp,
      },
    );
  }

  /// Deletes the launch configuration for the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> deleteAppLaunchConfiguration({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteAppLaunchConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );
  }

  /// Deletes the replication configuration for the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> deleteAppReplicationConfiguration({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteAppReplicationConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );
  }

  /// Deletes the validation configuration for the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> deleteAppValidationConfiguration({
    required String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteAppValidationConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appId': appId,
      },
    );
  }

  /// Deletes the specified replication job.
  ///
  /// After you delete a replication job, there are no further replication runs.
  /// Amazon Web Services deletes the contents of the Amazon S3 bucket used to
  /// store Server Migration Service artifacts. The AMIs created by the
  /// replication runs are not deleted.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ReplicationJobNotFoundException].
  ///
  /// Parameter [replicationJobId] :
  /// The ID of the replication job.
  Future<void> deleteReplicationJob({
    required String replicationJobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteReplicationJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'replicationJobId': replicationJobId,
      },
    );
  }

  /// Deletes all servers from your server catalog.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  Future<void> deleteServerCatalog() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteServerCatalog'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Disassociates the specified connector from Server Migration Service.
  ///
  /// After you disassociate a connector, it is no longer available to support
  /// replication jobs.
  ///
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  ///
  /// Parameter [connectorId] :
  /// The ID of the connector.
  Future<void> disassociateConnector({
    required String connectorId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DisassociateConnector'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
      },
    );
  }

  /// Generates a target change set for a currently launched stack and writes it
  /// to an Amazon S3 object in the customer’s Amazon S3 bucket.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application associated with the change set.
  ///
  /// Parameter [changesetFormat] :
  /// The format for the change set.
  Future<GenerateChangeSetResponse> generateChangeSet({
    String? appId,
    OutputFormat? changesetFormat,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GenerateChangeSet'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
        if (changesetFormat != null)
          'changesetFormat': changesetFormat.toValue(),
      },
    );

    return GenerateChangeSetResponse.fromJson(jsonResponse.body);
  }

  /// Generates an CloudFormation template based on the current launch
  /// configuration and writes it to an Amazon S3 object in the customer’s
  /// Amazon S3 bucket.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application associated with the CloudFormation template.
  ///
  /// Parameter [templateFormat] :
  /// The format for generating the CloudFormation template.
  Future<GenerateTemplateResponse> generateTemplate({
    String? appId,
    OutputFormat? templateFormat,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GenerateTemplate'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
        if (templateFormat != null) 'templateFormat': templateFormat.toValue(),
      },
    );

    return GenerateTemplateResponse.fromJson(jsonResponse.body);
  }

  /// Retrieve information about the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<GetAppResponse> getApp({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GetApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );

    return GetAppResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the application launch configuration associated with the
  /// specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<GetAppLaunchConfigurationResponse> getAppLaunchConfiguration({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.GetAppLaunchConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );

    return GetAppLaunchConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves the application replication configuration associated with the
  /// specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<GetAppReplicationConfigurationResponse>
      getAppReplicationConfiguration({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.GetAppReplicationConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );

    return GetAppReplicationConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves information about a configuration for validating an application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<GetAppValidationConfigurationResponse> getAppValidationConfiguration({
    required String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.GetAppValidationConfiguration'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appId': appId,
      },
    );

    return GetAppValidationConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Retrieves output from validating an application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<GetAppValidationOutputResponse> getAppValidationOutput({
    required String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.GetAppValidationOutput'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appId': appId,
      },
    );

    return GetAppValidationOutputResponse.fromJson(jsonResponse.body);
  }

  /// Describes the connectors registered with the Server Migration Service.
  ///
  /// May throw [UnauthorizedOperationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 50. To retrieve the remaining results, make another call with the
  /// returned <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<GetConnectorsResponse> getConnectors({
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GetConnectors'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetConnectorsResponse.fromJson(jsonResponse.body);
  }

  /// Describes the specified replication job or all of your replication jobs.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnauthorizedOperationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 50. To retrieve the remaining results, make another call with the
  /// returned <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [replicationJobId] :
  /// The ID of the replication job.
  Future<GetReplicationJobsResponse> getReplicationJobs({
    int? maxResults,
    String? nextToken,
    String? replicationJobId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GetReplicationJobs'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (replicationJobId != null) 'replicationJobId': replicationJobId,
      },
    );

    return GetReplicationJobsResponse.fromJson(jsonResponse.body);
  }

  /// Describes the replication runs for the specified replication job.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnauthorizedOperationException].
  ///
  /// Parameter [replicationJobId] :
  /// The ID of the replication job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 50. To retrieve the remaining results, make another call with the
  /// returned <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<GetReplicationRunsResponse> getReplicationRuns({
    required String replicationJobId,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GetReplicationRuns'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'replicationJobId': replicationJobId,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return GetReplicationRunsResponse.fromJson(jsonResponse.body);
  }

  /// Describes the servers in your server catalog.
  ///
  /// Before you can describe your servers, you must import them using
  /// <a>ImportServerCatalog</a>.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 50. To retrieve the remaining results, make another call with the
  /// returned <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  ///
  /// Parameter [vmServerAddressList] :
  /// The server addresses.
  Future<GetServersResponse> getServers({
    int? maxResults,
    String? nextToken,
    List<VmServerAddress>? vmServerAddressList,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.GetServers'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
        if (vmServerAddressList != null)
          'vmServerAddressList': vmServerAddressList,
      },
    );

    return GetServersResponse.fromJson(jsonResponse.body);
  }

  /// Allows application import from Migration Hub.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [roleName] :
  /// The name of the service role. If you omit this parameter, we create a
  /// service-linked role for Migration Hub in your account. Otherwise, the role
  /// that you provide must have the <a
  /// href="https://docs.aws.amazon.com/migrationhub/latest/ug/new-customer-setup.html#sms-managed">policy
  /// and trust policy</a> described in the <i>Migration Hub User Guide</i>.
  Future<void> importAppCatalog({
    String? roleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.ImportAppCatalog'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roleName != null) 'roleName': roleName,
      },
    );
  }

  /// Gathers a complete list of on-premises servers. Connectors must be
  /// installed and monitoring all servers to import.
  ///
  /// This call returns immediately, but might take additional time to retrieve
  /// all the servers.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [NoConnectorsAvailableException].
  Future<void> importServerCatalog() async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.ImportServerCatalog'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );
  }

  /// Launches the specified application as a stack in CloudFormation.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> launchApp({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.LaunchApp'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );
  }

  /// Retrieves summaries for all applications.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appIds] :
  /// The unique application IDs.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return in a single call. The default
  /// value is 100. To retrieve the remaining results, make another call with
  /// the returned <code>NextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results.
  Future<ListAppsResponse> listApps({
    List<String>? appIds,
    int? maxResults,
    String? nextToken,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.ListApps'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appIds != null) 'appIds': appIds,
        if (maxResults != null) 'maxResults': maxResults,
        if (nextToken != null) 'nextToken': nextToken,
      },
    );

    return ListAppsResponse.fromJson(jsonResponse.body);
  }

  /// Provides information to Server Migration Service about whether application
  /// validation is successful.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [notificationContext] :
  /// The notification information.
  Future<void> notifyAppValidationOutput({
    required String appId,
    NotificationContext? notificationContext,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.NotifyAppValidationOutput'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appId': appId,
        if (notificationContext != null)
          'notificationContext': notificationContext,
      },
    );
  }

  /// Creates or updates the launch configuration for the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [autoLaunch] :
  /// Indicates whether the application is configured to launch automatically
  /// after replication is complete.
  ///
  /// Parameter [roleName] :
  /// The name of service role in the customer's account that CloudFormation
  /// uses to launch the application.
  ///
  /// Parameter [serverGroupLaunchConfigurations] :
  /// Information about the launch configurations for server groups in the
  /// application.
  Future<void> putAppLaunchConfiguration({
    String? appId,
    bool? autoLaunch,
    String? roleName,
    List<ServerGroupLaunchConfiguration>? serverGroupLaunchConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.PutAppLaunchConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
        if (autoLaunch != null) 'autoLaunch': autoLaunch,
        if (roleName != null) 'roleName': roleName,
        if (serverGroupLaunchConfigurations != null)
          'serverGroupLaunchConfigurations': serverGroupLaunchConfigurations,
      },
    );
  }

  /// Creates or updates the replication configuration for the specified
  /// application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [serverGroupReplicationConfigurations] :
  /// Information about the replication configurations for server groups in the
  /// application.
  Future<void> putAppReplicationConfiguration({
    String? appId,
    List<ServerGroupReplicationConfiguration>?
        serverGroupReplicationConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.PutAppReplicationConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
        if (serverGroupReplicationConfigurations != null)
          'serverGroupReplicationConfigurations':
              serverGroupReplicationConfigurations,
      },
    );
  }

  /// Creates or updates a validation configuration for the specified
  /// application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [appValidationConfigurations] :
  /// The configuration for application validation.
  ///
  /// Parameter [serverGroupValidationConfigurations] :
  /// The configuration for instance validation.
  Future<void> putAppValidationConfiguration({
    required String appId,
    List<AppValidationConfiguration>? appValidationConfigurations,
    List<ServerGroupValidationConfiguration>?
        serverGroupValidationConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.PutAppValidationConfiguration'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appId': appId,
        if (appValidationConfigurations != null)
          'appValidationConfigurations': appValidationConfigurations,
        if (serverGroupValidationConfigurations != null)
          'serverGroupValidationConfigurations':
              serverGroupValidationConfigurations,
      },
    );
  }

  /// Starts replicating the specified application by creating replication jobs
  /// for each server in the application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> startAppReplication({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.StartAppReplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );
  }

  /// Starts an on-demand replication run for the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [description] :
  /// The description of the replication run.
  Future<void> startOnDemandAppReplication({
    required String appId,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.StartOnDemandAppReplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'appId': appId,
        if (description != null) 'description': description,
      },
    );
  }

  /// Starts an on-demand replication run for the specified replication job.
  /// This replication run starts immediately. This replication run is in
  /// addition to the ones already scheduled.
  ///
  /// There is a limit on the number of on-demand replications runs that you can
  /// request in a 24-hour period.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [OperationNotPermittedException].
  /// May throw [ReplicationRunLimitExceededException].
  /// May throw [DryRunOperationException].
  ///
  /// Parameter [replicationJobId] :
  /// The ID of the replication job.
  ///
  /// Parameter [description] :
  /// The description of the replication run.
  Future<StartOnDemandReplicationRunResponse> startOnDemandReplicationRun({
    required String replicationJobId,
    String? description,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.StartOnDemandReplicationRun'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'replicationJobId': replicationJobId,
        if (description != null) 'description': description,
      },
    );

    return StartOnDemandReplicationRunResponse.fromJson(jsonResponse.body);
  }

  /// Stops replicating the specified application by deleting the replication
  /// job for each server in the application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> stopAppReplication({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.StopAppReplication'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );
  }

  /// Terminates the stack for the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  Future<void> terminateApp({
    String? appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.TerminateApp'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
      },
    );
  }

  /// Updates the specified application.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [appId] :
  /// The ID of the application.
  ///
  /// Parameter [description] :
  /// The new description of the application.
  ///
  /// Parameter [name] :
  /// The new name of the application.
  ///
  /// Parameter [roleName] :
  /// The name of the service role in the customer's account used by Server
  /// Migration Service.
  ///
  /// Parameter [serverGroups] :
  /// The server groups in the application to update.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the application.
  Future<UpdateAppResponse> updateApp({
    String? appId,
    String? description,
    String? name,
    String? roleName,
    List<ServerGroup>? serverGroups,
    List<Tag>? tags,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.UpdateApp'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (appId != null) 'appId': appId,
        if (description != null) 'description': description,
        if (name != null) 'name': name,
        if (roleName != null) 'roleName': roleName,
        if (serverGroups != null) 'serverGroups': serverGroups,
        if (tags != null) 'tags': tags,
      },
    );

    return UpdateAppResponse.fromJson(jsonResponse.body);
  }

  /// Updates the specified settings for the specified replication job.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [OperationNotPermittedException].
  /// May throw [UnauthorizedOperationException].
  /// May throw [ServerCannotBeReplicatedException].
  /// May throw [ReplicationJobNotFoundException].
  /// May throw [InternalError].
  /// May throw [TemporarilyUnavailableException].
  ///
  /// Parameter [replicationJobId] :
  /// The ID of the replication job.
  ///
  /// Parameter [description] :
  /// The description of the replication job.
  ///
  /// Parameter [encrypted] :
  /// When true, the replication job produces encrypted AMIs. For more
  /// information, <code>KmsKeyId</code>.
  ///
  /// Parameter [frequency] :
  /// The time between consecutive replication runs, in hours.
  ///
  /// Parameter [kmsKeyId] :
  /// The ID of the KMS key for replication jobs that produce encrypted AMIs.
  /// This value can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// KMS key ID
  /// </li>
  /// <li>
  /// KMS key alias
  /// </li>
  /// <li>
  /// ARN referring to the KMS key ID
  /// </li>
  /// <li>
  /// ARN referring to the KMS key alias
  /// </li>
  /// </ul>
  /// If encrypted is enabled but a KMS key ID is not specified, the customer's
  /// default KMS key for Amazon EBS is used.
  ///
  /// Parameter [licenseType] :
  /// The license type to be used for the AMI created by a successful
  /// replication run.
  ///
  /// Parameter [nextReplicationRunStartTime] :
  /// The start time of the next replication run.
  ///
  /// Parameter [numberOfRecentAmisToKeep] :
  /// The maximum number of SMS-created AMIs to retain. The oldest is deleted
  /// after the maximum number is reached and a new AMI is created.
  ///
  /// Parameter [roleName] :
  /// The name of the IAM role to be used by Server Migration Service.
  Future<void> updateReplicationJob({
    required String replicationJobId,
    String? description,
    bool? encrypted,
    int? frequency,
    String? kmsKeyId,
    LicenseType? licenseType,
    DateTime? nextReplicationRunStartTime,
    int? numberOfRecentAmisToKeep,
    String? roleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.UpdateReplicationJob'
    };
    await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'replicationJobId': replicationJobId,
        if (description != null) 'description': description,
        if (encrypted != null) 'encrypted': encrypted,
        if (frequency != null) 'frequency': frequency,
        if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
        if (licenseType != null) 'licenseType': licenseType.toValue(),
        if (nextReplicationRunStartTime != null)
          'nextReplicationRunStartTime':
              unixTimestampToJson(nextReplicationRunStartTime),
        if (numberOfRecentAmisToKeep != null)
          'numberOfRecentAmisToKeep': numberOfRecentAmisToKeep,
        if (roleName != null) 'roleName': roleName,
      },
    );
  }
}

enum AppLaunchConfigurationStatus {
  notConfigured,
  configured,
}

extension AppLaunchConfigurationStatusValueExtension
    on AppLaunchConfigurationStatus {
  String toValue() {
    switch (this) {
      case AppLaunchConfigurationStatus.notConfigured:
        return 'NOT_CONFIGURED';
      case AppLaunchConfigurationStatus.configured:
        return 'CONFIGURED';
    }
  }
}

extension AppLaunchConfigurationStatusFromString on String {
  AppLaunchConfigurationStatus toAppLaunchConfigurationStatus() {
    switch (this) {
      case 'NOT_CONFIGURED':
        return AppLaunchConfigurationStatus.notConfigured;
      case 'CONFIGURED':
        return AppLaunchConfigurationStatus.configured;
    }
    throw Exception('$this is not known in enum AppLaunchConfigurationStatus');
  }
}

enum AppLaunchStatus {
  readyForConfiguration,
  configurationInProgress,
  configurationInvalid,
  readyForLaunch,
  validationInProgress,
  launchPending,
  launchInProgress,
  launched,
  partiallyLaunched,
  deltaLaunchInProgress,
  deltaLaunchFailed,
  launchFailed,
  terminateInProgress,
  terminateFailed,
  terminated,
}

extension AppLaunchStatusValueExtension on AppLaunchStatus {
  String toValue() {
    switch (this) {
      case AppLaunchStatus.readyForConfiguration:
        return 'READY_FOR_CONFIGURATION';
      case AppLaunchStatus.configurationInProgress:
        return 'CONFIGURATION_IN_PROGRESS';
      case AppLaunchStatus.configurationInvalid:
        return 'CONFIGURATION_INVALID';
      case AppLaunchStatus.readyForLaunch:
        return 'READY_FOR_LAUNCH';
      case AppLaunchStatus.validationInProgress:
        return 'VALIDATION_IN_PROGRESS';
      case AppLaunchStatus.launchPending:
        return 'LAUNCH_PENDING';
      case AppLaunchStatus.launchInProgress:
        return 'LAUNCH_IN_PROGRESS';
      case AppLaunchStatus.launched:
        return 'LAUNCHED';
      case AppLaunchStatus.partiallyLaunched:
        return 'PARTIALLY_LAUNCHED';
      case AppLaunchStatus.deltaLaunchInProgress:
        return 'DELTA_LAUNCH_IN_PROGRESS';
      case AppLaunchStatus.deltaLaunchFailed:
        return 'DELTA_LAUNCH_FAILED';
      case AppLaunchStatus.launchFailed:
        return 'LAUNCH_FAILED';
      case AppLaunchStatus.terminateInProgress:
        return 'TERMINATE_IN_PROGRESS';
      case AppLaunchStatus.terminateFailed:
        return 'TERMINATE_FAILED';
      case AppLaunchStatus.terminated:
        return 'TERMINATED';
    }
  }
}

extension AppLaunchStatusFromString on String {
  AppLaunchStatus toAppLaunchStatus() {
    switch (this) {
      case 'READY_FOR_CONFIGURATION':
        return AppLaunchStatus.readyForConfiguration;
      case 'CONFIGURATION_IN_PROGRESS':
        return AppLaunchStatus.configurationInProgress;
      case 'CONFIGURATION_INVALID':
        return AppLaunchStatus.configurationInvalid;
      case 'READY_FOR_LAUNCH':
        return AppLaunchStatus.readyForLaunch;
      case 'VALIDATION_IN_PROGRESS':
        return AppLaunchStatus.validationInProgress;
      case 'LAUNCH_PENDING':
        return AppLaunchStatus.launchPending;
      case 'LAUNCH_IN_PROGRESS':
        return AppLaunchStatus.launchInProgress;
      case 'LAUNCHED':
        return AppLaunchStatus.launched;
      case 'PARTIALLY_LAUNCHED':
        return AppLaunchStatus.partiallyLaunched;
      case 'DELTA_LAUNCH_IN_PROGRESS':
        return AppLaunchStatus.deltaLaunchInProgress;
      case 'DELTA_LAUNCH_FAILED':
        return AppLaunchStatus.deltaLaunchFailed;
      case 'LAUNCH_FAILED':
        return AppLaunchStatus.launchFailed;
      case 'TERMINATE_IN_PROGRESS':
        return AppLaunchStatus.terminateInProgress;
      case 'TERMINATE_FAILED':
        return AppLaunchStatus.terminateFailed;
      case 'TERMINATED':
        return AppLaunchStatus.terminated;
    }
    throw Exception('$this is not known in enum AppLaunchStatus');
  }
}

enum AppReplicationConfigurationStatus {
  notConfigured,
  configured,
}

extension AppReplicationConfigurationStatusValueExtension
    on AppReplicationConfigurationStatus {
  String toValue() {
    switch (this) {
      case AppReplicationConfigurationStatus.notConfigured:
        return 'NOT_CONFIGURED';
      case AppReplicationConfigurationStatus.configured:
        return 'CONFIGURED';
    }
  }
}

extension AppReplicationConfigurationStatusFromString on String {
  AppReplicationConfigurationStatus toAppReplicationConfigurationStatus() {
    switch (this) {
      case 'NOT_CONFIGURED':
        return AppReplicationConfigurationStatus.notConfigured;
      case 'CONFIGURED':
        return AppReplicationConfigurationStatus.configured;
    }
    throw Exception(
        '$this is not known in enum AppReplicationConfigurationStatus');
  }
}

enum AppReplicationStatus {
  readyForConfiguration,
  configurationInProgress,
  configurationInvalid,
  readyForReplication,
  validationInProgress,
  replicationPending,
  replicationInProgress,
  replicated,
  partiallyReplicated,
  deltaReplicationInProgress,
  deltaReplicated,
  deltaReplicationFailed,
  replicationFailed,
  replicationStopping,
  replicationStopFailed,
  replicationStopped,
}

extension AppReplicationStatusValueExtension on AppReplicationStatus {
  String toValue() {
    switch (this) {
      case AppReplicationStatus.readyForConfiguration:
        return 'READY_FOR_CONFIGURATION';
      case AppReplicationStatus.configurationInProgress:
        return 'CONFIGURATION_IN_PROGRESS';
      case AppReplicationStatus.configurationInvalid:
        return 'CONFIGURATION_INVALID';
      case AppReplicationStatus.readyForReplication:
        return 'READY_FOR_REPLICATION';
      case AppReplicationStatus.validationInProgress:
        return 'VALIDATION_IN_PROGRESS';
      case AppReplicationStatus.replicationPending:
        return 'REPLICATION_PENDING';
      case AppReplicationStatus.replicationInProgress:
        return 'REPLICATION_IN_PROGRESS';
      case AppReplicationStatus.replicated:
        return 'REPLICATED';
      case AppReplicationStatus.partiallyReplicated:
        return 'PARTIALLY_REPLICATED';
      case AppReplicationStatus.deltaReplicationInProgress:
        return 'DELTA_REPLICATION_IN_PROGRESS';
      case AppReplicationStatus.deltaReplicated:
        return 'DELTA_REPLICATED';
      case AppReplicationStatus.deltaReplicationFailed:
        return 'DELTA_REPLICATION_FAILED';
      case AppReplicationStatus.replicationFailed:
        return 'REPLICATION_FAILED';
      case AppReplicationStatus.replicationStopping:
        return 'REPLICATION_STOPPING';
      case AppReplicationStatus.replicationStopFailed:
        return 'REPLICATION_STOP_FAILED';
      case AppReplicationStatus.replicationStopped:
        return 'REPLICATION_STOPPED';
    }
  }
}

extension AppReplicationStatusFromString on String {
  AppReplicationStatus toAppReplicationStatus() {
    switch (this) {
      case 'READY_FOR_CONFIGURATION':
        return AppReplicationStatus.readyForConfiguration;
      case 'CONFIGURATION_IN_PROGRESS':
        return AppReplicationStatus.configurationInProgress;
      case 'CONFIGURATION_INVALID':
        return AppReplicationStatus.configurationInvalid;
      case 'READY_FOR_REPLICATION':
        return AppReplicationStatus.readyForReplication;
      case 'VALIDATION_IN_PROGRESS':
        return AppReplicationStatus.validationInProgress;
      case 'REPLICATION_PENDING':
        return AppReplicationStatus.replicationPending;
      case 'REPLICATION_IN_PROGRESS':
        return AppReplicationStatus.replicationInProgress;
      case 'REPLICATED':
        return AppReplicationStatus.replicated;
      case 'PARTIALLY_REPLICATED':
        return AppReplicationStatus.partiallyReplicated;
      case 'DELTA_REPLICATION_IN_PROGRESS':
        return AppReplicationStatus.deltaReplicationInProgress;
      case 'DELTA_REPLICATED':
        return AppReplicationStatus.deltaReplicated;
      case 'DELTA_REPLICATION_FAILED':
        return AppReplicationStatus.deltaReplicationFailed;
      case 'REPLICATION_FAILED':
        return AppReplicationStatus.replicationFailed;
      case 'REPLICATION_STOPPING':
        return AppReplicationStatus.replicationStopping;
      case 'REPLICATION_STOP_FAILED':
        return AppReplicationStatus.replicationStopFailed;
      case 'REPLICATION_STOPPED':
        return AppReplicationStatus.replicationStopped;
    }
    throw Exception('$this is not known in enum AppReplicationStatus');
  }
}

enum AppStatus {
  creating,
  active,
  updating,
  deleting,
  deleted,
  deleteFailed,
}

extension AppStatusValueExtension on AppStatus {
  String toValue() {
    switch (this) {
      case AppStatus.creating:
        return 'CREATING';
      case AppStatus.active:
        return 'ACTIVE';
      case AppStatus.updating:
        return 'UPDATING';
      case AppStatus.deleting:
        return 'DELETING';
      case AppStatus.deleted:
        return 'DELETED';
      case AppStatus.deleteFailed:
        return 'DELETE_FAILED';
    }
  }
}

extension AppStatusFromString on String {
  AppStatus toAppStatus() {
    switch (this) {
      case 'CREATING':
        return AppStatus.creating;
      case 'ACTIVE':
        return AppStatus.active;
      case 'UPDATING':
        return AppStatus.updating;
      case 'DELETING':
        return AppStatus.deleting;
      case 'DELETED':
        return AppStatus.deleted;
      case 'DELETE_FAILED':
        return AppStatus.deleteFailed;
    }
    throw Exception('$this is not known in enum AppStatus');
  }
}

/// Information about the application.
class AppSummary {
  /// The unique ID of the application.
  final String? appId;

  /// The creation time of the application.
  final DateTime? creationTime;

  /// The description of the application.
  final String? description;

  /// The ID of the application.
  final String? importedAppId;

  /// The last modified time of the application.
  final DateTime? lastModified;

  /// The timestamp of the application's most recent successful replication.
  final DateTime? latestReplicationTime;

  /// Status of the launch configuration.
  final AppLaunchConfigurationStatus? launchConfigurationStatus;

  /// Details about the latest launch of the application.
  final LaunchDetails? launchDetails;

  /// The launch status of the application.
  final AppLaunchStatus? launchStatus;

  /// A message related to the launch status of the application.
  final String? launchStatusMessage;

  /// The name of the application.
  final String? name;

  /// Status of the replication configuration.
  final AppReplicationConfigurationStatus? replicationConfigurationStatus;

  /// The replication status of the application.
  final AppReplicationStatus? replicationStatus;

  /// A message related to the replication status of the application.
  final String? replicationStatusMessage;

  /// The name of the service role in the customer's account used by Server
  /// Migration Service.
  final String? roleName;

  /// Status of the application.
  final AppStatus? status;

  /// A message related to the status of the application
  final String? statusMessage;

  /// The number of server groups present in the application.
  final int? totalServerGroups;

  /// The number of servers present in the application.
  final int? totalServers;

  AppSummary({
    this.appId,
    this.creationTime,
    this.description,
    this.importedAppId,
    this.lastModified,
    this.latestReplicationTime,
    this.launchConfigurationStatus,
    this.launchDetails,
    this.launchStatus,
    this.launchStatusMessage,
    this.name,
    this.replicationConfigurationStatus,
    this.replicationStatus,
    this.replicationStatusMessage,
    this.roleName,
    this.status,
    this.statusMessage,
    this.totalServerGroups,
    this.totalServers,
  });

  factory AppSummary.fromJson(Map<String, dynamic> json) {
    return AppSummary(
      appId: json['appId'] as String?,
      creationTime: timeStampFromJson(json['creationTime']),
      description: json['description'] as String?,
      importedAppId: json['importedAppId'] as String?,
      lastModified: timeStampFromJson(json['lastModified']),
      latestReplicationTime: timeStampFromJson(json['latestReplicationTime']),
      launchConfigurationStatus: (json['launchConfigurationStatus'] as String?)
          ?.toAppLaunchConfigurationStatus(),
      launchDetails: json['launchDetails'] != null
          ? LaunchDetails.fromJson(
              json['launchDetails'] as Map<String, dynamic>)
          : null,
      launchStatus: (json['launchStatus'] as String?)?.toAppLaunchStatus(),
      launchStatusMessage: json['launchStatusMessage'] as String?,
      name: json['name'] as String?,
      replicationConfigurationStatus:
          (json['replicationConfigurationStatus'] as String?)
              ?.toAppReplicationConfigurationStatus(),
      replicationStatus:
          (json['replicationStatus'] as String?)?.toAppReplicationStatus(),
      replicationStatusMessage: json['replicationStatusMessage'] as String?,
      roleName: json['roleName'] as String?,
      status: (json['status'] as String?)?.toAppStatus(),
      statusMessage: json['statusMessage'] as String?,
      totalServerGroups: json['totalServerGroups'] as int?,
      totalServers: json['totalServers'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final creationTime = this.creationTime;
    final description = this.description;
    final importedAppId = this.importedAppId;
    final lastModified = this.lastModified;
    final latestReplicationTime = this.latestReplicationTime;
    final launchConfigurationStatus = this.launchConfigurationStatus;
    final launchDetails = this.launchDetails;
    final launchStatus = this.launchStatus;
    final launchStatusMessage = this.launchStatusMessage;
    final name = this.name;
    final replicationConfigurationStatus = this.replicationConfigurationStatus;
    final replicationStatus = this.replicationStatus;
    final replicationStatusMessage = this.replicationStatusMessage;
    final roleName = this.roleName;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final totalServerGroups = this.totalServerGroups;
    final totalServers = this.totalServers;
    return {
      if (appId != null) 'appId': appId,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (description != null) 'description': description,
      if (importedAppId != null) 'importedAppId': importedAppId,
      if (lastModified != null)
        'lastModified': unixTimestampToJson(lastModified),
      if (latestReplicationTime != null)
        'latestReplicationTime': unixTimestampToJson(latestReplicationTime),
      if (launchConfigurationStatus != null)
        'launchConfigurationStatus': launchConfigurationStatus.toValue(),
      if (launchDetails != null) 'launchDetails': launchDetails,
      if (launchStatus != null) 'launchStatus': launchStatus.toValue(),
      if (launchStatusMessage != null)
        'launchStatusMessage': launchStatusMessage,
      if (name != null) 'name': name,
      if (replicationConfigurationStatus != null)
        'replicationConfigurationStatus':
            replicationConfigurationStatus.toValue(),
      if (replicationStatus != null)
        'replicationStatus': replicationStatus.toValue(),
      if (replicationStatusMessage != null)
        'replicationStatusMessage': replicationStatusMessage,
      if (roleName != null) 'roleName': roleName,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (totalServerGroups != null) 'totalServerGroups': totalServerGroups,
      if (totalServers != null) 'totalServers': totalServers,
    };
  }
}

/// Configuration for validating an application.
class AppValidationConfiguration {
  /// The validation strategy.
  final AppValidationStrategy? appValidationStrategy;

  /// The name of the configuration.
  final String? name;

  /// The validation parameters.
  final SSMValidationParameters? ssmValidationParameters;

  /// The ID of the validation.
  final String? validationId;

  AppValidationConfiguration({
    this.appValidationStrategy,
    this.name,
    this.ssmValidationParameters,
    this.validationId,
  });

  factory AppValidationConfiguration.fromJson(Map<String, dynamic> json) {
    return AppValidationConfiguration(
      appValidationStrategy:
          (json['appValidationStrategy'] as String?)?.toAppValidationStrategy(),
      name: json['name'] as String?,
      ssmValidationParameters: json['ssmValidationParameters'] != null
          ? SSMValidationParameters.fromJson(
              json['ssmValidationParameters'] as Map<String, dynamic>)
          : null,
      validationId: json['validationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appValidationStrategy = this.appValidationStrategy;
    final name = this.name;
    final ssmValidationParameters = this.ssmValidationParameters;
    final validationId = this.validationId;
    return {
      if (appValidationStrategy != null)
        'appValidationStrategy': appValidationStrategy.toValue(),
      if (name != null) 'name': name,
      if (ssmValidationParameters != null)
        'ssmValidationParameters': ssmValidationParameters,
      if (validationId != null) 'validationId': validationId,
    };
  }
}

/// Output from validating an application.
class AppValidationOutput {
  /// Output from using SSM to validate the application.
  final SSMOutput? ssmOutput;

  AppValidationOutput({
    this.ssmOutput,
  });

  factory AppValidationOutput.fromJson(Map<String, dynamic> json) {
    return AppValidationOutput(
      ssmOutput: json['ssmOutput'] != null
          ? SSMOutput.fromJson(json['ssmOutput'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ssmOutput = this.ssmOutput;
    return {
      if (ssmOutput != null) 'ssmOutput': ssmOutput,
    };
  }
}

enum AppValidationStrategy {
  ssm,
}

extension AppValidationStrategyValueExtension on AppValidationStrategy {
  String toValue() {
    switch (this) {
      case AppValidationStrategy.ssm:
        return 'SSM';
    }
  }
}

extension AppValidationStrategyFromString on String {
  AppValidationStrategy toAppValidationStrategy() {
    switch (this) {
      case 'SSM':
        return AppValidationStrategy.ssm;
    }
    throw Exception('$this is not known in enum AppValidationStrategy');
  }
}

/// Represents a connector.
class Connector {
  /// The time the connector was associated.
  final DateTime? associatedOn;

  /// The capabilities of the connector.
  final List<ConnectorCapability>? capabilityList;

  /// The ID of the connector.
  final String? connectorId;

  /// The IP address of the connector.
  final String? ipAddress;

  /// The MAC address of the connector.
  final String? macAddress;

  /// The status of the connector.
  final ConnectorStatus? status;

  /// The connector version.
  final String? version;

  /// The ID of the VM manager.
  final String? vmManagerId;

  /// The name of the VM manager.
  final String? vmManagerName;

  /// The VM management product.
  final VmManagerType? vmManagerType;

  Connector({
    this.associatedOn,
    this.capabilityList,
    this.connectorId,
    this.ipAddress,
    this.macAddress,
    this.status,
    this.version,
    this.vmManagerId,
    this.vmManagerName,
    this.vmManagerType,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      associatedOn: timeStampFromJson(json['associatedOn']),
      capabilityList: (json['capabilityList'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toConnectorCapability())
          .toList(),
      connectorId: json['connectorId'] as String?,
      ipAddress: json['ipAddress'] as String?,
      macAddress: json['macAddress'] as String?,
      status: (json['status'] as String?)?.toConnectorStatus(),
      version: json['version'] as String?,
      vmManagerId: json['vmManagerId'] as String?,
      vmManagerName: json['vmManagerName'] as String?,
      vmManagerType: (json['vmManagerType'] as String?)?.toVmManagerType(),
    );
  }

  Map<String, dynamic> toJson() {
    final associatedOn = this.associatedOn;
    final capabilityList = this.capabilityList;
    final connectorId = this.connectorId;
    final ipAddress = this.ipAddress;
    final macAddress = this.macAddress;
    final status = this.status;
    final version = this.version;
    final vmManagerId = this.vmManagerId;
    final vmManagerName = this.vmManagerName;
    final vmManagerType = this.vmManagerType;
    return {
      if (associatedOn != null)
        'associatedOn': unixTimestampToJson(associatedOn),
      if (capabilityList != null)
        'capabilityList': capabilityList.map((e) => e.toValue()).toList(),
      if (connectorId != null) 'connectorId': connectorId,
      if (ipAddress != null) 'ipAddress': ipAddress,
      if (macAddress != null) 'macAddress': macAddress,
      if (status != null) 'status': status.toValue(),
      if (version != null) 'version': version,
      if (vmManagerId != null) 'vmManagerId': vmManagerId,
      if (vmManagerName != null) 'vmManagerName': vmManagerName,
      if (vmManagerType != null) 'vmManagerType': vmManagerType.toValue(),
    };
  }
}

enum ConnectorCapability {
  vsphere,
  scvmm,
  hypervManager,
  snapshotBatching,
  smsOptimized,
}

extension ConnectorCapabilityValueExtension on ConnectorCapability {
  String toValue() {
    switch (this) {
      case ConnectorCapability.vsphere:
        return 'VSPHERE';
      case ConnectorCapability.scvmm:
        return 'SCVMM';
      case ConnectorCapability.hypervManager:
        return 'HYPERV-MANAGER';
      case ConnectorCapability.snapshotBatching:
        return 'SNAPSHOT_BATCHING';
      case ConnectorCapability.smsOptimized:
        return 'SMS_OPTIMIZED';
    }
  }
}

extension ConnectorCapabilityFromString on String {
  ConnectorCapability toConnectorCapability() {
    switch (this) {
      case 'VSPHERE':
        return ConnectorCapability.vsphere;
      case 'SCVMM':
        return ConnectorCapability.scvmm;
      case 'HYPERV-MANAGER':
        return ConnectorCapability.hypervManager;
      case 'SNAPSHOT_BATCHING':
        return ConnectorCapability.snapshotBatching;
      case 'SMS_OPTIMIZED':
        return ConnectorCapability.smsOptimized;
    }
    throw Exception('$this is not known in enum ConnectorCapability');
  }
}

enum ConnectorStatus {
  healthy,
  unhealthy,
}

extension ConnectorStatusValueExtension on ConnectorStatus {
  String toValue() {
    switch (this) {
      case ConnectorStatus.healthy:
        return 'HEALTHY';
      case ConnectorStatus.unhealthy:
        return 'UNHEALTHY';
    }
  }
}

extension ConnectorStatusFromString on String {
  ConnectorStatus toConnectorStatus() {
    switch (this) {
      case 'HEALTHY':
        return ConnectorStatus.healthy;
      case 'UNHEALTHY':
        return ConnectorStatus.unhealthy;
    }
    throw Exception('$this is not known in enum ConnectorStatus');
  }
}

class CreateAppResponse {
  /// A summary description of the application.
  final AppSummary? appSummary;

  /// The server groups included in the application.
  final List<ServerGroup>? serverGroups;

  /// The tags associated with the application.
  final List<Tag>? tags;

  CreateAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });

  factory CreateAppResponse.fromJson(Map<String, dynamic> json) {
    return CreateAppResponse(
      appSummary: json['appSummary'] != null
          ? AppSummary.fromJson(json['appSummary'] as Map<String, dynamic>)
          : null,
      serverGroups: (json['serverGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ServerGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appSummary = this.appSummary;
    final serverGroups = this.serverGroups;
    final tags = this.tags;
    return {
      if (appSummary != null) 'appSummary': appSummary,
      if (serverGroups != null) 'serverGroups': serverGroups,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateReplicationJobResponse {
  /// The unique identifier of the replication job.
  final String? replicationJobId;

  CreateReplicationJobResponse({
    this.replicationJobId,
  });

  factory CreateReplicationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateReplicationJobResponse(
      replicationJobId: json['replicationJobId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationJobId = this.replicationJobId;
    return {
      if (replicationJobId != null) 'replicationJobId': replicationJobId,
    };
  }
}

class DeleteAppLaunchConfigurationResponse {
  DeleteAppLaunchConfigurationResponse();

  factory DeleteAppLaunchConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAppLaunchConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppReplicationConfigurationResponse {
  DeleteAppReplicationConfigurationResponse();

  factory DeleteAppReplicationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAppReplicationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppResponse {
  DeleteAppResponse();

  factory DeleteAppResponse.fromJson(Map<String, dynamic> _) {
    return DeleteAppResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteAppValidationConfigurationResponse {
  DeleteAppValidationConfigurationResponse();

  factory DeleteAppValidationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteAppValidationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteReplicationJobResponse {
  DeleteReplicationJobResponse();

  factory DeleteReplicationJobResponse.fromJson(Map<String, dynamic> _) {
    return DeleteReplicationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteServerCatalogResponse {
  DeleteServerCatalogResponse();

  factory DeleteServerCatalogResponse.fromJson(Map<String, dynamic> _) {
    return DeleteServerCatalogResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateConnectorResponse {
  DisassociateConnectorResponse();

  factory DisassociateConnectorResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateConnectorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class GenerateChangeSetResponse {
  /// The location of the Amazon S3 object.
  final S3Location? s3Location;

  GenerateChangeSetResponse({
    this.s3Location,
  });

  factory GenerateChangeSetResponse.fromJson(Map<String, dynamic> json) {
    return GenerateChangeSetResponse(
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class GenerateTemplateResponse {
  /// The location of the Amazon S3 object.
  final S3Location? s3Location;

  GenerateTemplateResponse({
    this.s3Location,
  });

  factory GenerateTemplateResponse.fromJson(Map<String, dynamic> json) {
    return GenerateTemplateResponse(
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class GetAppLaunchConfigurationResponse {
  /// The ID of the application.
  final String? appId;

  /// Indicates whether the application is configured to launch automatically
  /// after replication is complete.
  final bool? autoLaunch;

  /// The name of the service role in the customer's account that CloudFormation
  /// uses to launch the application.
  final String? roleName;

  /// The launch configurations for server groups in this application.
  final List<ServerGroupLaunchConfiguration>? serverGroupLaunchConfigurations;

  GetAppLaunchConfigurationResponse({
    this.appId,
    this.autoLaunch,
    this.roleName,
    this.serverGroupLaunchConfigurations,
  });

  factory GetAppLaunchConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAppLaunchConfigurationResponse(
      appId: json['appId'] as String?,
      autoLaunch: json['autoLaunch'] as bool?,
      roleName: json['roleName'] as String?,
      serverGroupLaunchConfigurations:
          (json['serverGroupLaunchConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => ServerGroupLaunchConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appId = this.appId;
    final autoLaunch = this.autoLaunch;
    final roleName = this.roleName;
    final serverGroupLaunchConfigurations =
        this.serverGroupLaunchConfigurations;
    return {
      if (appId != null) 'appId': appId,
      if (autoLaunch != null) 'autoLaunch': autoLaunch,
      if (roleName != null) 'roleName': roleName,
      if (serverGroupLaunchConfigurations != null)
        'serverGroupLaunchConfigurations': serverGroupLaunchConfigurations,
    };
  }
}

class GetAppReplicationConfigurationResponse {
  /// The replication configurations associated with server groups in this
  /// application.
  final List<ServerGroupReplicationConfiguration>?
      serverGroupReplicationConfigurations;

  GetAppReplicationConfigurationResponse({
    this.serverGroupReplicationConfigurations,
  });

  factory GetAppReplicationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAppReplicationConfigurationResponse(
      serverGroupReplicationConfigurations:
          (json['serverGroupReplicationConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => ServerGroupReplicationConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverGroupReplicationConfigurations =
        this.serverGroupReplicationConfigurations;
    return {
      if (serverGroupReplicationConfigurations != null)
        'serverGroupReplicationConfigurations':
            serverGroupReplicationConfigurations,
    };
  }
}

class GetAppResponse {
  /// Information about the application.
  final AppSummary? appSummary;

  /// The server groups that belong to the application.
  final List<ServerGroup>? serverGroups;

  /// The tags associated with the application.
  final List<Tag>? tags;

  GetAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });

  factory GetAppResponse.fromJson(Map<String, dynamic> json) {
    return GetAppResponse(
      appSummary: json['appSummary'] != null
          ? AppSummary.fromJson(json['appSummary'] as Map<String, dynamic>)
          : null,
      serverGroups: (json['serverGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ServerGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appSummary = this.appSummary;
    final serverGroups = this.serverGroups;
    final tags = this.tags;
    return {
      if (appSummary != null) 'appSummary': appSummary,
      if (serverGroups != null) 'serverGroups': serverGroups,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetAppValidationConfigurationResponse {
  /// The configuration for application validation.
  final List<AppValidationConfiguration>? appValidationConfigurations;

  /// The configuration for instance validation.
  final List<ServerGroupValidationConfiguration>?
      serverGroupValidationConfigurations;

  GetAppValidationConfigurationResponse({
    this.appValidationConfigurations,
    this.serverGroupValidationConfigurations,
  });

  factory GetAppValidationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetAppValidationConfigurationResponse(
      appValidationConfigurations: (json['appValidationConfigurations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              AppValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      serverGroupValidationConfigurations:
          (json['serverGroupValidationConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => ServerGroupValidationConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appValidationConfigurations = this.appValidationConfigurations;
    final serverGroupValidationConfigurations =
        this.serverGroupValidationConfigurations;
    return {
      if (appValidationConfigurations != null)
        'appValidationConfigurations': appValidationConfigurations,
      if (serverGroupValidationConfigurations != null)
        'serverGroupValidationConfigurations':
            serverGroupValidationConfigurations,
    };
  }
}

class GetAppValidationOutputResponse {
  /// The validation output.
  final List<ValidationOutput>? validationOutputList;

  GetAppValidationOutputResponse({
    this.validationOutputList,
  });

  factory GetAppValidationOutputResponse.fromJson(Map<String, dynamic> json) {
    return GetAppValidationOutputResponse(
      validationOutputList: (json['validationOutputList'] as List?)
          ?.whereNotNull()
          .map((e) => ValidationOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final validationOutputList = this.validationOutputList;
    return {
      if (validationOutputList != null)
        'validationOutputList': validationOutputList,
    };
  }
}

class GetConnectorsResponse {
  /// Information about the registered connectors.
  final List<Connector>? connectorList;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  GetConnectorsResponse({
    this.connectorList,
    this.nextToken,
  });

  factory GetConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return GetConnectorsResponse(
      connectorList: (json['connectorList'] as List?)
          ?.whereNotNull()
          .map((e) => Connector.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorList = this.connectorList;
    final nextToken = this.nextToken;
    return {
      if (connectorList != null) 'connectorList': connectorList,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class GetReplicationJobsResponse {
  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the replication jobs.
  final List<ReplicationJob>? replicationJobList;

  GetReplicationJobsResponse({
    this.nextToken,
    this.replicationJobList,
  });

  factory GetReplicationJobsResponse.fromJson(Map<String, dynamic> json) {
    return GetReplicationJobsResponse(
      nextToken: json['nextToken'] as String?,
      replicationJobList: (json['replicationJobList'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationJob.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final replicationJobList = this.replicationJobList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (replicationJobList != null) 'replicationJobList': replicationJobList,
    };
  }
}

class GetReplicationRunsResponse {
  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// Information about the replication job.
  final ReplicationJob? replicationJob;

  /// Information about the replication runs.
  final List<ReplicationRun>? replicationRunList;

  GetReplicationRunsResponse({
    this.nextToken,
    this.replicationJob,
    this.replicationRunList,
  });

  factory GetReplicationRunsResponse.fromJson(Map<String, dynamic> json) {
    return GetReplicationRunsResponse(
      nextToken: json['nextToken'] as String?,
      replicationJob: json['replicationJob'] != null
          ? ReplicationJob.fromJson(
              json['replicationJob'] as Map<String, dynamic>)
          : null,
      replicationRunList: (json['replicationRunList'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationRun.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final replicationJob = this.replicationJob;
    final replicationRunList = this.replicationRunList;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (replicationJob != null) 'replicationJob': replicationJob,
      if (replicationRunList != null) 'replicationRunList': replicationRunList,
    };
  }
}

class GetServersResponse {
  /// The time when the server was last modified.
  final DateTime? lastModifiedOn;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  /// The status of the server catalog.
  final ServerCatalogStatus? serverCatalogStatus;

  /// Information about the servers.
  final List<Server>? serverList;

  GetServersResponse({
    this.lastModifiedOn,
    this.nextToken,
    this.serverCatalogStatus,
    this.serverList,
  });

  factory GetServersResponse.fromJson(Map<String, dynamic> json) {
    return GetServersResponse(
      lastModifiedOn: timeStampFromJson(json['lastModifiedOn']),
      nextToken: json['nextToken'] as String?,
      serverCatalogStatus:
          (json['serverCatalogStatus'] as String?)?.toServerCatalogStatus(),
      serverList: (json['serverList'] as List?)
          ?.whereNotNull()
          .map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final lastModifiedOn = this.lastModifiedOn;
    final nextToken = this.nextToken;
    final serverCatalogStatus = this.serverCatalogStatus;
    final serverList = this.serverList;
    return {
      if (lastModifiedOn != null)
        'lastModifiedOn': unixTimestampToJson(lastModifiedOn),
      if (nextToken != null) 'nextToken': nextToken,
      if (serverCatalogStatus != null)
        'serverCatalogStatus': serverCatalogStatus.toValue(),
      if (serverList != null) 'serverList': serverList,
    };
  }
}

class ImportAppCatalogResponse {
  ImportAppCatalogResponse();

  factory ImportAppCatalogResponse.fromJson(Map<String, dynamic> _) {
    return ImportAppCatalogResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class ImportServerCatalogResponse {
  ImportServerCatalogResponse();

  factory ImportServerCatalogResponse.fromJson(Map<String, dynamic> _) {
    return ImportServerCatalogResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class LaunchAppResponse {
  LaunchAppResponse();

  factory LaunchAppResponse.fromJson(Map<String, dynamic> _) {
    return LaunchAppResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Details about the latest launch of an application.
class LaunchDetails {
  /// The latest time that this application was launched successfully.
  final DateTime? latestLaunchTime;

  /// The ID of the latest stack launched for this application.
  final String? stackId;

  /// The name of the latest stack launched for this application.
  final String? stackName;

  LaunchDetails({
    this.latestLaunchTime,
    this.stackId,
    this.stackName,
  });

  factory LaunchDetails.fromJson(Map<String, dynamic> json) {
    return LaunchDetails(
      latestLaunchTime: timeStampFromJson(json['latestLaunchTime']),
      stackId: json['stackId'] as String?,
      stackName: json['stackName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final latestLaunchTime = this.latestLaunchTime;
    final stackId = this.stackId;
    final stackName = this.stackName;
    return {
      if (latestLaunchTime != null)
        'latestLaunchTime': unixTimestampToJson(latestLaunchTime),
      if (stackId != null) 'stackId': stackId,
      if (stackName != null) 'stackName': stackName,
    };
  }
}

enum LicenseType {
  aws,
  byol,
}

extension LicenseTypeValueExtension on LicenseType {
  String toValue() {
    switch (this) {
      case LicenseType.aws:
        return 'AWS';
      case LicenseType.byol:
        return 'BYOL';
    }
  }
}

extension LicenseTypeFromString on String {
  LicenseType toLicenseType() {
    switch (this) {
      case 'AWS':
        return LicenseType.aws;
      case 'BYOL':
        return LicenseType.byol;
    }
    throw Exception('$this is not known in enum LicenseType');
  }
}

class ListAppsResponse {
  /// The application summaries.
  final List<AppSummary>? apps;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  final String? nextToken;

  ListAppsResponse({
    this.apps,
    this.nextToken,
  });

  factory ListAppsResponse.fromJson(Map<String, dynamic> json) {
    return ListAppsResponse(
      apps: (json['apps'] as List?)
          ?.whereNotNull()
          .map((e) => AppSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apps = this.apps;
    final nextToken = this.nextToken;
    return {
      if (apps != null) 'apps': apps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Contains the status of validating an application.
class NotificationContext {
  /// The status of the validation.
  final ValidationStatus? status;

  /// The status message.
  final String? statusMessage;

  /// The ID of the validation.
  final String? validationId;

  NotificationContext({
    this.status,
    this.statusMessage,
    this.validationId,
  });

  Map<String, dynamic> toJson() {
    final status = this.status;
    final statusMessage = this.statusMessage;
    final validationId = this.validationId;
    return {
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (validationId != null) 'validationId': validationId,
    };
  }
}

class NotifyAppValidationOutputResponse {
  NotifyAppValidationOutputResponse();

  factory NotifyAppValidationOutputResponse.fromJson(Map<String, dynamic> _) {
    return NotifyAppValidationOutputResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum OutputFormat {
  json,
  yaml,
}

extension OutputFormatValueExtension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.json:
        return 'JSON';
      case OutputFormat.yaml:
        return 'YAML';
    }
  }
}

extension OutputFormatFromString on String {
  OutputFormat toOutputFormat() {
    switch (this) {
      case 'JSON':
        return OutputFormat.json;
      case 'YAML':
        return OutputFormat.yaml;
    }
    throw Exception('$this is not known in enum OutputFormat');
  }
}

class PutAppLaunchConfigurationResponse {
  PutAppLaunchConfigurationResponse();

  factory PutAppLaunchConfigurationResponse.fromJson(Map<String, dynamic> _) {
    return PutAppLaunchConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutAppReplicationConfigurationResponse {
  PutAppReplicationConfigurationResponse();

  factory PutAppReplicationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutAppReplicationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class PutAppValidationConfigurationResponse {
  PutAppValidationConfigurationResponse();

  factory PutAppValidationConfigurationResponse.fromJson(
      Map<String, dynamic> _) {
    return PutAppValidationConfigurationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Represents a replication job.
class ReplicationJob {
  /// The description of the replication job.
  final String? description;

  /// Indicates whether the replication job should produce encrypted AMIs.
  final bool? encrypted;

  /// The time between consecutive replication runs, in hours.
  final int? frequency;

  /// The ID of the KMS key for replication jobs that produce encrypted AMIs. This
  /// value can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// KMS key ID
  /// </li>
  /// <li>
  /// KMS key alias
  /// </li>
  /// <li>
  /// ARN referring to the KMS key ID
  /// </li>
  /// <li>
  /// ARN referring to the KMS key alias
  /// </li>
  /// </ul>
  /// If encrypted is enabled but a KMS key ID is not specified, the customer's
  /// default KMS key for Amazon EBS is used.
  final String? kmsKeyId;

  /// The ID of the latest Amazon Machine Image (AMI).
  final String? latestAmiId;

  /// The license type to be used for the AMI created by a successful replication
  /// run.
  final LicenseType? licenseType;

  /// The start time of the next replication run.
  final DateTime? nextReplicationRunStartTime;

  /// The number of recent AMIs to keep in the customer's account for a
  /// replication job. By default, the value is set to zero, meaning that all AMIs
  /// are kept.
  final int? numberOfRecentAmisToKeep;

  /// The ID of the replication job.
  final String? replicationJobId;

  /// Information about the replication runs.
  final List<ReplicationRun>? replicationRunList;

  /// The name of the IAM role to be used by Server Migration Service.
  final String? roleName;

  /// Indicates whether to run the replication job one time.
  final bool? runOnce;

  /// The seed replication time.
  final DateTime? seedReplicationTime;

  /// The ID of the server.
  final String? serverId;

  /// The type of server.
  final ServerType? serverType;

  /// The state of the replication job.
  final ReplicationJobState? state;

  /// The description of the current status of the replication job.
  final String? statusMessage;

  /// Information about the VM server.
  final VmServer? vmServer;

  ReplicationJob({
    this.description,
    this.encrypted,
    this.frequency,
    this.kmsKeyId,
    this.latestAmiId,
    this.licenseType,
    this.nextReplicationRunStartTime,
    this.numberOfRecentAmisToKeep,
    this.replicationJobId,
    this.replicationRunList,
    this.roleName,
    this.runOnce,
    this.seedReplicationTime,
    this.serverId,
    this.serverType,
    this.state,
    this.statusMessage,
    this.vmServer,
  });

  factory ReplicationJob.fromJson(Map<String, dynamic> json) {
    return ReplicationJob(
      description: json['description'] as String?,
      encrypted: json['encrypted'] as bool?,
      frequency: json['frequency'] as int?,
      kmsKeyId: json['kmsKeyId'] as String?,
      latestAmiId: json['latestAmiId'] as String?,
      licenseType: (json['licenseType'] as String?)?.toLicenseType(),
      nextReplicationRunStartTime:
          timeStampFromJson(json['nextReplicationRunStartTime']),
      numberOfRecentAmisToKeep: json['numberOfRecentAmisToKeep'] as int?,
      replicationJobId: json['replicationJobId'] as String?,
      replicationRunList: (json['replicationRunList'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationRun.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleName: json['roleName'] as String?,
      runOnce: json['runOnce'] as bool?,
      seedReplicationTime: timeStampFromJson(json['seedReplicationTime']),
      serverId: json['serverId'] as String?,
      serverType: (json['serverType'] as String?)?.toServerType(),
      state: (json['state'] as String?)?.toReplicationJobState(),
      statusMessage: json['statusMessage'] as String?,
      vmServer: json['vmServer'] != null
          ? VmServer.fromJson(json['vmServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final description = this.description;
    final encrypted = this.encrypted;
    final frequency = this.frequency;
    final kmsKeyId = this.kmsKeyId;
    final latestAmiId = this.latestAmiId;
    final licenseType = this.licenseType;
    final nextReplicationRunStartTime = this.nextReplicationRunStartTime;
    final numberOfRecentAmisToKeep = this.numberOfRecentAmisToKeep;
    final replicationJobId = this.replicationJobId;
    final replicationRunList = this.replicationRunList;
    final roleName = this.roleName;
    final runOnce = this.runOnce;
    final seedReplicationTime = this.seedReplicationTime;
    final serverId = this.serverId;
    final serverType = this.serverType;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final vmServer = this.vmServer;
    return {
      if (description != null) 'description': description,
      if (encrypted != null) 'encrypted': encrypted,
      if (frequency != null) 'frequency': frequency,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (latestAmiId != null) 'latestAmiId': latestAmiId,
      if (licenseType != null) 'licenseType': licenseType.toValue(),
      if (nextReplicationRunStartTime != null)
        'nextReplicationRunStartTime':
            unixTimestampToJson(nextReplicationRunStartTime),
      if (numberOfRecentAmisToKeep != null)
        'numberOfRecentAmisToKeep': numberOfRecentAmisToKeep,
      if (replicationJobId != null) 'replicationJobId': replicationJobId,
      if (replicationRunList != null) 'replicationRunList': replicationRunList,
      if (roleName != null) 'roleName': roleName,
      if (runOnce != null) 'runOnce': runOnce,
      if (seedReplicationTime != null)
        'seedReplicationTime': unixTimestampToJson(seedReplicationTime),
      if (serverId != null) 'serverId': serverId,
      if (serverType != null) 'serverType': serverType.toValue(),
      if (state != null) 'state': state.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vmServer != null) 'vmServer': vmServer,
    };
  }
}

enum ReplicationJobState {
  pending,
  active,
  failed,
  deleting,
  deleted,
  completed,
  pausedOnFailure,
  failing,
}

extension ReplicationJobStateValueExtension on ReplicationJobState {
  String toValue() {
    switch (this) {
      case ReplicationJobState.pending:
        return 'PENDING';
      case ReplicationJobState.active:
        return 'ACTIVE';
      case ReplicationJobState.failed:
        return 'FAILED';
      case ReplicationJobState.deleting:
        return 'DELETING';
      case ReplicationJobState.deleted:
        return 'DELETED';
      case ReplicationJobState.completed:
        return 'COMPLETED';
      case ReplicationJobState.pausedOnFailure:
        return 'PAUSED_ON_FAILURE';
      case ReplicationJobState.failing:
        return 'FAILING';
    }
  }
}

extension ReplicationJobStateFromString on String {
  ReplicationJobState toReplicationJobState() {
    switch (this) {
      case 'PENDING':
        return ReplicationJobState.pending;
      case 'ACTIVE':
        return ReplicationJobState.active;
      case 'FAILED':
        return ReplicationJobState.failed;
      case 'DELETING':
        return ReplicationJobState.deleting;
      case 'DELETED':
        return ReplicationJobState.deleted;
      case 'COMPLETED':
        return ReplicationJobState.completed;
      case 'PAUSED_ON_FAILURE':
        return ReplicationJobState.pausedOnFailure;
      case 'FAILING':
        return ReplicationJobState.failing;
    }
    throw Exception('$this is not known in enum ReplicationJobState');
  }
}

/// Represents a replication run.
class ReplicationRun {
  /// The ID of the Amazon Machine Image (AMI) from the replication run.
  final String? amiId;

  /// The completion time of the last replication run.
  final DateTime? completedTime;

  /// The description of the replication run.
  final String? description;

  /// Indicates whether the replication run should produce an encrypted AMI.
  final bool? encrypted;

  /// The ID of the KMS key for replication jobs that produce encrypted AMIs. This
  /// value can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// KMS key ID
  /// </li>
  /// <li>
  /// KMS key alias
  /// </li>
  /// <li>
  /// ARN referring to the KMS key ID
  /// </li>
  /// <li>
  /// ARN referring to the KMS key alias
  /// </li>
  /// </ul>
  /// If encrypted is <i>true</i> but a KMS key ID is not specified, the
  /// customer's default KMS key for Amazon EBS is used.
  final String? kmsKeyId;

  /// The ID of the replication run.
  final String? replicationRunId;

  /// The start time of the next replication run.
  final DateTime? scheduledStartTime;

  /// Details about the current stage of the replication run.
  final ReplicationRunStageDetails? stageDetails;

  /// The state of the replication run.
  final ReplicationRunState? state;

  /// The description of the current status of the replication job.
  final String? statusMessage;

  /// The type of replication run.
  final ReplicationRunType? type;

  ReplicationRun({
    this.amiId,
    this.completedTime,
    this.description,
    this.encrypted,
    this.kmsKeyId,
    this.replicationRunId,
    this.scheduledStartTime,
    this.stageDetails,
    this.state,
    this.statusMessage,
    this.type,
  });

  factory ReplicationRun.fromJson(Map<String, dynamic> json) {
    return ReplicationRun(
      amiId: json['amiId'] as String?,
      completedTime: timeStampFromJson(json['completedTime']),
      description: json['description'] as String?,
      encrypted: json['encrypted'] as bool?,
      kmsKeyId: json['kmsKeyId'] as String?,
      replicationRunId: json['replicationRunId'] as String?,
      scheduledStartTime: timeStampFromJson(json['scheduledStartTime']),
      stageDetails: json['stageDetails'] != null
          ? ReplicationRunStageDetails.fromJson(
              json['stageDetails'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toReplicationRunState(),
      statusMessage: json['statusMessage'] as String?,
      type: (json['type'] as String?)?.toReplicationRunType(),
    );
  }

  Map<String, dynamic> toJson() {
    final amiId = this.amiId;
    final completedTime = this.completedTime;
    final description = this.description;
    final encrypted = this.encrypted;
    final kmsKeyId = this.kmsKeyId;
    final replicationRunId = this.replicationRunId;
    final scheduledStartTime = this.scheduledStartTime;
    final stageDetails = this.stageDetails;
    final state = this.state;
    final statusMessage = this.statusMessage;
    final type = this.type;
    return {
      if (amiId != null) 'amiId': amiId,
      if (completedTime != null)
        'completedTime': unixTimestampToJson(completedTime),
      if (description != null) 'description': description,
      if (encrypted != null) 'encrypted': encrypted,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (replicationRunId != null) 'replicationRunId': replicationRunId,
      if (scheduledStartTime != null)
        'scheduledStartTime': unixTimestampToJson(scheduledStartTime),
      if (stageDetails != null) 'stageDetails': stageDetails,
      if (state != null) 'state': state.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Details of the current stage of a replication run.
class ReplicationRunStageDetails {
  /// The current stage of a replication run.
  final String? stage;

  /// The progress of the current stage of a replication run.
  final String? stageProgress;

  ReplicationRunStageDetails({
    this.stage,
    this.stageProgress,
  });

  factory ReplicationRunStageDetails.fromJson(Map<String, dynamic> json) {
    return ReplicationRunStageDetails(
      stage: json['stage'] as String?,
      stageProgress: json['stageProgress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stage = this.stage;
    final stageProgress = this.stageProgress;
    return {
      if (stage != null) 'stage': stage,
      if (stageProgress != null) 'stageProgress': stageProgress,
    };
  }
}

enum ReplicationRunState {
  pending,
  missed,
  active,
  failed,
  completed,
  deleting,
  deleted,
}

extension ReplicationRunStateValueExtension on ReplicationRunState {
  String toValue() {
    switch (this) {
      case ReplicationRunState.pending:
        return 'PENDING';
      case ReplicationRunState.missed:
        return 'MISSED';
      case ReplicationRunState.active:
        return 'ACTIVE';
      case ReplicationRunState.failed:
        return 'FAILED';
      case ReplicationRunState.completed:
        return 'COMPLETED';
      case ReplicationRunState.deleting:
        return 'DELETING';
      case ReplicationRunState.deleted:
        return 'DELETED';
    }
  }
}

extension ReplicationRunStateFromString on String {
  ReplicationRunState toReplicationRunState() {
    switch (this) {
      case 'PENDING':
        return ReplicationRunState.pending;
      case 'MISSED':
        return ReplicationRunState.missed;
      case 'ACTIVE':
        return ReplicationRunState.active;
      case 'FAILED':
        return ReplicationRunState.failed;
      case 'COMPLETED':
        return ReplicationRunState.completed;
      case 'DELETING':
        return ReplicationRunState.deleting;
      case 'DELETED':
        return ReplicationRunState.deleted;
    }
    throw Exception('$this is not known in enum ReplicationRunState');
  }
}

enum ReplicationRunType {
  onDemand,
  automatic,
}

extension ReplicationRunTypeValueExtension on ReplicationRunType {
  String toValue() {
    switch (this) {
      case ReplicationRunType.onDemand:
        return 'ON_DEMAND';
      case ReplicationRunType.automatic:
        return 'AUTOMATIC';
    }
  }
}

extension ReplicationRunTypeFromString on String {
  ReplicationRunType toReplicationRunType() {
    switch (this) {
      case 'ON_DEMAND':
        return ReplicationRunType.onDemand;
      case 'AUTOMATIC':
        return ReplicationRunType.automatic;
    }
    throw Exception('$this is not known in enum ReplicationRunType');
  }
}

/// Location of an Amazon S3 object.
class S3Location {
  /// The Amazon S3 bucket name.
  final String? bucket;

  /// The Amazon S3 bucket key.
  final String? key;

  S3Location({
    this.bucket,
    this.key,
  });

  factory S3Location.fromJson(Map<String, dynamic> json) {
    return S3Location(
      bucket: json['bucket'] as String?,
      key: json['key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    return {
      if (bucket != null) 'bucket': bucket,
      if (key != null) 'key': key,
    };
  }
}

/// Contains the location of validation output.
class SSMOutput {
  final S3Location? s3Location;

  SSMOutput({
    this.s3Location,
  });

  factory SSMOutput.fromJson(Map<String, dynamic> json) {
    return SSMOutput(
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Contains validation parameters.
class SSMValidationParameters {
  /// The command to run the validation script.
  final String? command;

  /// The timeout interval, in seconds.
  final int? executionTimeoutSeconds;

  /// The ID of the instance. The instance must have the following tag:
  /// UserForSMSApplicationValidation=true.
  final String? instanceId;

  /// The name of the S3 bucket for output.
  final String? outputS3BucketName;

  /// The type of validation script.
  final ScriptType? scriptType;

  /// The location of the validation script.
  final Source? source;

  SSMValidationParameters({
    this.command,
    this.executionTimeoutSeconds,
    this.instanceId,
    this.outputS3BucketName,
    this.scriptType,
    this.source,
  });

  factory SSMValidationParameters.fromJson(Map<String, dynamic> json) {
    return SSMValidationParameters(
      command: json['command'] as String?,
      executionTimeoutSeconds: json['executionTimeoutSeconds'] as int?,
      instanceId: json['instanceId'] as String?,
      outputS3BucketName: json['outputS3BucketName'] as String?,
      scriptType: (json['scriptType'] as String?)?.toScriptType(),
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final executionTimeoutSeconds = this.executionTimeoutSeconds;
    final instanceId = this.instanceId;
    final outputS3BucketName = this.outputS3BucketName;
    final scriptType = this.scriptType;
    final source = this.source;
    return {
      if (command != null) 'command': command,
      if (executionTimeoutSeconds != null)
        'executionTimeoutSeconds': executionTimeoutSeconds,
      if (instanceId != null) 'instanceId': instanceId,
      if (outputS3BucketName != null) 'outputS3BucketName': outputS3BucketName,
      if (scriptType != null) 'scriptType': scriptType.toValue(),
      if (source != null) 'source': source,
    };
  }
}

enum ScriptType {
  shellScript,
  powershellScript,
}

extension ScriptTypeValueExtension on ScriptType {
  String toValue() {
    switch (this) {
      case ScriptType.shellScript:
        return 'SHELL_SCRIPT';
      case ScriptType.powershellScript:
        return 'POWERSHELL_SCRIPT';
    }
  }
}

extension ScriptTypeFromString on String {
  ScriptType toScriptType() {
    switch (this) {
      case 'SHELL_SCRIPT':
        return ScriptType.shellScript;
      case 'POWERSHELL_SCRIPT':
        return ScriptType.powershellScript;
    }
    throw Exception('$this is not known in enum ScriptType');
  }
}

/// Represents a server.
class Server {
  /// The ID of the replication job.
  final String? replicationJobId;

  /// Indicates whether the replication job is deleted or failed.
  final bool? replicationJobTerminated;

  /// The ID of the server.
  final String? serverId;

  /// The type of server.
  final ServerType? serverType;

  /// Information about the VM server.
  final VmServer? vmServer;

  Server({
    this.replicationJobId,
    this.replicationJobTerminated,
    this.serverId,
    this.serverType,
    this.vmServer,
  });

  factory Server.fromJson(Map<String, dynamic> json) {
    return Server(
      replicationJobId: json['replicationJobId'] as String?,
      replicationJobTerminated: json['replicationJobTerminated'] as bool?,
      serverId: json['serverId'] as String?,
      serverType: (json['serverType'] as String?)?.toServerType(),
      vmServer: json['vmServer'] != null
          ? VmServer.fromJson(json['vmServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationJobId = this.replicationJobId;
    final replicationJobTerminated = this.replicationJobTerminated;
    final serverId = this.serverId;
    final serverType = this.serverType;
    final vmServer = this.vmServer;
    return {
      if (replicationJobId != null) 'replicationJobId': replicationJobId,
      if (replicationJobTerminated != null)
        'replicationJobTerminated': replicationJobTerminated,
      if (serverId != null) 'serverId': serverId,
      if (serverType != null) 'serverType': serverType.toValue(),
      if (vmServer != null) 'vmServer': vmServer,
    };
  }
}

enum ServerCatalogStatus {
  notImported,
  importing,
  available,
  deleted,
  expired,
}

extension ServerCatalogStatusValueExtension on ServerCatalogStatus {
  String toValue() {
    switch (this) {
      case ServerCatalogStatus.notImported:
        return 'NOT_IMPORTED';
      case ServerCatalogStatus.importing:
        return 'IMPORTING';
      case ServerCatalogStatus.available:
        return 'AVAILABLE';
      case ServerCatalogStatus.deleted:
        return 'DELETED';
      case ServerCatalogStatus.expired:
        return 'EXPIRED';
    }
  }
}

extension ServerCatalogStatusFromString on String {
  ServerCatalogStatus toServerCatalogStatus() {
    switch (this) {
      case 'NOT_IMPORTED':
        return ServerCatalogStatus.notImported;
      case 'IMPORTING':
        return ServerCatalogStatus.importing;
      case 'AVAILABLE':
        return ServerCatalogStatus.available;
      case 'DELETED':
        return ServerCatalogStatus.deleted;
      case 'EXPIRED':
        return ServerCatalogStatus.expired;
    }
    throw Exception('$this is not known in enum ServerCatalogStatus');
  }
}

/// Logical grouping of servers.
class ServerGroup {
  /// The name of a server group.
  final String? name;

  /// The ID of a server group.
  final String? serverGroupId;

  /// The servers that belong to a server group.
  final List<Server>? serverList;

  ServerGroup({
    this.name,
    this.serverGroupId,
    this.serverList,
  });

  factory ServerGroup.fromJson(Map<String, dynamic> json) {
    return ServerGroup(
      name: json['name'] as String?,
      serverGroupId: json['serverGroupId'] as String?,
      serverList: (json['serverList'] as List?)
          ?.whereNotNull()
          .map((e) => Server.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final serverGroupId = this.serverGroupId;
    final serverList = this.serverList;
    return {
      if (name != null) 'name': name,
      if (serverGroupId != null) 'serverGroupId': serverGroupId,
      if (serverList != null) 'serverList': serverList,
    };
  }
}

/// Launch configuration for a server group.
class ServerGroupLaunchConfiguration {
  /// The launch order of servers in the server group.
  final int? launchOrder;

  /// The ID of the server group with which the launch configuration is
  /// associated.
  final String? serverGroupId;

  /// The launch configuration for servers in the server group.
  final List<ServerLaunchConfiguration>? serverLaunchConfigurations;

  ServerGroupLaunchConfiguration({
    this.launchOrder,
    this.serverGroupId,
    this.serverLaunchConfigurations,
  });

  factory ServerGroupLaunchConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerGroupLaunchConfiguration(
      launchOrder: json['launchOrder'] as int?,
      serverGroupId: json['serverGroupId'] as String?,
      serverLaunchConfigurations: (json['serverLaunchConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) =>
              ServerLaunchConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final launchOrder = this.launchOrder;
    final serverGroupId = this.serverGroupId;
    final serverLaunchConfigurations = this.serverLaunchConfigurations;
    return {
      if (launchOrder != null) 'launchOrder': launchOrder,
      if (serverGroupId != null) 'serverGroupId': serverGroupId,
      if (serverLaunchConfigurations != null)
        'serverLaunchConfigurations': serverLaunchConfigurations,
    };
  }
}

/// Replication configuration for a server group.
class ServerGroupReplicationConfiguration {
  /// The ID of the server group with which this replication configuration is
  /// associated.
  final String? serverGroupId;

  /// The replication configuration for servers in the server group.
  final List<ServerReplicationConfiguration>? serverReplicationConfigurations;

  ServerGroupReplicationConfiguration({
    this.serverGroupId,
    this.serverReplicationConfigurations,
  });

  factory ServerGroupReplicationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerGroupReplicationConfiguration(
      serverGroupId: json['serverGroupId'] as String?,
      serverReplicationConfigurations:
          (json['serverReplicationConfigurations'] as List?)
              ?.whereNotNull()
              .map((e) => ServerReplicationConfiguration.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverGroupId = this.serverGroupId;
    final serverReplicationConfigurations =
        this.serverReplicationConfigurations;
    return {
      if (serverGroupId != null) 'serverGroupId': serverGroupId,
      if (serverReplicationConfigurations != null)
        'serverReplicationConfigurations': serverReplicationConfigurations,
    };
  }
}

/// Configuration for validating an instance.
class ServerGroupValidationConfiguration {
  /// The ID of the server group.
  final String? serverGroupId;

  /// The validation configuration.
  final List<ServerValidationConfiguration>? serverValidationConfigurations;

  ServerGroupValidationConfiguration({
    this.serverGroupId,
    this.serverValidationConfigurations,
  });

  factory ServerGroupValidationConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServerGroupValidationConfiguration(
      serverGroupId: json['serverGroupId'] as String?,
      serverValidationConfigurations: (json['serverValidationConfigurations']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ServerValidationConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final serverGroupId = this.serverGroupId;
    final serverValidationConfigurations = this.serverValidationConfigurations;
    return {
      if (serverGroupId != null) 'serverGroupId': serverGroupId,
      if (serverValidationConfigurations != null)
        'serverValidationConfigurations': serverValidationConfigurations,
    };
  }
}

/// Launch configuration for a server.
class ServerLaunchConfiguration {
  /// Indicates whether a publicly accessible IP address is created when launching
  /// the server.
  final bool? associatePublicIpAddress;
  final S3Location? configureScript;

  /// The type of configuration script.
  final ScriptType? configureScriptType;

  /// The name of the Amazon EC2 SSH key to be used for connecting to the launched
  /// server.
  final String? ec2KeyName;

  /// The name of the IAM instance profile.
  final String? iamInstanceProfileName;

  /// The instance type to use when launching the server.
  final String? instanceType;

  /// The logical ID of the server in the CloudFormation template.
  final String? logicalId;

  /// The ID of the security group that applies to the launched server.
  final String? securityGroup;

  /// The ID of the server with which the launch configuration is associated.
  final Server? server;

  /// The ID of the subnet the server should be launched into.
  final String? subnet;

  /// Location of the user-data script to be executed when launching the server.
  final UserData? userData;

  /// The ID of the VPC into which the server should be launched.
  final String? vpc;

  ServerLaunchConfiguration({
    this.associatePublicIpAddress,
    this.configureScript,
    this.configureScriptType,
    this.ec2KeyName,
    this.iamInstanceProfileName,
    this.instanceType,
    this.logicalId,
    this.securityGroup,
    this.server,
    this.subnet,
    this.userData,
    this.vpc,
  });

  factory ServerLaunchConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerLaunchConfiguration(
      associatePublicIpAddress: json['associatePublicIpAddress'] as bool?,
      configureScript: json['configureScript'] != null
          ? S3Location.fromJson(json['configureScript'] as Map<String, dynamic>)
          : null,
      configureScriptType:
          (json['configureScriptType'] as String?)?.toScriptType(),
      ec2KeyName: json['ec2KeyName'] as String?,
      iamInstanceProfileName: json['iamInstanceProfileName'] as String?,
      instanceType: json['instanceType'] as String?,
      logicalId: json['logicalId'] as String?,
      securityGroup: json['securityGroup'] as String?,
      server: json['server'] != null
          ? Server.fromJson(json['server'] as Map<String, dynamic>)
          : null,
      subnet: json['subnet'] as String?,
      userData: json['userData'] != null
          ? UserData.fromJson(json['userData'] as Map<String, dynamic>)
          : null,
      vpc: json['vpc'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final associatePublicIpAddress = this.associatePublicIpAddress;
    final configureScript = this.configureScript;
    final configureScriptType = this.configureScriptType;
    final ec2KeyName = this.ec2KeyName;
    final iamInstanceProfileName = this.iamInstanceProfileName;
    final instanceType = this.instanceType;
    final logicalId = this.logicalId;
    final securityGroup = this.securityGroup;
    final server = this.server;
    final subnet = this.subnet;
    final userData = this.userData;
    final vpc = this.vpc;
    return {
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (configureScript != null) 'configureScript': configureScript,
      if (configureScriptType != null)
        'configureScriptType': configureScriptType.toValue(),
      if (ec2KeyName != null) 'ec2KeyName': ec2KeyName,
      if (iamInstanceProfileName != null)
        'iamInstanceProfileName': iamInstanceProfileName,
      if (instanceType != null) 'instanceType': instanceType,
      if (logicalId != null) 'logicalId': logicalId,
      if (securityGroup != null) 'securityGroup': securityGroup,
      if (server != null) 'server': server,
      if (subnet != null) 'subnet': subnet,
      if (userData != null) 'userData': userData,
      if (vpc != null) 'vpc': vpc,
    };
  }
}

/// Replication configuration of a server.
class ServerReplicationConfiguration {
  /// The ID of the server with which this replication configuration is
  /// associated.
  final Server? server;

  /// The parameters for replicating the server.
  final ServerReplicationParameters? serverReplicationParameters;

  ServerReplicationConfiguration({
    this.server,
    this.serverReplicationParameters,
  });

  factory ServerReplicationConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerReplicationConfiguration(
      server: json['server'] != null
          ? Server.fromJson(json['server'] as Map<String, dynamic>)
          : null,
      serverReplicationParameters: json['serverReplicationParameters'] != null
          ? ServerReplicationParameters.fromJson(
              json['serverReplicationParameters'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    final serverReplicationParameters = this.serverReplicationParameters;
    return {
      if (server != null) 'server': server,
      if (serverReplicationParameters != null)
        'serverReplicationParameters': serverReplicationParameters,
    };
  }
}

/// The replication parameters for replicating a server.
class ServerReplicationParameters {
  /// Indicates whether the replication job produces encrypted AMIs.
  final bool? encrypted;

  /// The frequency of creating replication jobs for the server.
  final int? frequency;

  /// The ID of the KMS key for replication jobs that produce encrypted AMIs. This
  /// value can be any of the following:
  ///
  /// <ul>
  /// <li>
  /// KMS key ID
  /// </li>
  /// <li>
  /// KMS key alias
  /// </li>
  /// <li>
  /// ARN referring to the KMS key ID
  /// </li>
  /// <li>
  /// ARN referring to the KMS key alias
  /// </li>
  /// </ul>
  /// If encrypted is enabled but a KMS key ID is not specified, the customer's
  /// default KMS key for Amazon EBS is used.
  final String? kmsKeyId;

  /// The license type for creating a replication job for the server.
  final LicenseType? licenseType;

  /// The number of recent AMIs to keep when creating a replication job for this
  /// server.
  final int? numberOfRecentAmisToKeep;

  /// Indicates whether to run the replication job one time.
  final bool? runOnce;

  /// The seed time for creating a replication job for the server.
  final DateTime? seedTime;

  ServerReplicationParameters({
    this.encrypted,
    this.frequency,
    this.kmsKeyId,
    this.licenseType,
    this.numberOfRecentAmisToKeep,
    this.runOnce,
    this.seedTime,
  });

  factory ServerReplicationParameters.fromJson(Map<String, dynamic> json) {
    return ServerReplicationParameters(
      encrypted: json['encrypted'] as bool?,
      frequency: json['frequency'] as int?,
      kmsKeyId: json['kmsKeyId'] as String?,
      licenseType: (json['licenseType'] as String?)?.toLicenseType(),
      numberOfRecentAmisToKeep: json['numberOfRecentAmisToKeep'] as int?,
      runOnce: json['runOnce'] as bool?,
      seedTime: timeStampFromJson(json['seedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final encrypted = this.encrypted;
    final frequency = this.frequency;
    final kmsKeyId = this.kmsKeyId;
    final licenseType = this.licenseType;
    final numberOfRecentAmisToKeep = this.numberOfRecentAmisToKeep;
    final runOnce = this.runOnce;
    final seedTime = this.seedTime;
    return {
      if (encrypted != null) 'encrypted': encrypted,
      if (frequency != null) 'frequency': frequency,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (licenseType != null) 'licenseType': licenseType.toValue(),
      if (numberOfRecentAmisToKeep != null)
        'numberOfRecentAmisToKeep': numberOfRecentAmisToKeep,
      if (runOnce != null) 'runOnce': runOnce,
      if (seedTime != null) 'seedTime': unixTimestampToJson(seedTime),
    };
  }
}

enum ServerType {
  virtualMachine,
}

extension ServerTypeValueExtension on ServerType {
  String toValue() {
    switch (this) {
      case ServerType.virtualMachine:
        return 'VIRTUAL_MACHINE';
    }
  }
}

extension ServerTypeFromString on String {
  ServerType toServerType() {
    switch (this) {
      case 'VIRTUAL_MACHINE':
        return ServerType.virtualMachine;
    }
    throw Exception('$this is not known in enum ServerType');
  }
}

/// Configuration for validating an instance.
class ServerValidationConfiguration {
  /// The name of the configuration.
  final String? name;
  final Server? server;

  /// The validation strategy.
  final ServerValidationStrategy? serverValidationStrategy;

  /// The validation parameters.
  final UserDataValidationParameters? userDataValidationParameters;

  /// The ID of the validation.
  final String? validationId;

  ServerValidationConfiguration({
    this.name,
    this.server,
    this.serverValidationStrategy,
    this.userDataValidationParameters,
    this.validationId,
  });

  factory ServerValidationConfiguration.fromJson(Map<String, dynamic> json) {
    return ServerValidationConfiguration(
      name: json['name'] as String?,
      server: json['server'] != null
          ? Server.fromJson(json['server'] as Map<String, dynamic>)
          : null,
      serverValidationStrategy: (json['serverValidationStrategy'] as String?)
          ?.toServerValidationStrategy(),
      userDataValidationParameters: json['userDataValidationParameters'] != null
          ? UserDataValidationParameters.fromJson(
              json['userDataValidationParameters'] as Map<String, dynamic>)
          : null,
      validationId: json['validationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final server = this.server;
    final serverValidationStrategy = this.serverValidationStrategy;
    final userDataValidationParameters = this.userDataValidationParameters;
    final validationId = this.validationId;
    return {
      if (name != null) 'name': name,
      if (server != null) 'server': server,
      if (serverValidationStrategy != null)
        'serverValidationStrategy': serverValidationStrategy.toValue(),
      if (userDataValidationParameters != null)
        'userDataValidationParameters': userDataValidationParameters,
      if (validationId != null) 'validationId': validationId,
    };
  }
}

/// Contains output from validating an instance.
class ServerValidationOutput {
  final Server? server;

  ServerValidationOutput({
    this.server,
  });

  factory ServerValidationOutput.fromJson(Map<String, dynamic> json) {
    return ServerValidationOutput(
      server: json['server'] != null
          ? Server.fromJson(json['server'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final server = this.server;
    return {
      if (server != null) 'server': server,
    };
  }
}

enum ServerValidationStrategy {
  userdata,
}

extension ServerValidationStrategyValueExtension on ServerValidationStrategy {
  String toValue() {
    switch (this) {
      case ServerValidationStrategy.userdata:
        return 'USERDATA';
    }
  }
}

extension ServerValidationStrategyFromString on String {
  ServerValidationStrategy toServerValidationStrategy() {
    switch (this) {
      case 'USERDATA':
        return ServerValidationStrategy.userdata;
    }
    throw Exception('$this is not known in enum ServerValidationStrategy');
  }
}

/// Contains the location of a validation script.
class Source {
  final S3Location? s3Location;

  Source({
    this.s3Location,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class StartAppReplicationResponse {
  StartAppReplicationResponse();

  factory StartAppReplicationResponse.fromJson(Map<String, dynamic> _) {
    return StartAppReplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartOnDemandAppReplicationResponse {
  StartOnDemandAppReplicationResponse();

  factory StartOnDemandAppReplicationResponse.fromJson(Map<String, dynamic> _) {
    return StartOnDemandAppReplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartOnDemandReplicationRunResponse {
  /// The ID of the replication run.
  final String? replicationRunId;

  StartOnDemandReplicationRunResponse({
    this.replicationRunId,
  });

  factory StartOnDemandReplicationRunResponse.fromJson(
      Map<String, dynamic> json) {
    return StartOnDemandReplicationRunResponse(
      replicationRunId: json['replicationRunId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationRunId = this.replicationRunId;
    return {
      if (replicationRunId != null) 'replicationRunId': replicationRunId,
    };
  }
}

class StopAppReplicationResponse {
  StopAppReplicationResponse();

  factory StopAppReplicationResponse.fromJson(Map<String, dynamic> _) {
    return StopAppReplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Key/value pair that can be assigned to an application.
class Tag {
  /// The tag key.
  final String? key;

  /// The tag value.
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

class TerminateAppResponse {
  TerminateAppResponse();

  factory TerminateAppResponse.fromJson(Map<String, dynamic> _) {
    return TerminateAppResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateAppResponse {
  /// A summary description of the application.
  final AppSummary? appSummary;

  /// The updated server groups in the application.
  final List<ServerGroup>? serverGroups;

  /// The tags associated with the application.
  final List<Tag>? tags;

  UpdateAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });

  factory UpdateAppResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAppResponse(
      appSummary: json['appSummary'] != null
          ? AppSummary.fromJson(json['appSummary'] as Map<String, dynamic>)
          : null,
      serverGroups: (json['serverGroups'] as List?)
          ?.whereNotNull()
          .map((e) => ServerGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final appSummary = this.appSummary;
    final serverGroups = this.serverGroups;
    final tags = this.tags;
    return {
      if (appSummary != null) 'appSummary': appSummary,
      if (serverGroups != null) 'serverGroups': serverGroups,
      if (tags != null) 'tags': tags,
    };
  }
}

class UpdateReplicationJobResponse {
  UpdateReplicationJobResponse();

  factory UpdateReplicationJobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateReplicationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// A script that runs on first launch of an Amazon EC2 instance. Used for
/// configuring the server during launch.
class UserData {
  /// Amazon S3 location of the user-data script.
  final S3Location? s3Location;

  UserData({
    this.s3Location,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      s3Location: json['s3Location'] != null
          ? S3Location.fromJson(json['s3Location'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Contains validation parameters.
class UserDataValidationParameters {
  /// The type of validation script.
  final ScriptType? scriptType;

  /// The location of the validation script.
  final Source? source;

  UserDataValidationParameters({
    this.scriptType,
    this.source,
  });

  factory UserDataValidationParameters.fromJson(Map<String, dynamic> json) {
    return UserDataValidationParameters(
      scriptType: (json['scriptType'] as String?)?.toScriptType(),
      source: json['source'] != null
          ? Source.fromJson(json['source'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final scriptType = this.scriptType;
    final source = this.source;
    return {
      if (scriptType != null) 'scriptType': scriptType.toValue(),
      if (source != null) 'source': source,
    };
  }
}

/// Contains validation output.
class ValidationOutput {
  /// The output from validating an application.
  final AppValidationOutput? appValidationOutput;

  /// The latest time that the validation was performed.
  final DateTime? latestValidationTime;

  /// The name of the validation.
  final String? name;

  /// The output from validation an instance.
  final ServerValidationOutput? serverValidationOutput;

  /// The status of the validation.
  final ValidationStatus? status;

  /// The status message.
  final String? statusMessage;

  /// The ID of the validation.
  final String? validationId;

  ValidationOutput({
    this.appValidationOutput,
    this.latestValidationTime,
    this.name,
    this.serverValidationOutput,
    this.status,
    this.statusMessage,
    this.validationId,
  });

  factory ValidationOutput.fromJson(Map<String, dynamic> json) {
    return ValidationOutput(
      appValidationOutput: json['appValidationOutput'] != null
          ? AppValidationOutput.fromJson(
              json['appValidationOutput'] as Map<String, dynamic>)
          : null,
      latestValidationTime: timeStampFromJson(json['latestValidationTime']),
      name: json['name'] as String?,
      serverValidationOutput: json['serverValidationOutput'] != null
          ? ServerValidationOutput.fromJson(
              json['serverValidationOutput'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toValidationStatus(),
      statusMessage: json['statusMessage'] as String?,
      validationId: json['validationId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final appValidationOutput = this.appValidationOutput;
    final latestValidationTime = this.latestValidationTime;
    final name = this.name;
    final serverValidationOutput = this.serverValidationOutput;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final validationId = this.validationId;
    return {
      if (appValidationOutput != null)
        'appValidationOutput': appValidationOutput,
      if (latestValidationTime != null)
        'latestValidationTime': unixTimestampToJson(latestValidationTime),
      if (name != null) 'name': name,
      if (serverValidationOutput != null)
        'serverValidationOutput': serverValidationOutput,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (validationId != null) 'validationId': validationId,
    };
  }
}

enum ValidationStatus {
  readyForValidation,
  pending,
  inProgress,
  succeeded,
  failed,
}

extension ValidationStatusValueExtension on ValidationStatus {
  String toValue() {
    switch (this) {
      case ValidationStatus.readyForValidation:
        return 'READY_FOR_VALIDATION';
      case ValidationStatus.pending:
        return 'PENDING';
      case ValidationStatus.inProgress:
        return 'IN_PROGRESS';
      case ValidationStatus.succeeded:
        return 'SUCCEEDED';
      case ValidationStatus.failed:
        return 'FAILED';
    }
  }
}

extension ValidationStatusFromString on String {
  ValidationStatus toValidationStatus() {
    switch (this) {
      case 'READY_FOR_VALIDATION':
        return ValidationStatus.readyForValidation;
      case 'PENDING':
        return ValidationStatus.pending;
      case 'IN_PROGRESS':
        return ValidationStatus.inProgress;
      case 'SUCCEEDED':
        return ValidationStatus.succeeded;
      case 'FAILED':
        return ValidationStatus.failed;
    }
    throw Exception('$this is not known in enum ValidationStatus');
  }
}

enum VmManagerType {
  vsphere,
  scvmm,
  hypervManager,
}

extension VmManagerTypeValueExtension on VmManagerType {
  String toValue() {
    switch (this) {
      case VmManagerType.vsphere:
        return 'VSPHERE';
      case VmManagerType.scvmm:
        return 'SCVMM';
      case VmManagerType.hypervManager:
        return 'HYPERV-MANAGER';
    }
  }
}

extension VmManagerTypeFromString on String {
  VmManagerType toVmManagerType() {
    switch (this) {
      case 'VSPHERE':
        return VmManagerType.vsphere;
      case 'SCVMM':
        return VmManagerType.scvmm;
      case 'HYPERV-MANAGER':
        return VmManagerType.hypervManager;
    }
    throw Exception('$this is not known in enum VmManagerType');
  }
}

/// Represents a VM server.
class VmServer {
  /// The name of the VM manager.
  final String? vmManagerName;

  /// The type of VM management product.
  final VmManagerType? vmManagerType;

  /// The name of the VM.
  final String? vmName;

  /// The VM folder path in the vCenter Server virtual machine inventory tree.
  final String? vmPath;

  /// The VM server location.
  final VmServerAddress? vmServerAddress;

  VmServer({
    this.vmManagerName,
    this.vmManagerType,
    this.vmName,
    this.vmPath,
    this.vmServerAddress,
  });

  factory VmServer.fromJson(Map<String, dynamic> json) {
    return VmServer(
      vmManagerName: json['vmManagerName'] as String?,
      vmManagerType: (json['vmManagerType'] as String?)?.toVmManagerType(),
      vmName: json['vmName'] as String?,
      vmPath: json['vmPath'] as String?,
      vmServerAddress: json['vmServerAddress'] != null
          ? VmServerAddress.fromJson(
              json['vmServerAddress'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final vmManagerName = this.vmManagerName;
    final vmManagerType = this.vmManagerType;
    final vmName = this.vmName;
    final vmPath = this.vmPath;
    final vmServerAddress = this.vmServerAddress;
    return {
      if (vmManagerName != null) 'vmManagerName': vmManagerName,
      if (vmManagerType != null) 'vmManagerType': vmManagerType.toValue(),
      if (vmName != null) 'vmName': vmName,
      if (vmPath != null) 'vmPath': vmPath,
      if (vmServerAddress != null) 'vmServerAddress': vmServerAddress,
    };
  }
}

/// Represents a VM server location.
class VmServerAddress {
  /// The ID of the VM.
  final String? vmId;

  /// The ID of the VM manager.
  final String? vmManagerId;

  VmServerAddress({
    this.vmId,
    this.vmManagerId,
  });

  factory VmServerAddress.fromJson(Map<String, dynamic> json) {
    return VmServerAddress(
      vmId: json['vmId'] as String?,
      vmManagerId: json['vmManagerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final vmId = this.vmId;
    final vmManagerId = this.vmManagerId;
    return {
      if (vmId != null) 'vmId': vmId,
      if (vmManagerId != null) 'vmManagerId': vmManagerId,
    };
  }
}

class DryRunOperationException extends _s.GenericAwsException {
  DryRunOperationException({String? type, String? message})
      : super(type: type, code: 'DryRunOperationException', message: message);
}

class InternalError extends _s.GenericAwsException {
  InternalError({String? type, String? message})
      : super(type: type, code: 'InternalError', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String? type, String? message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

class NoConnectorsAvailableException extends _s.GenericAwsException {
  NoConnectorsAvailableException({String? type, String? message})
      : super(
            type: type,
            code: 'NoConnectorsAvailableException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String? type, String? message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class ReplicationJobAlreadyExistsException extends _s.GenericAwsException {
  ReplicationJobAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationJobAlreadyExistsException',
            message: message);
}

class ReplicationJobNotFoundException extends _s.GenericAwsException {
  ReplicationJobNotFoundException({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationJobNotFoundException',
            message: message);
}

class ReplicationRunLimitExceededException extends _s.GenericAwsException {
  ReplicationRunLimitExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ReplicationRunLimitExceededException',
            message: message);
}

class ServerCannotBeReplicatedException extends _s.GenericAwsException {
  ServerCannotBeReplicatedException({String? type, String? message})
      : super(
            type: type,
            code: 'ServerCannotBeReplicatedException',
            message: message);
}

class TemporarilyUnavailableException extends _s.GenericAwsException {
  TemporarilyUnavailableException({String? type, String? message})
      : super(
            type: type,
            code: 'TemporarilyUnavailableException',
            message: message);
}

class UnauthorizedOperationException extends _s.GenericAwsException {
  UnauthorizedOperationException({String? type, String? message})
      : super(
            type: type,
            code: 'UnauthorizedOperationException',
            message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'DryRunOperationException': (type, message) =>
      DryRunOperationException(type: type, message: message),
  'InternalError': (type, message) =>
      InternalError(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'MissingRequiredParameterException': (type, message) =>
      MissingRequiredParameterException(type: type, message: message),
  'NoConnectorsAvailableException': (type, message) =>
      NoConnectorsAvailableException(type: type, message: message),
  'OperationNotPermittedException': (type, message) =>
      OperationNotPermittedException(type: type, message: message),
  'ReplicationJobAlreadyExistsException': (type, message) =>
      ReplicationJobAlreadyExistsException(type: type, message: message),
  'ReplicationJobNotFoundException': (type, message) =>
      ReplicationJobNotFoundException(type: type, message: message),
  'ReplicationRunLimitExceededException': (type, message) =>
      ReplicationRunLimitExceededException(type: type, message: message),
  'ServerCannotBeReplicatedException': (type, message) =>
      ServerCannotBeReplicatedException(type: type, message: message),
  'TemporarilyUnavailableException': (type, message) =>
      TemporarilyUnavailableException(type: type, message: message),
  'UnauthorizedOperationException': (type, message) =>
      UnauthorizedOperationException(type: type, message: message),
};
