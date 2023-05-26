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

/// This section provides documentation for the AWS RoboMaker API operations.
class RoboMaker {
  final _s.RestJsonProtocol _protocol;
  RoboMaker({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'robomaker',
            signingName: 'robomaker',
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

  /// Deletes one or more worlds in a batch operation.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [worlds] :
  /// A list of Amazon Resource Names (arns) that correspond to worlds to
  /// delete.
  Future<BatchDeleteWorldsResponse> batchDeleteWorlds({
    required List<String> worlds,
  }) async {
    final $payload = <String, dynamic>{
      'worlds': worlds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/batchDeleteWorlds',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDeleteWorldsResponse.fromJson(response);
  }

  /// Describes one or more simulation jobs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [jobs] :
  /// A list of Amazon Resource Names (ARNs) of simulation jobs to describe.
  Future<BatchDescribeSimulationJobResponse> batchDescribeSimulationJob({
    required List<String> jobs,
  }) async {
    final $payload = <String, dynamic>{
      'jobs': jobs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/batchDescribeSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
    return BatchDescribeSimulationJobResponse.fromJson(response);
  }

  /// Cancels the specified deployment job.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The deployment job ARN to cancel.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<void> cancelDeploymentJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelDeploymentJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels the specified simulation job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The simulation job ARN to cancel.
  Future<void> cancelSimulationJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels a simulation job batch. When you cancel a simulation job batch,
  /// you are also cancelling all of the active simulation jobs created as part
  /// of the batch.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [batch] :
  /// The id of the batch to cancel.
  Future<void> cancelSimulationJobBatch({
    required String batch,
  }) async {
    final $payload = <String, dynamic>{
      'batch': batch,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelSimulationJobBatch',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels the specified export job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (arn) of the world export job to cancel.
  Future<void> cancelWorldExportJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelWorldExportJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Cancels the specified world generator job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (arn) of the world generator job to cancel.
  Future<void> cancelWorldGenerationJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelWorldGenerationJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deploys a specific version of a robot application to robots in a fleet.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  /// The robot application must have a numbered <code>applicationVersion</code>
  /// for consistency reasons. To create a new version, use
  /// <code>CreateRobotApplicationVersion</code> or see <a
  /// href="https://docs.aws.amazon.com/robomaker/latest/dg/create-robot-application-version.html">Creating
  /// a Robot Application Version</a>.
  /// <note>
  /// After 90 days, deployment jobs expire and will be deleted. They will no
  /// longer be accessible.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentDeploymentException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [deploymentApplicationConfigs] :
  /// The deployment application configuration.
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet to deploy.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [deploymentConfig] :
  /// The requested deployment configuration.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// deployment job.
  @Deprecated(
      'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<CreateDeploymentJobResponse> createDeploymentJob({
    required List<DeploymentApplicationConfig> deploymentApplicationConfigs,
    required String fleet,
    String? clientRequestToken,
    DeploymentConfig? deploymentConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'deploymentApplicationConfigs': deploymentApplicationConfigs,
      'fleet': fleet,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (deploymentConfig != null) 'deploymentConfig': deploymentConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createDeploymentJob',
      exceptionFnMap: _exceptionFns,
    );
    return CreateDeploymentJobResponse.fromJson(response);
  }

  /// Creates a fleet, a logical group of robots running the same robot
  /// application.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  ///
  /// Parameter [name] :
  /// The name of the fleet.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// fleet.
  @Deprecated(
      'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<CreateFleetResponse> createFleet({
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createFleet',
      exceptionFnMap: _exceptionFns,
    );
    return CreateFleetResponse.fromJson(response);
  }

  /// Creates a robot.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceAlreadyExistsException].
  ///
  /// Parameter [architecture] :
  /// The target architecture of the robot.
  ///
  /// Parameter [greengrassGroupId] :
  /// The Greengrass group id.
  ///
  /// Parameter [name] :
  /// The name for the robot.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// robot.
  @Deprecated(
      'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<CreateRobotResponse> createRobot({
    required Architecture architecture,
    required String greengrassGroupId,
    required String name,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'architecture': architecture.toValue(),
      'greengrassGroupId': greengrassGroupId,
      'name': name,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createRobot',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRobotResponse.fromJson(response);
  }

  /// Creates a robot application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [name] :
  /// The name of the robot application.
  ///
  /// Parameter [robotSoftwareSuite] :
  /// The robot software suite (ROS distribuition) used by the robot
  /// application.
  ///
  /// Parameter [environment] :
  /// The object that contains that URI of the Docker image that you use for
  /// your robot application.
  ///
  /// Parameter [sources] :
  /// The sources of the robot application.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the robot
  /// application.
  Future<CreateRobotApplicationResponse> createRobotApplication({
    required String name,
    required RobotSoftwareSuite robotSoftwareSuite,
    Environment? environment,
    List<SourceConfig>? sources,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'robotSoftwareSuite': robotSoftwareSuite,
      if (environment != null) 'environment': environment,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createRobotApplication',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRobotApplicationResponse.fromJson(response);
  }

  /// Creates a version of a robot application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The application information for the robot application.
  ///
  /// Parameter [currentRevisionId] :
  /// The current revision id for the robot application. If you provide a value
  /// and it matches the latest revision ID, a new version will be created.
  ///
  /// Parameter [imageDigest] :
  /// A SHA256 identifier for the Docker image that you use for your robot
  /// application.
  ///
  /// Parameter [s3Etags] :
  /// The Amazon S3 identifier for the zip file bundle that you use for your
  /// robot application.
  Future<CreateRobotApplicationVersionResponse> createRobotApplicationVersion({
    required String application,
    String? currentRevisionId,
    String? imageDigest,
    List<String>? s3Etags,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (s3Etags != null) 's3Etags': s3Etags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createRobotApplicationVersion',
      exceptionFnMap: _exceptionFns,
    );
    return CreateRobotApplicationVersionResponse.fromJson(response);
  }

  /// Creates a simulation application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [name] :
  /// The name of the simulation application.
  ///
  /// Parameter [robotSoftwareSuite] :
  /// The robot software suite (ROS distribution) used by the simulation
  /// application.
  ///
  /// Parameter [simulationSoftwareSuite] :
  /// The simulation software suite used by the simulation application.
  ///
  /// Parameter [environment] :
  /// The object that contains the Docker image URI used to create your
  /// simulation application.
  ///
  /// Parameter [renderingEngine] :
  /// The rendering engine for the simulation application.
  ///
  /// Parameter [sources] :
  /// The sources of the simulation application.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// simulation application.
  Future<CreateSimulationApplicationResponse> createSimulationApplication({
    required String name,
    required RobotSoftwareSuite robotSoftwareSuite,
    required SimulationSoftwareSuite simulationSoftwareSuite,
    Environment? environment,
    RenderingEngine? renderingEngine,
    List<SourceConfig>? sources,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'robotSoftwareSuite': robotSoftwareSuite,
      'simulationSoftwareSuite': simulationSoftwareSuite,
      if (environment != null) 'environment': environment,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createSimulationApplication',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSimulationApplicationResponse.fromJson(response);
  }

  /// Creates a simulation application with a specific revision id.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The application information for the simulation application.
  ///
  /// Parameter [currentRevisionId] :
  /// The current revision id for the simulation application. If you provide a
  /// value and it matches the latest revision ID, a new version will be
  /// created.
  ///
  /// Parameter [imageDigest] :
  /// The SHA256 digest used to identify the Docker image URI used to created
  /// the simulation application.
  ///
  /// Parameter [s3Etags] :
  /// The Amazon S3 eTag identifier for the zip file bundle that you use to
  /// create the simulation application.
  Future<CreateSimulationApplicationVersionResponse>
      createSimulationApplicationVersion({
    required String application,
    String? currentRevisionId,
    String? imageDigest,
    List<String>? s3Etags,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (s3Etags != null) 's3Etags': s3Etags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createSimulationApplicationVersion',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSimulationApplicationVersionResponse.fromJson(response);
  }

  /// Creates a simulation job.
  /// <note>
  /// After 90 days, simulation jobs expire and will be deleted. They will no
  /// longer be accessible.
  /// </note>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [iamRole] :
  /// The IAM role name that allows the simulation instance to call the AWS APIs
  /// that are specified in its associated policies on your behalf. This is how
  /// credentials are passed in to your simulation job.
  ///
  /// Parameter [maxJobDurationInSeconds] :
  /// The maximum simulation job duration in seconds (up to 14 days or 1,209,600
  /// seconds. When <code>maxJobDurationInSeconds</code> is reached, the
  /// simulation job will status will transition to <code>Completed</code>.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [compute] :
  /// Compute information for the simulation job.
  ///
  /// Parameter [dataSources] :
  /// Specify data sources to mount read-only files from S3 into your
  /// simulation. These files are available under
  /// <code>/opt/robomaker/datasources/data_source_name</code>.
  /// <note>
  /// There is a limit of 100 files and a combined size of 25GB for all
  /// <code>DataSourceConfig</code> objects.
  /// </note>
  ///
  /// Parameter [failureBehavior] :
  /// The failure behavior the simulation job.
  /// <dl> <dt>Continue</dt> <dd>
  /// Leaves the instance running for its maximum timeout duration after a
  /// <code>4XX</code> error code.
  /// </dd> <dt>Fail</dt> <dd>
  /// Stop the simulation job and terminate the instance.
  /// </dd> </dl>
  ///
  /// Parameter [loggingConfig] :
  /// The logging configuration.
  ///
  /// Parameter [outputLocation] :
  /// Location for output files generated by the simulation job.
  ///
  /// Parameter [robotApplications] :
  /// The robot application to use in the simulation job.
  ///
  /// Parameter [simulationApplications] :
  /// The simulation application to use in the simulation job.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job.
  ///
  /// Parameter [vpcConfig] :
  /// If your simulation job accesses resources in a VPC, you provide this
  /// parameter identifying the list of security group IDs and subnet IDs. These
  /// must belong to the same VPC. You must provide at least one security group
  /// and one subnet ID.
  Future<CreateSimulationJobResponse> createSimulationJob({
    required String iamRole,
    required int maxJobDurationInSeconds,
    String? clientRequestToken,
    Compute? compute,
    List<DataSourceConfig>? dataSources,
    FailureBehavior? failureBehavior,
    LoggingConfig? loggingConfig,
    OutputLocation? outputLocation,
    List<RobotApplicationConfig>? robotApplications,
    List<SimulationApplicationConfig>? simulationApplications,
    Map<String, String>? tags,
    VPCConfig? vpcConfig,
  }) async {
    final $payload = <String, dynamic>{
      'iamRole': iamRole,
      'maxJobDurationInSeconds': maxJobDurationInSeconds,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (compute != null) 'compute': compute,
      if (dataSources != null) 'dataSources': dataSources,
      if (failureBehavior != null) 'failureBehavior': failureBehavior.toValue(),
      if (loggingConfig != null) 'loggingConfig': loggingConfig,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (robotApplications != null) 'robotApplications': robotApplications,
      if (simulationApplications != null)
        'simulationApplications': simulationApplications,
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
    return CreateSimulationJobResponse.fromJson(response);
  }

  /// Creates a world export job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [iamRole] :
  /// The IAM role that the world export process uses to access the Amazon S3
  /// bucket and put the export.
  ///
  /// Parameter [worlds] :
  /// A list of Amazon Resource Names (arns) that correspond to worlds to
  /// export.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the world
  /// export job.
  Future<CreateWorldExportJobResponse> createWorldExportJob({
    required String iamRole,
    required OutputLocation outputLocation,
    required List<String> worlds,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'iamRole': iamRole,
      'outputLocation': outputLocation,
      'worlds': worlds,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createWorldExportJob',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorldExportJobResponse.fromJson(response);
  }

  /// Creates worlds using the specified template.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [ServiceUnavailableException].
  ///
  /// Parameter [template] :
  /// The Amazon Resource Name (arn) of the world template describing the worlds
  /// you want to create.
  ///
  /// Parameter [worldCount] :
  /// Information about the world count.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the world
  /// generator job.
  ///
  /// Parameter [worldTags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// generated worlds.
  Future<CreateWorldGenerationJobResponse> createWorldGenerationJob({
    required String template,
    required WorldCount worldCount,
    String? clientRequestToken,
    Map<String, String>? tags,
    Map<String, String>? worldTags,
  }) async {
    final $payload = <String, dynamic>{
      'template': template,
      'worldCount': worldCount,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
      if (worldTags != null) 'worldTags': worldTags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createWorldGenerationJob',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorldGenerationJobResponse.fromJson(response);
  }

  /// Creates a world template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceAlreadyExistsException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [name] :
  /// The name of the world template.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the world
  /// template.
  ///
  /// Parameter [templateBody] :
  /// The world template body.
  ///
  /// Parameter [templateLocation] :
  /// The location of the world template.
  Future<CreateWorldTemplateResponse> createWorldTemplate({
    String? clientRequestToken,
    String? name,
    Map<String, String>? tags,
    String? templateBody,
    TemplateLocation? templateLocation,
  }) async {
    final $payload = <String, dynamic>{
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (templateBody != null) 'templateBody': templateBody,
      if (templateLocation != null) 'templateLocation': templateLocation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/createWorldTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorldTemplateResponse.fromJson(response);
  }

  /// Deletes a fleet.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<void> deleteFleet({
    required String fleet,
  }) async {
    final $payload = <String, dynamic>{
      'fleet': fleet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteFleet',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a robot.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [robot] :
  /// The Amazon Resource Name (ARN) of the robot.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<void> deleteRobot({
    required String robot,
  }) async {
    final $payload = <String, dynamic>{
      'robot': robot,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteRobot',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a robot application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The Amazon Resource Name (ARN) of the the robot application.
  ///
  /// Parameter [applicationVersion] :
  /// The version of the robot application to delete.
  Future<void> deleteRobotApplication({
    required String application,
    String? applicationVersion,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      if (applicationVersion != null) 'applicationVersion': applicationVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteRobotApplication',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a simulation application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The application information for the simulation application to delete.
  ///
  /// Parameter [applicationVersion] :
  /// The version of the simulation application to delete.
  Future<void> deleteSimulationApplication({
    required String application,
    String? applicationVersion,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      if (applicationVersion != null) 'applicationVersion': applicationVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteSimulationApplication',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a world template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [template] :
  /// The Amazon Resource Name (arn) of the world template you want to delete.
  Future<void> deleteWorldTemplate({
    required String template,
  }) async {
    final $payload = <String, dynamic>{
      'template': template,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteWorldTemplate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deregisters a robot.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet.
  ///
  /// Parameter [robot] :
  /// The Amazon Resource Name (ARN) of the robot.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<DeregisterRobotResponse> deregisterRobot({
    required String fleet,
    required String robot,
  }) async {
    final $payload = <String, dynamic>{
      'fleet': fleet,
      'robot': robot,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deregisterRobot',
      exceptionFnMap: _exceptionFns,
    );
    return DeregisterRobotResponse.fromJson(response);
  }

  /// Describes a deployment job.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (ARN) of the deployment job.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<DescribeDeploymentJobResponse> describeDeploymentJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeDeploymentJob',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeDeploymentJobResponse.fromJson(response);
  }

  /// Describes a fleet.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<DescribeFleetResponse> describeFleet({
    required String fleet,
  }) async {
    final $payload = <String, dynamic>{
      'fleet': fleet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeFleet',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeFleetResponse.fromJson(response);
  }

  /// Describes a robot.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [robot] :
  /// The Amazon Resource Name (ARN) of the robot to be described.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<DescribeRobotResponse> describeRobot({
    required String robot,
  }) async {
    final $payload = <String, dynamic>{
      'robot': robot,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeRobot',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRobotResponse.fromJson(response);
  }

  /// Describes a robot application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The Amazon Resource Name (ARN) of the robot application.
  ///
  /// Parameter [applicationVersion] :
  /// The version of the robot application to describe.
  Future<DescribeRobotApplicationResponse> describeRobotApplication({
    required String application,
    String? applicationVersion,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      if (applicationVersion != null) 'applicationVersion': applicationVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeRobotApplication',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRobotApplicationResponse.fromJson(response);
  }

  /// Describes a simulation application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The application information for the simulation application.
  ///
  /// Parameter [applicationVersion] :
  /// The version of the simulation application to describe.
  Future<DescribeSimulationApplicationResponse> describeSimulationApplication({
    required String application,
    String? applicationVersion,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      if (applicationVersion != null) 'applicationVersion': applicationVersion,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeSimulationApplication',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSimulationApplicationResponse.fromJson(response);
  }

  /// Describes a simulation job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (ARN) of the simulation job to be described.
  Future<DescribeSimulationJobResponse> describeSimulationJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSimulationJobResponse.fromJson(response);
  }

  /// Describes a simulation job batch.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [batch] :
  /// The id of the batch to describe.
  Future<DescribeSimulationJobBatchResponse> describeSimulationJobBatch({
    required String batch,
  }) async {
    final $payload = <String, dynamic>{
      'batch': batch,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeSimulationJobBatch',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSimulationJobBatchResponse.fromJson(response);
  }

  /// Describes a world.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [world] :
  /// The Amazon Resource Name (arn) of the world you want to describe.
  Future<DescribeWorldResponse> describeWorld({
    required String world,
  }) async {
    final $payload = <String, dynamic>{
      'world': world,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeWorld',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorldResponse.fromJson(response);
  }

  /// Describes a world export job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (arn) of the world export job to describe.
  Future<DescribeWorldExportJobResponse> describeWorldExportJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeWorldExportJob',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorldExportJobResponse.fromJson(response);
  }

  /// Describes a world generation job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (arn) of the world generation job to describe.
  Future<DescribeWorldGenerationJobResponse> describeWorldGenerationJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeWorldGenerationJob',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorldGenerationJobResponse.fromJson(response);
  }

  /// Describes a world template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [template] :
  /// The Amazon Resource Name (arn) of the world template you want to describe.
  Future<DescribeWorldTemplateResponse> describeWorldTemplate({
    required String template,
  }) async {
    final $payload = <String, dynamic>{
      'template': template,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/describeWorldTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeWorldTemplateResponse.fromJson(response);
  }

  /// Gets the world template body.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [generationJob] :
  /// The Amazon Resource Name (arn) of the world generator job.
  ///
  /// Parameter [template] :
  /// The Amazon Resource Name (arn) of the world template.
  Future<GetWorldTemplateBodyResponse> getWorldTemplateBody({
    String? generationJob,
    String? template,
  }) async {
    final $payload = <String, dynamic>{
      if (generationJob != null) 'generationJob': generationJob,
      if (template != null) 'template': template,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/getWorldTemplateBody',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorldTemplateBodyResponse.fromJson(response);
  }

  /// Returns a list of deployment jobs for a fleet. You can optionally provide
  /// filters to retrieve specific deployment jobs.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results.
  ///
  /// The filter names <code>status</code> and <code>fleetName</code> are
  /// supported. When filtering, you must use the complete value of the filtered
  /// item. You can use up to three filters, but they must be for the same named
  /// item. For example, if you are looking for items with the status
  /// <code>InProgress</code> or the status <code>Pending</code>.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListDeploymentJobs</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListDeploymentJobs</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 200. If this
  /// parameter is not used, then <code>ListDeploymentJobs</code> returns up to
  /// 200 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListDeploymentJobs</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to
  /// null.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<ListDeploymentJobsResponse> listDeploymentJobs({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listDeploymentJobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListDeploymentJobsResponse.fromJson(response);
  }

  /// Returns a list of fleets. You can optionally provide filters to retrieve
  /// specific fleets.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results.
  ///
  /// The filter name <code>name</code> is supported. When filtering, you must
  /// use the complete value of the filtered item. You can use up to three
  /// filters.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListFleets</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListFleets</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 200. If this parameter is not used, then
  /// <code>ListFleets</code> returns up to 200 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListFleets</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to
  /// null.
  /// <note>
  /// This token should be treated as an opaque identifier that is only used to
  /// retrieve the next items in a list and not for other programmatic purposes.
  /// </note>
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<ListFleetsResponse> listFleets({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listFleets',
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetsResponse.fromJson(response);
  }

  /// Returns a list of robot application. You can optionally provide filters to
  /// retrieve specific robot applications.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results.
  ///
  /// The filter name <code>name</code> is supported. When filtering, you must
  /// use the complete value of the filtered item. You can use up to three
  /// filters.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListRobotApplications</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListRobotApplications</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListRobotApplications</code> returns up
  /// to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListRobotApplications</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is
  /// set to null.
  ///
  /// Parameter [versionQualifier] :
  /// The version qualifier of the robot application.
  Future<ListRobotApplicationsResponse> listRobotApplications({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? versionQualifier,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (versionQualifier != null) 'versionQualifier': versionQualifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listRobotApplications',
      exceptionFnMap: _exceptionFns,
    );
    return ListRobotApplicationsResponse.fromJson(response);
  }

  /// Returns a list of robots. You can optionally provide filters to retrieve
  /// specific robots.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results.
  ///
  /// The filter names <code>status</code> and <code>fleetName</code> are
  /// supported. When filtering, you must use the complete value of the filtered
  /// item. You can use up to three filters, but they must be for the same named
  /// item. For example, if you are looking for items with the status
  /// <code>Registered</code> or the status <code>Available</code>.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListRobots</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListRobots</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 200. If this parameter is not used, then
  /// <code>ListRobots</code> returns up to 200 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListRobots</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to
  /// null.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<ListRobotsResponse> listRobots({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listRobots',
      exceptionFnMap: _exceptionFns,
    );
    return ListRobotsResponse.fromJson(response);
  }

  /// Returns a list of simulation applications. You can optionally provide
  /// filters to retrieve specific simulation applications.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// Optional list of filters to limit results.
  ///
  /// The filter name <code>name</code> is supported. When filtering, you must
  /// use the complete value of the filtered item. You can use up to three
  /// filters.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListSimulationApplications</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListSimulationApplications</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListSimulationApplications</code>
  /// returns up to 100 results and a <code>nextToken</code> value if
  /// applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListSimulationApplications</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is
  /// set to null.
  ///
  /// Parameter [versionQualifier] :
  /// The version qualifier of the simulation application.
  Future<ListSimulationApplicationsResponse> listSimulationApplications({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
    String? versionQualifier,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (versionQualifier != null) 'versionQualifier': versionQualifier,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listSimulationApplications',
      exceptionFnMap: _exceptionFns,
    );
    return ListSimulationApplicationsResponse.fromJson(response);
  }

  /// Returns a list simulation job batches. You can optionally provide filters
  /// to retrieve specific simulation batch jobs.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListSimulationJobBatches</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListSimulationJobBatches</code> request with the returned
  /// <code>nextToken</code> value.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListSimulationJobBatches</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is
  /// set to null.
  Future<ListSimulationJobBatchesResponse> listSimulationJobBatches({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listSimulationJobBatches',
      exceptionFnMap: _exceptionFns,
    );
    return ListSimulationJobBatchesResponse.fromJson(response);
  }

  /// Returns a list of simulation jobs. You can optionally provide filters to
  /// retrieve specific simulation jobs.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results.
  ///
  /// The filter names <code>status</code> and
  /// <code>simulationApplicationName</code> and
  /// <code>robotApplicationName</code> are supported. When filtering, you must
  /// use the complete value of the filtered item. You can use up to three
  /// filters, but they must be for the same named item. For example, if you are
  /// looking for items with the status <code>Preparing</code> or the status
  /// <code>Running</code>.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListSimulationJobs</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListSimulationJobs</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 1000. If
  /// this parameter is not used, then <code>ListSimulationJobs</code> returns
  /// up to 1000 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListSimulationJobs</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to
  /// null.
  Future<ListSimulationJobsResponse> listSimulationJobs({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listSimulationJobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListSimulationJobsResponse.fromJson(response);
  }

  /// Lists all tags on a AWS RoboMaker resource.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The AWS RoboMaker Amazon Resource Name (ARN) with tags to be listed.
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

  /// Lists world export jobs.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results. You can use
  /// <code>generationJobId</code> and <code>templateId</code>.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListWorldExportJobs</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListWorldExportJobs</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListWorldExportJobs</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListWorldExportJobs</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is
  /// set to null.
  Future<ListWorldExportJobsResponse> listWorldExportJobs({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWorldExportJobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorldExportJobsResponse.fromJson(response);
  }

  /// Lists world generator jobs.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results. You can use <code>status</code> and
  /// <code>templateId</code>.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListWorldGeneratorJobs</code> only
  /// returns <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListWorldGeneratorJobs</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListWorldGeneratorJobs</code> returns up
  /// to 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListWorldGenerationJobsRequest</code> again and assign that token to
  /// the request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is
  /// set to null.
  Future<ListWorldGenerationJobsResponse> listWorldGenerationJobs({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWorldGenerationJobs',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorldGenerationJobsResponse.fromJson(response);
  }

  /// Lists world templates.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListWorldTemplates</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another
  /// <code>ListWorldTemplates</code> request with the returned
  /// <code>nextToken</code> value. This value can be between 1 and 100. If this
  /// parameter is not used, then <code>ListWorldTemplates</code> returns up to
  /// 100 results and a <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListWorldTemplates</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to
  /// null.
  Future<ListWorldTemplatesResponse> listWorldTemplates({
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWorldTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorldTemplatesResponse.fromJson(response);
  }

  /// Lists worlds.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [filters] :
  /// Optional filters to limit results. You can use <code>status</code>.
  ///
  /// Parameter [maxResults] :
  /// When this parameter is used, <code>ListWorlds</code> only returns
  /// <code>maxResults</code> results in a single page along with a
  /// <code>nextToken</code> response element. The remaining results of the
  /// initial request can be seen by sending another <code>ListWorlds</code>
  /// request with the returned <code>nextToken</code> value. This value can be
  /// between 1 and 100. If this parameter is not used, then
  /// <code>ListWorlds</code> returns up to 100 results and a
  /// <code>nextToken</code> value if applicable.
  ///
  /// Parameter [nextToken] :
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is
  /// set to a token. To retrieve the next set of results, call
  /// <code>ListWorlds</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to
  /// null.
  Future<ListWorldsResponse> listWorlds({
    List<Filter>? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/listWorlds',
      exceptionFnMap: _exceptionFns,
    );
    return ListWorldsResponse.fromJson(response);
  }

  /// Registers a robot with a fleet.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet.
  ///
  /// Parameter [robot] :
  /// The Amazon Resource Name (ARN) of the robot.
  @Deprecated(
      'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<RegisterRobotResponse> registerRobot({
    required String fleet,
    required String robot,
  }) async {
    final $payload = <String, dynamic>{
      'fleet': fleet,
      'robot': robot,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/registerRobot',
      exceptionFnMap: _exceptionFns,
    );
    return RegisterRobotResponse.fromJson(response);
  }

  /// Restarts a running simulation job.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (ARN) of the simulation job.
  Future<void> restartSimulationJob({
    required String job,
  }) async {
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restartSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Starts a new simulation job batch. The batch is defined using one or more
  /// <code>SimulationJobRequest</code> objects.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [IdempotentParameterMismatchException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [createSimulationJobRequests] :
  /// A list of simulation job requests to create in the batch.
  ///
  /// Parameter [batchPolicy] :
  /// The batch policy.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// deployment job batch.
  Future<StartSimulationJobBatchResponse> startSimulationJobBatch({
    required List<SimulationJobRequest> createSimulationJobRequests,
    BatchPolicy? batchPolicy,
    String? clientRequestToken,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'createSimulationJobRequests': createSimulationJobRequests,
      if (batchPolicy != null) 'batchPolicy': batchPolicy,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/startSimulationJobBatch',
      exceptionFnMap: _exceptionFns,
    );
    return StartSimulationJobBatchResponse.fromJson(response);
  }

  /// Syncrhonizes robots in a fleet to the latest deployment. This is helpful
  /// if robots were added after a deployment.
  /// <important>
  /// This API will no longer be supported as of May 2, 2022. Use it to remove
  /// resources that were created for Deployment Service.
  /// </important>
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentDeploymentException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [fleet] :
  /// The target fleet for the synchronization.
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  @Deprecated(
      'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
  Future<SyncDeploymentJobResponse> syncDeploymentJob({
    required String fleet,
    String? clientRequestToken,
  }) async {
    final $payload = <String, dynamic>{
      'fleet': fleet,
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/syncDeploymentJob',
      exceptionFnMap: _exceptionFns,
    );
    return SyncDeploymentJobResponse.fromJson(response);
  }

  /// Adds or edits tags for a AWS RoboMaker resource.
  ///
  /// Each tag consists of a tag key and a tag value. Tag keys and tag values
  /// are both required, but tag values can be empty strings.
  ///
  /// For information about the rules that apply to tag keys and tag values, see
  /// <a
  /// href="https://docs.aws.amazon.com/awsaccountbilling/latest/aboutv2/allocation-tag-restrictions.html">User-Defined
  /// Tag Restrictions</a> in the <i>AWS Billing and Cost Management User
  /// Guide</i>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS RoboMaker resource you are
  /// tagging.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// resource.
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

  /// Removes the specified tags from the specified AWS RoboMaker resource.
  ///
  /// To remove a tag, specify the tag key. To change the tag value of an
  /// existing tag key, use <a
  /// href="https://docs.aws.amazon.com/robomaker/latest/dg/API_TagResource.html">
  /// <code>TagResource</code> </a>.
  ///
  /// May throw [InternalServerException].
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [resourceArn] :
  /// The Amazon Resource Name (ARN) of the AWS RoboMaker resource you are
  /// removing tags.
  ///
  /// Parameter [tagKeys] :
  /// A map that contains tag keys and tag values that will be unattached from
  /// the resource.
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

  /// Updates a robot application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The application information for the robot application.
  ///
  /// Parameter [robotSoftwareSuite] :
  /// The robot software suite (ROS distribution) used by the robot application.
  ///
  /// Parameter [currentRevisionId] :
  /// The revision id for the robot application.
  ///
  /// Parameter [environment] :
  /// The object that contains the Docker image URI for your robot application.
  ///
  /// Parameter [sources] :
  /// The sources of the robot application.
  Future<UpdateRobotApplicationResponse> updateRobotApplication({
    required String application,
    required RobotSoftwareSuite robotSoftwareSuite,
    String? currentRevisionId,
    Environment? environment,
    List<SourceConfig>? sources,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      'robotSoftwareSuite': robotSoftwareSuite,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
      if (environment != null) 'environment': environment,
      if (sources != null) 'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateRobotApplication',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateRobotApplicationResponse.fromJson(response);
  }

  /// Updates a simulation application.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [LimitExceededException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [application] :
  /// The application information for the simulation application.
  ///
  /// Parameter [robotSoftwareSuite] :
  /// Information about the robot software suite (ROS distribution).
  ///
  /// Parameter [simulationSoftwareSuite] :
  /// The simulation software suite used by the simulation application.
  ///
  /// Parameter [currentRevisionId] :
  /// The revision id for the robot application.
  ///
  /// Parameter [environment] :
  /// The object that contains the Docker image URI for your simulation
  /// application.
  ///
  /// Parameter [renderingEngine] :
  /// The rendering engine for the simulation application.
  ///
  /// Parameter [sources] :
  /// The sources of the simulation application.
  Future<UpdateSimulationApplicationResponse> updateSimulationApplication({
    required String application,
    required RobotSoftwareSuite robotSoftwareSuite,
    required SimulationSoftwareSuite simulationSoftwareSuite,
    String? currentRevisionId,
    Environment? environment,
    RenderingEngine? renderingEngine,
    List<SourceConfig>? sources,
  }) async {
    final $payload = <String, dynamic>{
      'application': application,
      'robotSoftwareSuite': robotSoftwareSuite,
      'simulationSoftwareSuite': simulationSoftwareSuite,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
      if (environment != null) 'environment': environment,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
      if (sources != null) 'sources': sources,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateSimulationApplication',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateSimulationApplicationResponse.fromJson(response);
  }

  /// Updates a world template.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [template] :
  /// The Amazon Resource Name (arn) of the world template to update.
  ///
  /// Parameter [name] :
  /// The name of the template.
  ///
  /// Parameter [templateBody] :
  /// The world template body.
  ///
  /// Parameter [templateLocation] :
  /// The location of the world template.
  Future<UpdateWorldTemplateResponse> updateWorldTemplate({
    required String template,
    String? name,
    String? templateBody,
    TemplateLocation? templateLocation,
  }) async {
    final $payload = <String, dynamic>{
      'template': template,
      if (name != null) 'name': name,
      if (templateBody != null) 'templateBody': templateBody,
      if (templateLocation != null) 'templateLocation': templateLocation,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/updateWorldTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorldTemplateResponse.fromJson(response);
  }
}

enum Architecture {
  x86_64,
  arm64,
  armhf,
}

extension ArchitectureValueExtension on Architecture {
  String toValue() {
    switch (this) {
      case Architecture.x86_64:
        return 'X86_64';
      case Architecture.arm64:
        return 'ARM64';
      case Architecture.armhf:
        return 'ARMHF';
    }
  }
}

extension ArchitectureFromString on String {
  Architecture toArchitecture() {
    switch (this) {
      case 'X86_64':
        return Architecture.x86_64;
      case 'ARM64':
        return Architecture.arm64;
      case 'ARMHF':
        return Architecture.armhf;
    }
    throw Exception('$this is not known in enum Architecture');
  }
}

class BatchDeleteWorldsResponse {
  /// A list of unprocessed worlds associated with the call. These worlds were not
  /// deleted.
  final List<String>? unprocessedWorlds;

  BatchDeleteWorldsResponse({
    this.unprocessedWorlds,
  });

  factory BatchDeleteWorldsResponse.fromJson(Map<String, dynamic> json) {
    return BatchDeleteWorldsResponse(
      unprocessedWorlds: (json['unprocessedWorlds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final unprocessedWorlds = this.unprocessedWorlds;
    return {
      if (unprocessedWorlds != null) 'unprocessedWorlds': unprocessedWorlds,
    };
  }
}

class BatchDescribeSimulationJobResponse {
  /// A list of simulation jobs.
  final List<SimulationJob>? jobs;

  /// A list of unprocessed simulation job Amazon Resource Names (ARNs).
  final List<String>? unprocessedJobs;

  BatchDescribeSimulationJobResponse({
    this.jobs,
    this.unprocessedJobs,
  });

  factory BatchDescribeSimulationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return BatchDescribeSimulationJobResponse(
      jobs: (json['jobs'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      unprocessedJobs: (json['unprocessedJobs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final unprocessedJobs = this.unprocessedJobs;
    return {
      if (jobs != null) 'jobs': jobs,
      if (unprocessedJobs != null) 'unprocessedJobs': unprocessedJobs,
    };
  }
}

/// Information about the batch policy.
class BatchPolicy {
  /// The number of active simulation jobs create as part of the batch that can be
  /// in an active state at the same time.
  ///
  /// Active states include: <code>Pending</code>,<code>Preparing</code>,
  /// <code>Running</code>, <code>Restarting</code>, <code>RunningFailed</code>
  /// and <code>Terminating</code>. All other states are terminal states.
  final int? maxConcurrency;

  /// The amount of time, in seconds, to wait for the batch to complete.
  ///
  /// If a batch times out, and there are pending requests that were failing due
  /// to an internal failure (like <code>InternalServiceError</code>), they will
  /// be moved to the failed list and the batch status will be
  /// <code>Failed</code>. If the pending requests were failing for any other
  /// reason, the failed pending requests will be moved to the failed list and the
  /// batch status will be <code>TimedOut</code>.
  final int? timeoutInSeconds;

  BatchPolicy({
    this.maxConcurrency,
    this.timeoutInSeconds,
  });

  factory BatchPolicy.fromJson(Map<String, dynamic> json) {
    return BatchPolicy(
      maxConcurrency: json['maxConcurrency'] as int?,
      timeoutInSeconds: json['timeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final maxConcurrency = this.maxConcurrency;
    final timeoutInSeconds = this.timeoutInSeconds;
    return {
      if (maxConcurrency != null) 'maxConcurrency': maxConcurrency,
      if (timeoutInSeconds != null) 'timeoutInSeconds': timeoutInSeconds,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class CancelDeploymentJobResponse {
  CancelDeploymentJobResponse();

  factory CancelDeploymentJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelDeploymentJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelSimulationJobBatchResponse {
  CancelSimulationJobBatchResponse();

  factory CancelSimulationJobBatchResponse.fromJson(Map<String, dynamic> _) {
    return CancelSimulationJobBatchResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelSimulationJobResponse {
  CancelSimulationJobResponse();

  factory CancelSimulationJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelSimulationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelWorldExportJobResponse {
  CancelWorldExportJobResponse();

  factory CancelWorldExportJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelWorldExportJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CancelWorldGenerationJobResponse {
  CancelWorldGenerationJobResponse();

  factory CancelWorldGenerationJobResponse.fromJson(Map<String, dynamic> _) {
    return CancelWorldGenerationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Compute information for the simulation job.
class Compute {
  /// Compute type information for the simulation job.
  final ComputeType? computeType;

  /// Compute GPU unit limit for the simulation job. It is the same as the number
  /// of GPUs allocated to the SimulationJob.
  final int? gpuUnitLimit;

  /// The simulation unit limit. Your simulation is allocated CPU and memory
  /// proportional to the supplied simulation unit limit. A simulation unit is 1
  /// vcpu and 2GB of memory. You are only billed for the SU utilization you
  /// consume up to the maximum value provided. The default is 15.
  final int? simulationUnitLimit;

  Compute({
    this.computeType,
    this.gpuUnitLimit,
    this.simulationUnitLimit,
  });

  factory Compute.fromJson(Map<String, dynamic> json) {
    return Compute(
      computeType: (json['computeType'] as String?)?.toComputeType(),
      gpuUnitLimit: json['gpuUnitLimit'] as int?,
      simulationUnitLimit: json['simulationUnitLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeType = this.computeType;
    final gpuUnitLimit = this.gpuUnitLimit;
    final simulationUnitLimit = this.simulationUnitLimit;
    return {
      if (computeType != null) 'computeType': computeType.toValue(),
      if (gpuUnitLimit != null) 'gpuUnitLimit': gpuUnitLimit,
      if (simulationUnitLimit != null)
        'simulationUnitLimit': simulationUnitLimit,
    };
  }
}

/// Compute information for the simulation job
class ComputeResponse {
  /// Compute type response information for the simulation job.
  final ComputeType? computeType;

  /// Compute GPU unit limit for the simulation job. It is the same as the number
  /// of GPUs allocated to the SimulationJob.
  final int? gpuUnitLimit;

  /// The simulation unit limit. Your simulation is allocated CPU and memory
  /// proportional to the supplied simulation unit limit. A simulation unit is 1
  /// vcpu and 2GB of memory. You are only billed for the SU utilization you
  /// consume up to the maximum value provided. The default is 15.
  final int? simulationUnitLimit;

  ComputeResponse({
    this.computeType,
    this.gpuUnitLimit,
    this.simulationUnitLimit,
  });

  factory ComputeResponse.fromJson(Map<String, dynamic> json) {
    return ComputeResponse(
      computeType: (json['computeType'] as String?)?.toComputeType(),
      gpuUnitLimit: json['gpuUnitLimit'] as int?,
      simulationUnitLimit: json['simulationUnitLimit'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final computeType = this.computeType;
    final gpuUnitLimit = this.gpuUnitLimit;
    final simulationUnitLimit = this.simulationUnitLimit;
    return {
      if (computeType != null) 'computeType': computeType.toValue(),
      if (gpuUnitLimit != null) 'gpuUnitLimit': gpuUnitLimit,
      if (simulationUnitLimit != null)
        'simulationUnitLimit': simulationUnitLimit,
    };
  }
}

enum ComputeType {
  cpu,
  gpuAndCpu,
}

extension ComputeTypeValueExtension on ComputeType {
  String toValue() {
    switch (this) {
      case ComputeType.cpu:
        return 'CPU';
      case ComputeType.gpuAndCpu:
        return 'GPU_AND_CPU';
    }
  }
}

extension ComputeTypeFromString on String {
  ComputeType toComputeType() {
    switch (this) {
      case 'CPU':
        return ComputeType.cpu;
      case 'GPU_AND_CPU':
        return ComputeType.gpuAndCpu;
    }
    throw Exception('$this is not known in enum ComputeType');
  }
}

@Deprecated(
    'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class CreateDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the deployment job.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime? createdAt;

  /// The deployment application configuration.
  final List<DeploymentApplicationConfig>? deploymentApplicationConfigs;

  /// The deployment configuration.
  final DeploymentConfig? deploymentConfig;

  /// The failure code of the simulation job if it failed:
  /// <dl> <dt>BadPermissionError</dt> <dd>
  /// AWS Greengrass requires a service-level role permission to access other
  /// services. The role must include the <a
  /// href="https://console.aws.amazon.com/iam/home?#/policies/arn:aws:iam::aws:policy/service-role/AWSGreengrassResourceAccessRolePolicy$jsonEditor">
  /// <code>AWSGreengrassResourceAccessRolePolicy</code> managed policy</a>.
  /// </dd> <dt>ExtractingBundleFailure</dt> <dd>
  /// The robot application could not be extracted from the bundle.
  /// </dd> <dt>FailureThresholdBreached</dt> <dd>
  /// The percentage of robots that could not be updated exceeded the percentage
  /// set for the deployment.
  /// </dd> <dt>GreengrassDeploymentFailed</dt> <dd>
  /// The robot application could not be deployed to the robot.
  /// </dd> <dt>GreengrassGroupVersionDoesNotExist</dt> <dd>
  /// The AWS Greengrass group or version associated with a robot is missing.
  /// </dd> <dt>InternalServerError</dt> <dd>
  /// An internal error has occurred. Retry your request, but if the problem
  /// persists, contact us with details.
  /// </dd> <dt>MissingRobotApplicationArchitecture</dt> <dd>
  /// The robot application does not have a source that matches the architecture
  /// of the robot.
  /// </dd> <dt>MissingRobotDeploymentResource</dt> <dd>
  /// One or more of the resources specified for the robot application are
  /// missing. For example, does the robot application have the correct launch
  /// package and launch file?
  /// </dd> <dt>PostLaunchFileFailure</dt> <dd>
  /// The post-launch script failed.
  /// </dd> <dt>PreLaunchFileFailure</dt> <dd>
  /// The pre-launch script failed.
  /// </dd> <dt>ResourceNotFound</dt> <dd>
  /// One or more deployment resources are missing. For example, do robot
  /// application source bundles still exist?
  /// </dd> <dt>RobotDeploymentNoResponse</dt> <dd>
  /// There is no response from the robot. It might not be powered on or connected
  /// to the internet.
  /// </dd> </dl>
  final DeploymentJobErrorCode? failureCode;

  /// The failure reason of the deployment job if it failed.
  final String? failureReason;

  /// The target fleet for the deployment job.
  final String? fleet;

  /// The status of the deployment job.
  final DeploymentStatus? status;

  /// The list of all tags added to the deployment job.
  final Map<String, String>? tags;

  CreateDeploymentJobResponse({
    this.arn,
    this.createdAt,
    this.deploymentApplicationConfigs,
    this.deploymentConfig,
    this.failureCode,
    this.failureReason,
    this.fleet,
    this.status,
    this.tags,
  });

  factory CreateDeploymentJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateDeploymentJobResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentApplicationConfigs: (json['deploymentApplicationConfigs']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      deploymentConfig: json['deploymentConfig'] != null
          ? DeploymentConfig.fromJson(
              json['deploymentConfig'] as Map<String, dynamic>)
          : null,
      failureCode: (json['failureCode'] as String?)?.toDeploymentJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      fleet: json['fleet'] as String?,
      status: (json['status'] as String?)?.toDeploymentStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentApplicationConfigs = this.deploymentApplicationConfigs;
    final deploymentConfig = this.deploymentConfig;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final fleet = this.fleet;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deploymentApplicationConfigs != null)
        'deploymentApplicationConfigs': deploymentApplicationConfigs,
      if (deploymentConfig != null) 'deploymentConfig': deploymentConfig,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (fleet != null) 'fleet': fleet,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

@Deprecated(
    'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class CreateFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime? createdAt;

  /// The name of the fleet.
  final String? name;

  /// The list of all tags added to the fleet.
  final Map<String, String>? tags;

  CreateFleetResponse({
    this.arn,
    this.createdAt,
    this.name,
    this.tags,
  });

  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) {
    return CreateFleetResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String? arn;

  /// An object that contains the Docker image URI used to a create your robot
  /// application.
  final Environment? environment;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the robot application.
  final String? name;

  /// The revision id of the robot application.
  final String? revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The sources of the robot application.
  final List<Source>? sources;

  /// The list of all tags added to the robot application.
  final Map<String, String>? tags;

  /// The version of the robot application.
  final String? version;

  CreateRobotApplicationResponse({
    this.arn,
    this.environment,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.tags,
    this.version,
  });

  factory CreateRobotApplicationResponse.fromJson(Map<String, dynamic> json) {
    return CreateRobotApplicationResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final sources = this.sources;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

class CreateRobotApplicationVersionResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String? arn;

  /// The object that contains the Docker image URI used to create your robot
  /// application.
  final Environment? environment;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the robot application.
  final String? name;

  /// The revision id of the robot application.
  final String? revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The sources of the robot application.
  final List<Source>? sources;

  /// The version of the robot application.
  final String? version;

  CreateRobotApplicationVersionResponse({
    this.arn,
    this.environment,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.version,
  });

  factory CreateRobotApplicationVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateRobotApplicationVersionResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final sources = this.sources;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (version != null) 'version': version,
    };
  }
}

@Deprecated(
    'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class CreateRobotResponse {
  /// The target architecture of the robot.
  final Architecture? architecture;

  /// The Amazon Resource Name (ARN) of the robot.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the robot was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the Greengrass group associated with the
  /// robot.
  final String? greengrassGroupId;

  /// The name of the robot.
  final String? name;

  /// The list of all tags added to the robot.
  final Map<String, String>? tags;

  CreateRobotResponse({
    this.architecture,
    this.arn,
    this.createdAt,
    this.greengrassGroupId,
    this.name,
    this.tags,
  });

  factory CreateRobotResponse.fromJson(Map<String, dynamic> json) {
    return CreateRobotResponse(
      architecture: (json['architecture'] as String?)?.toArchitecture(),
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      greengrassGroupId: json['greengrassGroupId'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final greengrassGroupId = this.greengrassGroupId;
    final name = this.name;
    final tags = this.tags;
    return {
      if (architecture != null) 'architecture': architecture.toValue(),
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (greengrassGroupId != null) 'greengrassGroupId': greengrassGroupId,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the simulation application.
  final String? arn;

  /// The object that contains the Docker image URI that you used to create your
  /// simulation application.
  final Environment? environment;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the simulation application.
  final String? name;

  /// The rendering engine for the simulation application.
  final RenderingEngine? renderingEngine;

  /// The revision id of the simulation application.
  final String? revisionId;

  /// Information about the robot software suite (ROS distribution).
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite? simulationSoftwareSuite;

  /// The sources of the simulation application.
  final List<Source>? sources;

  /// The list of all tags added to the simulation application.
  final Map<String, String>? tags;

  /// The version of the simulation application.
  final String? version;

  CreateSimulationApplicationResponse({
    this.arn,
    this.environment,
    this.lastUpdatedAt,
    this.name,
    this.renderingEngine,
    this.revisionId,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
    this.sources,
    this.tags,
    this.version,
  });

  factory CreateSimulationApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSimulationApplicationResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      renderingEngine: json['renderingEngine'] != null
          ? RenderingEngine.fromJson(
              json['renderingEngine'] as Map<String, dynamic>)
          : null,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      simulationSoftwareSuite: json['simulationSoftwareSuite'] != null
          ? SimulationSoftwareSuite.fromJson(
              json['simulationSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final renderingEngine = this.renderingEngine;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final simulationSoftwareSuite = this.simulationSoftwareSuite;
    final sources = this.sources;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (simulationSoftwareSuite != null)
        'simulationSoftwareSuite': simulationSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

class CreateSimulationApplicationVersionResponse {
  /// The Amazon Resource Name (ARN) of the simulation application.
  final String? arn;

  /// The object that contains the Docker image URI used to create the simulation
  /// application.
  final Environment? environment;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the simulation application.
  final String? name;

  /// The rendering engine for the simulation application.
  final RenderingEngine? renderingEngine;

  /// The revision ID of the simulation application.
  final String? revisionId;

  /// Information about the robot software suite (ROS distribution).
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite? simulationSoftwareSuite;

  /// The sources of the simulation application.
  final List<Source>? sources;

  /// The version of the simulation application.
  final String? version;

  CreateSimulationApplicationVersionResponse({
    this.arn,
    this.environment,
    this.lastUpdatedAt,
    this.name,
    this.renderingEngine,
    this.revisionId,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
    this.sources,
    this.version,
  });

  factory CreateSimulationApplicationVersionResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateSimulationApplicationVersionResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      renderingEngine: json['renderingEngine'] != null
          ? RenderingEngine.fromJson(
              json['renderingEngine'] as Map<String, dynamic>)
          : null,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      simulationSoftwareSuite: json['simulationSoftwareSuite'] != null
          ? SimulationSoftwareSuite.fromJson(
              json['simulationSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final renderingEngine = this.renderingEngine;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final simulationSoftwareSuite = this.simulationSoftwareSuite;
    final sources = this.sources;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (simulationSoftwareSuite != null)
        'simulationSoftwareSuite': simulationSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (version != null) 'version': version,
    };
  }
}

class CreateSimulationJobResponse {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// Compute information for the simulation job.
  final ComputeResponse? compute;

  /// The data sources for the simulation job.
  final List<DataSource>? dataSources;

  /// the failure behavior for the simulation job.
  final FailureBehavior? failureBehavior;

  /// The failure code of the simulation job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>RobotApplicationCrash</dt> <dd>
  /// Robot application exited abnormally.
  /// </dd> <dt>SimulationApplicationCrash</dt> <dd>
  /// Simulation application exited abnormally.
  /// </dd> <dt>BadPermissionsRobotApplication</dt> <dd>
  /// Robot application bundle could not be downloaded.
  /// </dd> <dt>BadPermissionsSimulationApplication</dt> <dd>
  /// Simulation application bundle could not be downloaded.
  /// </dd> <dt>BadPermissionsS3Output</dt> <dd>
  /// Unable to publish outputs to customer-provided S3 bucket.
  /// </dd> <dt>BadPermissionsCloudwatchLogs</dt> <dd>
  /// Unable to publish logs to customer-provided CloudWatch Logs resource.
  /// </dd> <dt>SubnetIpLimitExceeded</dt> <dd>
  /// Subnet IP limit exceeded.
  /// </dd> <dt>ENILimitExceeded</dt> <dd>
  /// ENI limit exceeded.
  /// </dd> <dt>BadPermissionsUserCredentials</dt> <dd>
  /// Unable to use the Role provided.
  /// </dd> <dt>InvalidBundleRobotApplication</dt> <dd>
  /// Robot bundle cannot be extracted (invalid format, bundling error, or other
  /// issue).
  /// </dd> <dt>InvalidBundleSimulationApplication</dt> <dd>
  /// Simulation bundle cannot be extracted (invalid format, bundling error, or
  /// other issue).
  /// </dd> <dt>RobotApplicationVersionMismatchedEtag</dt> <dd>
  /// Etag for RobotApplication does not match value during version creation.
  /// </dd> <dt>SimulationApplicationVersionMismatchedEtag</dt> <dd>
  /// Etag for SimulationApplication does not match value during version creation.
  /// </dd> </dl>
  final SimulationJobErrorCode? failureCode;

  /// The IAM role that allows the simulation job to call the AWS APIs that are
  /// specified in its associated policies on your behalf.
  final String? iamRole;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// started.
  final DateTime? lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The logging configuration.
  final LoggingConfig? loggingConfig;

  /// The maximum simulation job duration in seconds.
  final int? maxJobDurationInSeconds;

  /// Simulation job output files location.
  final OutputLocation? outputLocation;

  /// The robot application used by the simulation job.
  final List<RobotApplicationConfig>? robotApplications;

  /// The simulation application used by the simulation job.
  final List<SimulationApplicationConfig>? simulationApplications;

  /// The simulation job execution duration in milliseconds.
  final int? simulationTimeMillis;

  /// The status of the simulation job.
  final SimulationJobStatus? status;

  /// The list of all tags added to the simulation job.
  final Map<String, String>? tags;

  /// Information about the vpc configuration.
  final VPCConfigResponse? vpcConfig;

  CreateSimulationJobResponse({
    this.arn,
    this.clientRequestToken,
    this.compute,
    this.dataSources,
    this.failureBehavior,
    this.failureCode,
    this.iamRole,
    this.lastStartedAt,
    this.lastUpdatedAt,
    this.loggingConfig,
    this.maxJobDurationInSeconds,
    this.outputLocation,
    this.robotApplications,
    this.simulationApplications,
    this.simulationTimeMillis,
    this.status,
    this.tags,
    this.vpcConfig,
  });

  factory CreateSimulationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateSimulationJobResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      compute: json['compute'] != null
          ? ComputeResponse.fromJson(json['compute'] as Map<String, dynamic>)
          : null,
      dataSources: (json['dataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureBehavior:
          (json['failureBehavior'] as String?)?.toFailureBehavior(),
      failureCode: (json['failureCode'] as String?)?.toSimulationJobErrorCode(),
      iamRole: json['iamRole'] as String?,
      lastStartedAt: timeStampFromJson(json['lastStartedAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      loggingConfig: json['loggingConfig'] != null
          ? LoggingConfig.fromJson(
              json['loggingConfig'] as Map<String, dynamic>)
          : null,
      maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int?,
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      robotApplications: (json['robotApplications'] as List?)
          ?.whereNotNull()
          .map(
              (e) => RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationApplications: (json['simulationApplications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationTimeMillis: json['simulationTimeMillis'] as int?,
      status: (json['status'] as String?)?.toSimulationJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcConfig: json['vpcConfig'] != null
          ? VPCConfigResponse.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final compute = this.compute;
    final dataSources = this.dataSources;
    final failureBehavior = this.failureBehavior;
    final failureCode = this.failureCode;
    final iamRole = this.iamRole;
    final lastStartedAt = this.lastStartedAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final loggingConfig = this.loggingConfig;
    final maxJobDurationInSeconds = this.maxJobDurationInSeconds;
    final outputLocation = this.outputLocation;
    final robotApplications = this.robotApplications;
    final simulationApplications = this.simulationApplications;
    final simulationTimeMillis = this.simulationTimeMillis;
    final status = this.status;
    final tags = this.tags;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (compute != null) 'compute': compute,
      if (dataSources != null) 'dataSources': dataSources,
      if (failureBehavior != null) 'failureBehavior': failureBehavior.toValue(),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (iamRole != null) 'iamRole': iamRole,
      if (lastStartedAt != null)
        'lastStartedAt': unixTimestampToJson(lastStartedAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (loggingConfig != null) 'loggingConfig': loggingConfig,
      if (maxJobDurationInSeconds != null)
        'maxJobDurationInSeconds': maxJobDurationInSeconds,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (robotApplications != null) 'robotApplications': robotApplications,
      if (simulationApplications != null)
        'simulationApplications': simulationApplications,
      if (simulationTimeMillis != null)
        'simulationTimeMillis': simulationTimeMillis,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

class CreateWorldExportJobResponse {
  /// The Amazon Resource Name (ARN) of the world export job.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world export job was
  /// created.
  final DateTime? createdAt;

  /// The failure code of the world export job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>LimitExceeded</dt> <dd>
  /// The requested resource exceeds the maximum number allowed, or the number of
  /// concurrent stream requests exceeds the maximum number allowed.
  /// </dd> <dt>ResourceNotFound</dt> <dd>
  /// The specified resource could not be found.
  /// </dd> <dt>RequestThrottled</dt> <dd>
  /// The request was throttled.
  /// </dd> <dt>InvalidInput</dt> <dd>
  /// An input parameter in the request is not valid.
  /// </dd> <dt>AllWorldGenerationFailed</dt> <dd>
  /// All of the worlds in the world generation job failed. This can happen if
  /// your <code>worldCount</code> is greater than 50 or less than 1.
  /// </dd> </dl>
  /// For more information about troubleshooting WorldForge, see <a
  /// href="https://docs.aws.amazon.com/robomaker/latest/dg/troubleshooting-worldforge.html">Troubleshooting
  /// Simulation WorldForge</a>.
  final WorldExportJobErrorCode? failureCode;

  /// The IAM role that the world export process uses to access the Amazon S3
  /// bucket and put the export.
  final String? iamRole;
  final OutputLocation? outputLocation;

  /// The status of the world export job.
  /// <dl> <dt>Pending</dt> <dd>
  /// The world export job request is pending.
  /// </dd> <dt>Running</dt> <dd>
  /// The world export job is running.
  /// </dd> <dt>Completed</dt> <dd>
  /// The world export job completed.
  /// </dd> <dt>Failed</dt> <dd>
  /// The world export job failed. See <code>failureCode</code> for more
  /// information.
  /// </dd> <dt>Canceled</dt> <dd>
  /// The world export job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The world export job is being cancelled.
  /// </dd> </dl>
  final WorldExportJobStatus? status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// export job.
  final Map<String, String>? tags;

  CreateWorldExportJobResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.failureCode,
    this.iamRole,
    this.outputLocation,
    this.status,
    this.tags,
  });

  factory CreateWorldExportJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorldExportJobResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      failureCode:
          (json['failureCode'] as String?)?.toWorldExportJobErrorCode(),
      iamRole: json['iamRole'] as String?,
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toWorldExportJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final failureCode = this.failureCode;
    final iamRole = this.iamRole;
    final outputLocation = this.outputLocation;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (iamRole != null) 'iamRole': iamRole,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class CreateWorldGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the world generator job.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world generator job was
  /// created.
  final DateTime? createdAt;

  /// The failure code of the world generator job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>LimitExceeded</dt> <dd>
  /// The requested resource exceeds the maximum number allowed, or the number of
  /// concurrent stream requests exceeds the maximum number allowed.
  /// </dd> <dt>ResourceNotFound</dt> <dd>
  /// The specified resource could not be found.
  /// </dd> <dt>RequestThrottled</dt> <dd>
  /// The request was throttled.
  /// </dd> <dt>InvalidInput</dt> <dd>
  /// An input parameter in the request is not valid.
  /// </dd> </dl>
  final WorldGenerationJobErrorCode? failureCode;

  /// The status of the world generator job.
  /// <dl> <dt>Pending</dt> <dd>
  /// The world generator job request is pending.
  /// </dd> <dt>Running</dt> <dd>
  /// The world generator job is running.
  /// </dd> <dt>Completed</dt> <dd>
  /// The world generator job completed.
  /// </dd> <dt>Failed</dt> <dd>
  /// The world generator job failed. See <code>failureCode</code> for more
  /// information.
  /// </dd> <dt>PartialFailed</dt> <dd>
  /// Some worlds did not generate.
  /// </dd> <dt>Canceled</dt> <dd>
  /// The world generator job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The world generator job is being cancelled.
  /// </dd> </dl>
  final WorldGenerationJobStatus? status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// generator job.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (arn) of the world template.
  final String? template;

  /// Information about the world count.
  final WorldCount? worldCount;

  /// A map that contains tag keys and tag values that are attached to the
  /// generated worlds.
  final Map<String, String>? worldTags;

  CreateWorldGenerationJobResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.failureCode,
    this.status,
    this.tags,
    this.template,
    this.worldCount,
    this.worldTags,
  });

  factory CreateWorldGenerationJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorldGenerationJobResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      failureCode:
          (json['failureCode'] as String?)?.toWorldGenerationJobErrorCode(),
      status: (json['status'] as String?)?.toWorldGenerationJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      template: json['template'] as String?,
      worldCount: json['worldCount'] != null
          ? WorldCount.fromJson(json['worldCount'] as Map<String, dynamic>)
          : null,
      worldTags: (json['worldTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final failureCode = this.failureCode;
    final status = this.status;
    final tags = this.tags;
    final template = this.template;
    final worldCount = this.worldCount;
    final worldTags = this.worldTags;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (template != null) 'template': template,
      if (worldCount != null) 'worldCount': worldCount,
      if (worldTags != null) 'worldTags': worldTags,
    };
  }
}

class CreateWorldTemplateResponse {
  /// The Amazon Resource Name (ARN) of the world template.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world template was
  /// created.
  final DateTime? createdAt;

  /// The name of the world template.
  final String? name;

  /// A map that contains tag keys and tag values that are attached to the world
  /// template.
  final Map<String, String>? tags;

  CreateWorldTemplateResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.name,
    this.tags,
  });

  factory CreateWorldTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorldTemplateResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final name = this.name;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Information about a data source.
class DataSource {
  /// The location where your files are mounted in the container image.
  ///
  /// If you've specified the <code>type</code> of the data source as an
  /// <code>Archive</code>, you must provide an Amazon S3 object key to your
  /// archive. The object key must point to either a <code>.zip</code> or
  /// <code>.tar.gz</code> file.
  ///
  /// If you've specified the <code>type</code> of the data source as a
  /// <code>Prefix</code>, you provide the Amazon S3 prefix that points to the
  /// files that you are using for your data source.
  ///
  /// If you've specified the <code>type</code> of the data source as a
  /// <code>File</code>, you provide the Amazon S3 path to the file that you're
  /// using as your data source.
  final String? destination;

  /// The name of the data source.
  final String? name;

  /// The S3 bucket where the data files are located.
  final String? s3Bucket;

  /// The list of S3 keys identifying the data source files.
  final List<S3KeyOutput>? s3Keys;

  /// The data type for the data source that you're using for your container image
  /// or simulation job. You can use this field to specify whether your data
  /// source is an Archive, an Amazon S3 prefix, or a file.
  ///
  /// If you don't specify a field, the default value is <code>File</code>.
  final DataSourceType? type;

  DataSource({
    this.destination,
    this.name,
    this.s3Bucket,
    this.s3Keys,
    this.type,
  });

  factory DataSource.fromJson(Map<String, dynamic> json) {
    return DataSource(
      destination: json['destination'] as String?,
      name: json['name'] as String?,
      s3Bucket: json['s3Bucket'] as String?,
      s3Keys: (json['s3Keys'] as List?)
          ?.whereNotNull()
          .map((e) => S3KeyOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: (json['type'] as String?)?.toDataSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final destination = this.destination;
    final name = this.name;
    final s3Bucket = this.s3Bucket;
    final s3Keys = this.s3Keys;
    final type = this.type;
    return {
      if (destination != null) 'destination': destination,
      if (name != null) 'name': name,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Keys != null) 's3Keys': s3Keys,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// Information about a data source.
class DataSourceConfig {
  /// The name of the data source.
  final String name;

  /// The S3 bucket where the data files are located.
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  final List<String> s3Keys;

  /// The location where your files are mounted in the container image.
  ///
  /// If you've specified the <code>type</code> of the data source as an
  /// <code>Archive</code>, you must provide an Amazon S3 object key to your
  /// archive. The object key must point to either a <code>.zip</code> or
  /// <code>.tar.gz</code> file.
  ///
  /// If you've specified the <code>type</code> of the data source as a
  /// <code>Prefix</code>, you provide the Amazon S3 prefix that points to the
  /// files that you are using for your data source.
  ///
  /// If you've specified the <code>type</code> of the data source as a
  /// <code>File</code>, you provide the Amazon S3 path to the file that you're
  /// using as your data source.
  final String? destination;

  /// The data type for the data source that you're using for your container image
  /// or simulation job. You can use this field to specify whether your data
  /// source is an Archive, an Amazon S3 prefix, or a file.
  ///
  /// If you don't specify a field, the default value is <code>File</code>.
  final DataSourceType? type;

  DataSourceConfig({
    required this.name,
    required this.s3Bucket,
    required this.s3Keys,
    this.destination,
    this.type,
  });

  factory DataSourceConfig.fromJson(Map<String, dynamic> json) {
    return DataSourceConfig(
      name: json['name'] as String,
      s3Bucket: json['s3Bucket'] as String,
      s3Keys: (json['s3Keys'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      destination: json['destination'] as String?,
      type: (json['type'] as String?)?.toDataSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final s3Bucket = this.s3Bucket;
    final s3Keys = this.s3Keys;
    final destination = this.destination;
    final type = this.type;
    return {
      'name': name,
      's3Bucket': s3Bucket,
      's3Keys': s3Keys,
      if (destination != null) 'destination': destination,
      if (type != null) 'type': type.toValue(),
    };
  }
}

enum DataSourceType {
  prefix,
  archive,
  file,
}

extension DataSourceTypeValueExtension on DataSourceType {
  String toValue() {
    switch (this) {
      case DataSourceType.prefix:
        return 'Prefix';
      case DataSourceType.archive:
        return 'Archive';
      case DataSourceType.file:
        return 'File';
    }
  }
}

extension DataSourceTypeFromString on String {
  DataSourceType toDataSourceType() {
    switch (this) {
      case 'Prefix':
        return DataSourceType.prefix;
      case 'Archive':
        return DataSourceType.archive;
      case 'File':
        return DataSourceType.file;
    }
    throw Exception('$this is not known in enum DataSourceType');
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class DeleteFleetResponse {
  DeleteFleetResponse();

  factory DeleteFleetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteRobotApplicationResponse {
  DeleteRobotApplicationResponse();

  factory DeleteRobotApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRobotApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class DeleteRobotResponse {
  DeleteRobotResponse();

  factory DeleteRobotResponse.fromJson(Map<String, dynamic> _) {
    return DeleteRobotResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSimulationApplicationResponse {
  DeleteSimulationApplicationResponse();

  factory DeleteSimulationApplicationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSimulationApplicationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorldTemplateResponse {
  DeleteWorldTemplateResponse();

  factory DeleteWorldTemplateResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorldTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a deployment application configuration.
class DeploymentApplicationConfig {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String application;

  /// The version of the application.
  final String applicationVersion;

  /// The launch configuration.
  final DeploymentLaunchConfig launchConfig;

  DeploymentApplicationConfig({
    required this.application,
    required this.applicationVersion,
    required this.launchConfig,
  });

  factory DeploymentApplicationConfig.fromJson(Map<String, dynamic> json) {
    return DeploymentApplicationConfig(
      application: json['application'] as String,
      applicationVersion: json['applicationVersion'] as String,
      launchConfig: DeploymentLaunchConfig.fromJson(
          json['launchConfig'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    final applicationVersion = this.applicationVersion;
    final launchConfig = this.launchConfig;
    return {
      'application': application,
      'applicationVersion': applicationVersion,
      'launchConfig': launchConfig,
    };
  }
}

/// Information about a deployment configuration.
class DeploymentConfig {
  /// The percentage of robots receiving the deployment at the same time.
  final int? concurrentDeploymentPercentage;

  /// The download condition file.
  final S3Object? downloadConditionFile;

  /// The percentage of deployments that need to fail before stopping deployment.
  final int? failureThresholdPercentage;

  /// The amount of time, in seconds, to wait for deployment to a single robot to
  /// complete. Choose a time between 1 minute and 7 days. The default is 5 hours.
  final int? robotDeploymentTimeoutInSeconds;

  DeploymentConfig({
    this.concurrentDeploymentPercentage,
    this.downloadConditionFile,
    this.failureThresholdPercentage,
    this.robotDeploymentTimeoutInSeconds,
  });

  factory DeploymentConfig.fromJson(Map<String, dynamic> json) {
    return DeploymentConfig(
      concurrentDeploymentPercentage:
          json['concurrentDeploymentPercentage'] as int?,
      downloadConditionFile: json['downloadConditionFile'] != null
          ? S3Object.fromJson(
              json['downloadConditionFile'] as Map<String, dynamic>)
          : null,
      failureThresholdPercentage: json['failureThresholdPercentage'] as int?,
      robotDeploymentTimeoutInSeconds:
          json['robotDeploymentTimeoutInSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final concurrentDeploymentPercentage = this.concurrentDeploymentPercentage;
    final downloadConditionFile = this.downloadConditionFile;
    final failureThresholdPercentage = this.failureThresholdPercentage;
    final robotDeploymentTimeoutInSeconds =
        this.robotDeploymentTimeoutInSeconds;
    return {
      if (concurrentDeploymentPercentage != null)
        'concurrentDeploymentPercentage': concurrentDeploymentPercentage,
      if (downloadConditionFile != null)
        'downloadConditionFile': downloadConditionFile,
      if (failureThresholdPercentage != null)
        'failureThresholdPercentage': failureThresholdPercentage,
      if (robotDeploymentTimeoutInSeconds != null)
        'robotDeploymentTimeoutInSeconds': robotDeploymentTimeoutInSeconds,
    };
  }
}

/// Information about a deployment job.
class DeploymentJob {
  /// The Amazon Resource Name (ARN) of the deployment job.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the deployment job was
  /// created.
  final DateTime? createdAt;

  /// The deployment application configuration.
  final List<DeploymentApplicationConfig>? deploymentApplicationConfigs;

  /// The deployment configuration.
  final DeploymentConfig? deploymentConfig;

  /// The deployment job failure code.
  final DeploymentJobErrorCode? failureCode;

  /// A short description of the reason why the deployment job failed.
  final String? failureReason;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleet;

  /// The status of the deployment job.
  final DeploymentStatus? status;

  DeploymentJob({
    this.arn,
    this.createdAt,
    this.deploymentApplicationConfigs,
    this.deploymentConfig,
    this.failureCode,
    this.failureReason,
    this.fleet,
    this.status,
  });

  factory DeploymentJob.fromJson(Map<String, dynamic> json) {
    return DeploymentJob(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentApplicationConfigs: (json['deploymentApplicationConfigs']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      deploymentConfig: json['deploymentConfig'] != null
          ? DeploymentConfig.fromJson(
              json['deploymentConfig'] as Map<String, dynamic>)
          : null,
      failureCode: (json['failureCode'] as String?)?.toDeploymentJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      fleet: json['fleet'] as String?,
      status: (json['status'] as String?)?.toDeploymentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentApplicationConfigs = this.deploymentApplicationConfigs;
    final deploymentConfig = this.deploymentConfig;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final fleet = this.fleet;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deploymentApplicationConfigs != null)
        'deploymentApplicationConfigs': deploymentApplicationConfigs,
      if (deploymentConfig != null) 'deploymentConfig': deploymentConfig,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (fleet != null) 'fleet': fleet,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum DeploymentJobErrorCode {
  resourceNotFound,
  environmentSetupError,
  etagMismatch,
  failureThresholdBreached,
  robotDeploymentAborted,
  robotDeploymentNoResponse,
  robotAgentConnectionTimeout,
  greengrassDeploymentFailed,
  invalidGreengrassGroup,
  missingRobotArchitecture,
  missingRobotApplicationArchitecture,
  missingRobotDeploymentResource,
  greengrassGroupVersionDoesNotExist,
  lambdaDeleted,
  extractingBundleFailure,
  preLaunchFileFailure,
  postLaunchFileFailure,
  badPermissionError,
  downloadConditionFailed,
  badLambdaAssociated,
  internalServerError,
  robotApplicationDoesNotExist,
  deploymentFleetDoesNotExist,
  fleetDeploymentTimeout,
}

extension DeploymentJobErrorCodeValueExtension on DeploymentJobErrorCode {
  String toValue() {
    switch (this) {
      case DeploymentJobErrorCode.resourceNotFound:
        return 'ResourceNotFound';
      case DeploymentJobErrorCode.environmentSetupError:
        return 'EnvironmentSetupError';
      case DeploymentJobErrorCode.etagMismatch:
        return 'EtagMismatch';
      case DeploymentJobErrorCode.failureThresholdBreached:
        return 'FailureThresholdBreached';
      case DeploymentJobErrorCode.robotDeploymentAborted:
        return 'RobotDeploymentAborted';
      case DeploymentJobErrorCode.robotDeploymentNoResponse:
        return 'RobotDeploymentNoResponse';
      case DeploymentJobErrorCode.robotAgentConnectionTimeout:
        return 'RobotAgentConnectionTimeout';
      case DeploymentJobErrorCode.greengrassDeploymentFailed:
        return 'GreengrassDeploymentFailed';
      case DeploymentJobErrorCode.invalidGreengrassGroup:
        return 'InvalidGreengrassGroup';
      case DeploymentJobErrorCode.missingRobotArchitecture:
        return 'MissingRobotArchitecture';
      case DeploymentJobErrorCode.missingRobotApplicationArchitecture:
        return 'MissingRobotApplicationArchitecture';
      case DeploymentJobErrorCode.missingRobotDeploymentResource:
        return 'MissingRobotDeploymentResource';
      case DeploymentJobErrorCode.greengrassGroupVersionDoesNotExist:
        return 'GreengrassGroupVersionDoesNotExist';
      case DeploymentJobErrorCode.lambdaDeleted:
        return 'LambdaDeleted';
      case DeploymentJobErrorCode.extractingBundleFailure:
        return 'ExtractingBundleFailure';
      case DeploymentJobErrorCode.preLaunchFileFailure:
        return 'PreLaunchFileFailure';
      case DeploymentJobErrorCode.postLaunchFileFailure:
        return 'PostLaunchFileFailure';
      case DeploymentJobErrorCode.badPermissionError:
        return 'BadPermissionError';
      case DeploymentJobErrorCode.downloadConditionFailed:
        return 'DownloadConditionFailed';
      case DeploymentJobErrorCode.badLambdaAssociated:
        return 'BadLambdaAssociated';
      case DeploymentJobErrorCode.internalServerError:
        return 'InternalServerError';
      case DeploymentJobErrorCode.robotApplicationDoesNotExist:
        return 'RobotApplicationDoesNotExist';
      case DeploymentJobErrorCode.deploymentFleetDoesNotExist:
        return 'DeploymentFleetDoesNotExist';
      case DeploymentJobErrorCode.fleetDeploymentTimeout:
        return 'FleetDeploymentTimeout';
    }
  }
}

extension DeploymentJobErrorCodeFromString on String {
  DeploymentJobErrorCode toDeploymentJobErrorCode() {
    switch (this) {
      case 'ResourceNotFound':
        return DeploymentJobErrorCode.resourceNotFound;
      case 'EnvironmentSetupError':
        return DeploymentJobErrorCode.environmentSetupError;
      case 'EtagMismatch':
        return DeploymentJobErrorCode.etagMismatch;
      case 'FailureThresholdBreached':
        return DeploymentJobErrorCode.failureThresholdBreached;
      case 'RobotDeploymentAborted':
        return DeploymentJobErrorCode.robotDeploymentAborted;
      case 'RobotDeploymentNoResponse':
        return DeploymentJobErrorCode.robotDeploymentNoResponse;
      case 'RobotAgentConnectionTimeout':
        return DeploymentJobErrorCode.robotAgentConnectionTimeout;
      case 'GreengrassDeploymentFailed':
        return DeploymentJobErrorCode.greengrassDeploymentFailed;
      case 'InvalidGreengrassGroup':
        return DeploymentJobErrorCode.invalidGreengrassGroup;
      case 'MissingRobotArchitecture':
        return DeploymentJobErrorCode.missingRobotArchitecture;
      case 'MissingRobotApplicationArchitecture':
        return DeploymentJobErrorCode.missingRobotApplicationArchitecture;
      case 'MissingRobotDeploymentResource':
        return DeploymentJobErrorCode.missingRobotDeploymentResource;
      case 'GreengrassGroupVersionDoesNotExist':
        return DeploymentJobErrorCode.greengrassGroupVersionDoesNotExist;
      case 'LambdaDeleted':
        return DeploymentJobErrorCode.lambdaDeleted;
      case 'ExtractingBundleFailure':
        return DeploymentJobErrorCode.extractingBundleFailure;
      case 'PreLaunchFileFailure':
        return DeploymentJobErrorCode.preLaunchFileFailure;
      case 'PostLaunchFileFailure':
        return DeploymentJobErrorCode.postLaunchFileFailure;
      case 'BadPermissionError':
        return DeploymentJobErrorCode.badPermissionError;
      case 'DownloadConditionFailed':
        return DeploymentJobErrorCode.downloadConditionFailed;
      case 'BadLambdaAssociated':
        return DeploymentJobErrorCode.badLambdaAssociated;
      case 'InternalServerError':
        return DeploymentJobErrorCode.internalServerError;
      case 'RobotApplicationDoesNotExist':
        return DeploymentJobErrorCode.robotApplicationDoesNotExist;
      case 'DeploymentFleetDoesNotExist':
        return DeploymentJobErrorCode.deploymentFleetDoesNotExist;
      case 'FleetDeploymentTimeout':
        return DeploymentJobErrorCode.fleetDeploymentTimeout;
    }
    throw Exception('$this is not known in enum DeploymentJobErrorCode');
  }
}

/// Configuration information for a deployment launch.
class DeploymentLaunchConfig {
  /// The launch file name.
  final String launchFile;

  /// The package name.
  final String packageName;

  /// An array of key/value pairs specifying environment variables for the robot
  /// application
  final Map<String, String>? environmentVariables;

  /// The deployment post-launch file. This file will be executed after the launch
  /// file.
  final String? postLaunchFile;

  /// The deployment pre-launch file. This file will be executed prior to the
  /// launch file.
  final String? preLaunchFile;

  DeploymentLaunchConfig({
    required this.launchFile,
    required this.packageName,
    this.environmentVariables,
    this.postLaunchFile,
    this.preLaunchFile,
  });

  factory DeploymentLaunchConfig.fromJson(Map<String, dynamic> json) {
    return DeploymentLaunchConfig(
      launchFile: json['launchFile'] as String,
      packageName: json['packageName'] as String,
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      postLaunchFile: json['postLaunchFile'] as String?,
      preLaunchFile: json['preLaunchFile'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchFile = this.launchFile;
    final packageName = this.packageName;
    final environmentVariables = this.environmentVariables;
    final postLaunchFile = this.postLaunchFile;
    final preLaunchFile = this.preLaunchFile;
    return {
      'launchFile': launchFile,
      'packageName': packageName,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (postLaunchFile != null) 'postLaunchFile': postLaunchFile,
      if (preLaunchFile != null) 'preLaunchFile': preLaunchFile,
    };
  }
}

enum DeploymentStatus {
  pending,
  preparing,
  inProgress,
  failed,
  succeeded,
  canceled,
}

extension DeploymentStatusValueExtension on DeploymentStatus {
  String toValue() {
    switch (this) {
      case DeploymentStatus.pending:
        return 'Pending';
      case DeploymentStatus.preparing:
        return 'Preparing';
      case DeploymentStatus.inProgress:
        return 'InProgress';
      case DeploymentStatus.failed:
        return 'Failed';
      case DeploymentStatus.succeeded:
        return 'Succeeded';
      case DeploymentStatus.canceled:
        return 'Canceled';
    }
  }
}

extension DeploymentStatusFromString on String {
  DeploymentStatus toDeploymentStatus() {
    switch (this) {
      case 'Pending':
        return DeploymentStatus.pending;
      case 'Preparing':
        return DeploymentStatus.preparing;
      case 'InProgress':
        return DeploymentStatus.inProgress;
      case 'Failed':
        return DeploymentStatus.failed;
      case 'Succeeded':
        return DeploymentStatus.succeeded;
      case 'Canceled':
        return DeploymentStatus.canceled;
    }
    throw Exception('$this is not known in enum DeploymentStatus');
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class DeregisterRobotResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleet;

  /// The Amazon Resource Name (ARN) of the robot.
  final String? robot;

  DeregisterRobotResponse({
    this.fleet,
    this.robot,
  });

  factory DeregisterRobotResponse.fromJson(Map<String, dynamic> json) {
    return DeregisterRobotResponse(
      fleet: json['fleet'] as String?,
      robot: json['robot'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleet = this.fleet;
    final robot = this.robot;
    return {
      if (fleet != null) 'fleet': fleet,
      if (robot != null) 'robot': robot,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class DescribeDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the deployment job.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the deployment job was
  /// created.
  final DateTime? createdAt;

  /// The deployment application configuration.
  final List<DeploymentApplicationConfig>? deploymentApplicationConfigs;

  /// The deployment configuration.
  final DeploymentConfig? deploymentConfig;

  /// The deployment job failure code.
  final DeploymentJobErrorCode? failureCode;

  /// A short description of the reason why the deployment job failed.
  final String? failureReason;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleet;

  /// A list of robot deployment summaries.
  final List<RobotDeployment>? robotDeploymentSummary;

  /// The status of the deployment job.
  final DeploymentStatus? status;

  /// The list of all tags added to the specified deployment job.
  final Map<String, String>? tags;

  DescribeDeploymentJobResponse({
    this.arn,
    this.createdAt,
    this.deploymentApplicationConfigs,
    this.deploymentConfig,
    this.failureCode,
    this.failureReason,
    this.fleet,
    this.robotDeploymentSummary,
    this.status,
    this.tags,
  });

  factory DescribeDeploymentJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeDeploymentJobResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentApplicationConfigs: (json['deploymentApplicationConfigs']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      deploymentConfig: json['deploymentConfig'] != null
          ? DeploymentConfig.fromJson(
              json['deploymentConfig'] as Map<String, dynamic>)
          : null,
      failureCode: (json['failureCode'] as String?)?.toDeploymentJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      fleet: json['fleet'] as String?,
      robotDeploymentSummary: (json['robotDeploymentSummary'] as List?)
          ?.whereNotNull()
          .map((e) => RobotDeployment.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toDeploymentStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentApplicationConfigs = this.deploymentApplicationConfigs;
    final deploymentConfig = this.deploymentConfig;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final fleet = this.fleet;
    final robotDeploymentSummary = this.robotDeploymentSummary;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deploymentApplicationConfigs != null)
        'deploymentApplicationConfigs': deploymentApplicationConfigs,
      if (deploymentConfig != null) 'deploymentConfig': deploymentConfig,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (fleet != null) 'fleet': fleet,
      if (robotDeploymentSummary != null)
        'robotDeploymentSummary': robotDeploymentSummary,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class DescribeFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String? lastDeploymentJob;

  /// The status of the last deployment.
  final DeploymentStatus? lastDeploymentStatus;

  /// The time of the last deployment.
  final DateTime? lastDeploymentTime;

  /// The name of the fleet.
  final String? name;

  /// A list of robots.
  final List<Robot>? robots;

  /// The list of all tags added to the specified fleet.
  final Map<String, String>? tags;

  DescribeFleetResponse({
    this.arn,
    this.createdAt,
    this.lastDeploymentJob,
    this.lastDeploymentStatus,
    this.lastDeploymentTime,
    this.name,
    this.robots,
    this.tags,
  });

  factory DescribeFleetResponse.fromJson(Map<String, dynamic> json) {
    return DescribeFleetResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastDeploymentJob: json['lastDeploymentJob'] as String?,
      lastDeploymentStatus:
          (json['lastDeploymentStatus'] as String?)?.toDeploymentStatus(),
      lastDeploymentTime: timeStampFromJson(json['lastDeploymentTime']),
      name: json['name'] as String?,
      robots: (json['robots'] as List?)
          ?.whereNotNull()
          .map((e) => Robot.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastDeploymentJob = this.lastDeploymentJob;
    final lastDeploymentStatus = this.lastDeploymentStatus;
    final lastDeploymentTime = this.lastDeploymentTime;
    final name = this.name;
    final robots = this.robots;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastDeploymentJob != null) 'lastDeploymentJob': lastDeploymentJob,
      if (lastDeploymentStatus != null)
        'lastDeploymentStatus': lastDeploymentStatus.toValue(),
      if (lastDeploymentTime != null)
        'lastDeploymentTime': unixTimestampToJson(lastDeploymentTime),
      if (name != null) 'name': name,
      if (robots != null) 'robots': robots,
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribeRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  final String? arn;

  /// The object that contains the Docker image URI used to create the robot
  /// application.
  final Environment? environment;

  /// A SHA256 identifier for the Docker image that you use for your robot
  /// application.
  final String? imageDigest;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the robot application.
  final String? name;

  /// The revision id of the robot application.
  final String? revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The sources of the robot application.
  final List<Source>? sources;

  /// The list of all tags added to the specified robot application.
  final Map<String, String>? tags;

  /// The version of the robot application.
  final String? version;

  DescribeRobotApplicationResponse({
    this.arn,
    this.environment,
    this.imageDigest,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.tags,
    this.version,
  });

  factory DescribeRobotApplicationResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRobotApplicationResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      imageDigest: json['imageDigest'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final imageDigest = this.imageDigest;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final sources = this.sources;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class DescribeRobotResponse {
  /// The target architecture of the robot application.
  final Architecture? architecture;

  /// The Amazon Resource Name (ARN) of the robot.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the robot was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleetArn;

  /// The Greengrass group id.
  final String? greengrassGroupId;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String? lastDeploymentJob;

  /// The time of the last deployment job.
  final DateTime? lastDeploymentTime;

  /// The name of the robot.
  final String? name;

  /// The status of the fleet.
  final RobotStatus? status;

  /// The list of all tags added to the specified robot.
  final Map<String, String>? tags;

  DescribeRobotResponse({
    this.architecture,
    this.arn,
    this.createdAt,
    this.fleetArn,
    this.greengrassGroupId,
    this.lastDeploymentJob,
    this.lastDeploymentTime,
    this.name,
    this.status,
    this.tags,
  });

  factory DescribeRobotResponse.fromJson(Map<String, dynamic> json) {
    return DescribeRobotResponse(
      architecture: (json['architecture'] as String?)?.toArchitecture(),
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      fleetArn: json['fleetArn'] as String?,
      greengrassGroupId: json['greengrassGroupId'] as String?,
      lastDeploymentJob: json['lastDeploymentJob'] as String?,
      lastDeploymentTime: timeStampFromJson(json['lastDeploymentTime']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toRobotStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fleetArn = this.fleetArn;
    final greengrassGroupId = this.greengrassGroupId;
    final lastDeploymentJob = this.lastDeploymentJob;
    final lastDeploymentTime = this.lastDeploymentTime;
    final name = this.name;
    final status = this.status;
    final tags = this.tags;
    return {
      if (architecture != null) 'architecture': architecture.toValue(),
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (fleetArn != null) 'fleetArn': fleetArn,
      if (greengrassGroupId != null) 'greengrassGroupId': greengrassGroupId,
      if (lastDeploymentJob != null) 'lastDeploymentJob': lastDeploymentJob,
      if (lastDeploymentTime != null)
        'lastDeploymentTime': unixTimestampToJson(lastDeploymentTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribeSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot simulation application.
  final String? arn;

  /// The object that contains the Docker image URI used to create the simulation
  /// application.
  final Environment? environment;

  /// A SHA256 identifier for the Docker image that you use for your simulation
  /// application.
  final String? imageDigest;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the simulation application.
  final String? name;

  /// The rendering engine for the simulation application.
  final RenderingEngine? renderingEngine;

  /// The revision id of the simulation application.
  final String? revisionId;

  /// Information about the robot software suite (ROS distribution).
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite? simulationSoftwareSuite;

  /// The sources of the simulation application.
  final List<Source>? sources;

  /// The list of all tags added to the specified simulation application.
  final Map<String, String>? tags;

  /// The version of the simulation application.
  final String? version;

  DescribeSimulationApplicationResponse({
    this.arn,
    this.environment,
    this.imageDigest,
    this.lastUpdatedAt,
    this.name,
    this.renderingEngine,
    this.revisionId,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
    this.sources,
    this.tags,
    this.version,
  });

  factory DescribeSimulationApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSimulationApplicationResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      imageDigest: json['imageDigest'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      renderingEngine: json['renderingEngine'] != null
          ? RenderingEngine.fromJson(
              json['renderingEngine'] as Map<String, dynamic>)
          : null,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      simulationSoftwareSuite: json['simulationSoftwareSuite'] != null
          ? SimulationSoftwareSuite.fromJson(
              json['simulationSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final imageDigest = this.imageDigest;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final renderingEngine = this.renderingEngine;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final simulationSoftwareSuite = this.simulationSoftwareSuite;
    final sources = this.sources;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (imageDigest != null) 'imageDigest': imageDigest,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (simulationSoftwareSuite != null)
        'simulationSoftwareSuite': simulationSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

class DescribeSimulationJobBatchResponse {
  /// The Amazon Resource Name (ARN) of the batch.
  final String? arn;

  /// The batch policy.
  final BatchPolicy? batchPolicy;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// created.
  final DateTime? createdAt;

  /// A list of created simulation job summaries.
  final List<SimulationJobSummary>? createdRequests;

  /// A list of failed create simulation job requests. The request failed to be
  /// created into a simulation job. Failed requests do not have a simulation job
  /// ID.
  final List<FailedCreateSimulationJobRequest>? failedRequests;

  /// The failure code of the simulation job batch.
  final SimulationJobBatchErrorCode? failureCode;

  /// The reason the simulation job batch failed.
  final String? failureReason;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// A list of pending simulation job requests. These requests have not yet been
  /// created into simulation jobs.
  final List<SimulationJobRequest>? pendingRequests;

  /// The status of the batch.
  /// <dl> <dt>Pending</dt> <dd>
  /// The simulation job batch request is pending.
  /// </dd> <dt>InProgress</dt> <dd>
  /// The simulation job batch is in progress.
  /// </dd> <dt>Failed</dt> <dd>
  /// The simulation job batch failed. One or more simulation job requests could
  /// not be completed due to an internal failure (like
  /// <code>InternalServiceError</code>). See <code>failureCode</code> and
  /// <code>failureReason</code> for more information.
  /// </dd> <dt>Completed</dt> <dd>
  /// The simulation batch job completed. A batch is complete when (1) there are
  /// no pending simulation job requests in the batch and none of the failed
  /// simulation job requests are due to <code>InternalServiceError</code> and (2)
  /// when all created simulation jobs have reached a terminal state (for example,
  /// <code>Completed</code> or <code>Failed</code>).
  /// </dd> <dt>Canceled</dt> <dd>
  /// The simulation batch job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The simulation batch job is being cancelled.
  /// </dd> <dt>Completing</dt> <dd>
  /// The simulation batch job is completing.
  /// </dd> <dt>TimingOut</dt> <dd>
  /// The simulation job batch is timing out.
  ///
  /// If a batch timing out, and there are pending requests that were failing due
  /// to an internal failure (like <code>InternalServiceError</code>), the batch
  /// status will be <code>Failed</code>. If there are no such failing request,
  /// the batch status will be <code>TimedOut</code>.
  /// </dd> <dt>TimedOut</dt> <dd>
  /// The simulation batch job timed out.
  /// </dd> </dl>
  final SimulationJobBatchStatus? status;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job batch.
  final Map<String, String>? tags;

  DescribeSimulationJobBatchResponse({
    this.arn,
    this.batchPolicy,
    this.clientRequestToken,
    this.createdAt,
    this.createdRequests,
    this.failedRequests,
    this.failureCode,
    this.failureReason,
    this.lastUpdatedAt,
    this.pendingRequests,
    this.status,
    this.tags,
  });

  factory DescribeSimulationJobBatchResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeSimulationJobBatchResponse(
      arn: json['arn'] as String?,
      batchPolicy: json['batchPolicy'] != null
          ? BatchPolicy.fromJson(json['batchPolicy'] as Map<String, dynamic>)
          : null,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdRequests: (json['createdRequests'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedRequests: (json['failedRequests'] as List?)
          ?.whereNotNull()
          .map((e) => FailedCreateSimulationJobRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failureCode:
          (json['failureCode'] as String?)?.toSimulationJobBatchErrorCode(),
      failureReason: json['failureReason'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      pendingRequests: (json['pendingRequests'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationJobRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toSimulationJobBatchStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final batchPolicy = this.batchPolicy;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final createdRequests = this.createdRequests;
    final failedRequests = this.failedRequests;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final lastUpdatedAt = this.lastUpdatedAt;
    final pendingRequests = this.pendingRequests;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (batchPolicy != null) 'batchPolicy': batchPolicy,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdRequests != null) 'createdRequests': createdRequests,
      if (failedRequests != null) 'failedRequests': failedRequests,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (pendingRequests != null) 'pendingRequests': pendingRequests,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

class DescribeSimulationJobResponse {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// Compute information for the simulation job.
  final ComputeResponse? compute;

  /// The data sources for the simulation job.
  final List<DataSource>? dataSources;

  /// The failure behavior for the simulation job.
  final FailureBehavior? failureBehavior;

  /// The failure code of the simulation job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>RobotApplicationCrash</dt> <dd>
  /// Robot application exited abnormally.
  /// </dd> <dt>SimulationApplicationCrash</dt> <dd>
  /// Simulation application exited abnormally.
  /// </dd> <dt>BadPermissionsRobotApplication</dt> <dd>
  /// Robot application bundle could not be downloaded.
  /// </dd> <dt>BadPermissionsSimulationApplication</dt> <dd>
  /// Simulation application bundle could not be downloaded.
  /// </dd> <dt>BadPermissionsS3Output</dt> <dd>
  /// Unable to publish outputs to customer-provided S3 bucket.
  /// </dd> <dt>BadPermissionsCloudwatchLogs</dt> <dd>
  /// Unable to publish logs to customer-provided CloudWatch Logs resource.
  /// </dd> <dt>SubnetIpLimitExceeded</dt> <dd>
  /// Subnet IP limit exceeded.
  /// </dd> <dt>ENILimitExceeded</dt> <dd>
  /// ENI limit exceeded.
  /// </dd> <dt>BadPermissionsUserCredentials</dt> <dd>
  /// Unable to use the Role provided.
  /// </dd> <dt>InvalidBundleRobotApplication</dt> <dd>
  /// Robot bundle cannot be extracted (invalid format, bundling error, or other
  /// issue).
  /// </dd> <dt>InvalidBundleSimulationApplication</dt> <dd>
  /// Simulation bundle cannot be extracted (invalid format, bundling error, or
  /// other issue).
  /// </dd> <dt>RobotApplicationVersionMismatchedEtag</dt> <dd>
  /// Etag for RobotApplication does not match value during version creation.
  /// </dd> <dt>SimulationApplicationVersionMismatchedEtag</dt> <dd>
  /// Etag for SimulationApplication does not match value during version creation.
  /// </dd> </dl>
  final SimulationJobErrorCode? failureCode;

  /// Details about why the simulation job failed. For more information about
  /// troubleshooting, see <a
  /// href="https://docs.aws.amazon.com/robomaker/latest/dg/troubleshooting.html">Troubleshooting</a>.
  final String? failureReason;

  /// The IAM role that allows the simulation instance to call the AWS APIs that
  /// are specified in its associated policies on your behalf.
  final String? iamRole;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// started.
  final DateTime? lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The logging configuration.
  final LoggingConfig? loggingConfig;

  /// The maximum job duration in seconds. The value must be 8 days (691,200
  /// seconds) or less.
  final int? maxJobDurationInSeconds;

  /// The name of the simulation job.
  final String? name;

  /// The network interface information for the simulation job.
  final NetworkInterface? networkInterface;

  /// Location for output files generated by the simulation job.
  final OutputLocation? outputLocation;

  /// A list of robot applications.
  final List<RobotApplicationConfig>? robotApplications;

  /// A list of simulation applications.
  final List<SimulationApplicationConfig>? simulationApplications;

  /// The simulation job execution duration in milliseconds.
  final int? simulationTimeMillis;

  /// The status of the simulation job.
  final SimulationJobStatus? status;

  /// The list of all tags added to the specified simulation job.
  final Map<String, String>? tags;

  /// The VPC configuration.
  final VPCConfigResponse? vpcConfig;

  DescribeSimulationJobResponse({
    this.arn,
    this.clientRequestToken,
    this.compute,
    this.dataSources,
    this.failureBehavior,
    this.failureCode,
    this.failureReason,
    this.iamRole,
    this.lastStartedAt,
    this.lastUpdatedAt,
    this.loggingConfig,
    this.maxJobDurationInSeconds,
    this.name,
    this.networkInterface,
    this.outputLocation,
    this.robotApplications,
    this.simulationApplications,
    this.simulationTimeMillis,
    this.status,
    this.tags,
    this.vpcConfig,
  });

  factory DescribeSimulationJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSimulationJobResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      compute: json['compute'] != null
          ? ComputeResponse.fromJson(json['compute'] as Map<String, dynamic>)
          : null,
      dataSources: (json['dataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureBehavior:
          (json['failureBehavior'] as String?)?.toFailureBehavior(),
      failureCode: (json['failureCode'] as String?)?.toSimulationJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      iamRole: json['iamRole'] as String?,
      lastStartedAt: timeStampFromJson(json['lastStartedAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      loggingConfig: json['loggingConfig'] != null
          ? LoggingConfig.fromJson(
              json['loggingConfig'] as Map<String, dynamic>)
          : null,
      maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int?,
      name: json['name'] as String?,
      networkInterface: json['networkInterface'] != null
          ? NetworkInterface.fromJson(
              json['networkInterface'] as Map<String, dynamic>)
          : null,
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      robotApplications: (json['robotApplications'] as List?)
          ?.whereNotNull()
          .map(
              (e) => RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationApplications: (json['simulationApplications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationTimeMillis: json['simulationTimeMillis'] as int?,
      status: (json['status'] as String?)?.toSimulationJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcConfig: json['vpcConfig'] != null
          ? VPCConfigResponse.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final compute = this.compute;
    final dataSources = this.dataSources;
    final failureBehavior = this.failureBehavior;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final iamRole = this.iamRole;
    final lastStartedAt = this.lastStartedAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final loggingConfig = this.loggingConfig;
    final maxJobDurationInSeconds = this.maxJobDurationInSeconds;
    final name = this.name;
    final networkInterface = this.networkInterface;
    final outputLocation = this.outputLocation;
    final robotApplications = this.robotApplications;
    final simulationApplications = this.simulationApplications;
    final simulationTimeMillis = this.simulationTimeMillis;
    final status = this.status;
    final tags = this.tags;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (compute != null) 'compute': compute,
      if (dataSources != null) 'dataSources': dataSources,
      if (failureBehavior != null) 'failureBehavior': failureBehavior.toValue(),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (iamRole != null) 'iamRole': iamRole,
      if (lastStartedAt != null)
        'lastStartedAt': unixTimestampToJson(lastStartedAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (loggingConfig != null) 'loggingConfig': loggingConfig,
      if (maxJobDurationInSeconds != null)
        'maxJobDurationInSeconds': maxJobDurationInSeconds,
      if (name != null) 'name': name,
      if (networkInterface != null) 'networkInterface': networkInterface,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (robotApplications != null) 'robotApplications': robotApplications,
      if (simulationApplications != null)
        'simulationApplications': simulationApplications,
      if (simulationTimeMillis != null)
        'simulationTimeMillis': simulationTimeMillis,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

class DescribeWorldExportJobResponse {
  /// The Amazon Resource Name (ARN) of the world export job.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world export job was
  /// created.
  final DateTime? createdAt;

  /// The failure code of the world export job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>LimitExceeded</dt> <dd>
  /// The requested resource exceeds the maximum number allowed, or the number of
  /// concurrent stream requests exceeds the maximum number allowed.
  /// </dd> <dt>ResourceNotFound</dt> <dd>
  /// The specified resource could not be found.
  /// </dd> <dt>RequestThrottled</dt> <dd>
  /// The request was throttled.
  /// </dd> <dt>InvalidInput</dt> <dd>
  /// An input parameter in the request is not valid.
  /// </dd> </dl>
  final WorldExportJobErrorCode? failureCode;

  /// The reason why the world export job failed.
  final String? failureReason;

  /// The IAM role that the world export process uses to access the Amazon S3
  /// bucket and put the export.
  final String? iamRole;
  final OutputLocation? outputLocation;

  /// The status of the world export job.
  /// <dl> <dt>Pending</dt> <dd>
  /// The world export job request is pending.
  /// </dd> <dt>Running</dt> <dd>
  /// The world export job is running.
  /// </dd> <dt>Completed</dt> <dd>
  /// The world export job completed.
  /// </dd> <dt>Failed</dt> <dd>
  /// The world export job failed. See <code>failureCode</code> and
  /// <code>failureReason</code> for more information.
  /// </dd> <dt>Canceled</dt> <dd>
  /// The world export job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The world export job is being cancelled.
  /// </dd> </dl>
  final WorldExportJobStatus? status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// export job.
  final Map<String, String>? tags;

  /// A list of Amazon Resource Names (arns) that correspond to worlds to be
  /// exported.
  final List<String>? worlds;

  DescribeWorldExportJobResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.failureCode,
    this.failureReason,
    this.iamRole,
    this.outputLocation,
    this.status,
    this.tags,
    this.worlds,
  });

  factory DescribeWorldExportJobResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorldExportJobResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      failureCode:
          (json['failureCode'] as String?)?.toWorldExportJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      iamRole: json['iamRole'] as String?,
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toWorldExportJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      worlds: (json['worlds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final iamRole = this.iamRole;
    final outputLocation = this.outputLocation;
    final status = this.status;
    final tags = this.tags;
    final worlds = this.worlds;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (iamRole != null) 'iamRole': iamRole,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (worlds != null) 'worlds': worlds,
    };
  }
}

class DescribeWorldGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the world generation job.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world generation job was
  /// created.
  final DateTime? createdAt;

  /// The failure code of the world generation job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>LimitExceeded</dt> <dd>
  /// The requested resource exceeds the maximum number allowed, or the number of
  /// concurrent stream requests exceeds the maximum number allowed.
  /// </dd> <dt>ResourceNotFound</dt> <dd>
  /// The specified resource could not be found.
  /// </dd> <dt>RequestThrottled</dt> <dd>
  /// The request was throttled.
  /// </dd> <dt>InvalidInput</dt> <dd>
  /// An input parameter in the request is not valid.
  /// </dd> </dl>
  final WorldGenerationJobErrorCode? failureCode;

  /// The reason why the world generation job failed.
  final String? failureReason;

  /// Summary information about finished worlds.
  final FinishedWorldsSummary? finishedWorldsSummary;

  /// The status of the world generation job:
  /// <dl> <dt>Pending</dt> <dd>
  /// The world generation job request is pending.
  /// </dd> <dt>Running</dt> <dd>
  /// The world generation job is running.
  /// </dd> <dt>Completed</dt> <dd>
  /// The world generation job completed.
  /// </dd> <dt>Failed</dt> <dd>
  /// The world generation job failed. See <code>failureCode</code> for more
  /// information.
  /// </dd> <dt>PartialFailed</dt> <dd>
  /// Some worlds did not generate.
  /// </dd> <dt>Canceled</dt> <dd>
  /// The world generation job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The world generation job is being cancelled.
  /// </dd> </dl>
  final WorldGenerationJobStatus? status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// generation job.
  final Map<String, String>? tags;

  /// The Amazon Resource Name (arn) of the world template.
  final String? template;

  /// Information about the world count.
  final WorldCount? worldCount;

  /// A map that contains tag keys and tag values that are attached to the
  /// generated worlds.
  final Map<String, String>? worldTags;

  DescribeWorldGenerationJobResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.failureCode,
    this.failureReason,
    this.finishedWorldsSummary,
    this.status,
    this.tags,
    this.template,
    this.worldCount,
    this.worldTags,
  });

  factory DescribeWorldGenerationJobResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeWorldGenerationJobResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      failureCode:
          (json['failureCode'] as String?)?.toWorldGenerationJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      finishedWorldsSummary: json['finishedWorldsSummary'] != null
          ? FinishedWorldsSummary.fromJson(
              json['finishedWorldsSummary'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toWorldGenerationJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      template: json['template'] as String?,
      worldCount: json['worldCount'] != null
          ? WorldCount.fromJson(json['worldCount'] as Map<String, dynamic>)
          : null,
      worldTags: (json['worldTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final finishedWorldsSummary = this.finishedWorldsSummary;
    final status = this.status;
    final tags = this.tags;
    final template = this.template;
    final worldCount = this.worldCount;
    final worldTags = this.worldTags;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (finishedWorldsSummary != null)
        'finishedWorldsSummary': finishedWorldsSummary,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (template != null) 'template': template,
      if (worldCount != null) 'worldCount': worldCount,
      if (worldTags != null) 'worldTags': worldTags,
    };
  }
}

class DescribeWorldResponse {
  /// The Amazon Resource Name (arn) of the world.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the world was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (arn) of the world generation job that generated
  /// the world.
  final String? generationJob;

  /// A map that contains tag keys and tag values that are attached to the world.
  final Map<String, String>? tags;

  /// The world template.
  final String? template;

  /// Returns the JSON formatted string that describes the contents of your world.
  final String? worldDescriptionBody;

  DescribeWorldResponse({
    this.arn,
    this.createdAt,
    this.generationJob,
    this.tags,
    this.template,
    this.worldDescriptionBody,
  });

  factory DescribeWorldResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorldResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      generationJob: json['generationJob'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      template: json['template'] as String?,
      worldDescriptionBody: json['worldDescriptionBody'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final generationJob = this.generationJob;
    final tags = this.tags;
    final template = this.template;
    final worldDescriptionBody = this.worldDescriptionBody;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (generationJob != null) 'generationJob': generationJob,
      if (tags != null) 'tags': tags,
      if (template != null) 'template': template,
      if (worldDescriptionBody != null)
        'worldDescriptionBody': worldDescriptionBody,
    };
  }
}

class DescribeWorldTemplateResponse {
  /// The Amazon Resource Name (ARN) of the world template.
  final String? arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world template was
  /// created.
  final DateTime? createdAt;

  /// The time, in milliseconds since the epoch, when the world template was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The name of the world template.
  final String? name;

  /// A map that contains tag keys and tag values that are attached to the world
  /// template.
  final Map<String, String>? tags;

  /// The version of the world template that you're using.
  final String? version;

  DescribeWorldTemplateResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.tags,
    this.version,
  });

  factory DescribeWorldTemplateResponse.fromJson(Map<String, dynamic> json) {
    return DescribeWorldTemplateResponse(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final tags = this.tags;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (version != null) 'version': version,
    };
  }
}

/// The object that contains the Docker image URI for either your robot or
/// simulation applications.
class Environment {
  /// The Docker image URI for either your robot or simulation applications.
  final String? uri;

  Environment({
    this.uri,
  });

  factory Environment.fromJson(Map<String, dynamic> json) {
    return Environment(
      uri: json['uri'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final uri = this.uri;
    return {
      if (uri != null) 'uri': uri,
    };
  }
}

enum ExitBehavior {
  fail,
  restart,
}

extension ExitBehaviorValueExtension on ExitBehavior {
  String toValue() {
    switch (this) {
      case ExitBehavior.fail:
        return 'FAIL';
      case ExitBehavior.restart:
        return 'RESTART';
    }
  }
}

extension ExitBehaviorFromString on String {
  ExitBehavior toExitBehavior() {
    switch (this) {
      case 'FAIL':
        return ExitBehavior.fail;
      case 'RESTART':
        return ExitBehavior.restart;
    }
    throw Exception('$this is not known in enum ExitBehavior');
  }
}

/// Information about a failed create simulation job request.
class FailedCreateSimulationJobRequest {
  /// The time, in milliseconds since the epoch, when the simulation job batch
  /// failed.
  final DateTime? failedAt;

  /// The failure code.
  final SimulationJobErrorCode? failureCode;

  /// The failure reason of the simulation job request.
  final String? failureReason;

  /// The simulation job request.
  final SimulationJobRequest? request;

  FailedCreateSimulationJobRequest({
    this.failedAt,
    this.failureCode,
    this.failureReason,
    this.request,
  });

  factory FailedCreateSimulationJobRequest.fromJson(Map<String, dynamic> json) {
    return FailedCreateSimulationJobRequest(
      failedAt: timeStampFromJson(json['failedAt']),
      failureCode: (json['failureCode'] as String?)?.toSimulationJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      request: json['request'] != null
          ? SimulationJobRequest.fromJson(
              json['request'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final failedAt = this.failedAt;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final request = this.request;
    return {
      if (failedAt != null) 'failedAt': unixTimestampToJson(failedAt),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (request != null) 'request': request,
    };
  }
}

enum FailureBehavior {
  fail,
  $continue,
}

extension FailureBehaviorValueExtension on FailureBehavior {
  String toValue() {
    switch (this) {
      case FailureBehavior.fail:
        return 'Fail';
      case FailureBehavior.$continue:
        return 'Continue';
    }
  }
}

extension FailureBehaviorFromString on String {
  FailureBehavior toFailureBehavior() {
    switch (this) {
      case 'Fail':
        return FailureBehavior.fail;
      case 'Continue':
        return FailureBehavior.$continue;
    }
    throw Exception('$this is not known in enum FailureBehavior');
  }
}

/// Information about worlds that failed.
class FailureSummary {
  /// The worlds that failed.
  final List<WorldFailure>? failures;

  /// The total number of failures.
  final int? totalFailureCount;

  FailureSummary({
    this.failures,
    this.totalFailureCount,
  });

  factory FailureSummary.fromJson(Map<String, dynamic> json) {
    return FailureSummary(
      failures: (json['failures'] as List?)
          ?.whereNotNull()
          .map((e) => WorldFailure.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalFailureCount: json['totalFailureCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final failures = this.failures;
    final totalFailureCount = this.totalFailureCount;
    return {
      if (failures != null) 'failures': failures,
      if (totalFailureCount != null) 'totalFailureCount': totalFailureCount,
    };
  }
}

/// Information about a filter.
class Filter {
  /// The name of the filter.
  final String? name;

  /// A list of values.
  final List<String>? values;

  Filter({
    this.name,
    this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      if (name != null) 'name': name,
      if (values != null) 'values': values,
    };
  }
}

/// Information about worlds that finished.
class FinishedWorldsSummary {
  /// Information about worlds that failed.
  final FailureSummary? failureSummary;

  /// The total number of finished worlds.
  final int? finishedCount;

  /// A list of worlds that succeeded.
  final List<String>? succeededWorlds;

  FinishedWorldsSummary({
    this.failureSummary,
    this.finishedCount,
    this.succeededWorlds,
  });

  factory FinishedWorldsSummary.fromJson(Map<String, dynamic> json) {
    return FinishedWorldsSummary(
      failureSummary: json['failureSummary'] != null
          ? FailureSummary.fromJson(
              json['failureSummary'] as Map<String, dynamic>)
          : null,
      finishedCount: json['finishedCount'] as int?,
      succeededWorlds: (json['succeededWorlds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final failureSummary = this.failureSummary;
    final finishedCount = this.finishedCount;
    final succeededWorlds = this.succeededWorlds;
    return {
      if (failureSummary != null) 'failureSummary': failureSummary,
      if (finishedCount != null) 'finishedCount': finishedCount,
      if (succeededWorlds != null) 'succeededWorlds': succeededWorlds,
    };
  }
}

/// Information about a fleet.
class Fleet {
  /// The Amazon Resource Name (ARN) of the fleet.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String? lastDeploymentJob;

  /// The status of the last fleet deployment.
  final DeploymentStatus? lastDeploymentStatus;

  /// The time of the last deployment.
  final DateTime? lastDeploymentTime;

  /// The name of the fleet.
  final String? name;

  Fleet({
    this.arn,
    this.createdAt,
    this.lastDeploymentJob,
    this.lastDeploymentStatus,
    this.lastDeploymentTime,
    this.name,
  });

  factory Fleet.fromJson(Map<String, dynamic> json) {
    return Fleet(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastDeploymentJob: json['lastDeploymentJob'] as String?,
      lastDeploymentStatus:
          (json['lastDeploymentStatus'] as String?)?.toDeploymentStatus(),
      lastDeploymentTime: timeStampFromJson(json['lastDeploymentTime']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastDeploymentJob = this.lastDeploymentJob;
    final lastDeploymentStatus = this.lastDeploymentStatus;
    final lastDeploymentTime = this.lastDeploymentTime;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastDeploymentJob != null) 'lastDeploymentJob': lastDeploymentJob,
      if (lastDeploymentStatus != null)
        'lastDeploymentStatus': lastDeploymentStatus.toValue(),
      if (lastDeploymentTime != null)
        'lastDeploymentTime': unixTimestampToJson(lastDeploymentTime),
      if (name != null) 'name': name,
    };
  }
}

class GetWorldTemplateBodyResponse {
  /// The world template body.
  final String? templateBody;

  GetWorldTemplateBodyResponse({
    this.templateBody,
  });

  factory GetWorldTemplateBodyResponse.fromJson(Map<String, dynamic> json) {
    return GetWorldTemplateBodyResponse(
      templateBody: json['templateBody'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final templateBody = this.templateBody;
    return {
      if (templateBody != null) 'templateBody': templateBody,
    };
  }
}

/// Information about a launch configuration.
class LaunchConfig {
  /// If you've specified <code>General</code> as the value for your
  /// <code>RobotSoftwareSuite</code>, you can use this field to specify a list of
  /// commands for your container image.
  ///
  /// If you've specified <code>SimulationRuntime</code> as the value for your
  /// <code>SimulationSoftwareSuite</code>, you can use this field to specify a
  /// list of commands for your container image.
  final List<String>? command;

  /// The environment variables for the application launch.
  final Map<String, String>? environmentVariables;

  /// The launch file name.
  final String? launchFile;

  /// The package name.
  final String? packageName;

  /// The port forwarding configuration.
  final PortForwardingConfig? portForwardingConfig;

  /// Boolean indicating whether a streaming session will be configured for the
  /// application. If <code>True</code>, AWS RoboMaker will configure a connection
  /// so you can interact with your application as it is running in the
  /// simulation. You must configure and launch the component. It must have a
  /// graphical user interface.
  final bool? streamUI;

  LaunchConfig({
    this.command,
    this.environmentVariables,
    this.launchFile,
    this.packageName,
    this.portForwardingConfig,
    this.streamUI,
  });

  factory LaunchConfig.fromJson(Map<String, dynamic> json) {
    return LaunchConfig(
      command: (json['command'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      environmentVariables:
          (json['environmentVariables'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k, e as String)),
      launchFile: json['launchFile'] as String?,
      packageName: json['packageName'] as String?,
      portForwardingConfig: json['portForwardingConfig'] != null
          ? PortForwardingConfig.fromJson(
              json['portForwardingConfig'] as Map<String, dynamic>)
          : null,
      streamUI: json['streamUI'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final environmentVariables = this.environmentVariables;
    final launchFile = this.launchFile;
    final packageName = this.packageName;
    final portForwardingConfig = this.portForwardingConfig;
    final streamUI = this.streamUI;
    return {
      if (command != null) 'command': command,
      if (environmentVariables != null)
        'environmentVariables': environmentVariables,
      if (launchFile != null) 'launchFile': launchFile,
      if (packageName != null) 'packageName': packageName,
      if (portForwardingConfig != null)
        'portForwardingConfig': portForwardingConfig,
      if (streamUI != null) 'streamUI': streamUI,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class ListDeploymentJobsResponse {
  /// A list of deployment jobs that meet the criteria of the request.
  final List<DeploymentJob>? deploymentJobs;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListDeploymentJobs</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  ListDeploymentJobsResponse({
    this.deploymentJobs,
    this.nextToken,
  });

  factory ListDeploymentJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListDeploymentJobsResponse(
      deploymentJobs: (json['deploymentJobs'] as List?)
          ?.whereNotNull()
          .map((e) => DeploymentJob.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final deploymentJobs = this.deploymentJobs;
    final nextToken = this.nextToken;
    return {
      if (deploymentJobs != null) 'deploymentJobs': deploymentJobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class ListFleetsResponse {
  /// A list of fleet details meeting the request criteria.
  final List<Fleet>? fleetDetails;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListFleets</code> again and assign that token to the request object's
  /// <code>nextToken</code> parameter. If there are no remaining results, the
  /// previous response object's NextToken parameter is set to null.
  final String? nextToken;

  ListFleetsResponse({
    this.fleetDetails,
    this.nextToken,
  });

  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetsResponse(
      fleetDetails: (json['fleetDetails'] as List?)
          ?.whereNotNull()
          .map((e) => Fleet.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetDetails = this.fleetDetails;
    final nextToken = this.nextToken;
    return {
      if (fleetDetails != null) 'fleetDetails': fleetDetails,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListRobotApplicationsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListRobotApplications</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  /// A list of robot application summaries that meet the criteria of the request.
  final List<RobotApplicationSummary>? robotApplicationSummaries;

  ListRobotApplicationsResponse({
    this.nextToken,
    this.robotApplicationSummaries,
  });

  factory ListRobotApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListRobotApplicationsResponse(
      nextToken: json['nextToken'] as String?,
      robotApplicationSummaries: (json['robotApplicationSummaries'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RobotApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final robotApplicationSummaries = this.robotApplicationSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (robotApplicationSummaries != null)
        'robotApplicationSummaries': robotApplicationSummaries,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class ListRobotsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListRobots</code> again and assign that token to the request object's
  /// <code>nextToken</code> parameter. If there are no remaining results, the
  /// previous response object's NextToken parameter is set to null.
  final String? nextToken;

  /// A list of robots that meet the criteria of the request.
  final List<Robot>? robots;

  ListRobotsResponse({
    this.nextToken,
    this.robots,
  });

  factory ListRobotsResponse.fromJson(Map<String, dynamic> json) {
    return ListRobotsResponse(
      nextToken: json['nextToken'] as String?,
      robots: (json['robots'] as List?)
          ?.whereNotNull()
          .map((e) => Robot.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final robots = this.robots;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (robots != null) 'robots': robots,
    };
  }
}

class ListSimulationApplicationsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListSimulationApplications</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  /// A list of simulation application summaries that meet the criteria of the
  /// request.
  final List<SimulationApplicationSummary>? simulationApplicationSummaries;

  ListSimulationApplicationsResponse({
    this.nextToken,
    this.simulationApplicationSummaries,
  });

  factory ListSimulationApplicationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListSimulationApplicationsResponse(
      nextToken: json['nextToken'] as String?,
      simulationApplicationSummaries: (json['simulationApplicationSummaries']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              SimulationApplicationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final simulationApplicationSummaries = this.simulationApplicationSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (simulationApplicationSummaries != null)
        'simulationApplicationSummaries': simulationApplicationSummaries,
    };
  }
}

class ListSimulationJobBatchesResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListSimulationJobBatches</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  /// A list of simulation job batch summaries.
  final List<SimulationJobBatchSummary>? simulationJobBatchSummaries;

  ListSimulationJobBatchesResponse({
    this.nextToken,
    this.simulationJobBatchSummaries,
  });

  factory ListSimulationJobBatchesResponse.fromJson(Map<String, dynamic> json) {
    return ListSimulationJobBatchesResponse(
      nextToken: json['nextToken'] as String?,
      simulationJobBatchSummaries:
          (json['simulationJobBatchSummaries'] as List?)
              ?.whereNotNull()
              .map((e) =>
                  SimulationJobBatchSummary.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final simulationJobBatchSummaries = this.simulationJobBatchSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (simulationJobBatchSummaries != null)
        'simulationJobBatchSummaries': simulationJobBatchSummaries,
    };
  }
}

class ListSimulationJobsResponse {
  /// A list of simulation job summaries that meet the criteria of the request.
  final List<SimulationJobSummary> simulationJobSummaries;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListSimulationJobs</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  ListSimulationJobsResponse({
    required this.simulationJobSummaries,
    this.nextToken,
  });

  factory ListSimulationJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListSimulationJobsResponse(
      simulationJobSummaries: (json['simulationJobSummaries'] as List)
          .whereNotNull()
          .map((e) => SimulationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final simulationJobSummaries = this.simulationJobSummaries;
    final nextToken = this.nextToken;
    return {
      'simulationJobSummaries': simulationJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The list of all tags added to the specified resource.
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

class ListWorldExportJobsResponse {
  /// Summary information for world export jobs.
  final List<WorldExportJobSummary> worldExportJobSummaries;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorldExportJobsRequest</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  ListWorldExportJobsResponse({
    required this.worldExportJobSummaries,
    this.nextToken,
  });

  factory ListWorldExportJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorldExportJobsResponse(
      worldExportJobSummaries: (json['worldExportJobSummaries'] as List)
          .whereNotNull()
          .map((e) => WorldExportJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final worldExportJobSummaries = this.worldExportJobSummaries;
    final nextToken = this.nextToken;
    return {
      'worldExportJobSummaries': worldExportJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorldGenerationJobsResponse {
  /// Summary information for world generator jobs.
  final List<WorldGenerationJobSummary> worldGenerationJobSummaries;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorldGeneratorJobsRequest</code> again and assign that token to
  /// the request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is set
  /// to null.
  final String? nextToken;

  ListWorldGenerationJobsResponse({
    required this.worldGenerationJobSummaries,
    this.nextToken,
  });

  factory ListWorldGenerationJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorldGenerationJobsResponse(
      worldGenerationJobSummaries: (json['worldGenerationJobSummaries'] as List)
          .whereNotNull()
          .map((e) =>
              WorldGenerationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final worldGenerationJobSummaries = this.worldGenerationJobSummaries;
    final nextToken = this.nextToken;
    return {
      'worldGenerationJobSummaries': worldGenerationJobSummaries,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorldTemplatesResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorldTemplates</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  final String? nextToken;

  /// Summary information for templates.
  final List<TemplateSummary>? templateSummaries;

  ListWorldTemplatesResponse({
    this.nextToken,
    this.templateSummaries,
  });

  factory ListWorldTemplatesResponse.fromJson(Map<String, dynamic> json) {
    return ListWorldTemplatesResponse(
      nextToken: json['nextToken'] as String?,
      templateSummaries: (json['templateSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => TemplateSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final templateSummaries = this.templateSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (templateSummaries != null) 'templateSummaries': templateSummaries,
    };
  }
}

class ListWorldsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorlds</code> again and assign that token to the request object's
  /// <code>nextToken</code> parameter. If there are no remaining results, the
  /// previous response object's NextToken parameter is set to null.
  final String? nextToken;

  /// Summary information for worlds.
  final List<WorldSummary>? worldSummaries;

  ListWorldsResponse({
    this.nextToken,
    this.worldSummaries,
  });

  factory ListWorldsResponse.fromJson(Map<String, dynamic> json) {
    return ListWorldsResponse(
      nextToken: json['nextToken'] as String?,
      worldSummaries: (json['worldSummaries'] as List?)
          ?.whereNotNull()
          .map((e) => WorldSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextToken = this.nextToken;
    final worldSummaries = this.worldSummaries;
    return {
      if (nextToken != null) 'nextToken': nextToken,
      if (worldSummaries != null) 'worldSummaries': worldSummaries,
    };
  }
}

/// The logging configuration.
class LoggingConfig {
  /// A boolean indicating whether to record all ROS topics.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  final bool? recordAllRosTopics;

  LoggingConfig({
    this.recordAllRosTopics,
  });

  factory LoggingConfig.fromJson(Map<String, dynamic> json) {
    return LoggingConfig(
      recordAllRosTopics: json['recordAllRosTopics'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final recordAllRosTopics = this.recordAllRosTopics;
    return {
      if (recordAllRosTopics != null) 'recordAllRosTopics': recordAllRosTopics,
    };
  }
}

/// Describes a network interface.
class NetworkInterface {
  /// The ID of the network interface.
  final String? networkInterfaceId;

  /// The IPv4 address of the network interface within the subnet.
  final String? privateIpAddress;

  /// The IPv4 public address of the network interface.
  final String? publicIpAddress;

  NetworkInterface({
    this.networkInterfaceId,
    this.privateIpAddress,
    this.publicIpAddress,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      networkInterfaceId: json['networkInterfaceId'] as String?,
      privateIpAddress: json['privateIpAddress'] as String?,
      publicIpAddress: json['publicIpAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final networkInterfaceId = this.networkInterfaceId;
    final privateIpAddress = this.privateIpAddress;
    final publicIpAddress = this.publicIpAddress;
    return {
      if (networkInterfaceId != null) 'networkInterfaceId': networkInterfaceId,
      if (privateIpAddress != null) 'privateIpAddress': privateIpAddress,
      if (publicIpAddress != null) 'publicIpAddress': publicIpAddress,
    };
  }
}

/// The output location.
class OutputLocation {
  /// The S3 bucket for output.
  final String? s3Bucket;

  /// The S3 folder in the <code>s3Bucket</code> where output files will be
  /// placed.
  final String? s3Prefix;

  OutputLocation({
    this.s3Bucket,
    this.s3Prefix,
  });

  factory OutputLocation.fromJson(Map<String, dynamic> json) {
    return OutputLocation(
      s3Bucket: json['s3Bucket'] as String?,
      s3Prefix: json['s3Prefix'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Prefix = this.s3Prefix;
    return {
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Prefix != null) 's3Prefix': s3Prefix,
    };
  }
}

/// Configuration information for port forwarding.
class PortForwardingConfig {
  /// The port mappings for the configuration.
  final List<PortMapping>? portMappings;

  PortForwardingConfig({
    this.portMappings,
  });

  factory PortForwardingConfig.fromJson(Map<String, dynamic> json) {
    return PortForwardingConfig(
      portMappings: (json['portMappings'] as List?)
          ?.whereNotNull()
          .map((e) => PortMapping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final portMappings = this.portMappings;
    return {
      if (portMappings != null) 'portMappings': portMappings,
    };
  }
}

/// An object representing a port mapping.
class PortMapping {
  /// The port number on the application.
  final int applicationPort;

  /// The port number on the simulation job instance to use as a remote connection
  /// point.
  final int jobPort;

  /// A Boolean indicating whether to enable this port mapping on public IP.
  final bool? enableOnPublicIp;

  PortMapping({
    required this.applicationPort,
    required this.jobPort,
    this.enableOnPublicIp,
  });

  factory PortMapping.fromJson(Map<String, dynamic> json) {
    return PortMapping(
      applicationPort: json['applicationPort'] as int,
      jobPort: json['jobPort'] as int,
      enableOnPublicIp: json['enableOnPublicIp'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationPort = this.applicationPort;
    final jobPort = this.jobPort;
    final enableOnPublicIp = this.enableOnPublicIp;
    return {
      'applicationPort': applicationPort,
      'jobPort': jobPort,
      if (enableOnPublicIp != null) 'enableOnPublicIp': enableOnPublicIp,
    };
  }
}

/// Information about the progress of a deployment job.
class ProgressDetail {
  /// The current progress status.
  /// <dl> <dt>Validating</dt> <dd>
  /// Validating the deployment.
  /// </dd> <dt>DownloadingExtracting</dt> <dd>
  /// Downloading and extracting the bundle on the robot.
  /// </dd> <dt>ExecutingPreLaunch</dt> <dd>
  /// Executing pre-launch script(s) if provided.
  /// </dd> <dt>Launching</dt> <dd>
  /// Launching the robot application.
  /// </dd> <dt>ExecutingPostLaunch</dt> <dd>
  /// Executing post-launch script(s) if provided.
  /// </dd> <dt>Finished</dt> <dd>
  /// Deployment is complete.
  /// </dd> </dl>
  final RobotDeploymentStep? currentProgress;

  /// Estimated amount of time in seconds remaining in the step. This currently
  /// only applies to the <code>Downloading/Extracting</code> step of the
  /// deployment. It is empty for other steps.
  final int? estimatedTimeRemainingSeconds;

  /// Precentage of the step that is done. This currently only applies to the
  /// <code>Downloading/Extracting</code> step of the deployment. It is empty for
  /// other steps.
  final double? percentDone;

  /// The Amazon Resource Name (ARN) of the deployment job.
  final String? targetResource;

  ProgressDetail({
    this.currentProgress,
    this.estimatedTimeRemainingSeconds,
    this.percentDone,
    this.targetResource,
  });

  factory ProgressDetail.fromJson(Map<String, dynamic> json) {
    return ProgressDetail(
      currentProgress:
          (json['currentProgress'] as String?)?.toRobotDeploymentStep(),
      estimatedTimeRemainingSeconds:
          json['estimatedTimeRemainingSeconds'] as int?,
      percentDone: json['percentDone'] as double?,
      targetResource: json['targetResource'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final currentProgress = this.currentProgress;
    final estimatedTimeRemainingSeconds = this.estimatedTimeRemainingSeconds;
    final percentDone = this.percentDone;
    final targetResource = this.targetResource;
    return {
      if (currentProgress != null) 'currentProgress': currentProgress.toValue(),
      if (estimatedTimeRemainingSeconds != null)
        'estimatedTimeRemainingSeconds': estimatedTimeRemainingSeconds,
      if (percentDone != null) 'percentDone': percentDone,
      if (targetResource != null) 'targetResource': targetResource,
    };
  }
}

@Deprecated(
    'AWS RoboMaker is unable to process this request as the support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class RegisterRobotResponse {
  /// The Amazon Resource Name (ARN) of the fleet that the robot will join.
  final String? fleet;

  /// Information about the robot registration.
  final String? robot;

  RegisterRobotResponse({
    this.fleet,
    this.robot,
  });

  factory RegisterRobotResponse.fromJson(Map<String, dynamic> json) {
    return RegisterRobotResponse(
      fleet: json['fleet'] as String?,
      robot: json['robot'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleet = this.fleet;
    final robot = this.robot;
    return {
      if (fleet != null) 'fleet': fleet,
      if (robot != null) 'robot': robot,
    };
  }
}

/// Information about a rendering engine.
class RenderingEngine {
  /// The name of the rendering engine.
  final RenderingEngineType? name;

  /// The version of the rendering engine.
  final String? version;

  RenderingEngine({
    this.name,
    this.version,
  });

  factory RenderingEngine.fromJson(Map<String, dynamic> json) {
    return RenderingEngine(
      name: (json['name'] as String?)?.toRenderingEngineType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'name': name.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum RenderingEngineType {
  ogre,
}

extension RenderingEngineTypeValueExtension on RenderingEngineType {
  String toValue() {
    switch (this) {
      case RenderingEngineType.ogre:
        return 'OGRE';
    }
  }
}

extension RenderingEngineTypeFromString on String {
  RenderingEngineType toRenderingEngineType() {
    switch (this) {
      case 'OGRE':
        return RenderingEngineType.ogre;
    }
    throw Exception('$this is not known in enum RenderingEngineType');
  }
}

class RestartSimulationJobResponse {
  RestartSimulationJobResponse();

  factory RestartSimulationJobResponse.fromJson(Map<String, dynamic> _) {
    return RestartSimulationJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Information about a robot.
class Robot {
  /// The architecture of the robot.
  final Architecture? architecture;

  /// The Amazon Resource Name (ARN) of the robot.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the robot was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleetArn;

  /// The Greengrass group associated with the robot.
  final String? greenGrassGroupId;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  final String? lastDeploymentJob;

  /// The time of the last deployment.
  final DateTime? lastDeploymentTime;

  /// The name of the robot.
  final String? name;

  /// The status of the robot.
  final RobotStatus? status;

  Robot({
    this.architecture,
    this.arn,
    this.createdAt,
    this.fleetArn,
    this.greenGrassGroupId,
    this.lastDeploymentJob,
    this.lastDeploymentTime,
    this.name,
    this.status,
  });

  factory Robot.fromJson(Map<String, dynamic> json) {
    return Robot(
      architecture: (json['architecture'] as String?)?.toArchitecture(),
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      fleetArn: json['fleetArn'] as String?,
      greenGrassGroupId: json['greenGrassGroupId'] as String?,
      lastDeploymentJob: json['lastDeploymentJob'] as String?,
      lastDeploymentTime: timeStampFromJson(json['lastDeploymentTime']),
      name: json['name'] as String?,
      status: (json['status'] as String?)?.toRobotStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final arn = this.arn;
    final createdAt = this.createdAt;
    final fleetArn = this.fleetArn;
    final greenGrassGroupId = this.greenGrassGroupId;
    final lastDeploymentJob = this.lastDeploymentJob;
    final lastDeploymentTime = this.lastDeploymentTime;
    final name = this.name;
    final status = this.status;
    return {
      if (architecture != null) 'architecture': architecture.toValue(),
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (fleetArn != null) 'fleetArn': fleetArn,
      if (greenGrassGroupId != null) 'greenGrassGroupId': greenGrassGroupId,
      if (lastDeploymentJob != null) 'lastDeploymentJob': lastDeploymentJob,
      if (lastDeploymentTime != null)
        'lastDeploymentTime': unixTimestampToJson(lastDeploymentTime),
      if (name != null) 'name': name,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Application configuration information for a robot.
class RobotApplicationConfig {
  /// The application information for the robot application.
  final String application;

  /// The launch configuration for the robot application.
  final LaunchConfig launchConfig;

  /// The version of the robot application.
  final String? applicationVersion;

  /// Information about tools configured for the robot application.
  final List<Tool>? tools;

  /// The upload configurations for the robot application.
  final List<UploadConfiguration>? uploadConfigurations;

  /// A Boolean indicating whether to use default robot application tools. The
  /// default tools are rviz, rqt, terminal and rosbag record. The default is
  /// <code>False</code>.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  final bool? useDefaultTools;

  /// A Boolean indicating whether to use default upload configurations. By
  /// default, <code>.ros</code> and <code>.gazebo</code> files are uploaded when
  /// the application terminates and all ROS topics will be recorded.
  ///
  /// If you set this value, you must specify an <code>outputLocation</code>.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  final bool? useDefaultUploadConfigurations;

  RobotApplicationConfig({
    required this.application,
    required this.launchConfig,
    this.applicationVersion,
    this.tools,
    this.uploadConfigurations,
    this.useDefaultTools,
    this.useDefaultUploadConfigurations,
  });

  factory RobotApplicationConfig.fromJson(Map<String, dynamic> json) {
    return RobotApplicationConfig(
      application: json['application'] as String,
      launchConfig:
          LaunchConfig.fromJson(json['launchConfig'] as Map<String, dynamic>),
      applicationVersion: json['applicationVersion'] as String?,
      tools: (json['tools'] as List?)
          ?.whereNotNull()
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploadConfigurations: (json['uploadConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => UploadConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      useDefaultTools: json['useDefaultTools'] as bool?,
      useDefaultUploadConfigurations:
          json['useDefaultUploadConfigurations'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    final launchConfig = this.launchConfig;
    final applicationVersion = this.applicationVersion;
    final tools = this.tools;
    final uploadConfigurations = this.uploadConfigurations;
    final useDefaultTools = this.useDefaultTools;
    final useDefaultUploadConfigurations = this.useDefaultUploadConfigurations;
    return {
      'application': application,
      'launchConfig': launchConfig,
      if (applicationVersion != null) 'applicationVersion': applicationVersion,
      if (tools != null) 'tools': tools,
      if (uploadConfigurations != null)
        'uploadConfigurations': uploadConfigurations,
      if (useDefaultTools != null) 'useDefaultTools': useDefaultTools,
      if (useDefaultUploadConfigurations != null)
        'useDefaultUploadConfigurations': useDefaultUploadConfigurations,
    };
  }
}

/// Summary information for a robot application.
class RobotApplicationSummary {
  /// The Amazon Resource Name (ARN) of the robot.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the robot application.
  final String? name;

  /// Information about a robot software suite (ROS distribution).
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The version of the robot application.
  final String? version;

  RobotApplicationSummary({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.robotSoftwareSuite,
    this.version,
  });

  factory RobotApplicationSummary.fromJson(Map<String, dynamic> json) {
    return RobotApplicationSummary(
      arn: json['arn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (version != null) 'version': version,
    };
  }
}

/// Information about a robot deployment.
class RobotDeployment {
  /// The robot deployment Amazon Resource Name (ARN).
  final String? arn;

  /// The time, in milliseconds since the epoch, when the deployment finished.
  final DateTime? deploymentFinishTime;

  /// The time, in milliseconds since the epoch, when the deployment was started.
  final DateTime? deploymentStartTime;

  /// The robot deployment failure code.
  final DeploymentJobErrorCode? failureCode;

  /// A short description of the reason why the robot deployment failed.
  final String? failureReason;

  /// Information about how the deployment is progressing.
  final ProgressDetail? progressDetail;

  /// The status of the robot deployment.
  final RobotStatus? status;

  RobotDeployment({
    this.arn,
    this.deploymentFinishTime,
    this.deploymentStartTime,
    this.failureCode,
    this.failureReason,
    this.progressDetail,
    this.status,
  });

  factory RobotDeployment.fromJson(Map<String, dynamic> json) {
    return RobotDeployment(
      arn: json['arn'] as String?,
      deploymentFinishTime: timeStampFromJson(json['deploymentFinishTime']),
      deploymentStartTime: timeStampFromJson(json['deploymentStartTime']),
      failureCode: (json['failureCode'] as String?)?.toDeploymentJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      progressDetail: json['progressDetail'] != null
          ? ProgressDetail.fromJson(
              json['progressDetail'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toRobotStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final deploymentFinishTime = this.deploymentFinishTime;
    final deploymentStartTime = this.deploymentStartTime;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final progressDetail = this.progressDetail;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (deploymentFinishTime != null)
        'deploymentFinishTime': unixTimestampToJson(deploymentFinishTime),
      if (deploymentStartTime != null)
        'deploymentStartTime': unixTimestampToJson(deploymentStartTime),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (progressDetail != null) 'progressDetail': progressDetail,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum RobotDeploymentStep {
  validating,
  downloadingExtracting,
  executingDownloadCondition,
  executingPreLaunch,
  launching,
  executingPostLaunch,
  finished,
}

extension RobotDeploymentStepValueExtension on RobotDeploymentStep {
  String toValue() {
    switch (this) {
      case RobotDeploymentStep.validating:
        return 'Validating';
      case RobotDeploymentStep.downloadingExtracting:
        return 'DownloadingExtracting';
      case RobotDeploymentStep.executingDownloadCondition:
        return 'ExecutingDownloadCondition';
      case RobotDeploymentStep.executingPreLaunch:
        return 'ExecutingPreLaunch';
      case RobotDeploymentStep.launching:
        return 'Launching';
      case RobotDeploymentStep.executingPostLaunch:
        return 'ExecutingPostLaunch';
      case RobotDeploymentStep.finished:
        return 'Finished';
    }
  }
}

extension RobotDeploymentStepFromString on String {
  RobotDeploymentStep toRobotDeploymentStep() {
    switch (this) {
      case 'Validating':
        return RobotDeploymentStep.validating;
      case 'DownloadingExtracting':
        return RobotDeploymentStep.downloadingExtracting;
      case 'ExecutingDownloadCondition':
        return RobotDeploymentStep.executingDownloadCondition;
      case 'ExecutingPreLaunch':
        return RobotDeploymentStep.executingPreLaunch;
      case 'Launching':
        return RobotDeploymentStep.launching;
      case 'ExecutingPostLaunch':
        return RobotDeploymentStep.executingPostLaunch;
      case 'Finished':
        return RobotDeploymentStep.finished;
    }
    throw Exception('$this is not known in enum RobotDeploymentStep');
  }
}

/// Information about a robot software suite (ROS distribution).
class RobotSoftwareSuite {
  /// The name of the robot software suite (ROS distribution).
  final RobotSoftwareSuiteType? name;

  /// The version of the robot software suite (ROS distribution).
  final RobotSoftwareSuiteVersionType? version;

  RobotSoftwareSuite({
    this.name,
    this.version,
  });

  factory RobotSoftwareSuite.fromJson(Map<String, dynamic> json) {
    return RobotSoftwareSuite(
      name: (json['name'] as String?)?.toRobotSoftwareSuiteType(),
      version: (json['version'] as String?)?.toRobotSoftwareSuiteVersionType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'name': name.toValue(),
      if (version != null) 'version': version.toValue(),
    };
  }
}

enum RobotSoftwareSuiteType {
  ros,
  ros2,
  general,
}

extension RobotSoftwareSuiteTypeValueExtension on RobotSoftwareSuiteType {
  String toValue() {
    switch (this) {
      case RobotSoftwareSuiteType.ros:
        return 'ROS';
      case RobotSoftwareSuiteType.ros2:
        return 'ROS2';
      case RobotSoftwareSuiteType.general:
        return 'General';
    }
  }
}

extension RobotSoftwareSuiteTypeFromString on String {
  RobotSoftwareSuiteType toRobotSoftwareSuiteType() {
    switch (this) {
      case 'ROS':
        return RobotSoftwareSuiteType.ros;
      case 'ROS2':
        return RobotSoftwareSuiteType.ros2;
      case 'General':
        return RobotSoftwareSuiteType.general;
    }
    throw Exception('$this is not known in enum RobotSoftwareSuiteType');
  }
}

enum RobotSoftwareSuiteVersionType {
  kinetic,
  melodic,
  dashing,
  foxy,
}

extension RobotSoftwareSuiteVersionTypeValueExtension
    on RobotSoftwareSuiteVersionType {
  String toValue() {
    switch (this) {
      case RobotSoftwareSuiteVersionType.kinetic:
        return 'Kinetic';
      case RobotSoftwareSuiteVersionType.melodic:
        return 'Melodic';
      case RobotSoftwareSuiteVersionType.dashing:
        return 'Dashing';
      case RobotSoftwareSuiteVersionType.foxy:
        return 'Foxy';
    }
  }
}

extension RobotSoftwareSuiteVersionTypeFromString on String {
  RobotSoftwareSuiteVersionType toRobotSoftwareSuiteVersionType() {
    switch (this) {
      case 'Kinetic':
        return RobotSoftwareSuiteVersionType.kinetic;
      case 'Melodic':
        return RobotSoftwareSuiteVersionType.melodic;
      case 'Dashing':
        return RobotSoftwareSuiteVersionType.dashing;
      case 'Foxy':
        return RobotSoftwareSuiteVersionType.foxy;
    }
    throw Exception('$this is not known in enum RobotSoftwareSuiteVersionType');
  }
}

enum RobotStatus {
  available,
  registered,
  pendingNewDeployment,
  deploying,
  failed,
  inSync,
  noResponse,
}

extension RobotStatusValueExtension on RobotStatus {
  String toValue() {
    switch (this) {
      case RobotStatus.available:
        return 'Available';
      case RobotStatus.registered:
        return 'Registered';
      case RobotStatus.pendingNewDeployment:
        return 'PendingNewDeployment';
      case RobotStatus.deploying:
        return 'Deploying';
      case RobotStatus.failed:
        return 'Failed';
      case RobotStatus.inSync:
        return 'InSync';
      case RobotStatus.noResponse:
        return 'NoResponse';
    }
  }
}

extension RobotStatusFromString on String {
  RobotStatus toRobotStatus() {
    switch (this) {
      case 'Available':
        return RobotStatus.available;
      case 'Registered':
        return RobotStatus.registered;
      case 'PendingNewDeployment':
        return RobotStatus.pendingNewDeployment;
      case 'Deploying':
        return RobotStatus.deploying;
      case 'Failed':
        return RobotStatus.failed;
      case 'InSync':
        return RobotStatus.inSync;
      case 'NoResponse':
        return RobotStatus.noResponse;
    }
    throw Exception('$this is not known in enum RobotStatus');
  }
}

/// Information about S3 keys.
class S3KeyOutput {
  /// The etag for the object.
  final String? etag;

  /// The S3 key.
  final String? s3Key;

  S3KeyOutput({
    this.etag,
    this.s3Key,
  });

  factory S3KeyOutput.fromJson(Map<String, dynamic> json) {
    return S3KeyOutput(
      etag: json['etag'] as String?,
      s3Key: json['s3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final etag = this.etag;
    final s3Key = this.s3Key;
    return {
      if (etag != null) 'etag': etag,
      if (s3Key != null) 's3Key': s3Key,
    };
  }
}

/// Information about an S3 object.
class S3Object {
  /// The bucket containing the object.
  final String bucket;

  /// The key of the object.
  final String key;

  /// The etag of the object.
  final String? etag;

  S3Object({
    required this.bucket,
    required this.key,
    this.etag,
  });

  factory S3Object.fromJson(Map<String, dynamic> json) {
    return S3Object(
      bucket: json['bucket'] as String,
      key: json['key'] as String,
      etag: json['etag'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bucket = this.bucket;
    final key = this.key;
    final etag = this.etag;
    return {
      'bucket': bucket,
      'key': key,
      if (etag != null) 'etag': etag,
    };
  }
}

/// Information about a simulation application configuration.
class SimulationApplicationConfig {
  /// The application information for the simulation application.
  final String application;

  /// The launch configuration for the simulation application.
  final LaunchConfig launchConfig;

  /// The version of the simulation application.
  final String? applicationVersion;

  /// Information about tools configured for the simulation application.
  final List<Tool>? tools;

  /// Information about upload configurations for the simulation application.
  final List<UploadConfiguration>? uploadConfigurations;

  /// A Boolean indicating whether to use default simulation application tools.
  /// The default tools are rviz, rqt, terminal and rosbag record. The default is
  /// <code>False</code>.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  final bool? useDefaultTools;

  /// A Boolean indicating whether to use default upload configurations. By
  /// default, <code>.ros</code> and <code>.gazebo</code> files are uploaded when
  /// the application terminates and all ROS topics will be recorded.
  ///
  /// If you set this value, you must specify an <code>outputLocation</code>.
  /// <important>
  /// This API is no longer supported and will throw an error if used.
  /// </important>
  final bool? useDefaultUploadConfigurations;

  /// A list of world configurations.
  final List<WorldConfig>? worldConfigs;

  SimulationApplicationConfig({
    required this.application,
    required this.launchConfig,
    this.applicationVersion,
    this.tools,
    this.uploadConfigurations,
    this.useDefaultTools,
    this.useDefaultUploadConfigurations,
    this.worldConfigs,
  });

  factory SimulationApplicationConfig.fromJson(Map<String, dynamic> json) {
    return SimulationApplicationConfig(
      application: json['application'] as String,
      launchConfig:
          LaunchConfig.fromJson(json['launchConfig'] as Map<String, dynamic>),
      applicationVersion: json['applicationVersion'] as String?,
      tools: (json['tools'] as List?)
          ?.whereNotNull()
          .map((e) => Tool.fromJson(e as Map<String, dynamic>))
          .toList(),
      uploadConfigurations: (json['uploadConfigurations'] as List?)
          ?.whereNotNull()
          .map((e) => UploadConfiguration.fromJson(e as Map<String, dynamic>))
          .toList(),
      useDefaultTools: json['useDefaultTools'] as bool?,
      useDefaultUploadConfigurations:
          json['useDefaultUploadConfigurations'] as bool?,
      worldConfigs: (json['worldConfigs'] as List?)
          ?.whereNotNull()
          .map((e) => WorldConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final application = this.application;
    final launchConfig = this.launchConfig;
    final applicationVersion = this.applicationVersion;
    final tools = this.tools;
    final uploadConfigurations = this.uploadConfigurations;
    final useDefaultTools = this.useDefaultTools;
    final useDefaultUploadConfigurations = this.useDefaultUploadConfigurations;
    final worldConfigs = this.worldConfigs;
    return {
      'application': application,
      'launchConfig': launchConfig,
      if (applicationVersion != null) 'applicationVersion': applicationVersion,
      if (tools != null) 'tools': tools,
      if (uploadConfigurations != null)
        'uploadConfigurations': uploadConfigurations,
      if (useDefaultTools != null) 'useDefaultTools': useDefaultTools,
      if (useDefaultUploadConfigurations != null)
        'useDefaultUploadConfigurations': useDefaultUploadConfigurations,
      if (worldConfigs != null) 'worldConfigs': worldConfigs,
    };
  }
}

/// Summary information for a simulation application.
class SimulationApplicationSummary {
  /// The Amazon Resource Name (ARN) of the simulation application.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the simulation application.
  final String? name;

  /// Information about a robot software suite (ROS distribution).
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// Information about a simulation software suite.
  final SimulationSoftwareSuite? simulationSoftwareSuite;

  /// The version of the simulation application.
  final String? version;

  SimulationApplicationSummary({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
    this.version,
  });

  factory SimulationApplicationSummary.fromJson(Map<String, dynamic> json) {
    return SimulationApplicationSummary(
      arn: json['arn'] as String?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      simulationSoftwareSuite: json['simulationSoftwareSuite'] != null
          ? SimulationSoftwareSuite.fromJson(
              json['simulationSoftwareSuite'] as Map<String, dynamic>)
          : null,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final simulationSoftwareSuite = this.simulationSoftwareSuite;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (simulationSoftwareSuite != null)
        'simulationSoftwareSuite': simulationSoftwareSuite,
      if (version != null) 'version': version,
    };
  }
}

/// Information about a simulation job.
class SimulationJob {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String? arn;

  /// A unique identifier for this <code>SimulationJob</code> request.
  final String? clientRequestToken;

  /// Compute information for the simulation job
  final ComputeResponse? compute;

  /// The data sources for the simulation job.
  final List<DataSource>? dataSources;

  /// The failure behavior the simulation job.
  /// <dl> <dt>Continue</dt> <dd>
  /// Leaves the host running for its maximum timeout duration after a
  /// <code>4XX</code> error code.
  /// </dd> <dt>Fail</dt> <dd>
  /// Stop the simulation job and terminate the instance.
  /// </dd> </dl>
  final FailureBehavior? failureBehavior;

  /// The failure code of the simulation job if it failed.
  final SimulationJobErrorCode? failureCode;

  /// The reason why the simulation job failed.
  final String? failureReason;

  /// The IAM role that allows the simulation instance to call the AWS APIs that
  /// are specified in its associated policies on your behalf. This is how
  /// credentials are passed in to your simulation job.
  final String? iamRole;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// started.
  final DateTime? lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The logging configuration.
  final LoggingConfig? loggingConfig;

  /// The maximum simulation job duration in seconds. The value must be 8 days
  /// (691,200 seconds) or less.
  final int? maxJobDurationInSeconds;

  /// The name of the simulation job.
  final String? name;

  /// Information about a network interface.
  final NetworkInterface? networkInterface;

  /// Location for output files generated by the simulation job.
  final OutputLocation? outputLocation;

  /// A list of robot applications.
  final List<RobotApplicationConfig>? robotApplications;

  /// A list of simulation applications.
  final List<SimulationApplicationConfig>? simulationApplications;

  /// The simulation job execution duration in milliseconds.
  final int? simulationTimeMillis;

  /// Status of the simulation job.
  final SimulationJobStatus? status;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job.
  final Map<String, String>? tags;

  /// VPC configuration information.
  final VPCConfigResponse? vpcConfig;

  SimulationJob({
    this.arn,
    this.clientRequestToken,
    this.compute,
    this.dataSources,
    this.failureBehavior,
    this.failureCode,
    this.failureReason,
    this.iamRole,
    this.lastStartedAt,
    this.lastUpdatedAt,
    this.loggingConfig,
    this.maxJobDurationInSeconds,
    this.name,
    this.networkInterface,
    this.outputLocation,
    this.robotApplications,
    this.simulationApplications,
    this.simulationTimeMillis,
    this.status,
    this.tags,
    this.vpcConfig,
  });

  factory SimulationJob.fromJson(Map<String, dynamic> json) {
    return SimulationJob(
      arn: json['arn'] as String?,
      clientRequestToken: json['clientRequestToken'] as String?,
      compute: json['compute'] != null
          ? ComputeResponse.fromJson(json['compute'] as Map<String, dynamic>)
          : null,
      dataSources: (json['dataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSource.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureBehavior:
          (json['failureBehavior'] as String?)?.toFailureBehavior(),
      failureCode: (json['failureCode'] as String?)?.toSimulationJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      iamRole: json['iamRole'] as String?,
      lastStartedAt: timeStampFromJson(json['lastStartedAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      loggingConfig: json['loggingConfig'] != null
          ? LoggingConfig.fromJson(
              json['loggingConfig'] as Map<String, dynamic>)
          : null,
      maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int?,
      name: json['name'] as String?,
      networkInterface: json['networkInterface'] != null
          ? NetworkInterface.fromJson(
              json['networkInterface'] as Map<String, dynamic>)
          : null,
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      robotApplications: (json['robotApplications'] as List?)
          ?.whereNotNull()
          .map(
              (e) => RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationApplications: (json['simulationApplications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationTimeMillis: json['simulationTimeMillis'] as int?,
      status: (json['status'] as String?)?.toSimulationJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vpcConfig: json['vpcConfig'] != null
          ? VPCConfigResponse.fromJson(
              json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final clientRequestToken = this.clientRequestToken;
    final compute = this.compute;
    final dataSources = this.dataSources;
    final failureBehavior = this.failureBehavior;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final iamRole = this.iamRole;
    final lastStartedAt = this.lastStartedAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final loggingConfig = this.loggingConfig;
    final maxJobDurationInSeconds = this.maxJobDurationInSeconds;
    final name = this.name;
    final networkInterface = this.networkInterface;
    final outputLocation = this.outputLocation;
    final robotApplications = this.robotApplications;
    final simulationApplications = this.simulationApplications;
    final simulationTimeMillis = this.simulationTimeMillis;
    final status = this.status;
    final tags = this.tags;
    final vpcConfig = this.vpcConfig;
    return {
      if (arn != null) 'arn': arn,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (compute != null) 'compute': compute,
      if (dataSources != null) 'dataSources': dataSources,
      if (failureBehavior != null) 'failureBehavior': failureBehavior.toValue(),
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (iamRole != null) 'iamRole': iamRole,
      if (lastStartedAt != null)
        'lastStartedAt': unixTimestampToJson(lastStartedAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (loggingConfig != null) 'loggingConfig': loggingConfig,
      if (maxJobDurationInSeconds != null)
        'maxJobDurationInSeconds': maxJobDurationInSeconds,
      if (name != null) 'name': name,
      if (networkInterface != null) 'networkInterface': networkInterface,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (robotApplications != null) 'robotApplications': robotApplications,
      if (simulationApplications != null)
        'simulationApplications': simulationApplications,
      if (simulationTimeMillis != null)
        'simulationTimeMillis': simulationTimeMillis,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

enum SimulationJobBatchErrorCode {
  internalServiceError,
}

extension SimulationJobBatchErrorCodeValueExtension
    on SimulationJobBatchErrorCode {
  String toValue() {
    switch (this) {
      case SimulationJobBatchErrorCode.internalServiceError:
        return 'InternalServiceError';
    }
  }
}

extension SimulationJobBatchErrorCodeFromString on String {
  SimulationJobBatchErrorCode toSimulationJobBatchErrorCode() {
    switch (this) {
      case 'InternalServiceError':
        return SimulationJobBatchErrorCode.internalServiceError;
    }
    throw Exception('$this is not known in enum SimulationJobBatchErrorCode');
  }
}

enum SimulationJobBatchStatus {
  pending,
  inProgress,
  failed,
  completed,
  canceled,
  canceling,
  completing,
  timingOut,
  timedOut,
}

extension SimulationJobBatchStatusValueExtension on SimulationJobBatchStatus {
  String toValue() {
    switch (this) {
      case SimulationJobBatchStatus.pending:
        return 'Pending';
      case SimulationJobBatchStatus.inProgress:
        return 'InProgress';
      case SimulationJobBatchStatus.failed:
        return 'Failed';
      case SimulationJobBatchStatus.completed:
        return 'Completed';
      case SimulationJobBatchStatus.canceled:
        return 'Canceled';
      case SimulationJobBatchStatus.canceling:
        return 'Canceling';
      case SimulationJobBatchStatus.completing:
        return 'Completing';
      case SimulationJobBatchStatus.timingOut:
        return 'TimingOut';
      case SimulationJobBatchStatus.timedOut:
        return 'TimedOut';
    }
  }
}

extension SimulationJobBatchStatusFromString on String {
  SimulationJobBatchStatus toSimulationJobBatchStatus() {
    switch (this) {
      case 'Pending':
        return SimulationJobBatchStatus.pending;
      case 'InProgress':
        return SimulationJobBatchStatus.inProgress;
      case 'Failed':
        return SimulationJobBatchStatus.failed;
      case 'Completed':
        return SimulationJobBatchStatus.completed;
      case 'Canceled':
        return SimulationJobBatchStatus.canceled;
      case 'Canceling':
        return SimulationJobBatchStatus.canceling;
      case 'Completing':
        return SimulationJobBatchStatus.completing;
      case 'TimingOut':
        return SimulationJobBatchStatus.timingOut;
      case 'TimedOut':
        return SimulationJobBatchStatus.timedOut;
    }
    throw Exception('$this is not known in enum SimulationJobBatchStatus');
  }
}

/// Information about a simulation job batch.
class SimulationJobBatchSummary {
  /// The Amazon Resource Name (ARN) of the batch.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// created.
  final DateTime? createdAt;

  /// The number of created simulation job requests.
  final int? createdRequestCount;

  /// The number of failed simulation job requests.
  final int? failedRequestCount;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// The number of pending simulation job requests.
  final int? pendingRequestCount;

  /// The status of the simulation job batch.
  /// <dl> <dt>Pending</dt> <dd>
  /// The simulation job batch request is pending.
  /// </dd> <dt>InProgress</dt> <dd>
  /// The simulation job batch is in progress.
  /// </dd> <dt>Failed</dt> <dd>
  /// The simulation job batch failed. One or more simulation job requests could
  /// not be completed due to an internal failure (like
  /// <code>InternalServiceError</code>). See <code>failureCode</code> and
  /// <code>failureReason</code> for more information.
  /// </dd> <dt>Completed</dt> <dd>
  /// The simulation batch job completed. A batch is complete when (1) there are
  /// no pending simulation job requests in the batch and none of the failed
  /// simulation job requests are due to <code>InternalServiceError</code> and (2)
  /// when all created simulation jobs have reached a terminal state (for example,
  /// <code>Completed</code> or <code>Failed</code>).
  /// </dd> <dt>Canceled</dt> <dd>
  /// The simulation batch job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The simulation batch job is being cancelled.
  /// </dd> <dt>Completing</dt> <dd>
  /// The simulation batch job is completing.
  /// </dd> <dt>TimingOut</dt> <dd>
  /// The simulation job batch is timing out.
  ///
  /// If a batch timing out, and there are pending requests that were failing due
  /// to an internal failure (like <code>InternalServiceError</code>), the batch
  /// status will be <code>Failed</code>. If there are no such failing request,
  /// the batch status will be <code>TimedOut</code>.
  /// </dd> <dt>TimedOut</dt> <dd>
  /// The simulation batch job timed out.
  /// </dd> </dl>
  final SimulationJobBatchStatus? status;

  SimulationJobBatchSummary({
    this.arn,
    this.createdAt,
    this.createdRequestCount,
    this.failedRequestCount,
    this.lastUpdatedAt,
    this.pendingRequestCount,
    this.status,
  });

  factory SimulationJobBatchSummary.fromJson(Map<String, dynamic> json) {
    return SimulationJobBatchSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdRequestCount: json['createdRequestCount'] as int?,
      failedRequestCount: json['failedRequestCount'] as int?,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      pendingRequestCount: json['pendingRequestCount'] as int?,
      status: (json['status'] as String?)?.toSimulationJobBatchStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final createdRequestCount = this.createdRequestCount;
    final failedRequestCount = this.failedRequestCount;
    final lastUpdatedAt = this.lastUpdatedAt;
    final pendingRequestCount = this.pendingRequestCount;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdRequestCount != null)
        'createdRequestCount': createdRequestCount,
      if (failedRequestCount != null) 'failedRequestCount': failedRequestCount,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (pendingRequestCount != null)
        'pendingRequestCount': pendingRequestCount,
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum SimulationJobErrorCode {
  internalServiceError,
  robotApplicationCrash,
  simulationApplicationCrash,
  robotApplicationHealthCheckFailure,
  simulationApplicationHealthCheckFailure,
  badPermissionsRobotApplication,
  badPermissionsSimulationApplication,
  badPermissionsS3Object,
  badPermissionsS3Output,
  badPermissionsCloudwatchLogs,
  subnetIpLimitExceeded,
  eNILimitExceeded,
  badPermissionsUserCredentials,
  invalidBundleRobotApplication,
  invalidBundleSimulationApplication,
  invalidS3Resource,
  throttlingError,
  limitExceeded,
  mismatchedEtag,
  robotApplicationVersionMismatchedEtag,
  simulationApplicationVersionMismatchedEtag,
  resourceNotFound,
  requestThrottled,
  batchTimedOut,
  batchCanceled,
  invalidInput,
  wrongRegionS3Bucket,
  wrongRegionS3Output,
  wrongRegionRobotApplication,
  wrongRegionSimulationApplication,
  uploadContentMismatchError,
}

extension SimulationJobErrorCodeValueExtension on SimulationJobErrorCode {
  String toValue() {
    switch (this) {
      case SimulationJobErrorCode.internalServiceError:
        return 'InternalServiceError';
      case SimulationJobErrorCode.robotApplicationCrash:
        return 'RobotApplicationCrash';
      case SimulationJobErrorCode.simulationApplicationCrash:
        return 'SimulationApplicationCrash';
      case SimulationJobErrorCode.robotApplicationHealthCheckFailure:
        return 'RobotApplicationHealthCheckFailure';
      case SimulationJobErrorCode.simulationApplicationHealthCheckFailure:
        return 'SimulationApplicationHealthCheckFailure';
      case SimulationJobErrorCode.badPermissionsRobotApplication:
        return 'BadPermissionsRobotApplication';
      case SimulationJobErrorCode.badPermissionsSimulationApplication:
        return 'BadPermissionsSimulationApplication';
      case SimulationJobErrorCode.badPermissionsS3Object:
        return 'BadPermissionsS3Object';
      case SimulationJobErrorCode.badPermissionsS3Output:
        return 'BadPermissionsS3Output';
      case SimulationJobErrorCode.badPermissionsCloudwatchLogs:
        return 'BadPermissionsCloudwatchLogs';
      case SimulationJobErrorCode.subnetIpLimitExceeded:
        return 'SubnetIpLimitExceeded';
      case SimulationJobErrorCode.eNILimitExceeded:
        return 'ENILimitExceeded';
      case SimulationJobErrorCode.badPermissionsUserCredentials:
        return 'BadPermissionsUserCredentials';
      case SimulationJobErrorCode.invalidBundleRobotApplication:
        return 'InvalidBundleRobotApplication';
      case SimulationJobErrorCode.invalidBundleSimulationApplication:
        return 'InvalidBundleSimulationApplication';
      case SimulationJobErrorCode.invalidS3Resource:
        return 'InvalidS3Resource';
      case SimulationJobErrorCode.throttlingError:
        return 'ThrottlingError';
      case SimulationJobErrorCode.limitExceeded:
        return 'LimitExceeded';
      case SimulationJobErrorCode.mismatchedEtag:
        return 'MismatchedEtag';
      case SimulationJobErrorCode.robotApplicationVersionMismatchedEtag:
        return 'RobotApplicationVersionMismatchedEtag';
      case SimulationJobErrorCode.simulationApplicationVersionMismatchedEtag:
        return 'SimulationApplicationVersionMismatchedEtag';
      case SimulationJobErrorCode.resourceNotFound:
        return 'ResourceNotFound';
      case SimulationJobErrorCode.requestThrottled:
        return 'RequestThrottled';
      case SimulationJobErrorCode.batchTimedOut:
        return 'BatchTimedOut';
      case SimulationJobErrorCode.batchCanceled:
        return 'BatchCanceled';
      case SimulationJobErrorCode.invalidInput:
        return 'InvalidInput';
      case SimulationJobErrorCode.wrongRegionS3Bucket:
        return 'WrongRegionS3Bucket';
      case SimulationJobErrorCode.wrongRegionS3Output:
        return 'WrongRegionS3Output';
      case SimulationJobErrorCode.wrongRegionRobotApplication:
        return 'WrongRegionRobotApplication';
      case SimulationJobErrorCode.wrongRegionSimulationApplication:
        return 'WrongRegionSimulationApplication';
      case SimulationJobErrorCode.uploadContentMismatchError:
        return 'UploadContentMismatchError';
    }
  }
}

extension SimulationJobErrorCodeFromString on String {
  SimulationJobErrorCode toSimulationJobErrorCode() {
    switch (this) {
      case 'InternalServiceError':
        return SimulationJobErrorCode.internalServiceError;
      case 'RobotApplicationCrash':
        return SimulationJobErrorCode.robotApplicationCrash;
      case 'SimulationApplicationCrash':
        return SimulationJobErrorCode.simulationApplicationCrash;
      case 'RobotApplicationHealthCheckFailure':
        return SimulationJobErrorCode.robotApplicationHealthCheckFailure;
      case 'SimulationApplicationHealthCheckFailure':
        return SimulationJobErrorCode.simulationApplicationHealthCheckFailure;
      case 'BadPermissionsRobotApplication':
        return SimulationJobErrorCode.badPermissionsRobotApplication;
      case 'BadPermissionsSimulationApplication':
        return SimulationJobErrorCode.badPermissionsSimulationApplication;
      case 'BadPermissionsS3Object':
        return SimulationJobErrorCode.badPermissionsS3Object;
      case 'BadPermissionsS3Output':
        return SimulationJobErrorCode.badPermissionsS3Output;
      case 'BadPermissionsCloudwatchLogs':
        return SimulationJobErrorCode.badPermissionsCloudwatchLogs;
      case 'SubnetIpLimitExceeded':
        return SimulationJobErrorCode.subnetIpLimitExceeded;
      case 'ENILimitExceeded':
        return SimulationJobErrorCode.eNILimitExceeded;
      case 'BadPermissionsUserCredentials':
        return SimulationJobErrorCode.badPermissionsUserCredentials;
      case 'InvalidBundleRobotApplication':
        return SimulationJobErrorCode.invalidBundleRobotApplication;
      case 'InvalidBundleSimulationApplication':
        return SimulationJobErrorCode.invalidBundleSimulationApplication;
      case 'InvalidS3Resource':
        return SimulationJobErrorCode.invalidS3Resource;
      case 'ThrottlingError':
        return SimulationJobErrorCode.throttlingError;
      case 'LimitExceeded':
        return SimulationJobErrorCode.limitExceeded;
      case 'MismatchedEtag':
        return SimulationJobErrorCode.mismatchedEtag;
      case 'RobotApplicationVersionMismatchedEtag':
        return SimulationJobErrorCode.robotApplicationVersionMismatchedEtag;
      case 'SimulationApplicationVersionMismatchedEtag':
        return SimulationJobErrorCode
            .simulationApplicationVersionMismatchedEtag;
      case 'ResourceNotFound':
        return SimulationJobErrorCode.resourceNotFound;
      case 'RequestThrottled':
        return SimulationJobErrorCode.requestThrottled;
      case 'BatchTimedOut':
        return SimulationJobErrorCode.batchTimedOut;
      case 'BatchCanceled':
        return SimulationJobErrorCode.batchCanceled;
      case 'InvalidInput':
        return SimulationJobErrorCode.invalidInput;
      case 'WrongRegionS3Bucket':
        return SimulationJobErrorCode.wrongRegionS3Bucket;
      case 'WrongRegionS3Output':
        return SimulationJobErrorCode.wrongRegionS3Output;
      case 'WrongRegionRobotApplication':
        return SimulationJobErrorCode.wrongRegionRobotApplication;
      case 'WrongRegionSimulationApplication':
        return SimulationJobErrorCode.wrongRegionSimulationApplication;
      case 'UploadContentMismatchError':
        return SimulationJobErrorCode.uploadContentMismatchError;
    }
    throw Exception('$this is not known in enum SimulationJobErrorCode');
  }
}

/// Information about a simulation job request.
class SimulationJobRequest {
  /// The maximum simulation job duration in seconds. The value must be 8 days
  /// (691,200 seconds) or less.
  final int maxJobDurationInSeconds;

  /// Compute information for the simulation job
  final Compute? compute;

  /// Specify data sources to mount read-only files from S3 into your simulation.
  /// These files are available under
  /// <code>/opt/robomaker/datasources/data_source_name</code>.
  /// <note>
  /// There is a limit of 100 files and a combined size of 25GB for all
  /// <code>DataSourceConfig</code> objects.
  /// </note>
  final List<DataSourceConfig>? dataSources;

  /// The failure behavior the simulation job.
  /// <dl> <dt>Continue</dt> <dd>
  /// Leaves the host running for its maximum timeout duration after a
  /// <code>4XX</code> error code.
  /// </dd> <dt>Fail</dt> <dd>
  /// Stop the simulation job and terminate the instance.
  /// </dd> </dl>
  final FailureBehavior? failureBehavior;

  /// The IAM role name that allows the simulation instance to call the AWS APIs
  /// that are specified in its associated policies on your behalf. This is how
  /// credentials are passed in to your simulation job.
  final String? iamRole;
  final LoggingConfig? loggingConfig;
  final OutputLocation? outputLocation;

  /// The robot applications to use in the simulation job.
  final List<RobotApplicationConfig>? robotApplications;

  /// The simulation applications to use in the simulation job.
  final List<SimulationApplicationConfig>? simulationApplications;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job request.
  final Map<String, String>? tags;

  /// A Boolean indicating whether to use default applications in the simulation
  /// job. Default applications include Gazebo, rqt, rviz and terminal access.
  final bool? useDefaultApplications;
  final VPCConfig? vpcConfig;

  SimulationJobRequest({
    required this.maxJobDurationInSeconds,
    this.compute,
    this.dataSources,
    this.failureBehavior,
    this.iamRole,
    this.loggingConfig,
    this.outputLocation,
    this.robotApplications,
    this.simulationApplications,
    this.tags,
    this.useDefaultApplications,
    this.vpcConfig,
  });

  factory SimulationJobRequest.fromJson(Map<String, dynamic> json) {
    return SimulationJobRequest(
      maxJobDurationInSeconds: json['maxJobDurationInSeconds'] as int,
      compute: json['compute'] != null
          ? Compute.fromJson(json['compute'] as Map<String, dynamic>)
          : null,
      dataSources: (json['dataSources'] as List?)
          ?.whereNotNull()
          .map((e) => DataSourceConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      failureBehavior:
          (json['failureBehavior'] as String?)?.toFailureBehavior(),
      iamRole: json['iamRole'] as String?,
      loggingConfig: json['loggingConfig'] != null
          ? LoggingConfig.fromJson(
              json['loggingConfig'] as Map<String, dynamic>)
          : null,
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      robotApplications: (json['robotApplications'] as List?)
          ?.whereNotNull()
          .map(
              (e) => RobotApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      simulationApplications: (json['simulationApplications'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SimulationApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useDefaultApplications: json['useDefaultApplications'] as bool?,
      vpcConfig: json['vpcConfig'] != null
          ? VPCConfig.fromJson(json['vpcConfig'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final maxJobDurationInSeconds = this.maxJobDurationInSeconds;
    final compute = this.compute;
    final dataSources = this.dataSources;
    final failureBehavior = this.failureBehavior;
    final iamRole = this.iamRole;
    final loggingConfig = this.loggingConfig;
    final outputLocation = this.outputLocation;
    final robotApplications = this.robotApplications;
    final simulationApplications = this.simulationApplications;
    final tags = this.tags;
    final useDefaultApplications = this.useDefaultApplications;
    final vpcConfig = this.vpcConfig;
    return {
      'maxJobDurationInSeconds': maxJobDurationInSeconds,
      if (compute != null) 'compute': compute,
      if (dataSources != null) 'dataSources': dataSources,
      if (failureBehavior != null) 'failureBehavior': failureBehavior.toValue(),
      if (iamRole != null) 'iamRole': iamRole,
      if (loggingConfig != null) 'loggingConfig': loggingConfig,
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (robotApplications != null) 'robotApplications': robotApplications,
      if (simulationApplications != null)
        'simulationApplications': simulationApplications,
      if (tags != null) 'tags': tags,
      if (useDefaultApplications != null)
        'useDefaultApplications': useDefaultApplications,
      if (vpcConfig != null) 'vpcConfig': vpcConfig,
    };
  }
}

enum SimulationJobStatus {
  pending,
  preparing,
  running,
  restarting,
  completed,
  failed,
  runningFailed,
  terminating,
  terminated,
  canceled,
}

extension SimulationJobStatusValueExtension on SimulationJobStatus {
  String toValue() {
    switch (this) {
      case SimulationJobStatus.pending:
        return 'Pending';
      case SimulationJobStatus.preparing:
        return 'Preparing';
      case SimulationJobStatus.running:
        return 'Running';
      case SimulationJobStatus.restarting:
        return 'Restarting';
      case SimulationJobStatus.completed:
        return 'Completed';
      case SimulationJobStatus.failed:
        return 'Failed';
      case SimulationJobStatus.runningFailed:
        return 'RunningFailed';
      case SimulationJobStatus.terminating:
        return 'Terminating';
      case SimulationJobStatus.terminated:
        return 'Terminated';
      case SimulationJobStatus.canceled:
        return 'Canceled';
    }
  }
}

extension SimulationJobStatusFromString on String {
  SimulationJobStatus toSimulationJobStatus() {
    switch (this) {
      case 'Pending':
        return SimulationJobStatus.pending;
      case 'Preparing':
        return SimulationJobStatus.preparing;
      case 'Running':
        return SimulationJobStatus.running;
      case 'Restarting':
        return SimulationJobStatus.restarting;
      case 'Completed':
        return SimulationJobStatus.completed;
      case 'Failed':
        return SimulationJobStatus.failed;
      case 'RunningFailed':
        return SimulationJobStatus.runningFailed;
      case 'Terminating':
        return SimulationJobStatus.terminating;
      case 'Terminated':
        return SimulationJobStatus.terminated;
      case 'Canceled':
        return SimulationJobStatus.canceled;
    }
    throw Exception('$this is not known in enum SimulationJobStatus');
  }
}

/// Summary information for a simulation job.
class SimulationJobSummary {
  /// The Amazon Resource Name (ARN) of the simulation job.
  final String? arn;

  /// The compute type for the simulation job summary.
  final ComputeType? computeType;

  /// The names of the data sources.
  final List<String>? dataSourceNames;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The name of the simulation job.
  final String? name;

  /// A list of simulation job robot application names.
  final List<String>? robotApplicationNames;

  /// A list of simulation job simulation application names.
  final List<String>? simulationApplicationNames;

  /// The status of the simulation job.
  final SimulationJobStatus? status;

  SimulationJobSummary({
    this.arn,
    this.computeType,
    this.dataSourceNames,
    this.lastUpdatedAt,
    this.name,
    this.robotApplicationNames,
    this.simulationApplicationNames,
    this.status,
  });

  factory SimulationJobSummary.fromJson(Map<String, dynamic> json) {
    return SimulationJobSummary(
      arn: json['arn'] as String?,
      computeType: (json['computeType'] as String?)?.toComputeType(),
      dataSourceNames: (json['dataSourceNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      robotApplicationNames: (json['robotApplicationNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      simulationApplicationNames: (json['simulationApplicationNames'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      status: (json['status'] as String?)?.toSimulationJobStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final computeType = this.computeType;
    final dataSourceNames = this.dataSourceNames;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final robotApplicationNames = this.robotApplicationNames;
    final simulationApplicationNames = this.simulationApplicationNames;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (computeType != null) 'computeType': computeType.toValue(),
      if (dataSourceNames != null) 'dataSourceNames': dataSourceNames,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (robotApplicationNames != null)
        'robotApplicationNames': robotApplicationNames,
      if (simulationApplicationNames != null)
        'simulationApplicationNames': simulationApplicationNames,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Information about a simulation software suite.
class SimulationSoftwareSuite {
  /// The name of the simulation software suite.
  final SimulationSoftwareSuiteType? name;

  /// The version of the simulation software suite.
  final String? version;

  SimulationSoftwareSuite({
    this.name,
    this.version,
  });

  factory SimulationSoftwareSuite.fromJson(Map<String, dynamic> json) {
    return SimulationSoftwareSuite(
      name: (json['name'] as String?)?.toSimulationSoftwareSuiteType(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final version = this.version;
    return {
      if (name != null) 'name': name.toValue(),
      if (version != null) 'version': version,
    };
  }
}

enum SimulationSoftwareSuiteType {
  gazebo,
  rosbagPlay,
  simulationRuntime,
}

extension SimulationSoftwareSuiteTypeValueExtension
    on SimulationSoftwareSuiteType {
  String toValue() {
    switch (this) {
      case SimulationSoftwareSuiteType.gazebo:
        return 'Gazebo';
      case SimulationSoftwareSuiteType.rosbagPlay:
        return 'RosbagPlay';
      case SimulationSoftwareSuiteType.simulationRuntime:
        return 'SimulationRuntime';
    }
  }
}

extension SimulationSoftwareSuiteTypeFromString on String {
  SimulationSoftwareSuiteType toSimulationSoftwareSuiteType() {
    switch (this) {
      case 'Gazebo':
        return SimulationSoftwareSuiteType.gazebo;
      case 'RosbagPlay':
        return SimulationSoftwareSuiteType.rosbagPlay;
      case 'SimulationRuntime':
        return SimulationSoftwareSuiteType.simulationRuntime;
    }
    throw Exception('$this is not known in enum SimulationSoftwareSuiteType');
  }
}

/// Information about a source.
class Source {
  /// The taget processor architecture for the application.
  final Architecture? architecture;

  /// A hash of the object specified by <code>s3Bucket</code> and
  /// <code>s3Key</code>.
  final String? etag;

  /// The s3 bucket name.
  final String? s3Bucket;

  /// The s3 object key.
  final String? s3Key;

  Source({
    this.architecture,
    this.etag,
    this.s3Bucket,
    this.s3Key,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      architecture: (json['architecture'] as String?)?.toArchitecture(),
      etag: json['etag'] as String?,
      s3Bucket: json['s3Bucket'] as String?,
      s3Key: json['s3Key'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final etag = this.etag;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      if (architecture != null) 'architecture': architecture.toValue(),
      if (etag != null) 'etag': etag,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Key != null) 's3Key': s3Key,
    };
  }
}

/// Information about a source configuration.
class SourceConfig {
  /// The target processor architecture for the application.
  final Architecture? architecture;

  /// The Amazon S3 bucket name.
  final String? s3Bucket;

  /// The s3 object key.
  final String? s3Key;

  SourceConfig({
    this.architecture,
    this.s3Bucket,
    this.s3Key,
  });

  Map<String, dynamic> toJson() {
    final architecture = this.architecture;
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      if (architecture != null) 'architecture': architecture.toValue(),
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3Key != null) 's3Key': s3Key,
    };
  }
}

class StartSimulationJobBatchResponse {
  /// The Amazon Resource Name (arn) of the batch.
  final String? arn;

  /// The batch policy.
  final BatchPolicy? batchPolicy;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  final String? clientRequestToken;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// created.
  final DateTime? createdAt;

  /// A list of created simulation job request summaries.
  final List<SimulationJobSummary>? createdRequests;

  /// A list of failed simulation job requests. The request failed to be created
  /// into a simulation job. Failed requests do not have a simulation job ID.
  final List<FailedCreateSimulationJobRequest>? failedRequests;

  /// The failure code if the simulation job batch failed.
  final SimulationJobBatchErrorCode? failureCode;

  /// The reason the simulation job batch failed.
  final String? failureReason;

  /// A list of pending simulation job requests. These requests have not yet been
  /// created into simulation jobs.
  final List<SimulationJobRequest>? pendingRequests;

  /// The status of the simulation job batch.
  /// <dl> <dt>Pending</dt> <dd>
  /// The simulation job batch request is pending.
  /// </dd> <dt>InProgress</dt> <dd>
  /// The simulation job batch is in progress.
  /// </dd> <dt>Failed</dt> <dd>
  /// The simulation job batch failed. One or more simulation job requests could
  /// not be completed due to an internal failure (like
  /// <code>InternalServiceError</code>). See <code>failureCode</code> and
  /// <code>failureReason</code> for more information.
  /// </dd> <dt>Completed</dt> <dd>
  /// The simulation batch job completed. A batch is complete when (1) there are
  /// no pending simulation job requests in the batch and none of the failed
  /// simulation job requests are due to <code>InternalServiceError</code> and (2)
  /// when all created simulation jobs have reached a terminal state (for example,
  /// <code>Completed</code> or <code>Failed</code>).
  /// </dd> <dt>Canceled</dt> <dd>
  /// The simulation batch job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The simulation batch job is being cancelled.
  /// </dd> <dt>Completing</dt> <dd>
  /// The simulation batch job is completing.
  /// </dd> <dt>TimingOut</dt> <dd>
  /// The simulation job batch is timing out.
  ///
  /// If a batch timing out, and there are pending requests that were failing due
  /// to an internal failure (like <code>InternalServiceError</code>), the batch
  /// status will be <code>Failed</code>. If there are no such failing request,
  /// the batch status will be <code>TimedOut</code>.
  /// </dd> <dt>TimedOut</dt> <dd>
  /// The simulation batch job timed out.
  /// </dd> </dl>
  final SimulationJobBatchStatus? status;

  /// A map that contains tag keys and tag values that are attached to the
  /// deployment job batch.
  final Map<String, String>? tags;

  StartSimulationJobBatchResponse({
    this.arn,
    this.batchPolicy,
    this.clientRequestToken,
    this.createdAt,
    this.createdRequests,
    this.failedRequests,
    this.failureCode,
    this.failureReason,
    this.pendingRequests,
    this.status,
    this.tags,
  });

  factory StartSimulationJobBatchResponse.fromJson(Map<String, dynamic> json) {
    return StartSimulationJobBatchResponse(
      arn: json['arn'] as String?,
      batchPolicy: json['batchPolicy'] != null
          ? BatchPolicy.fromJson(json['batchPolicy'] as Map<String, dynamic>)
          : null,
      clientRequestToken: json['clientRequestToken'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      createdRequests: (json['createdRequests'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationJobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      failedRequests: (json['failedRequests'] as List?)
          ?.whereNotNull()
          .map((e) => FailedCreateSimulationJobRequest.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      failureCode:
          (json['failureCode'] as String?)?.toSimulationJobBatchErrorCode(),
      failureReason: json['failureReason'] as String?,
      pendingRequests: (json['pendingRequests'] as List?)
          ?.whereNotNull()
          .map((e) => SimulationJobRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toSimulationJobBatchStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final batchPolicy = this.batchPolicy;
    final clientRequestToken = this.clientRequestToken;
    final createdAt = this.createdAt;
    final createdRequests = this.createdRequests;
    final failedRequests = this.failedRequests;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final pendingRequests = this.pendingRequests;
    final status = this.status;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (batchPolicy != null) 'batchPolicy': batchPolicy,
      if (clientRequestToken != null) 'clientRequestToken': clientRequestToken,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (createdRequests != null) 'createdRequests': createdRequests,
      if (failedRequests != null) 'failedRequests': failedRequests,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (pendingRequests != null) 'pendingRequests': pendingRequests,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
    };
  }
}

@Deprecated(
    'Support for the AWS RoboMaker application deployment feature has ended. For additional information, see https://docs.aws.amazon.com/robomaker/latest/dg/fleets.html.')
class SyncDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the synchronization request.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  final DateTime? createdAt;

  /// Information about the deployment application configurations.
  final List<DeploymentApplicationConfig>? deploymentApplicationConfigs;

  /// Information about the deployment configuration.
  final DeploymentConfig? deploymentConfig;

  /// The failure code if the job fails:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>RobotApplicationCrash</dt> <dd>
  /// Robot application exited abnormally.
  /// </dd> <dt>SimulationApplicationCrash</dt> <dd>
  /// Simulation application exited abnormally.
  /// </dd> <dt>BadPermissionsRobotApplication</dt> <dd>
  /// Robot application bundle could not be downloaded.
  /// </dd> <dt>BadPermissionsSimulationApplication</dt> <dd>
  /// Simulation application bundle could not be downloaded.
  /// </dd> <dt>BadPermissionsS3Output</dt> <dd>
  /// Unable to publish outputs to customer-provided S3 bucket.
  /// </dd> <dt>BadPermissionsCloudwatchLogs</dt> <dd>
  /// Unable to publish logs to customer-provided CloudWatch Logs resource.
  /// </dd> <dt>SubnetIpLimitExceeded</dt> <dd>
  /// Subnet IP limit exceeded.
  /// </dd> <dt>ENILimitExceeded</dt> <dd>
  /// ENI limit exceeded.
  /// </dd> <dt>BadPermissionsUserCredentials</dt> <dd>
  /// Unable to use the Role provided.
  /// </dd> <dt>InvalidBundleRobotApplication</dt> <dd>
  /// Robot bundle cannot be extracted (invalid format, bundling error, or other
  /// issue).
  /// </dd> <dt>InvalidBundleSimulationApplication</dt> <dd>
  /// Simulation bundle cannot be extracted (invalid format, bundling error, or
  /// other issue).
  /// </dd> <dt>RobotApplicationVersionMismatchedEtag</dt> <dd>
  /// Etag for RobotApplication does not match value during version creation.
  /// </dd> <dt>SimulationApplicationVersionMismatchedEtag</dt> <dd>
  /// Etag for SimulationApplication does not match value during version creation.
  /// </dd> </dl>
  final DeploymentJobErrorCode? failureCode;

  /// The failure reason if the job fails.
  final String? failureReason;

  /// The Amazon Resource Name (ARN) of the fleet.
  final String? fleet;

  /// The status of the synchronization job.
  final DeploymentStatus? status;

  SyncDeploymentJobResponse({
    this.arn,
    this.createdAt,
    this.deploymentApplicationConfigs,
    this.deploymentConfig,
    this.failureCode,
    this.failureReason,
    this.fleet,
    this.status,
  });

  factory SyncDeploymentJobResponse.fromJson(Map<String, dynamic> json) {
    return SyncDeploymentJobResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      deploymentApplicationConfigs: (json['deploymentApplicationConfigs']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              DeploymentApplicationConfig.fromJson(e as Map<String, dynamic>))
          .toList(),
      deploymentConfig: json['deploymentConfig'] != null
          ? DeploymentConfig.fromJson(
              json['deploymentConfig'] as Map<String, dynamic>)
          : null,
      failureCode: (json['failureCode'] as String?)?.toDeploymentJobErrorCode(),
      failureReason: json['failureReason'] as String?,
      fleet: json['fleet'] as String?,
      status: (json['status'] as String?)?.toDeploymentStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final deploymentApplicationConfigs = this.deploymentApplicationConfigs;
    final deploymentConfig = this.deploymentConfig;
    final failureCode = this.failureCode;
    final failureReason = this.failureReason;
    final fleet = this.fleet;
    final status = this.status;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (deploymentApplicationConfigs != null)
        'deploymentApplicationConfigs': deploymentApplicationConfigs,
      if (deploymentConfig != null) 'deploymentConfig': deploymentConfig,
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (fleet != null) 'fleet': fleet,
      if (status != null) 'status': status.toValue(),
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

/// Information about a template location.
class TemplateLocation {
  /// The Amazon S3 bucket name.
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  final String s3Key;

  TemplateLocation({
    required this.s3Bucket,
    required this.s3Key,
  });

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    return {
      's3Bucket': s3Bucket,
      's3Key': s3Key,
    };
  }
}

/// Summary information for a template.
class TemplateSummary {
  /// The Amazon Resource Name (ARN) of the template.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the template was created.
  final DateTime? createdAt;

  /// The time, in milliseconds since the epoch, when the template was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The name of the template.
  final String? name;

  /// The version of the template that you're using.
  final String? version;

  TemplateSummary({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.version,
  });

  factory TemplateSummary.fromJson(Map<String, dynamic> json) {
    return TemplateSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (version != null) 'version': version,
    };
  }
}

/// Information about a tool. Tools are used in a simulation job.
class Tool {
  /// Command-line arguments for the tool. It must include the tool executable
  /// name.
  final String command;

  /// The name of the tool.
  final String name;

  /// Exit behavior determines what happens when your tool quits running.
  /// <code>RESTART</code> will cause your tool to be restarted. <code>FAIL</code>
  /// will cause your job to exit. The default is <code>RESTART</code>.
  final ExitBehavior? exitBehavior;

  /// Boolean indicating whether logs will be recorded in CloudWatch for the tool.
  /// The default is <code>False</code>.
  final bool? streamOutputToCloudWatch;

  /// Boolean indicating whether a streaming session will be configured for the
  /// tool. If <code>True</code>, AWS RoboMaker will configure a connection so you
  /// can interact with the tool as it is running in the simulation. It must have
  /// a graphical user interface. The default is <code>False</code>.
  final bool? streamUI;

  Tool({
    required this.command,
    required this.name,
    this.exitBehavior,
    this.streamOutputToCloudWatch,
    this.streamUI,
  });

  factory Tool.fromJson(Map<String, dynamic> json) {
    return Tool(
      command: json['command'] as String,
      name: json['name'] as String,
      exitBehavior: (json['exitBehavior'] as String?)?.toExitBehavior(),
      streamOutputToCloudWatch: json['streamOutputToCloudWatch'] as bool?,
      streamUI: json['streamUI'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final command = this.command;
    final name = this.name;
    final exitBehavior = this.exitBehavior;
    final streamOutputToCloudWatch = this.streamOutputToCloudWatch;
    final streamUI = this.streamUI;
    return {
      'command': command,
      'name': name,
      if (exitBehavior != null) 'exitBehavior': exitBehavior.toValue(),
      if (streamOutputToCloudWatch != null)
        'streamOutputToCloudWatch': streamOutputToCloudWatch,
      if (streamUI != null) 'streamUI': streamUI,
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

class UpdateRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the updated robot application.
  final String? arn;

  /// The object that contains the Docker image URI for your robot application.
  final Environment? environment;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the robot application.
  final String? name;

  /// The revision id of the robot application.
  final String? revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The sources of the robot application.
  final List<Source>? sources;

  /// The version of the robot application.
  final String? version;

  UpdateRobotApplicationResponse({
    this.arn,
    this.environment,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.version,
  });

  factory UpdateRobotApplicationResponse.fromJson(Map<String, dynamic> json) {
    return UpdateRobotApplicationResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final sources = this.sources;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (version != null) 'version': version,
    };
  }
}

class UpdateSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the updated simulation application.
  final String? arn;

  /// The object that contains the Docker image URI used for your simulation
  /// application.
  final Environment? environment;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  final DateTime? lastUpdatedAt;

  /// The name of the simulation application.
  final String? name;

  /// The rendering engine for the simulation application.
  final RenderingEngine? renderingEngine;

  /// The revision id of the simulation application.
  final String? revisionId;

  /// Information about the robot software suite (ROS distribution).
  final RobotSoftwareSuite? robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  final SimulationSoftwareSuite? simulationSoftwareSuite;

  /// The sources of the simulation application.
  final List<Source>? sources;

  /// The version of the robot application.
  final String? version;

  UpdateSimulationApplicationResponse({
    this.arn,
    this.environment,
    this.lastUpdatedAt,
    this.name,
    this.renderingEngine,
    this.revisionId,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
    this.sources,
    this.version,
  });

  factory UpdateSimulationApplicationResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateSimulationApplicationResponse(
      arn: json['arn'] as String?,
      environment: json['environment'] != null
          ? Environment.fromJson(json['environment'] as Map<String, dynamic>)
          : null,
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
      renderingEngine: json['renderingEngine'] != null
          ? RenderingEngine.fromJson(
              json['renderingEngine'] as Map<String, dynamic>)
          : null,
      revisionId: json['revisionId'] as String?,
      robotSoftwareSuite: json['robotSoftwareSuite'] != null
          ? RobotSoftwareSuite.fromJson(
              json['robotSoftwareSuite'] as Map<String, dynamic>)
          : null,
      simulationSoftwareSuite: json['simulationSoftwareSuite'] != null
          ? SimulationSoftwareSuite.fromJson(
              json['simulationSoftwareSuite'] as Map<String, dynamic>)
          : null,
      sources: (json['sources'] as List?)
          ?.whereNotNull()
          .map((e) => Source.fromJson(e as Map<String, dynamic>))
          .toList(),
      version: json['version'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final environment = this.environment;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    final renderingEngine = this.renderingEngine;
    final revisionId = this.revisionId;
    final robotSoftwareSuite = this.robotSoftwareSuite;
    final simulationSoftwareSuite = this.simulationSoftwareSuite;
    final sources = this.sources;
    final version = this.version;
    return {
      if (arn != null) 'arn': arn,
      if (environment != null) 'environment': environment,
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
      if (revisionId != null) 'revisionId': revisionId,
      if (robotSoftwareSuite != null) 'robotSoftwareSuite': robotSoftwareSuite,
      if (simulationSoftwareSuite != null)
        'simulationSoftwareSuite': simulationSoftwareSuite,
      if (sources != null) 'sources': sources,
      if (version != null) 'version': version,
    };
  }
}

class UpdateWorldTemplateResponse {
  /// The Amazon Resource Name (arn) of the world template.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the world template was
  /// created.
  final DateTime? createdAt;

  /// The time, in milliseconds since the epoch, when the world template was last
  /// updated.
  final DateTime? lastUpdatedAt;

  /// The name of the world template.
  final String? name;

  UpdateWorldTemplateResponse({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
  });

  factory UpdateWorldTemplateResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorldTemplateResponse(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      lastUpdatedAt: timeStampFromJson(json['lastUpdatedAt']),
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final lastUpdatedAt = this.lastUpdatedAt;
    final name = this.name;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (lastUpdatedAt != null)
        'lastUpdatedAt': unixTimestampToJson(lastUpdatedAt),
      if (name != null) 'name': name,
    };
  }
}

enum UploadBehavior {
  uploadOnTerminate,
  uploadRollingAutoRemove,
}

extension UploadBehaviorValueExtension on UploadBehavior {
  String toValue() {
    switch (this) {
      case UploadBehavior.uploadOnTerminate:
        return 'UPLOAD_ON_TERMINATE';
      case UploadBehavior.uploadRollingAutoRemove:
        return 'UPLOAD_ROLLING_AUTO_REMOVE';
    }
  }
}

extension UploadBehaviorFromString on String {
  UploadBehavior toUploadBehavior() {
    switch (this) {
      case 'UPLOAD_ON_TERMINATE':
        return UploadBehavior.uploadOnTerminate;
      case 'UPLOAD_ROLLING_AUTO_REMOVE':
        return UploadBehavior.uploadRollingAutoRemove;
    }
    throw Exception('$this is not known in enum UploadBehavior');
  }
}

/// Provides upload configuration information. Files are uploaded from the
/// simulation job to a location you specify.
class UploadConfiguration {
  /// A prefix that specifies where files will be uploaded in Amazon S3. It is
  /// appended to the simulation output location to determine the final path.
  ///
  /// For example, if your simulation output location is
  /// <code>s3://my-bucket</code> and your upload configuration name is
  /// <code>robot-test</code>, your files will be uploaded to
  /// <code>s3://my-bucket/&lt;simid&gt;/&lt;runid&gt;/robot-test</code>.
  final String name;

  /// Specifies the path of the file(s) to upload. Standard Unix glob matching
  /// rules are accepted, with the addition of <code>**</code> as a <i>super
  /// asterisk</i>. For example, specifying <code>/var/log/**.log</code> causes
  /// all .log files in the <code>/var/log</code> directory tree to be collected.
  /// For more examples, see <a href="https://github.com/gobwas/glob">Glob
  /// Library</a>.
  final String path;

  /// Specifies when to upload the files:
  /// <dl> <dt>UPLOAD_ON_TERMINATE</dt> <dd>
  /// Matching files are uploaded once the simulation enters the
  /// <code>TERMINATING</code> state. Matching files are not uploaded until all of
  /// your code (including tools) have stopped.
  ///
  /// If there is a problem uploading a file, the upload is retried. If problems
  /// persist, no further upload attempts will be made.
  /// </dd> <dt>UPLOAD_ROLLING_AUTO_REMOVE</dt> <dd>
  /// Matching files are uploaded as they are created. They are deleted after they
  /// are uploaded. The specified path is checked every 5 seconds. A final check
  /// is made when all of your code (including tools) have stopped.
  /// </dd> </dl>
  final UploadBehavior uploadBehavior;

  UploadConfiguration({
    required this.name,
    required this.path,
    required this.uploadBehavior,
  });

  factory UploadConfiguration.fromJson(Map<String, dynamic> json) {
    return UploadConfiguration(
      name: json['name'] as String,
      path: json['path'] as String,
      uploadBehavior: (json['uploadBehavior'] as String).toUploadBehavior(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final path = this.path;
    final uploadBehavior = this.uploadBehavior;
    return {
      'name': name,
      'path': path,
      'uploadBehavior': uploadBehavior.toValue(),
    };
  }
}

/// If your simulation job accesses resources in a VPC, you provide this
/// parameter identifying the list of security group IDs and subnet IDs. These
/// must belong to the same VPC. You must provide at least one security group
/// and two subnet IDs.
class VPCConfig {
  /// A list of one or more subnet IDs in your VPC.
  final List<String> subnets;

  /// A boolean indicating whether to assign a public IP address.
  final bool? assignPublicIp;

  /// A list of one or more security groups IDs in your VPC.
  final List<String>? securityGroups;

  VPCConfig({
    required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });

  factory VPCConfig.fromJson(Map<String, dynamic> json) {
    return VPCConfig(
      subnets: (json['subnets'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      assignPublicIp: json['assignPublicIp'] as bool?,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final subnets = this.subnets;
    final assignPublicIp = this.assignPublicIp;
    final securityGroups = this.securityGroups;
    return {
      'subnets': subnets,
      if (assignPublicIp != null) 'assignPublicIp': assignPublicIp,
      if (securityGroups != null) 'securityGroups': securityGroups,
    };
  }
}

/// VPC configuration associated with your simulation job.
class VPCConfigResponse {
  /// A boolean indicating if a public IP was assigned.
  final bool? assignPublicIp;

  /// A list of security group IDs associated with the simulation job.
  final List<String>? securityGroups;

  /// A list of subnet IDs associated with the simulation job.
  final List<String>? subnets;

  /// The VPC ID associated with your simulation job.
  final String? vpcId;

  VPCConfigResponse({
    this.assignPublicIp,
    this.securityGroups,
    this.subnets,
    this.vpcId,
  });

  factory VPCConfigResponse.fromJson(Map<String, dynamic> json) {
    return VPCConfigResponse(
      assignPublicIp: json['assignPublicIp'] as bool?,
      securityGroups: (json['securityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnets: (json['subnets'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final assignPublicIp = this.assignPublicIp;
    final securityGroups = this.securityGroups;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (assignPublicIp != null) 'assignPublicIp': assignPublicIp,
      if (securityGroups != null) 'securityGroups': securityGroups,
      if (subnets != null) 'subnets': subnets,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

/// Configuration information for a world.
class WorldConfig {
  /// The world generated by Simulation WorldForge.
  final String? world;

  WorldConfig({
    this.world,
  });

  factory WorldConfig.fromJson(Map<String, dynamic> json) {
    return WorldConfig(
      world: json['world'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final world = this.world;
    return {
      if (world != null) 'world': world,
    };
  }
}

/// The number of worlds that will be created. You can configure the number of
/// unique floorplans and the number of unique interiors for each floor plan.
/// For example, if you want 1 world with 20 unique interiors, you set
/// <code>floorplanCount = 1</code> and <code>interiorCountPerFloorplan =
/// 20</code>. This will result in 20 worlds (<code>floorplanCount</code> *
/// <code>interiorCountPerFloorplan)</code>.
///
/// If you set <code>floorplanCount = 4</code> and
/// <code>interiorCountPerFloorplan = 5</code>, there will be 20 worlds with 5
/// unique floor plans.
class WorldCount {
  /// The number of unique floorplans.
  final int? floorplanCount;

  /// The number of unique interiors per floorplan.
  final int? interiorCountPerFloorplan;

  WorldCount({
    this.floorplanCount,
    this.interiorCountPerFloorplan,
  });

  factory WorldCount.fromJson(Map<String, dynamic> json) {
    return WorldCount(
      floorplanCount: json['floorplanCount'] as int?,
      interiorCountPerFloorplan: json['interiorCountPerFloorplan'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final floorplanCount = this.floorplanCount;
    final interiorCountPerFloorplan = this.interiorCountPerFloorplan;
    return {
      if (floorplanCount != null) 'floorplanCount': floorplanCount,
      if (interiorCountPerFloorplan != null)
        'interiorCountPerFloorplan': interiorCountPerFloorplan,
    };
  }
}

enum WorldExportJobErrorCode {
  internalServiceError,
  limitExceeded,
  resourceNotFound,
  requestThrottled,
  invalidInput,
  accessDenied,
}

extension WorldExportJobErrorCodeValueExtension on WorldExportJobErrorCode {
  String toValue() {
    switch (this) {
      case WorldExportJobErrorCode.internalServiceError:
        return 'InternalServiceError';
      case WorldExportJobErrorCode.limitExceeded:
        return 'LimitExceeded';
      case WorldExportJobErrorCode.resourceNotFound:
        return 'ResourceNotFound';
      case WorldExportJobErrorCode.requestThrottled:
        return 'RequestThrottled';
      case WorldExportJobErrorCode.invalidInput:
        return 'InvalidInput';
      case WorldExportJobErrorCode.accessDenied:
        return 'AccessDenied';
    }
  }
}

extension WorldExportJobErrorCodeFromString on String {
  WorldExportJobErrorCode toWorldExportJobErrorCode() {
    switch (this) {
      case 'InternalServiceError':
        return WorldExportJobErrorCode.internalServiceError;
      case 'LimitExceeded':
        return WorldExportJobErrorCode.limitExceeded;
      case 'ResourceNotFound':
        return WorldExportJobErrorCode.resourceNotFound;
      case 'RequestThrottled':
        return WorldExportJobErrorCode.requestThrottled;
      case 'InvalidInput':
        return WorldExportJobErrorCode.invalidInput;
      case 'AccessDenied':
        return WorldExportJobErrorCode.accessDenied;
    }
    throw Exception('$this is not known in enum WorldExportJobErrorCode');
  }
}

enum WorldExportJobStatus {
  pending,
  running,
  completed,
  failed,
  canceling,
  canceled,
}

extension WorldExportJobStatusValueExtension on WorldExportJobStatus {
  String toValue() {
    switch (this) {
      case WorldExportJobStatus.pending:
        return 'Pending';
      case WorldExportJobStatus.running:
        return 'Running';
      case WorldExportJobStatus.completed:
        return 'Completed';
      case WorldExportJobStatus.failed:
        return 'Failed';
      case WorldExportJobStatus.canceling:
        return 'Canceling';
      case WorldExportJobStatus.canceled:
        return 'Canceled';
    }
  }
}

extension WorldExportJobStatusFromString on String {
  WorldExportJobStatus toWorldExportJobStatus() {
    switch (this) {
      case 'Pending':
        return WorldExportJobStatus.pending;
      case 'Running':
        return WorldExportJobStatus.running;
      case 'Completed':
        return WorldExportJobStatus.completed;
      case 'Failed':
        return WorldExportJobStatus.failed;
      case 'Canceling':
        return WorldExportJobStatus.canceling;
      case 'Canceled':
        return WorldExportJobStatus.canceled;
    }
    throw Exception('$this is not known in enum WorldExportJobStatus');
  }
}

/// Information about a world export job.
class WorldExportJobSummary {
  /// The Amazon Resource Name (ARN) of the world export job.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the world export job was
  /// created.
  final DateTime? createdAt;
  final OutputLocation? outputLocation;

  /// The status of the world export job.
  /// <dl> <dt>Pending</dt> <dd>
  /// The world export job request is pending.
  /// </dd> <dt>Running</dt> <dd>
  /// The world export job is running.
  /// </dd> <dt>Completed</dt> <dd>
  /// The world export job completed.
  /// </dd> <dt>Failed</dt> <dd>
  /// The world export job failed. See <code>failureCode</code> for more
  /// information.
  /// </dd> <dt>Canceled</dt> <dd>
  /// The world export job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The world export job is being cancelled.
  /// </dd> </dl>
  final WorldExportJobStatus? status;

  /// A list of worlds.
  final List<String>? worlds;

  WorldExportJobSummary({
    this.arn,
    this.createdAt,
    this.outputLocation,
    this.status,
    this.worlds,
  });

  factory WorldExportJobSummary.fromJson(Map<String, dynamic> json) {
    return WorldExportJobSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      outputLocation: json['outputLocation'] != null
          ? OutputLocation.fromJson(
              json['outputLocation'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toWorldExportJobStatus(),
      worlds: (json['worlds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final outputLocation = this.outputLocation;
    final status = this.status;
    final worlds = this.worlds;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (outputLocation != null) 'outputLocation': outputLocation,
      if (status != null) 'status': status.toValue(),
      if (worlds != null) 'worlds': worlds,
    };
  }
}

/// Information about a failed world.
class WorldFailure {
  /// The failure code of the world export job if it failed:
  /// <dl> <dt>InternalServiceError</dt> <dd>
  /// Internal service error.
  /// </dd> <dt>LimitExceeded</dt> <dd>
  /// The requested resource exceeds the maximum number allowed, or the number of
  /// concurrent stream requests exceeds the maximum number allowed.
  /// </dd> <dt>ResourceNotFound</dt> <dd>
  /// The specified resource could not be found.
  /// </dd> <dt>RequestThrottled</dt> <dd>
  /// The request was throttled.
  /// </dd> <dt>InvalidInput</dt> <dd>
  /// An input parameter in the request is not valid.
  /// </dd> </dl>
  final WorldGenerationJobErrorCode? failureCode;

  /// The number of failed worlds.
  final int? failureCount;

  /// The sample reason why the world failed. World errors are aggregated. A
  /// sample is used as the <code>sampleFailureReason</code>.
  final String? sampleFailureReason;

  WorldFailure({
    this.failureCode,
    this.failureCount,
    this.sampleFailureReason,
  });

  factory WorldFailure.fromJson(Map<String, dynamic> json) {
    return WorldFailure(
      failureCode:
          (json['failureCode'] as String?)?.toWorldGenerationJobErrorCode(),
      failureCount: json['failureCount'] as int?,
      sampleFailureReason: json['sampleFailureReason'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final failureCode = this.failureCode;
    final failureCount = this.failureCount;
    final sampleFailureReason = this.sampleFailureReason;
    return {
      if (failureCode != null) 'failureCode': failureCode.toValue(),
      if (failureCount != null) 'failureCount': failureCount,
      if (sampleFailureReason != null)
        'sampleFailureReason': sampleFailureReason,
    };
  }
}

enum WorldGenerationJobErrorCode {
  internalServiceError,
  limitExceeded,
  resourceNotFound,
  requestThrottled,
  invalidInput,
  allWorldGenerationFailed,
}

extension WorldGenerationJobErrorCodeValueExtension
    on WorldGenerationJobErrorCode {
  String toValue() {
    switch (this) {
      case WorldGenerationJobErrorCode.internalServiceError:
        return 'InternalServiceError';
      case WorldGenerationJobErrorCode.limitExceeded:
        return 'LimitExceeded';
      case WorldGenerationJobErrorCode.resourceNotFound:
        return 'ResourceNotFound';
      case WorldGenerationJobErrorCode.requestThrottled:
        return 'RequestThrottled';
      case WorldGenerationJobErrorCode.invalidInput:
        return 'InvalidInput';
      case WorldGenerationJobErrorCode.allWorldGenerationFailed:
        return 'AllWorldGenerationFailed';
    }
  }
}

extension WorldGenerationJobErrorCodeFromString on String {
  WorldGenerationJobErrorCode toWorldGenerationJobErrorCode() {
    switch (this) {
      case 'InternalServiceError':
        return WorldGenerationJobErrorCode.internalServiceError;
      case 'LimitExceeded':
        return WorldGenerationJobErrorCode.limitExceeded;
      case 'ResourceNotFound':
        return WorldGenerationJobErrorCode.resourceNotFound;
      case 'RequestThrottled':
        return WorldGenerationJobErrorCode.requestThrottled;
      case 'InvalidInput':
        return WorldGenerationJobErrorCode.invalidInput;
      case 'AllWorldGenerationFailed':
        return WorldGenerationJobErrorCode.allWorldGenerationFailed;
    }
    throw Exception('$this is not known in enum WorldGenerationJobErrorCode');
  }
}

enum WorldGenerationJobStatus {
  pending,
  running,
  completed,
  failed,
  partialFailed,
  canceling,
  canceled,
}

extension WorldGenerationJobStatusValueExtension on WorldGenerationJobStatus {
  String toValue() {
    switch (this) {
      case WorldGenerationJobStatus.pending:
        return 'Pending';
      case WorldGenerationJobStatus.running:
        return 'Running';
      case WorldGenerationJobStatus.completed:
        return 'Completed';
      case WorldGenerationJobStatus.failed:
        return 'Failed';
      case WorldGenerationJobStatus.partialFailed:
        return 'PartialFailed';
      case WorldGenerationJobStatus.canceling:
        return 'Canceling';
      case WorldGenerationJobStatus.canceled:
        return 'Canceled';
    }
  }
}

extension WorldGenerationJobStatusFromString on String {
  WorldGenerationJobStatus toWorldGenerationJobStatus() {
    switch (this) {
      case 'Pending':
        return WorldGenerationJobStatus.pending;
      case 'Running':
        return WorldGenerationJobStatus.running;
      case 'Completed':
        return WorldGenerationJobStatus.completed;
      case 'Failed':
        return WorldGenerationJobStatus.failed;
      case 'PartialFailed':
        return WorldGenerationJobStatus.partialFailed;
      case 'Canceling':
        return WorldGenerationJobStatus.canceling;
      case 'Canceled':
        return WorldGenerationJobStatus.canceled;
    }
    throw Exception('$this is not known in enum WorldGenerationJobStatus');
  }
}

/// Information about a world generator job.
class WorldGenerationJobSummary {
  /// The Amazon Resource Name (ARN) of the world generator job.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the world generator job was
  /// created.
  final DateTime? createdAt;

  /// The number of worlds that failed.
  final int? failedWorldCount;

  /// The status of the world generator job:
  /// <dl> <dt>Pending</dt> <dd>
  /// The world generator job request is pending.
  /// </dd> <dt>Running</dt> <dd>
  /// The world generator job is running.
  /// </dd> <dt>Completed</dt> <dd>
  /// The world generator job completed.
  /// </dd> <dt>Failed</dt> <dd>
  /// The world generator job failed. See <code>failureCode</code> for more
  /// information.
  /// </dd> <dt>PartialFailed</dt> <dd>
  /// Some worlds did not generate.
  /// </dd> <dt>Canceled</dt> <dd>
  /// The world generator job was cancelled.
  /// </dd> <dt>Canceling</dt> <dd>
  /// The world generator job is being cancelled.
  /// </dd> </dl>
  final WorldGenerationJobStatus? status;

  /// The number of worlds that were generated.
  final int? succeededWorldCount;

  /// The Amazon Resource Name (arn) of the world template.
  final String? template;

  /// Information about the world count.
  final WorldCount? worldCount;

  WorldGenerationJobSummary({
    this.arn,
    this.createdAt,
    this.failedWorldCount,
    this.status,
    this.succeededWorldCount,
    this.template,
    this.worldCount,
  });

  factory WorldGenerationJobSummary.fromJson(Map<String, dynamic> json) {
    return WorldGenerationJobSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      failedWorldCount: json['failedWorldCount'] as int?,
      status: (json['status'] as String?)?.toWorldGenerationJobStatus(),
      succeededWorldCount: json['succeededWorldCount'] as int?,
      template: json['template'] as String?,
      worldCount: json['worldCount'] != null
          ? WorldCount.fromJson(json['worldCount'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final failedWorldCount = this.failedWorldCount;
    final status = this.status;
    final succeededWorldCount = this.succeededWorldCount;
    final template = this.template;
    final worldCount = this.worldCount;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (failedWorldCount != null) 'failedWorldCount': failedWorldCount,
      if (status != null) 'status': status.toValue(),
      if (succeededWorldCount != null)
        'succeededWorldCount': succeededWorldCount,
      if (template != null) 'template': template,
      if (worldCount != null) 'worldCount': worldCount,
    };
  }
}

/// Information about a world.
class WorldSummary {
  /// The Amazon Resource Name (ARN) of the world.
  final String? arn;

  /// The time, in milliseconds since the epoch, when the world was created.
  final DateTime? createdAt;

  /// The Amazon Resource Name (arn) of the world generation job.
  final String? generationJob;

  /// The Amazon Resource Name (arn) of the world template.
  final String? template;

  WorldSummary({
    this.arn,
    this.createdAt,
    this.generationJob,
    this.template,
  });

  factory WorldSummary.fromJson(Map<String, dynamic> json) {
    return WorldSummary(
      arn: json['arn'] as String?,
      createdAt: timeStampFromJson(json['createdAt']),
      generationJob: json['generationJob'] as String?,
      template: json['template'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final createdAt = this.createdAt;
    final generationJob = this.generationJob;
    final template = this.template;
    return {
      if (arn != null) 'arn': arn,
      if (createdAt != null) 'createdAt': unixTimestampToJson(createdAt),
      if (generationJob != null) 'generationJob': generationJob,
      if (template != null) 'template': template,
    };
  }
}

class ConcurrentDeploymentException extends _s.GenericAwsException {
  ConcurrentDeploymentException({String? type, String? message})
      : super(
            type: type,
            code: 'ConcurrentDeploymentException',
            message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String? type, String? message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String? type, String? message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String? type, String? message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String? type, String? message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String? type, String? message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String? type, String? message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
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

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'ConcurrentDeploymentException': (type, message) =>
      ConcurrentDeploymentException(type: type, message: message),
  'IdempotentParameterMismatchException': (type, message) =>
      IdempotentParameterMismatchException(type: type, message: message),
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'InvalidParameterException': (type, message) =>
      InvalidParameterException(type: type, message: message),
  'LimitExceededException': (type, message) =>
      LimitExceededException(type: type, message: message),
  'ResourceAlreadyExistsException': (type, message) =>
      ResourceAlreadyExistsException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceUnavailableException': (type, message) =>
      ServiceUnavailableException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
};
