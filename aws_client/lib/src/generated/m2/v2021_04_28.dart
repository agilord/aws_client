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

/// Amazon Web Services Mainframe Modernization provides tools and resources to
/// help you plan and implement migration and modernization from mainframes to
/// Amazon Web Services managed runtime environments. It provides tools for
/// analyzing existing mainframe applications, developing or updating mainframe
/// applications using COBOL or PL/I, and implementing an automated pipeline for
/// continuous integration and continuous delivery (CI/CD) of the applications.
class MainframeModernization {
  final _s.RestJsonProtocol _protocol;
  MainframeModernization({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'm2',
            signingName: 'm2',
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

  /// Cancels the running of a specific batch job execution.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [executionId] :
  /// The unique identifier of the batch job execution.
  Future<void> cancelBatchJobExecution({
    required String applicationId,
    required String executionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/batch-job-executions/${Uri.encodeComponent(executionId)}/cancel',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a new application with given parameters. Requires an existing
  /// runtime environment and application definition file.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [definition] :
  /// The application definition for this application. You can specify either
  /// inline JSON or an S3 bucket location.
  ///
  /// Parameter [engineType] :
  /// The type of the target platform for this application.
  ///
  /// Parameter [name] :
  /// The unique identifier of the application.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier the service generates to ensure the
  /// idempotency of the request to create an application. The service generates
  /// the clientToken when the API call is triggered. The token expires after
  /// one hour, so if you retry the API within this timeframe with the same
  /// clientToken, you will get the same response. The service also handles
  /// deleting the clientToken after it expires.
  ///
  /// Parameter [description] :
  /// The description of the application.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of a customer managed key.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) that identifies a role that the application
  /// uses to access Amazon Web Services resources that are not part of the
  /// application or are in a different Amazon Web Services account.
  ///
  /// Parameter [tags] :
  /// A list of tags to apply to the application.
  Future<CreateApplicationResponse> createApplication({
    required Definition definition,
    required EngineType engineType,
    required String name,
    String? clientToken,
    String? description,
    String? kmsKeyId,
    String? roleArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'definition': definition,
      'engineType': engineType.toValue(),
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Starts a data set import task for a specific application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application for which you want to import data
  /// sets.
  ///
  /// Parameter [importConfig] :
  /// The data set import task configuration.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request to create a data set import. The service generates the
  /// clientToken when the API call is triggered. The token expires after one
  /// hour, so if you retry the API within this timeframe with the same
  /// clientToken, you will get the same response. The service also handles
  /// deleting the clientToken after it expires.
  Future<CreateDataSetImportTaskResponse> createDataSetImportTask({
    required String applicationId,
    required DataSetImportConfig importConfig,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      'importConfig': importConfig,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataset-import-task',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDataSetImportTaskResponse.fromJson(response);
  }

  /// Creates and starts a deployment to deploy an application into a runtime
  /// environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application identifier.
  ///
  /// Parameter [applicationVersion] :
  /// The version of the application to deploy.
  ///
  /// Parameter [environmentId] :
  /// The identifier of the runtime environment where you want to deploy this
  /// application.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request to create a deployment. The service generates the clientToken
  /// when the API call is triggered. The token expires after one hour, so if
  /// you retry the API within this timeframe with the same clientToken, you
  /// will get the same response. The service also handles deleting the
  /// clientToken after it expires.
  Future<CreateDeploymentResponse> createDeployment({
    required String applicationId,
    required int applicationVersion,
    required String environmentId,
    String? clientToken,
  }) async {
    _s.validateNumRange(
      'applicationVersion',
      applicationVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'applicationVersion': applicationVersion,
      'environmentId': environmentId,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/deployments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentResponse.fromJson(response);
  }

  /// Creates a runtime environment for a given runtime engine.
  ///
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [engineType] :
  /// The engine type for the runtime environment.
  ///
  /// Parameter [instanceType] :
  /// The type of instance for the runtime environment.
  ///
  /// Parameter [name] :
  /// The name of the runtime environment. Must be unique within the account.
  ///
  /// Parameter [clientToken] :
  /// Unique, case-sensitive identifier you provide to ensure the idempotency of
  /// the request to create an environment. The service generates the
  /// clientToken when the API call is triggered. The token expires after one
  /// hour, so if you retry the API within this timeframe with the same
  /// clientToken, you will get the same response. The service also handles
  /// deleting the clientToken after it expires.
  ///
  /// Parameter [description] :
  /// The description of the runtime environment.
  ///
  /// Parameter [engineVersion] :
  /// The version of the engine type for the runtime environment.
  ///
  /// Parameter [highAvailabilityConfig] :
  /// The details of a high availability configuration for this runtime
  /// environment.
  ///
  /// Parameter [kmsKeyId] :
  /// The identifier of a customer managed key.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// Configures the maintenance window that you want for the runtime
  /// environment. The maintenance window must have the format
  /// <code>ddd:hh24:mi-ddd:hh24:mi</code> and must be less than 24 hours. The
  /// following two examples are valid maintenance windows:
  /// <code>sun:23:45-mon:00:15</code> or <code>sat:01:00-sat:03:00</code>.
  ///
  /// If you do not provide a value, a random system-generated value will be
  /// assigned.
  ///
  /// Parameter [publiclyAccessible] :
  /// Specifies whether the runtime environment is publicly accessible.
  ///
  /// Parameter [securityGroupIds] :
  /// The list of security groups for the VPC associated with this runtime
  /// environment.
  ///
  /// Parameter [storageConfigurations] :
  /// Optional. The storage configurations for this runtime environment.
  ///
  /// Parameter [subnetIds] :
  /// The list of subnets associated with the VPC for this runtime environment.
  ///
  /// Parameter [tags] :
  /// The tags for the runtime environment.
  Future<CreateEnvironmentResponse> createEnvironment({
    required EngineType engineType,
    required String instanceType,
    required String name,
    String? clientToken,
    String? description,
    String? engineVersion,
    HighAvailabilityConfig? highAvailabilityConfig,
    String? kmsKeyId,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    List<String>? securityGroupIds,
    List<StorageConfiguration>? storageConfigurations,
    List<String>? subnetIds,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'engineType': engineType.toValue(),
      'instanceType': instanceType,
      'name': name,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (description != null) 'description': description,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (highAvailabilityConfig != null)
        'highAvailabilityConfig': highAvailabilityConfig,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (storageConfigurations != null)
        'storageConfigurations': storageConfigurations,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/environments',
      exceptionFnMap: _exceptionFns,
    );
    return CreateEnvironmentResponse.fromJson(response);
  }

  /// Deletes a specific application. You cannot delete a running application.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application you want to delete.
  Future<void> deleteApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific application from the specific runtime environment where
  /// it was previously deployed. You cannot delete a runtime environment using
  /// DeleteEnvironment if any application has ever been deployed to it. This
  /// API removes the association of the application with the runtime
  /// environment so you can delete the environment smoothly.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application you want to delete.
  ///
  /// Parameter [environmentId] :
  /// The unique identifier of the runtime environment where the application was
  /// previously deployed.
  Future<void> deleteApplicationFromEnvironment({
    required String applicationId,
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/environment/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a specific runtime environment. The environment cannot contain
  /// deployed applications. If it does, you must delete those applications
  /// before you delete the environment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentId] :
  /// The unique identifier of the runtime environment you want to delete.
  Future<void> deleteEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Describes the details of a specific application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application.
  Future<GetApplicationResponse> getApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationResponse.fromJson(response);
  }

  /// Returns details about a specific version of a specific application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [applicationVersion] :
  /// The specific version of the application.
  Future<GetApplicationVersionResponse> getApplicationVersion({
    required String applicationId,
    required int applicationVersion,
  }) async {
    _s.validateNumRange(
      'applicationVersion',
      applicationVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/versions/${Uri.encodeComponent(applicationVersion.toString())}',
      exceptionFnMap: _exceptionFns,
    );
    return GetApplicationVersionResponse.fromJson(response);
  }

  /// Gets the details of a specific batch job execution for a specific
  /// application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application.
  ///
  /// Parameter [executionId] :
  /// The unique identifier of the batch job execution.
  Future<GetBatchJobExecutionResponse> getBatchJobExecution({
    required String applicationId,
    required String executionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/batch-job-executions/${Uri.encodeComponent(executionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBatchJobExecutionResponse.fromJson(response);
  }

  /// Gets the details of a specific data set.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ExecutionTimeoutException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application that this data set is associated
  /// with.
  ///
  /// Parameter [dataSetName] :
  /// The name of the data set.
  Future<GetDataSetDetailsResponse> getDataSetDetails({
    required String applicationId,
    required String dataSetName,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/datasets/${Uri.encodeComponent(dataSetName)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSetDetailsResponse.fromJson(response);
  }

  /// Gets the status of a data set import task initiated with the
  /// <a>CreateDataSetImportTask</a> operation.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application identifier.
  ///
  /// Parameter [taskId] :
  /// The task identifier returned by the <a>CreateDataSetImportTask</a>
  /// operation.
  Future<GetDataSetImportTaskResponse> getDataSetImportTask({
    required String applicationId,
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataset-import-tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDataSetImportTaskResponse.fromJson(response);
  }

  /// Gets details of a specific deployment with a given deployment identifier.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [deploymentId] :
  /// The unique identifier for the deployment.
  Future<GetDeploymentResponse> getDeployment({
    required String applicationId,
    required String deploymentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/deployments/${Uri.encodeComponent(deploymentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetDeploymentResponse.fromJson(response);
  }

  /// Describes a specific runtime environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentId] :
  /// The unique identifier of the runtime environment.
  Future<GetEnvironmentResponse> getEnvironment({
    required String environmentId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetEnvironmentResponse.fromJson(response);
  }

  /// Gets a single sign-on URL that can be used to connect to AWS Blu Insights.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  Future<GetSignedBluinsightsUrlResponse> getSignedBluinsightsUrl() async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/signed-bi-url',
      exceptionFnMap: _exceptionFns,
    );
    return GetSignedBluinsightsUrlResponse.fromJson(response);
  }

  /// Returns a list of the application versions for a specific application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of application versions to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to this operation. This
  /// specifies the next item to return. To return to the beginning of the list,
  /// exclude this parameter.
  Future<ListApplicationVersionsResponse> listApplicationVersions({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationVersionsResponse.fromJson(response);
  }

  /// Lists the applications associated with a specific Amazon Web Services
  /// account. You can provide the unique identifier of a specific runtime
  /// environment in a query parameter to see all applications associated with
  /// that environment.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentId] :
  /// The unique identifier of the runtime environment where the applications
  /// are deployed.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of applications to return.
  ///
  /// Parameter [names] :
  /// The names of the applications.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to control the number of applications displayed in the
  /// list.
  Future<ListApplicationsResponse> listApplications({
    String? environmentId,
    int? maxResults,
    List<String>? names,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (environmentId != null) 'environmentId': [environmentId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (names != null) 'names': names,
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// Lists all the available batch job definitions based on the batch job
  /// resources uploaded during the application creation. You can use the batch
  /// job definitions in the list to start a batch job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The identifier of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of batch job definitions to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to this operation. This
  /// specifies the next item to return. To return to the beginning of the list,
  /// exclude this parameter.
  ///
  /// Parameter [prefix] :
  /// If the batch job definition is a FileBatchJobDefinition, the prefix allows
  /// you to search on the file names of FileBatchJobDefinitions.
  Future<ListBatchJobDefinitionsResponse> listBatchJobDefinitions({
    required String applicationId,
    int? maxResults,
    String? nextToken,
    String? prefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (prefix != null) 'prefix': [prefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/batch-job-definitions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBatchJobDefinitionsResponse.fromJson(response);
  }

  /// Lists historical, current, and scheduled batch job executions for a
  /// specific application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [executionIds] :
  /// The unique identifier of each batch job execution.
  ///
  /// Parameter [jobName] :
  /// The name of each batch job execution.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of batch job executions to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to control the number of batch job executions displayed
  /// in the list.
  ///
  /// Parameter [startedAfter] :
  /// The time after which the batch job executions started.
  ///
  /// Parameter [startedBefore] :
  /// The time before the batch job executions started.
  ///
  /// Parameter [status] :
  /// The status of the batch job executions.
  Future<ListBatchJobExecutionsResponse> listBatchJobExecutions({
    required String applicationId,
    List<String>? executionIds,
    String? jobName,
    int? maxResults,
    String? nextToken,
    DateTime? startedAfter,
    DateTime? startedBefore,
    BatchJobExecutionStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (executionIds != null) 'executionIds': executionIds,
      if (jobName != null) 'jobName': [jobName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (startedAfter != null)
        'startedAfter': [_s.iso8601ToJson(startedAfter).toString()],
      if (startedBefore != null)
        'startedBefore': [_s.iso8601ToJson(startedBefore).toString()],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/batch-job-executions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBatchJobExecutionsResponse.fromJson(response);
  }

  /// Lists all the job steps for JCL files to restart a batch job. This is only
  /// applicable for Micro Focus engine with versions 8.0.6 and above.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [executionId] :
  /// The unique identifier of each batch job execution.
  Future<ListBatchJobRestartPointsResponse> listBatchJobRestartPoints({
    required String applicationId,
    required String executionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/batch-job-executions/${Uri.encodeComponent(executionId)}/steps',
      exceptionFnMap: _exceptionFns,
    );
    return ListBatchJobRestartPointsResponse.fromJson(response);
  }

  /// Lists the data set imports for the specified application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to this operation. This
  /// specifies the next item to return. To return to the beginning of the list,
  /// exclude this parameter.
  Future<ListDataSetImportHistoryResponse> listDataSetImportHistory({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/dataset-import-tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSetImportHistoryResponse.fromJson(response);
  }

  /// Lists the data sets imported for a specific application. In Amazon Web
  /// Services Mainframe Modernization, data sets are associated with
  /// applications deployed on runtime environments. This is known as importing
  /// data sets. Currently, Amazon Web Services Mainframe Modernization can
  /// import data sets into catalogs using <a
  /// href="https://docs.aws.amazon.com/m2/latest/APIReference/API_CreateDataSetImportTask.html">CreateDataSetImportTask</a>.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ExecutionTimeoutException].
  /// May throw [ServiceUnavailableException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application for which you want to list the
  /// associated data sets.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return.
  ///
  /// Parameter [nameFilter] :
  /// Filter dataset name matching the specified pattern. Can use * and % as
  /// wild cards.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to this operation. This
  /// specifies the next item to return. To return to the beginning of the list,
  /// exclude this parameter.
  ///
  /// Parameter [prefix] :
  /// The prefix of the data set name, which you can use to filter the list of
  /// data sets.
  Future<ListDataSetsResponse> listDataSets({
    required String applicationId,
    int? maxResults,
    String? nameFilter,
    String? nextToken,
    String? prefix,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nameFilter != null) 'nameFilter': [nameFilter],
      if (nextToken != null) 'nextToken': [nextToken],
      if (prefix != null) 'prefix': [prefix],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/datasets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDataSetsResponse.fromJson(response);
  }

  /// Returns a list of all deployments of a specific application. A deployment
  /// is a combination of a specific application and a specific version of that
  /// application. Each deployment is mapped to a particular application
  /// version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The application identifier.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to this operation. This
  /// specifies the next item to return. To return to the beginning of the list,
  /// exclude this parameter.
  Future<ListDeploymentsResponse> listDeployments({
    required String applicationId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/deployments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentsResponse.fromJson(response);
  }

  /// Lists the available engine versions.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [engineType] :
  /// The type of target platform.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of objects to return.
  ///
  /// Parameter [nextToken] :
  /// A pagination token returned from a previous call to this operation. This
  /// specifies the next item to return. To return to the beginning of the list,
  /// exclude this parameter.
  Future<ListEngineVersionsResponse> listEngineVersions({
    EngineType? engineType,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (engineType != null) 'engineType': [engineType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/engine-versions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEngineVersionsResponse.fromJson(response);
  }

  /// Lists the runtime environments.
  ///
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [engineType] :
  /// The engine type for the runtime environment.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of runtime environments to return.
  ///
  /// Parameter [names] :
  /// The names of the runtime environments. Must be unique within the account.
  ///
  /// Parameter [nextToken] :
  /// A pagination token to control the number of runtime environments displayed
  /// in the list.
  Future<ListEnvironmentsResponse> listEnvironments({
    EngineType? engineType,
    int? maxResults,
    List<String>? names,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      2000,
    );
    final $query = <String, List<String>>{
      if (engineType != null) 'engineType': [engineType.toValue()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (names != null) 'names': names,
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListEnvironmentsResponse.fromJson(response);
  }

  /// Lists the tags for the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
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

  /// Starts an application that is currently stopped.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application you want to start.
  Future<void> startApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/start',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a batch job and returns the unique identifier of this execution of
  /// the batch job. The associated application must be running in order to
  /// start the batch job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application associated with this batch job.
  ///
  /// Parameter [batchJobIdentifier] :
  /// The unique identifier of the batch job.
  ///
  /// Parameter [jobParams] :
  /// The collection of batch job parameters. For details about limits for keys
  /// and values, see <a
  /// href="https://www.ibm.com/docs/en/workload-automation/9.3.0?topic=zos-coding-variables-in-jcl">Coding
  /// variables in JCL</a>.
  Future<StartBatchJobResponse> startBatchJob({
    required String applicationId,
    required BatchJobIdentifier batchJobIdentifier,
    Map<String, String>? jobParams,
  }) async {
    final $payload = <String, dynamic>{
      'batchJobIdentifier': batchJobIdentifier,
      if (jobParams != null) 'jobParams': jobParams,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/batch-job',
      exceptionFnMap: _exceptionFns,
    );
    return StartBatchJobResponse.fromJson(response);
  }

  /// Stops a running application.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application you want to stop.
  ///
  /// Parameter [forceStop] :
  /// Stopping an application process can take a long time. Setting this
  /// parameter to true lets you force stop the application so you don't need to
  /// wait until the process finishes to apply another action on the
  /// application. The default value is false.
  Future<void> stopApplication({
    required String applicationId,
    bool? forceStop,
  }) async {
    final $payload = <String, dynamic>{
      if (forceStop != null) 'forceStop': forceStop,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Adds one or more tags to the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource.
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

  /// Removes one or more tags from the specified resource.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the resource.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to remove.
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

  /// Updates an application and creates a new version.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The unique identifier of the application you want to update.
  ///
  /// Parameter [currentApplicationVersion] :
  /// The current version of the application to update.
  ///
  /// Parameter [definition] :
  /// The application definition for this application. You can specify either
  /// inline JSON or an S3 bucket location.
  ///
  /// Parameter [description] :
  /// The description of the application to update.
  Future<UpdateApplicationResponse> updateApplication({
    required String applicationId,
    required int currentApplicationVersion,
    Definition? definition,
    String? description,
  }) async {
    _s.validateNumRange(
      'currentApplicationVersion',
      currentApplicationVersion,
      1,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'currentApplicationVersion': currentApplicationVersion,
      if (definition != null) 'definition': definition,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationResponse.fromJson(response);
  }

  /// Updates the configuration details for a specific runtime environment.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [environmentId] :
  /// The unique identifier of the runtime environment that you want to update.
  ///
  /// Parameter [applyDuringMaintenanceWindow] :
  /// Indicates whether to update the runtime environment during the maintenance
  /// window. The default is false. Currently, Amazon Web Services Mainframe
  /// Modernization accepts the <code>engineVersion</code> parameter only if
  /// <code>applyDuringMaintenanceWindow</code> is true. If any parameter other
  /// than <code>engineVersion</code> is provided in
  /// <code>UpdateEnvironmentRequest</code>, it will fail if
  /// <code>applyDuringMaintenanceWindow</code> is set to true.
  ///
  /// Parameter [desiredCapacity] :
  /// The desired capacity for the runtime environment to update. The minimum
  /// possible value is 0 and the maximum is 100.
  ///
  /// Parameter [engineVersion] :
  /// The version of the runtime engine for the runtime environment.
  ///
  /// Parameter [forceUpdate] :
  /// Forces the updates on the environment. This option is needed if the
  /// applications in the environment are not stopped or if there are ongoing
  /// application-related activities in the environment.
  ///
  /// If you use this option, be aware that it could lead to data corruption in
  /// the applications, and that you might need to perform repair and recovery
  /// procedures for the applications.
  ///
  /// This option is not needed if the attribute being updated is
  /// <code>preferredMaintenanceWindow</code>.
  ///
  /// Parameter [instanceType] :
  /// The instance type for the runtime environment to update.
  ///
  /// Parameter [preferredMaintenanceWindow] :
  /// Configures the maintenance window that you want for the runtime
  /// environment. The maintenance window must have the format
  /// <code>ddd:hh24:mi-ddd:hh24:mi</code> and must be less than 24 hours. The
  /// following two examples are valid maintenance windows:
  /// <code>sun:23:45-mon:00:15</code> or <code>sat:01:00-sat:03:00</code>.
  ///
  /// If you do not provide a value, a random system-generated value will be
  /// assigned.
  Future<UpdateEnvironmentResponse> updateEnvironment({
    required String environmentId,
    bool? applyDuringMaintenanceWindow,
    int? desiredCapacity,
    String? engineVersion,
    bool? forceUpdate,
    String? instanceType,
    String? preferredMaintenanceWindow,
  }) async {
    final $payload = <String, dynamic>{
      if (applyDuringMaintenanceWindow != null)
        'applyDuringMaintenanceWindow': applyDuringMaintenanceWindow,
      if (desiredCapacity != null) 'desiredCapacity': desiredCapacity,
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (forceUpdate != null) 'forceUpdate': forceUpdate,
      if (instanceType != null) 'instanceType': instanceType,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/environments/${Uri.encodeComponent(environmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateEnvironmentResponse.fromJson(response);
  }
}

/// Defines an alternate key. This value is optional. A legacy data set might
/// not have any alternate key defined but if those alternate keys definitions
/// exist, provide them, as some applications will make use of them.
class AlternateKey {
  /// A strictly positive integer value representing the length of the alternate
  /// key.
  final int length;

  /// A positive integer value representing the offset to mark the start of the
  /// alternate key part in the record byte array.
  final int offset;

  /// Indicates whether the alternate key values are supposed to be unique for the
  /// given data set.
  final bool? allowDuplicates;

  /// The name of the alternate key.
  final String? name;

  AlternateKey({
    required this.length,
    required this.offset,
    this.allowDuplicates,
    this.name,
  });

  factory AlternateKey.fromJson(Map<String, dynamic> json) {
    return AlternateKey(
      length: json['length'] as int,
      offset: json['offset'] as int,
      allowDuplicates: json['allowDuplicates'] as bool?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final length = this.length;
    final offset = this.offset;
    final allowDuplicates = this.allowDuplicates;
    final name = this.name;
    return {
      'length': length,
      'offset': offset,
      if (allowDuplicates != null) 'allowDuplicates': allowDuplicates,
      if (name != null) 'name': name,
    };
  }
}

enum ApplicationDeploymentLifecycle {
  deploying,
  deployed,
}

extension ApplicationDeploymentLifecycleValueExtension
    on ApplicationDeploymentLifecycle {
  String toValue() {
    switch (this) {
      case ApplicationDeploymentLifecycle.deploying:
        return 'Deploying';
      case ApplicationDeploymentLifecycle.deployed:
        return 'Deployed';
    }
  }
}

extension ApplicationDeploymentLifecycleFromString on String {
  ApplicationDeploymentLifecycle toApplicationDeploymentLifecycle() {
    switch (this) {
      case 'Deploying':
        return ApplicationDeploymentLifecycle.deploying;
      case 'Deployed':
        return ApplicationDeploymentLifecycle.deployed;
    }
    throw Exception(
        '$this is not known in enum ApplicationDeploymentLifecycle');
  }
}

enum ApplicationLifecycle {
  creating,
  created,
  available,
  ready,
  starting,
  running,
  stopping,
  stopped,
  failed,
  deleting,
  deletingFromEnvironment,
}

extension ApplicationLifecycleValueExtension on ApplicationLifecycle {
  String toValue() {
    switch (this) {
      case ApplicationLifecycle.creating:
        return 'Creating';
      case ApplicationLifecycle.created:
        return 'Created';
      case ApplicationLifecycle.available:
        return 'Available';
      case ApplicationLifecycle.ready:
        return 'Ready';
      case ApplicationLifecycle.starting:
        return 'Starting';
      case ApplicationLifecycle.running:
        return 'Running';
      case ApplicationLifecycle.stopping:
        return 'Stopping';
      case ApplicationLifecycle.stopped:
        return 'Stopped';
      case ApplicationLifecycle.failed:
        return 'Failed';
      case ApplicationLifecycle.deleting:
        return 'Deleting';
      case ApplicationLifecycle.deletingFromEnvironment:
        return 'Deleting From Environment';
    }
  }
}

extension ApplicationLifecycleFromString on String {
  ApplicationLifecycle toApplicationLifecycle() {
    switch (this) {
      case 'Creating':
        return ApplicationLifecycle.creating;
      case 'Created':
        return ApplicationLifecycle.created;
      case 'Available':
        return ApplicationLifecycle.available;
      case 'Ready':
        return ApplicationLifecycle.ready;
      case 'Starting':
        return ApplicationLifecycle.starting;
      case 'Running':
        return ApplicationLifecycle.running;
      case 'Stopping':
        return ApplicationLifecycle.stopping;
      case 'Stopped':
        return ApplicationLifecycle.stopped;
      case 'Failed':
        return ApplicationLifecycle.failed;
      case 'Deleting':
        return ApplicationLifecycle.deleting;
      case 'Deleting From Environment':
        return ApplicationLifecycle.deletingFromEnvironment;
    }
    throw Exception('$this is not known in enum ApplicationLifecycle');
  }
}

/// A subset of the possible application attributes. Used in the application
/// list.
class ApplicationSummary {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// The unique identifier of the application.
  final String applicationId;

  /// The version of the application.
  final int applicationVersion;

  /// The timestamp when the application was created.
  final DateTime creationTime;

  /// The type of the target platform for this application.
  final EngineType engineType;

  /// The name of the application.
  final String name;

  /// The status of the application.
  final ApplicationLifecycle status;

  /// Indicates either an ongoing deployment or if the application has ever
  /// deployed successfully.
  final ApplicationDeploymentLifecycle? deploymentStatus;

  /// The description of the application.
  final String? description;

  /// The unique identifier of the runtime environment that hosts this
  /// application.
  final String? environmentId;

  /// The timestamp when you last started the application. Null until the
  /// application runs for the first time.
  final DateTime? lastStartTime;

  /// The Amazon Resource Name (ARN) of the role associated with the application.
  final String? roleArn;

  /// Indicates the status of the latest version of the application.
  final ApplicationVersionLifecycle? versionStatus;

  ApplicationSummary({
    required this.applicationArn,
    required this.applicationId,
    required this.applicationVersion,
    required this.creationTime,
    required this.engineType,
    required this.name,
    required this.status,
    this.deploymentStatus,
    this.description,
    this.environmentId,
    this.lastStartTime,
    this.roleArn,
    this.versionStatus,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      applicationArn: json['applicationArn'] as String,
      applicationId: json['applicationId'] as String,
      applicationVersion: json['applicationVersion'] as int,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      engineType: (json['engineType'] as String).toEngineType(),
      name: json['name'] as String,
      status: (json['status'] as String).toApplicationLifecycle(),
      deploymentStatus: (json['deploymentStatus'] as String?)
          ?.toApplicationDeploymentLifecycle(),
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      lastStartTime: timeStampFromJson(json['lastStartTime']),
      roleArn: json['roleArn'] as String?,
      versionStatus:
          (json['versionStatus'] as String?)?.toApplicationVersionLifecycle(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    final applicationVersion = this.applicationVersion;
    final creationTime = this.creationTime;
    final engineType = this.engineType;
    final name = this.name;
    final status = this.status;
    final deploymentStatus = this.deploymentStatus;
    final description = this.description;
    final environmentId = this.environmentId;
    final lastStartTime = this.lastStartTime;
    final roleArn = this.roleArn;
    final versionStatus = this.versionStatus;
    return {
      'applicationArn': applicationArn,
      'applicationId': applicationId,
      'applicationVersion': applicationVersion,
      'creationTime': unixTimestampToJson(creationTime),
      'engineType': engineType.toValue(),
      'name': name,
      'status': status.toValue(),
      if (deploymentStatus != null)
        'deploymentStatus': deploymentStatus.toValue(),
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (lastStartTime != null)
        'lastStartTime': unixTimestampToJson(lastStartTime),
      if (roleArn != null) 'roleArn': roleArn,
      if (versionStatus != null) 'versionStatus': versionStatus.toValue(),
    };
  }
}

enum ApplicationVersionLifecycle {
  creating,
  available,
  failed,
}

extension ApplicationVersionLifecycleValueExtension
    on ApplicationVersionLifecycle {
  String toValue() {
    switch (this) {
      case ApplicationVersionLifecycle.creating:
        return 'Creating';
      case ApplicationVersionLifecycle.available:
        return 'Available';
      case ApplicationVersionLifecycle.failed:
        return 'Failed';
    }
  }
}

extension ApplicationVersionLifecycleFromString on String {
  ApplicationVersionLifecycle toApplicationVersionLifecycle() {
    switch (this) {
      case 'Creating':
        return ApplicationVersionLifecycle.creating;
      case 'Available':
        return ApplicationVersionLifecycle.available;
      case 'Failed':
        return ApplicationVersionLifecycle.failed;
    }
    throw Exception('$this is not known in enum ApplicationVersionLifecycle');
  }
}

/// Defines an application version summary.
class ApplicationVersionSummary {
  /// The application version.
  final int applicationVersion;

  /// The timestamp when the application version was created.
  final DateTime creationTime;

  /// The status of the application.
  final ApplicationVersionLifecycle status;

  /// The reason for the reported status.
  final String? statusReason;

  ApplicationVersionSummary({
    required this.applicationVersion,
    required this.creationTime,
    required this.status,
    this.statusReason,
  });

  factory ApplicationVersionSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationVersionSummary(
      applicationVersion: json['applicationVersion'] as int,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      status: (json['status'] as String).toApplicationVersionLifecycle(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersion = this.applicationVersion;
    final creationTime = this.creationTime;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'applicationVersion': applicationVersion,
      'creationTime': unixTimestampToJson(creationTime),
      'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Defines the details of a batch job.
class BatchJobDefinition {
  /// Specifies a file containing a batch job definition.
  final FileBatchJobDefinition? fileBatchJobDefinition;

  /// A script containing a batch job definition.
  final ScriptBatchJobDefinition? scriptBatchJobDefinition;

  BatchJobDefinition({
    this.fileBatchJobDefinition,
    this.scriptBatchJobDefinition,
  });

  factory BatchJobDefinition.fromJson(Map<String, dynamic> json) {
    return BatchJobDefinition(
      fileBatchJobDefinition: json['fileBatchJobDefinition'] != null
          ? FileBatchJobDefinition.fromJson(
              json['fileBatchJobDefinition'] as Map<String, dynamic>)
          : null,
      scriptBatchJobDefinition: json['scriptBatchJobDefinition'] != null
          ? ScriptBatchJobDefinition.fromJson(
              json['scriptBatchJobDefinition'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileBatchJobDefinition = this.fileBatchJobDefinition;
    final scriptBatchJobDefinition = this.scriptBatchJobDefinition;
    return {
      if (fileBatchJobDefinition != null)
        'fileBatchJobDefinition': fileBatchJobDefinition,
      if (scriptBatchJobDefinition != null)
        'scriptBatchJobDefinition': scriptBatchJobDefinition,
    };
  }
}

enum BatchJobExecutionStatus {
  submitting,
  holding,
  dispatching,
  running,
  cancelling,
  cancelled,
  succeeded,
  failed,
  purged,
  succeededWithWarning,
}

extension BatchJobExecutionStatusValueExtension on BatchJobExecutionStatus {
  String toValue() {
    switch (this) {
      case BatchJobExecutionStatus.submitting:
        return 'Submitting';
      case BatchJobExecutionStatus.holding:
        return 'Holding';
      case BatchJobExecutionStatus.dispatching:
        return 'Dispatching';
      case BatchJobExecutionStatus.running:
        return 'Running';
      case BatchJobExecutionStatus.cancelling:
        return 'Cancelling';
      case BatchJobExecutionStatus.cancelled:
        return 'Cancelled';
      case BatchJobExecutionStatus.succeeded:
        return 'Succeeded';
      case BatchJobExecutionStatus.failed:
        return 'Failed';
      case BatchJobExecutionStatus.purged:
        return 'Purged';
      case BatchJobExecutionStatus.succeededWithWarning:
        return 'Succeeded With Warning';
    }
  }
}

extension BatchJobExecutionStatusFromString on String {
  BatchJobExecutionStatus toBatchJobExecutionStatus() {
    switch (this) {
      case 'Submitting':
        return BatchJobExecutionStatus.submitting;
      case 'Holding':
        return BatchJobExecutionStatus.holding;
      case 'Dispatching':
        return BatchJobExecutionStatus.dispatching;
      case 'Running':
        return BatchJobExecutionStatus.running;
      case 'Cancelling':
        return BatchJobExecutionStatus.cancelling;
      case 'Cancelled':
        return BatchJobExecutionStatus.cancelled;
      case 'Succeeded':
        return BatchJobExecutionStatus.succeeded;
      case 'Failed':
        return BatchJobExecutionStatus.failed;
      case 'Purged':
        return BatchJobExecutionStatus.purged;
      case 'Succeeded With Warning':
        return BatchJobExecutionStatus.succeededWithWarning;
    }
    throw Exception('$this is not known in enum BatchJobExecutionStatus');
  }
}

/// A subset of the possible batch job attributes. Used in the batch job list.
class BatchJobExecutionSummary {
  /// The unique identifier of the application that hosts this batch job.
  final String applicationId;

  /// The unique identifier of this execution of the batch job.
  final String executionId;

  /// The timestamp when a particular batch job execution started.
  final DateTime startTime;

  /// The status of a particular batch job execution.
  final BatchJobExecutionStatus status;

  /// The unique identifier of this batch job.
  final BatchJobIdentifier? batchJobIdentifier;

  /// The timestamp when this batch job execution ended.
  final DateTime? endTime;

  /// The unique identifier of a particular batch job.
  final String? jobId;

  /// The name of a particular batch job.
  final String? jobName;

  /// The type of a particular batch job execution.
  final BatchJobType? jobType;

  /// The batch job return code from either the Blu Age or Micro Focus runtime
  /// engines. For more information, see <a
  /// href="https://www.ibm.com/docs/en/was/8.5.5?topic=model-batch-return-codes">Batch
  /// return codes</a> in the <i>IBM WebSphere Application Server</i>
  /// documentation.
  final String? returnCode;

  BatchJobExecutionSummary({
    required this.applicationId,
    required this.executionId,
    required this.startTime,
    required this.status,
    this.batchJobIdentifier,
    this.endTime,
    this.jobId,
    this.jobName,
    this.jobType,
    this.returnCode,
  });

  factory BatchJobExecutionSummary.fromJson(Map<String, dynamic> json) {
    return BatchJobExecutionSummary(
      applicationId: json['applicationId'] as String,
      executionId: json['executionId'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toBatchJobExecutionStatus(),
      batchJobIdentifier: json['batchJobIdentifier'] != null
          ? BatchJobIdentifier.fromJson(
              json['batchJobIdentifier'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      jobId: json['jobId'] as String?,
      jobName: json['jobName'] as String?,
      jobType: (json['jobType'] as String?)?.toBatchJobType(),
      returnCode: json['returnCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final executionId = this.executionId;
    final startTime = this.startTime;
    final status = this.status;
    final batchJobIdentifier = this.batchJobIdentifier;
    final endTime = this.endTime;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobType = this.jobType;
    final returnCode = this.returnCode;
    return {
      'applicationId': applicationId,
      'executionId': executionId,
      'startTime': unixTimestampToJson(startTime),
      'status': status.toValue(),
      if (batchJobIdentifier != null) 'batchJobIdentifier': batchJobIdentifier,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (jobId != null) 'jobId': jobId,
      if (jobName != null) 'jobName': jobName,
      if (jobType != null) 'jobType': jobType.toValue(),
      if (returnCode != null) 'returnCode': returnCode,
    };
  }
}

/// Identifies a specific batch job.
class BatchJobIdentifier {
  /// Specifies a file associated with a specific batch job.
  final FileBatchJobIdentifier? fileBatchJobIdentifier;

  /// Specifies the required information for restart, including execution ID and
  /// jobsteprestartmarker.
  final RestartBatchJobIdentifier? restartBatchJobIdentifier;

  /// Specifies an Amazon S3 location that identifies the batch jobs that you want
  /// to run. Use this identifier to run ad hoc batch jobs.
  final S3BatchJobIdentifier? s3BatchJobIdentifier;

  /// A batch job identifier in which the batch job to run is identified by the
  /// script name.
  final ScriptBatchJobIdentifier? scriptBatchJobIdentifier;

  BatchJobIdentifier({
    this.fileBatchJobIdentifier,
    this.restartBatchJobIdentifier,
    this.s3BatchJobIdentifier,
    this.scriptBatchJobIdentifier,
  });

  factory BatchJobIdentifier.fromJson(Map<String, dynamic> json) {
    return BatchJobIdentifier(
      fileBatchJobIdentifier: json['fileBatchJobIdentifier'] != null
          ? FileBatchJobIdentifier.fromJson(
              json['fileBatchJobIdentifier'] as Map<String, dynamic>)
          : null,
      restartBatchJobIdentifier: json['restartBatchJobIdentifier'] != null
          ? RestartBatchJobIdentifier.fromJson(
              json['restartBatchJobIdentifier'] as Map<String, dynamic>)
          : null,
      s3BatchJobIdentifier: json['s3BatchJobIdentifier'] != null
          ? S3BatchJobIdentifier.fromJson(
              json['s3BatchJobIdentifier'] as Map<String, dynamic>)
          : null,
      scriptBatchJobIdentifier: json['scriptBatchJobIdentifier'] != null
          ? ScriptBatchJobIdentifier.fromJson(
              json['scriptBatchJobIdentifier'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fileBatchJobIdentifier = this.fileBatchJobIdentifier;
    final restartBatchJobIdentifier = this.restartBatchJobIdentifier;
    final s3BatchJobIdentifier = this.s3BatchJobIdentifier;
    final scriptBatchJobIdentifier = this.scriptBatchJobIdentifier;
    return {
      if (fileBatchJobIdentifier != null)
        'fileBatchJobIdentifier': fileBatchJobIdentifier,
      if (restartBatchJobIdentifier != null)
        'restartBatchJobIdentifier': restartBatchJobIdentifier,
      if (s3BatchJobIdentifier != null)
        's3BatchJobIdentifier': s3BatchJobIdentifier,
      if (scriptBatchJobIdentifier != null)
        'scriptBatchJobIdentifier': scriptBatchJobIdentifier,
    };
  }
}

enum BatchJobType {
  vse,
  jes2,
  jes3,
}

extension BatchJobTypeValueExtension on BatchJobType {
  String toValue() {
    switch (this) {
      case BatchJobType.vse:
        return 'VSE';
      case BatchJobType.jes2:
        return 'JES2';
      case BatchJobType.jes3:
        return 'JES3';
    }
  }
}

extension BatchJobTypeFromString on String {
  BatchJobType toBatchJobType() {
    switch (this) {
      case 'VSE':
        return BatchJobType.vse;
      case 'JES2':
        return BatchJobType.jes2;
      case 'JES3':
        return BatchJobType.jes3;
    }
    throw Exception('$this is not known in enum BatchJobType');
  }
}

class CancelBatchJobExecutionResponse {
  CancelBatchJobExecutionResponse();

  factory CancelBatchJobExecutionResponse.fromJson(Map<String, dynamic> _) {
    return CancelBatchJobExecutionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateApplicationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// The unique application identifier.
  final String applicationId;

  /// The version number of the application.
  final int applicationVersion;

  CreateApplicationResponse({
    required this.applicationArn,
    required this.applicationId,
    required this.applicationVersion,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationArn: json['applicationArn'] as String,
      applicationId: json['applicationId'] as String,
      applicationVersion: json['applicationVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    final applicationVersion = this.applicationVersion;
    return {
      'applicationArn': applicationArn,
      'applicationId': applicationId,
      'applicationVersion': applicationVersion,
    };
  }
}

class CreateDataSetImportTaskResponse {
  /// The task identifier. This operation is asynchronous. Use this identifier
  /// with the <a>GetDataSetImportTask</a> operation to obtain the status of this
  /// task.
  final String taskId;

  CreateDataSetImportTaskResponse({
    required this.taskId,
  });

  factory CreateDataSetImportTaskResponse.fromJson(Map<String, dynamic> json) {
    return CreateDataSetImportTaskResponse(
      taskId: json['taskId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final taskId = this.taskId;
    return {
      'taskId': taskId,
    };
  }
}

class CreateDeploymentResponse {
  /// The unique identifier of the deployment.
  final String deploymentId;

  CreateDeploymentResponse({
    required this.deploymentId,
  });

  factory CreateDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentResponse(
      deploymentId: json['deploymentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentId = this.deploymentId;
    return {
      'deploymentId': deploymentId,
    };
  }
}

class CreateEnvironmentResponse {
  /// The unique identifier of the runtime environment.
  final String environmentId;

  CreateEnvironmentResponse({
    required this.environmentId,
  });

  factory CreateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateEnvironmentResponse(
      environmentId: json['environmentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// Defines a data set.
class DataSet {
  /// The logical identifier for a specific data set (in mainframe format).
  final String datasetName;

  /// The type of dataset. The only supported value is VSAM.
  final DatasetOrgAttributes datasetOrg;

  /// The length of a record.
  final RecordLength recordLength;

  /// The relative location of the data set in the database or file system.
  final String? relativePath;

  /// The storage type of the data set: database or file system. For Micro Focus,
  /// database corresponds to datastore and file system corresponds to EFS/FSX.
  /// For Blu Age, there is no support of file system and database corresponds to
  /// Blusam.
  final String? storageType;

  DataSet({
    required this.datasetName,
    required this.datasetOrg,
    required this.recordLength,
    this.relativePath,
    this.storageType,
  });

  Map<String, dynamic> toJson() {
    final datasetName = this.datasetName;
    final datasetOrg = this.datasetOrg;
    final recordLength = this.recordLength;
    final relativePath = this.relativePath;
    final storageType = this.storageType;
    return {
      'datasetName': datasetName,
      'datasetOrg': datasetOrg,
      'recordLength': recordLength,
      if (relativePath != null) 'relativePath': relativePath,
      if (storageType != null) 'storageType': storageType,
    };
  }
}

/// Identifies one or more data sets you want to import with the
/// <a>CreateDataSetImportTask</a> operation.
class DataSetImportConfig {
  /// The data sets.
  final List<DataSetImportItem>? dataSets;

  /// The Amazon S3 location of the data sets.
  final String? s3Location;

  DataSetImportConfig({
    this.dataSets,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final dataSets = this.dataSets;
    final s3Location = this.s3Location;
    return {
      if (dataSets != null) 'dataSets': dataSets,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// Identifies a specific data set to import from an external location.
class DataSetImportItem {
  /// The data set.
  final DataSet dataSet;

  /// The location of the data set.
  final ExternalLocation externalLocation;

  DataSetImportItem({
    required this.dataSet,
    required this.externalLocation,
  });

  Map<String, dynamic> toJson() {
    final dataSet = this.dataSet;
    final externalLocation = this.externalLocation;
    return {
      'dataSet': dataSet,
      'externalLocation': externalLocation,
    };
  }
}

/// Represents a summary of data set imports.
class DataSetImportSummary {
  /// The number of data set imports that have failed.
  final int failed;

  /// The number of data set imports that are in progress.
  final int inProgress;

  /// The number of data set imports that are pending.
  final int pending;

  /// The number of data set imports that have succeeded.
  final int succeeded;

  /// The total number of data set imports.
  final int total;

  DataSetImportSummary({
    required this.failed,
    required this.inProgress,
    required this.pending,
    required this.succeeded,
    required this.total,
  });

  factory DataSetImportSummary.fromJson(Map<String, dynamic> json) {
    return DataSetImportSummary(
      failed: json['failed'] as int,
      inProgress: json['inProgress'] as int,
      pending: json['pending'] as int,
      succeeded: json['succeeded'] as int,
      total: json['total'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final failed = this.failed;
    final inProgress = this.inProgress;
    final pending = this.pending;
    final succeeded = this.succeeded;
    final total = this.total;
    return {
      'failed': failed,
      'inProgress': inProgress,
      'pending': pending,
      'succeeded': succeeded,
      'total': total,
    };
  }
}

/// Contains information about a data set import task.
class DataSetImportTask {
  /// The status of the data set import task.
  final DataSetTaskLifecycle status;

  /// A summary of the data set import task.
  final DataSetImportSummary summary;

  /// The identifier of the data set import task.
  final String taskId;

  /// If dataset import failed, the failure reason will show here.
  final String? statusReason;

  DataSetImportTask({
    required this.status,
    required this.summary,
    required this.taskId,
    this.statusReason,
  });

  factory DataSetImportTask.fromJson(Map<String, dynamic> json) {
    return DataSetImportTask(
      status: (json['status'] as String).toDataSetTaskLifecycle(),
      summary: DataSetImportSummary.fromJson(
          json['summary'] as Map<String, dynamic>),
      taskId: json['taskId'] as String,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final summary = this.summary;
    final taskId = this.taskId;
    final statusReason = this.statusReason;
    return {
      'status': status.toValue(),
      'summary': summary,
      'taskId': taskId,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// A subset of the possible data set attributes.
class DataSetSummary {
  /// The name of the data set.
  final String dataSetName;

  /// The timestamp when the data set was created.
  final DateTime? creationTime;

  /// The type of data set. The only supported value is VSAM.
  final String? dataSetOrg;

  /// The format of the data set.
  final String? format;

  /// The last time the data set was referenced.
  final DateTime? lastReferencedTime;

  /// The last time the data set was updated.
  final DateTime? lastUpdatedTime;

  DataSetSummary({
    required this.dataSetName,
    this.creationTime,
    this.dataSetOrg,
    this.format,
    this.lastReferencedTime,
    this.lastUpdatedTime,
  });

  factory DataSetSummary.fromJson(Map<String, dynamic> json) {
    return DataSetSummary(
      dataSetName: json['dataSetName'] as String,
      creationTime: timeStampFromJson(json['creationTime']),
      dataSetOrg: json['dataSetOrg'] as String?,
      format: json['format'] as String?,
      lastReferencedTime: timeStampFromJson(json['lastReferencedTime']),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetName = this.dataSetName;
    final creationTime = this.creationTime;
    final dataSetOrg = this.dataSetOrg;
    final format = this.format;
    final lastReferencedTime = this.lastReferencedTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    return {
      'dataSetName': dataSetName,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (dataSetOrg != null) 'dataSetOrg': dataSetOrg,
      if (format != null) 'format': format,
      if (lastReferencedTime != null)
        'lastReferencedTime': unixTimestampToJson(lastReferencedTime),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
    };
  }
}

enum DataSetTaskLifecycle {
  creating,
  running,
  completed,
  failed,
}

extension DataSetTaskLifecycleValueExtension on DataSetTaskLifecycle {
  String toValue() {
    switch (this) {
      case DataSetTaskLifecycle.creating:
        return 'Creating';
      case DataSetTaskLifecycle.running:
        return 'Running';
      case DataSetTaskLifecycle.completed:
        return 'Completed';
      case DataSetTaskLifecycle.failed:
        return 'Failed';
    }
  }
}

extension DataSetTaskLifecycleFromString on String {
  DataSetTaskLifecycle toDataSetTaskLifecycle() {
    switch (this) {
      case 'Creating':
        return DataSetTaskLifecycle.creating;
      case 'Running':
        return DataSetTaskLifecycle.running;
      case 'Completed':
        return DataSetTaskLifecycle.completed;
      case 'Failed':
        return DataSetTaskLifecycle.failed;
    }
    throw Exception('$this is not known in enum DataSetTaskLifecycle');
  }
}

/// Additional details about the data set. Different attributes correspond to
/// different data set organizations. The values are populated based on
/// datasetOrg, storageType and backend (Blu Age or Micro Focus).
class DatasetDetailOrgAttributes {
  /// The generation data group of the data set.
  final GdgDetailAttributes? gdg;

  /// The details of a PO type data set.
  final PoDetailAttributes? po;

  /// The details of a PS type data set.
  final PsDetailAttributes? ps;

  /// The details of a VSAM data set.
  final VsamDetailAttributes? vsam;

  DatasetDetailOrgAttributes({
    this.gdg,
    this.po,
    this.ps,
    this.vsam,
  });

  factory DatasetDetailOrgAttributes.fromJson(Map<String, dynamic> json) {
    return DatasetDetailOrgAttributes(
      gdg: json['gdg'] != null
          ? GdgDetailAttributes.fromJson(json['gdg'] as Map<String, dynamic>)
          : null,
      po: json['po'] != null
          ? PoDetailAttributes.fromJson(json['po'] as Map<String, dynamic>)
          : null,
      ps: json['ps'] != null
          ? PsDetailAttributes.fromJson(json['ps'] as Map<String, dynamic>)
          : null,
      vsam: json['vsam'] != null
          ? VsamDetailAttributes.fromJson(json['vsam'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final gdg = this.gdg;
    final po = this.po;
    final ps = this.ps;
    final vsam = this.vsam;
    return {
      if (gdg != null) 'gdg': gdg,
      if (po != null) 'po': po,
      if (ps != null) 'ps': ps,
      if (vsam != null) 'vsam': vsam,
    };
  }
}

/// Additional details about the data set. Different attributes correspond to
/// different data set organizations. The values are populated based on
/// datasetOrg, storageType and backend (Blu Age or Micro Focus).
class DatasetOrgAttributes {
  /// The generation data group of the data set.
  final GdgAttributes? gdg;

  /// The details of a PO type data set.
  final PoAttributes? po;

  /// The details of a PS type data set.
  final PsAttributes? ps;

  /// The details of a VSAM data set.
  final VsamAttributes? vsam;

  DatasetOrgAttributes({
    this.gdg,
    this.po,
    this.ps,
    this.vsam,
  });

  Map<String, dynamic> toJson() {
    final gdg = this.gdg;
    final po = this.po;
    final ps = this.ps;
    final vsam = this.vsam;
    return {
      if (gdg != null) 'gdg': gdg,
      if (po != null) 'po': po,
      if (ps != null) 'ps': ps,
      if (vsam != null) 'vsam': vsam,
    };
  }
}

/// The application definition for a particular application.
class Definition {
  /// The content of the application definition. This is a JSON object that
  /// contains the resource configuration/definitions that identify an
  /// application.
  final String? content;

  /// The S3 bucket that contains the application definition.
  final String? s3Location;

  Definition({
    this.content,
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final content = this.content;
    final s3Location = this.s3Location;
    return {
      if (content != null) 'content': content,
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

class DeleteApplicationFromEnvironmentResponse {
  DeleteApplicationFromEnvironmentResponse();

  factory DeleteApplicationFromEnvironmentResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteApplicationFromEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteApplicationResponse {
  DeleteApplicationResponse();

  factory DeleteApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteEnvironmentResponse {
  DeleteEnvironmentResponse();

  factory DeleteEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Contains a summary of a deployed application.
class DeployedVersionSummary {
  /// The version of the deployed application.
  final int applicationVersion;

  /// The status of the deployment.
  final DeploymentLifecycle status;

  /// The reason for the reported status.
  final String? statusReason;

  DeployedVersionSummary({
    required this.applicationVersion,
    required this.status,
    this.statusReason,
  });

  factory DeployedVersionSummary.fromJson(Map<String, dynamic> json) {
    return DeployedVersionSummary(
      applicationVersion: json['applicationVersion'] as int,
      status: (json['status'] as String).toDeploymentLifecycle(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersion = this.applicationVersion;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'applicationVersion': applicationVersion,
      'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

enum DeploymentLifecycle {
  deploying,
  succeeded,
  failed,
  updatingDeployment,
}

extension DeploymentLifecycleValueExtension on DeploymentLifecycle {
  String toValue() {
    switch (this) {
      case DeploymentLifecycle.deploying:
        return 'Deploying';
      case DeploymentLifecycle.succeeded:
        return 'Succeeded';
      case DeploymentLifecycle.failed:
        return 'Failed';
      case DeploymentLifecycle.updatingDeployment:
        return 'Updating Deployment';
    }
  }
}

extension DeploymentLifecycleFromString on String {
  DeploymentLifecycle toDeploymentLifecycle() {
    switch (this) {
      case 'Deploying':
        return DeploymentLifecycle.deploying;
      case 'Succeeded':
        return DeploymentLifecycle.succeeded;
      case 'Failed':
        return DeploymentLifecycle.failed;
      case 'Updating Deployment':
        return DeploymentLifecycle.updatingDeployment;
    }
    throw Exception('$this is not known in enum DeploymentLifecycle');
  }
}

/// A subset of information about a specific deployment.
class DeploymentSummary {
  /// The unique identifier of the application.
  final String applicationId;

  /// The version of the application.
  final int applicationVersion;

  /// The timestamp when the deployment was created.
  final DateTime creationTime;

  /// The unique identifier of the deployment.
  final String deploymentId;

  /// The unique identifier of the runtime environment.
  final String environmentId;

  /// The current status of the deployment.
  final DeploymentLifecycle status;

  /// The reason for the reported status.
  final String? statusReason;

  DeploymentSummary({
    required this.applicationId,
    required this.applicationVersion,
    required this.creationTime,
    required this.deploymentId,
    required this.environmentId,
    required this.status,
    this.statusReason,
  });

  factory DeploymentSummary.fromJson(Map<String, dynamic> json) {
    return DeploymentSummary(
      applicationId: json['applicationId'] as String,
      applicationVersion: json['applicationVersion'] as int,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      deploymentId: json['deploymentId'] as String,
      environmentId: json['environmentId'] as String,
      status: (json['status'] as String).toDeploymentLifecycle(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final applicationVersion = this.applicationVersion;
    final creationTime = this.creationTime;
    final deploymentId = this.deploymentId;
    final environmentId = this.environmentId;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'applicationId': applicationId,
      'applicationVersion': applicationVersion,
      'creationTime': unixTimestampToJson(creationTime),
      'deploymentId': deploymentId,
      'environmentId': environmentId,
      'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

/// Defines the storage configuration for an Amazon EFS file system.
class EfsStorageConfiguration {
  /// The file system identifier.
  final String fileSystemId;

  /// The mount point for the file system.
  final String mountPoint;

  EfsStorageConfiguration({
    required this.fileSystemId,
    required this.mountPoint,
  });

  factory EfsStorageConfiguration.fromJson(Map<String, dynamic> json) {
    return EfsStorageConfiguration(
      fileSystemId: json['file-system-id'] as String,
      mountPoint: json['mount-point'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final mountPoint = this.mountPoint;
    return {
      'file-system-id': fileSystemId,
      'mount-point': mountPoint,
    };
  }
}

enum EngineType {
  microfocus,
  bluage,
}

extension EngineTypeValueExtension on EngineType {
  String toValue() {
    switch (this) {
      case EngineType.microfocus:
        return 'microfocus';
      case EngineType.bluage:
        return 'bluage';
    }
  }
}

extension EngineTypeFromString on String {
  EngineType toEngineType() {
    switch (this) {
      case 'microfocus':
        return EngineType.microfocus;
      case 'bluage':
        return EngineType.bluage;
    }
    throw Exception('$this is not known in enum EngineType');
  }
}

/// A subset of information about the engine version for a specific application.
class EngineVersionsSummary {
  /// The type of target platform for the application.
  final String engineType;

  /// The version of the engine type used by the application.
  final String engineVersion;

  EngineVersionsSummary({
    required this.engineType,
    required this.engineVersion,
  });

  factory EngineVersionsSummary.fromJson(Map<String, dynamic> json) {
    return EngineVersionsSummary(
      engineType: json['engineType'] as String,
      engineVersion: json['engineVersion'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final engineType = this.engineType;
    final engineVersion = this.engineVersion;
    return {
      'engineType': engineType,
      'engineVersion': engineVersion,
    };
  }
}

enum EnvironmentLifecycle {
  creating,
  available,
  updating,
  deleting,
  failed,
}

extension EnvironmentLifecycleValueExtension on EnvironmentLifecycle {
  String toValue() {
    switch (this) {
      case EnvironmentLifecycle.creating:
        return 'Creating';
      case EnvironmentLifecycle.available:
        return 'Available';
      case EnvironmentLifecycle.updating:
        return 'Updating';
      case EnvironmentLifecycle.deleting:
        return 'Deleting';
      case EnvironmentLifecycle.failed:
        return 'Failed';
    }
  }
}

extension EnvironmentLifecycleFromString on String {
  EnvironmentLifecycle toEnvironmentLifecycle() {
    switch (this) {
      case 'Creating':
        return EnvironmentLifecycle.creating;
      case 'Available':
        return EnvironmentLifecycle.available;
      case 'Updating':
        return EnvironmentLifecycle.updating;
      case 'Deleting':
        return EnvironmentLifecycle.deleting;
      case 'Failed':
        return EnvironmentLifecycle.failed;
    }
    throw Exception('$this is not known in enum EnvironmentLifecycle');
  }
}

/// Contains a subset of the possible runtime environment attributes. Used in
/// the environment list.
class EnvironmentSummary {
  /// The timestamp when the runtime environment was created.
  final DateTime creationTime;

  /// The target platform for the runtime environment.
  final EngineType engineType;

  /// The version of the runtime engine.
  final String engineVersion;

  /// The Amazon Resource Name (ARN) of a particular runtime environment.
  final String environmentArn;

  /// The unique identifier of a particular runtime environment.
  final String environmentId;

  /// The instance type of the runtime environment.
  final String instanceType;

  /// The name of the runtime environment.
  final String name;

  /// The status of the runtime environment
  final EnvironmentLifecycle status;

  EnvironmentSummary({
    required this.creationTime,
    required this.engineType,
    required this.engineVersion,
    required this.environmentArn,
    required this.environmentId,
    required this.instanceType,
    required this.name,
    required this.status,
  });

  factory EnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return EnvironmentSummary(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      engineType: (json['engineType'] as String).toEngineType(),
      engineVersion: json['engineVersion'] as String,
      environmentArn: json['environmentArn'] as String,
      environmentId: json['environmentId'] as String,
      instanceType: json['instanceType'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toEnvironmentLifecycle(),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final engineType = this.engineType;
    final engineVersion = this.engineVersion;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final instanceType = this.instanceType;
    final name = this.name;
    final status = this.status;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'engineType': engineType.toValue(),
      'engineVersion': engineVersion,
      'environmentArn': environmentArn,
      'environmentId': environmentId,
      'instanceType': instanceType,
      'name': name,
      'status': status.toValue(),
    };
  }
}

/// Defines an external storage location.
class ExternalLocation {
  /// The URI of the Amazon S3 bucket.
  final String? s3Location;

  ExternalLocation({
    this.s3Location,
  });

  Map<String, dynamic> toJson() {
    final s3Location = this.s3Location;
    return {
      if (s3Location != null) 's3Location': s3Location,
    };
  }
}

/// A file containing a batch job definition.
class FileBatchJobDefinition {
  /// The name of the file containing the batch job definition.
  final String fileName;

  /// The path to the file containing the batch job definition.
  final String? folderPath;

  FileBatchJobDefinition({
    required this.fileName,
    this.folderPath,
  });

  factory FileBatchJobDefinition.fromJson(Map<String, dynamic> json) {
    return FileBatchJobDefinition(
      fileName: json['fileName'] as String,
      folderPath: json['folderPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileName = this.fileName;
    final folderPath = this.folderPath;
    return {
      'fileName': fileName,
      if (folderPath != null) 'folderPath': folderPath,
    };
  }
}

/// A batch job identifier in which the batch job to run is identified by the
/// file name and the relative path to the file name.
class FileBatchJobIdentifier {
  /// The file name for the batch job identifier.
  final String fileName;

  /// The relative path to the file name for the batch job identifier.
  final String? folderPath;

  FileBatchJobIdentifier({
    required this.fileName,
    this.folderPath,
  });

  factory FileBatchJobIdentifier.fromJson(Map<String, dynamic> json) {
    return FileBatchJobIdentifier(
      fileName: json['fileName'] as String,
      folderPath: json['folderPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileName = this.fileName;
    final folderPath = this.folderPath;
    return {
      'fileName': fileName,
      if (folderPath != null) 'folderPath': folderPath,
    };
  }
}

/// Defines the storage configuration for an Amazon FSx file system.
class FsxStorageConfiguration {
  /// The file system identifier.
  final String fileSystemId;

  /// The mount point for the file system.
  final String mountPoint;

  FsxStorageConfiguration({
    required this.fileSystemId,
    required this.mountPoint,
  });

  factory FsxStorageConfiguration.fromJson(Map<String, dynamic> json) {
    return FsxStorageConfiguration(
      fileSystemId: json['file-system-id'] as String,
      mountPoint: json['mount-point'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fileSystemId = this.fileSystemId;
    final mountPoint = this.mountPoint;
    return {
      'file-system-id': fileSystemId,
      'mount-point': mountPoint,
    };
  }
}

/// The required attributes for a generation data group data set. A generation
/// data set is one of a collection of successive, historically related,
/// catalogued data sets that together are known as a generation data group
/// (GDG). Use this structure when you want to import a GDG. For more
/// information on GDG, see <a
/// href="https://www.ibm.com/docs/en/zos/2.3.0?topic=guide-generation-data-sets">Generation
/// data sets</a>.
class GdgAttributes {
  /// The maximum number of generation data sets, up to 255, in a GDG.
  final int? limit;

  /// The disposition of the data set in the catalog.
  final String? rollDisposition;

  GdgAttributes({
    this.limit,
    this.rollDisposition,
  });

  Map<String, dynamic> toJson() {
    final limit = this.limit;
    final rollDisposition = this.rollDisposition;
    return {
      if (limit != null) 'limit': limit,
      if (rollDisposition != null) 'rollDisposition': rollDisposition,
    };
  }
}

/// The required attributes for a generation data group data set. A generation
/// data set is one of a collection of successive, historically related,
/// catalogued data sets that together are known as a generation data group
/// (GDG). Use this structure when you want to import a GDG. For more
/// information on GDG, see <a
/// href="https://www.ibm.com/docs/en/zos/2.3.0?topic=guide-generation-data-sets">Generation
/// data sets</a>.
class GdgDetailAttributes {
  /// The maximum number of generation data sets, up to 255, in a GDG.
  final int? limit;

  /// The disposition of the data set in the catalog.
  final String? rollDisposition;

  GdgDetailAttributes({
    this.limit,
    this.rollDisposition,
  });

  factory GdgDetailAttributes.fromJson(Map<String, dynamic> json) {
    return GdgDetailAttributes(
      limit: json['limit'] as int?,
      rollDisposition: json['rollDisposition'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final limit = this.limit;
    final rollDisposition = this.rollDisposition;
    return {
      if (limit != null) 'limit': limit,
      if (rollDisposition != null) 'rollDisposition': rollDisposition,
    };
  }
}

class GetApplicationResponse {
  /// The Amazon Resource Name (ARN) of the application.
  final String applicationArn;

  /// The identifier of the application.
  final String applicationId;

  /// The timestamp when this application was created.
  final DateTime creationTime;

  /// The type of the target platform for the application.
  final EngineType engineType;

  /// The latest version of the application.
  final ApplicationVersionSummary latestVersion;

  /// The unique identifier of the application.
  final String name;

  /// The status of the application.
  final ApplicationLifecycle status;

  /// The version of the application that is deployed.
  final DeployedVersionSummary? deployedVersion;

  /// The description of the application.
  final String? description;

  /// The identifier of the runtime environment where you want to deploy the
  /// application.
  final String? environmentId;

  /// The identifier of a customer managed key.
  final String? kmsKeyId;

  /// The timestamp when you last started the application. Null until the
  /// application runs for the first time.
  final DateTime? lastStartTime;

  /// The Amazon Resource Name (ARN) for the network load balancer listener
  /// created in your Amazon Web Services account. Amazon Web Services Mainframe
  /// Modernization creates this listener for you the first time you deploy an
  /// application.
  final List<String>? listenerArns;

  /// The port associated with the network load balancer listener created in your
  /// Amazon Web Services account.
  final List<int>? listenerPorts;

  /// The public DNS name of the load balancer created in your Amazon Web Services
  /// account.
  final String? loadBalancerDnsName;

  /// The list of log summaries. Each log summary includes the log type as well as
  /// the log group identifier. These are CloudWatch logs. Amazon Web Services
  /// Mainframe Modernization pushes the application log to CloudWatch under the
  /// customer's account.
  final List<LogGroupSummary>? logGroups;

  /// The Amazon Resource Name (ARN) of the role associated with the application.
  final String? roleArn;

  /// The reason for the reported status.
  final String? statusReason;

  /// A list of tags associated with the application.
  final Map<String, String>? tags;

  /// Returns the Amazon Resource Names (ARNs) of the target groups that are
  /// attached to the network load balancer.
  final List<String>? targetGroupArns;

  GetApplicationResponse({
    required this.applicationArn,
    required this.applicationId,
    required this.creationTime,
    required this.engineType,
    required this.latestVersion,
    required this.name,
    required this.status,
    this.deployedVersion,
    this.description,
    this.environmentId,
    this.kmsKeyId,
    this.lastStartTime,
    this.listenerArns,
    this.listenerPorts,
    this.loadBalancerDnsName,
    this.logGroups,
    this.roleArn,
    this.statusReason,
    this.tags,
    this.targetGroupArns,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      applicationArn: json['applicationArn'] as String,
      applicationId: json['applicationId'] as String,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      engineType: (json['engineType'] as String).toEngineType(),
      latestVersion: ApplicationVersionSummary.fromJson(
          json['latestVersion'] as Map<String, dynamic>),
      name: json['name'] as String,
      status: (json['status'] as String).toApplicationLifecycle(),
      deployedVersion: json['deployedVersion'] != null
          ? DeployedVersionSummary.fromJson(
              json['deployedVersion'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      environmentId: json['environmentId'] as String?,
      kmsKeyId: json['kmsKeyId'] as String?,
      lastStartTime: timeStampFromJson(json['lastStartTime']),
      listenerArns: (json['listenerArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      listenerPorts: (json['listenerPorts'] as List?)
          ?.whereNotNull()
          .map((e) => e as int)
          .toList(),
      loadBalancerDnsName: json['loadBalancerDnsName'] as String?,
      logGroups: (json['logGroups'] as List?)
          ?.whereNotNull()
          .map((e) => LogGroupSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      roleArn: json['roleArn'] as String?,
      statusReason: json['statusReason'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetGroupArns: (json['targetGroupArns'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationArn = this.applicationArn;
    final applicationId = this.applicationId;
    final creationTime = this.creationTime;
    final engineType = this.engineType;
    final latestVersion = this.latestVersion;
    final name = this.name;
    final status = this.status;
    final deployedVersion = this.deployedVersion;
    final description = this.description;
    final environmentId = this.environmentId;
    final kmsKeyId = this.kmsKeyId;
    final lastStartTime = this.lastStartTime;
    final listenerArns = this.listenerArns;
    final listenerPorts = this.listenerPorts;
    final loadBalancerDnsName = this.loadBalancerDnsName;
    final logGroups = this.logGroups;
    final roleArn = this.roleArn;
    final statusReason = this.statusReason;
    final tags = this.tags;
    final targetGroupArns = this.targetGroupArns;
    return {
      'applicationArn': applicationArn,
      'applicationId': applicationId,
      'creationTime': unixTimestampToJson(creationTime),
      'engineType': engineType.toValue(),
      'latestVersion': latestVersion,
      'name': name,
      'status': status.toValue(),
      if (deployedVersion != null) 'deployedVersion': deployedVersion,
      if (description != null) 'description': description,
      if (environmentId != null) 'environmentId': environmentId,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (lastStartTime != null)
        'lastStartTime': unixTimestampToJson(lastStartTime),
      if (listenerArns != null) 'listenerArns': listenerArns,
      if (listenerPorts != null) 'listenerPorts': listenerPorts,
      if (loadBalancerDnsName != null)
        'loadBalancerDnsName': loadBalancerDnsName,
      if (logGroups != null) 'logGroups': logGroups,
      if (roleArn != null) 'roleArn': roleArn,
      if (statusReason != null) 'statusReason': statusReason,
      if (tags != null) 'tags': tags,
      if (targetGroupArns != null) 'targetGroupArns': targetGroupArns,
    };
  }
}

class GetApplicationVersionResponse {
  /// The specific version of the application.
  final int applicationVersion;

  /// The timestamp when the application version was created.
  final DateTime creationTime;

  /// The content of the application definition. This is a JSON object that
  /// contains the resource configuration and definitions that identify an
  /// application.
  final String definitionContent;

  /// The name of the application version.
  final String name;

  /// The status of the application version.
  final ApplicationVersionLifecycle status;

  /// The application description.
  final String? description;

  /// The reason for the reported status.
  final String? statusReason;

  GetApplicationVersionResponse({
    required this.applicationVersion,
    required this.creationTime,
    required this.definitionContent,
    required this.name,
    required this.status,
    this.description,
    this.statusReason,
  });

  factory GetApplicationVersionResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationVersionResponse(
      applicationVersion: json['applicationVersion'] as int,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      definitionContent: json['definitionContent'] as String,
      name: json['name'] as String,
      status: (json['status'] as String).toApplicationVersionLifecycle(),
      description: json['description'] as String?,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersion = this.applicationVersion;
    final creationTime = this.creationTime;
    final definitionContent = this.definitionContent;
    final name = this.name;
    final status = this.status;
    final description = this.description;
    final statusReason = this.statusReason;
    return {
      'applicationVersion': applicationVersion,
      'creationTime': unixTimestampToJson(creationTime),
      'definitionContent': definitionContent,
      'name': name,
      'status': status.toValue(),
      if (description != null) 'description': description,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class GetBatchJobExecutionResponse {
  /// The identifier of the application.
  final String applicationId;

  /// The unique identifier for this batch job execution.
  final String executionId;

  /// The timestamp when the batch job execution started.
  final DateTime startTime;

  /// The status of the batch job execution.
  final BatchJobExecutionStatus status;

  /// The unique identifier of this batch job.
  final BatchJobIdentifier? batchJobIdentifier;

  /// The timestamp when the batch job execution ended.
  final DateTime? endTime;

  /// The unique identifier for this batch job.
  final String? jobId;

  /// The name of this batch job.
  final String? jobName;

  /// The restart steps information for the most recent restart operation.
  final JobStepRestartMarker? jobStepRestartMarker;

  /// The type of job.
  final BatchJobType? jobType;

  /// The user for the job.
  final String? jobUser;

  /// The batch job return code from either the Blu Age or Micro Focus runtime
  /// engines. For more information, see <a
  /// href="https://www.ibm.com/docs/en/was/8.5.5?topic=model-batch-return-codes">Batch
  /// return codes</a> in the <i>IBM WebSphere Application Server</i>
  /// documentation.
  final String? returnCode;

  /// The reason for the reported status.
  final String? statusReason;

  GetBatchJobExecutionResponse({
    required this.applicationId,
    required this.executionId,
    required this.startTime,
    required this.status,
    this.batchJobIdentifier,
    this.endTime,
    this.jobId,
    this.jobName,
    this.jobStepRestartMarker,
    this.jobType,
    this.jobUser,
    this.returnCode,
    this.statusReason,
  });

  factory GetBatchJobExecutionResponse.fromJson(Map<String, dynamic> json) {
    return GetBatchJobExecutionResponse(
      applicationId: json['applicationId'] as String,
      executionId: json['executionId'] as String,
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
      status: (json['status'] as String).toBatchJobExecutionStatus(),
      batchJobIdentifier: json['batchJobIdentifier'] != null
          ? BatchJobIdentifier.fromJson(
              json['batchJobIdentifier'] as Map<String, dynamic>)
          : null,
      endTime: timeStampFromJson(json['endTime']),
      jobId: json['jobId'] as String?,
      jobName: json['jobName'] as String?,
      jobStepRestartMarker: json['jobStepRestartMarker'] != null
          ? JobStepRestartMarker.fromJson(
              json['jobStepRestartMarker'] as Map<String, dynamic>)
          : null,
      jobType: (json['jobType'] as String?)?.toBatchJobType(),
      jobUser: json['jobUser'] as String?,
      returnCode: json['returnCode'] as String?,
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final executionId = this.executionId;
    final startTime = this.startTime;
    final status = this.status;
    final batchJobIdentifier = this.batchJobIdentifier;
    final endTime = this.endTime;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final jobStepRestartMarker = this.jobStepRestartMarker;
    final jobType = this.jobType;
    final jobUser = this.jobUser;
    final returnCode = this.returnCode;
    final statusReason = this.statusReason;
    return {
      'applicationId': applicationId,
      'executionId': executionId,
      'startTime': unixTimestampToJson(startTime),
      'status': status.toValue(),
      if (batchJobIdentifier != null) 'batchJobIdentifier': batchJobIdentifier,
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (jobId != null) 'jobId': jobId,
      if (jobName != null) 'jobName': jobName,
      if (jobStepRestartMarker != null)
        'jobStepRestartMarker': jobStepRestartMarker,
      if (jobType != null) 'jobType': jobType.toValue(),
      if (jobUser != null) 'jobUser': jobUser,
      if (returnCode != null) 'returnCode': returnCode,
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class GetDataSetDetailsResponse {
  /// The name of the data set.
  final String dataSetName;

  /// The size of the block on disk.
  final int? blocksize;

  /// The timestamp when the data set was created.
  final DateTime? creationTime;

  /// The type of data set. The only supported value is VSAM.
  final DatasetDetailOrgAttributes? dataSetOrg;

  /// File size of the dataset.
  final int? fileSize;

  /// The last time the data set was referenced.
  final DateTime? lastReferencedTime;

  /// The last time the data set was updated.
  final DateTime? lastUpdatedTime;

  /// The location where the data set is stored.
  final String? location;

  /// The length of records in the data set.
  final int? recordLength;

  GetDataSetDetailsResponse({
    required this.dataSetName,
    this.blocksize,
    this.creationTime,
    this.dataSetOrg,
    this.fileSize,
    this.lastReferencedTime,
    this.lastUpdatedTime,
    this.location,
    this.recordLength,
  });

  factory GetDataSetDetailsResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSetDetailsResponse(
      dataSetName: json['dataSetName'] as String,
      blocksize: json['blocksize'] as int?,
      creationTime: timeStampFromJson(json['creationTime']),
      dataSetOrg: json['dataSetOrg'] != null
          ? DatasetDetailOrgAttributes.fromJson(
              json['dataSetOrg'] as Map<String, dynamic>)
          : null,
      fileSize: json['fileSize'] as int?,
      lastReferencedTime: timeStampFromJson(json['lastReferencedTime']),
      lastUpdatedTime: timeStampFromJson(json['lastUpdatedTime']),
      location: json['location'] as String?,
      recordLength: json['recordLength'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetName = this.dataSetName;
    final blocksize = this.blocksize;
    final creationTime = this.creationTime;
    final dataSetOrg = this.dataSetOrg;
    final fileSize = this.fileSize;
    final lastReferencedTime = this.lastReferencedTime;
    final lastUpdatedTime = this.lastUpdatedTime;
    final location = this.location;
    final recordLength = this.recordLength;
    return {
      'dataSetName': dataSetName,
      if (blocksize != null) 'blocksize': blocksize,
      if (creationTime != null)
        'creationTime': unixTimestampToJson(creationTime),
      if (dataSetOrg != null) 'dataSetOrg': dataSetOrg,
      if (fileSize != null) 'fileSize': fileSize,
      if (lastReferencedTime != null)
        'lastReferencedTime': unixTimestampToJson(lastReferencedTime),
      if (lastUpdatedTime != null)
        'lastUpdatedTime': unixTimestampToJson(lastUpdatedTime),
      if (location != null) 'location': location,
      if (recordLength != null) 'recordLength': recordLength,
    };
  }
}

class GetDataSetImportTaskResponse {
  /// The status of the task.
  final DataSetTaskLifecycle status;

  /// The task identifier.
  final String taskId;

  /// A summary of the status of the task.
  final DataSetImportSummary? summary;

  GetDataSetImportTaskResponse({
    required this.status,
    required this.taskId,
    this.summary,
  });

  factory GetDataSetImportTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetDataSetImportTaskResponse(
      status: (json['status'] as String).toDataSetTaskLifecycle(),
      taskId: json['taskId'] as String,
      summary: json['summary'] != null
          ? DataSetImportSummary.fromJson(
              json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final taskId = this.taskId;
    final summary = this.summary;
    return {
      'status': status.toValue(),
      'taskId': taskId,
      if (summary != null) 'summary': summary,
    };
  }
}

class GetDeploymentResponse {
  /// The unique identifier of the application.
  final String applicationId;

  /// The application version.
  final int applicationVersion;

  /// The timestamp when the deployment was created.
  final DateTime creationTime;

  /// The unique identifier of the deployment.
  final String deploymentId;

  /// The unique identifier of the runtime environment.
  final String environmentId;

  /// The status of the deployment.
  final DeploymentLifecycle status;

  /// The reason for the reported status.
  final String? statusReason;

  GetDeploymentResponse({
    required this.applicationId,
    required this.applicationVersion,
    required this.creationTime,
    required this.deploymentId,
    required this.environmentId,
    required this.status,
    this.statusReason,
  });

  factory GetDeploymentResponse.fromJson(Map<String, dynamic> json) {
    return GetDeploymentResponse(
      applicationId: json['applicationId'] as String,
      applicationVersion: json['applicationVersion'] as int,
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      deploymentId: json['deploymentId'] as String,
      environmentId: json['environmentId'] as String,
      status: (json['status'] as String).toDeploymentLifecycle(),
      statusReason: json['statusReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final applicationVersion = this.applicationVersion;
    final creationTime = this.creationTime;
    final deploymentId = this.deploymentId;
    final environmentId = this.environmentId;
    final status = this.status;
    final statusReason = this.statusReason;
    return {
      'applicationId': applicationId,
      'applicationVersion': applicationVersion,
      'creationTime': unixTimestampToJson(creationTime),
      'deploymentId': deploymentId,
      'environmentId': environmentId,
      'status': status.toValue(),
      if (statusReason != null) 'statusReason': statusReason,
    };
  }
}

class GetEnvironmentResponse {
  /// The timestamp when the runtime environment was created.
  final DateTime creationTime;

  /// The target platform for the runtime environment.
  final EngineType engineType;

  /// The version of the runtime engine.
  final String engineVersion;

  /// The Amazon Resource Name (ARN) of the runtime environment.
  final String environmentArn;

  /// The unique identifier of the runtime environment.
  final String environmentId;

  /// The type of instance underlying the runtime environment.
  final String instanceType;

  /// The name of the runtime environment. Must be unique within the account.
  final String name;

  /// The unique identifiers of the security groups assigned to this runtime
  /// environment.
  final List<String> securityGroupIds;

  /// The status of the runtime environment.
  final EnvironmentLifecycle status;

  /// The unique identifiers of the subnets assigned to this runtime environment.
  final List<String> subnetIds;

  /// The unique identifier for the VPC used with this runtime environment.
  final String vpcId;

  /// The number of instances included in the runtime environment. A standalone
  /// runtime environment has a maximum of one instance. Currently, a high
  /// availability runtime environment has a maximum of two instances.
  final int? actualCapacity;

  /// The description of the runtime environment.
  final String? description;

  /// The desired capacity of the high availability configuration for the runtime
  /// environment.
  final HighAvailabilityConfig? highAvailabilityConfig;

  /// The identifier of a customer managed key.
  final String? kmsKeyId;

  /// The Amazon Resource Name (ARN) for the load balancer used with the runtime
  /// environment.
  final String? loadBalancerArn;

  /// Indicates the pending maintenance scheduled on this environment.
  final PendingMaintenance? pendingMaintenance;

  /// The maintenance window for the runtime environment. If you don't provide a
  /// value for the maintenance window, the service assigns a random value.
  final String? preferredMaintenanceWindow;

  /// Whether applications running in this runtime environment are publicly
  /// accessible.
  final bool? publiclyAccessible;

  /// The reason for the reported status.
  final String? statusReason;

  /// The storage configurations defined for the runtime environment.
  final List<StorageConfiguration>? storageConfigurations;

  /// The tags defined for this runtime environment.
  final Map<String, String>? tags;

  GetEnvironmentResponse({
    required this.creationTime,
    required this.engineType,
    required this.engineVersion,
    required this.environmentArn,
    required this.environmentId,
    required this.instanceType,
    required this.name,
    required this.securityGroupIds,
    required this.status,
    required this.subnetIds,
    required this.vpcId,
    this.actualCapacity,
    this.description,
    this.highAvailabilityConfig,
    this.kmsKeyId,
    this.loadBalancerArn,
    this.pendingMaintenance,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.statusReason,
    this.storageConfigurations,
    this.tags,
  });

  factory GetEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetEnvironmentResponse(
      creationTime:
          nonNullableTimeStampFromJson(json['creationTime'] as Object),
      engineType: (json['engineType'] as String).toEngineType(),
      engineVersion: json['engineVersion'] as String,
      environmentArn: json['environmentArn'] as String,
      environmentId: json['environmentId'] as String,
      instanceType: json['instanceType'] as String,
      name: json['name'] as String,
      securityGroupIds: (json['securityGroupIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String).toEnvironmentLifecycle(),
      subnetIds: (json['subnetIds'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String,
      actualCapacity: json['actualCapacity'] as int?,
      description: json['description'] as String?,
      highAvailabilityConfig: json['highAvailabilityConfig'] != null
          ? HighAvailabilityConfig.fromJson(
              json['highAvailabilityConfig'] as Map<String, dynamic>)
          : null,
      kmsKeyId: json['kmsKeyId'] as String?,
      loadBalancerArn: json['loadBalancerArn'] as String?,
      pendingMaintenance: json['pendingMaintenance'] != null
          ? PendingMaintenance.fromJson(
              json['pendingMaintenance'] as Map<String, dynamic>)
          : null,
      preferredMaintenanceWindow: json['preferredMaintenanceWindow'] as String?,
      publiclyAccessible: json['publiclyAccessible'] as bool?,
      statusReason: json['statusReason'] as String?,
      storageConfigurations: (json['storageConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => StorageConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final creationTime = this.creationTime;
    final engineType = this.engineType;
    final engineVersion = this.engineVersion;
    final environmentArn = this.environmentArn;
    final environmentId = this.environmentId;
    final instanceType = this.instanceType;
    final name = this.name;
    final securityGroupIds = this.securityGroupIds;
    final status = this.status;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    final actualCapacity = this.actualCapacity;
    final description = this.description;
    final highAvailabilityConfig = this.highAvailabilityConfig;
    final kmsKeyId = this.kmsKeyId;
    final loadBalancerArn = this.loadBalancerArn;
    final pendingMaintenance = this.pendingMaintenance;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final publiclyAccessible = this.publiclyAccessible;
    final statusReason = this.statusReason;
    final storageConfigurations = this.storageConfigurations;
    final tags = this.tags;
    return {
      'creationTime': unixTimestampToJson(creationTime),
      'engineType': engineType.toValue(),
      'engineVersion': engineVersion,
      'environmentArn': environmentArn,
      'environmentId': environmentId,
      'instanceType': instanceType,
      'name': name,
      'securityGroupIds': securityGroupIds,
      'status': status.toValue(),
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (actualCapacity != null) 'actualCapacity': actualCapacity,
      if (description != null) 'description': description,
      if (highAvailabilityConfig != null)
        'highAvailabilityConfig': highAvailabilityConfig,
      if (kmsKeyId != null) 'kmsKeyId': kmsKeyId,
      if (loadBalancerArn != null) 'loadBalancerArn': loadBalancerArn,
      if (pendingMaintenance != null) 'pendingMaintenance': pendingMaintenance,
      if (preferredMaintenanceWindow != null)
        'preferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'publiclyAccessible': publiclyAccessible,
      if (statusReason != null) 'statusReason': statusReason,
      if (storageConfigurations != null)
        'storageConfigurations': storageConfigurations,
      if (tags != null) 'tags': tags,
    };
  }
}

class GetSignedBluinsightsUrlResponse {
  /// Single sign-on AWS Blu Insights URL.
  final String signedBiUrl;

  GetSignedBluinsightsUrlResponse({
    required this.signedBiUrl,
  });

  factory GetSignedBluinsightsUrlResponse.fromJson(Map<String, dynamic> json) {
    return GetSignedBluinsightsUrlResponse(
      signedBiUrl: json['signedBiUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final signedBiUrl = this.signedBiUrl;
    return {
      'signedBiUrl': signedBiUrl,
    };
  }
}

/// Defines the details of a high availability configuration.
class HighAvailabilityConfig {
  /// The number of instances in a high availability configuration. The minimum
  /// possible value is 1 and the maximum is 100.
  final int desiredCapacity;

  HighAvailabilityConfig({
    required this.desiredCapacity,
  });

  factory HighAvailabilityConfig.fromJson(Map<String, dynamic> json) {
    return HighAvailabilityConfig(
      desiredCapacity: json['desiredCapacity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final desiredCapacity = this.desiredCapacity;
    return {
      'desiredCapacity': desiredCapacity,
    };
  }
}

/// Identifies a specific batch job.
class JobIdentifier {
  /// The name of the file that contains the batch job definition.
  final String? fileName;

  /// The name of the script that contains the batch job definition.
  final String? scriptName;

  JobIdentifier({
    this.fileName,
    this.scriptName,
  });

  factory JobIdentifier.fromJson(Map<String, dynamic> json) {
    return JobIdentifier(
      fileName: json['fileName'] as String?,
      scriptName: json['scriptName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fileName = this.fileName;
    final scriptName = this.scriptName;
    return {
      if (fileName != null) 'fileName': fileName,
      if (scriptName != null) 'scriptName': scriptName,
    };
  }
}

/// Provides information related to a job step.
class JobStep {
  /// The name of a procedure step.
  final String? procStepName;

  /// The number of a procedure step.
  final int? procStepNumber;

  /// The condition code of a step.
  final String? stepCondCode;

  /// The name of a step.
  final String? stepName;

  /// The number of a step.
  final int? stepNumber;

  /// Specifies if a step can be restarted or not.
  final bool? stepRestartable;

  JobStep({
    this.procStepName,
    this.procStepNumber,
    this.stepCondCode,
    this.stepName,
    this.stepNumber,
    this.stepRestartable,
  });

  factory JobStep.fromJson(Map<String, dynamic> json) {
    return JobStep(
      procStepName: json['procStepName'] as String?,
      procStepNumber: json['procStepNumber'] as int?,
      stepCondCode: json['stepCondCode'] as String?,
      stepName: json['stepName'] as String?,
      stepNumber: json['stepNumber'] as int?,
      stepRestartable: json['stepRestartable'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final procStepName = this.procStepName;
    final procStepNumber = this.procStepNumber;
    final stepCondCode = this.stepCondCode;
    final stepName = this.stepName;
    final stepNumber = this.stepNumber;
    final stepRestartable = this.stepRestartable;
    return {
      if (procStepName != null) 'procStepName': procStepName,
      if (procStepNumber != null) 'procStepNumber': procStepNumber,
      if (stepCondCode != null) 'stepCondCode': stepCondCode,
      if (stepName != null) 'stepName': stepName,
      if (stepNumber != null) 'stepNumber': stepNumber,
      if (stepRestartable != null) 'stepRestartable': stepRestartable,
    };
  }
}

/// Provides restart step information for the most recent restart operation.
class JobStepRestartMarker {
  /// The step name that a batch job restart was from.
  final String fromStep;

  /// The procedure step name that a job was restarted from.
  final String? fromProcStep;

  /// The procedure step name that a batch job was restarted to.
  final String? toProcStep;

  /// The step name that a job was restarted to.
  final String? toStep;

  JobStepRestartMarker({
    required this.fromStep,
    this.fromProcStep,
    this.toProcStep,
    this.toStep,
  });

  factory JobStepRestartMarker.fromJson(Map<String, dynamic> json) {
    return JobStepRestartMarker(
      fromStep: json['fromStep'] as String,
      fromProcStep: json['fromProcStep'] as String?,
      toProcStep: json['toProcStep'] as String?,
      toStep: json['toStep'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fromStep = this.fromStep;
    final fromProcStep = this.fromProcStep;
    final toProcStep = this.toProcStep;
    final toStep = this.toStep;
    return {
      'fromStep': fromStep,
      if (fromProcStep != null) 'fromProcStep': fromProcStep,
      if (toProcStep != null) 'toProcStep': toProcStep,
      if (toStep != null) 'toStep': toStep,
    };
  }
}

class ListApplicationVersionsResponse {
  /// The list of application versions.
  final List<ApplicationVersionSummary> applicationVersions;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to this operation to retrieve the next set of items.
  final String? nextToken;

  ListApplicationVersionsResponse({
    required this.applicationVersions,
    this.nextToken,
  });

  factory ListApplicationVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationVersionsResponse(
      applicationVersions: (json['applicationVersions'] as List)
          .whereNotNull()
          .map((e) =>
              ApplicationVersionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersions = this.applicationVersions;
    final nextToken = this.nextToken;
    return {
      'applicationVersions': applicationVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListApplicationsResponse {
  /// Returns a list of summary details for all the applications in a runtime
  /// environment.
  final List<ApplicationSummary> applications;

  /// A pagination token that's returned when the response doesn't contain all
  /// applications.
  final String? nextToken;

  ListApplicationsResponse({
    required this.applications,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      applications: (json['applications'] as List)
          .whereNotNull()
          .map((e) => ApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final nextToken = this.nextToken;
    return {
      'applications': applications,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBatchJobDefinitionsResponse {
  /// The list of batch job definitions.
  final List<BatchJobDefinition> batchJobDefinitions;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to this operation to retrieve the next set of items.
  final String? nextToken;

  ListBatchJobDefinitionsResponse({
    required this.batchJobDefinitions,
    this.nextToken,
  });

  factory ListBatchJobDefinitionsResponse.fromJson(Map<String, dynamic> json) {
    return ListBatchJobDefinitionsResponse(
      batchJobDefinitions: (json['batchJobDefinitions'] as List)
          .whereNotNull()
          .map((e) => BatchJobDefinition.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchJobDefinitions = this.batchJobDefinitions;
    final nextToken = this.nextToken;
    return {
      'batchJobDefinitions': batchJobDefinitions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBatchJobExecutionsResponse {
  /// Returns a list of batch job executions for an application.
  final List<BatchJobExecutionSummary> batchJobExecutions;

  /// A pagination token that's returned when the response doesn't contain all
  /// batch job executions.
  final String? nextToken;

  ListBatchJobExecutionsResponse({
    required this.batchJobExecutions,
    this.nextToken,
  });

  factory ListBatchJobExecutionsResponse.fromJson(Map<String, dynamic> json) {
    return ListBatchJobExecutionsResponse(
      batchJobExecutions: (json['batchJobExecutions'] as List)
          .whereNotNull()
          .map((e) =>
              BatchJobExecutionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final batchJobExecutions = this.batchJobExecutions;
    final nextToken = this.nextToken;
    return {
      'batchJobExecutions': batchJobExecutions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBatchJobRestartPointsResponse {
  /// Returns all the batch job steps and related information for a batch job that
  /// previously ran.
  final List<JobStep>? batchJobSteps;

  ListBatchJobRestartPointsResponse({
    this.batchJobSteps,
  });

  factory ListBatchJobRestartPointsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListBatchJobRestartPointsResponse(
      batchJobSteps: (json['batchJobSteps'] as List?)
          ?.whereNotNull()
          .map((e) => JobStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final batchJobSteps = this.batchJobSteps;
    return {
      if (batchJobSteps != null) 'batchJobSteps': batchJobSteps,
    };
  }
}

class ListDataSetImportHistoryResponse {
  /// The data set import tasks.
  final List<DataSetImportTask> dataSetImportTasks;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to this operation to retrieve the next set of items.
  final String? nextToken;

  ListDataSetImportHistoryResponse({
    required this.dataSetImportTasks,
    this.nextToken,
  });

  factory ListDataSetImportHistoryResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSetImportHistoryResponse(
      dataSetImportTasks: (json['dataSetImportTasks'] as List)
          .whereNotNull()
          .map((e) => DataSetImportTask.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSetImportTasks = this.dataSetImportTasks;
    final nextToken = this.nextToken;
    return {
      'dataSetImportTasks': dataSetImportTasks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDataSetsResponse {
  /// The list of data sets, containing information including the creation time,
  /// the data set name, the data set organization, the data set format, and the
  /// last time the data set was referenced or updated.
  final List<DataSetSummary> dataSets;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to this operation to retrieve the next set of items.
  final String? nextToken;

  ListDataSetsResponse({
    required this.dataSets,
    this.nextToken,
  });

  factory ListDataSetsResponse.fromJson(Map<String, dynamic> json) {
    return ListDataSetsResponse(
      dataSets: (json['dataSets'] as List)
          .whereNotNull()
          .map((e) => DataSetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataSets = this.dataSets;
    final nextToken = this.nextToken;
    return {
      'dataSets': dataSets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListDeploymentsResponse {
  /// The list of deployments that is returned.
  final List<DeploymentSummary> deployments;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to this operation to retrieve the next set of items.
  final String? nextToken;

  ListDeploymentsResponse({
    required this.deployments,
    this.nextToken,
  });

  factory ListDeploymentsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeploymentsResponse(
      deployments: (json['deployments'] as List)
          .whereNotNull()
          .map((e) => DeploymentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deployments = this.deployments;
    final nextToken = this.nextToken;
    return {
      'deployments': deployments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEngineVersionsResponse {
  /// Returns the engine versions.
  final List<EngineVersionsSummary> engineVersions;

  /// If there are more items to return, this contains a token that is passed to a
  /// subsequent call to this operation to retrieve the next set of items.
  final String? nextToken;

  ListEngineVersionsResponse({
    required this.engineVersions,
    this.nextToken,
  });

  factory ListEngineVersionsResponse.fromJson(Map<String, dynamic> json) {
    return ListEngineVersionsResponse(
      engineVersions: (json['engineVersions'] as List)
          .whereNotNull()
          .map((e) => EngineVersionsSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final engineVersions = this.engineVersions;
    final nextToken = this.nextToken;
    return {
      'engineVersions': engineVersions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListEnvironmentsResponse {
  /// Returns a list of summary details for all the runtime environments in your
  /// account.
  final List<EnvironmentSummary> environments;

  /// A pagination token that's returned when the response doesn't contain all the
  /// runtime environments.
  final String? nextToken;

  ListEnvironmentsResponse({
    required this.environments,
    this.nextToken,
  });

  factory ListEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListEnvironmentsResponse(
      environments: (json['environments'] as List)
          .whereNotNull()
          .map((e) => EnvironmentSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final environments = this.environments;
    final nextToken = this.nextToken;
    return {
      'environments': environments,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    required this.tags,
  });

  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) {
    return ListTagsForResourceResponse(
      tags: (json['tags'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final tags = this.tags;
    return {
      'tags': tags,
    };
  }
}

/// A subset of the attributes that describe a log group. In CloudWatch a log
/// group is a group of log streams that share the same retention, monitoring,
/// and access control settings.
class LogGroupSummary {
  /// The name of the log group.
  final String logGroupName;

  /// The type of log.
  final String logType;

  LogGroupSummary({
    required this.logGroupName,
    required this.logType,
  });

  factory LogGroupSummary.fromJson(Map<String, dynamic> json) {
    return LogGroupSummary(
      logGroupName: json['logGroupName'] as String,
      logType: json['logType'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final logGroupName = this.logGroupName;
    final logType = this.logType;
    return {
      'logGroupName': logGroupName,
      'logType': logType,
    };
  }
}

/// The information about the maintenance schedule.
class MaintenanceSchedule {
  /// The time the scheduled maintenance is to end.
  final DateTime? endTime;

  /// The time the scheduled maintenance is to start.
  final DateTime? startTime;

  MaintenanceSchedule({
    this.endTime,
    this.startTime,
  });

  factory MaintenanceSchedule.fromJson(Map<String, dynamic> json) {
    return MaintenanceSchedule(
      endTime: timeStampFromJson(json['endTime']),
      startTime: timeStampFromJson(json['startTime']),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      if (endTime != null) 'endTime': unixTimestampToJson(endTime),
      if (startTime != null) 'startTime': unixTimestampToJson(startTime),
    };
  }
}

/// The scheduled maintenance for a runtime engine.
class PendingMaintenance {
  /// The specific runtime engine that the maintenance schedule applies to.
  final String? engineVersion;

  /// The maintenance schedule for the runtime engine version.
  final MaintenanceSchedule? schedule;

  PendingMaintenance({
    this.engineVersion,
    this.schedule,
  });

  factory PendingMaintenance.fromJson(Map<String, dynamic> json) {
    return PendingMaintenance(
      engineVersion: json['engineVersion'] as String?,
      schedule: json['schedule'] != null
          ? MaintenanceSchedule.fromJson(
              json['schedule'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final engineVersion = this.engineVersion;
    final schedule = this.schedule;
    return {
      if (engineVersion != null) 'engineVersion': engineVersion,
      if (schedule != null) 'schedule': schedule,
    };
  }
}

/// The supported properties for a PO type data set.
class PoAttributes {
  /// The format of the data set records.
  final String format;

  /// An array containing one or more filename extensions, allowing you to specify
  /// which files to be included as PDS member.
  final List<String> memberFileExtensions;

  /// The character set encoding of the data set.
  final String? encoding;

  PoAttributes({
    required this.format,
    required this.memberFileExtensions,
    this.encoding,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    final memberFileExtensions = this.memberFileExtensions;
    final encoding = this.encoding;
    return {
      'format': format,
      'memberFileExtensions': memberFileExtensions,
      if (encoding != null) 'encoding': encoding,
    };
  }
}

/// The supported properties for a PO type data set.
class PoDetailAttributes {
  /// The character set encoding of the data set.
  final String encoding;

  /// The format of the data set records.
  final String format;

  PoDetailAttributes({
    required this.encoding,
    required this.format,
  });

  factory PoDetailAttributes.fromJson(Map<String, dynamic> json) {
    return PoDetailAttributes(
      encoding: json['encoding'] as String,
      format: json['format'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final encoding = this.encoding;
    final format = this.format;
    return {
      'encoding': encoding,
      'format': format,
    };
  }
}

/// The primary key for a KSDS data set.
class PrimaryKey {
  /// A strictly positive integer value representing the length of the primary
  /// key.
  final int length;

  /// A positive integer value representing the offset to mark the start of the
  /// primary key in the record byte array.
  final int offset;

  /// A name for the Primary Key.
  final String? name;

  PrimaryKey({
    required this.length,
    required this.offset,
    this.name,
  });

  factory PrimaryKey.fromJson(Map<String, dynamic> json) {
    return PrimaryKey(
      length: json['length'] as int,
      offset: json['offset'] as int,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final length = this.length;
    final offset = this.offset;
    final name = this.name;
    return {
      'length': length,
      'offset': offset,
      if (name != null) 'name': name,
    };
  }
}

/// The supported properties for a PS type data set.
class PsAttributes {
  /// The format of the data set records.
  final String format;

  /// The character set encoding of the data set.
  final String? encoding;

  PsAttributes({
    required this.format,
    this.encoding,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    final encoding = this.encoding;
    return {
      'format': format,
      if (encoding != null) 'encoding': encoding,
    };
  }
}

/// The supported properties for a PS type data set.
class PsDetailAttributes {
  /// The character set encoding of the data set.
  final String encoding;

  /// The format of the data set records.
  final String format;

  PsDetailAttributes({
    required this.encoding,
    required this.format,
  });

  factory PsDetailAttributes.fromJson(Map<String, dynamic> json) {
    return PsDetailAttributes(
      encoding: json['encoding'] as String,
      format: json['format'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final encoding = this.encoding;
    final format = this.format;
    return {
      'encoding': encoding,
      'format': format,
    };
  }
}

/// The length of the records in the data set.
class RecordLength {
  /// The maximum record length. In case of fixed, both minimum and maximum are
  /// the same.
  final int max;

  /// The minimum record length of a record.
  final int min;

  RecordLength({
    required this.max,
    required this.min,
  });

  Map<String, dynamic> toJson() {
    final max = this.max;
    final min = this.min;
    return {
      'max': max,
      'min': min,
    };
  }
}

/// An identifier for the StartBatchJob API to show that it is a restart
/// operation.
class RestartBatchJobIdentifier {
  /// The executionId from the StartBatchJob response when the job ran for the
  /// first time.
  final String executionId;

  /// The restart step information for the most recent restart operation.
  final JobStepRestartMarker jobStepRestartMarker;

  RestartBatchJobIdentifier({
    required this.executionId,
    required this.jobStepRestartMarker,
  });

  factory RestartBatchJobIdentifier.fromJson(Map<String, dynamic> json) {
    return RestartBatchJobIdentifier(
      executionId: json['executionId'] as String,
      jobStepRestartMarker: JobStepRestartMarker.fromJson(
          json['jobStepRestartMarker'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    final jobStepRestartMarker = this.jobStepRestartMarker;
    return {
      'executionId': executionId,
      'jobStepRestartMarker': jobStepRestartMarker,
    };
  }
}

/// A batch job identifier in which the batch jobs to run are identified by an
/// Amazon S3 location.
class S3BatchJobIdentifier {
  /// The Amazon S3 bucket that contains the batch job definitions.
  final String bucket;

  /// Identifies the batch job definition. This identifier can also point to any
  /// batch job definition that already exists in the application or to one of the
  /// batch job definitions within the directory that is specified in
  /// <code>keyPrefix</code>.
  final JobIdentifier identifier;

  /// The key prefix that specifies the path to the folder in the S3 bucket that
  /// has the batch job definitions.
  final String? keyPrefix;

  S3BatchJobIdentifier({
    required this.bucket,
    required this.identifier,
    this.keyPrefix,
  });

  factory S3BatchJobIdentifier.fromJson(Map<String, dynamic> json) {
    return S3BatchJobIdentifier(
      bucket: json['bucket'] as String,
      identifier:
          JobIdentifier.fromJson(json['identifier'] as Map<String, dynamic>),
      keyPrefix: json['keyPrefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final identifier = this.identifier;
    final keyPrefix = this.keyPrefix;
    return {
      'bucket': bucket,
      'identifier': identifier,
      if (keyPrefix != null) 'keyPrefix': keyPrefix,
    };
  }
}

/// A batch job definition contained in a script.
class ScriptBatchJobDefinition {
  /// The name of the script containing the batch job definition.
  final String scriptName;

  ScriptBatchJobDefinition({
    required this.scriptName,
  });

  factory ScriptBatchJobDefinition.fromJson(Map<String, dynamic> json) {
    return ScriptBatchJobDefinition(
      scriptName: json['scriptName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scriptName = this.scriptName;
    return {
      'scriptName': scriptName,
    };
  }
}

/// A batch job identifier in which the batch job to run is identified by the
/// script name.
class ScriptBatchJobIdentifier {
  /// The name of the script containing the batch job definition.
  final String scriptName;

  ScriptBatchJobIdentifier({
    required this.scriptName,
  });

  factory ScriptBatchJobIdentifier.fromJson(Map<String, dynamic> json) {
    return ScriptBatchJobIdentifier(
      scriptName: json['scriptName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final scriptName = this.scriptName;
    return {
      'scriptName': scriptName,
    };
  }
}

class StartApplicationResponse {
  StartApplicationResponse();

  factory StartApplicationResponse.fromJson(Map<String, dynamic> _) {
    return StartApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class StartBatchJobResponse {
  /// The unique identifier of this execution of the batch job.
  final String executionId;

  StartBatchJobResponse({
    required this.executionId,
  });

  factory StartBatchJobResponse.fromJson(Map<String, dynamic> json) {
    return StartBatchJobResponse(
      executionId: json['executionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final executionId = this.executionId;
    return {
      'executionId': executionId,
    };
  }
}

class StopApplicationResponse {
  StopApplicationResponse();

  factory StopApplicationResponse.fromJson(Map<String, dynamic> _) {
    return StopApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Defines the storage configuration for a runtime environment.
class StorageConfiguration {
  /// Defines the storage configuration for an Amazon EFS file system.
  final EfsStorageConfiguration? efs;

  /// Defines the storage configuration for an Amazon FSx file system.
  final FsxStorageConfiguration? fsx;

  StorageConfiguration({
    this.efs,
    this.fsx,
  });

  factory StorageConfiguration.fromJson(Map<String, dynamic> json) {
    return StorageConfiguration(
      efs: json['efs'] != null
          ? EfsStorageConfiguration.fromJson(
              json['efs'] as Map<String, dynamic>)
          : null,
      fsx: json['fsx'] != null
          ? FsxStorageConfiguration.fromJson(
              json['fsx'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final efs = this.efs;
    final fsx = this.fsx;
    return {
      if (efs != null) 'efs': efs,
      if (fsx != null) 'fsx': fsx,
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

class UpdateApplicationResponse {
  /// The new version of the application.
  final int applicationVersion;

  UpdateApplicationResponse({
    required this.applicationVersion,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      applicationVersion: json['applicationVersion'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationVersion = this.applicationVersion;
    return {
      'applicationVersion': applicationVersion,
    };
  }
}

class UpdateEnvironmentResponse {
  /// The unique identifier of the runtime environment that was updated.
  final String environmentId;

  UpdateEnvironmentResponse({
    required this.environmentId,
  });

  factory UpdateEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return UpdateEnvironmentResponse(
      environmentId: json['environmentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    return {
      'environmentId': environmentId,
    };
  }
}

/// The attributes of a VSAM type data set.
class VsamAttributes {
  /// The record format of the data set.
  final String format;

  /// The alternate key definitions, if any. A legacy dataset might not have any
  /// alternate key defined, but if those alternate keys definitions exist,
  /// provide them as some applications will make use of them.
  final List<AlternateKey>? alternateKeys;

  /// Indicates whether indexes for this dataset are stored as compressed values.
  /// If you have a large data set (typically &gt; 100 Mb), consider setting this
  /// flag to True.
  final bool? compressed;

  /// The character set used by the data set. Can be ASCII, EBCDIC, or unknown.
  final String? encoding;

  /// The primary key of the data set.
  final PrimaryKey? primaryKey;

  VsamAttributes({
    required this.format,
    this.alternateKeys,
    this.compressed,
    this.encoding,
    this.primaryKey,
  });

  Map<String, dynamic> toJson() {
    final format = this.format;
    final alternateKeys = this.alternateKeys;
    final compressed = this.compressed;
    final encoding = this.encoding;
    final primaryKey = this.primaryKey;
    return {
      'format': format,
      if (alternateKeys != null) 'alternateKeys': alternateKeys,
      if (compressed != null) 'compressed': compressed,
      if (encoding != null) 'encoding': encoding,
      if (primaryKey != null) 'primaryKey': primaryKey,
    };
  }
}

/// The attributes of a VSAM type data set.
class VsamDetailAttributes {
  /// The alternate key definitions, if any. A legacy dataset might not have any
  /// alternate key defined, but if those alternate keys definitions exist,
  /// provide them as some applications will make use of them.
  final List<AlternateKey>? alternateKeys;

  /// If set to True, enforces loading the data set into cache before it’s used by
  /// the application.
  final bool? cacheAtStartup;

  /// Indicates whether indexes for this dataset are stored as compressed values.
  /// If you have a large data set (typically &gt; 100 Mb), consider setting this
  /// flag to True.
  final bool? compressed;

  /// The character set used by the data set. Can be ASCII, EBCDIC, or unknown.
  final String? encoding;

  /// The primary key of the data set.
  final PrimaryKey? primaryKey;

  /// The record format of the data set.
  final String? recordFormat;

  VsamDetailAttributes({
    this.alternateKeys,
    this.cacheAtStartup,
    this.compressed,
    this.encoding,
    this.primaryKey,
    this.recordFormat,
  });

  factory VsamDetailAttributes.fromJson(Map<String, dynamic> json) {
    return VsamDetailAttributes(
      alternateKeys: (json['alternateKeys'] as List?)
          ?.whereNotNull()
          .map((e) => AlternateKey.fromJson(e as Map<String, dynamic>))
          .toList(),
      cacheAtStartup: json['cacheAtStartup'] as bool?,
      compressed: json['compressed'] as bool?,
      encoding: json['encoding'] as String?,
      primaryKey: json['primaryKey'] != null
          ? PrimaryKey.fromJson(json['primaryKey'] as Map<String, dynamic>)
          : null,
      recordFormat: json['recordFormat'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final alternateKeys = this.alternateKeys;
    final cacheAtStartup = this.cacheAtStartup;
    final compressed = this.compressed;
    final encoding = this.encoding;
    final primaryKey = this.primaryKey;
    final recordFormat = this.recordFormat;
    return {
      if (alternateKeys != null) 'alternateKeys': alternateKeys,
      if (cacheAtStartup != null) 'cacheAtStartup': cacheAtStartup,
      if (compressed != null) 'compressed': compressed,
      if (encoding != null) 'encoding': encoding,
      if (primaryKey != null) 'primaryKey': primaryKey,
      if (recordFormat != null) 'recordFormat': recordFormat,
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

class ExecutionTimeoutException extends _s.GenericAwsException {
  ExecutionTimeoutException({String? type, String? message})
      : super(type: type, code: 'ExecutionTimeoutException', message: message);
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

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String? type, String? message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
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
  'ExecutionTimeoutException': (type, message) =>
      ExecutionTimeoutException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
