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

part '2018-06-29.g.dart';

/// This section provides documentation for the AWS RoboMaker API operations.
class RoboMaker {
  final _s.RestJsonProtocol _protocol;
  RoboMaker({
    @_s.required String region,
    _s.AwsClientCredentials credentials,
    _s.Client client,
    String endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'robomaker',
            signingName: 'robomaker',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

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
    @_s.required List<String> worlds,
  }) async {
    ArgumentError.checkNotNull(worlds, 'worlds');
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
    @_s.required List<String> jobs,
  }) async {
    ArgumentError.checkNotNull(jobs, 'jobs');
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
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The deployment job ARN to cancel.
  Future<void> cancelDeploymentJob({
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelDeploymentJob',
      exceptionFnMap: _exceptionFns,
    );
    return CancelDeploymentJobResponse.fromJson(response);
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
    return CancelSimulationJobResponse.fromJson(response);
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
    @_s.required String batch,
  }) async {
    ArgumentError.checkNotNull(batch, 'batch');
    _s.validateStringLength(
      'batch',
      batch,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batch',
      batch,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'batch': batch,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelSimulationJobBatch',
      exceptionFnMap: _exceptionFns,
    );
    return CancelSimulationJobBatchResponse.fromJson(response);
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelWorldExportJob',
      exceptionFnMap: _exceptionFns,
    );
    return CancelWorldExportJobResponse.fromJson(response);
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/cancelWorldGenerationJob',
      exceptionFnMap: _exceptionFns,
    );
    return CancelWorldGenerationJobResponse.fromJson(response);
  }

  /// Deploys a specific version of a robot application to robots in a fleet.
  ///
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
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [deploymentApplicationConfigs] :
  /// The deployment application configuration.
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet to deploy.
  ///
  /// Parameter [deploymentConfig] :
  /// The requested deployment configuration.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// deployment job.
  Future<CreateDeploymentJobResponse> createDeploymentJob({
    @_s.required String clientRequestToken,
    @_s.required List<DeploymentApplicationConfig> deploymentApplicationConfigs,
    @_s.required String fleet,
    DeploymentConfig deploymentConfig,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        deploymentApplicationConfigs, 'deploymentApplicationConfigs');
    ArgumentError.checkNotNull(fleet, 'fleet');
    _s.validateStringLength(
      'fleet',
      fleet,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleet',
      fleet,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'deploymentApplicationConfigs': deploymentApplicationConfigs,
      'fleet': fleet,
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
  Future<CreateFleetResponse> createFleet({
    @_s.required String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
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
  Future<CreateRobotResponse> createRobot({
    @_s.required Architecture architecture,
    @_s.required String greengrassGroupId,
    @_s.required String name,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(architecture, 'architecture');
    ArgumentError.checkNotNull(greengrassGroupId, 'greengrassGroupId');
    _s.validateStringLength(
      'greengrassGroupId',
      greengrassGroupId,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'greengrassGroupId',
      greengrassGroupId,
      r'''.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'architecture': architecture?.toValue() ?? '',
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
  /// Parameter [sources] :
  /// The sources of the robot application.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the robot
  /// application.
  Future<CreateRobotApplicationResponse> createRobotApplication({
    @_s.required String name,
    @_s.required RobotSoftwareSuite robotSoftwareSuite,
    @_s.required List<SourceConfig> sources,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(robotSoftwareSuite, 'robotSoftwareSuite');
    ArgumentError.checkNotNull(sources, 'sources');
    final $payload = <String, dynamic>{
      'name': name,
      'robotSoftwareSuite': robotSoftwareSuite,
      'sources': sources,
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
  Future<CreateRobotApplicationVersionResponse> createRobotApplicationVersion({
    @_s.required String application,
    String currentRevisionId,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'currentRevisionId',
      currentRevisionId,
      1,
      40,
    );
    _s.validateStringPattern(
      'currentRevisionId',
      currentRevisionId,
      r'''[a-zA-Z0-9_.\-]*''',
    );
    final $payload = <String, dynamic>{
      'application': application,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
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
  /// Parameter [sources] :
  /// The sources of the simulation application.
  ///
  /// Parameter [renderingEngine] :
  /// The rendering engine for the simulation application.
  ///
  /// Parameter [tags] :
  /// A map that contains tag keys and tag values that are attached to the
  /// simulation application.
  Future<CreateSimulationApplicationResponse> createSimulationApplication({
    @_s.required String name,
    @_s.required RobotSoftwareSuite robotSoftwareSuite,
    @_s.required SimulationSoftwareSuite simulationSoftwareSuite,
    @_s.required List<SourceConfig> sources,
    RenderingEngine renderingEngine,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(name, 'name');
    _s.validateStringLength(
      'name',
      name,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''[a-zA-Z0-9_\-]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(robotSoftwareSuite, 'robotSoftwareSuite');
    ArgumentError.checkNotNull(
        simulationSoftwareSuite, 'simulationSoftwareSuite');
    ArgumentError.checkNotNull(sources, 'sources');
    final $payload = <String, dynamic>{
      'name': name,
      'robotSoftwareSuite': robotSoftwareSuite,
      'simulationSoftwareSuite': simulationSoftwareSuite,
      'sources': sources,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
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
  Future<CreateSimulationApplicationVersionResponse>
      createSimulationApplicationVersion({
    @_s.required String application,
    String currentRevisionId,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'currentRevisionId',
      currentRevisionId,
      1,
      40,
    );
    _s.validateStringPattern(
      'currentRevisionId',
      currentRevisionId,
      r'''[a-zA-Z0-9_.\-]*''',
    );
    final $payload = <String, dynamic>{
      'application': application,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
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
  /// Restart the simulation job in the same host instance.
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
    @_s.required String iamRole,
    @_s.required int maxJobDurationInSeconds,
    String clientRequestToken,
    Compute compute,
    List<DataSourceConfig> dataSources,
    FailureBehavior failureBehavior,
    LoggingConfig loggingConfig,
    OutputLocation outputLocation,
    List<RobotApplicationConfig> robotApplications,
    List<SimulationApplicationConfig> simulationApplications,
    Map<String, String> tags,
    VPCConfig vpcConfig,
  }) async {
    ArgumentError.checkNotNull(iamRole, 'iamRole');
    _s.validateStringLength(
      'iamRole',
      iamRole,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'iamRole',
      iamRole,
      r'''arn:aws:iam::\w+:role/.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(
        maxJobDurationInSeconds, 'maxJobDurationInSeconds');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
    );
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
    @_s.required String iamRole,
    @_s.required OutputLocation outputLocation,
    @_s.required List<String> worlds,
    String clientRequestToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(iamRole, 'iamRole');
    _s.validateStringLength(
      'iamRole',
      iamRole,
      1,
      255,
      isRequired: true,
    );
    _s.validateStringPattern(
      'iamRole',
      iamRole,
      r'''arn:aws:iam::\w+:role/.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(outputLocation, 'outputLocation');
    ArgumentError.checkNotNull(worlds, 'worlds');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
    );
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
    @_s.required String template,
    @_s.required WorldCount worldCount,
    String clientRequestToken,
    Map<String, String> tags,
    Map<String, String> worldTags,
  }) async {
    ArgumentError.checkNotNull(template, 'template');
    _s.validateStringLength(
      'template',
      template,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'template',
      template,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(worldCount, 'worldCount');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
    );
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
    String clientRequestToken,
    String name,
    Map<String, String> tags,
    String templateBody,
    TemplateLocation templateLocation,
  }) async {
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      255,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*''',
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      262144,
    );
    _s.validateStringPattern(
      'templateBody',
      templateBody,
      r'''[\S\s]+''',
    );
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
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet.
  Future<void> deleteFleet({
    @_s.required String fleet,
  }) async {
    ArgumentError.checkNotNull(fleet, 'fleet');
    _s.validateStringLength(
      'fleet',
      fleet,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleet',
      fleet,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'fleet': fleet,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteFleet',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteFleetResponse.fromJson(response);
  }

  /// Deletes a robot.
  ///
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [robot] :
  /// The Amazon Resource Name (ARN) of the robot.
  Future<void> deleteRobot({
    @_s.required String robot,
  }) async {
    ArgumentError.checkNotNull(robot, 'robot');
    _s.validateStringLength(
      'robot',
      robot,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'robot',
      robot,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'robot': robot,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteRobot',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteRobotResponse.fromJson(response);
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
    @_s.required String application,
    String applicationVersion,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationVersion',
      applicationVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'applicationVersion',
      applicationVersion,
      r'''(\$LATEST)|[0-9]*''',
    );
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
    return DeleteRobotApplicationResponse.fromJson(response);
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
    @_s.required String application,
    String applicationVersion,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationVersion',
      applicationVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'applicationVersion',
      applicationVersion,
      r'''(\$LATEST)|[0-9]*''',
    );
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
    return DeleteSimulationApplicationResponse.fromJson(response);
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
    @_s.required String template,
  }) async {
    ArgumentError.checkNotNull(template, 'template');
    _s.validateStringLength(
      'template',
      template,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'template',
      template,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'template': template,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/deleteWorldTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return DeleteWorldTemplateResponse.fromJson(response);
  }

  /// Deregisters a robot.
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
  Future<DeregisterRobotResponse> deregisterRobot({
    @_s.required String fleet,
    @_s.required String robot,
  }) async {
    ArgumentError.checkNotNull(fleet, 'fleet');
    _s.validateStringLength(
      'fleet',
      fleet,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleet',
      fleet,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(robot, 'robot');
    _s.validateStringLength(
      'robot',
      robot,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'robot',
      robot,
      r'''arn:.*''',
      isRequired: true,
    );
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
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [job] :
  /// The Amazon Resource Name (ARN) of the deployment job.
  Future<DescribeDeploymentJobResponse> describeDeploymentJob({
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
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
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [fleet] :
  /// The Amazon Resource Name (ARN) of the fleet.
  Future<DescribeFleetResponse> describeFleet({
    @_s.required String fleet,
  }) async {
    ArgumentError.checkNotNull(fleet, 'fleet');
    _s.validateStringLength(
      'fleet',
      fleet,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleet',
      fleet,
      r'''arn:.*''',
      isRequired: true,
    );
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
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [robot] :
  /// The Amazon Resource Name (ARN) of the robot to be described.
  Future<DescribeRobotResponse> describeRobot({
    @_s.required String robot,
  }) async {
    ArgumentError.checkNotNull(robot, 'robot');
    _s.validateStringLength(
      'robot',
      robot,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'robot',
      robot,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String application,
    String applicationVersion,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationVersion',
      applicationVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'applicationVersion',
      applicationVersion,
      r'''(\$LATEST)|[0-9]*''',
    );
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
    @_s.required String application,
    String applicationVersion,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'applicationVersion',
      applicationVersion,
      1,
      255,
    );
    _s.validateStringPattern(
      'applicationVersion',
      applicationVersion,
      r'''(\$LATEST)|[0-9]*''',
    );
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String batch,
  }) async {
    ArgumentError.checkNotNull(batch, 'batch');
    _s.validateStringLength(
      'batch',
      batch,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'batch',
      batch,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String world,
  }) async {
    ArgumentError.checkNotNull(world, 'world');
    _s.validateStringLength(
      'world',
      world,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'world',
      world,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String template,
  }) async {
    ArgumentError.checkNotNull(template, 'template');
    _s.validateStringLength(
      'template',
      template,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'template',
      template,
      r'''arn:.*''',
      isRequired: true,
    );
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
    String generationJob,
    String template,
  }) async {
    _s.validateStringLength(
      'generationJob',
      generationJob,
      1,
      1224,
    );
    _s.validateStringPattern(
      'generationJob',
      generationJob,
      r'''arn:.*''',
    );
    _s.validateStringLength(
      'template',
      template,
      1,
      1224,
    );
    _s.validateStringPattern(
      'template',
      template,
      r'''arn:.*''',
    );
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
  Future<ListDeploymentJobsResponse> listDeploymentJobs({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
  Future<ListFleetsResponse> listFleets({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
    String versionQualifier,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
    _s.validateStringLength(
      'versionQualifier',
      versionQualifier,
      1,
      255,
    );
    _s.validateStringPattern(
      'versionQualifier',
      versionQualifier,
      r'''ALL''',
    );
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
  Future<ListRobotsResponse> listRobots({
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
    String versionQualifier,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
    _s.validateStringLength(
      'versionQualifier',
      versionQualifier,
      1,
      255,
    );
    _s.validateStringPattern(
      'versionQualifier',
      versionQualifier,
      r'''ALL''',
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    @_s.required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:.*''',
      isRequired: true,
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
    List<Filter> filters,
    int maxResults,
    String nextToken,
  }) async {
    _s.validateStringLength(
      'nextToken',
      nextToken,
      1,
      2048,
    );
    _s.validateStringPattern(
      'nextToken',
      nextToken,
      r'''[a-zA-Z0-9_.\-\/+=]*''',
    );
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
  Future<RegisterRobotResponse> registerRobot({
    @_s.required String fleet,
    @_s.required String robot,
  }) async {
    ArgumentError.checkNotNull(fleet, 'fleet');
    _s.validateStringLength(
      'fleet',
      fleet,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleet',
      fleet,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(robot, 'robot');
    _s.validateStringLength(
      'robot',
      robot,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'robot',
      robot,
      r'''arn:.*''',
      isRequired: true,
    );
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
    @_s.required String job,
  }) async {
    ArgumentError.checkNotNull(job, 'job');
    _s.validateStringLength(
      'job',
      job,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'job',
      job,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'job': job,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/restartSimulationJob',
      exceptionFnMap: _exceptionFns,
    );
    return RestartSimulationJobResponse.fromJson(response);
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
    @_s.required List<SimulationJobRequest> createSimulationJobRequests,
    BatchPolicy batchPolicy,
    String clientRequestToken,
    Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(
        createSimulationJobRequests, 'createSimulationJobRequests');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
    );
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
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InvalidParameterException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [LimitExceededException].
  /// May throw [ConcurrentDeploymentException].
  /// May throw [IdempotentParameterMismatchException].
  ///
  /// Parameter [clientRequestToken] :
  /// Unique, case-sensitive identifier that you provide to ensure the
  /// idempotency of the request.
  ///
  /// Parameter [fleet] :
  /// The target fleet for the synchronization.
  Future<SyncDeploymentJobResponse> syncDeploymentJob({
    @_s.required String clientRequestToken,
    @_s.required String fleet,
  }) async {
    ArgumentError.checkNotNull(clientRequestToken, 'clientRequestToken');
    _s.validateStringLength(
      'clientRequestToken',
      clientRequestToken,
      1,
      64,
      isRequired: true,
    );
    _s.validateStringPattern(
      'clientRequestToken',
      clientRequestToken,
      r'''[a-zA-Z0-9_\-=]*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(fleet, 'fleet');
    _s.validateStringLength(
      'fleet',
      fleet,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'fleet',
      fleet,
      r'''arn:.*''',
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'clientRequestToken': clientRequestToken ?? _s.generateIdempotencyToken(),
      'fleet': fleet,
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
    @_s.required String resourceArn,
    @_s.required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tags, 'tags');
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return TagResourceResponse.fromJson(response);
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
    @_s.required String resourceArn,
    @_s.required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    _s.validateStringLength(
      'resourceArn',
      resourceArn,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'resourceArn',
      resourceArn,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $query = <String, List<String>>{
      if (tagKeys != null) 'tagKeys': tagKeys,
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return UntagResourceResponse.fromJson(response);
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
  /// Parameter [sources] :
  /// The sources of the robot application.
  ///
  /// Parameter [currentRevisionId] :
  /// The revision id for the robot application.
  Future<UpdateRobotApplicationResponse> updateRobotApplication({
    @_s.required String application,
    @_s.required RobotSoftwareSuite robotSoftwareSuite,
    @_s.required List<SourceConfig> sources,
    String currentRevisionId,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(robotSoftwareSuite, 'robotSoftwareSuite');
    ArgumentError.checkNotNull(sources, 'sources');
    _s.validateStringLength(
      'currentRevisionId',
      currentRevisionId,
      1,
      40,
    );
    _s.validateStringPattern(
      'currentRevisionId',
      currentRevisionId,
      r'''[a-zA-Z0-9_.\-]*''',
    );
    final $payload = <String, dynamic>{
      'application': application,
      'robotSoftwareSuite': robotSoftwareSuite,
      'sources': sources,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
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
  /// Parameter [sources] :
  /// The sources of the simulation application.
  ///
  /// Parameter [currentRevisionId] :
  /// The revision id for the robot application.
  ///
  /// Parameter [renderingEngine] :
  /// The rendering engine for the simulation application.
  Future<UpdateSimulationApplicationResponse> updateSimulationApplication({
    @_s.required String application,
    @_s.required RobotSoftwareSuite robotSoftwareSuite,
    @_s.required SimulationSoftwareSuite simulationSoftwareSuite,
    @_s.required List<SourceConfig> sources,
    String currentRevisionId,
    RenderingEngine renderingEngine,
  }) async {
    ArgumentError.checkNotNull(application, 'application');
    _s.validateStringLength(
      'application',
      application,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'application',
      application,
      r'''arn:.*''',
      isRequired: true,
    );
    ArgumentError.checkNotNull(robotSoftwareSuite, 'robotSoftwareSuite');
    ArgumentError.checkNotNull(
        simulationSoftwareSuite, 'simulationSoftwareSuite');
    ArgumentError.checkNotNull(sources, 'sources');
    _s.validateStringLength(
      'currentRevisionId',
      currentRevisionId,
      1,
      40,
    );
    _s.validateStringPattern(
      'currentRevisionId',
      currentRevisionId,
      r'''[a-zA-Z0-9_.\-]*''',
    );
    final $payload = <String, dynamic>{
      'application': application,
      'robotSoftwareSuite': robotSoftwareSuite,
      'simulationSoftwareSuite': simulationSoftwareSuite,
      'sources': sources,
      if (currentRevisionId != null) 'currentRevisionId': currentRevisionId,
      if (renderingEngine != null) 'renderingEngine': renderingEngine,
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
    @_s.required String template,
    String name,
    String templateBody,
    TemplateLocation templateLocation,
  }) async {
    ArgumentError.checkNotNull(template, 'template');
    _s.validateStringLength(
      'template',
      template,
      1,
      1224,
      isRequired: true,
    );
    _s.validateStringPattern(
      'template',
      template,
      r'''arn:.*''',
      isRequired: true,
    );
    _s.validateStringLength(
      'name',
      name,
      0,
      255,
    );
    _s.validateStringPattern(
      'name',
      name,
      r'''.*''',
    );
    _s.validateStringLength(
      'templateBody',
      templateBody,
      1,
      262144,
    );
    _s.validateStringPattern(
      'templateBody',
      templateBody,
      r'''[\S\s]+''',
    );
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
  @_s.JsonValue('X86_64')
  x86_64,
  @_s.JsonValue('ARM64')
  arm64,
  @_s.JsonValue('ARMHF')
  armhf,
}

extension on Architecture {
  String toValue() {
    switch (this) {
      case Architecture.x86_64:
        return 'X86_64';
      case Architecture.arm64:
        return 'ARM64';
      case Architecture.armhf:
        return 'ARMHF';
    }
    throw Exception('Unknown enum value: $this');
  }
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDeleteWorldsResponse {
  /// A list of unprocessed worlds associated with the call. These worlds were not
  /// deleted.
  @_s.JsonKey(name: 'unprocessedWorlds')
  final List<String> unprocessedWorlds;

  BatchDeleteWorldsResponse({
    this.unprocessedWorlds,
  });
  factory BatchDeleteWorldsResponse.fromJson(Map<String, dynamic> json) =>
      _$BatchDeleteWorldsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class BatchDescribeSimulationJobResponse {
  /// A list of simulation jobs.
  @_s.JsonKey(name: 'jobs')
  final List<SimulationJob> jobs;

  /// A list of unprocessed simulation job Amazon Resource Names (ARNs).
  @_s.JsonKey(name: 'unprocessedJobs')
  final List<String> unprocessedJobs;

  BatchDescribeSimulationJobResponse({
    this.jobs,
    this.unprocessedJobs,
  });
  factory BatchDescribeSimulationJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$BatchDescribeSimulationJobResponseFromJson(json);
}

/// Information about the batch policy.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class BatchPolicy {
  /// The number of active simulation jobs create as part of the batch that can be
  /// in an active state at the same time.
  ///
  /// Active states include: <code>Pending</code>,<code>Preparing</code>,
  /// <code>Running</code>, <code>Restarting</code>, <code>RunningFailed</code>
  /// and <code>Terminating</code>. All other states are terminal states.
  @_s.JsonKey(name: 'maxConcurrency')
  final int maxConcurrency;

  /// The amount of time, in seconds, to wait for the batch to complete.
  ///
  /// If a batch times out, and there are pending requests that were failing due
  /// to an internal failure (like <code>InternalServiceError</code>), they will
  /// be moved to the failed list and the batch status will be
  /// <code>Failed</code>. If the pending requests were failing for any other
  /// reason, the failed pending requests will be moved to the failed list and the
  /// batch status will be <code>TimedOut</code>.
  @_s.JsonKey(name: 'timeoutInSeconds')
  final int timeoutInSeconds;

  BatchPolicy({
    this.maxConcurrency,
    this.timeoutInSeconds,
  });
  factory BatchPolicy.fromJson(Map<String, dynamic> json) =>
      _$BatchPolicyFromJson(json);

  Map<String, dynamic> toJson() => _$BatchPolicyToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelDeploymentJobResponse {
  CancelDeploymentJobResponse();
  factory CancelDeploymentJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelDeploymentJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelSimulationJobBatchResponse {
  CancelSimulationJobBatchResponse();
  factory CancelSimulationJobBatchResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelSimulationJobBatchResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelSimulationJobResponse {
  CancelSimulationJobResponse();
  factory CancelSimulationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelSimulationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelWorldExportJobResponse {
  CancelWorldExportJobResponse();
  factory CancelWorldExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CancelWorldExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CancelWorldGenerationJobResponse {
  CancelWorldGenerationJobResponse();
  factory CancelWorldGenerationJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CancelWorldGenerationJobResponseFromJson(json);
}

/// Compute information for the simulation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class Compute {
  /// The simulation unit limit. Your simulation is allocated CPU and memory
  /// proportional to the supplied simulation unit limit. A simulation unit is 1
  /// vcpu and 2GB of memory. You are only billed for the SU utilization you
  /// consume up to the maximim value provided. The default is 15.
  @_s.JsonKey(name: 'simulationUnitLimit')
  final int simulationUnitLimit;

  Compute({
    this.simulationUnitLimit,
  });
  factory Compute.fromJson(Map<String, dynamic> json) =>
      _$ComputeFromJson(json);

  Map<String, dynamic> toJson() => _$ComputeToJson(this);
}

/// Compute information for the simulation job
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ComputeResponse {
  /// The simulation unit limit. Your simulation is allocated CPU and memory
  /// proportional to the supplied simulation unit limit. A simulation unit is 1
  /// vcpu and 2GB of memory. You are only billed for the SU utilization you
  /// consume up to the maximim value provided. The default is 15.
  @_s.JsonKey(name: 'simulationUnitLimit')
  final int simulationUnitLimit;

  ComputeResponse({
    this.simulationUnitLimit,
  });
  factory ComputeResponse.fromJson(Map<String, dynamic> json) =>
      _$ComputeResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the deployment job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The deployment application configuration.
  @_s.JsonKey(name: 'deploymentApplicationConfigs')
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// The deployment configuration.
  @_s.JsonKey(name: 'deploymentConfig')
  final DeploymentConfig deploymentConfig;

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
  @_s.JsonKey(name: 'failureCode')
  final DeploymentJobErrorCode failureCode;

  /// The failure reason of the deployment job if it failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The target fleet for the deployment job.
  @_s.JsonKey(name: 'fleet')
  final String fleet;

  /// The status of the deployment job.
  @_s.JsonKey(name: 'status')
  final DeploymentStatus status;

  /// The list of all tags added to the deployment job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory CreateDeploymentJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateDeploymentJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The name of the fleet.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The list of all tags added to the fleet.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateFleetResponse({
    this.arn,
    this.createdAt,
    this.name,
    this.tags,
  });
  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateFleetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the robot application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The revision id of the robot application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The sources of the robot application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The list of all tags added to the robot application.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The version of the robot application.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateRobotApplicationResponse({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.tags,
    this.version,
  });
  factory CreateRobotApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRobotApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRobotApplicationVersionResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the robot application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The revision id of the robot application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The sources of the robot application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The version of the robot application.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateRobotApplicationVersionResponse({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.version,
  });
  factory CreateRobotApplicationVersionResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateRobotApplicationVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateRobotResponse {
  /// The target architecture of the robot.
  @_s.JsonKey(name: 'architecture')
  final Architecture architecture;

  /// The Amazon Resource Name (ARN) of the robot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the Greengrass group associated with the
  /// robot.
  @_s.JsonKey(name: 'greengrassGroupId')
  final String greengrassGroupId;

  /// The name of the robot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The list of all tags added to the robot.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateRobotResponse({
    this.architecture,
    this.arn,
    this.createdAt,
    this.greengrassGroupId,
    this.name,
    this.tags,
  });
  factory CreateRobotResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateRobotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the simulation application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the simulation application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The rendering engine for the simulation application.
  @_s.JsonKey(name: 'renderingEngine')
  final RenderingEngine renderingEngine;

  /// The revision id of the simulation application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// Information about the robot software suite (ROS distribution).
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  @_s.JsonKey(name: 'simulationSoftwareSuite')
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// The sources of the simulation application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The list of all tags added to the simulation application.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The version of the simulation application.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateSimulationApplicationResponse({
    this.arn,
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
          Map<String, dynamic> json) =>
      _$CreateSimulationApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSimulationApplicationVersionResponse {
  /// The Amazon Resource Name (ARN) of the simulation application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the simulation application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The rendering engine for the simulation application.
  @_s.JsonKey(name: 'renderingEngine')
  final RenderingEngine renderingEngine;

  /// The revision ID of the simulation application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// Information about the robot software suite (ROS distribution).
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  @_s.JsonKey(name: 'simulationSoftwareSuite')
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// The sources of the simulation application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The version of the simulation application.
  @_s.JsonKey(name: 'version')
  final String version;

  CreateSimulationApplicationVersionResponse({
    this.arn,
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
          Map<String, dynamic> json) =>
      _$CreateSimulationApplicationVersionResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateSimulationJobResponse {
  /// The Amazon Resource Name (ARN) of the simulation job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// Compute information for the simulation job.
  @_s.JsonKey(name: 'compute')
  final ComputeResponse compute;

  /// The data sources for the simulation job.
  @_s.JsonKey(name: 'dataSources')
  final List<DataSource> dataSources;

  /// the failure behavior for the simulation job.
  @_s.JsonKey(name: 'failureBehavior')
  final FailureBehavior failureBehavior;

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
  @_s.JsonKey(name: 'failureCode')
  final SimulationJobErrorCode failureCode;

  /// The IAM role that allows the simulation job to call the AWS APIs that are
  /// specified in its associated policies on your behalf.
  @_s.JsonKey(name: 'iamRole')
  final String iamRole;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStartedAt')
  final DateTime lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The logging configuration.
  @_s.JsonKey(name: 'loggingConfig')
  final LoggingConfig loggingConfig;

  /// The maximum simulation job duration in seconds.
  @_s.JsonKey(name: 'maxJobDurationInSeconds')
  final int maxJobDurationInSeconds;

  /// Simulation job output files location.
  @_s.JsonKey(name: 'outputLocation')
  final OutputLocation outputLocation;

  /// The robot application used by the simulation job.
  @_s.JsonKey(name: 'robotApplications')
  final List<RobotApplicationConfig> robotApplications;

  /// The simulation application used by the simulation job.
  @_s.JsonKey(name: 'simulationApplications')
  final List<SimulationApplicationConfig> simulationApplications;

  /// The simulation job execution duration in milliseconds.
  @_s.JsonKey(name: 'simulationTimeMillis')
  final int simulationTimeMillis;

  /// The status of the simulation job.
  @_s.JsonKey(name: 'status')
  final SimulationJobStatus status;

  /// The list of all tags added to the simulation job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Information about the vpc configuration.
  @_s.JsonKey(name: 'vpcConfig')
  final VPCConfigResponse vpcConfig;

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
  factory CreateSimulationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateSimulationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorldExportJobResponse {
  /// The Amazon Resource Name (ARN) of the world export job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world export job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

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
  @_s.JsonKey(name: 'failureCode')
  final WorldExportJobErrorCode failureCode;

  /// The IAM role that the world export process uses to access the Amazon S3
  /// bucket and put the export.
  @_s.JsonKey(name: 'iamRole')
  final String iamRole;
  @_s.JsonKey(name: 'outputLocation')
  final OutputLocation outputLocation;

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
  @_s.JsonKey(name: 'status')
  final WorldExportJobStatus status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// export job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory CreateWorldExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWorldExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorldGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the world generator job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world generator job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

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
  @_s.JsonKey(name: 'failureCode')
  final WorldGenerationJobErrorCode failureCode;

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
  @_s.JsonKey(name: 'status')
  final WorldGenerationJobStatus status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// generator job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The Amazon Resource Name (arn) of the world template.
  @_s.JsonKey(name: 'template')
  final String template;

  /// Information about the world count.
  @_s.JsonKey(name: 'worldCount')
  final WorldCount worldCount;

  /// A map that contains tag keys and tag values that are attached to the
  /// generated worlds.
  @_s.JsonKey(name: 'worldTags')
  final Map<String, String> worldTags;

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
  factory CreateWorldGenerationJobResponse.fromJson(
          Map<String, dynamic> json) =>
      _$CreateWorldGenerationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class CreateWorldTemplateResponse {
  /// The Amazon Resource Name (ARN) of the world template.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world template was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The name of the world template.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A map that contains tag keys and tag values that are attached to the world
  /// template.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  CreateWorldTemplateResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.name,
    this.tags,
  });
  factory CreateWorldTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$CreateWorldTemplateResponseFromJson(json);
}

/// Information about a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DataSource {
  /// The name of the data source.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The S3 bucket where the data files are located.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  @_s.JsonKey(name: 's3Keys')
  final List<S3KeyOutput> s3Keys;

  DataSource({
    this.name,
    this.s3Bucket,
    this.s3Keys,
  });
  factory DataSource.fromJson(Map<String, dynamic> json) =>
      _$DataSourceFromJson(json);
}

/// Information about a data source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DataSourceConfig {
  /// The name of the data source.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The S3 bucket where the data files are located.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  @_s.JsonKey(name: 's3Keys')
  final List<String> s3Keys;

  DataSourceConfig({
    @_s.required this.name,
    @_s.required this.s3Bucket,
    @_s.required this.s3Keys,
  });
  factory DataSourceConfig.fromJson(Map<String, dynamic> json) =>
      _$DataSourceConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DataSourceConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteFleetResponse {
  DeleteFleetResponse();
  factory DeleteFleetResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteFleetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRobotApplicationResponse {
  DeleteRobotApplicationResponse();
  factory DeleteRobotApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRobotApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteRobotResponse {
  DeleteRobotResponse();
  factory DeleteRobotResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteRobotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteSimulationApplicationResponse {
  DeleteSimulationApplicationResponse();
  factory DeleteSimulationApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DeleteSimulationApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeleteWorldTemplateResponse {
  DeleteWorldTemplateResponse();
  factory DeleteWorldTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteWorldTemplateResponseFromJson(json);
}

/// Information about a deployment application configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentApplicationConfig {
  /// The Amazon Resource Name (ARN) of the robot application.
  @_s.JsonKey(name: 'application')
  final String application;

  /// The version of the application.
  @_s.JsonKey(name: 'applicationVersion')
  final String applicationVersion;

  /// The launch configuration.
  @_s.JsonKey(name: 'launchConfig')
  final DeploymentLaunchConfig launchConfig;

  DeploymentApplicationConfig({
    @_s.required this.application,
    @_s.required this.applicationVersion,
    @_s.required this.launchConfig,
  });
  factory DeploymentApplicationConfig.fromJson(Map<String, dynamic> json) =>
      _$DeploymentApplicationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentApplicationConfigToJson(this);
}

/// Information about a deployment configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentConfig {
  /// The percentage of robots receiving the deployment at the same time.
  @_s.JsonKey(name: 'concurrentDeploymentPercentage')
  final int concurrentDeploymentPercentage;

  /// The download condition file.
  @_s.JsonKey(name: 'downloadConditionFile')
  final S3Object downloadConditionFile;

  /// The percentage of deployments that need to fail before stopping deployment.
  @_s.JsonKey(name: 'failureThresholdPercentage')
  final int failureThresholdPercentage;

  /// The amount of time, in seconds, to wait for deployment to a single robot to
  /// complete. Choose a time between 1 minute and 7 days. The default is 5 hours.
  @_s.JsonKey(name: 'robotDeploymentTimeoutInSeconds')
  final int robotDeploymentTimeoutInSeconds;

  DeploymentConfig({
    this.concurrentDeploymentPercentage,
    this.downloadConditionFile,
    this.failureThresholdPercentage,
    this.robotDeploymentTimeoutInSeconds,
  });
  factory DeploymentConfig.fromJson(Map<String, dynamic> json) =>
      _$DeploymentConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentConfigToJson(this);
}

/// Information about a deployment job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeploymentJob {
  /// The Amazon Resource Name (ARN) of the deployment job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the deployment job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The deployment application configuration.
  @_s.JsonKey(name: 'deploymentApplicationConfigs')
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// The deployment configuration.
  @_s.JsonKey(name: 'deploymentConfig')
  final DeploymentConfig deploymentConfig;

  /// The deployment job failure code.
  @_s.JsonKey(name: 'failureCode')
  final DeploymentJobErrorCode failureCode;

  /// A short description of the reason why the deployment job failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'fleet')
  final String fleet;

  /// The status of the deployment job.
  @_s.JsonKey(name: 'status')
  final DeploymentStatus status;

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
  factory DeploymentJob.fromJson(Map<String, dynamic> json) =>
      _$DeploymentJobFromJson(json);
}

enum DeploymentJobErrorCode {
  @_s.JsonValue('ResourceNotFound')
  resourceNotFound,
  @_s.JsonValue('EnvironmentSetupError')
  environmentSetupError,
  @_s.JsonValue('EtagMismatch')
  etagMismatch,
  @_s.JsonValue('FailureThresholdBreached')
  failureThresholdBreached,
  @_s.JsonValue('RobotDeploymentAborted')
  robotDeploymentAborted,
  @_s.JsonValue('RobotDeploymentNoResponse')
  robotDeploymentNoResponse,
  @_s.JsonValue('RobotAgentConnectionTimeout')
  robotAgentConnectionTimeout,
  @_s.JsonValue('GreengrassDeploymentFailed')
  greengrassDeploymentFailed,
  @_s.JsonValue('InvalidGreengrassGroup')
  invalidGreengrassGroup,
  @_s.JsonValue('MissingRobotArchitecture')
  missingRobotArchitecture,
  @_s.JsonValue('MissingRobotApplicationArchitecture')
  missingRobotApplicationArchitecture,
  @_s.JsonValue('MissingRobotDeploymentResource')
  missingRobotDeploymentResource,
  @_s.JsonValue('GreengrassGroupVersionDoesNotExist')
  greengrassGroupVersionDoesNotExist,
  @_s.JsonValue('LambdaDeleted')
  lambdaDeleted,
  @_s.JsonValue('ExtractingBundleFailure')
  extractingBundleFailure,
  @_s.JsonValue('PreLaunchFileFailure')
  preLaunchFileFailure,
  @_s.JsonValue('PostLaunchFileFailure')
  postLaunchFileFailure,
  @_s.JsonValue('BadPermissionError')
  badPermissionError,
  @_s.JsonValue('DownloadConditionFailed')
  downloadConditionFailed,
  @_s.JsonValue('InternalServerError')
  internalServerError,
}

/// Configuration information for a deployment launch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class DeploymentLaunchConfig {
  /// The launch file name.
  @_s.JsonKey(name: 'launchFile')
  final String launchFile;

  /// The package name.
  @_s.JsonKey(name: 'packageName')
  final String packageName;

  /// An array of key/value pairs specifying environment variables for the robot
  /// application
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// The deployment post-launch file. This file will be executed after the launch
  /// file.
  @_s.JsonKey(name: 'postLaunchFile')
  final String postLaunchFile;

  /// The deployment pre-launch file. This file will be executed prior to the
  /// launch file.
  @_s.JsonKey(name: 'preLaunchFile')
  final String preLaunchFile;

  DeploymentLaunchConfig({
    @_s.required this.launchFile,
    @_s.required this.packageName,
    this.environmentVariables,
    this.postLaunchFile,
    this.preLaunchFile,
  });
  factory DeploymentLaunchConfig.fromJson(Map<String, dynamic> json) =>
      _$DeploymentLaunchConfigFromJson(json);

  Map<String, dynamic> toJson() => _$DeploymentLaunchConfigToJson(this);
}

enum DeploymentStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Preparing')
  preparing,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Succeeded')
  succeeded,
  @_s.JsonValue('Canceled')
  canceled,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DeregisterRobotResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'fleet')
  final String fleet;

  /// The Amazon Resource Name (ARN) of the robot.
  @_s.JsonKey(name: 'robot')
  final String robot;

  DeregisterRobotResponse({
    this.fleet,
    this.robot,
  });
  factory DeregisterRobotResponse.fromJson(Map<String, dynamic> json) =>
      _$DeregisterRobotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the deployment job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the deployment job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The deployment application configuration.
  @_s.JsonKey(name: 'deploymentApplicationConfigs')
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// The deployment configuration.
  @_s.JsonKey(name: 'deploymentConfig')
  final DeploymentConfig deploymentConfig;

  /// The deployment job failure code.
  @_s.JsonKey(name: 'failureCode')
  final DeploymentJobErrorCode failureCode;

  /// A short description of the reason why the deployment job failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'fleet')
  final String fleet;

  /// A list of robot deployment summaries.
  @_s.JsonKey(name: 'robotDeploymentSummary')
  final List<RobotDeployment> robotDeploymentSummary;

  /// The status of the deployment job.
  @_s.JsonKey(name: 'status')
  final DeploymentStatus status;

  /// The list of all tags added to the specified deployment job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory DescribeDeploymentJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeDeploymentJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeFleetResponse {
  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  @_s.JsonKey(name: 'lastDeploymentJob')
  final String lastDeploymentJob;

  /// The status of the last deployment.
  @_s.JsonKey(name: 'lastDeploymentStatus')
  final DeploymentStatus lastDeploymentStatus;

  /// The time of the last deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastDeploymentTime')
  final DateTime lastDeploymentTime;

  /// The name of the fleet.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of robots.
  @_s.JsonKey(name: 'robots')
  final List<Robot> robots;

  /// The list of all tags added to the specified fleet.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory DescribeFleetResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeFleetResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the robot application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The revision id of the robot application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The sources of the robot application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The list of all tags added to the specified robot application.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The version of the robot application.
  @_s.JsonKey(name: 'version')
  final String version;

  DescribeRobotApplicationResponse({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.tags,
    this.version,
  });
  factory DescribeRobotApplicationResponse.fromJson(
          Map<String, dynamic> json) =>
      _$DescribeRobotApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeRobotResponse {
  /// The target architecture of the robot application.
  @_s.JsonKey(name: 'architecture')
  final Architecture architecture;

  /// The Amazon Resource Name (ARN) of the robot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'fleetArn')
  final String fleetArn;

  /// The Greengrass group id.
  @_s.JsonKey(name: 'greengrassGroupId')
  final String greengrassGroupId;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  @_s.JsonKey(name: 'lastDeploymentJob')
  final String lastDeploymentJob;

  /// The time of the last deployment job.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastDeploymentTime')
  final DateTime lastDeploymentTime;

  /// The name of the robot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the fleet.
  @_s.JsonKey(name: 'status')
  final RobotStatus status;

  /// The list of all tags added to the specified robot.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory DescribeRobotResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeRobotResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the robot simulation application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the simulation application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The rendering engine for the simulation application.
  @_s.JsonKey(name: 'renderingEngine')
  final RenderingEngine renderingEngine;

  /// The revision id of the simulation application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// Information about the robot software suite (ROS distribution).
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  @_s.JsonKey(name: 'simulationSoftwareSuite')
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// The sources of the simulation application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The list of all tags added to the specified simulation application.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The version of the simulation application.
  @_s.JsonKey(name: 'version')
  final String version;

  DescribeSimulationApplicationResponse({
    this.arn,
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
          Map<String, dynamic> json) =>
      _$DescribeSimulationApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSimulationJobBatchResponse {
  /// The Amazon Resource Name (ARN) of the batch.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The batch policy.
  @_s.JsonKey(name: 'batchPolicy')
  final BatchPolicy batchPolicy;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A list of created simulation job summaries.
  @_s.JsonKey(name: 'createdRequests')
  final List<SimulationJobSummary> createdRequests;

  /// A list of failed create simulation job requests. The request failed to be
  /// created into a simulation job. Failed requests do not have a simulation job
  /// ID.
  @_s.JsonKey(name: 'failedRequests')
  final List<FailedCreateSimulationJobRequest> failedRequests;

  /// The failure code of the simulation job batch.
  @_s.JsonKey(name: 'failureCode')
  final SimulationJobBatchErrorCode failureCode;

  /// The reason the simulation job batch failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// A list of pending simulation job requests. These requests have not yet been
  /// created into simulation jobs.
  @_s.JsonKey(name: 'pendingRequests')
  final List<SimulationJobRequest> pendingRequests;

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
  @_s.JsonKey(name: 'status')
  final SimulationJobBatchStatus status;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job batch.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
          Map<String, dynamic> json) =>
      _$DescribeSimulationJobBatchResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeSimulationJobResponse {
  /// The Amazon Resource Name (ARN) of the simulation job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// Compute information for the simulation job.
  @_s.JsonKey(name: 'compute')
  final ComputeResponse compute;

  /// The data sources for the simulation job.
  @_s.JsonKey(name: 'dataSources')
  final List<DataSource> dataSources;

  /// The failure behavior for the simulation job.
  @_s.JsonKey(name: 'failureBehavior')
  final FailureBehavior failureBehavior;

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
  @_s.JsonKey(name: 'failureCode')
  final SimulationJobErrorCode failureCode;

  /// Details about why the simulation job failed. For more information about
  /// troubleshooting, see <a
  /// href="https://docs.aws.amazon.com/robomaker/latest/dg/troubleshooting.html">Troubleshooting</a>.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The IAM role that allows the simulation instance to call the AWS APIs that
  /// are specified in its associated policies on your behalf.
  @_s.JsonKey(name: 'iamRole')
  final String iamRole;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStartedAt')
  final DateTime lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The logging configuration.
  @_s.JsonKey(name: 'loggingConfig')
  final LoggingConfig loggingConfig;

  /// The maximum job duration in seconds. The value must be 8 days (691,200
  /// seconds) or less.
  @_s.JsonKey(name: 'maxJobDurationInSeconds')
  final int maxJobDurationInSeconds;

  /// The name of the simulation job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The network interface information for the simulation job.
  @_s.JsonKey(name: 'networkInterface')
  final NetworkInterface networkInterface;

  /// Location for output files generated by the simulation job.
  @_s.JsonKey(name: 'outputLocation')
  final OutputLocation outputLocation;

  /// A list of robot applications.
  @_s.JsonKey(name: 'robotApplications')
  final List<RobotApplicationConfig> robotApplications;

  /// A list of simulation applications.
  @_s.JsonKey(name: 'simulationApplications')
  final List<SimulationApplicationConfig> simulationApplications;

  /// The simulation job execution duration in milliseconds.
  @_s.JsonKey(name: 'simulationTimeMillis')
  final int simulationTimeMillis;

  /// The status of the simulation job.
  @_s.JsonKey(name: 'status')
  final SimulationJobStatus status;

  /// The list of all tags added to the specified simulation job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The VPC configuration.
  @_s.JsonKey(name: 'vpcConfig')
  final VPCConfigResponse vpcConfig;

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
  factory DescribeSimulationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeSimulationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorldExportJobResponse {
  /// The Amazon Resource Name (ARN) of the world export job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world export job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

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
  @_s.JsonKey(name: 'failureCode')
  final WorldExportJobErrorCode failureCode;

  /// The reason why the world export job failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The IAM role that the world export process uses to access the Amazon S3
  /// bucket and put the export.
  @_s.JsonKey(name: 'iamRole')
  final String iamRole;
  @_s.JsonKey(name: 'outputLocation')
  final OutputLocation outputLocation;

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
  @_s.JsonKey(name: 'status')
  final WorldExportJobStatus status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// export job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// A list of Amazon Resource Names (arns) that correspond to worlds to be
  /// exported.
  @_s.JsonKey(name: 'worlds')
  final List<String> worlds;

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
  factory DescribeWorldExportJobResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorldExportJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorldGenerationJobResponse {
  /// The Amazon Resource Name (ARN) of the world generation job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world generation job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

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
  @_s.JsonKey(name: 'failureCode')
  final WorldGenerationJobErrorCode failureCode;

  /// The reason why the world generation job failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// Summary information about finished worlds.
  @_s.JsonKey(name: 'finishedWorldsSummary')
  final FinishedWorldsSummary finishedWorldsSummary;

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
  @_s.JsonKey(name: 'status')
  final WorldGenerationJobStatus status;

  /// A map that contains tag keys and tag values that are attached to the world
  /// generation job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The Amazon Resource Name (arn) of the world template.
  @_s.JsonKey(name: 'template')
  final String template;

  /// Information about the world count.
  @_s.JsonKey(name: 'worldCount')
  final WorldCount worldCount;

  /// A map that contains tag keys and tag values that are attached to the
  /// generated worlds.
  @_s.JsonKey(name: 'worldTags')
  final Map<String, String> worldTags;

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
          Map<String, dynamic> json) =>
      _$DescribeWorldGenerationJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorldResponse {
  /// The Amazon Resource Name (arn) of the world.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the world was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (arn) of the world generation job that generated
  /// the world.
  @_s.JsonKey(name: 'generationJob')
  final String generationJob;

  /// A map that contains tag keys and tag values that are attached to the world.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// The world template.
  @_s.JsonKey(name: 'template')
  final String template;

  DescribeWorldResponse({
    this.arn,
    this.createdAt,
    this.generationJob,
    this.tags,
    this.template,
  });
  factory DescribeWorldResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorldResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class DescribeWorldTemplateResponse {
  /// The Amazon Resource Name (ARN) of the world template.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the world template was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The time, in milliseconds since the epoch, when the world template was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the world template.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A map that contains tag keys and tag values that are attached to the world
  /// template.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  DescribeWorldTemplateResponse({
    this.arn,
    this.clientRequestToken,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
    this.tags,
  });
  factory DescribeWorldTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$DescribeWorldTemplateResponseFromJson(json);
}

/// Information about a failed create simulation job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailedCreateSimulationJobRequest {
  /// The time, in milliseconds since the epoch, when the simulation job batch
  /// failed.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'failedAt')
  final DateTime failedAt;

  /// The failure code.
  @_s.JsonKey(name: 'failureCode')
  final SimulationJobErrorCode failureCode;

  /// The failure reason of the simulation job request.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The simulation job request.
  @_s.JsonKey(name: 'request')
  final SimulationJobRequest request;

  FailedCreateSimulationJobRequest({
    this.failedAt,
    this.failureCode,
    this.failureReason,
    this.request,
  });
  factory FailedCreateSimulationJobRequest.fromJson(
          Map<String, dynamic> json) =>
      _$FailedCreateSimulationJobRequestFromJson(json);
}

enum FailureBehavior {
  @_s.JsonValue('Fail')
  fail,
  @_s.JsonValue('Continue')
  $continue,
}

extension on FailureBehavior {
  String toValue() {
    switch (this) {
      case FailureBehavior.fail:
        return 'Fail';
      case FailureBehavior.$continue:
        return 'Continue';
    }
    throw Exception('Unknown enum value: $this');
  }
}

/// Information about worlds that failed.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FailureSummary {
  /// The worlds that failed.
  @_s.JsonKey(name: 'failures')
  final List<WorldFailure> failures;

  /// The total number of failures.
  @_s.JsonKey(name: 'totalFailureCount')
  final int totalFailureCount;

  FailureSummary({
    this.failures,
    this.totalFailureCount,
  });
  factory FailureSummary.fromJson(Map<String, dynamic> json) =>
      _$FailureSummaryFromJson(json);
}

/// Information about a filter.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class Filter {
  /// The name of the filter.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of values.
  @_s.JsonKey(name: 'values')
  final List<String> values;

  Filter({
    this.name,
    this.values,
  });
  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

/// Information about worlds that finished.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class FinishedWorldsSummary {
  /// Information about worlds that failed.
  @_s.JsonKey(name: 'failureSummary')
  final FailureSummary failureSummary;

  /// The total number of finished worlds.
  @_s.JsonKey(name: 'finishedCount')
  final int finishedCount;

  /// A list of worlds that succeeded.
  @_s.JsonKey(name: 'succeededWorlds')
  final List<String> succeededWorlds;

  FinishedWorldsSummary({
    this.failureSummary,
    this.finishedCount,
    this.succeededWorlds,
  });
  factory FinishedWorldsSummary.fromJson(Map<String, dynamic> json) =>
      _$FinishedWorldsSummaryFromJson(json);
}

/// Information about a fleet.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Fleet {
  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  @_s.JsonKey(name: 'lastDeploymentJob')
  final String lastDeploymentJob;

  /// The status of the last fleet deployment.
  @_s.JsonKey(name: 'lastDeploymentStatus')
  final DeploymentStatus lastDeploymentStatus;

  /// The time of the last deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastDeploymentTime')
  final DateTime lastDeploymentTime;

  /// The name of the fleet.
  @_s.JsonKey(name: 'name')
  final String name;

  Fleet({
    this.arn,
    this.createdAt,
    this.lastDeploymentJob,
    this.lastDeploymentStatus,
    this.lastDeploymentTime,
    this.name,
  });
  factory Fleet.fromJson(Map<String, dynamic> json) => _$FleetFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class GetWorldTemplateBodyResponse {
  /// The world template body.
  @_s.JsonKey(name: 'templateBody')
  final String templateBody;

  GetWorldTemplateBodyResponse({
    this.templateBody,
  });
  factory GetWorldTemplateBodyResponse.fromJson(Map<String, dynamic> json) =>
      _$GetWorldTemplateBodyResponseFromJson(json);
}

/// Information about a launch configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LaunchConfig {
  /// The launch file name.
  @_s.JsonKey(name: 'launchFile')
  final String launchFile;

  /// The package name.
  @_s.JsonKey(name: 'packageName')
  final String packageName;

  /// The environment variables for the application launch.
  @_s.JsonKey(name: 'environmentVariables')
  final Map<String, String> environmentVariables;

  /// The port forwarding configuration.
  @_s.JsonKey(name: 'portForwardingConfig')
  final PortForwardingConfig portForwardingConfig;

  /// Boolean indicating whether a streaming session will be configured for the
  /// application. If <code>True</code>, AWS RoboMaker will configure a connection
  /// so you can interact with your application as it is running in the
  /// simulation. You must configure and luanch the component. It must have a
  /// graphical user interface.
  @_s.JsonKey(name: 'streamUI')
  final bool streamUI;

  LaunchConfig({
    @_s.required this.launchFile,
    @_s.required this.packageName,
    this.environmentVariables,
    this.portForwardingConfig,
    this.streamUI,
  });
  factory LaunchConfig.fromJson(Map<String, dynamic> json) =>
      _$LaunchConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LaunchConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListDeploymentJobsResponse {
  /// A list of deployment jobs that meet the criteria of the request.
  @_s.JsonKey(name: 'deploymentJobs')
  final List<DeploymentJob> deploymentJobs;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListDeploymentJobs</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListDeploymentJobsResponse({
    this.deploymentJobs,
    this.nextToken,
  });
  factory ListDeploymentJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListDeploymentJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListFleetsResponse {
  /// A list of fleet details meeting the request criteria.
  @_s.JsonKey(name: 'fleetDetails')
  final List<Fleet> fleetDetails;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListFleets</code> again and assign that token to the request object's
  /// <code>nextToken</code> parameter. If there are no remaining results, the
  /// previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListFleetsResponse({
    this.fleetDetails,
    this.nextToken,
  });
  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListFleetsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRobotApplicationsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListRobotApplications</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of robot application summaries that meet the criteria of the request.
  @_s.JsonKey(name: 'robotApplicationSummaries')
  final List<RobotApplicationSummary> robotApplicationSummaries;

  ListRobotApplicationsResponse({
    this.nextToken,
    this.robotApplicationSummaries,
  });
  factory ListRobotApplicationsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRobotApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListRobotsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListRobots</code> again and assign that token to the request object's
  /// <code>nextToken</code> parameter. If there are no remaining results, the
  /// previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of robots that meet the criteria of the request.
  @_s.JsonKey(name: 'robots')
  final List<Robot> robots;

  ListRobotsResponse({
    this.nextToken,
    this.robots,
  });
  factory ListRobotsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListRobotsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSimulationApplicationsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListSimulationApplications</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of simulation application summaries that meet the criteria of the
  /// request.
  @_s.JsonKey(name: 'simulationApplicationSummaries')
  final List<SimulationApplicationSummary> simulationApplicationSummaries;

  ListSimulationApplicationsResponse({
    this.nextToken,
    this.simulationApplicationSummaries,
  });
  factory ListSimulationApplicationsResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSimulationApplicationsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSimulationJobBatchesResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListSimulationJobBatches</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// A list of simulation job batch summaries.
  @_s.JsonKey(name: 'simulationJobBatchSummaries')
  final List<SimulationJobBatchSummary> simulationJobBatchSummaries;

  ListSimulationJobBatchesResponse({
    this.nextToken,
    this.simulationJobBatchSummaries,
  });
  factory ListSimulationJobBatchesResponse.fromJson(
          Map<String, dynamic> json) =>
      _$ListSimulationJobBatchesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListSimulationJobsResponse {
  /// A list of simulation job summaries that meet the criteria of the request.
  @_s.JsonKey(name: 'simulationJobSummaries')
  final List<SimulationJobSummary> simulationJobSummaries;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListSimulationJobs</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListSimulationJobsResponse({
    @_s.required this.simulationJobSummaries,
    this.nextToken,
  });
  factory ListSimulationJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListSimulationJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListTagsForResourceResponse {
  /// The list of all tags added to the specified resource.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  ListTagsForResourceResponse({
    this.tags,
  });
  factory ListTagsForResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$ListTagsForResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorldExportJobsResponse {
  /// Summary information for world export jobs.
  @_s.JsonKey(name: 'worldExportJobSummaries')
  final List<WorldExportJobSummary> worldExportJobSummaries;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorldExportJobsRequest</code> again and assign that token to the
  /// request object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListWorldExportJobsResponse({
    @_s.required this.worldExportJobSummaries,
    this.nextToken,
  });
  factory ListWorldExportJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorldExportJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorldGenerationJobsResponse {
  /// Summary information for world generator jobs.
  @_s.JsonKey(name: 'worldGenerationJobSummaries')
  final List<WorldGenerationJobSummary> worldGenerationJobSummaries;

  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorldGeneratorJobsRequest</code> again and assign that token to
  /// the request object's <code>nextToken</code> parameter. If there are no
  /// remaining results, the previous response object's NextToken parameter is set
  /// to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  ListWorldGenerationJobsResponse({
    @_s.required this.worldGenerationJobSummaries,
    this.nextToken,
  });
  factory ListWorldGenerationJobsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorldGenerationJobsResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorldTemplatesResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorldTemplates</code> again and assign that token to the request
  /// object's <code>nextToken</code> parameter. If there are no remaining
  /// results, the previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Summary information for templates.
  @_s.JsonKey(name: 'templateSummaries')
  final List<TemplateSummary> templateSummaries;

  ListWorldTemplatesResponse({
    this.nextToken,
    this.templateSummaries,
  });
  factory ListWorldTemplatesResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorldTemplatesResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class ListWorldsResponse {
  /// If the previous paginated request did not return all of the remaining
  /// results, the response object's <code>nextToken</code> parameter value is set
  /// to a token. To retrieve the next set of results, call
  /// <code>ListWorlds</code> again and assign that token to the request object's
  /// <code>nextToken</code> parameter. If there are no remaining results, the
  /// previous response object's NextToken parameter is set to null.
  @_s.JsonKey(name: 'nextToken')
  final String nextToken;

  /// Summary information for worlds.
  @_s.JsonKey(name: 'worldSummaries')
  final List<WorldSummary> worldSummaries;

  ListWorldsResponse({
    this.nextToken,
    this.worldSummaries,
  });
  factory ListWorldsResponse.fromJson(Map<String, dynamic> json) =>
      _$ListWorldsResponseFromJson(json);
}

/// The logging configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class LoggingConfig {
  /// A boolean indicating whether to record all ROS topics.
  @_s.JsonKey(name: 'recordAllRosTopics')
  final bool recordAllRosTopics;

  LoggingConfig({
    @_s.required this.recordAllRosTopics,
  });
  factory LoggingConfig.fromJson(Map<String, dynamic> json) =>
      _$LoggingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$LoggingConfigToJson(this);
}

/// Describes a network interface.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class NetworkInterface {
  /// The ID of the network interface.
  @_s.JsonKey(name: 'networkInterfaceId')
  final String networkInterfaceId;

  /// The IPv4 address of the network interface within the subnet.
  @_s.JsonKey(name: 'privateIpAddress')
  final String privateIpAddress;

  /// The IPv4 public address of the network interface.
  @_s.JsonKey(name: 'publicIpAddress')
  final String publicIpAddress;

  NetworkInterface({
    this.networkInterfaceId,
    this.privateIpAddress,
    this.publicIpAddress,
  });
  factory NetworkInterface.fromJson(Map<String, dynamic> json) =>
      _$NetworkInterfaceFromJson(json);
}

/// The output location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class OutputLocation {
  /// The S3 bucket for output.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// The S3 folder in the <code>s3Bucket</code> where output files will be
  /// placed.
  @_s.JsonKey(name: 's3Prefix')
  final String s3Prefix;

  OutputLocation({
    this.s3Bucket,
    this.s3Prefix,
  });
  factory OutputLocation.fromJson(Map<String, dynamic> json) =>
      _$OutputLocationFromJson(json);

  Map<String, dynamic> toJson() => _$OutputLocationToJson(this);
}

/// Configuration information for port forwarding.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortForwardingConfig {
  /// The port mappings for the configuration.
  @_s.JsonKey(name: 'portMappings')
  final List<PortMapping> portMappings;

  PortForwardingConfig({
    this.portMappings,
  });
  factory PortForwardingConfig.fromJson(Map<String, dynamic> json) =>
      _$PortForwardingConfigFromJson(json);

  Map<String, dynamic> toJson() => _$PortForwardingConfigToJson(this);
}

/// An object representing a port mapping.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class PortMapping {
  /// The port number on the application.
  @_s.JsonKey(name: 'applicationPort')
  final int applicationPort;

  /// The port number on the simulation job instance to use as a remote connection
  /// point.
  @_s.JsonKey(name: 'jobPort')
  final int jobPort;

  /// A Boolean indicating whether to enable this port mapping on public IP.
  @_s.JsonKey(name: 'enableOnPublicIp')
  final bool enableOnPublicIp;

  PortMapping({
    @_s.required this.applicationPort,
    @_s.required this.jobPort,
    this.enableOnPublicIp,
  });
  factory PortMapping.fromJson(Map<String, dynamic> json) =>
      _$PortMappingFromJson(json);

  Map<String, dynamic> toJson() => _$PortMappingToJson(this);
}

/// Information about the progress of a deployment job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'currentProgress')
  final RobotDeploymentStep currentProgress;

  /// Estimated amount of time in seconds remaining in the step. This currently
  /// only applies to the <code>Downloading/Extracting</code> step of the
  /// deployment. It is empty for other steps.
  @_s.JsonKey(name: 'estimatedTimeRemainingSeconds')
  final int estimatedTimeRemainingSeconds;

  /// Precentage of the step that is done. This currently only applies to the
  /// <code>Downloading/Extracting</code> step of the deployment. It is empty for
  /// other steps.
  @_s.JsonKey(name: 'percentDone')
  final double percentDone;

  /// The Amazon Resource Name (ARN) of the deployment job.
  @_s.JsonKey(name: 'targetResource')
  final String targetResource;

  ProgressDetail({
    this.currentProgress,
    this.estimatedTimeRemainingSeconds,
    this.percentDone,
    this.targetResource,
  });
  factory ProgressDetail.fromJson(Map<String, dynamic> json) =>
      _$ProgressDetailFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RegisterRobotResponse {
  /// The Amazon Resource Name (ARN) of the fleet that the robot will join.
  @_s.JsonKey(name: 'fleet')
  final String fleet;

  /// Information about the robot registration.
  @_s.JsonKey(name: 'robot')
  final String robot;

  RegisterRobotResponse({
    this.fleet,
    this.robot,
  });
  factory RegisterRobotResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterRobotResponseFromJson(json);
}

/// Information about a rendering engine.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RenderingEngine {
  /// The name of the rendering engine.
  @_s.JsonKey(name: 'name')
  final RenderingEngineType name;

  /// The version of the rendering engine.
  @_s.JsonKey(name: 'version')
  final String version;

  RenderingEngine({
    this.name,
    this.version,
  });
  factory RenderingEngine.fromJson(Map<String, dynamic> json) =>
      _$RenderingEngineFromJson(json);

  Map<String, dynamic> toJson() => _$RenderingEngineToJson(this);
}

enum RenderingEngineType {
  @_s.JsonValue('OGRE')
  ogre,
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RestartSimulationJobResponse {
  RestartSimulationJobResponse();
  factory RestartSimulationJobResponse.fromJson(Map<String, dynamic> json) =>
      _$RestartSimulationJobResponseFromJson(json);
}

/// Information about a robot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Robot {
  /// The architecture of the robot.
  @_s.JsonKey(name: 'architecture')
  final Architecture architecture;

  /// The Amazon Resource Name (ARN) of the robot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'fleetArn')
  final String fleetArn;

  /// The Greengrass group associated with the robot.
  @_s.JsonKey(name: 'greenGrassGroupId')
  final String greenGrassGroupId;

  /// The Amazon Resource Name (ARN) of the last deployment job.
  @_s.JsonKey(name: 'lastDeploymentJob')
  final String lastDeploymentJob;

  /// The time of the last deployment.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastDeploymentTime')
  final DateTime lastDeploymentTime;

  /// The name of the robot.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The status of the robot.
  @_s.JsonKey(name: 'status')
  final RobotStatus status;

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
  factory Robot.fromJson(Map<String, dynamic> json) => _$RobotFromJson(json);
}

/// Application configuration information for a robot.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RobotApplicationConfig {
  /// The application information for the robot application.
  @_s.JsonKey(name: 'application')
  final String application;

  /// The launch configuration for the robot application.
  @_s.JsonKey(name: 'launchConfig')
  final LaunchConfig launchConfig;

  /// The version of the robot application.
  @_s.JsonKey(name: 'applicationVersion')
  final String applicationVersion;

  RobotApplicationConfig({
    @_s.required this.application,
    @_s.required this.launchConfig,
    this.applicationVersion,
  });
  factory RobotApplicationConfig.fromJson(Map<String, dynamic> json) =>
      _$RobotApplicationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$RobotApplicationConfigToJson(this);
}

/// Summary information for a robot application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RobotApplicationSummary {
  /// The Amazon Resource Name (ARN) of the robot.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the robot application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Information about a robot software suite (ROS distribution).
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The version of the robot application.
  @_s.JsonKey(name: 'version')
  final String version;

  RobotApplicationSummary({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.robotSoftwareSuite,
    this.version,
  });
  factory RobotApplicationSummary.fromJson(Map<String, dynamic> json) =>
      _$RobotApplicationSummaryFromJson(json);
}

/// Information about a robot deployment.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class RobotDeployment {
  /// The robot deployment Amazon Resource Name (ARN).
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the deployment finished.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'deploymentFinishTime')
  final DateTime deploymentFinishTime;

  /// The time, in milliseconds since the epoch, when the deployment was started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'deploymentStartTime')
  final DateTime deploymentStartTime;

  /// The robot deployment failure code.
  @_s.JsonKey(name: 'failureCode')
  final DeploymentJobErrorCode failureCode;

  /// A short description of the reason why the robot deployment failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// Information about how the deployment is progressing.
  @_s.JsonKey(name: 'progressDetail')
  final ProgressDetail progressDetail;

  /// The status of the robot deployment.
  @_s.JsonKey(name: 'status')
  final RobotStatus status;

  RobotDeployment({
    this.arn,
    this.deploymentFinishTime,
    this.deploymentStartTime,
    this.failureCode,
    this.failureReason,
    this.progressDetail,
    this.status,
  });
  factory RobotDeployment.fromJson(Map<String, dynamic> json) =>
      _$RobotDeploymentFromJson(json);
}

enum RobotDeploymentStep {
  @_s.JsonValue('Validating')
  validating,
  @_s.JsonValue('DownloadingExtracting')
  downloadingExtracting,
  @_s.JsonValue('ExecutingDownloadCondition')
  executingDownloadCondition,
  @_s.JsonValue('ExecutingPreLaunch')
  executingPreLaunch,
  @_s.JsonValue('Launching')
  launching,
  @_s.JsonValue('ExecutingPostLaunch')
  executingPostLaunch,
  @_s.JsonValue('Finished')
  finished,
}

/// Information about a robot software suite (ROS distribution).
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class RobotSoftwareSuite {
  /// The name of the robot software suite (ROS distribution).
  @_s.JsonKey(name: 'name')
  final RobotSoftwareSuiteType name;

  /// The version of the robot software suite (ROS distribution).
  @_s.JsonKey(name: 'version')
  final RobotSoftwareSuiteVersionType version;

  RobotSoftwareSuite({
    this.name,
    this.version,
  });
  factory RobotSoftwareSuite.fromJson(Map<String, dynamic> json) =>
      _$RobotSoftwareSuiteFromJson(json);

  Map<String, dynamic> toJson() => _$RobotSoftwareSuiteToJson(this);
}

enum RobotSoftwareSuiteType {
  @_s.JsonValue('ROS')
  ros,
  @_s.JsonValue('ROS2')
  ros2,
}

enum RobotSoftwareSuiteVersionType {
  @_s.JsonValue('Kinetic')
  kinetic,
  @_s.JsonValue('Melodic')
  melodic,
  @_s.JsonValue('Dashing')
  dashing,
}

enum RobotStatus {
  @_s.JsonValue('Available')
  available,
  @_s.JsonValue('Registered')
  registered,
  @_s.JsonValue('PendingNewDeployment')
  pendingNewDeployment,
  @_s.JsonValue('Deploying')
  deploying,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('InSync')
  inSync,
  @_s.JsonValue('NoResponse')
  noResponse,
}

/// Information about S3 keys.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class S3KeyOutput {
  /// The etag for the object.
  @_s.JsonKey(name: 'etag')
  final String etag;

  /// The S3 key.
  @_s.JsonKey(name: 's3Key')
  final String s3Key;

  S3KeyOutput({
    this.etag,
    this.s3Key,
  });
  factory S3KeyOutput.fromJson(Map<String, dynamic> json) =>
      _$S3KeyOutputFromJson(json);
}

/// Information about an S3 object.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class S3Object {
  /// The bucket containing the object.
  @_s.JsonKey(name: 'bucket')
  final String bucket;

  /// The key of the object.
  @_s.JsonKey(name: 'key')
  final String key;

  /// The etag of the object.
  @_s.JsonKey(name: 'etag')
  final String etag;

  S3Object({
    @_s.required this.bucket,
    @_s.required this.key,
    this.etag,
  });
  factory S3Object.fromJson(Map<String, dynamic> json) =>
      _$S3ObjectFromJson(json);

  Map<String, dynamic> toJson() => _$S3ObjectToJson(this);
}

/// Information about a simulation application configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SimulationApplicationConfig {
  /// The application information for the simulation application.
  @_s.JsonKey(name: 'application')
  final String application;

  /// The launch configuration for the simulation application.
  @_s.JsonKey(name: 'launchConfig')
  final LaunchConfig launchConfig;

  /// The version of the simulation application.
  @_s.JsonKey(name: 'applicationVersion')
  final String applicationVersion;

  /// A list of world configurations.
  @_s.JsonKey(name: 'worldConfigs')
  final List<WorldConfig> worldConfigs;

  SimulationApplicationConfig({
    @_s.required this.application,
    @_s.required this.launchConfig,
    this.applicationVersion,
    this.worldConfigs,
  });
  factory SimulationApplicationConfig.fromJson(Map<String, dynamic> json) =>
      _$SimulationApplicationConfigFromJson(json);

  Map<String, dynamic> toJson() => _$SimulationApplicationConfigToJson(this);
}

/// Summary information for a simulation application.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SimulationApplicationSummary {
  /// The Amazon Resource Name (ARN) of the simulation application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the simulation application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Information about a robot software suite (ROS distribution).
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// Information about a simulation software suite.
  @_s.JsonKey(name: 'simulationSoftwareSuite')
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// The version of the simulation application.
  @_s.JsonKey(name: 'version')
  final String version;

  SimulationApplicationSummary({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.robotSoftwareSuite,
    this.simulationSoftwareSuite,
    this.version,
  });
  factory SimulationApplicationSummary.fromJson(Map<String, dynamic> json) =>
      _$SimulationApplicationSummaryFromJson(json);
}

/// Information about a simulation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SimulationJob {
  /// The Amazon Resource Name (ARN) of the simulation job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// A unique identifier for this <code>SimulationJob</code> request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// Compute information for the simulation job
  @_s.JsonKey(name: 'compute')
  final ComputeResponse compute;

  /// The data sources for the simulation job.
  @_s.JsonKey(name: 'dataSources')
  final List<DataSource> dataSources;

  /// The failure behavior the simulation job.
  /// <dl> <dt>Continue</dt> <dd>
  /// Restart the simulation job in the same host instance.
  /// </dd> <dt>Fail</dt> <dd>
  /// Stop the simulation job and terminate the instance.
  /// </dd> </dl>
  @_s.JsonKey(name: 'failureBehavior')
  final FailureBehavior failureBehavior;

  /// The failure code of the simulation job if it failed.
  @_s.JsonKey(name: 'failureCode')
  final SimulationJobErrorCode failureCode;

  /// The reason why the simulation job failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The IAM role that allows the simulation instance to call the AWS APIs that
  /// are specified in its associated policies on your behalf. This is how
  /// credentials are passed in to your simulation job.
  @_s.JsonKey(name: 'iamRole')
  final String iamRole;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// started.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastStartedAt')
  final DateTime lastStartedAt;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The logging configuration.
  @_s.JsonKey(name: 'loggingConfig')
  final LoggingConfig loggingConfig;

  /// The maximum simulation job duration in seconds. The value must be 8 days
  /// (691,200 seconds) or less.
  @_s.JsonKey(name: 'maxJobDurationInSeconds')
  final int maxJobDurationInSeconds;

  /// The name of the simulation job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// Information about a network interface.
  @_s.JsonKey(name: 'networkInterface')
  final NetworkInterface networkInterface;

  /// Location for output files generated by the simulation job.
  @_s.JsonKey(name: 'outputLocation')
  final OutputLocation outputLocation;

  /// A list of robot applications.
  @_s.JsonKey(name: 'robotApplications')
  final List<RobotApplicationConfig> robotApplications;

  /// A list of simulation applications.
  @_s.JsonKey(name: 'simulationApplications')
  final List<SimulationApplicationConfig> simulationApplications;

  /// The simulation job execution duration in milliseconds.
  @_s.JsonKey(name: 'simulationTimeMillis')
  final int simulationTimeMillis;

  /// Status of the simulation job.
  @_s.JsonKey(name: 'status')
  final SimulationJobStatus status;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// VPC configuration information.
  @_s.JsonKey(name: 'vpcConfig')
  final VPCConfigResponse vpcConfig;

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
  factory SimulationJob.fromJson(Map<String, dynamic> json) =>
      _$SimulationJobFromJson(json);
}

enum SimulationJobBatchErrorCode {
  @_s.JsonValue('InternalServiceError')
  internalServiceError,
}

enum SimulationJobBatchStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('InProgress')
  inProgress,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Canceled')
  canceled,
  @_s.JsonValue('Canceling')
  canceling,
  @_s.JsonValue('Completing')
  completing,
  @_s.JsonValue('TimingOut')
  timingOut,
  @_s.JsonValue('TimedOut')
  timedOut,
}

/// Information about a simulation job batch.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SimulationJobBatchSummary {
  /// The Amazon Resource Name (ARN) of the batch.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The number of created simulation job requests.
  @_s.JsonKey(name: 'createdRequestCount')
  final int createdRequestCount;

  /// The number of failed simulation job requests.
  @_s.JsonKey(name: 'failedRequestCount')
  final int failedRequestCount;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The number of pending simulation job requests.
  @_s.JsonKey(name: 'pendingRequestCount')
  final int pendingRequestCount;

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
  @_s.JsonKey(name: 'status')
  final SimulationJobBatchStatus status;

  SimulationJobBatchSummary({
    this.arn,
    this.createdAt,
    this.createdRequestCount,
    this.failedRequestCount,
    this.lastUpdatedAt,
    this.pendingRequestCount,
    this.status,
  });
  factory SimulationJobBatchSummary.fromJson(Map<String, dynamic> json) =>
      _$SimulationJobBatchSummaryFromJson(json);
}

enum SimulationJobErrorCode {
  @_s.JsonValue('InternalServiceError')
  internalServiceError,
  @_s.JsonValue('RobotApplicationCrash')
  robotApplicationCrash,
  @_s.JsonValue('SimulationApplicationCrash')
  simulationApplicationCrash,
  @_s.JsonValue('BadPermissionsRobotApplication')
  badPermissionsRobotApplication,
  @_s.JsonValue('BadPermissionsSimulationApplication')
  badPermissionsSimulationApplication,
  @_s.JsonValue('BadPermissionsS3Object')
  badPermissionsS3Object,
  @_s.JsonValue('BadPermissionsS3Output')
  badPermissionsS3Output,
  @_s.JsonValue('BadPermissionsCloudwatchLogs')
  badPermissionsCloudwatchLogs,
  @_s.JsonValue('SubnetIpLimitExceeded')
  subnetIpLimitExceeded,
  @_s.JsonValue('ENILimitExceeded')
  eNILimitExceeded,
  @_s.JsonValue('BadPermissionsUserCredentials')
  badPermissionsUserCredentials,
  @_s.JsonValue('InvalidBundleRobotApplication')
  invalidBundleRobotApplication,
  @_s.JsonValue('InvalidBundleSimulationApplication')
  invalidBundleSimulationApplication,
  @_s.JsonValue('InvalidS3Resource')
  invalidS3Resource,
  @_s.JsonValue('LimitExceeded')
  limitExceeded,
  @_s.JsonValue('MismatchedEtag')
  mismatchedEtag,
  @_s.JsonValue('RobotApplicationVersionMismatchedEtag')
  robotApplicationVersionMismatchedEtag,
  @_s.JsonValue('SimulationApplicationVersionMismatchedEtag')
  simulationApplicationVersionMismatchedEtag,
  @_s.JsonValue('ResourceNotFound')
  resourceNotFound,
  @_s.JsonValue('RequestThrottled')
  requestThrottled,
  @_s.JsonValue('BatchTimedOut')
  batchTimedOut,
  @_s.JsonValue('BatchCanceled')
  batchCanceled,
  @_s.JsonValue('InvalidInput')
  invalidInput,
  @_s.JsonValue('WrongRegionS3Bucket')
  wrongRegionS3Bucket,
  @_s.JsonValue('WrongRegionS3Output')
  wrongRegionS3Output,
  @_s.JsonValue('WrongRegionRobotApplication')
  wrongRegionRobotApplication,
  @_s.JsonValue('WrongRegionSimulationApplication')
  wrongRegionSimulationApplication,
}

/// Information about a simulation job request.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SimulationJobRequest {
  /// The maximum simulation job duration in seconds. The value must be 8 days
  /// (691,200 seconds) or less.
  @_s.JsonKey(name: 'maxJobDurationInSeconds')
  final int maxJobDurationInSeconds;

  /// Compute information for the simulation job
  @_s.JsonKey(name: 'compute')
  final Compute compute;

  /// Specify data sources to mount read-only files from S3 into your simulation.
  /// These files are available under
  /// <code>/opt/robomaker/datasources/data_source_name</code>.
  /// <note>
  /// There is a limit of 100 files and a combined size of 25GB for all
  /// <code>DataSourceConfig</code> objects.
  /// </note>
  @_s.JsonKey(name: 'dataSources')
  final List<DataSourceConfig> dataSources;

  /// The failure behavior the simulation job.
  /// <dl> <dt>Continue</dt> <dd>
  /// Restart the simulation job in the same host instance.
  /// </dd> <dt>Fail</dt> <dd>
  /// Stop the simulation job and terminate the instance.
  /// </dd> </dl>
  @_s.JsonKey(name: 'failureBehavior')
  final FailureBehavior failureBehavior;

  /// The IAM role name that allows the simulation instance to call the AWS APIs
  /// that are specified in its associated policies on your behalf. This is how
  /// credentials are passed in to your simulation job.
  @_s.JsonKey(name: 'iamRole')
  final String iamRole;
  @_s.JsonKey(name: 'loggingConfig')
  final LoggingConfig loggingConfig;
  @_s.JsonKey(name: 'outputLocation')
  final OutputLocation outputLocation;

  /// The robot applications to use in the simulation job.
  @_s.JsonKey(name: 'robotApplications')
  final List<RobotApplicationConfig> robotApplications;

  /// The simulation applications to use in the simulation job.
  @_s.JsonKey(name: 'simulationApplications')
  final List<SimulationApplicationConfig> simulationApplications;

  /// A map that contains tag keys and tag values that are attached to the
  /// simulation job request.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

  /// Boolean indicating whether to use default simulation tool applications.
  @_s.JsonKey(name: 'useDefaultApplications')
  final bool useDefaultApplications;
  @_s.JsonKey(name: 'vpcConfig')
  final VPCConfig vpcConfig;

  SimulationJobRequest({
    @_s.required this.maxJobDurationInSeconds,
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
  factory SimulationJobRequest.fromJson(Map<String, dynamic> json) =>
      _$SimulationJobRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SimulationJobRequestToJson(this);
}

enum SimulationJobStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Preparing')
  preparing,
  @_s.JsonValue('Running')
  running,
  @_s.JsonValue('Restarting')
  restarting,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('RunningFailed')
  runningFailed,
  @_s.JsonValue('Terminating')
  terminating,
  @_s.JsonValue('Terminated')
  terminated,
  @_s.JsonValue('Canceled')
  canceled,
}

/// Summary information for a simulation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SimulationJobSummary {
  /// The Amazon Resource Name (ARN) of the simulation job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The names of the data sources.
  @_s.JsonKey(name: 'dataSourceNames')
  final List<String> dataSourceNames;

  /// The time, in milliseconds since the epoch, when the simulation job was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the simulation job.
  @_s.JsonKey(name: 'name')
  final String name;

  /// A list of simulation job robot application names.
  @_s.JsonKey(name: 'robotApplicationNames')
  final List<String> robotApplicationNames;

  /// A list of simulation job simulation application names.
  @_s.JsonKey(name: 'simulationApplicationNames')
  final List<String> simulationApplicationNames;

  /// The status of the simulation job.
  @_s.JsonKey(name: 'status')
  final SimulationJobStatus status;

  SimulationJobSummary({
    this.arn,
    this.dataSourceNames,
    this.lastUpdatedAt,
    this.name,
    this.robotApplicationNames,
    this.simulationApplicationNames,
    this.status,
  });
  factory SimulationJobSummary.fromJson(Map<String, dynamic> json) =>
      _$SimulationJobSummaryFromJson(json);
}

/// Information about a simulation software suite.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class SimulationSoftwareSuite {
  /// The name of the simulation software suite.
  @_s.JsonKey(name: 'name')
  final SimulationSoftwareSuiteType name;

  /// The version of the simulation software suite.
  @_s.JsonKey(name: 'version')
  final String version;

  SimulationSoftwareSuite({
    this.name,
    this.version,
  });
  factory SimulationSoftwareSuite.fromJson(Map<String, dynamic> json) =>
      _$SimulationSoftwareSuiteFromJson(json);

  Map<String, dynamic> toJson() => _$SimulationSoftwareSuiteToJson(this);
}

enum SimulationSoftwareSuiteType {
  @_s.JsonValue('Gazebo')
  gazebo,
  @_s.JsonValue('RosbagPlay')
  rosbagPlay,
}

/// Information about a source.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class Source {
  /// The taget processor architecture for the application.
  @_s.JsonKey(name: 'architecture')
  final Architecture architecture;

  /// A hash of the object specified by <code>s3Bucket</code> and
  /// <code>s3Key</code>.
  @_s.JsonKey(name: 'etag')
  final String etag;

  /// The s3 bucket name.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// The s3 object key.
  @_s.JsonKey(name: 's3Key')
  final String s3Key;

  Source({
    this.architecture,
    this.etag,
    this.s3Bucket,
    this.s3Key,
  });
  factory Source.fromJson(Map<String, dynamic> json) => _$SourceFromJson(json);
}

/// Information about a source configuration.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class SourceConfig {
  /// The target processor architecture for the application.
  @_s.JsonKey(name: 'architecture')
  final Architecture architecture;

  /// The Amazon S3 bucket name.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// The s3 object key.
  @_s.JsonKey(name: 's3Key')
  final String s3Key;

  SourceConfig({
    this.architecture,
    this.s3Bucket,
    this.s3Key,
  });
  Map<String, dynamic> toJson() => _$SourceConfigToJson(this);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class StartSimulationJobBatchResponse {
  /// The Amazon Resource Name (arn) of the batch.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The batch policy.
  @_s.JsonKey(name: 'batchPolicy')
  final BatchPolicy batchPolicy;

  /// Unique, case-sensitive identifier that you provide to ensure the idempotency
  /// of the request.
  @_s.JsonKey(name: 'clientRequestToken')
  final String clientRequestToken;

  /// The time, in milliseconds since the epoch, when the simulation job batch was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// A list of created simulation job request summaries.
  @_s.JsonKey(name: 'createdRequests')
  final List<SimulationJobSummary> createdRequests;

  /// A list of failed simulation job requests. The request failed to be created
  /// into a simulation job. Failed requests do not have a simulation job ID.
  @_s.JsonKey(name: 'failedRequests')
  final List<FailedCreateSimulationJobRequest> failedRequests;

  /// The failure code if the simulation job batch failed.
  @_s.JsonKey(name: 'failureCode')
  final SimulationJobBatchErrorCode failureCode;

  /// The reason the simulation job batch failed.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// A list of pending simulation job requests. These requests have not yet been
  /// created into simulation jobs.
  @_s.JsonKey(name: 'pendingRequests')
  final List<SimulationJobRequest> pendingRequests;

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
  @_s.JsonKey(name: 'status')
  final SimulationJobBatchStatus status;

  /// A map that contains tag keys and tag values that are attached to the
  /// deployment job batch.
  @_s.JsonKey(name: 'tags')
  final Map<String, String> tags;

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
  factory StartSimulationJobBatchResponse.fromJson(Map<String, dynamic> json) =>
      _$StartSimulationJobBatchResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class SyncDeploymentJobResponse {
  /// The Amazon Resource Name (ARN) of the synchronization request.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the fleet was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// Information about the deployment application configurations.
  @_s.JsonKey(name: 'deploymentApplicationConfigs')
  final List<DeploymentApplicationConfig> deploymentApplicationConfigs;

  /// Information about the deployment configuration.
  @_s.JsonKey(name: 'deploymentConfig')
  final DeploymentConfig deploymentConfig;

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
  @_s.JsonKey(name: 'failureCode')
  final DeploymentJobErrorCode failureCode;

  /// The failure reason if the job fails.
  @_s.JsonKey(name: 'failureReason')
  final String failureReason;

  /// The Amazon Resource Name (ARN) of the fleet.
  @_s.JsonKey(name: 'fleet')
  final String fleet;

  /// The status of the synchronization job.
  @_s.JsonKey(name: 'status')
  final DeploymentStatus status;

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
  factory SyncDeploymentJobResponse.fromJson(Map<String, dynamic> json) =>
      _$SyncDeploymentJobResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TagResourceResponse {
  TagResourceResponse();
  factory TagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$TagResourceResponseFromJson(json);
}

/// Information about a template location.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: false,
    createToJson: true)
class TemplateLocation {
  /// The Amazon S3 bucket name.
  @_s.JsonKey(name: 's3Bucket')
  final String s3Bucket;

  /// The list of S3 keys identifying the data source files.
  @_s.JsonKey(name: 's3Key')
  final String s3Key;

  TemplateLocation({
    @_s.required this.s3Bucket,
    @_s.required this.s3Key,
  });
  Map<String, dynamic> toJson() => _$TemplateLocationToJson(this);
}

/// Summary information for a template.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class TemplateSummary {
  /// The Amazon Resource Name (ARN) of the template.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the template was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The time, in milliseconds since the epoch, when the template was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the template.
  @_s.JsonKey(name: 'name')
  final String name;

  TemplateSummary({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
  });
  factory TemplateSummary.fromJson(Map<String, dynamic> json) =>
      _$TemplateSummaryFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UntagResourceResponse {
  UntagResourceResponse();
  factory UntagResourceResponse.fromJson(Map<String, dynamic> json) =>
      _$UntagResourceResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateRobotApplicationResponse {
  /// The Amazon Resource Name (ARN) of the updated robot application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the robot application was
  /// last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the robot application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The revision id of the robot application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// The robot software suite (ROS distribution) used by the robot application.
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The sources of the robot application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The version of the robot application.
  @_s.JsonKey(name: 'version')
  final String version;

  UpdateRobotApplicationResponse({
    this.arn,
    this.lastUpdatedAt,
    this.name,
    this.revisionId,
    this.robotSoftwareSuite,
    this.sources,
    this.version,
  });
  factory UpdateRobotApplicationResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateRobotApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateSimulationApplicationResponse {
  /// The Amazon Resource Name (ARN) of the updated simulation application.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the simulation application
  /// was last updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the simulation application.
  @_s.JsonKey(name: 'name')
  final String name;

  /// The rendering engine for the simulation application.
  @_s.JsonKey(name: 'renderingEngine')
  final RenderingEngine renderingEngine;

  /// The revision id of the simulation application.
  @_s.JsonKey(name: 'revisionId')
  final String revisionId;

  /// Information about the robot software suite (ROS distribution).
  @_s.JsonKey(name: 'robotSoftwareSuite')
  final RobotSoftwareSuite robotSoftwareSuite;

  /// The simulation software suite used by the simulation application.
  @_s.JsonKey(name: 'simulationSoftwareSuite')
  final SimulationSoftwareSuite simulationSoftwareSuite;

  /// The sources of the simulation application.
  @_s.JsonKey(name: 'sources')
  final List<Source> sources;

  /// The version of the robot application.
  @_s.JsonKey(name: 'version')
  final String version;

  UpdateSimulationApplicationResponse({
    this.arn,
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
          Map<String, dynamic> json) =>
      _$UpdateSimulationApplicationResponseFromJson(json);
}

@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class UpdateWorldTemplateResponse {
  /// The Amazon Resource Name (arn) of the world template.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the world template was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The time, in milliseconds since the epoch, when the world template was last
  /// updated.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'lastUpdatedAt')
  final DateTime lastUpdatedAt;

  /// The name of the world template.
  @_s.JsonKey(name: 'name')
  final String name;

  UpdateWorldTemplateResponse({
    this.arn,
    this.createdAt,
    this.lastUpdatedAt,
    this.name,
  });
  factory UpdateWorldTemplateResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateWorldTemplateResponseFromJson(json);
}

/// If your simulation job accesses resources in a VPC, you provide this
/// parameter identifying the list of security group IDs and subnet IDs. These
/// must belong to the same VPC. You must provide at least one security group
/// and two subnet IDs.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class VPCConfig {
  /// A list of one or more subnet IDs in your VPC.
  @_s.JsonKey(name: 'subnets')
  final List<String> subnets;

  /// A boolean indicating whether to assign a public IP address.
  @_s.JsonKey(name: 'assignPublicIp')
  final bool assignPublicIp;

  /// A list of one or more security groups IDs in your VPC.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  VPCConfig({
    @_s.required this.subnets,
    this.assignPublicIp,
    this.securityGroups,
  });
  factory VPCConfig.fromJson(Map<String, dynamic> json) =>
      _$VPCConfigFromJson(json);

  Map<String, dynamic> toJson() => _$VPCConfigToJson(this);
}

/// VPC configuration associated with your simulation job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class VPCConfigResponse {
  /// A boolean indicating if a public IP was assigned.
  @_s.JsonKey(name: 'assignPublicIp')
  final bool assignPublicIp;

  /// A list of security group IDs associated with the simulation job.
  @_s.JsonKey(name: 'securityGroups')
  final List<String> securityGroups;

  /// A list of subnet IDs associated with the simulation job.
  @_s.JsonKey(name: 'subnets')
  final List<String> subnets;

  /// The VPC ID associated with your simulation job.
  @_s.JsonKey(name: 'vpcId')
  final String vpcId;

  VPCConfigResponse({
    this.assignPublicIp,
    this.securityGroups,
    this.subnets,
    this.vpcId,
  });
  factory VPCConfigResponse.fromJson(Map<String, dynamic> json) =>
      _$VPCConfigResponseFromJson(json);
}

/// Configuration information for a world.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorldConfig {
  /// The world generated by Simulation WorldForge.
  @_s.JsonKey(name: 'world')
  final String world;

  WorldConfig({
    this.world,
  });
  factory WorldConfig.fromJson(Map<String, dynamic> json) =>
      _$WorldConfigFromJson(json);

  Map<String, dynamic> toJson() => _$WorldConfigToJson(this);
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
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: true)
class WorldCount {
  /// The number of unique floorplans.
  @_s.JsonKey(name: 'floorplanCount')
  final int floorplanCount;

  /// The number of unique interiors per floorplan.
  @_s.JsonKey(name: 'interiorCountPerFloorplan')
  final int interiorCountPerFloorplan;

  WorldCount({
    this.floorplanCount,
    this.interiorCountPerFloorplan,
  });
  factory WorldCount.fromJson(Map<String, dynamic> json) =>
      _$WorldCountFromJson(json);

  Map<String, dynamic> toJson() => _$WorldCountToJson(this);
}

enum WorldExportJobErrorCode {
  @_s.JsonValue('InternalServiceError')
  internalServiceError,
  @_s.JsonValue('LimitExceeded')
  limitExceeded,
  @_s.JsonValue('ResourceNotFound')
  resourceNotFound,
  @_s.JsonValue('RequestThrottled')
  requestThrottled,
  @_s.JsonValue('InvalidInput')
  invalidInput,
  @_s.JsonValue('AccessDenied')
  accessDenied,
}

enum WorldExportJobStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Running')
  running,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('Canceling')
  canceling,
  @_s.JsonValue('Canceled')
  canceled,
}

/// Information about a world export job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorldExportJobSummary {
  /// The Amazon Resource Name (ARN) of the world export job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the world export job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

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
  @_s.JsonKey(name: 'status')
  final WorldExportJobStatus status;

  /// A list of worlds.
  @_s.JsonKey(name: 'worlds')
  final List<String> worlds;

  WorldExportJobSummary({
    this.arn,
    this.createdAt,
    this.status,
    this.worlds,
  });
  factory WorldExportJobSummary.fromJson(Map<String, dynamic> json) =>
      _$WorldExportJobSummaryFromJson(json);
}

/// Information about a failed world.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
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
  @_s.JsonKey(name: 'failureCode')
  final WorldGenerationJobErrorCode failureCode;

  /// The number of failed worlds.
  @_s.JsonKey(name: 'failureCount')
  final int failureCount;

  /// The sample reason why the world failed. World errors are aggregated. A
  /// sample is used as the <code>sampleFailureReason</code>.
  @_s.JsonKey(name: 'sampleFailureReason')
  final String sampleFailureReason;

  WorldFailure({
    this.failureCode,
    this.failureCount,
    this.sampleFailureReason,
  });
  factory WorldFailure.fromJson(Map<String, dynamic> json) =>
      _$WorldFailureFromJson(json);
}

enum WorldGenerationJobErrorCode {
  @_s.JsonValue('InternalServiceError')
  internalServiceError,
  @_s.JsonValue('LimitExceeded')
  limitExceeded,
  @_s.JsonValue('ResourceNotFound')
  resourceNotFound,
  @_s.JsonValue('RequestThrottled')
  requestThrottled,
  @_s.JsonValue('InvalidInput')
  invalidInput,
  @_s.JsonValue('AllWorldGenerationFailed')
  allWorldGenerationFailed,
}

enum WorldGenerationJobStatus {
  @_s.JsonValue('Pending')
  pending,
  @_s.JsonValue('Running')
  running,
  @_s.JsonValue('Completed')
  completed,
  @_s.JsonValue('Failed')
  failed,
  @_s.JsonValue('PartialFailed')
  partialFailed,
  @_s.JsonValue('Canceling')
  canceling,
  @_s.JsonValue('Canceled')
  canceled,
}

/// Information about a world generator job.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorldGenerationJobSummary {
  /// The Amazon Resource Name (ARN) of the world generator job.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the world generator job was
  /// created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The number of worlds that failed.
  @_s.JsonKey(name: 'failedWorldCount')
  final int failedWorldCount;

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
  @_s.JsonKey(name: 'status')
  final WorldGenerationJobStatus status;

  /// The number of worlds that were generated.
  @_s.JsonKey(name: 'succeededWorldCount')
  final int succeededWorldCount;

  /// The Amazon Resource Name (arn) of the world template.
  @_s.JsonKey(name: 'template')
  final String template;

  /// Information about the world count.
  @_s.JsonKey(name: 'worldCount')
  final WorldCount worldCount;

  WorldGenerationJobSummary({
    this.arn,
    this.createdAt,
    this.failedWorldCount,
    this.status,
    this.succeededWorldCount,
    this.template,
    this.worldCount,
  });
  factory WorldGenerationJobSummary.fromJson(Map<String, dynamic> json) =>
      _$WorldGenerationJobSummaryFromJson(json);
}

/// Information about a world.
@_s.JsonSerializable(
    includeIfNull: false,
    explicitToJson: true,
    createFactory: true,
    createToJson: false)
class WorldSummary {
  /// The Amazon Resource Name (ARN) of the world.
  @_s.JsonKey(name: 'arn')
  final String arn;

  /// The time, in milliseconds since the epoch, when the world was created.
  @UnixDateTimeConverter()
  @_s.JsonKey(name: 'createdAt')
  final DateTime createdAt;

  /// The Amazon Resource Name (arn) of the world generation job.
  @_s.JsonKey(name: 'generationJob')
  final String generationJob;

  /// The Amazon Resource Name (arn) of the world template.
  @_s.JsonKey(name: 'template')
  final String template;

  WorldSummary({
    this.arn,
    this.createdAt,
    this.generationJob,
    this.template,
  });
  factory WorldSummary.fromJson(Map<String, dynamic> json) =>
      _$WorldSummaryFromJson(json);
}

class ConcurrentDeploymentException extends _s.GenericAwsException {
  ConcurrentDeploymentException({String type, String message})
      : super(
            type: type,
            code: 'ConcurrentDeploymentException',
            message: message);
}

class IdempotentParameterMismatchException extends _s.GenericAwsException {
  IdempotentParameterMismatchException({String type, String message})
      : super(
            type: type,
            code: 'IdempotentParameterMismatchException',
            message: message);
}

class InternalServerException extends _s.GenericAwsException {
  InternalServerException({String type, String message})
      : super(type: type, code: 'InternalServerException', message: message);
}

class InvalidParameterException extends _s.GenericAwsException {
  InvalidParameterException({String type, String message})
      : super(type: type, code: 'InvalidParameterException', message: message);
}

class LimitExceededException extends _s.GenericAwsException {
  LimitExceededException({String type, String message})
      : super(type: type, code: 'LimitExceededException', message: message);
}

class ResourceAlreadyExistsException extends _s.GenericAwsException {
  ResourceAlreadyExistsException({String type, String message})
      : super(
            type: type,
            code: 'ResourceAlreadyExistsException',
            message: message);
}

class ResourceNotFoundException extends _s.GenericAwsException {
  ResourceNotFoundException({String type, String message})
      : super(type: type, code: 'ResourceNotFoundException', message: message);
}

class ServiceUnavailableException extends _s.GenericAwsException {
  ServiceUnavailableException({String type, String message})
      : super(
            type: type, code: 'ServiceUnavailableException', message: message);
}

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String type, String message})
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
