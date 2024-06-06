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

/// Amazon EMR Serverless is a new deployment option for Amazon EMR. Amazon EMR
/// Serverless provides a serverless runtime environment that simplifies running
/// analytics applications using the latest open source frameworks such as
/// Apache Spark and Apache Hive. With Amazon EMR Serverless, you don’t have to
/// configure, optimize, secure, or operate clusters to run applications with
/// these frameworks.
///
/// The API reference to Amazon EMR Serverless is <code>emr-serverless</code>.
/// The <code>emr-serverless</code> prefix is used in the following scenarios:
///
/// <ul>
/// <li>
/// It is the prefix in the CLI commands for Amazon EMR Serverless. For example,
/// <code>aws emr-serverless start-job-run</code>.
/// </li>
/// <li>
/// It is the prefix before IAM policy actions for Amazon EMR Serverless. For
/// example, <code>"Action": ["emr-serverless:StartJobRun"]</code>. For more
/// information, see <a
/// href="https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/security_iam_service-with-iam.html#security_iam_service-with-iam-id-based-policies-actions">Policy
/// actions for Amazon EMR Serverless</a>.
/// </li>
/// <li>
/// It is the prefix used in Amazon EMR Serverless service endpoints. For
/// example, <code>emr-serverless.us-east-2.amazonaws.com</code>.
/// </li>
/// </ul>
class EmrServerless {
  final _s.RestJsonProtocol _protocol;
  EmrServerless({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'emr-serverless',
            signingName: 'emr-serverless',
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

  /// Cancels a job run.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application on which the job run will be canceled.
  ///
  /// Parameter [jobRunId] :
  /// The ID of the job run to cancel.
  Future<CancelJobRunResponse> cancelJobRun({
    required String applicationId,
    required String jobRunId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/jobruns/${Uri.encodeComponent(jobRunId)}',
      exceptionFnMap: _exceptionFns,
    );
    return CancelJobRunResponse.fromJson(response);
  }

  /// Creates an application.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release associated with the application.
  ///
  /// Parameter [type] :
  /// The type of application you want to start, such as Spark or Hive.
  ///
  /// Parameter [architecture] :
  /// The CPU architecture of an application.
  ///
  /// Parameter [autoStartConfiguration] :
  /// The configuration for an application to automatically start on job
  /// submission.
  ///
  /// Parameter [autoStopConfiguration] :
  /// The configuration for an application to automatically stop after a certain
  /// amount of time being idle.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token of the application to create. Its value must
  /// be unique for each request.
  ///
  /// Parameter [imageConfiguration] :
  /// The image configuration for all worker types. You can either set this
  /// parameter or <code>imageConfiguration</code> for each worker type in
  /// <code>workerTypeSpecifications</code>.
  ///
  /// Parameter [initialCapacity] :
  /// The capacity to initialize when the application is created.
  ///
  /// Parameter [interactiveConfiguration] :
  /// The interactive configuration object that enables the interactive use
  /// cases to use when running an application.
  ///
  /// Parameter [maximumCapacity] :
  /// The maximum capacity to allocate when the application is created. This is
  /// cumulative across all workers at any given point in time, not just when an
  /// application is created. No new resources will be created once any one of
  /// the defined limits is hit.
  ///
  /// Parameter [monitoringConfiguration] :
  /// The configuration setting for monitoring.
  ///
  /// Parameter [name] :
  /// The name of the application.
  ///
  /// Parameter [networkConfiguration] :
  /// The network configuration for customer VPC connectivity.
  ///
  /// Parameter [runtimeConfiguration] :
  /// The <a
  /// href="https://docs.aws.amazon.com/emr-serverless/latest/APIReference/API_Configuration.html">Configuration</a>
  /// specifications to use when creating an application. Each configuration
  /// consists of a classification and properties. This configuration is applied
  /// to all the job runs submitted under the application.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the application.
  ///
  /// Parameter [workerTypeSpecifications] :
  /// The key-value pairs that specify worker type to
  /// <code>WorkerTypeSpecificationInput</code>. This parameter must contain all
  /// valid worker types for a Spark or Hive application. Valid worker types
  /// include <code>Driver</code> and <code>Executor</code> for Spark
  /// applications and <code>HiveDriver</code> and <code>TezTask</code> for Hive
  /// applications. You can either set image details in this parameter for each
  /// worker type, or in <code>imageConfiguration</code> for all worker types.
  Future<CreateApplicationResponse> createApplication({
    required String releaseLabel,
    required String type,
    Architecture? architecture,
    AutoStartConfig? autoStartConfiguration,
    AutoStopConfig? autoStopConfiguration,
    String? clientToken,
    ImageConfigurationInput? imageConfiguration,
    Map<String, InitialCapacityConfig>? initialCapacity,
    InteractiveConfiguration? interactiveConfiguration,
    MaximumAllowedResources? maximumCapacity,
    MonitoringConfiguration? monitoringConfiguration,
    String? name,
    NetworkConfiguration? networkConfiguration,
    List<Configuration>? runtimeConfiguration,
    Map<String, String>? tags,
    Map<String, WorkerTypeSpecificationInput>? workerTypeSpecifications,
  }) async {
    final $payload = <String, dynamic>{
      'releaseLabel': releaseLabel,
      'type': type,
      if (architecture != null) 'architecture': architecture.toValue(),
      if (autoStartConfiguration != null)
        'autoStartConfiguration': autoStartConfiguration,
      if (autoStopConfiguration != null)
        'autoStopConfiguration': autoStopConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (imageConfiguration != null) 'imageConfiguration': imageConfiguration,
      if (initialCapacity != null) 'initialCapacity': initialCapacity,
      if (interactiveConfiguration != null)
        'interactiveConfiguration': interactiveConfiguration,
      if (maximumCapacity != null) 'maximumCapacity': maximumCapacity,
      if (monitoringConfiguration != null)
        'monitoringConfiguration': monitoringConfiguration,
      if (name != null) 'name': name,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (runtimeConfiguration != null)
        'runtimeConfiguration': runtimeConfiguration,
      if (tags != null) 'tags': tags,
      if (workerTypeSpecifications != null)
        'workerTypeSpecifications': workerTypeSpecifications,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications',
      exceptionFnMap: _exceptionFns,
    );
    return CreateApplicationResponse.fromJson(response);
  }

  /// Deletes an application. An application has to be in a stopped or created
  /// state in order to be deleted.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application that will be deleted.
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

  /// Displays detailed information about a specified application.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application that will be described.
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

  /// Creates and returns a URL that you can use to access the application UIs
  /// for a job run.
  ///
  /// For jobs in a running state, the application UI is a live user interface
  /// such as the Spark or Tez web UI. For completed jobs, the application UI is
  /// a persistent application user interface such as the Spark History Server
  /// or persistent Tez UI.
  /// <note>
  /// The URL is valid for one hour after you generate it. To access the
  /// application UI after that hour elapses, you must invoke the API again to
  /// generate a new URL.
  /// </note>
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application.
  ///
  /// Parameter [jobRunId] :
  /// The ID of the job run.
  ///
  /// Parameter [attempt] :
  /// An optimal parameter that indicates the amount of attempts for the job. If
  /// not specified, this value defaults to the attempt of the latest job.
  Future<GetDashboardForJobRunResponse> getDashboardForJobRun({
    required String applicationId,
    required String jobRunId,
    int? attempt,
  }) async {
    _s.validateNumRange(
      'attempt',
      attempt,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (attempt != null) 'attempt': [attempt.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/jobruns/${Uri.encodeComponent(jobRunId)}/dashboard',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetDashboardForJobRunResponse.fromJson(response);
  }

  /// Displays detailed information about a job run.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application on which the job run is submitted.
  ///
  /// Parameter [jobRunId] :
  /// The ID of the job run.
  ///
  /// Parameter [attempt] :
  /// An optimal parameter that indicates the amount of attempts for the job. If
  /// not specified, this value defaults to the attempt of the latest job.
  Future<GetJobRunResponse> getJobRun({
    required String applicationId,
    required String jobRunId,
    int? attempt,
  }) async {
    _s.validateNumRange(
      'attempt',
      attempt,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (attempt != null) 'attempt': [attempt.toString()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/jobruns/${Uri.encodeComponent(jobRunId)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetJobRunResponse.fromJson(response);
  }

  /// Lists applications based on a set of parameters.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of applications that can be listed.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of application results.
  ///
  /// Parameter [states] :
  /// An optional filter for application states. Note that if this filter
  /// contains multiple states, the resulting list will be grouped by the state.
  Future<ListApplicationsResponse> listApplications({
    int? maxResults,
    String? nextToken,
    List<ApplicationState>? states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
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

  /// Lists all attempt of a job run.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application for which to list job runs.
  ///
  /// Parameter [jobRunId] :
  /// The ID of the job run to list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of job run attempts to list.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of job run attempt results.
  Future<ListJobRunAttemptsResponse> listJobRunAttempts({
    required String applicationId,
    required String jobRunId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/applications/${Uri.encodeComponent(applicationId)}/jobruns/${Uri.encodeComponent(jobRunId)}/attempts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobRunAttemptsResponse.fromJson(response);
  }

  /// Lists job runs based on a set of parameters.
  ///
  /// May throw [ValidationException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application for which to list the job run.
  ///
  /// Parameter [createdAtAfter] :
  /// The lower bound of the option to filter by creation date and time.
  ///
  /// Parameter [createdAtBefore] :
  /// The upper bound of the option to filter by creation date and time.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of job runs that can be listed.
  ///
  /// Parameter [mode] :
  /// The mode of the job runs to list.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of job run results.
  ///
  /// Parameter [states] :
  /// An optional filter for job run states. Note that if this filter contains
  /// multiple states, the resulting list will be grouped by the state.
  Future<ListJobRunsResponse> listJobRuns({
    required String applicationId,
    DateTime? createdAtAfter,
    DateTime? createdAtBefore,
    int? maxResults,
    JobRunMode? mode,
    String? nextToken,
    List<JobRunState>? states,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      50,
    );
    final $query = <String, List<String>>{
      if (createdAtAfter != null)
        'createdAtAfter': [_s.iso8601ToJson(createdAtAfter).toString()],
      if (createdAtBefore != null)
        'createdAtBefore': [_s.iso8601ToJson(createdAtBefore).toString()],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (mode != null) 'mode': [mode.toValue()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (states != null) 'states': states.map((e) => e.toValue()).toList(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/jobruns',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobRunsResponse.fromJson(response);
  }

  /// Lists the tags assigned to the resources.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags for. Currently, the supported resources are Amazon EMR Serverless
  /// applications and job runs.
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

  /// Starts a specified application and initializes initial capacity if
  /// configured.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application to start.
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

  /// Starts a job run.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application on which to run the job.
  ///
  /// Parameter [executionRoleArn] :
  /// The execution role ARN for the job run.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token of the job run to start. Its value must be
  /// unique for each request.
  ///
  /// Parameter [configurationOverrides] :
  /// The configuration overrides for the job run.
  ///
  /// Parameter [executionTimeoutMinutes] :
  /// The maximum duration for the job run to run. If the job run runs beyond
  /// this duration, it will be automatically cancelled.
  ///
  /// Parameter [jobDriver] :
  /// The job driver for the job run.
  ///
  /// Parameter [mode] :
  /// The mode of the job run when it starts.
  ///
  /// Parameter [name] :
  /// The optional job run name. This doesn't have to be unique.
  ///
  /// Parameter [retryPolicy] :
  /// The retry policy when job run starts.
  ///
  /// Parameter [tags] :
  /// The tags assigned to the job run.
  Future<StartJobRunResponse> startJobRun({
    required String applicationId,
    required String executionRoleArn,
    String? clientToken,
    ConfigurationOverrides? configurationOverrides,
    int? executionTimeoutMinutes,
    JobDriver? jobDriver,
    JobRunMode? mode,
    String? name,
    RetryPolicy? retryPolicy,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'executionTimeoutMinutes',
      executionTimeoutMinutes,
      0,
      1000000,
    );
    final $payload = <String, dynamic>{
      'executionRoleArn': executionRoleArn,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (executionTimeoutMinutes != null)
        'executionTimeoutMinutes': executionTimeoutMinutes,
      if (jobDriver != null) 'jobDriver': jobDriver,
      if (mode != null) 'mode': mode.toValue(),
      if (name != null) 'name': name,
      if (retryPolicy != null) 'retryPolicy': retryPolicy,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/jobruns',
      exceptionFnMap: _exceptionFns,
    );
    return StartJobRunResponse.fromJson(response);
  }

  /// Stops a specified application and releases initial capacity if configured.
  /// All scheduled and running jobs must be completed or cancelled before
  /// stopping an application.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application to stop.
  Future<void> stopApplication({
    required String applicationId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}/stop',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns tags to resources. A tag is a label that you assign to an Amazon
  /// Web Services resource. Each tag consists of a key and an optional value,
  /// both of which you define. Tags enable you to categorize your Amazon Web
  /// Services resources by attributes such as purpose, owner, or environment.
  /// When you have many resources of the same type, you can quickly identify a
  /// specific resource based on the tags you've assigned to it.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags for. Currently, the supported resources are Amazon EMR Serverless
  /// applications and job runs.
  ///
  /// Parameter [tags] :
  /// The tags to add to the resource. A tag is an array of key-value pairs.
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

  /// Removes tags from resources.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) that identifies the resource to list the
  /// tags for. Currently, the supported resources are Amazon EMR Serverless
  /// applications and job runs.
  ///
  /// Parameter [tagKeys] :
  /// The keys of the tags to be removed.
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

  /// Updates a specified application. An application has to be in a stopped or
  /// created state in order to be updated.
  ///
  /// May throw [ValidationException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [applicationId] :
  /// The ID of the application to update.
  ///
  /// Parameter [architecture] :
  /// The CPU architecture of an application.
  ///
  /// Parameter [autoStartConfiguration] :
  /// The configuration for an application to automatically start on job
  /// submission.
  ///
  /// Parameter [autoStopConfiguration] :
  /// The configuration for an application to automatically stop after a certain
  /// amount of time being idle.
  ///
  /// Parameter [clientToken] :
  /// The client idempotency token of the application to update. Its value must
  /// be unique for each request.
  ///
  /// Parameter [imageConfiguration] :
  /// The image configuration to be used for all worker types. You can either
  /// set this parameter or <code>imageConfiguration</code> for each worker type
  /// in <code>WorkerTypeSpecificationInput</code>.
  ///
  /// Parameter [initialCapacity] :
  /// The capacity to initialize when the application is updated.
  ///
  /// Parameter [interactiveConfiguration] :
  /// The interactive configuration object that contains new interactive use
  /// cases when the application is updated.
  ///
  /// Parameter [maximumCapacity] :
  /// The maximum capacity to allocate when the application is updated. This is
  /// cumulative across all workers at any given point in time during the
  /// lifespan of the application. No new resources will be created once any one
  /// of the defined limits is hit.
  ///
  /// Parameter [monitoringConfiguration] :
  /// The configuration setting for monitoring.
  ///
  /// Parameter [releaseLabel] :
  /// The Amazon EMR release label for the application. You can change the
  /// release label to use a different release of Amazon EMR.
  ///
  /// Parameter [runtimeConfiguration] :
  /// The <a
  /// href="https://docs.aws.amazon.com/emr-serverless/latest/APIReference/API_Configuration.html">Configuration</a>
  /// specifications to use when updating an application. Each configuration
  /// consists of a classification and properties. This configuration is applied
  /// across all the job runs submitted under the application.
  ///
  /// Parameter [workerTypeSpecifications] :
  /// The key-value pairs that specify worker type to
  /// <code>WorkerTypeSpecificationInput</code>. This parameter must contain all
  /// valid worker types for a Spark or Hive application. Valid worker types
  /// include <code>Driver</code> and <code>Executor</code> for Spark
  /// applications and <code>HiveDriver</code> and <code>TezTask</code> for Hive
  /// applications. You can either set image details in this parameter for each
  /// worker type, or in <code>imageConfiguration</code> for all worker types.
  Future<UpdateApplicationResponse> updateApplication({
    required String applicationId,
    Architecture? architecture,
    AutoStartConfig? autoStartConfiguration,
    AutoStopConfig? autoStopConfiguration,
    String? clientToken,
    ImageConfigurationInput? imageConfiguration,
    Map<String, InitialCapacityConfig>? initialCapacity,
    InteractiveConfiguration? interactiveConfiguration,
    MaximumAllowedResources? maximumCapacity,
    MonitoringConfiguration? monitoringConfiguration,
    NetworkConfiguration? networkConfiguration,
    String? releaseLabel,
    List<Configuration>? runtimeConfiguration,
    Map<String, WorkerTypeSpecificationInput>? workerTypeSpecifications,
  }) async {
    final $payload = <String, dynamic>{
      if (architecture != null) 'architecture': architecture.toValue(),
      if (autoStartConfiguration != null)
        'autoStartConfiguration': autoStartConfiguration,
      if (autoStopConfiguration != null)
        'autoStopConfiguration': autoStopConfiguration,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
      if (imageConfiguration != null) 'imageConfiguration': imageConfiguration,
      if (initialCapacity != null) 'initialCapacity': initialCapacity,
      if (interactiveConfiguration != null)
        'interactiveConfiguration': interactiveConfiguration,
      if (maximumCapacity != null) 'maximumCapacity': maximumCapacity,
      if (monitoringConfiguration != null)
        'monitoringConfiguration': monitoringConfiguration,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (releaseLabel != null) 'releaseLabel': releaseLabel,
      if (runtimeConfiguration != null)
        'runtimeConfiguration': runtimeConfiguration,
      if (workerTypeSpecifications != null)
        'workerTypeSpecifications': workerTypeSpecifications,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/applications/${Uri.encodeComponent(applicationId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateApplicationResponse.fromJson(response);
  }
}

/// Information about an application. Amazon EMR Serverless uses applications to
/// run jobs.
class Application {
  /// The ID of the application.
  final String applicationId;

  /// The ARN of the application.
  final String arn;

  /// The date and time when the application run was created.
  final DateTime createdAt;

  /// The Amazon EMR release associated with the application.
  final String releaseLabel;

  /// The state of the application.
  final ApplicationState state;

  /// The type of application, such as Spark or Hive.
  final String type;

  /// The date and time when the application run was last updated.
  final DateTime updatedAt;

  /// The CPU architecture of an application.
  final Architecture? architecture;

  /// The configuration for an application to automatically start on job
  /// submission.
  final AutoStartConfig? autoStartConfiguration;

  /// The configuration for an application to automatically stop after a certain
  /// amount of time being idle.
  final AutoStopConfig? autoStopConfiguration;

  /// The image configuration applied to all worker types.
  final ImageConfiguration? imageConfiguration;

  /// The initial capacity of the application.
  final Map<String, InitialCapacityConfig>? initialCapacity;

  /// The interactive configuration object that enables the interactive use cases
  /// for an application.
  final InteractiveConfiguration? interactiveConfiguration;

  /// The maximum capacity of the application. This is cumulative across all
  /// workers at any given point in time during the lifespan of the application is
  /// created. No new resources will be created once any one of the defined limits
  /// is hit.
  final MaximumAllowedResources? maximumCapacity;
  final MonitoringConfiguration? monitoringConfiguration;

  /// The name of the application.
  final String? name;

  /// The network configuration for customer VPC connectivity for the application.
  final NetworkConfiguration? networkConfiguration;

  /// The <a
  /// href="https://docs.aws.amazon.com/emr-serverless/latest/APIReference/API_Configuration.html">Configuration</a>
  /// specifications of an application. Each configuration consists of a
  /// classification and properties. You use this parameter when creating or
  /// updating an application. To see the runtimeConfiguration object of an
  /// application, run the <a
  /// href="https://docs.aws.amazon.com/emr-serverless/latest/APIReference/API_GetApplication.html">GetApplication</a>
  /// API operation.
  final List<Configuration>? runtimeConfiguration;

  /// The state details of the application.
  final String? stateDetails;

  /// The tags assigned to the application.
  final Map<String, String>? tags;

  /// The specification applied to each worker type.
  final Map<String, WorkerTypeSpecification>? workerTypeSpecifications;

  Application({
    required this.applicationId,
    required this.arn,
    required this.createdAt,
    required this.releaseLabel,
    required this.state,
    required this.type,
    required this.updatedAt,
    this.architecture,
    this.autoStartConfiguration,
    this.autoStopConfiguration,
    this.imageConfiguration,
    this.initialCapacity,
    this.interactiveConfiguration,
    this.maximumCapacity,
    this.monitoringConfiguration,
    this.name,
    this.networkConfiguration,
    this.runtimeConfiguration,
    this.stateDetails,
    this.tags,
    this.workerTypeSpecifications,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationId: json['applicationId'] as String,
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      releaseLabel: json['releaseLabel'] as String,
      state: (json['state'] as String).toApplicationState(),
      type: json['type'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      architecture: (json['architecture'] as String?)?.toArchitecture(),
      autoStartConfiguration: json['autoStartConfiguration'] != null
          ? AutoStartConfig.fromJson(
              json['autoStartConfiguration'] as Map<String, dynamic>)
          : null,
      autoStopConfiguration: json['autoStopConfiguration'] != null
          ? AutoStopConfig.fromJson(
              json['autoStopConfiguration'] as Map<String, dynamic>)
          : null,
      imageConfiguration: json['imageConfiguration'] != null
          ? ImageConfiguration.fromJson(
              json['imageConfiguration'] as Map<String, dynamic>)
          : null,
      initialCapacity: (json['initialCapacity'] as Map<String, dynamic>?)?.map(
          (k, e) => MapEntry(
              k, InitialCapacityConfig.fromJson(e as Map<String, dynamic>))),
      interactiveConfiguration: json['interactiveConfiguration'] != null
          ? InteractiveConfiguration.fromJson(
              json['interactiveConfiguration'] as Map<String, dynamic>)
          : null,
      maximumCapacity: json['maximumCapacity'] != null
          ? MaximumAllowedResources.fromJson(
              json['maximumCapacity'] as Map<String, dynamic>)
          : null,
      monitoringConfiguration: json['monitoringConfiguration'] != null
          ? MonitoringConfiguration.fromJson(
              json['monitoringConfiguration'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      runtimeConfiguration: (json['runtimeConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      stateDetails: json['stateDetails'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      workerTypeSpecifications: (json['workerTypeSpecifications']
              as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, WorkerTypeSpecification.fromJson(e as Map<String, dynamic>))),
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final releaseLabel = this.releaseLabel;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final architecture = this.architecture;
    final autoStartConfiguration = this.autoStartConfiguration;
    final autoStopConfiguration = this.autoStopConfiguration;
    final imageConfiguration = this.imageConfiguration;
    final initialCapacity = this.initialCapacity;
    final interactiveConfiguration = this.interactiveConfiguration;
    final maximumCapacity = this.maximumCapacity;
    final monitoringConfiguration = this.monitoringConfiguration;
    final name = this.name;
    final networkConfiguration = this.networkConfiguration;
    final runtimeConfiguration = this.runtimeConfiguration;
    final stateDetails = this.stateDetails;
    final tags = this.tags;
    final workerTypeSpecifications = this.workerTypeSpecifications;
    return {
      'applicationId': applicationId,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'releaseLabel': releaseLabel,
      'state': state.toValue(),
      'type': type,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (architecture != null) 'architecture': architecture.toValue(),
      if (autoStartConfiguration != null)
        'autoStartConfiguration': autoStartConfiguration,
      if (autoStopConfiguration != null)
        'autoStopConfiguration': autoStopConfiguration,
      if (imageConfiguration != null) 'imageConfiguration': imageConfiguration,
      if (initialCapacity != null) 'initialCapacity': initialCapacity,
      if (interactiveConfiguration != null)
        'interactiveConfiguration': interactiveConfiguration,
      if (maximumCapacity != null) 'maximumCapacity': maximumCapacity,
      if (monitoringConfiguration != null)
        'monitoringConfiguration': monitoringConfiguration,
      if (name != null) 'name': name,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (runtimeConfiguration != null)
        'runtimeConfiguration': runtimeConfiguration,
      if (stateDetails != null) 'stateDetails': stateDetails,
      if (tags != null) 'tags': tags,
      if (workerTypeSpecifications != null)
        'workerTypeSpecifications': workerTypeSpecifications,
    };
  }
}

enum ApplicationState {
  creating,
  created,
  starting,
  started,
  stopping,
  stopped,
  terminated,
}

extension ApplicationStateValueExtension on ApplicationState {
  String toValue() {
    switch (this) {
      case ApplicationState.creating:
        return 'CREATING';
      case ApplicationState.created:
        return 'CREATED';
      case ApplicationState.starting:
        return 'STARTING';
      case ApplicationState.started:
        return 'STARTED';
      case ApplicationState.stopping:
        return 'STOPPING';
      case ApplicationState.stopped:
        return 'STOPPED';
      case ApplicationState.terminated:
        return 'TERMINATED';
    }
  }
}

extension ApplicationStateFromString on String {
  ApplicationState toApplicationState() {
    switch (this) {
      case 'CREATING':
        return ApplicationState.creating;
      case 'CREATED':
        return ApplicationState.created;
      case 'STARTING':
        return ApplicationState.starting;
      case 'STARTED':
        return ApplicationState.started;
      case 'STOPPING':
        return ApplicationState.stopping;
      case 'STOPPED':
        return ApplicationState.stopped;
      case 'TERMINATED':
        return ApplicationState.terminated;
    }
    throw Exception('$this is not known in enum ApplicationState');
  }
}

/// The summary of attributes associated with an application.
class ApplicationSummary {
  /// The ARN of the application.
  final String arn;

  /// The date and time when the application was created.
  final DateTime createdAt;

  /// The ID of the application.
  final String id;

  /// The Amazon EMR release associated with the application.
  final String releaseLabel;

  /// The state of the application.
  final ApplicationState state;

  /// The type of application, such as Spark or Hive.
  final String type;

  /// The date and time when the application was last updated.
  final DateTime updatedAt;

  /// The CPU architecture of an application.
  final Architecture? architecture;

  /// The name of the application.
  final String? name;

  /// The state details of the application.
  final String? stateDetails;

  ApplicationSummary({
    required this.arn,
    required this.createdAt,
    required this.id,
    required this.releaseLabel,
    required this.state,
    required this.type,
    required this.updatedAt,
    this.architecture,
    this.name,
    this.stateDetails,
  });

  factory ApplicationSummary.fromJson(Map<String, dynamic> json) {
    return ApplicationSummary(
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      id: json['id'] as String,
      releaseLabel: json['releaseLabel'] as String,
      state: (json['state'] as String).toApplicationState(),
      type: json['type'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      architecture: (json['architecture'] as String?)?.toArchitecture(),
      name: json['name'] as String?,
      stateDetails: json['stateDetails'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final id = this.id;
    final releaseLabel = this.releaseLabel;
    final state = this.state;
    final type = this.type;
    final updatedAt = this.updatedAt;
    final architecture = this.architecture;
    final name = this.name;
    final stateDetails = this.stateDetails;
    return {
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'id': id,
      'releaseLabel': releaseLabel,
      'state': state.toValue(),
      'type': type,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (architecture != null) 'architecture': architecture.toValue(),
      if (name != null) 'name': name,
      if (stateDetails != null) 'stateDetails': stateDetails,
    };
  }
}

enum Architecture {
  arm64,
  x86_64,
}

extension ArchitectureValueExtension on Architecture {
  String toValue() {
    switch (this) {
      case Architecture.arm64:
        return 'ARM64';
      case Architecture.x86_64:
        return 'X86_64';
    }
  }
}

extension ArchitectureFromString on String {
  Architecture toArchitecture() {
    switch (this) {
      case 'ARM64':
        return Architecture.arm64;
      case 'X86_64':
        return Architecture.x86_64;
    }
    throw Exception('$this is not known in enum Architecture');
  }
}

/// The configuration for an application to automatically start on job
/// submission.
class AutoStartConfig {
  /// Enables the application to automatically start on job submission. Defaults
  /// to true.
  final bool? enabled;

  AutoStartConfig({
    this.enabled,
  });

  factory AutoStartConfig.fromJson(Map<String, dynamic> json) {
    return AutoStartConfig(
      enabled: json['enabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    return {
      if (enabled != null) 'enabled': enabled,
    };
  }
}

/// The configuration for an application to automatically stop after a certain
/// amount of time being idle.
class AutoStopConfig {
  /// Enables the application to automatically stop after a certain amount of time
  /// being idle. Defaults to true.
  final bool? enabled;

  /// The amount of idle time in minutes after which your application will
  /// automatically stop. Defaults to 15 minutes.
  final int? idleTimeoutMinutes;

  AutoStopConfig({
    this.enabled,
    this.idleTimeoutMinutes,
  });

  factory AutoStopConfig.fromJson(Map<String, dynamic> json) {
    return AutoStopConfig(
      enabled: json['enabled'] as bool?,
      idleTimeoutMinutes: json['idleTimeoutMinutes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final idleTimeoutMinutes = this.idleTimeoutMinutes;
    return {
      if (enabled != null) 'enabled': enabled,
      if (idleTimeoutMinutes != null) 'idleTimeoutMinutes': idleTimeoutMinutes,
    };
  }
}

class CancelJobRunResponse {
  /// The output contains the application ID on which the job run is cancelled.
  final String applicationId;

  /// The output contains the ID of the cancelled job run.
  final String jobRunId;

  CancelJobRunResponse({
    required this.applicationId,
    required this.jobRunId,
  });

  factory CancelJobRunResponse.fromJson(Map<String, dynamic> json) {
    return CancelJobRunResponse(
      applicationId: json['applicationId'] as String,
      jobRunId: json['jobRunId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final jobRunId = this.jobRunId;
    return {
      'applicationId': applicationId,
      'jobRunId': jobRunId,
    };
  }
}

/// The Amazon CloudWatch configuration for monitoring logs. You can configure
/// your jobs to send log information to CloudWatch.
class CloudWatchLoggingConfiguration {
  /// Enables CloudWatch logging.
  final bool enabled;

  /// The Key Management Service (KMS) key ARN to encrypt the logs that you store
  /// in CloudWatch Logs.
  final String? encryptionKeyArn;

  /// The name of the log group in Amazon CloudWatch Logs where you want to
  /// publish your logs.
  final String? logGroupName;

  /// Prefix for the CloudWatch log stream name.
  final String? logStreamNamePrefix;

  /// The types of logs that you want to publish to CloudWatch. If you don't
  /// specify any log types, driver STDOUT and STDERR logs will be published to
  /// CloudWatch Logs by default. For more information including the supported
  /// worker types for Hive and Spark, see <a
  /// href="https://docs.aws.amazon.com/emr/latest/EMR-Serverless-UserGuide/logging.html#jobs-log-storage-cw">Logging
  /// for EMR Serverless with CloudWatch</a>.
  ///
  /// <ul>
  /// <li>
  /// <b>Key Valid Values</b>: <code>SPARK_DRIVER</code>,
  /// <code>SPARK_EXECUTOR</code>, <code>HIVE_DRIVER</code>, <code>TEZ_TASK</code>
  /// </li>
  /// <li>
  /// <b>Array Members Valid Values</b>: <code>STDOUT</code>, <code>STDERR</code>,
  /// <code>HIVE_LOG</code>, <code>TEZ_AM</code>, <code>SYSTEM_LOGS</code>
  /// </li>
  /// </ul>
  final Map<String, List<String>>? logTypes;

  CloudWatchLoggingConfiguration({
    required this.enabled,
    this.encryptionKeyArn,
    this.logGroupName,
    this.logStreamNamePrefix,
    this.logTypes,
  });

  factory CloudWatchLoggingConfiguration.fromJson(Map<String, dynamic> json) {
    return CloudWatchLoggingConfiguration(
      enabled: json['enabled'] as bool,
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      logGroupName: json['logGroupName'] as String?,
      logStreamNamePrefix: json['logStreamNamePrefix'] as String?,
      logTypes: (json['logTypes'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionKeyArn = this.encryptionKeyArn;
    final logGroupName = this.logGroupName;
    final logStreamNamePrefix = this.logStreamNamePrefix;
    final logTypes = this.logTypes;
    return {
      'enabled': enabled,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (logGroupName != null) 'logGroupName': logGroupName,
      if (logStreamNamePrefix != null)
        'logStreamNamePrefix': logStreamNamePrefix,
      if (logTypes != null) 'logTypes': logTypes,
    };
  }
}

/// A configuration specification to be used when provisioning an application. A
/// configuration consists of a classification, properties, and optional nested
/// configurations. A classification refers to an application-specific
/// configuration file. Properties are the settings you want to change in that
/// file.
class Configuration {
  /// The classification within a configuration.
  final String classification;

  /// A list of additional configurations to apply within a configuration object.
  final List<Configuration>? configurations;

  /// A set of properties specified within a configuration classification.
  final Map<String, String>? properties;

  Configuration({
    required this.classification,
    this.configurations,
    this.properties,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      classification: json['classification'] as String,
      configurations: (json['configurations'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      properties: (json['properties'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final classification = this.classification;
    final configurations = this.configurations;
    final properties = this.properties;
    return {
      'classification': classification,
      if (configurations != null) 'configurations': configurations,
      if (properties != null) 'properties': properties,
    };
  }
}

/// A configuration specification to be used to override existing
/// configurations.
class ConfigurationOverrides {
  /// The override configurations for the application.
  final List<Configuration>? applicationConfiguration;

  /// The override configurations for monitoring.
  final MonitoringConfiguration? monitoringConfiguration;

  ConfigurationOverrides({
    this.applicationConfiguration,
    this.monitoringConfiguration,
  });

  factory ConfigurationOverrides.fromJson(Map<String, dynamic> json) {
    return ConfigurationOverrides(
      applicationConfiguration: (json['applicationConfiguration'] as List?)
          ?.whereNotNull()
          .map((e) => Configuration.fromJson(e as Map<String, dynamic>))
          .toList(),
      monitoringConfiguration: json['monitoringConfiguration'] != null
          ? MonitoringConfiguration.fromJson(
              json['monitoringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationConfiguration = this.applicationConfiguration;
    final monitoringConfiguration = this.monitoringConfiguration;
    return {
      if (applicationConfiguration != null)
        'applicationConfiguration': applicationConfiguration,
      if (monitoringConfiguration != null)
        'monitoringConfiguration': monitoringConfiguration,
    };
  }
}

class CreateApplicationResponse {
  /// The output contains the application ID.
  final String applicationId;

  /// The output contains the ARN of the application.
  final String arn;

  /// The output contains the name of the application.
  final String? name;

  CreateApplicationResponse({
    required this.applicationId,
    required this.arn,
    this.name,
  });

  factory CreateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateApplicationResponse(
      applicationId: json['applicationId'] as String,
      arn: json['arn'] as String,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final name = this.name;
    return {
      'applicationId': applicationId,
      'arn': arn,
      if (name != null) 'name': name,
    };
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

class GetApplicationResponse {
  /// The output displays information about the specified application.
  final Application application;

  GetApplicationResponse({
    required this.application,
  });

  factory GetApplicationResponse.fromJson(Map<String, dynamic> json) {
    return GetApplicationResponse(
      application:
          Application.fromJson(json['application'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      'application': application,
    };
  }
}

class GetDashboardForJobRunResponse {
  /// The URL to view job run's dashboard.
  final String? url;

  GetDashboardForJobRunResponse({
    this.url,
  });

  factory GetDashboardForJobRunResponse.fromJson(Map<String, dynamic> json) {
    return GetDashboardForJobRunResponse(
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final url = this.url;
    return {
      if (url != null) 'url': url,
    };
  }
}

class GetJobRunResponse {
  /// The output displays information about the job run.
  final JobRun jobRun;

  GetJobRunResponse({
    required this.jobRun,
  });

  factory GetJobRunResponse.fromJson(Map<String, dynamic> json) {
    return GetJobRunResponse(
      jobRun: JobRun.fromJson(json['jobRun'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final jobRun = this.jobRun;
    return {
      'jobRun': jobRun,
    };
  }
}

/// The configurations for the Hive job driver.
class Hive {
  /// The query for the Hive job run.
  final String query;

  /// The query file for the Hive job run.
  final String? initQueryFile;

  /// The parameters for the Hive job run.
  final String? parameters;

  Hive({
    required this.query,
    this.initQueryFile,
    this.parameters,
  });

  factory Hive.fromJson(Map<String, dynamic> json) {
    return Hive(
      query: json['query'] as String,
      initQueryFile: json['initQueryFile'] as String?,
      parameters: json['parameters'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final query = this.query;
    final initQueryFile = this.initQueryFile;
    final parameters = this.parameters;
    return {
      'query': query,
      if (initQueryFile != null) 'initQueryFile': initQueryFile,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

/// The applied image configuration.
class ImageConfiguration {
  /// The image URI.
  final String imageUri;

  /// The SHA256 digest of the image URI. This indicates which specific image the
  /// application is configured for. The image digest doesn't exist until an
  /// application has started.
  final String? resolvedImageDigest;

  ImageConfiguration({
    required this.imageUri,
    this.resolvedImageDigest,
  });

  factory ImageConfiguration.fromJson(Map<String, dynamic> json) {
    return ImageConfiguration(
      imageUri: json['imageUri'] as String,
      resolvedImageDigest: json['resolvedImageDigest'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    final resolvedImageDigest = this.resolvedImageDigest;
    return {
      'imageUri': imageUri,
      if (resolvedImageDigest != null)
        'resolvedImageDigest': resolvedImageDigest,
    };
  }
}

/// The image configuration.
class ImageConfigurationInput {
  /// The URI of an image in the Amazon ECR registry. This field is required when
  /// you create a new application. If you leave this field blank in an update,
  /// Amazon EMR will remove the image configuration.
  final String? imageUri;

  ImageConfigurationInput({
    this.imageUri,
  });

  Map<String, dynamic> toJson() {
    final imageUri = this.imageUri;
    return {
      if (imageUri != null) 'imageUri': imageUri,
    };
  }
}

/// The initial capacity configuration per worker.
class InitialCapacityConfig {
  /// The number of workers in the initial capacity configuration.
  final int workerCount;

  /// The resource configuration of the initial capacity configuration.
  final WorkerResourceConfig? workerConfiguration;

  InitialCapacityConfig({
    required this.workerCount,
    this.workerConfiguration,
  });

  factory InitialCapacityConfig.fromJson(Map<String, dynamic> json) {
    return InitialCapacityConfig(
      workerCount: json['workerCount'] as int,
      workerConfiguration: json['workerConfiguration'] != null
          ? WorkerResourceConfig.fromJson(
              json['workerConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final workerCount = this.workerCount;
    final workerConfiguration = this.workerConfiguration;
    return {
      'workerCount': workerCount,
      if (workerConfiguration != null)
        'workerConfiguration': workerConfiguration,
    };
  }
}

/// The configuration to use to enable the different types of interactive use
/// cases in an application.
class InteractiveConfiguration {
  /// Enables an Apache Livy endpoint that you can connect to and run interactive
  /// jobs.
  final bool? livyEndpointEnabled;

  /// Enables you to connect an application to Amazon EMR Studio to run
  /// interactive workloads in a notebook.
  final bool? studioEnabled;

  InteractiveConfiguration({
    this.livyEndpointEnabled,
    this.studioEnabled,
  });

  factory InteractiveConfiguration.fromJson(Map<String, dynamic> json) {
    return InteractiveConfiguration(
      livyEndpointEnabled: json['livyEndpointEnabled'] as bool?,
      studioEnabled: json['studioEnabled'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final livyEndpointEnabled = this.livyEndpointEnabled;
    final studioEnabled = this.studioEnabled;
    return {
      if (livyEndpointEnabled != null)
        'livyEndpointEnabled': livyEndpointEnabled,
      if (studioEnabled != null) 'studioEnabled': studioEnabled,
    };
  }
}

/// The driver that the job runs on.
class JobDriver {
  /// The job driver parameters specified for Hive.
  final Hive? hive;

  /// The job driver parameters specified for Spark.
  final SparkSubmit? sparkSubmit;

  JobDriver({
    this.hive,
    this.sparkSubmit,
  });

  factory JobDriver.fromJson(Map<String, dynamic> json) {
    return JobDriver(
      hive: json['hive'] != null
          ? Hive.fromJson(json['hive'] as Map<String, dynamic>)
          : null,
      sparkSubmit: json['sparkSubmit'] != null
          ? SparkSubmit.fromJson(json['sparkSubmit'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final hive = this.hive;
    final sparkSubmit = this.sparkSubmit;
    return {
      if (hive != null) 'hive': hive,
      if (sparkSubmit != null) 'sparkSubmit': sparkSubmit,
    };
  }
}

/// Information about a job run. A job run is a unit of work, such as a Spark
/// JAR, Hive query, or SparkSQL query, that you submit to an Amazon EMR
/// Serverless application.
class JobRun {
  /// The ID of the application the job is running on.
  final String applicationId;

  /// The execution role ARN of the job run.
  final String arn;

  /// The date and time when the job run was created.
  final DateTime createdAt;

  /// The user who created the job run.
  final String createdBy;

  /// The execution role ARN of the job run.
  final String executionRole;

  /// The job driver for the job run.
  final JobDriver jobDriver;

  /// The ID of the job run.
  final String jobRunId;

  /// The Amazon EMR release associated with the application your job is running
  /// on.
  final String releaseLabel;

  /// The state of the job run.
  final JobRunState state;

  /// The state details of the job run.
  final String stateDetails;

  /// The date and time when the job run was updated.
  final DateTime updatedAt;

  /// The attempt of the job run.
  final int? attempt;

  /// The date and time of when the job run attempt was created.
  final DateTime? attemptCreatedAt;

  /// The date and time of when the job run attempt was last updated.
  final DateTime? attemptUpdatedAt;

  /// The aggregate vCPU, memory, and storage that Amazon Web Services has billed
  /// for the job run. The billed resources include a 1-minute minimum usage for
  /// workers, plus additional storage over 20 GB per worker. Note that billed
  /// resources do not include usage for idle pre-initialized workers.
  final ResourceUtilization? billedResourceUtilization;

  /// The configuration settings that are used to override default configuration.
  final ConfigurationOverrides? configurationOverrides;

  /// Returns the job run timeout value from the <code>StartJobRun</code> call. If
  /// no timeout was specified, then it returns the default timeout of 720
  /// minutes.
  final int? executionTimeoutMinutes;

  /// The mode of the job run.
  final JobRunMode? mode;

  /// The optional job run name. This doesn't have to be unique.
  final String? name;
  final NetworkConfiguration? networkConfiguration;

  /// The retry policy of the job run.
  final RetryPolicy? retryPolicy;

  /// The tags assigned to the job run.
  final Map<String, String>? tags;

  /// The job run total execution duration in seconds. This field is only
  /// available for job runs in a <code>COMPLETED</code>, <code>FAILED</code>, or
  /// <code>CANCELLED</code> state.
  final int? totalExecutionDurationSeconds;

  /// The aggregate vCPU, memory, and storage resources used from the time the job
  /// starts to execute, until the time the job terminates, rounded up to the
  /// nearest second.
  final TotalResourceUtilization? totalResourceUtilization;

  JobRun({
    required this.applicationId,
    required this.arn,
    required this.createdAt,
    required this.createdBy,
    required this.executionRole,
    required this.jobDriver,
    required this.jobRunId,
    required this.releaseLabel,
    required this.state,
    required this.stateDetails,
    required this.updatedAt,
    this.attempt,
    this.attemptCreatedAt,
    this.attemptUpdatedAt,
    this.billedResourceUtilization,
    this.configurationOverrides,
    this.executionTimeoutMinutes,
    this.mode,
    this.name,
    this.networkConfiguration,
    this.retryPolicy,
    this.tags,
    this.totalExecutionDurationSeconds,
    this.totalResourceUtilization,
  });

  factory JobRun.fromJson(Map<String, dynamic> json) {
    return JobRun(
      applicationId: json['applicationId'] as String,
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      executionRole: json['executionRole'] as String,
      jobDriver: JobDriver.fromJson(json['jobDriver'] as Map<String, dynamic>),
      jobRunId: json['jobRunId'] as String,
      releaseLabel: json['releaseLabel'] as String,
      state: (json['state'] as String).toJobRunState(),
      stateDetails: json['stateDetails'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      attempt: json['attempt'] as int?,
      attemptCreatedAt: timeStampFromJson(json['attemptCreatedAt']),
      attemptUpdatedAt: timeStampFromJson(json['attemptUpdatedAt']),
      billedResourceUtilization: json['billedResourceUtilization'] != null
          ? ResourceUtilization.fromJson(
              json['billedResourceUtilization'] as Map<String, dynamic>)
          : null,
      configurationOverrides: json['configurationOverrides'] != null
          ? ConfigurationOverrides.fromJson(
              json['configurationOverrides'] as Map<String, dynamic>)
          : null,
      executionTimeoutMinutes: json['executionTimeoutMinutes'] as int?,
      mode: (json['mode'] as String?)?.toJobRunMode(),
      name: json['name'] as String?,
      networkConfiguration: json['networkConfiguration'] != null
          ? NetworkConfiguration.fromJson(
              json['networkConfiguration'] as Map<String, dynamic>)
          : null,
      retryPolicy: json['retryPolicy'] != null
          ? RetryPolicy.fromJson(json['retryPolicy'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      totalExecutionDurationSeconds:
          json['totalExecutionDurationSeconds'] as int?,
      totalResourceUtilization: json['totalResourceUtilization'] != null
          ? TotalResourceUtilization.fromJson(
              json['totalResourceUtilization'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final executionRole = this.executionRole;
    final jobDriver = this.jobDriver;
    final jobRunId = this.jobRunId;
    final releaseLabel = this.releaseLabel;
    final state = this.state;
    final stateDetails = this.stateDetails;
    final updatedAt = this.updatedAt;
    final attempt = this.attempt;
    final attemptCreatedAt = this.attemptCreatedAt;
    final attemptUpdatedAt = this.attemptUpdatedAt;
    final billedResourceUtilization = this.billedResourceUtilization;
    final configurationOverrides = this.configurationOverrides;
    final executionTimeoutMinutes = this.executionTimeoutMinutes;
    final mode = this.mode;
    final name = this.name;
    final networkConfiguration = this.networkConfiguration;
    final retryPolicy = this.retryPolicy;
    final tags = this.tags;
    final totalExecutionDurationSeconds = this.totalExecutionDurationSeconds;
    final totalResourceUtilization = this.totalResourceUtilization;
    return {
      'applicationId': applicationId,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'executionRole': executionRole,
      'jobDriver': jobDriver,
      'jobRunId': jobRunId,
      'releaseLabel': releaseLabel,
      'state': state.toValue(),
      'stateDetails': stateDetails,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attempt != null) 'attempt': attempt,
      if (attemptCreatedAt != null)
        'attemptCreatedAt': unixTimestampToJson(attemptCreatedAt),
      if (attemptUpdatedAt != null)
        'attemptUpdatedAt': unixTimestampToJson(attemptUpdatedAt),
      if (billedResourceUtilization != null)
        'billedResourceUtilization': billedResourceUtilization,
      if (configurationOverrides != null)
        'configurationOverrides': configurationOverrides,
      if (executionTimeoutMinutes != null)
        'executionTimeoutMinutes': executionTimeoutMinutes,
      if (mode != null) 'mode': mode.toValue(),
      if (name != null) 'name': name,
      if (networkConfiguration != null)
        'networkConfiguration': networkConfiguration,
      if (retryPolicy != null) 'retryPolicy': retryPolicy,
      if (tags != null) 'tags': tags,
      if (totalExecutionDurationSeconds != null)
        'totalExecutionDurationSeconds': totalExecutionDurationSeconds,
      if (totalResourceUtilization != null)
        'totalResourceUtilization': totalResourceUtilization,
    };
  }
}

/// The summary of attributes associated with a job run attempt.
class JobRunAttemptSummary {
  /// The ID of the application the job is running on.
  final String applicationId;

  /// The Amazon Resource Name (ARN) of the job run.
  final String arn;

  /// The date and time when the job run attempt was created.
  final DateTime createdAt;

  /// The user who created the job run.
  final String createdBy;

  /// The Amazon Resource Name (ARN) of the execution role of the job run..
  final String executionRole;

  /// The ID of the job run attempt.
  final String id;

  /// The date and time of when the job run was created.
  final DateTime jobCreatedAt;

  /// The Amazon EMR release label of the job run attempt.
  final String releaseLabel;

  /// The state of the job run attempt.
  final JobRunState state;

  /// The state details of the job run attempt.
  final String stateDetails;

  /// The date and time of when the job run attempt was last updated.
  final DateTime updatedAt;

  /// The attempt number of the job run execution.
  final int? attempt;

  /// The mode of the job run attempt.
  final JobRunMode? mode;

  /// The name of the job run attempt.
  final String? name;

  /// The type of the job run, such as Spark or Hive.
  final String? type;

  JobRunAttemptSummary({
    required this.applicationId,
    required this.arn,
    required this.createdAt,
    required this.createdBy,
    required this.executionRole,
    required this.id,
    required this.jobCreatedAt,
    required this.releaseLabel,
    required this.state,
    required this.stateDetails,
    required this.updatedAt,
    this.attempt,
    this.mode,
    this.name,
    this.type,
  });

  factory JobRunAttemptSummary.fromJson(Map<String, dynamic> json) {
    return JobRunAttemptSummary(
      applicationId: json['applicationId'] as String,
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      executionRole: json['executionRole'] as String,
      id: json['id'] as String,
      jobCreatedAt:
          nonNullableTimeStampFromJson(json['jobCreatedAt'] as Object),
      releaseLabel: json['releaseLabel'] as String,
      state: (json['state'] as String).toJobRunState(),
      stateDetails: json['stateDetails'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      attempt: json['attempt'] as int?,
      mode: (json['mode'] as String?)?.toJobRunMode(),
      name: json['name'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final executionRole = this.executionRole;
    final id = this.id;
    final jobCreatedAt = this.jobCreatedAt;
    final releaseLabel = this.releaseLabel;
    final state = this.state;
    final stateDetails = this.stateDetails;
    final updatedAt = this.updatedAt;
    final attempt = this.attempt;
    final mode = this.mode;
    final name = this.name;
    final type = this.type;
    return {
      'applicationId': applicationId,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'executionRole': executionRole,
      'id': id,
      'jobCreatedAt': unixTimestampToJson(jobCreatedAt),
      'releaseLabel': releaseLabel,
      'state': state.toValue(),
      'stateDetails': stateDetails,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attempt != null) 'attempt': attempt,
      if (mode != null) 'mode': mode.toValue(),
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
  }
}

enum JobRunMode {
  batch,
  streaming,
}

extension JobRunModeValueExtension on JobRunMode {
  String toValue() {
    switch (this) {
      case JobRunMode.batch:
        return 'BATCH';
      case JobRunMode.streaming:
        return 'STREAMING';
    }
  }
}

extension JobRunModeFromString on String {
  JobRunMode toJobRunMode() {
    switch (this) {
      case 'BATCH':
        return JobRunMode.batch;
      case 'STREAMING':
        return JobRunMode.streaming;
    }
    throw Exception('$this is not known in enum JobRunMode');
  }
}

enum JobRunState {
  submitted,
  pending,
  scheduled,
  running,
  success,
  failed,
  cancelling,
  cancelled,
}

extension JobRunStateValueExtension on JobRunState {
  String toValue() {
    switch (this) {
      case JobRunState.submitted:
        return 'SUBMITTED';
      case JobRunState.pending:
        return 'PENDING';
      case JobRunState.scheduled:
        return 'SCHEDULED';
      case JobRunState.running:
        return 'RUNNING';
      case JobRunState.success:
        return 'SUCCESS';
      case JobRunState.failed:
        return 'FAILED';
      case JobRunState.cancelling:
        return 'CANCELLING';
      case JobRunState.cancelled:
        return 'CANCELLED';
    }
  }
}

extension JobRunStateFromString on String {
  JobRunState toJobRunState() {
    switch (this) {
      case 'SUBMITTED':
        return JobRunState.submitted;
      case 'PENDING':
        return JobRunState.pending;
      case 'SCHEDULED':
        return JobRunState.scheduled;
      case 'RUNNING':
        return JobRunState.running;
      case 'SUCCESS':
        return JobRunState.success;
      case 'FAILED':
        return JobRunState.failed;
      case 'CANCELLING':
        return JobRunState.cancelling;
      case 'CANCELLED':
        return JobRunState.cancelled;
    }
    throw Exception('$this is not known in enum JobRunState');
  }
}

/// The summary of attributes associated with a job run.
class JobRunSummary {
  /// The ID of the application the job is running on.
  final String applicationId;

  /// The ARN of the job run.
  final String arn;

  /// The date and time when the job run was created.
  final DateTime createdAt;

  /// The user who created the job run.
  final String createdBy;

  /// The execution role ARN of the job run.
  final String executionRole;

  /// The ID of the job run.
  final String id;

  /// The Amazon EMR release associated with the application your job is running
  /// on.
  final String releaseLabel;

  /// The state of the job run.
  final JobRunState state;

  /// The state details of the job run.
  final String stateDetails;

  /// The date and time when the job run was last updated.
  final DateTime updatedAt;

  /// The attempt number of the job run execution.
  final int? attempt;

  /// The date and time of when the job run attempt was created.
  final DateTime? attemptCreatedAt;

  /// The date and time of when the job run attempt was last updated.
  final DateTime? attemptUpdatedAt;

  /// The mode of the job run.
  final JobRunMode? mode;

  /// The optional job run name. This doesn't have to be unique.
  final String? name;

  /// The type of job run, such as Spark or Hive.
  final String? type;

  JobRunSummary({
    required this.applicationId,
    required this.arn,
    required this.createdAt,
    required this.createdBy,
    required this.executionRole,
    required this.id,
    required this.releaseLabel,
    required this.state,
    required this.stateDetails,
    required this.updatedAt,
    this.attempt,
    this.attemptCreatedAt,
    this.attemptUpdatedAt,
    this.mode,
    this.name,
    this.type,
  });

  factory JobRunSummary.fromJson(Map<String, dynamic> json) {
    return JobRunSummary(
      applicationId: json['applicationId'] as String,
      arn: json['arn'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      executionRole: json['executionRole'] as String,
      id: json['id'] as String,
      releaseLabel: json['releaseLabel'] as String,
      state: (json['state'] as String).toJobRunState(),
      stateDetails: json['stateDetails'] as String,
      updatedAt: nonNullableTimeStampFromJson(json['updatedAt'] as Object),
      attempt: json['attempt'] as int?,
      attemptCreatedAt: timeStampFromJson(json['attemptCreatedAt']),
      attemptUpdatedAt: timeStampFromJson(json['attemptUpdatedAt']),
      mode: (json['mode'] as String?)?.toJobRunMode(),
      name: json['name'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final executionRole = this.executionRole;
    final id = this.id;
    final releaseLabel = this.releaseLabel;
    final state = this.state;
    final stateDetails = this.stateDetails;
    final updatedAt = this.updatedAt;
    final attempt = this.attempt;
    final attemptCreatedAt = this.attemptCreatedAt;
    final attemptUpdatedAt = this.attemptUpdatedAt;
    final mode = this.mode;
    final name = this.name;
    final type = this.type;
    return {
      'applicationId': applicationId,
      'arn': arn,
      'createdAt': unixTimestampToJson(createdAt),
      'createdBy': createdBy,
      'executionRole': executionRole,
      'id': id,
      'releaseLabel': releaseLabel,
      'state': state.toValue(),
      'stateDetails': stateDetails,
      'updatedAt': unixTimestampToJson(updatedAt),
      if (attempt != null) 'attempt': attempt,
      if (attemptCreatedAt != null)
        'attemptCreatedAt': unixTimestampToJson(attemptCreatedAt),
      if (attemptUpdatedAt != null)
        'attemptUpdatedAt': unixTimestampToJson(attemptUpdatedAt),
      if (mode != null) 'mode': mode.toValue(),
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    };
  }
}

class ListApplicationsResponse {
  /// The output lists the specified applications.
  final List<ApplicationSummary> applications;

  /// The output displays the token for the next set of application results. This
  /// is required for pagination and is available as a response of the previous
  /// request.
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

class ListJobRunAttemptsResponse {
  /// The array of the listed job run attempt objects.
  final List<JobRunAttemptSummary> jobRunAttempts;

  /// The output displays the token for the next set of application results. This
  /// is required for pagination and is available as a response of the previous
  /// request.
  final String? nextToken;

  ListJobRunAttemptsResponse({
    required this.jobRunAttempts,
    this.nextToken,
  });

  factory ListJobRunAttemptsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobRunAttemptsResponse(
      jobRunAttempts: (json['jobRunAttempts'] as List)
          .whereNotNull()
          .map((e) => JobRunAttemptSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRunAttempts = this.jobRunAttempts;
    final nextToken = this.nextToken;
    return {
      'jobRunAttempts': jobRunAttempts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListJobRunsResponse {
  /// The output lists information about the specified job runs.
  final List<JobRunSummary> jobRuns;

  /// The output displays the token for the next set of job run results. This is
  /// required for pagination and is available as a response of the previous
  /// request.
  final String? nextToken;

  ListJobRunsResponse({
    required this.jobRuns,
    this.nextToken,
  });

  factory ListJobRunsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobRunsResponse(
      jobRuns: (json['jobRuns'] as List)
          .whereNotNull()
          .map((e) => JobRunSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobRuns = this.jobRuns;
    final nextToken = this.nextToken;
    return {
      'jobRuns': jobRuns,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags for the resource.
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

/// The managed log persistence configuration for a job run.
class ManagedPersistenceMonitoringConfiguration {
  /// Enables managed logging and defaults to true. If set to false, managed
  /// logging will be turned off.
  final bool? enabled;

  /// The KMS key ARN to encrypt the logs stored in managed log persistence.
  final String? encryptionKeyArn;

  ManagedPersistenceMonitoringConfiguration({
    this.enabled,
    this.encryptionKeyArn,
  });

  factory ManagedPersistenceMonitoringConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ManagedPersistenceMonitoringConfiguration(
      enabled: json['enabled'] as bool?,
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final enabled = this.enabled;
    final encryptionKeyArn = this.encryptionKeyArn;
    return {
      if (enabled != null) 'enabled': enabled,
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
    };
  }
}

/// The maximum allowed cumulative resources for an application. No new
/// resources will be created once the limit is hit.
class MaximumAllowedResources {
  /// The maximum allowed CPU for an application.
  final String cpu;

  /// The maximum allowed resources for an application.
  final String memory;

  /// The maximum allowed disk for an application.
  final String? disk;

  MaximumAllowedResources({
    required this.cpu,
    required this.memory,
    this.disk,
  });

  factory MaximumAllowedResources.fromJson(Map<String, dynamic> json) {
    return MaximumAllowedResources(
      cpu: json['cpu'] as String,
      memory: json['memory'] as String,
      disk: json['disk'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpu = this.cpu;
    final memory = this.memory;
    final disk = this.disk;
    return {
      'cpu': cpu,
      'memory': memory,
      if (disk != null) 'disk': disk,
    };
  }
}

/// The configuration setting for monitoring.
class MonitoringConfiguration {
  /// The Amazon CloudWatch configuration for monitoring logs. You can configure
  /// your jobs to send log information to CloudWatch.
  final CloudWatchLoggingConfiguration? cloudWatchLoggingConfiguration;

  /// The managed log persistence configuration for a job run.
  final ManagedPersistenceMonitoringConfiguration?
      managedPersistenceMonitoringConfiguration;

  /// The monitoring configuration object you can configure to send metrics to
  /// Amazon Managed Service for Prometheus for a job run.
  final PrometheusMonitoringConfiguration? prometheusMonitoringConfiguration;

  /// The Amazon S3 configuration for monitoring log publishing.
  final S3MonitoringConfiguration? s3MonitoringConfiguration;

  MonitoringConfiguration({
    this.cloudWatchLoggingConfiguration,
    this.managedPersistenceMonitoringConfiguration,
    this.prometheusMonitoringConfiguration,
    this.s3MonitoringConfiguration,
  });

  factory MonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return MonitoringConfiguration(
      cloudWatchLoggingConfiguration: json['cloudWatchLoggingConfiguration'] !=
              null
          ? CloudWatchLoggingConfiguration.fromJson(
              json['cloudWatchLoggingConfiguration'] as Map<String, dynamic>)
          : null,
      managedPersistenceMonitoringConfiguration:
          json['managedPersistenceMonitoringConfiguration'] != null
              ? ManagedPersistenceMonitoringConfiguration.fromJson(
                  json['managedPersistenceMonitoringConfiguration']
                      as Map<String, dynamic>)
              : null,
      prometheusMonitoringConfiguration:
          json['prometheusMonitoringConfiguration'] != null
              ? PrometheusMonitoringConfiguration.fromJson(
                  json['prometheusMonitoringConfiguration']
                      as Map<String, dynamic>)
              : null,
      s3MonitoringConfiguration: json['s3MonitoringConfiguration'] != null
          ? S3MonitoringConfiguration.fromJson(
              json['s3MonitoringConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLoggingConfiguration = this.cloudWatchLoggingConfiguration;
    final managedPersistenceMonitoringConfiguration =
        this.managedPersistenceMonitoringConfiguration;
    final prometheusMonitoringConfiguration =
        this.prometheusMonitoringConfiguration;
    final s3MonitoringConfiguration = this.s3MonitoringConfiguration;
    return {
      if (cloudWatchLoggingConfiguration != null)
        'cloudWatchLoggingConfiguration': cloudWatchLoggingConfiguration,
      if (managedPersistenceMonitoringConfiguration != null)
        'managedPersistenceMonitoringConfiguration':
            managedPersistenceMonitoringConfiguration,
      if (prometheusMonitoringConfiguration != null)
        'prometheusMonitoringConfiguration': prometheusMonitoringConfiguration,
      if (s3MonitoringConfiguration != null)
        's3MonitoringConfiguration': s3MonitoringConfiguration,
    };
  }
}

/// The network configuration for customer VPC connectivity.
class NetworkConfiguration {
  /// The array of security group Ids for customer VPC connectivity.
  final List<String>? securityGroupIds;

  /// The array of subnet Ids for customer VPC connectivity.
  final List<String>? subnetIds;

  NetworkConfiguration({
    this.securityGroupIds,
    this.subnetIds,
  });

  factory NetworkConfiguration.fromJson(Map<String, dynamic> json) {
    return NetworkConfiguration(
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    return {
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
    };
  }
}

/// The monitoring configuration object you can configure to send metrics to
/// Amazon Managed Service for Prometheus for a job run.
class PrometheusMonitoringConfiguration {
  /// The remote write URL in the Amazon Managed Service for Prometheus workspace
  /// to send metrics to.
  final String? remoteWriteUrl;

  PrometheusMonitoringConfiguration({
    this.remoteWriteUrl,
  });

  factory PrometheusMonitoringConfiguration.fromJson(
      Map<String, dynamic> json) {
    return PrometheusMonitoringConfiguration(
      remoteWriteUrl: json['remoteWriteUrl'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final remoteWriteUrl = this.remoteWriteUrl;
    return {
      if (remoteWriteUrl != null) 'remoteWriteUrl': remoteWriteUrl,
    };
  }
}

/// The resource utilization for memory, storage, and vCPU for jobs.
class ResourceUtilization {
  /// The aggregated memory used per hour from the time the job starts executing
  /// until the job is terminated.
  final double? memoryGBHour;

  /// The aggregated storage used per hour from the time the job starts executing
  /// until the job is terminated.
  final double? storageGBHour;

  /// The aggregated vCPU used per hour from the time the job starts executing
  /// until the job is terminated.
  final double? vCPUHour;

  ResourceUtilization({
    this.memoryGBHour,
    this.storageGBHour,
    this.vCPUHour,
  });

  factory ResourceUtilization.fromJson(Map<String, dynamic> json) {
    return ResourceUtilization(
      memoryGBHour: json['memoryGBHour'] as double?,
      storageGBHour: json['storageGBHour'] as double?,
      vCPUHour: json['vCPUHour'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryGBHour = this.memoryGBHour;
    final storageGBHour = this.storageGBHour;
    final vCPUHour = this.vCPUHour;
    return {
      if (memoryGBHour != null) 'memoryGBHour': memoryGBHour,
      if (storageGBHour != null) 'storageGBHour': storageGBHour,
      if (vCPUHour != null) 'vCPUHour': vCPUHour,
    };
  }
}

/// The retry policy to use for a job run.
class RetryPolicy {
  /// Maximum number of attempts for the job run. This parameter is only
  /// applicable for <code>BATCH</code> mode.
  final int? maxAttempts;

  /// Maximum number of failed attempts per hour. This [arameter is only
  /// applicable for <code>STREAMING</code> mode.
  final int? maxFailedAttemptsPerHour;

  RetryPolicy({
    this.maxAttempts,
    this.maxFailedAttemptsPerHour,
  });

  factory RetryPolicy.fromJson(Map<String, dynamic> json) {
    return RetryPolicy(
      maxAttempts: json['maxAttempts'] as int?,
      maxFailedAttemptsPerHour: json['maxFailedAttemptsPerHour'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxAttempts = this.maxAttempts;
    final maxFailedAttemptsPerHour = this.maxFailedAttemptsPerHour;
    return {
      if (maxAttempts != null) 'maxAttempts': maxAttempts,
      if (maxFailedAttemptsPerHour != null)
        'maxFailedAttemptsPerHour': maxFailedAttemptsPerHour,
    };
  }
}

/// The Amazon S3 configuration for monitoring log publishing. You can configure
/// your jobs to send log information to Amazon S3.
class S3MonitoringConfiguration {
  /// The KMS key ARN to encrypt the logs published to the given Amazon S3
  /// destination.
  final String? encryptionKeyArn;

  /// The Amazon S3 destination URI for log publishing.
  final String? logUri;

  S3MonitoringConfiguration({
    this.encryptionKeyArn,
    this.logUri,
  });

  factory S3MonitoringConfiguration.fromJson(Map<String, dynamic> json) {
    return S3MonitoringConfiguration(
      encryptionKeyArn: json['encryptionKeyArn'] as String?,
      logUri: json['logUri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final encryptionKeyArn = this.encryptionKeyArn;
    final logUri = this.logUri;
    return {
      if (encryptionKeyArn != null) 'encryptionKeyArn': encryptionKeyArn,
      if (logUri != null) 'logUri': logUri,
    };
  }
}

/// The configurations for the Spark submit job driver.
class SparkSubmit {
  /// The entry point for the Spark submit job run.
  final String entryPoint;

  /// The arguments for the Spark submit job run.
  final List<String>? entryPointArguments;

  /// The parameters for the Spark submit job run.
  final String? sparkSubmitParameters;

  SparkSubmit({
    required this.entryPoint,
    this.entryPointArguments,
    this.sparkSubmitParameters,
  });

  factory SparkSubmit.fromJson(Map<String, dynamic> json) {
    return SparkSubmit(
      entryPoint: json['entryPoint'] as String,
      entryPointArguments: (json['entryPointArguments'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sparkSubmitParameters: json['sparkSubmitParameters'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final entryPoint = this.entryPoint;
    final entryPointArguments = this.entryPointArguments;
    final sparkSubmitParameters = this.sparkSubmitParameters;
    return {
      'entryPoint': entryPoint,
      if (entryPointArguments != null)
        'entryPointArguments': entryPointArguments,
      if (sparkSubmitParameters != null)
        'sparkSubmitParameters': sparkSubmitParameters,
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

class StartJobRunResponse {
  /// This output displays the application ID on which the job run was submitted.
  final String applicationId;

  /// This output displays the ARN of the job run..
  final String arn;

  /// The output contains the ID of the started job run.
  final String jobRunId;

  StartJobRunResponse({
    required this.applicationId,
    required this.arn,
    required this.jobRunId,
  });

  factory StartJobRunResponse.fromJson(Map<String, dynamic> json) {
    return StartJobRunResponse(
      applicationId: json['applicationId'] as String,
      arn: json['arn'] as String,
      jobRunId: json['jobRunId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationId = this.applicationId;
    final arn = this.arn;
    final jobRunId = this.jobRunId;
    return {
      'applicationId': applicationId,
      'arn': arn,
      'jobRunId': jobRunId,
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

class TagResourceResponse {
  TagResourceResponse();

  factory TagResourceResponse.fromJson(Map<String, dynamic> _) {
    return TagResourceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// The aggregate vCPU, memory, and storage resources used from the time job
/// start executing till the time job is terminated, rounded up to the nearest
/// second.
class TotalResourceUtilization {
  /// The aggregated memory used per hour from the time job start executing till
  /// the time job is terminated.
  final double? memoryGBHour;

  /// The aggregated storage used per hour from the time job start executing till
  /// the time job is terminated.
  final double? storageGBHour;

  /// The aggregated vCPU used per hour from the time job start executing till the
  /// time job is terminated.
  final double? vCPUHour;

  TotalResourceUtilization({
    this.memoryGBHour,
    this.storageGBHour,
    this.vCPUHour,
  });

  factory TotalResourceUtilization.fromJson(Map<String, dynamic> json) {
    return TotalResourceUtilization(
      memoryGBHour: json['memoryGBHour'] as double?,
      storageGBHour: json['storageGBHour'] as double?,
      vCPUHour: json['vCPUHour'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final memoryGBHour = this.memoryGBHour;
    final storageGBHour = this.storageGBHour;
    final vCPUHour = this.vCPUHour;
    return {
      if (memoryGBHour != null) 'memoryGBHour': memoryGBHour,
      if (storageGBHour != null) 'storageGBHour': storageGBHour,
      if (vCPUHour != null) 'vCPUHour': vCPUHour,
    };
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
  /// Information about the updated application.
  final Application application;

  UpdateApplicationResponse({
    required this.application,
  });

  factory UpdateApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateApplicationResponse(
      application:
          Application.fromJson(json['application'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    return {
      'application': application,
    };
  }
}

/// The cumulative configuration requirements for every worker instance of the
/// worker type.
class WorkerResourceConfig {
  /// The CPU requirements for every worker instance of the worker type.
  final String cpu;

  /// The memory requirements for every worker instance of the worker type.
  final String memory;

  /// The disk requirements for every worker instance of the worker type.
  final String? disk;

  /// The disk type for every worker instance of the work type. Shuffle optimized
  /// disks have higher performance characteristics and are better for shuffle
  /// heavy workloads. Default is <code>STANDARD</code>.
  final String? diskType;

  WorkerResourceConfig({
    required this.cpu,
    required this.memory,
    this.disk,
    this.diskType,
  });

  factory WorkerResourceConfig.fromJson(Map<String, dynamic> json) {
    return WorkerResourceConfig(
      cpu: json['cpu'] as String,
      memory: json['memory'] as String,
      disk: json['disk'] as String?,
      diskType: json['diskType'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpu = this.cpu;
    final memory = this.memory;
    final disk = this.disk;
    final diskType = this.diskType;
    return {
      'cpu': cpu,
      'memory': memory,
      if (disk != null) 'disk': disk,
      if (diskType != null) 'diskType': diskType,
    };
  }
}

/// The specifications for a worker type.
class WorkerTypeSpecification {
  /// The image configuration for a worker type.
  final ImageConfiguration? imageConfiguration;

  WorkerTypeSpecification({
    this.imageConfiguration,
  });

  factory WorkerTypeSpecification.fromJson(Map<String, dynamic> json) {
    return WorkerTypeSpecification(
      imageConfiguration: json['imageConfiguration'] != null
          ? ImageConfiguration.fromJson(
              json['imageConfiguration'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final imageConfiguration = this.imageConfiguration;
    return {
      if (imageConfiguration != null) 'imageConfiguration': imageConfiguration,
    };
  }
}

/// The specifications for a worker type.
class WorkerTypeSpecificationInput {
  /// The image configuration for a worker type.
  final ImageConfigurationInput? imageConfiguration;

  WorkerTypeSpecificationInput({
    this.imageConfiguration,
  });

  Map<String, dynamic> toJson() {
    final imageConfiguration = this.imageConfiguration;
    return {
      if (imageConfiguration != null) 'imageConfiguration': imageConfiguration,
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

class ServiceQuotaExceededException extends _s.GenericAwsException {
  ServiceQuotaExceededException({String? type, String? message})
      : super(
            type: type,
            code: 'ServiceQuotaExceededException',
            message: message);
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
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
