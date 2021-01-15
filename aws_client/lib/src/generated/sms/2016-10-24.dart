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

part '2016-10-24.g.dart';

/// AWS Server Migration Service (AWS SMS) makes it easier and faster for you to
/// migrate your on-premises workloads to AWS. To learn more about AWS SMS, see
/// the following resources:
class Sms {
  final _s.JsonProtocol _protocol;
  Sms({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.JsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'sms',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
  /// The name of the service role in the customer's account to be used by AWS
  /// SMS.
  ///
  /// Parameter [serverGroups] :
  /// The server groups to include in the application.
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the application.
  Future<CreateAppResponse> createApp({
    String clientToken,
    String description,
    String name,
    String roleName,
    List<ServerGroup> serverGroups,
    List<Tag> tags,
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
  /// replication runs to replicate your server to AWS. Each replication run
  /// creates an Amazon Machine Image (AMI).
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
  /// The name of the IAM role to be used by the AWS SMS.
  ///
  /// Parameter [runOnce] :
  /// Indicates whether to run the replication job one time.
  Future<CreateReplicationJobResponse> createReplicationJob({
    @_s.required DateTime seedReplicationTime,
    @_s.required String serverId,
    String description,
    bool encrypted,
    int frequency,
    String kmsKeyId,
    LicenseType licenseType,
    int numberOfRecentAmisToKeep,
    String roleName,
    bool runOnce,
  }) async {
    ArgumentError.checkNotNull(seedReplicationTime, 'seedReplicationTime');
    ArgumentError.checkNotNull(serverId, 'serverId');
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
  /// associated with the application and all AWS SMS replication jobs for
  /// servers in the application.
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
    String appId,
    bool forceStopAppReplication,
    bool forceTerminateApp,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.DeleteApp'
    };
    final jsonResponse = await _protocol.send(
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

    return DeleteAppResponse.fromJson(jsonResponse.body);
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
    String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteAppLaunchConfiguration'
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

    return DeleteAppLaunchConfigurationResponse.fromJson(jsonResponse.body);
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
    String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteAppReplicationConfiguration'
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

    return DeleteAppReplicationConfigurationResponse.fromJson(
        jsonResponse.body);
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
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringPattern(
      'appId',
      appId,
      r'''^app-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteAppValidationConfiguration'
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

    return DeleteAppValidationConfigurationResponse.fromJson(jsonResponse.body);
  }

  /// Deletes the specified replication job.
  ///
  /// After you delete a replication job, there are no further replication runs.
  /// AWS deletes the contents of the Amazon S3 bucket used to store AWS SMS
  /// artifacts. The AMIs created by the replication runs are not deleted.
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
    @_s.required String replicationJobId,
  }) async {
    ArgumentError.checkNotNull(replicationJobId, 'replicationJobId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DeleteReplicationJob'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'replicationJobId': replicationJobId,
      },
    );

    return DeleteReplicationJobResponse.fromJson(jsonResponse.body);
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return DeleteServerCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Disassociates the specified connector from AWS SMS.
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
    @_s.required String connectorId,
  }) async {
    ArgumentError.checkNotNull(connectorId, 'connectorId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.DisassociateConnector'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        'connectorId': connectorId,
      },
    );

    return DisassociateConnectorResponse.fromJson(jsonResponse.body);
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
    String appId,
    OutputFormat changesetFormat,
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

  /// Generates an AWS CloudFormation template based on the current launch
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
  /// The ID of the application associated with the AWS CloudFormation template.
  ///
  /// Parameter [templateFormat] :
  /// The format for generating the AWS CloudFormation template.
  Future<GenerateTemplateResponse> generateTemplate({
    String appId,
    OutputFormat templateFormat,
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
    String appId,
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
    String appId,
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
    String appId,
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
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringPattern(
      'appId',
      appId,
      r'''^app-[0-9a-f]{17}$''',
      isRequired: true,
    );
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
    @_s.required String appId,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringPattern(
      'appId',
      appId,
      r'''^app-[0-9a-f]{17}$''',
      isRequired: true,
    );
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

  /// Describes the connectors registered with the AWS SMS.
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
    int maxResults,
    String nextToken,
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
    int maxResults,
    String nextToken,
    String replicationJobId,
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
    @_s.required String replicationJobId,
    int maxResults,
    String nextToken,
  }) async {
    ArgumentError.checkNotNull(replicationJobId, 'replicationJobId');
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
    int maxResults,
    String nextToken,
    List<VmServerAddress> vmServerAddressList,
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

  /// Allows application import from AWS Migration Hub.
  ///
  /// May throw [UnauthorizedOperationException].
  /// May throw [InvalidParameterException].
  /// May throw [MissingRequiredParameterException].
  /// May throw [InternalError].
  /// May throw [OperationNotPermittedException].
  ///
  /// Parameter [roleName] :
  /// The name of the service role. If you omit this parameter, we create a
  /// service-linked role for AWS Migration Hub in your account. Otherwise, the
  /// role that you provide must have the <a
  /// href="https://docs.aws.amazon.com/migrationhub/latest/ug/new-customer-setup.html#sms-managed">policy
  /// and trust policy</a> described in the <i>AWS Migration Hub User Guide</i>.
  Future<void> importAppCatalog({
    String roleName,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.ImportAppCatalog'
    };
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
      payload: {
        if (roleName != null) 'roleName': roleName,
      },
    );

    return ImportAppCatalogResponse.fromJson(jsonResponse.body);
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
    final jsonResponse = await _protocol.send(
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      // TODO queryParams
      headers: headers,
    );

    return ImportServerCatalogResponse.fromJson(jsonResponse.body);
  }

  /// Launches the specified application as a stack in AWS CloudFormation.
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
    String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.LaunchApp'
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

    return LaunchAppResponse.fromJson(jsonResponse.body);
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
    List<String> appIds,
    int maxResults,
    String nextToken,
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

  /// Provides information to AWS SMS about whether application validation is
  /// successful.
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
    @_s.required String appId,
    NotificationContext notificationContext,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringPattern(
      'appId',
      appId,
      r'''^app-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.NotifyAppValidationOutput'
    };
    final jsonResponse = await _protocol.send(
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

    return NotifyAppValidationOutputResponse.fromJson(jsonResponse.body);
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
  /// The name of service role in the customer's account that AWS CloudFormation
  /// uses to launch the application.
  ///
  /// Parameter [serverGroupLaunchConfigurations] :
  /// Information about the launch configurations for server groups in the
  /// application.
  Future<void> putAppLaunchConfiguration({
    String appId,
    bool autoLaunch,
    String roleName,
    List<ServerGroupLaunchConfiguration> serverGroupLaunchConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.PutAppLaunchConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

    return PutAppLaunchConfigurationResponse.fromJson(jsonResponse.body);
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
    String appId,
    List<ServerGroupReplicationConfiguration>
        serverGroupReplicationConfigurations,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.PutAppReplicationConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

    return PutAppReplicationConfigurationResponse.fromJson(jsonResponse.body);
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
    @_s.required String appId,
    List<AppValidationConfiguration> appValidationConfigurations,
    List<ServerGroupValidationConfiguration>
        serverGroupValidationConfigurations,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    _s.validateStringPattern(
      'appId',
      appId,
      r'''^app-[0-9a-f]{17}$''',
      isRequired: true,
    );
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.PutAppValidationConfiguration'
    };
    final jsonResponse = await _protocol.send(
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

    return PutAppValidationConfigurationResponse.fromJson(jsonResponse.body);
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
    String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.StartAppReplication'
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

    return StartAppReplicationResponse.fromJson(jsonResponse.body);
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
    @_s.required String appId,
    String description,
  }) async {
    ArgumentError.checkNotNull(appId, 'appId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.StartOnDemandAppReplication'
    };
    final jsonResponse = await _protocol.send(
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

    return StartOnDemandAppReplicationResponse.fromJson(jsonResponse.body);
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
    @_s.required String replicationJobId,
    String description,
  }) async {
    ArgumentError.checkNotNull(replicationJobId, 'replicationJobId');
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
    String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.StopAppReplication'
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

    return StopAppReplicationResponse.fromJson(jsonResponse.body);
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
    String appId,
  }) async {
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target': 'AWSServerMigrationService_V2016_10_24.TerminateApp'
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

    return TerminateAppResponse.fromJson(jsonResponse.body);
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
  /// The name of the service role in the customer's account used by AWS SMS.
  ///
  /// Parameter [serverGroups] :
  /// The server groups in the application to update.
  ///
  /// Parameter [tags] :
  /// The tags to associate with the application.
  Future<UpdateAppResponse> updateApp({
    String appId,
    String description,
    String name,
    String roleName,
    List<ServerGroup> serverGroups,
    List<Tag> tags,
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
  /// The name of the IAM role to be used by AWS SMS.
  Future<void> updateReplicationJob({
    @_s.required String replicationJobId,
    String description,
    bool encrypted,
    int frequency,
    String kmsKeyId,
    LicenseType licenseType,
    DateTime nextReplicationRunStartTime,
    int numberOfRecentAmisToKeep,
    String roleName,
  }) async {
    ArgumentError.checkNotNull(replicationJobId, 'replicationJobId');
    final headers = <String, String>{
      'Content-Type': 'application/x-amz-json-1.1',
      'X-Amz-Target':
          'AWSServerMigrationService_V2016_10_24.UpdateReplicationJob'
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

    return UpdateReplicationJobResponse.fromJson(jsonResponse.body);
  }
}

enum AppLaunchConfigurationStatus {
  @_s.JsonValue('NOT_CONFIGURED')
  notConfigured,
  @_s.JsonValue('CONFIGURED')
  configured,
}

enum AppLaunchStatus {
  @_s.JsonValue('READY_FOR_CONFIGURATION')
  readyForConfiguration,
  @_s.JsonValue('CONFIGURATION_IN_PROGRESS')
  configurationInProgress,
  @_s.JsonValue('CONFIGURATION_INVALID')
  configurationInvalid,
  @_s.JsonValue('READY_FOR_LAUNCH')
  readyForLaunch,
  @_s.JsonValue('VALIDATION_IN_PROGRESS')
  validationInProgress,
  @_s.JsonValue('LAUNCH_PENDING')
  launchPending,
  @_s.JsonValue('LAUNCH_IN_PROGRESS')
  launchInProgress,
  @_s.JsonValue('LAUNCHED')
  launched,
  @_s.JsonValue('PARTIALLY_LAUNCHED')
  partiallyLaunched,
  @_s.JsonValue('DELTA_LAUNCH_IN_PROGRESS')
  deltaLaunchInProgress,
  @_s.JsonValue('DELTA_LAUNCH_FAILED')
  deltaLaunchFailed,
  @_s.JsonValue('LAUNCH_FAILED')
  launchFailed,
  @_s.JsonValue('TERMINATE_IN_PROGRESS')
  terminateInProgress,
  @_s.JsonValue('TERMINATE_FAILED')
  terminateFailed,
  @_s.JsonValue('TERMINATED')
  terminated,
}

enum AppReplicationConfigurationStatus {
  @_s.JsonValue('NOT_CONFIGURED')
  notConfigured,
  @_s.JsonValue('CONFIGURED')
  configured,
}

enum AppReplicationStatus {
  @_s.JsonValue('READY_FOR_CONFIGURATION')
  readyForConfiguration,
  @_s.JsonValue('CONFIGURATION_IN_PROGRESS')
  configurationInProgress,
  @_s.JsonValue('CONFIGURATION_INVALID')
  configurationInvalid,
  @_s.JsonValue('READY_FOR_REPLICATION')
  readyForReplication,
  @_s.JsonValue('VALIDATION_IN_PROGRESS')
  validationInProgress,
  @_s.JsonValue('REPLICATION_PENDING')
  replicationPending,
  @_s.JsonValue('REPLICATION_IN_PROGRESS')
  replicationInProgress,
  @_s.JsonValue('REPLICATED')
  replicated,
  @_s.JsonValue('PARTIALLY_REPLICATED')
  partiallyReplicated,
  @_s.JsonValue('DELTA_REPLICATION_IN_PROGRESS')
  deltaReplicationInProgress,
  @_s.JsonValue('DELTA_REPLICATED')
  deltaReplicated,
  @_s.JsonValue('DELTA_REPLICATION_FAILED')
  deltaReplicationFailed,
  @_s.JsonValue('REPLICATION_FAILED')
  replicationFailed,
  @_s.JsonValue('REPLICATION_STOPPING')
  replicationStopping,
  @_s.JsonValue('REPLICATION_STOP_FAILED')
  replicationStopFailed,
  @_s.JsonValue('REPLICATION_STOPPED')
  replicationStopped,
}

enum AppStatus {
  @_s.JsonValue('CREATING')
  creating,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('UPDATING')
  updating,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('DELETE_FAILED')
  deleteFailed,
}

/// Information about the application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppSummary {
  /// The unique ID of the application.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// The creation time of the application.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'creationTime')
  final DateTime creationTime;

  /// The description of the application.
  @_s.JsonKey(name: 'description')
  final String description;

  /// The ID of the application.
  @_s.JsonKey(name: 'importedAppId')
  final String importedAppId;

  /// The last modified time of the application.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModified')
  final DateTime lastModified;

  /// The timestamp of the application's most recent successful replication.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'latestReplicationTime')
  final DateTime latestReplicationTime;

  /// Status of the launch configuration.
  @_s.JsonKey(name: 'launchConfigurationStatus')
  final AppLaunchConfigurationStatus launchConfigurationStatus;

  /// Details about the latest launch of the application.
  @_s.JsonKey(name: 'launchDetails')
  final LaunchDetails launchDetails;

  /// The launch status of the application.
  @_s.JsonKey(name: 'launchStatus')
  final AppLaunchStatus launchStatus;

  /// A message related to the launch status of the application.
  @_s.JsonKey(name: 'launchStatusMessage')
  final String launchStatusMessage;

  /// The name of the application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Status of the replication configuration.
  @_s.JsonKey(name: 'replicationConfigurationStatus')
  final AppReplicationConfigurationStatus replicationConfigurationStatus;

  /// The replication status of the application.
  @_s.JsonKey(name: 'replicationStatus')
  final AppReplicationStatus replicationStatus;

  /// A message related to the replication status of the application.
  @_s.JsonKey(name: 'replicationStatusMessage')
  final String replicationStatusMessage;

  /// The name of the service role in the customer's account used by AWS SMS.
  @_s.JsonKey(name: 'roleName')
  final String roleName;

  /// Status of the application.
  @_s.JsonKey(name: 'status')
  final AppStatus status;

  /// A message related to the status of the application
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The number of server groups present in the application.
  @_s.JsonKey(name: 'totalServerGroups')
  final int totalServerGroups;

  /// The number of servers present in the application.
  @_s.JsonKey(name: 'totalServers')
  final int totalServers;

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
  factory AppSummary.fromJson(Map<String, dynamic> json) =>
      _$AppSummaryFromJson(json);
}

/// Configuration for validating an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class AppValidationConfiguration {
  /// The validation strategy.
  @_s.JsonKey(name: 'appValidationStrategy')
  final AppValidationStrategy appValidationStrategy;

  /// The name of the configuration.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The validation parameters.
  @_s.JsonKey(name: 'ssmValidationParameters')
  final SSMValidationParameters ssmValidationParameters;

  /// The ID of the validation.
  @_s.JsonKey(name: 'validationId')
  final String validationId;

  AppValidationConfiguration({
    this.appValidationStrategy,
    this.name,
    this.ssmValidationParameters,
    this.validationId,
  });
  factory AppValidationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$AppValidationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$AppValidationConfigurationToJson(this);
}

/// Output from validating an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class AppValidationOutput {
  /// Output from using SSM to validate the application.
  @_s.JsonKey(name: 'ssmOutput')
  final SSMOutput ssmOutput;

  AppValidationOutput({
    this.ssmOutput,
  });
  factory AppValidationOutput.fromJson(Map<String, dynamic> json) =>
      _$AppValidationOutputFromJson(json);
}

enum AppValidationStrategy {
  @_s.JsonValue('SSM')
  ssm,
}

/// Represents a connector.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Connector {
  /// The time the connector was associated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'associatedOn')
  final DateTime associatedOn;

  /// The capabilities of the connector.
  @_s.JsonKey(name: 'capabilityList')
  final List<ConnectorCapability> capabilityList;

  /// The ID of the connector.
  @_s.JsonKey(name: 'connectorId')
  final String connectorId;

  /// The IP address of the connector.
  @_s.JsonKey(name: 'ipAddress')
  final String ipAddress;

  /// The MAC address of the connector.
  @_s.JsonKey(name: 'macAddress')
  final String macAddress;

  /// The status of the connector.
  @_s.JsonKey(name: 'status')
  final ConnectorStatus status;

  /// The connector version.
  @_s.JsonKey(name: 'version')
  final String version;

  /// The ID of the VM manager.
  @_s.JsonKey(name: 'vmManagerId')
  final String vmManagerId;

  /// The name of the VM manager.
  @_s.JsonKey(name: 'vmManagerName')
  final String vmManagerName;

  /// The VM management product.
  @_s.JsonKey(name: 'vmManagerType')
  final VmManagerType vmManagerType;

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
  factory Connector.fromJson(Map<String, dynamic> json) =>
      _$ConnectorFromJson(json);
}

enum ConnectorCapability {
  @_s.JsonValue('VSPHERE')
  vsphere,
  @_s.JsonValue('SCVMM')
  scvmm,
  @_s.JsonValue('HYPERV-MANAGER')
  hypervManager,
  @_s.JsonValue('SNAPSHOT_BATCHING')
  snapshotBatching,
  @_s.JsonValue('SMS_OPTIMIZED')
  smsOptimized,
}

enum ConnectorStatus {
  @_s.JsonValue('HEALTHY')
  healthy,
  @_s.JsonValue('UNHEALTHY')
  unhealthy,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateAppResponse {
  /// A summary description of the application.
  @_s.JsonKey(name: 'appSummary')
  final AppSummary appSummary;

  /// The server groups included in the application.
  @_s.JsonKey(name: 'serverGroups')
  final List<ServerGroup> serverGroups;

  /// The tags associated with the application.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  CreateAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });
  factory CreateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateReplicationJobResponse {
  /// The unique identifier of the replication job.
  @_s.JsonKey(name: 'replicationJobId')
  final String replicationJobId;

  CreateReplicationJobResponse({
    this.replicationJobId,
  });
  factory CreateReplicationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateReplicationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAppLaunchConfigurationResponse {
  DeleteAppLaunchConfigurationResponse();
  factory DeleteAppLaunchConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAppLaunchConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAppReplicationConfigurationResponse {
  DeleteAppReplicationConfigurationResponse();
  factory DeleteAppReplicationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAppReplicationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAppResponse {
  DeleteAppResponse();
  factory DeleteAppResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteAppValidationConfigurationResponse {
  DeleteAppValidationConfigurationResponse();
  factory DeleteAppValidationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteAppValidationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteReplicationJobResponse {
  DeleteReplicationJobResponse();
  factory DeleteReplicationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteReplicationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteServerCatalogResponse {
  DeleteServerCatalogResponse();
  factory DeleteServerCatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteServerCatalogResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DisassociateConnectorResponse {
  DisassociateConnectorResponse();
  factory DisassociateConnectorResponse.fromJson(Map<String, dynamic> json) =>
      _$DisassociateConnectorResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateChangeSetResponse {
  /// The location of the Amazon S3 object.
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  GenerateChangeSetResponse({
    this.s3Location,
  });
  factory GenerateChangeSetResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateChangeSetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GenerateTemplateResponse {
  /// The location of the Amazon S3 object.
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  GenerateTemplateResponse({
    this.s3Location,
  });
  factory GenerateTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$GenerateTemplateResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppLaunchConfigurationResponse {
  /// The ID of the application.
  @_s.JsonKey(name: 'appId')
  final String appId;

  /// Indicates whether the application is configured to launch automatically
  /// after replication is complete.
  @_s.JsonKey(name: 'autoLaunch')
  final bool autoLaunch;

  /// The name of the service role in the customer's account that AWS
  /// CloudFormation uses to launch the application.
  @_s.JsonKey(name: 'roleName')
  final String roleName;

  /// The launch configurations for server groups in this application.
  @_s.JsonKey(name: 'serverGroupLaunchConfigurations')
  final List<ServerGroupLaunchConfiguration> serverGroupLaunchConfigurations;

  GetAppLaunchConfigurationResponse({
    this.appId,
    this.autoLaunch,
    this.roleName,
    this.serverGroupLaunchConfigurations,
  });
  factory GetAppLaunchConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAppLaunchConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppReplicationConfigurationResponse {
  /// The replication configurations associated with server groups in this
  /// application.
  @_s.JsonKey(name: 'serverGroupReplicationConfigurations')
  final List<ServerGroupReplicationConfiguration>
      serverGroupReplicationConfigurations;

  GetAppReplicationConfigurationResponse({
    this.serverGroupReplicationConfigurations,
  });
  factory GetAppReplicationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAppReplicationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppResponse {
  /// Information about the application.
  @_s.JsonKey(name: 'appSummary')
  final AppSummary appSummary;

  /// The server groups that belong to the application.
  @_s.JsonKey(name: 'serverGroups')
  final List<ServerGroup> serverGroups;

  /// The tags associated with the application.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  GetAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });
  factory GetAppResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppValidationConfigurationResponse {
  /// The configuration for application validation.
  @_s.JsonKey(name: 'appValidationConfigurations')
  final List<AppValidationConfiguration> appValidationConfigurations;

  /// The configuration for instance validation.
  @_s.JsonKey(name: 'serverGroupValidationConfigurations')
  final List<ServerGroupValidationConfiguration>
      serverGroupValidationConfigurations;

  GetAppValidationConfigurationResponse({
    this.appValidationConfigurations,
    this.serverGroupValidationConfigurations,
  });
  factory GetAppValidationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetAppValidationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetAppValidationOutputResponse {
  /// The validation output.
  @_s.JsonKey(name: 'validationOutputList')
  final List<ValidationOutput> validationOutputList;

  GetAppValidationOutputResponse({
    this.validationOutputList,
  });
  factory GetAppValidationOutputResponse.fromJson(Map<String, dynamic> json) =>
      _$GetAppValidationOutputResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetConnectorsResponse {
  /// Information about the registered connectors.
  @_s.JsonKey(name: 'connectorList')
  final List<Connector> connectorList;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  GetConnectorsResponse({
    this.connectorList,
    this.nextToken,
  });
  factory GetConnectorsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetConnectorsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetReplicationJobsResponse {
  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the replication jobs.
  @_s.JsonKey(name: 'replicationJobList')
  final List<ReplicationJob> replicationJobList;

  GetReplicationJobsResponse({
    this.nextToken,
    this.replicationJobList,
  });
  factory GetReplicationJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReplicationJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetReplicationRunsResponse {
  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Information about the replication job.
  @_s.JsonKey(name: 'replicationJob')
  final ReplicationJob replicationJob;

  /// Information about the replication runs.
  @_s.JsonKey(name: 'replicationRunList')
  final List<ReplicationRun> replicationRunList;

  GetReplicationRunsResponse({
    this.nextToken,
    this.replicationJob,
    this.replicationRunList,
  });
  factory GetReplicationRunsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetReplicationRunsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetServersResponse {
  /// The time when the server was last modified.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastModifiedOn')
  final DateTime lastModifiedOn;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// The status of the server catalog.
  @_s.JsonKey(name: 'serverCatalogStatus')
  final ServerCatalogStatus serverCatalogStatus;

  /// Information about the servers.
  @_s.JsonKey(name: 'serverList')
  final List<Server> serverList;

  GetServersResponse({
    this.lastModifiedOn,
    this.nextToken,
    this.serverCatalogStatus,
    this.serverList,
  });
  factory GetServersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServersResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportAppCatalogResponse {
  ImportAppCatalogResponse();
  factory ImportAppCatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportAppCatalogResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ImportServerCatalogResponse {
  ImportServerCatalogResponse();
  factory ImportServerCatalogResponse.fromJson(Map<String, dynamic> json) =>
      _$ImportServerCatalogResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LaunchAppResponse {
  LaunchAppResponse();
  factory LaunchAppResponse.fromJson(Map<String, dynamic> json) =>
      _$LaunchAppResponseFromJson(json);
}

/// Details about the latest launch of an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class LaunchDetails {
  /// The latest time that this application was launched successfully.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'latestLaunchTime')
  final DateTime latestLaunchTime;

  /// The ID of the latest stack launched for this application.
  @_s.JsonKey(name: 'stackId')
  final String stackId;

  /// The name of the latest stack launched for this application.
  @_s.JsonKey(name: 'stackName')
  final String stackName;

  LaunchDetails({
    this.latestLaunchTime,
    this.stackId,
    this.stackName,
  });
  factory LaunchDetails.fromJson(Map<String, dynamic> json) =>
      _$LaunchDetailsFromJson(json);
}

enum LicenseType {
  @_s.JsonValue('AWS')
  aws,
  @_s.JsonValue('BYOL')
  byol,
}

extension on LicenseType {
  String toValue() {
    switch (this) {
      case LicenseType.aws:
        return 'AWS';
      case LicenseType.byol:
        return 'BYOL';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListAppsResponse {
  /// The application summaries.
  @_s.JsonKey(name: 'apps')
  final List<AppSummary> apps;

  /// The token required to retrieve the next set of results. This value is null
  /// when there are no more results to return.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListAppsResponse({
    this.apps,
    this.nextToken,
  });
  factory ListAppsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListAppsResponseFromJson(json);
}

/// Contains the status of validating an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class NotificationContext {
  /// The status of the validation.
  @_s.JsonKey(name: 'status')
  final ValidationStatus status;

  /// The status message.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The ID of the validation.
  @_s.JsonKey(name: 'validationId')
  final String validationId;

  NotificationContext({
    this.status,
    this.statusMessage,
    this.validationId,
  });
  Map<String, dynamic> toJson() => _$NotificationContextToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NotifyAppValidationOutputResponse {
  NotifyAppValidationOutputResponse();
  factory NotifyAppValidationOutputResponse.fromJson(
          Map<String, dynamic> json) =>
      _$NotifyAppValidationOutputResponseFromJson(json);
}

enum OutputFormat {
  @_s.JsonValue('JSON')
  json,
  @_s.JsonValue('YAML')
  yaml,
}

extension on OutputFormat {
  String toValue() {
    switch (this) {
      case OutputFormat.json:
        return 'JSON';
      case OutputFormat.yaml:
        return 'YAML';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAppLaunchConfigurationResponse {
  PutAppLaunchConfigurationResponse();
  factory PutAppLaunchConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAppLaunchConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAppReplicationConfigurationResponse {
  PutAppReplicationConfigurationResponse();
  factory PutAppReplicationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAppReplicationConfigurationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class PutAppValidationConfigurationResponse {
  PutAppValidationConfigurationResponse();
  factory PutAppValidationConfigurationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$PutAppValidationConfigurationResponseFromJson(json);
}

/// Represents a replication job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationJob {
  /// The description of the replication job.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Indicates whether the replication job should produce encrypted AMIs.
  @_s.JsonKey(name: 'encrypted')
  final bool encrypted;

  /// The time between consecutive replication runs, in hours.
  @_s.JsonKey(name: 'frequency')
  final int frequency;

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
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The ID of the latest Amazon Machine Image (AMI).
  @_s.JsonKey(name: 'latestAmiId')
  final String latestAmiId;

  /// The license type to be used for the AMI created by a successful replication
  /// run.
  @_s.JsonKey(name: 'licenseType')
  final LicenseType licenseType;

  /// The start time of the next replication run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'nextReplicationRunStartTime')
  final DateTime nextReplicationRunStartTime;

  /// The number of recent AMIs to keep in the customer's account for a
  /// replication job. By default, the value is set to zero, meaning that all AMIs
  /// are kept.
  @_s.JsonKey(name: 'numberOfRecentAmisToKeep')
  final int numberOfRecentAmisToKeep;

  /// The ID of the replication job.
  @_s.JsonKey(name: 'replicationJobId')
  final String replicationJobId;

  /// Information about the replication runs.
  @_s.JsonKey(name: 'replicationRunList')
  final List<ReplicationRun> replicationRunList;

  /// The name of the IAM role to be used by AWS SMS.
  @_s.JsonKey(name: 'roleName')
  final String roleName;

  /// Indicates whether to run the replication job one time.
  @_s.JsonKey(name: 'runOnce')
  final bool runOnce;

  /// The seed replication time.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'seedReplicationTime')
  final DateTime seedReplicationTime;

  /// The ID of the server.
  @_s.JsonKey(name: 'serverId')
  final String serverId;

  /// The type of server.
  @_s.JsonKey(name: 'serverType')
  final ServerType serverType;

  /// The state of the replication job.
  @_s.JsonKey(name: 'state')
  final ReplicationJobState state;

  /// The description of the current status of the replication job.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// Information about the VM server.
  @_s.JsonKey(name: 'vmServer')
  final VmServer vmServer;

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
  factory ReplicationJob.fromJson(Map<String, dynamic> json) =>
      _$ReplicationJobFromJson(json);
}

enum ReplicationJobState {
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
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('PAUSED_ON_FAILURE')
  pausedOnFailure,
  @_s.JsonValue('FAILING')
  failing,
}

/// Represents a replication run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationRun {
  /// The ID of the Amazon Machine Image (AMI) from the replication run.
  @_s.JsonKey(name: 'amiId')
  final String amiId;

  /// The completion time of the last replication run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'completedTime')
  final DateTime completedTime;

  /// The description of the replication run.
  @_s.JsonKey(name: 'description')
  final String description;

  /// Indicates whether the replication run should produce an encrypted AMI.
  @_s.JsonKey(name: 'encrypted')
  final bool encrypted;

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
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The ID of the replication run.
  @_s.JsonKey(name: 'replicationRunId')
  final String replicationRunId;

  /// The start time of the next replication run.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'scheduledStartTime')
  final DateTime scheduledStartTime;

  /// Details about the current stage of the replication run.
  @_s.JsonKey(name: 'stageDetails')
  final ReplicationRunStageDetails stageDetails;

  /// The state of the replication run.
  @_s.JsonKey(name: 'state')
  final ReplicationRunState state;

  /// The description of the current status of the replication job.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The type of replication run.
  @_s.JsonKey(name: 'type')
  final ReplicationRunType type;

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
  factory ReplicationRun.fromJson(Map<String, dynamic> json) =>
      _$ReplicationRunFromJson(json);
}

/// Details of the current stage of a replication run.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ReplicationRunStageDetails {
  /// The current stage of a replication run.
  @_s.JsonKey(name: 'stage')
  final String stage;

  /// The progress of the current stage of a replication run.
  @_s.JsonKey(name: 'stageProgress')
  final String stageProgress;

  ReplicationRunStageDetails({
    this.stage,
    this.stageProgress,
  });
  factory ReplicationRunStageDetails.fromJson(Map<String, dynamic> json) =>
      _$ReplicationRunStageDetailsFromJson(json);
}

enum ReplicationRunState {
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('MISSED')
  missed,
  @_s.JsonValue('ACTIVE')
  active,
  @_s.JsonValue('FAILED')
  failed,
  @_s.JsonValue('COMPLETED')
  completed,
  @_s.JsonValue('DELETING')
  deleting,
  @_s.JsonValue('DELETED')
  deleted,
}

enum ReplicationRunType {
  @_s.JsonValue('ON_DEMAND')
  onDemand,
  @_s.JsonValue('AUTOMATIC')
  automatic,
}

/// Location of an Amazon S3 object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Location {
  /// The Amazon S3 bucket name.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The Amazon S3 bucket key.
  @_s.JsonKey(name: 'key')
  final String key;

  S3Location({
    this.bucket,
    this.key,
  });
  factory S3Location.fromJson(Map<String, dynamic> json) =>
      _$S3LocationFromJson(json);

  Map<String, dynamic> toJson() => _$S3LocationToJson(this);
}

/// Contains the location of validation output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SSMOutput {
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  SSMOutput({
    this.s3Location,
  });
  factory SSMOutput.fromJson(Map<String, dynamic> json) =>
      _$SSMOutputFromJson(json);
}

/// Contains validation parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SSMValidationParameters {
  /// The command to run the validation script
  @_s.JsonKey(name: 'command')
  final String command;

  /// The timeout interval, in seconds.
  @_s.JsonKey(name: 'executionTimeoutSeconds')
  final int executionTimeoutSeconds;

  /// The ID of the instance. The instance must have the following tag:
  /// UserForSMSApplicationValidation=true.
  @_s.JsonKey(name: 'instanceId')
  final String instanceId;

  /// The name of the S3 bucket for output.
  @_s.JsonKey(name: 'outputS3BucketName')
  final String outputS3BucketName;

  /// The type of validation script.
  @_s.JsonKey(name: 'scriptType')
  final ScriptType scriptType;

  /// The location of the validation script.
  @_s.JsonKey(name: 'source')
  final Source source;

  SSMValidationParameters({
    this.command,
    this.executionTimeoutSeconds,
    this.instanceId,
    this.outputS3BucketName,
    this.scriptType,
    this.source,
  });
  factory SSMValidationParameters.fromJson(Map<String, dynamic> json) =>
      _$SSMValidationParametersFromJson(json);

  Map<String, dynamic> toJson() => _$SSMValidationParametersToJson(this);
}

enum ScriptType {
  @_s.JsonValue('SHELL_SCRIPT')
  shellScript,
  @_s.JsonValue('POWERSHELL_SCRIPT')
  powershellScript,
}

/// Represents a server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Server {
  /// The ID of the replication job.
  @_s.JsonKey(name: 'replicationJobId')
  final String replicationJobId;

  /// Indicates whether the replication job is deleted or failed.
  @_s.JsonKey(name: 'replicationJobTerminated')
  final bool replicationJobTerminated;

  /// The ID of the server.
  @_s.JsonKey(name: 'serverId')
  final String serverId;

  /// The type of server.
  @_s.JsonKey(name: 'serverType')
  final ServerType serverType;

  /// Information about the VM server.
  @_s.JsonKey(name: 'vmServer')
  final VmServer vmServer;

  Server({
    this.replicationJobId,
    this.replicationJobTerminated,
    this.serverId,
    this.serverType,
    this.vmServer,
  });
  factory Server.fromJson(Map<String, dynamic> json) => _$ServerFromJson(json);

  Map<String, dynamic> toJson() => _$ServerToJson(this);
}

enum ServerCatalogStatus {
  @_s.JsonValue('NOT_IMPORTED')
  notImported,
  @_s.JsonValue('IMPORTING')
  importing,
  @_s.JsonValue('AVAILABLE')
  available,
  @_s.JsonValue('DELETED')
  deleted,
  @_s.JsonValue('EXPIRED')
  expired,
}

/// Logical grouping of servers.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerGroup {
  /// The name of a server group.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The ID of a server group.
  @_s.JsonKey(name: 'serverGroupId')
  final String serverGroupId;

  /// The servers that belong to a server group.
  @_s.JsonKey(name: 'serverList')
  final List<Server> serverList;

  ServerGroup({
    this.name,
    this.serverGroupId,
    this.serverList,
  });
  factory ServerGroup.fromJson(Map<String, dynamic> json) =>
      _$ServerGroupFromJson(json);

  Map<String, dynamic> toJson() => _$ServerGroupToJson(this);
}

/// Launch configuration for a server group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerGroupLaunchConfiguration {
  /// The launch order of servers in the server group.
  @_s.JsonKey(name: 'launchOrder')
  final int launchOrder;

  /// The ID of the server group with which the launch configuration is
  /// associated.
  @_s.JsonKey(name: 'serverGroupId')
  final String serverGroupId;

  /// The launch configuration for servers in the server group.
  @_s.JsonKey(name: 'serverLaunchConfigurations')
  final List<ServerLaunchConfiguration> serverLaunchConfigurations;

  ServerGroupLaunchConfiguration({
    this.launchOrder,
    this.serverGroupId,
    this.serverLaunchConfigurations,
  });
  factory ServerGroupLaunchConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ServerGroupLaunchConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ServerGroupLaunchConfigurationToJson(this);
}

/// Replication configuration for a server group.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerGroupReplicationConfiguration {
  /// The ID of the server group with which this replication configuration is
  /// associated.
  @_s.JsonKey(name: 'serverGroupId')
  final String serverGroupId;

  /// The replication configuration for servers in the server group.
  @_s.JsonKey(name: 'serverReplicationConfigurations')
  final List<ServerReplicationConfiguration> serverReplicationConfigurations;

  ServerGroupReplicationConfiguration({
    this.serverGroupId,
    this.serverReplicationConfigurations,
  });
  factory ServerGroupReplicationConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ServerGroupReplicationConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServerGroupReplicationConfigurationToJson(this);
}

/// Configuration for validating an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerGroupValidationConfiguration {
  /// The ID of the server group.
  @_s.JsonKey(name: 'serverGroupId')
  final String serverGroupId;

  /// The validation configuration.
  @_s.JsonKey(name: 'serverValidationConfigurations')
  final List<ServerValidationConfiguration> serverValidationConfigurations;

  ServerGroupValidationConfiguration({
    this.serverGroupId,
    this.serverValidationConfigurations,
  });
  factory ServerGroupValidationConfiguration.fromJson(
          Map<String, dynamic> json) =>
      _$ServerGroupValidationConfigurationFromJson(json);

  Map<String, dynamic> toJson() =>
      _$ServerGroupValidationConfigurationToJson(this);
}

/// Launch configuration for a server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerLaunchConfiguration {
  /// Indicates whether a publicly accessible IP address is created when launching
  /// the server.
  @_s.JsonKey(name: 'associatePublicIpAddress')
  final bool associatePublicIpAddress;
  @_s.JsonKey(name: 'configureScript')
  final S3Location configureScript;

  /// The type of configuration script.
  @_s.JsonKey(name: 'configureScriptType')
  final ScriptType configureScriptType;

  /// The name of the Amazon EC2 SSH key to be used for connecting to the launched
  /// server.
  @_s.JsonKey(name: 'ec2KeyName')
  final String ec2KeyName;

  /// The name of the IAM instance profile.
  @_s.JsonKey(name: 'iamInstanceProfileName')
  final String iamInstanceProfileName;

  /// The instance type to use when launching the server.
  @_s.JsonKey(name: 'instanceType')
  final String instanceType;

  /// The logical ID of the server in the AWS CloudFormation template.
  @_s.JsonKey(name: 'logicalId')
  final String logicalId;

  /// The ID of the security group that applies to the launched server.
  @_s.JsonKey(name: 'securityGroup')
  final String securityGroup;

  /// The ID of the server with which the launch configuration is associated.
  @_s.JsonKey(name: 'server')
  final Server server;

  /// The ID of the subnet the server should be launched into.
  @_s.JsonKey(name: 'subnet')
  final String subnet;

  /// Location of the user-data script to be executed when launching the server.
  @_s.JsonKey(name: 'userData')
  final UserData userData;

  /// The ID of the VPC into which the server should be launched.
  @_s.JsonKey(name: 'vpc')
  final String vpc;

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
  factory ServerLaunchConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ServerLaunchConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ServerLaunchConfigurationToJson(this);
}

/// Replication configuration of a server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerReplicationConfiguration {
  /// The ID of the server with which this replication configuration is
  /// associated.
  @_s.JsonKey(name: 'server')
  final Server server;

  /// The parameters for replicating the server.
  @_s.JsonKey(name: 'serverReplicationParameters')
  final ServerReplicationParameters serverReplicationParameters;

  ServerReplicationConfiguration({
    this.server,
    this.serverReplicationParameters,
  });
  factory ServerReplicationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ServerReplicationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ServerReplicationConfigurationToJson(this);
}

/// The replication parameters for replicating a server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerReplicationParameters {
  /// Indicates whether the replication job produces encrypted AMIs.
  @_s.JsonKey(name: 'encrypted')
  final bool encrypted;

  /// The frequency of creating replication jobs for the server.
  @_s.JsonKey(name: 'frequency')
  final int frequency;

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
  @_s.JsonKey(name: 'kmsKeyId')
  final String kmsKeyId;

  /// The license type for creating a replication job for the server.
  @_s.JsonKey(name: 'licenseType')
  final LicenseType licenseType;

  /// The number of recent AMIs to keep when creating a replication job for this
  /// server.
  @_s.JsonKey(name: 'numberOfRecentAmisToKeep')
  final int numberOfRecentAmisToKeep;

  /// Indicates whether to run the replication job one time.
  @_s.JsonKey(name: 'runOnce')
  final bool runOnce;

  /// The seed time for creating a replication job for the server.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'seedTime')
  final DateTime seedTime;

  ServerReplicationParameters({
    this.encrypted,
    this.frequency,
    this.kmsKeyId,
    this.licenseType,
    this.numberOfRecentAmisToKeep,
    this.runOnce,
    this.seedTime,
  });
  factory ServerReplicationParameters.fromJson(Map<String, dynamic> json) =>
      _$ServerReplicationParametersFromJson(json);

  Map<String, dynamic> toJson() => _$ServerReplicationParametersToJson(this);
}

enum ServerType {
  @_s.JsonValue('VIRTUAL_MACHINE')
  virtualMachine,
}

/// Configuration for validating an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class ServerValidationConfiguration {
  /// The name of the configuration.
  @_s.JsonKey(name: 'name')
  final String name;
  @_s.JsonKey(name: 'server')
  final Server server;

  /// The validation strategy.
  @_s.JsonKey(name: 'serverValidationStrategy')
  final ServerValidationStrategy serverValidationStrategy;

  /// The validation parameters.
  @_s.JsonKey(name: 'userDataValidationParameters')
  final UserDataValidationParameters userDataValidationParameters;

  /// The ID of the validation.
  @_s.JsonKey(name: 'validationId')
  final String validationId;

  ServerValidationConfiguration({
    this.name,
    this.server,
    this.serverValidationStrategy,
    this.userDataValidationParameters,
    this.validationId,
  });
  factory ServerValidationConfiguration.fromJson(Map<String, dynamic> json) =>
      _$ServerValidationConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$ServerValidationConfigurationToJson(this);
}

/// Contains output from validating an instance.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ServerValidationOutput {
  @_s.JsonKey(name: 'server')
  final Server server;

  ServerValidationOutput({
    this.server,
  });
  factory ServerValidationOutput.fromJson(Map<String, dynamic> json) =>
      _$ServerValidationOutputFromJson(json);
}

enum ServerValidationStrategy {
  @_s.JsonValue('USERDATA')
  userdata,
}

/// Contains the location of a validation script.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Source {
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  Source({
    this.s3Location,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);

  Map<String, dynamic> toJson() => _$SourceToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartAppReplicationResponse {
  StartAppReplicationResponse();
  factory StartAppReplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$StartAppReplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartOnDemandAppReplicationResponse {
  StartOnDemandAppReplicationResponse();
  factory StartOnDemandAppReplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartOnDemandAppReplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartOnDemandReplicationRunResponse {
  /// The ID of the replication run.
  @_s.JsonKey(name: 'replicationRunId')
  final String replicationRunId;

  StartOnDemandReplicationRunResponse({
    this.replicationRunId,
  });
  factory StartOnDemandReplicationRunResponse.fromJson(
          Map<String, dynamic> json) =>
      _$StartOnDemandReplicationRunResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StopAppReplicationResponse {
  StopAppReplicationResponse();
  factory StopAppReplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$StopAppReplicationResponseFromJson(json);
}

/// Key/value pair that can be assigned to an application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Tag {
  /// The tag key.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The tag value.
  @_s.JsonKey(name: 'value')
  final String value;

  Tag({
    this.key,
    this.value,
  });
  factory Tag.fromJson(Map<String, dynamic> json) => _$TagFromJson(json);

  Map<String, dynamic> toJson() => _$TagToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TerminateAppResponse {
  TerminateAppResponse();
  factory TerminateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$TerminateAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateAppResponse {
  /// A summary description of the application.
  @_s.JsonKey(name: 'appSummary')
  final AppSummary appSummary;

  /// The updated server groups in the application.
  @_s.JsonKey(name: 'serverGroups')
  final List<ServerGroup> serverGroups;

  /// The tags associated with the application.
  @_s.JsonKey(name: 'tags')
  final List<Tag> tags;

  UpdateAppResponse({
    this.appSummary,
    this.serverGroups,
    this.tags,
  });
  factory UpdateAppResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateAppResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateReplicationJobResponse {
  UpdateReplicationJobResponse();
  factory UpdateReplicationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateReplicationJobResponseFromJson(json);
}

/// A script that runs on first launch of an Amazon EC2 instance. Used for
/// configuring the server during launch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserData {
  /// Amazon S3 location of the user-data script.
  @_s.JsonKey(name: 's3Location')
  final S3Location s3Location;

  UserData({
    this.s3Location,
  });
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

/// Contains validation parameters.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class UserDataValidationParameters {
  /// The type of validation script.
  @_s.JsonKey(name: 'scriptType')
  final ScriptType scriptType;

  /// The location of the validation script.
  @_s.JsonKey(name: 'source')
  final Source source;

  UserDataValidationParameters({
    this.scriptType,
    this.source,
  });
  factory UserDataValidationParameters.fromJson(Map<String, dynamic> json) =>
      _$UserDataValidationParametersFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataValidationParametersToJson(this);
}

/// Contains validation output.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ValidationOutput {
  /// The output from validating an application.
  @_s.JsonKey(name: 'appValidationOutput')
  final AppValidationOutput appValidationOutput;

  /// The latest time that the validation was performed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'latestValidationTime')
  final DateTime latestValidationTime;

  /// The name of the validation.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The output from validation an instance.
  @_s.JsonKey(name: 'serverValidationOutput')
  final ServerValidationOutput serverValidationOutput;

  /// The status of the validation.
  @_s.JsonKey(name: 'status')
  final ValidationStatus status;

  /// The status message.
  @_s.JsonKey(name: 'statusMessage')
  final String statusMessage;

  /// The ID of the validation.
  @_s.JsonKey(name: 'validationId')
  final String validationId;

  ValidationOutput({
    this.appValidationOutput,
    this.latestValidationTime,
    this.name,
    this.serverValidationOutput,
    this.status,
    this.statusMessage,
    this.validationId,
  });
  factory ValidationOutput.fromJson(Map<String, dynamic> json) =>
      _$ValidationOutputFromJson(json);
}

enum ValidationStatus {
  @_s.JsonValue('READY_FOR_VALIDATION')
  readyForValidation,
  @_s.JsonValue('PENDING')
  pending,
  @_s.JsonValue('IN_PROGRESS')
  inProgress,
  @_s.JsonValue('SUCCEEDED')
  succeeded,
  @_s.JsonValue('FAILED')
  failed,
}

enum VmManagerType {
  @_s.JsonValue('VSPHERE')
  vsphere,
  @_s.JsonValue('SCVMM')
  scvmm,
  @_s.JsonValue('HYPERV-MANAGER')
  hypervManager,
}

/// Represents a VM server.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VmServer {
  /// The name of the VM manager.
  @_s.JsonKey(name: 'vmManagerName')
  final String vmManagerName;

  /// The type of VM management product.
  @_s.JsonKey(name: 'vmManagerType')
  final VmManagerType vmManagerType;

  /// The name of the VM.
  @_s.JsonKey(name: 'vmName')
  final String vmName;

  /// The VM folder path in the vCenter Server virtual machine inventory tree.
  @_s.JsonKey(name: 'vmPath')
  final String vmPath;

  /// The VM server location.
  @_s.JsonKey(name: 'vmServerAddress')
  final VmServerAddress vmServerAddress;

  VmServer({
    this.vmManagerName,
    this.vmManagerType,
    this.vmName,
    this.vmPath,
    this.vmServerAddress,
  });
  factory VmServer.fromJson(Map<String, dynamic> json) =>
      _$VmServerFromJson(json);

  Map<String, dynamic> toJson() => _$VmServerToJson(this);
}

/// Represents a VM server location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VmServerAddress {
  /// The ID of the VM.
  @_s.JsonKey(name: 'vmId')
  final String vmId;

  /// The ID of the VM manager.
  @_s.JsonKey(name: 'vmManagerId')
  final String vmManagerId;

  VmServerAddress({
    this.vmId,
    this.vmManagerId,
  });
  factory VmServerAddress.fromJson(Map<String, dynamic> json) =>
      _$VmServerAddressFromJson(json);

  Map<String, dynamic> toJson() => _$VmServerAddressToJson(this);
}

class DryRunOperationException extends _s.GenericAwsException {
  DryRunOperationException({String type, String message})
      : super(type: type, code: 'DryRunOperationException', message: message);
}

class InternalError extends _s.GenericAwsException {
  InternalError({String type, String message})
      : super(type: type, code: 'InternalError', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class MissingRequiredParameterException extends _s.GenericAwsException {
  MissingRequiredParameterException({String type, String message})
      : super(
            type: type,
            code: 'MissingRequiredParameterException',
            message: message);
}

class NoConnectorsAvailableException extends _s.GenericAwsException {
  NoConnectorsAvailableException({String type, String message})
      : super(
            type: type,
            code: 'NoConnectorsAvailableException',
            message: message);
}

class OperationNotPermittedException extends _s.GenericAwsException {
  OperationNotPermittedException({String type, String message})
      : super(
            type: type,
            code: 'OperationNotPermittedException',
            message: message);
}

class ReplicationJobAlreadyExistsException extends _s.GenericAwsException {
  ReplicationJobAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ReplicationJobAlreadyExistsException',
            message: message);
}

class ReplicationJobNotFoundException extends _s.GenericAwsException {
  ReplicationJobNotFoundException({String type, String message})
      : super(
            type: type,
            code: 'ReplicationJobNotFoundException',
            message: message);
}

class ReplicationRunLimitExceededException extends _s.GenericAwsException {
  ReplicationRunLimitExceededException({String type, String message})
      : super(
            type: type,
            code: 'ReplicationRunLimitExceededException',
            message: message);
}

class ServerCannotBeReplicatedException extends _s.GenericAwsException {
  ServerCannotBeReplicatedException({String type, String message})
      : super(
            type: type,
            code: 'ServerCannotBeReplicatedException',
            message: message);
}

class TemporarilyUnavailableException extends _s.GenericAwsException {
  TemporarilyUnavailableException({String type, String message})
      : super(
            type: type,
            code: 'TemporarilyUnavailableException',
            message: message);
}

class UnauthorizedOperationException extends _s.GenericAwsException {
  UnauthorizedOperationException({String type, String message})
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
