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

/// The Amazon Web Services Deadline Cloud API provides infrastructure and
/// centralized management for your projects. Use the Deadline Cloud API to
/// onboard users, assign projects, and attach permissions specific to their job
/// function.
///
/// With Deadline Cloud, content production teams can deploy resources for their
/// workforce securely in the cloud, reducing the costs of added physical
/// infrastructure. Keep your content production operations secure, while
/// allowing your contributors to access the tools they need, such as scalable
/// high-speed storage, licenses, and cost management services.
class DeadlineCloud {
  final _s.RestJsonProtocol _protocol;
  DeadlineCloud({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'deadline',
            signingName: 'deadline',
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

  /// Assigns a farm membership level to a member.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The ID of the farm to associate with the member.
  ///
  /// Parameter [identityStoreId] :
  /// The identity store ID of the member to associate with the farm.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated farm.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with the farm.
  ///
  /// Parameter [principalType] :
  /// The principal type of the member to associate with the farm.
  Future<void> associateMemberToFarm({
    required String farmId,
    required String identityStoreId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required PrincipalType principalType,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalType': principalType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns a fleet membership level to a member.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleet to associate with the member.
  ///
  /// Parameter [fleetId] :
  /// The ID of the fleet to associate with a member.
  ///
  /// Parameter [identityStoreId] :
  /// The member's identity store ID to associate with the fleet.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated fleet.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with a fleet.
  ///
  /// Parameter [principalType] :
  /// The member's principal type to associate with the fleet.
  Future<void> associateMemberToFleet({
    required String farmId,
    required String fleetId,
    required String identityStoreId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required PrincipalType principalType,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalType': principalType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns a job membership level to a member
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to associate with the member.
  ///
  /// Parameter [identityStoreId] :
  /// The member's identity store ID to associate with the job.
  ///
  /// Parameter [jobId] :
  /// The job ID to associate with the member.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated job.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with the job.
  ///
  /// Parameter [principalType] :
  /// The member's principal type to associate with the job.
  ///
  /// Parameter [queueId] :
  /// The queue ID to associate to the member.
  Future<void> associateMemberToJob({
    required String farmId,
    required String identityStoreId,
    required String jobId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required PrincipalType principalType,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalType': principalType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Assigns a queue membership level to a member
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue to associate with the member.
  ///
  /// Parameter [identityStoreId] :
  /// The member's identity store ID to associate with the queue.
  ///
  /// Parameter [membershipLevel] :
  /// The principal's membership level for the associated queue.
  ///
  /// Parameter [principalId] :
  /// The member's principal ID to associate with the queue.
  ///
  /// Parameter [principalType] :
  /// The member's principal type to associate with the queue.
  ///
  /// Parameter [queueId] :
  /// The ID of the queue to associate to the member.
  Future<void> associateMemberToQueue({
    required String farmId,
    required String identityStoreId,
    required MembershipLevel membershipLevel,
    required String principalId,
    required PrincipalType principalType,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalType': principalType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get Amazon Web Services credentials from the fleet role. The IAM
  /// permissions of the credentials are scoped down to have read-only access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the fleet's farm.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID.
  Future<AssumeFleetRoleForReadResponse> assumeFleetRoleForRead({
    required String farmId,
    required String fleetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/read-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeFleetRoleForReadResponse.fromJson(response);
  }

  /// Get credentials from the fleet role for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the fleet's farm.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID that contains the worker.
  ///
  /// Parameter [workerId] :
  /// The ID of the worker assuming the fleet role.
  Future<AssumeFleetRoleForWorkerResponse> assumeFleetRoleForWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/fleet-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeFleetRoleForWorkerResponse.fromJson(response);
  }

  /// Gets Amazon Web Services credentials from the queue role. The IAM
  /// permissions of the credentials are scoped down to have read-only access.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm containing the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID.
  Future<AssumeQueueRoleForReadResponse> assumeQueueRoleForRead({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/read-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeQueueRoleForReadResponse.fromJson(response);
  }

  /// Allows a user to assume a role for a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue that the user assumes the role for.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue that the user assumes the role for.
  Future<AssumeQueueRoleForUserResponse> assumeQueueRoleForUser({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/user-roles',
      exceptionFnMap: _exceptionFns,
    );
    return AssumeQueueRoleForUserResponse.fromJson(response);
  }

  /// Allows a worker to assume a queue role.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the worker assuming the queue role.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker assuming the queue role.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the worker assuming the queue role.
  ///
  /// Parameter [workerId] :
  /// The worker ID of the worker assuming the queue role.
  Future<AssumeQueueRoleForWorkerResponse> assumeQueueRoleForWorker({
    required String farmId,
    required String fleetId,
    required String queueId,
    required String workerId,
  }) async {
    final $query = <String, List<String>>{
      'queueId': [queueId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/queue-roles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return AssumeQueueRoleForWorkerResponse.fromJson(response);
  }

  /// Get batched job details for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the worker that's fetching job details. The worker must
  /// have an assignment on a job to fetch job details.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker that's fetching job details. The worker must
  /// have an assignment on a job to fetch job details.
  ///
  /// Parameter [identifiers] :
  /// The job identifiers to include within the job entity batch details.
  ///
  /// Parameter [workerId] :
  /// The worker ID of the worker containing the job details to get.
  Future<BatchGetJobEntityResponse> batchGetJobEntity({
    required String farmId,
    required String fleetId,
    required List<JobEntityIdentifiersUnion> identifiers,
    required String workerId,
  }) async {
    final $payload = <String, dynamic>{
      'identifiers': identifiers,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/batchGetJobEntity',
      exceptionFnMap: _exceptionFns,
    );
    return BatchGetJobEntityResponse.fromJson(response);
  }

  /// Copies a job template to an Amazon S3 bucket.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to copy.
  ///
  /// Parameter [jobId] :
  /// The job ID to copy.
  ///
  /// Parameter [queueId] :
  /// The queue ID to copy.
  ///
  /// Parameter [targetS3Location] :
  /// The Amazon S3 bucket name and key where you would like to add a copy of
  /// the job template.
  Future<CopyJobTemplateResponse> copyJobTemplate({
    required String farmId,
    required String jobId,
    required String queueId,
    required S3Location targetS3Location,
  }) async {
    final $payload = <String, dynamic>{
      'targetS3Location': targetS3Location,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/template',
      exceptionFnMap: _exceptionFns,
    );
    return CopyJobTemplateResponse.fromJson(response);
  }

  /// Creates a budget to set spending thresholds for your rendering activity.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [actions] :
  /// The budget actions to specify what happens when the budget runs out.
  ///
  /// Parameter [approximateDollarLimit] :
  /// The dollar limit based on consumed usage.
  ///
  /// Parameter [displayName] :
  /// The display name of the budget.
  ///
  /// Parameter [farmId] :
  /// The farm ID to include in this budget.
  ///
  /// Parameter [schedule] :
  /// The schedule to associate with this budget.
  ///
  /// Parameter [usageTrackingResource] :
  /// The queue ID provided to this budget to track usage.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the budget.
  Future<CreateBudgetResponse> createBudget({
    required List<BudgetActionToAdd> actions,
    required double approximateDollarLimit,
    required String displayName,
    required String farmId,
    required BudgetSchedule schedule,
    required UsageTrackingResource usageTrackingResource,
    String? clientToken,
    String? description,
  }) async {
    _s.validateNumRange(
      'approximateDollarLimit',
      approximateDollarLimit,
      0.01,
      1152921504606846976,
      isRequired: true,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'actions': actions,
      'approximateDollarLimit': approximateDollarLimit,
      'displayName': displayName,
      'schedule': schedule,
      'usageTrackingResource': usageTrackingResource,
      if (description != null) 'description': description,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateBudgetResponse.fromJson(response);
  }

  /// Creates a farm to allow space for queues and fleets. Farms are the space
  /// where the components of your renders gather and are pieced together in the
  /// cloud. Farms contain budgets and allow you to enforce permissions.
  /// Deadline Cloud farms are a useful container for large projects.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [displayName] :
  /// The display name of the farm.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the farm.
  ///
  /// Parameter [kmsKeyArn] :
  /// The ARN of the KMS key to use on the farm.
  ///
  /// Parameter [tags] :
  /// The tags to add to your farm. Each tag consists of a tag key and a tag
  /// value. Tag keys and values are both required, but tag values can be empty
  /// strings.
  Future<CreateFarmResponse> createFarm({
    required String displayName,
    String? clientToken,
    String? description,
    String? kmsKeyArn,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (description != null) 'description': description,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFarmResponse.fromJson(response);
  }

  /// Creates a fleet. Fleets gather information relating to compute, or
  /// capacity, for renders within your farms. You can choose to manage your own
  /// capacity or opt to have fleets fully managed by Deadline Cloud.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [configuration] :
  /// The configuration settings for the fleet. Customer managed fleets are
  /// self-managed. Service managed Amazon EC2 fleets are managed by Deadline
  /// Cloud.
  ///
  /// Parameter [displayName] :
  /// The display name of the fleet.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the fleet.
  ///
  /// Parameter [maxWorkerCount] :
  /// The maximum number of workers for the fleet.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN for the role that the fleet's workers will use.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the fleet.
  ///
  /// Parameter [minWorkerCount] :
  /// The minimum number of workers for the fleet.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateFleetResponse> createFleet({
    required FleetConfiguration configuration,
    required String displayName,
    required String farmId,
    required int maxWorkerCount,
    required String roleArn,
    String? clientToken,
    String? description,
    int? minWorkerCount,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'maxWorkerCount',
      maxWorkerCount,
      0,
      2147483647,
      isRequired: true,
    );
    _s.validateNumRange(
      'minWorkerCount',
      minWorkerCount,
      0,
      2147483647,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'configuration': configuration,
      'displayName': displayName,
      'maxWorkerCount': maxWorkerCount,
      'roleArn': roleArn,
      if (description != null) 'description': description,
      if (minWorkerCount != null) 'minWorkerCount': minWorkerCount,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateFleetResponse.fromJson(response);
  }

  /// Creates a job. A job is a render submission submitted by a user. It
  /// contains specific job properties outlined as steps and tasks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the job.
  ///
  /// Parameter [priority] :
  /// The priority of the job on a scale of 1 to 100. The highest priority is 1.
  ///
  /// Parameter [queueId] :
  /// The ID of the queue that the job is submitted to.
  ///
  /// Parameter [template] :
  /// The job template to use for this job.
  ///
  /// Parameter [templateType] :
  /// The file type for the job template.
  ///
  /// Parameter [attachments] :
  /// The attachments for the job. Attach files required for the job to run to a
  /// render job.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [maxFailedTasksCount] :
  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  ///
  /// Parameter [maxRetriesPerTask] :
  /// The maximum number of retries for a job.
  ///
  /// Parameter [parameters] :
  /// The parameters for the job.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID for the storage profile to connect to the job.
  ///
  /// Parameter [targetTaskRunStatus] :
  /// The initial status of the job's tasks when they are created. Tasks that
  /// are created with a <code>SUSPENDED</code> status will not run until you
  /// update their status.
  Future<CreateJobResponse> createJob({
    required String farmId,
    required int priority,
    required String queueId,
    required String template,
    required JobTemplateType templateType,
    Attachments? attachments,
    String? clientToken,
    int? maxFailedTasksCount,
    int? maxRetriesPerTask,
    Map<String, JobParameter>? parameters,
    String? storageProfileId,
    CreateJobTargetTaskRunStatus? targetTaskRunStatus,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      100,
      isRequired: true,
    );
    _s.validateNumRange(
      'maxFailedTasksCount',
      maxFailedTasksCount,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'maxRetriesPerTask',
      maxRetriesPerTask,
      0,
      2147483647,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'priority': priority,
      'template': template,
      'templateType': templateType.toValue(),
      if (attachments != null) 'attachments': attachments,
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (parameters != null) 'parameters': parameters,
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateJobResponse.fromJson(response);
  }

  /// Creates a license endpoint to integrate your various licensed software
  /// used for rendering on Deadline Cloud.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [securityGroupIds] :
  /// The security group IDs.
  ///
  /// Parameter [subnetIds] :
  /// The subnet IDs.
  ///
  /// Parameter [vpcId] :
  /// The VPC (virtual private cloud) ID to use with the license endpoint.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateLicenseEndpointResponse> createLicenseEndpoint({
    required List<String> securityGroupIds,
    required List<String> subnetIds,
    required String vpcId,
    String? clientToken,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'securityGroupIds': securityGroupIds,
      'subnetIds': subnetIds,
      'vpcId': vpcId,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/license-endpoints',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateLicenseEndpointResponse.fromJson(response);
  }

  /// Creates an Amazon Web Services Deadline Cloud monitor that you can use to
  /// view your farms, queues, and fleets. After you submit a job, you can track
  /// the progress of the tasks and steps that make up the job, and then
  /// download the job's results.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [displayName] :
  /// The name that you give the monitor that is displayed in the Deadline Cloud
  /// console.
  ///
  /// Parameter [identityCenterInstanceArn] :
  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance that
  /// authenticates monitor users.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the IAM role that the monitor uses to
  /// connect to Deadline Cloud. Every user that signs in to the monitor using
  /// IAM Identity Center uses this role to access Deadline Cloud resources.
  ///
  /// Parameter [subdomain] :
  /// The subdomain to use when creating the monitor URL. The full URL of the
  /// monitor is subdomain.Region.deadlinecloud.amazonaws.com.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<CreateMonitorResponse> createMonitor({
    required String displayName,
    required String identityCenterInstanceArn,
    required String roleArn,
    required String subdomain,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      'identityCenterInstanceArn': identityCenterInstanceArn,
      'roleArn': roleArn,
      'subdomain': subdomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/monitors',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateMonitorResponse.fromJson(response);
  }

  /// Creates a queue to coordinate the order in which jobs run on a farm. A
  /// queue can also specify where to pull resources and indicate where to
  /// output completed jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [displayName] :
  /// The display name of the queue.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the queue.
  ///
  /// Parameter [allowedStorageProfileIds] :
  /// The storage profile IDs to include in the queue.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [defaultBudgetAction] :
  /// The default action to take on a queue if a budget isn't configured.
  ///
  /// Parameter [description] :
  /// The description of the queue.
  ///
  /// Parameter [jobAttachmentSettings] :
  /// The job attachment settings for the queue. These are the Amazon S3 bucket
  /// name and the Amazon S3 prefix.
  ///
  /// Parameter [jobRunAsUser] :
  /// The jobs in the queue run as the specified POSIX user.
  ///
  /// Parameter [requiredFileSystemLocationNames] :
  /// The file system location name to include in the queue.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that workers will use while running jobs for this queue.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<CreateQueueResponse> createQueue({
    required String displayName,
    required String farmId,
    List<String>? allowedStorageProfileIds,
    String? clientToken,
    DefaultQueueBudgetAction? defaultBudgetAction,
    String? description,
    JobAttachmentSettings? jobAttachmentSettings,
    JobRunAsUser? jobRunAsUser,
    List<String>? requiredFileSystemLocationNames,
    String? roleArn,
    Map<String, String>? tags,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      if (allowedStorageProfileIds != null)
        'allowedStorageProfileIds': allowedStorageProfileIds,
      if (defaultBudgetAction != null)
        'defaultBudgetAction': defaultBudgetAction.toValue(),
      if (description != null) 'description': description,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (requiredFileSystemLocationNames != null)
        'requiredFileSystemLocationNames': requiredFileSystemLocationNames,
      if (roleArn != null) 'roleArn': roleArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueueResponse.fromJson(response);
  }

  /// Creates an environment for a queue that defines how jobs in the queue run.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the environment.
  ///
  /// Parameter [priority] :
  /// Sets the priority of the environments in the queue from 0 to 10,000, where
  /// 0 is the highest priority. If two environments share the same priority
  /// value, the environment created first takes higher priority.
  ///
  /// Parameter [queueId] :
  /// The queue ID to connect the queue and environment.
  ///
  /// Parameter [template] :
  /// The environment template to use in the queue.
  ///
  /// Parameter [templateType] :
  /// The template's file type, <code>JSON</code> or <code>YAML</code>.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<CreateQueueEnvironmentResponse> createQueueEnvironment({
    required String farmId,
    required int priority,
    required String queueId,
    required String template,
    required EnvironmentTemplateType templateType,
    String? clientToken,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      10000,
      isRequired: true,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'priority': priority,
      'template': template,
      'templateType': templateType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateQueueEnvironmentResponse.fromJson(response);
  }

  /// Creates an association between a queue and a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The ID of the farm that the queue and fleet belong to.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID.
  ///
  /// Parameter [queueId] :
  /// The queue ID.
  Future<void> createQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
  }) async {
    final $payload = <String, dynamic>{
      'fleetId': fleetId,
      'queueId': queueId,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PUT',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Creates a storage profile that specifies the operating system, file type,
  /// and file location of resources used on a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [displayName] :
  /// The display name of the storage profile.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the storage profile.
  ///
  /// Parameter [osFamily] :
  /// The type of operating system (OS) for the storage profile.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [fileSystemLocations] :
  /// File system paths to include in the storage profile.
  Future<CreateStorageProfileResponse> createStorageProfile({
    required String displayName,
    required String farmId,
    required StorageProfileOperatingSystemFamily osFamily,
    String? clientToken,
    List<FileSystemLocation>? fileSystemLocations,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'displayName': displayName,
      'osFamily': osFamily.toValue(),
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateStorageProfileResponse.fromJson(response);
  }

  /// Creates a worker. A worker tells your instance how much processing power
  /// (vCPU), and memory (GiB) you’ll need to assemble the digital assets held
  /// within a particular instance. You can specify certain instance types to
  /// use, or let the worker know which instances types to exclude.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to connect to the worker.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to connect to the worker.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [hostProperties] :
  /// The IP address and host name of the worker.
  Future<CreateWorkerResponse> createWorker({
    required String farmId,
    required String fleetId,
    String? clientToken,
    HostPropertiesRequest? hostProperties,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (hostProperties != null) 'hostProperties': hostProperties,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
    return CreateWorkerResponse.fromJson(response);
  }

  /// Deletes a budget.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [budgetId] :
  /// The budget ID of the budget to delete.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to remove from the budget.
  Future<void> deleteBudget({
    required String budgetId,
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets/${Uri.encodeComponent(budgetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to delete.
  Future<void> deleteFarm({
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to remove from the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet to delete.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> deleteFleet({
    required String farmId,
    required String fleetId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a license endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID of the license endpoint to delete.
  Future<void> deleteLicenseEndpoint({
    required String licenseEndpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a metered product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The ID of the license endpoint from which to remove the metered product.
  ///
  /// Parameter [productId] :
  /// The product ID to remove from the license endpoint.
  Future<void> deleteMeteredProduct({
    required String licenseEndpointId,
    required String productId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}/metered-products/${Uri.encodeComponent(productId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a Deadline Cloud monitor. After you delete a monitor, you can
  /// create a new one and attach farms to the monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier of the monitor to delete. This ID is returned by the
  /// <code>CreateMonitor</code> operation, and is included in the response to
  /// the <code>GetMonitor</code> operation.
  Future<void> deleteMonitor({
    required String monitorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The ID of the farm from which to remove the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue to delete.
  Future<void> deleteQueue({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a queue environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm from which to remove the queue environment.
  ///
  /// Parameter [queueEnvironmentId] :
  /// The queue environment ID of the queue environment to delete.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue environment to delete.
  Future<void> deleteQueueEnvironment({
    required String farmId,
    required String queueEnvironmentId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments/${Uri.encodeComponent(queueEnvironmentId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a queue-fleet association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that holds the queue-fleet association.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the queue-fleet association.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue-fleet association.
  Future<void> deleteQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a storage profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm from which to remove the storage profile.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID of the storage profile to delete.
  Future<void> deleteStorageProfile({
    required String farmId,
    required String storageProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the worker to delete.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker to delete.
  ///
  /// Parameter [workerId] :
  /// The worker ID of the worker to delete.
  Future<void> deleteWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member from a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm to disassociate from the member.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a farm.
  Future<void> disassociateMemberFromFarm({
    required String farmId,
    required String principalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member from a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleet to disassociate a member from.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet to from which to disassociate a member.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a fleet.
  Future<void> disassociateMemberFromFleet({
    required String farmId,
    required String fleetId,
    required String principalId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member from a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the job to disassociate from the member.
  ///
  /// Parameter [jobId] :
  /// The job ID to disassociate from a member in a job.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a job.
  ///
  /// Parameter [queueId] :
  /// The queue ID connected to a job for which you're disassociating a member.
  Future<void> disassociateMemberFromJob({
    required String farmId,
    required String jobId,
    required String principalId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociates a member from a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue to disassociate from a member.
  ///
  /// Parameter [principalId] :
  /// A member's principal ID to disassociate from a queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue in which you're disassociating from a member.
  Future<void> disassociateMemberFromQueue({
    required String farmId,
    required String principalId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/members/${Uri.encodeComponent(principalId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Get a budget.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [budgetId] :
  /// The budget ID.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm connected to the budget.
  Future<GetBudgetResponse> getBudget({
    required String budgetId,
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets/${Uri.encodeComponent(budgetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetBudgetResponse.fromJson(response);
  }

  /// Get a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm.
  Future<GetFarmResponse> getFarm({
    required String farmId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFarmResponse.fromJson(response);
  }

  /// Get a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm in the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the fleet to get.
  Future<GetFleetResponse> getFleet({
    required String farmId,
    required String fleetId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetFleetResponse.fromJson(response);
  }

  /// Gets a Deadline Cloud job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm in the job.
  ///
  /// Parameter [jobId] :
  /// The job ID.
  ///
  /// Parameter [queueId] :
  /// The queue ID associated with the job.
  Future<GetJobResponse> getJob({
    required String farmId,
    required String jobId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetJobResponse.fromJson(response);
  }

  /// Gets a licence endpoint.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID.
  Future<GetLicenseEndpointResponse> getLicenseEndpoint({
    required String licenseEndpointId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetLicenseEndpointResponse.fromJson(response);
  }

  /// Gets information about the specified monitor.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier for the monitor. This ID is returned by the
  /// <code>CreateMonitor</code> operation.
  Future<GetMonitorResponse> getMonitor({
    required String monitorId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetMonitorResponse.fromJson(response);
  }

  /// Gets a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm in the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue to retrieve.
  Future<GetQueueResponse> getQueue({
    required String farmId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueResponse.fromJson(response);
  }

  /// Gets a queue environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue environment.
  ///
  /// Parameter [queueEnvironmentId] :
  /// The queue environment ID.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue environment.
  Future<GetQueueEnvironmentResponse> getQueueEnvironment({
    required String farmId,
    required String queueEnvironmentId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments/${Uri.encodeComponent(queueEnvironmentId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueEnvironmentResponse.fromJson(response);
  }

  /// Gets a queue-fleet association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm that contains the queue-fleet association.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID for the queue-fleet association.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue-fleet association.
  Future<GetQueueFleetAssociationResponse> getQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetQueueFleetAssociationResponse.fromJson(response);
  }

  /// Gets a session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session.
  ///
  /// Parameter [jobId] :
  /// The job ID for the session.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the session.
  ///
  /// Parameter [sessionId] :
  /// The session ID.
  Future<GetSessionResponse> getSession({
    required String farmId,
    required String jobId,
    required String queueId,
    required String sessionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/sessions/${Uri.encodeComponent(sessionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionResponse.fromJson(response);
  }

  /// Gets a session action for the job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session action.
  ///
  /// Parameter [jobId] :
  /// The job ID for the session.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the session action.
  ///
  /// Parameter [sessionActionId] :
  /// The session action ID for the session.
  Future<GetSessionActionResponse> getSessionAction({
    required String farmId,
    required String jobId,
    required String queueId,
    required String sessionActionId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/session-actions/${Uri.encodeComponent(sessionActionId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionActionResponse.fromJson(response);
  }

  /// Gets a set of statistics for queues or farms. Before you can call the
  /// <code>GetSessionStatisticsAggregation</code> operation, you must first
  /// call the <code>StartSessionsStatisticsAggregation</code> operation.
  /// Statistics are available for 1 hour after you call the
  /// <code>StartSessionsStatisticsAggregation</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [aggregationId] :
  /// The identifier returned by the
  /// <code>StartSessionsStatisticsAggregation</code> operation that identifies
  /// the aggregated statistics.
  ///
  /// Parameter [farmId] :
  /// The identifier of the farm to include in the statistics. This should be
  /// the same as the farm ID used in the call to the
  /// <code>StartSessionsStatisticsAggregation</code> operation.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<GetSessionsStatisticsAggregationResponse>
      getSessionsStatisticsAggregation({
    required String aggregationId,
    required String farmId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      'aggregationId': [aggregationId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/sessions-statistics-aggregation',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return GetSessionsStatisticsAggregationResponse.fromJson(response);
  }

  /// Gets a step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the step.
  ///
  /// Parameter [jobId] :
  /// The job ID for the step.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the step.
  ///
  /// Parameter [stepId] :
  /// The step ID.
  Future<GetStepResponse> getStep({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStepResponse.fromJson(response);
  }

  /// Gets a storage profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the storage profile.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID.
  Future<GetStorageProfileResponse> getStorageProfile({
    required String farmId,
    required String storageProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStorageProfileResponse.fromJson(response);
  }

  /// Gets a storage profile for a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue in storage profile.
  ///
  /// Parameter [queueId] :
  /// The queue ID the queue in the storage profile.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID for the storage profile in the queue.
  Future<GetStorageProfileForQueueResponse> getStorageProfileForQueue({
    required String farmId,
    required String queueId,
    required String storageProfileId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetStorageProfileForQueueResponse.fromJson(response);
  }

  /// Gets a task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the farm connected to the task.
  ///
  /// Parameter [jobId] :
  /// The job ID of the job connected to the task.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue connected to the task.
  ///
  /// Parameter [stepId] :
  /// The step ID for the step connected to the task.
  ///
  /// Parameter [taskId] :
  /// The task ID.
  Future<GetTaskResponse> getTask({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    required String taskId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/tasks/${Uri.encodeComponent(taskId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetTaskResponse.fromJson(response);
  }

  /// Gets a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the worker.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the worker.
  ///
  /// Parameter [workerId] :
  /// The worker ID.
  Future<GetWorkerResponse> getWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return GetWorkerResponse.fromJson(response);
  }

  /// A list of the available metered products.
  ///
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListAvailableMeteredProductsResponse> listAvailableMeteredProducts({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/metered-products',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListAvailableMeteredProductsResponse.fromJson(response);
  }

  /// A list of budgets in a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID associated with the budgets.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [status] :
  /// The status to list for the budgets.
  Future<ListBudgetsResponse> listBudgets({
    required String farmId,
    int? maxResults,
    String? nextToken,
    BudgetStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListBudgetsResponse.fromJson(response);
  }

  /// Lists the members of a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListFarmMembersResponse> listFarmMembers({
    required String farmId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFarmMembersResponse.fromJson(response);
  }

  /// Lists farms.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the member to list on the farm.
  Future<ListFarmsResponse> listFarms({
    int? maxResults,
    String? nextToken,
    String? principalId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalId != null) 'principalId': [principalId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFarmsResponse.fromJson(response);
  }

  /// Lists fleet members.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleet.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListFleetMembersResponse> listFleetMembers({
    required String farmId,
    required String fleetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetMembersResponse.fromJson(response);
  }

  /// Lists fleets.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the fleets.
  ///
  /// Parameter [displayName] :
  /// The display names of a list of fleets.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the members to include in the fleet.
  ///
  /// Parameter [status] :
  /// The status of the fleet.
  Future<ListFleetsResponse> listFleets({
    required String farmId,
    String? displayName,
    int? maxResults,
    String? nextToken,
    String? principalId,
    FleetStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (displayName != null) 'displayName': [displayName],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalId != null) 'principalId': [principalId],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListFleetsResponse.fromJson(response);
  }

  /// Lists members on a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to list.
  ///
  /// Parameter [jobId] :
  /// The job ID to include on the list.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListJobMembersResponse> listJobMembers({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobMembersResponse.fromJson(response);
  }

  /// Lists jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the jobs.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the job.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID of the members on the jobs.
  Future<ListJobsResponse> listJobs({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
    String? principalId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalId != null) 'principalId': [principalId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListJobsResponse.fromJson(response);
  }

  /// Lists license endpoints.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListLicenseEndpointsResponse> listLicenseEndpoints({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/license-endpoints',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListLicenseEndpointsResponse.fromJson(response);
  }

  /// Lists metered products.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID to include on the list of metered products.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListMeteredProductsResponse> listMeteredProducts({
    required String licenseEndpointId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}/metered-products',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMeteredProductsResponse.fromJson(response);
  }

  /// Gets a list of your monitors in Deadline Cloud.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListMonitorsResponse> listMonitors({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/monitors',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListMonitorsResponse.fromJson(response);
  }

  /// Lists queue environments.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue environment list.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue environment list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListQueueEnvironmentsResponse> listQueueEnvironments({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueEnvironmentsResponse.fromJson(response);
  }

  /// Lists queue-fleet associations.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue-fleet association list.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID for the queue-fleet association list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the queue-fleet association list.
  Future<ListQueueFleetAssociationsResponse> listQueueFleetAssociations({
    required String farmId,
    String? fleetId,
    int? maxResults,
    String? nextToken,
    String? queueId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (fleetId != null) 'fleetId': [fleetId],
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (queueId != null) 'queueId': [queueId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueFleetAssociationsResponse.fromJson(response);
  }

  /// Lists the members in a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListQueueMembersResponse> listQueueMembers({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/members',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueueMembersResponse.fromJson(response);
  }

  /// Lists queues.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [principalId] :
  /// The principal ID. This filter is only valid when using Nimble Studio
  /// credentials and should match the user ID in the credentials of the caller.
  ///
  /// Parameter [status] :
  /// The status of the queues listed.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The queues are active.
  /// </li>
  /// <li>
  /// <code>SCHEDULING</code>–The queues are scheduling.
  /// </li>
  /// <li>
  /// <code>SCHEDULING_BLOCKED</code>–The queue scheduling is blocked for these
  /// queues.
  /// </li>
  /// </ul>
  Future<ListQueuesResponse> listQueues({
    required String farmId,
    int? maxResults,
    String? nextToken,
    String? principalId,
    QueueStatus? status,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (principalId != null) 'principalId': [principalId],
      if (status != null) 'status': [status.toValue()],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListQueuesResponse.fromJson(response);
  }

  /// Lists session actions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session actions list.
  ///
  /// Parameter [jobId] :
  /// The job ID for the session actions list.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the session actions list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  ///
  /// Parameter [sessionId] :
  /// The session ID to include on the sessions action list.
  ///
  /// Parameter [taskId] :
  /// The task ID for the session actions list.
  Future<ListSessionActionsResponse> listSessionActions({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
    String? sessionId,
    String? taskId,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
      if (sessionId != null) 'sessionId': [sessionId],
      if (taskId != null) 'taskId': [taskId],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/session-actions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionActionsResponse.fromJson(response);
  }

  /// Lists sessions.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the list of sessions.
  ///
  /// Parameter [jobId] :
  /// The job ID for the list of sessions.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the list of sessions
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListSessionsResponse> listSessions({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsResponse.fromJson(response);
  }

  /// Lists sessions for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the session.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID for the session.
  ///
  /// Parameter [workerId] :
  /// The worker ID for the session.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListSessionsForWorkerResponse> listSessionsForWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/sessions',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListSessionsForWorkerResponse.fromJson(response);
  }

  /// Lists step consumers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the list of step consumers.
  ///
  /// Parameter [jobId] :
  /// The job ID for the step consumer.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the step consumer.
  ///
  /// Parameter [stepId] :
  /// The step ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStepConsumersResponse> listStepConsumers({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/consumers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStepConsumersResponse.fromJson(response);
  }

  /// Lists the dependencies for a step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID for the step dependencies list.
  ///
  /// Parameter [jobId] :
  /// The job ID for the step dependencies list.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the step dependencies list.
  ///
  /// Parameter [stepId] :
  /// The step ID to include on the list.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStepDependenciesResponse> listStepDependencies({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/dependencies',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStepDependenciesResponse.fromJson(response);
  }

  /// Lists steps for a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to include on the list of steps.
  ///
  /// Parameter [jobId] :
  /// The job ID to include on the list of steps.
  ///
  /// Parameter [queueId] :
  /// The queue ID to include on the list of steps.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStepsResponse> listSteps({
    required String farmId,
    required String jobId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStepsResponse.fromJson(response);
  }

  /// Lists storage profiles.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the storage profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStorageProfilesResponse> listStorageProfiles({
    required String farmId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageProfilesResponse.fromJson(response);
  }

  /// Lists storage profiles for a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue's storage profile.
  ///
  /// Parameter [queueId] :
  /// The queue ID for the storage profile.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListStorageProfilesForQueueResponse> listStorageProfilesForQueue({
    required String farmId,
    required String queueId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/storage-profiles',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStorageProfilesForQueueResponse.fromJson(response);
  }

  /// Lists tags for a resource.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The resource ARN to list tags for.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/2023-10-12/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Lists tasks for a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID connected to the tasks.
  ///
  /// Parameter [jobId] :
  /// The job ID for the tasks.
  ///
  /// Parameter [queueId] :
  /// The queue ID connected to the tasks.
  ///
  /// Parameter [stepId] :
  /// The step ID for the tasks.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListTasksResponse> listTasks({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/tasks',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListTasksResponse.fromJson(response);
  }

  /// Lists workers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID connected to the workers.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID of the workers.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of results to return. Use this parameter with
  /// <code>NextToken</code> to get results as a set of sequential pages.
  ///
  /// Parameter [nextToken] :
  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  Future<ListWorkersResponse> listWorkers({
    required String farmId,
    required String fleetId,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      100,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListWorkersResponse.fromJson(response);
  }

  /// Adds a metered product.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [licenseEndpointId] :
  /// The license endpoint ID to add to the metered product.
  ///
  /// Parameter [productId] :
  /// The product ID to add to the metered product.
  Future<void> putMeteredProduct({
    required String licenseEndpointId,
    required String productId,
  }) async {
    final response = await _protocol.send(
      payload: null,
      method: 'PUT',
      requestUri:
          '/2023-10-12/license-endpoints/${Uri.encodeComponent(licenseEndpointId)}/metered-products/${Uri.encodeComponent(productId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Searches for jobs.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job.
  ///
  /// Parameter [itemOffset] :
  /// Defines how far into the scrollable list to start the return of results.
  ///
  /// Parameter [queueIds] :
  /// The queue ID to use in the job search.
  ///
  /// Parameter [filterExpressions] :
  /// The filter expression, <code>AND</code> or <code>OR</code>, to use when
  /// searching among a group of search strings in a resource.
  /// You can use two groupings per search each within parenthesis
  /// <code>()</code>.
  ///
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of items per page for the resource.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchJobsResponse> searchJobs({
    required String farmId,
    required int itemOffset,
    required List<String> queueIds,
    SearchGroupedFilterExpressions? filterExpressions,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    _s.validateNumRange(
      'itemOffset',
      itemOffset,
      0,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'itemOffset': itemOffset,
      'queueIds': queueIds,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/jobs',
      exceptionFnMap: _exceptionFns,
    );
    return SearchJobsResponse.fromJson(response);
  }

  /// Searches for steps.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to use for the step search.
  ///
  /// Parameter [itemOffset] :
  /// Defines how far into the scrollable list to start the return of results.
  ///
  /// Parameter [queueIds] :
  /// The queue IDs in the step search.
  ///
  /// Parameter [filterExpressions] :
  /// The filter expression, <code>AND</code> or <code>OR</code>, to use when
  /// searching among a group of search strings in a resource.
  /// You can use two groupings per search each within parenthesis
  /// <code>()</code>.
  ///
  ///
  /// Parameter [jobId] :
  /// The job ID to use in the step search.
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of items per page for the resource.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchStepsResponse> searchSteps({
    required String farmId,
    required int itemOffset,
    required List<String> queueIds,
    SearchGroupedFilterExpressions? filterExpressions,
    String? jobId,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    _s.validateNumRange(
      'itemOffset',
      itemOffset,
      0,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'itemOffset': itemOffset,
      'queueIds': queueIds,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (jobId != null) 'jobId': jobId,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/steps',
      exceptionFnMap: _exceptionFns,
    );
    return SearchStepsResponse.fromJson(response);
  }

  /// Searches for tasks.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the task.
  ///
  /// Parameter [itemOffset] :
  /// Defines how far into the scrollable list to start the return of results.
  ///
  /// Parameter [queueIds] :
  /// The queue IDs to include in the search.
  ///
  /// Parameter [filterExpressions] :
  /// The filter expression, <code>AND</code> or <code>OR</code>, to use when
  /// searching among a group of search strings in a resource.
  /// You can use two groupings per search each within parenthesis
  /// <code>()</code>.
  ///
  ///
  /// Parameter [jobId] :
  /// The job ID for the task search.
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of items per page for the resource.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchTasksResponse> searchTasks({
    required String farmId,
    required int itemOffset,
    required List<String> queueIds,
    SearchGroupedFilterExpressions? filterExpressions,
    String? jobId,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    _s.validateNumRange(
      'itemOffset',
      itemOffset,
      0,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'itemOffset': itemOffset,
      'queueIds': queueIds,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (jobId != null) 'jobId': jobId,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/tasks',
      exceptionFnMap: _exceptionFns,
    );
    return SearchTasksResponse.fromJson(response);
  }

  /// Searches for workers.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID in the workers search.
  ///
  /// Parameter [fleetIds] :
  /// The fleet ID of the workers to search for.
  ///
  /// Parameter [itemOffset] :
  /// Defines how far into the scrollable list to start the return of results.
  ///
  /// Parameter [filterExpressions] :
  /// The filter expression, <code>AND</code> or <code>OR</code>, to use when
  /// searching among a group of search strings in a resource.
  /// You can use two groupings per search each within parenthesis
  /// <code>()</code>.
  ///
  ///
  /// Parameter [pageSize] :
  /// Specifies the number of items per page for the resource.
  ///
  /// Parameter [sortExpressions] :
  /// The search terms for a resource.
  Future<SearchWorkersResponse> searchWorkers({
    required String farmId,
    required List<String> fleetIds,
    required int itemOffset,
    SearchGroupedFilterExpressions? filterExpressions,
    int? pageSize,
    List<SearchSortExpression>? sortExpressions,
  }) async {
    _s.validateNumRange(
      'itemOffset',
      itemOffset,
      0,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'pageSize',
      pageSize,
      1,
      100,
    );
    final $payload = <String, dynamic>{
      'fleetIds': fleetIds,
      'itemOffset': itemOffset,
      if (filterExpressions != null) 'filterExpressions': filterExpressions,
      if (pageSize != null) 'pageSize': pageSize,
      if (sortExpressions != null) 'sortExpressions': sortExpressions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/search/workers',
      exceptionFnMap: _exceptionFns,
    );
    return SearchWorkersResponse.fromJson(response);
  }

  /// Starts an asynchronous request for getting aggregated statistics about
  /// queues and farms. Get the statistics using the
  /// <code>GetSessionsStatisticsAggregation</code> operation. Statistics are
  /// available for 1 hour after you call the
  /// <code>StartSessionsStatisticsAggregation</code> operation.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [endTime] :
  /// The Linux timestamp of the date and time that the statistics end.
  ///
  /// Parameter [farmId] :
  /// The identifier of the farm that contains queues or fleets to return
  /// statistics for.
  ///
  /// Parameter [groupBy] :
  /// The field to use to group the statistics.
  ///
  /// Parameter [resourceIds] :
  /// A list of fleet IDs or queue IDs to gather statistics for.
  ///
  /// Parameter [startTime] :
  /// The Linux timestamp of the date and time that the statistics start.
  ///
  /// Parameter [statistics] :
  /// One to four statistics to return.
  ///
  /// Parameter [period] :
  /// The period to aggregate the statistics.
  ///
  /// Parameter [timezone] :
  /// The timezone to use for the statistics. Use UTC notation such as "UTC+8."
  Future<StartSessionsStatisticsAggregationResponse>
      startSessionsStatisticsAggregation({
    required DateTime endTime,
    required String farmId,
    required List<UsageGroupByField> groupBy,
    required SessionsStatisticsResources resourceIds,
    required DateTime startTime,
    required List<UsageStatistic> statistics,
    Period? period,
    String? timezone,
  }) async {
    final $payload = <String, dynamic>{
      'endTime': iso8601ToJson(endTime),
      'groupBy': groupBy.map((e) => e.toValue()).toList(),
      'resourceIds': resourceIds,
      'startTime': iso8601ToJson(startTime),
      'statistics': statistics.map((e) => e.toValue()).toList(),
      if (period != null) 'period': period.toValue(),
      if (timezone != null) 'timezone': timezone,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/sessions-statistics-aggregation',
      exceptionFnMap: _exceptionFns,
    );
    return StartSessionsStatisticsAggregationResponse.fromJson(response);
  }

  /// Tags a resource using the resource's ARN and desired tags.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to apply tags to.
  ///
  /// Parameter [tags] :
  /// Each tag consists of a tag key and a tag value. Tag keys and values are
  /// both required, but tag values can be empty strings.
  Future<void> tagResource({
    required String resourceArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/2023-10-12/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Removes a tag from a resource using the resource's ARN and tag to remove.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource to remove the tag from.
  ///
  /// Parameter [tagKeys] :
  /// They keys of the tag.
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
      requestUri: '/2023-10-12/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a budget that sets spending thresholds for rendering activity.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [budgetId] :
  /// The budget ID to update.
  ///
  /// Parameter [farmId] :
  /// The farm ID of the budget to update.
  ///
  /// Parameter [actionsToAdd] :
  /// The budget actions to add. Budget actions specify what happens when the
  /// budget runs out.
  ///
  /// Parameter [actionsToRemove] :
  /// The budget actions to remove from the budget.
  ///
  /// Parameter [approximateDollarLimit] :
  /// The dollar limit to update on the budget. Based on consumed usage.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [description] :
  /// The description of the budget to update.
  ///
  /// Parameter [displayName] :
  /// The display name of the budget to update.
  ///
  /// Parameter [schedule] :
  /// The schedule to update.
  ///
  /// Parameter [status] :
  /// Updates the status of the budget.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The budget is being evaluated.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>–The budget is inactive. This can include Expired,
  /// Canceled, or deleted Deleted statuses.
  /// </li>
  /// </ul>
  Future<void> updateBudget({
    required String budgetId,
    required String farmId,
    List<BudgetActionToAdd>? actionsToAdd,
    List<BudgetActionToRemove>? actionsToRemove,
    double? approximateDollarLimit,
    String? clientToken,
    String? description,
    String? displayName,
    BudgetSchedule? schedule,
    BudgetStatus? status,
  }) async {
    _s.validateNumRange(
      'approximateDollarLimit',
      approximateDollarLimit,
      0.01,
      1152921504606846976,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (actionsToAdd != null) 'actionsToAdd': actionsToAdd,
      if (actionsToRemove != null) 'actionsToRemove': actionsToRemove,
      if (approximateDollarLimit != null)
        'approximateDollarLimit': approximateDollarLimit,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (schedule != null) 'schedule': schedule,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/budgets/${Uri.encodeComponent(budgetId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a farm.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [description] :
  /// The description of the farm to update.
  ///
  /// Parameter [displayName] :
  /// The display name of the farm to update.
  Future<void> updateFarm({
    required String farmId,
    String? description,
    String? displayName,
  }) async {
    final $payload = <String, dynamic>{
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2023-10-12/farms/${Uri.encodeComponent(farmId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a fleet.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [configuration] :
  /// The fleet configuration to update.
  ///
  /// Parameter [description] :
  /// The description of the fleet to update.
  ///
  /// Parameter [displayName] :
  /// The display name of the fleet to update.
  ///
  /// Parameter [maxWorkerCount] :
  /// The maximum number of workers in the fleet.
  ///
  /// Parameter [minWorkerCount] :
  /// The minimum number of workers in the fleet.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that the fleet's workers assume while running jobs.
  Future<void> updateFleet({
    required String farmId,
    required String fleetId,
    String? clientToken,
    FleetConfiguration? configuration,
    String? description,
    String? displayName,
    int? maxWorkerCount,
    int? minWorkerCount,
    String? roleArn,
  }) async {
    _s.validateNumRange(
      'maxWorkerCount',
      maxWorkerCount,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'minWorkerCount',
      minWorkerCount,
      0,
      2147483647,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (configuration != null) 'configuration': configuration,
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (maxWorkerCount != null) 'maxWorkerCount': maxWorkerCount,
      if (minWorkerCount != null) 'minWorkerCount': minWorkerCount,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a job.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the job to update.
  ///
  /// Parameter [jobId] :
  /// The job ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the job to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [lifecycleStatus] :
  /// The status of a job in its lifecycle.
  ///
  /// Parameter [maxFailedTasksCount] :
  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  ///
  /// Parameter [maxRetriesPerTask] :
  /// The maximum number of retries for a job.
  ///
  /// Parameter [priority] :
  /// The job priority to update.
  ///
  /// Parameter [targetTaskRunStatus] :
  /// The task status to update the job's tasks to.
  Future<void> updateJob({
    required String farmId,
    required String jobId,
    required String queueId,
    String? clientToken,
    UpdateJobLifecycleStatus? lifecycleStatus,
    int? maxFailedTasksCount,
    int? maxRetriesPerTask,
    int? priority,
    JobTargetTaskRunStatus? targetTaskRunStatus,
  }) async {
    _s.validateNumRange(
      'maxFailedTasksCount',
      maxFailedTasksCount,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'maxRetriesPerTask',
      maxRetriesPerTask,
      0,
      2147483647,
    );
    _s.validateNumRange(
      'priority',
      priority,
      0,
      100,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.toValue(),
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (priority != null) 'priority': priority,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Modifies the settings for a Deadline Cloud monitor. You can modify one or
  /// all of the settings when you call <code>UpdateMonitor</code>.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [monitorId] :
  /// The unique identifier of the monitor to update.
  ///
  /// Parameter [displayName] :
  /// The new value to use for the monitor's display name.
  ///
  /// Parameter [roleArn] :
  /// The Amazon Resource Name (ARN) of the new IAM role to use with the
  /// monitor.
  ///
  /// Parameter [subdomain] :
  /// The new value of the subdomain to use when forming the monitor URL.
  Future<void> updateMonitor({
    required String monitorId,
    String? displayName,
    String? roleArn,
    String? subdomain,
  }) async {
    final $payload = <String, dynamic>{
      if (displayName != null) 'displayName': displayName,
      if (roleArn != null) 'roleArn': roleArn,
      if (subdomain != null) 'subdomain': subdomain,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri: '/2023-10-12/monitors/${Uri.encodeComponent(monitorId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a queue.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update in the queue.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [allowedStorageProfileIdsToAdd] :
  /// The storage profile IDs to add.
  ///
  /// Parameter [allowedStorageProfileIdsToRemove] :
  /// The storage profile ID to remove.
  ///
  /// Parameter [clientToken] :
  /// The idempotency token to update in the queue.
  ///
  /// Parameter [defaultBudgetAction] :
  /// The default action to take for a queue update if a budget isn't
  /// configured.
  ///
  /// Parameter [description] :
  /// The description of the queue to update.
  ///
  /// Parameter [displayName] :
  /// The display name of the queue to update.
  ///
  /// Parameter [jobAttachmentSettings] :
  /// The job attachment settings to update for the queue.
  ///
  /// Parameter [jobRunAsUser] :
  /// Update the jobs in the queue to run as a specified POSIX user.
  ///
  /// Parameter [requiredFileSystemLocationNamesToAdd] :
  /// The required file system location names to add to the queue.
  ///
  /// Parameter [requiredFileSystemLocationNamesToRemove] :
  /// The required file system location names to remove from the queue.
  ///
  /// Parameter [roleArn] :
  /// The IAM role ARN that's used to run jobs from this queue.
  Future<void> updateQueue({
    required String farmId,
    required String queueId,
    List<String>? allowedStorageProfileIdsToAdd,
    List<String>? allowedStorageProfileIdsToRemove,
    String? clientToken,
    DefaultQueueBudgetAction? defaultBudgetAction,
    String? description,
    String? displayName,
    JobAttachmentSettings? jobAttachmentSettings,
    JobRunAsUser? jobRunAsUser,
    List<String>? requiredFileSystemLocationNamesToAdd,
    List<String>? requiredFileSystemLocationNamesToRemove,
    String? roleArn,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (allowedStorageProfileIdsToAdd != null)
        'allowedStorageProfileIdsToAdd': allowedStorageProfileIdsToAdd,
      if (allowedStorageProfileIdsToRemove != null)
        'allowedStorageProfileIdsToRemove': allowedStorageProfileIdsToRemove,
      if (defaultBudgetAction != null)
        'defaultBudgetAction': defaultBudgetAction.toValue(),
      if (description != null) 'description': description,
      if (displayName != null) 'displayName': displayName,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (requiredFileSystemLocationNamesToAdd != null)
        'requiredFileSystemLocationNamesToAdd':
            requiredFileSystemLocationNamesToAdd,
      if (requiredFileSystemLocationNamesToRemove != null)
        'requiredFileSystemLocationNamesToRemove':
            requiredFileSystemLocationNamesToRemove,
      if (roleArn != null) 'roleArn': roleArn,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates the queue environment.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID of the queue environment to update.
  ///
  /// Parameter [queueEnvironmentId] :
  /// The queue environment ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID of the queue environment to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [priority] :
  /// The priority to update.
  ///
  /// Parameter [template] :
  /// The template to update.
  ///
  /// Parameter [templateType] :
  /// The template type to update.
  Future<void> updateQueueEnvironment({
    required String farmId,
    required String queueEnvironmentId,
    required String queueId,
    String? clientToken,
    int? priority,
    String? template,
    EnvironmentTemplateType? templateType,
  }) async {
    _s.validateNumRange(
      'priority',
      priority,
      0,
      10000,
    );
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (priority != null) 'priority': priority,
      if (template != null) 'template': template,
      if (templateType != null) 'templateType': templateType.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/environments/${Uri.encodeComponent(queueEnvironmentId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a queue-fleet association.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [status] :
  /// The status to update.
  Future<void> updateQueueFleetAssociation({
    required String farmId,
    required String fleetId,
    required String queueId,
    required UpdateQueueFleetAssociationStatus status,
  }) async {
    final $payload = <String, dynamic>{
      'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queue-fleet-associations/${Uri.encodeComponent(queueId)}/${Uri.encodeComponent(fleetId)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a session.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update in the session.
  ///
  /// Parameter [jobId] :
  /// The job ID to update in the session.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update in the session.
  ///
  /// Parameter [sessionId] :
  /// The session ID to update.
  ///
  /// Parameter [targetLifecycleStatus] :
  /// The life cycle status to update in the session.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> updateSession({
    required String farmId,
    required String jobId,
    required String queueId,
    required String sessionId,
    required SessionLifecycleTargetStatus targetLifecycleStatus,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'targetLifecycleStatus': targetLifecycleStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/sessions/${Uri.encodeComponent(sessionId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a step.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [jobId] :
  /// The job ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [stepId] :
  /// The step ID to update.
  ///
  /// Parameter [targetTaskRunStatus] :
  /// The task status to update the step's tasks to.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> updateStep({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    required StepTargetTaskRunStatus targetTaskRunStatus,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'targetTaskRunStatus': targetTaskRunStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a storage profile.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [storageProfileId] :
  /// The storage profile ID to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  ///
  /// Parameter [displayName] :
  /// The display name of the storage profile to update.
  ///
  /// Parameter [fileSystemLocationsToAdd] :
  /// The file system location names to add.
  ///
  /// Parameter [fileSystemLocationsToRemove] :
  /// The file system location names to remove.
  ///
  /// Parameter [osFamily] :
  /// The OS system to update.
  Future<void> updateStorageProfile({
    required String farmId,
    required String storageProfileId,
    String? clientToken,
    String? displayName,
    List<FileSystemLocation>? fileSystemLocationsToAdd,
    List<FileSystemLocation>? fileSystemLocationsToRemove,
    StorageProfileOperatingSystemFamily? osFamily,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      if (displayName != null) 'displayName': displayName,
      if (fileSystemLocationsToAdd != null)
        'fileSystemLocationsToAdd': fileSystemLocationsToAdd,
      if (fileSystemLocationsToRemove != null)
        'fileSystemLocationsToRemove': fileSystemLocationsToRemove,
      if (osFamily != null) 'osFamily': osFamily.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/storage-profiles/${Uri.encodeComponent(storageProfileId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a task.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [jobId] :
  /// The job ID to update.
  ///
  /// Parameter [queueId] :
  /// The queue ID to update.
  ///
  /// Parameter [stepId] :
  /// The step ID to update.
  ///
  /// Parameter [targetRunStatus] :
  /// The run status with which to start the task.
  ///
  /// Parameter [taskId] :
  /// The task ID to update.
  ///
  /// Parameter [clientToken] :
  /// The unique token which the server uses to recognize retries of the same
  /// request.
  Future<void> updateTask({
    required String farmId,
    required String jobId,
    required String queueId,
    required String stepId,
    required TaskTargetRunStatus targetRunStatus,
    required String taskId,
    String? clientToken,
  }) async {
    final headers = <String, String>{
      if (clientToken != null) 'X-Amz-Client-Token': clientToken.toString(),
    };
    final $payload = <String, dynamic>{
      'targetRunStatus': targetRunStatus.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/queues/${Uri.encodeComponent(queueId)}/jobs/${Uri.encodeComponent(jobId)}/steps/${Uri.encodeComponent(stepId)}/tasks/${Uri.encodeComponent(taskId)}',
      headers: headers,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [workerId] :
  /// The worker ID to update.
  ///
  /// Parameter [capabilities] :
  /// The worker capabilities to update.
  ///
  /// Parameter [hostProperties] :
  /// The host properties to update.
  ///
  /// Parameter [status] :
  /// The worker status to update.
  Future<UpdateWorkerResponse> updateWorker({
    required String farmId,
    required String fleetId,
    required String workerId,
    WorkerCapabilities? capabilities,
    HostPropertiesRequest? hostProperties,
    UpdatedWorkerStatus? status,
  }) async {
    final $payload = <String, dynamic>{
      if (capabilities != null) 'capabilities': capabilities,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (status != null) 'status': status.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkerResponse.fromJson(response);
  }

  /// Updates the schedule for a worker.
  ///
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerErrorException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ConflictException].
  /// May throw [ValidationException].
  ///
  /// Parameter [farmId] :
  /// The farm ID to update.
  ///
  /// Parameter [fleetId] :
  /// The fleet ID to update.
  ///
  /// Parameter [workerId] :
  /// The worker ID to update.
  ///
  /// Parameter [updatedSessionActions] :
  /// The session actions associated with the worker schedule to update.
  Future<UpdateWorkerScheduleResponse> updateWorkerSchedule({
    required String farmId,
    required String fleetId,
    required String workerId,
    Map<String, UpdatedSessionActionInfo>? updatedSessionActions,
  }) async {
    final $payload = <String, dynamic>{
      if (updatedSessionActions != null)
        'updatedSessionActions': updatedSessionActions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'PATCH',
      requestUri:
          '/2023-10-12/farms/${Uri.encodeComponent(farmId)}/fleets/${Uri.encodeComponent(fleetId)}/workers/${Uri.encodeComponent(workerId)}/schedule',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateWorkerScheduleResponse.fromJson(response);
  }
}

/// The range for the GPU fleet acceleration.
class AcceleratorCountRange {
  /// The minimum GPU for the accelerator.
  final int min;

  /// The maximum GPU for the accelerator.
  final int? max;

  AcceleratorCountRange({
    required this.min,
    this.max,
  });

  factory AcceleratorCountRange.fromJson(Map<String, dynamic> json) {
    return AcceleratorCountRange(
      min: json['min'] as int,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

/// The range for memory, in MiB, to use for the accelerator.
class AcceleratorTotalMemoryMiBRange {
  /// The minimum amount of memory to use for the accelerator, measured in MiB.
  final int min;

  /// The maximum amount of memory to use for the accelerator, measured in MiB.
  final int? max;

  AcceleratorTotalMemoryMiBRange({
    required this.min,
    this.max,
  });

  factory AcceleratorTotalMemoryMiBRange.fromJson(Map<String, dynamic> json) {
    return AcceleratorTotalMemoryMiBRange(
      min: json['min'] as int,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

enum AcceleratorType {
  gpu,
}

extension AcceleratorTypeValueExtension on AcceleratorType {
  String toValue() {
    switch (this) {
      case AcceleratorType.gpu:
        return 'gpu';
    }
  }
}

extension AcceleratorTypeFromString on String {
  AcceleratorType toAcceleratorType() {
    switch (this) {
      case 'gpu':
        return AcceleratorType.gpu;
    }
    throw Exception('$this is not known in enum AcceleratorType');
  }
}

/// The assigned starting environment for a worker during session.
class AssignedEnvironmentEnterSessionActionDefinition {
  /// The environment ID of the assigned environment at the start of a session.
  final String environmentId;

  AssignedEnvironmentEnterSessionActionDefinition({
    required this.environmentId,
  });

  factory AssignedEnvironmentEnterSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedEnvironmentEnterSessionActionDefinition(
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

/// The assigned environment when a worker exits a session.
class AssignedEnvironmentExitSessionActionDefinition {
  /// The environment ID of the assigned environment when exiting a session.
  final String environmentId;

  AssignedEnvironmentExitSessionActionDefinition({
    required this.environmentId,
  });

  factory AssignedEnvironmentExitSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedEnvironmentExitSessionActionDefinition(
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

/// The assigned session for the worker.
class AssignedSession {
  /// The job ID for the assigned session.
  final String jobId;

  /// The log configuration for the worker's assigned session.
  final LogConfiguration logConfiguration;

  /// The queue ID of the assigned session.
  final String queueId;

  /// The session actions to apply to the assigned session.
  final List<AssignedSessionAction> sessionActions;

  AssignedSession({
    required this.jobId,
    required this.logConfiguration,
    required this.queueId,
    required this.sessionActions,
  });

  factory AssignedSession.fromJson(Map<String, dynamic> json) {
    return AssignedSession(
      jobId: json['jobId'] as String,
      logConfiguration: LogConfiguration.fromJson(
          json['logConfiguration'] as Map<String, dynamic>),
      queueId: json['queueId'] as String,
      sessionActions: (json['sessionActions'] as List)
          .whereNotNull()
          .map((e) => AssignedSessionAction.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final logConfiguration = this.logConfiguration;
    final queueId = this.queueId;
    final sessionActions = this.sessionActions;
    return {
      'jobId': jobId,
      'logConfiguration': logConfiguration,
      'queueId': queueId,
      'sessionActions': sessionActions,
    };
  }
}

/// The action for a session defined by the session action ID.
class AssignedSessionAction {
  /// The definition of the assigned session action.
  final AssignedSessionActionDefinition definition;

  /// The session action ID for the assigned session.
  final String sessionActionId;

  AssignedSessionAction({
    required this.definition,
    required this.sessionActionId,
  });

  factory AssignedSessionAction.fromJson(Map<String, dynamic> json) {
    return AssignedSessionAction(
      definition: AssignedSessionActionDefinition.fromJson(
          json['definition'] as Map<String, dynamic>),
      sessionActionId: json['sessionActionId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final sessionActionId = this.sessionActionId;
    return {
      'definition': definition,
      'sessionActionId': sessionActionId,
    };
  }
}

/// The definition of the assigned session action.
class AssignedSessionActionDefinition {
  /// The environment a session starts on.
  final AssignedEnvironmentEnterSessionActionDefinition? envEnter;

  /// The environment a session exits from.
  final AssignedEnvironmentExitSessionActionDefinition? envExit;

  /// The job attachment to sync with an assigned session action.
  final AssignedSyncInputJobAttachmentsSessionActionDefinition?
      syncInputJobAttachments;

  /// The task run.
  final AssignedTaskRunSessionActionDefinition? taskRun;

  AssignedSessionActionDefinition({
    this.envEnter,
    this.envExit,
    this.syncInputJobAttachments,
    this.taskRun,
  });

  factory AssignedSessionActionDefinition.fromJson(Map<String, dynamic> json) {
    return AssignedSessionActionDefinition(
      envEnter: json['envEnter'] != null
          ? AssignedEnvironmentEnterSessionActionDefinition.fromJson(
              json['envEnter'] as Map<String, dynamic>)
          : null,
      envExit: json['envExit'] != null
          ? AssignedEnvironmentExitSessionActionDefinition.fromJson(
              json['envExit'] as Map<String, dynamic>)
          : null,
      syncInputJobAttachments: json['syncInputJobAttachments'] != null
          ? AssignedSyncInputJobAttachmentsSessionActionDefinition.fromJson(
              json['syncInputJobAttachments'] as Map<String, dynamic>)
          : null,
      taskRun: json['taskRun'] != null
          ? AssignedTaskRunSessionActionDefinition.fromJson(
              json['taskRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envEnter = this.envEnter;
    final envExit = this.envExit;
    final syncInputJobAttachments = this.syncInputJobAttachments;
    final taskRun = this.taskRun;
    return {
      if (envEnter != null) 'envEnter': envEnter,
      if (envExit != null) 'envExit': envExit,
      if (syncInputJobAttachments != null)
        'syncInputJobAttachments': syncInputJobAttachments,
      if (taskRun != null) 'taskRun': taskRun,
    };
  }
}

/// The details for an assigned session action as it relates to a job
/// attachment.
class AssignedSyncInputJobAttachmentsSessionActionDefinition {
  /// The step ID.
  final String? stepId;

  AssignedSyncInputJobAttachmentsSessionActionDefinition({
    this.stepId,
  });

  factory AssignedSyncInputJobAttachmentsSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedSyncInputJobAttachmentsSessionActionDefinition(
      stepId: json['stepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    return {
      if (stepId != null) 'stepId': stepId,
    };
  }
}

/// The specific task, step, and parameters to include.
class AssignedTaskRunSessionActionDefinition {
  /// The parameters to include.
  final Map<String, TaskParameterValue> parameters;

  /// The step ID.
  final String stepId;

  /// The task ID.
  final String taskId;

  AssignedTaskRunSessionActionDefinition({
    required this.parameters,
    required this.stepId,
    required this.taskId,
  });

  factory AssignedTaskRunSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return AssignedTaskRunSessionActionDefinition(
      parameters: (json['parameters'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      stepId: json['stepId'] as String,
      taskId: json['taskId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'parameters': parameters,
      'stepId': stepId,
      'taskId': taskId,
    };
  }
}

class AssociateMemberToFarmResponse {
  AssociateMemberToFarmResponse();

  factory AssociateMemberToFarmResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateMemberToFleetResponse {
  AssociateMemberToFleetResponse();

  factory AssociateMemberToFleetResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateMemberToJobResponse {
  AssociateMemberToJobResponse();

  factory AssociateMemberToJobResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateMemberToQueueResponse {
  AssociateMemberToQueueResponse();

  factory AssociateMemberToQueueResponse.fromJson(Map<String, dynamic> _) {
    return AssociateMemberToQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssumeFleetRoleForReadResponse {
  /// The credentials for the fleet role.
  final AwsCredentials credentials;

  AssumeFleetRoleForReadResponse({
    required this.credentials,
  });

  factory AssumeFleetRoleForReadResponse.fromJson(Map<String, dynamic> json) {
    return AssumeFleetRoleForReadResponse(
      credentials:
          AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class AssumeFleetRoleForWorkerResponse {
  /// The credentials for the worker.
  final AwsCredentials credentials;

  AssumeFleetRoleForWorkerResponse({
    required this.credentials,
  });

  factory AssumeFleetRoleForWorkerResponse.fromJson(Map<String, dynamic> json) {
    return AssumeFleetRoleForWorkerResponse(
      credentials:
          AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class AssumeQueueRoleForReadResponse {
  /// The credentials for the queue role.
  final AwsCredentials credentials;

  AssumeQueueRoleForReadResponse({
    required this.credentials,
  });

  factory AssumeQueueRoleForReadResponse.fromJson(Map<String, dynamic> json) {
    return AssumeQueueRoleForReadResponse(
      credentials:
          AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class AssumeQueueRoleForUserResponse {
  /// The credentials for the queue role that a user has access to.
  final AwsCredentials credentials;

  AssumeQueueRoleForUserResponse({
    required this.credentials,
  });

  factory AssumeQueueRoleForUserResponse.fromJson(Map<String, dynamic> json) {
    return AssumeQueueRoleForUserResponse(
      credentials:
          AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      'credentials': credentials,
    };
  }
}

class AssumeQueueRoleForWorkerResponse {
  /// The Amazon Web Services credentials for the role that the worker is
  /// assuming.
  final AwsCredentials? credentials;

  AssumeQueueRoleForWorkerResponse({
    this.credentials,
  });

  factory AssumeQueueRoleForWorkerResponse.fromJson(Map<String, dynamic> json) {
    return AssumeQueueRoleForWorkerResponse(
      credentials: json['credentials'] != null
          ? AwsCredentials.fromJson(json['credentials'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final credentials = this.credentials;
    return {
      if (credentials != null) 'credentials': credentials,
    };
  }
}

/// The attachments for jobs.
class Attachments {
  /// A list of manifests which describe job attachment configurations.
  final List<ManifestProperties> manifests;

  /// The file system.
  final JobAttachmentsFileSystem? fileSystem;

  Attachments({
    required this.manifests,
    this.fileSystem,
  });

  factory Attachments.fromJson(Map<String, dynamic> json) {
    return Attachments(
      manifests: (json['manifests'] as List)
          .whereNotNull()
          .map((e) => ManifestProperties.fromJson(e as Map<String, dynamic>))
          .toList(),
      fileSystem: (json['fileSystem'] as String?)?.toJobAttachmentsFileSystem(),
    );
  }

  Map<String, dynamic> toJson() {
    final manifests = this.manifests;
    final fileSystem = this.fileSystem;
    return {
      'manifests': manifests,
      if (fileSystem != null) 'fileSystem': fileSystem.toValue(),
    };
  }
}

enum AutoScalingMode {
  noScaling,
  eventBasedAutoScaling,
}

extension AutoScalingModeValueExtension on AutoScalingMode {
  String toValue() {
    switch (this) {
      case AutoScalingMode.noScaling:
        return 'NO_SCALING';
      case AutoScalingMode.eventBasedAutoScaling:
        return 'EVENT_BASED_AUTO_SCALING';
    }
  }
}

extension AutoScalingModeFromString on String {
  AutoScalingMode toAutoScalingMode() {
    switch (this) {
      case 'NO_SCALING':
        return AutoScalingMode.noScaling;
      case 'EVENT_BASED_AUTO_SCALING':
        return AutoScalingMode.eventBasedAutoScaling;
    }
    throw Exception('$this is not known in enum AutoScalingMode');
  }
}

enum AutoScalingStatus {
  growing,
  steady,
  shrinking,
}

extension AutoScalingStatusValueExtension on AutoScalingStatus {
  String toValue() {
    switch (this) {
      case AutoScalingStatus.growing:
        return 'GROWING';
      case AutoScalingStatus.steady:
        return 'STEADY';
      case AutoScalingStatus.shrinking:
        return 'SHRINKING';
    }
  }
}

extension AutoScalingStatusFromString on String {
  AutoScalingStatus toAutoScalingStatus() {
    switch (this) {
      case 'GROWING':
        return AutoScalingStatus.growing;
      case 'STEADY':
        return AutoScalingStatus.steady;
      case 'SHRINKING':
        return AutoScalingStatus.shrinking;
    }
    throw Exception('$this is not known in enum AutoScalingStatus');
  }
}

/// The Identity and Access Management credentials.
class AwsCredentials {
  /// The IAM access key ID.
  final String accessKeyId;

  /// The expiration date and time of the IAM credentials.
  final DateTime expiration;

  /// The IAM secret access key.
  final String secretAccessKey;

  /// The IAM session token
  final String sessionToken;

  AwsCredentials({
    required this.accessKeyId,
    required this.expiration,
    required this.secretAccessKey,
    required this.sessionToken,
  });

  factory AwsCredentials.fromJson(Map<String, dynamic> json) {
    return AwsCredentials(
      accessKeyId: json['accessKeyId'] as String,
      expiration: nonNullableTimeStampFromJson(json['expiration'] as Object),
      secretAccessKey: json['secretAccessKey'] as String,
      sessionToken: json['sessionToken'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final accessKeyId = this.accessKeyId;
    final expiration = this.expiration;
    final secretAccessKey = this.secretAccessKey;
    final sessionToken = this.sessionToken;
    return {
      'accessKeyId': accessKeyId,
      'expiration': iso8601ToJson(expiration),
      'secretAccessKey': secretAccessKey,
      'sessionToken': sessionToken,
    };
  }
}

class BatchGetJobEntityResponse {
  /// A list of the job entities, or details, in the batch.
  final List<JobEntity> entities;

  /// A list of errors from the job error logs for the batch.
  final List<GetJobEntityError> errors;

  BatchGetJobEntityResponse({
    required this.entities,
    required this.errors,
  });

  factory BatchGetJobEntityResponse.fromJson(Map<String, dynamic> json) {
    return BatchGetJobEntityResponse(
      entities: (json['entities'] as List)
          .whereNotNull()
          .map((e) => JobEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      errors: (json['errors'] as List)
          .whereNotNull()
          .map((e) => GetJobEntityError.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final entities = this.entities;
    final errors = this.errors;
    return {
      'entities': entities,
      'errors': errors,
    };
  }
}

/// The budget action to add.
class BudgetActionToAdd {
  /// The percentage threshold for the budget action to add.
  final double thresholdPercentage;

  /// The type of budget action to add.
  final BudgetActionType type;

  /// A description for the budget action to add.
  final String? description;

  BudgetActionToAdd({
    required this.thresholdPercentage,
    required this.type,
    this.description,
  });

  Map<String, dynamic> toJson() {
    final thresholdPercentage = this.thresholdPercentage;
    final type = this.type;
    final description = this.description;
    return {
      'thresholdPercentage': thresholdPercentage,
      'type': type.toValue(),
      if (description != null) 'description': description,
    };
  }
}

/// The budget action to remove.
class BudgetActionToRemove {
  /// The percentage threshold for the budget action to remove.
  final double thresholdPercentage;

  /// The type of budget action to remove.
  final BudgetActionType type;

  BudgetActionToRemove({
    required this.thresholdPercentage,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    final thresholdPercentage = this.thresholdPercentage;
    final type = this.type;
    return {
      'thresholdPercentage': thresholdPercentage,
      'type': type.toValue(),
    };
  }
}

enum BudgetActionType {
  stopSchedulingAndCompleteTasks,
  stopSchedulingAndCancelTasks,
}

extension BudgetActionTypeValueExtension on BudgetActionType {
  String toValue() {
    switch (this) {
      case BudgetActionType.stopSchedulingAndCompleteTasks:
        return 'STOP_SCHEDULING_AND_COMPLETE_TASKS';
      case BudgetActionType.stopSchedulingAndCancelTasks:
        return 'STOP_SCHEDULING_AND_CANCEL_TASKS';
    }
  }
}

extension BudgetActionTypeFromString on String {
  BudgetActionType toBudgetActionType() {
    switch (this) {
      case 'STOP_SCHEDULING_AND_COMPLETE_TASKS':
        return BudgetActionType.stopSchedulingAndCompleteTasks;
      case 'STOP_SCHEDULING_AND_CANCEL_TASKS':
        return BudgetActionType.stopSchedulingAndCancelTasks;
    }
    throw Exception('$this is not known in enum BudgetActionType');
  }
}

/// The start and end time of the budget.
class BudgetSchedule {
  /// The fixed start and end time of the budget's schedule.
  final FixedBudgetSchedule? fixed;

  BudgetSchedule({
    this.fixed,
  });

  factory BudgetSchedule.fromJson(Map<String, dynamic> json) {
    return BudgetSchedule(
      fixed: json['fixed'] != null
          ? FixedBudgetSchedule.fromJson(json['fixed'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fixed = this.fixed;
    return {
      if (fixed != null) 'fixed': fixed,
    };
  }
}

enum BudgetStatus {
  active,
  inactive,
}

extension BudgetStatusValueExtension on BudgetStatus {
  String toValue() {
    switch (this) {
      case BudgetStatus.active:
        return 'ACTIVE';
      case BudgetStatus.inactive:
        return 'INACTIVE';
    }
  }
}

extension BudgetStatusFromString on String {
  BudgetStatus toBudgetStatus() {
    switch (this) {
      case 'ACTIVE':
        return BudgetStatus.active;
      case 'INACTIVE':
        return BudgetStatus.inactive;
    }
    throw Exception('$this is not known in enum BudgetStatus');
  }
}

/// The budget summary.
class BudgetSummary {
  /// The approximate dollar limit of the budget.
  final double approximateDollarLimit;

  /// The budget ID.
  final String budgetId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the budget summary to update.
  final String displayName;

  /// The status of the budget.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The budget is being evaluated.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>–The budget is inactive. This can include Expired,
  /// Canceled, or deleted Deleted statuses.
  /// </li>
  /// </ul>
  final BudgetStatus status;

  /// The resource used to track expenditure in the budget.
  final UsageTrackingResource usageTrackingResource;

  /// The consumed usage for the budget.
  final ConsumedUsages usages;

  /// The description of the budget summary.
  final String? description;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  BudgetSummary({
    required this.approximateDollarLimit,
    required this.budgetId,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.status,
    required this.usageTrackingResource,
    required this.usages,
    this.description,
    this.updatedAt,
    this.updatedBy,
  });

  factory BudgetSummary.fromJson(Map<String, dynamic> json) {
    return BudgetSummary(
      approximateDollarLimit: json['approximateDollarLimit'] as double,
      budgetId: json['budgetId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      status: (json['status'] as String).toBudgetStatus(),
      usageTrackingResource: UsageTrackingResource.fromJson(
          json['usageTrackingResource'] as Map<String, dynamic>),
      usages: ConsumedUsages.fromJson(json['usages'] as Map<String, dynamic>),
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateDollarLimit = this.approximateDollarLimit;
    final budgetId = this.budgetId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final status = this.status;
    final usageTrackingResource = this.usageTrackingResource;
    final usages = this.usages;
    final description = this.description;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'approximateDollarLimit': approximateDollarLimit,
      'budgetId': budgetId,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'status': status.toValue(),
      'usageTrackingResource': usageTrackingResource,
      'usages': usages,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum ComparisonOperator {
  equal,
  notEqual,
  greaterThanEqualTo,
  greaterThan,
  lessThanEqualTo,
  lessThan,
}

extension ComparisonOperatorValueExtension on ComparisonOperator {
  String toValue() {
    switch (this) {
      case ComparisonOperator.equal:
        return 'EQUAL';
      case ComparisonOperator.notEqual:
        return 'NOT_EQUAL';
      case ComparisonOperator.greaterThanEqualTo:
        return 'GREATER_THAN_EQUAL_TO';
      case ComparisonOperator.greaterThan:
        return 'GREATER_THAN';
      case ComparisonOperator.lessThanEqualTo:
        return 'LESS_THAN_EQUAL_TO';
      case ComparisonOperator.lessThan:
        return 'LESS_THAN';
    }
  }
}

extension ComparisonOperatorFromString on String {
  ComparisonOperator toComparisonOperator() {
    switch (this) {
      case 'EQUAL':
        return ComparisonOperator.equal;
      case 'NOT_EQUAL':
        return ComparisonOperator.notEqual;
      case 'GREATER_THAN_EQUAL_TO':
        return ComparisonOperator.greaterThanEqualTo;
      case 'GREATER_THAN':
        return ComparisonOperator.greaterThan;
      case 'LESS_THAN_EQUAL_TO':
        return ComparisonOperator.lessThanEqualTo;
      case 'LESS_THAN':
        return ComparisonOperator.lessThan;
    }
    throw Exception('$this is not known in enum ComparisonOperator');
  }
}

enum CompletedStatus {
  succeeded,
  failed,
  interrupted,
  canceled,
  neverAttempted,
}

extension CompletedStatusValueExtension on CompletedStatus {
  String toValue() {
    switch (this) {
      case CompletedStatus.succeeded:
        return 'SUCCEEDED';
      case CompletedStatus.failed:
        return 'FAILED';
      case CompletedStatus.interrupted:
        return 'INTERRUPTED';
      case CompletedStatus.canceled:
        return 'CANCELED';
      case CompletedStatus.neverAttempted:
        return 'NEVER_ATTEMPTED';
    }
  }
}

extension CompletedStatusFromString on String {
  CompletedStatus toCompletedStatus() {
    switch (this) {
      case 'SUCCEEDED':
        return CompletedStatus.succeeded;
      case 'FAILED':
        return CompletedStatus.failed;
      case 'INTERRUPTED':
        return CompletedStatus.interrupted;
      case 'CANCELED':
        return CompletedStatus.canceled;
      case 'NEVER_ATTEMPTED':
        return CompletedStatus.neverAttempted;
    }
    throw Exception('$this is not known in enum CompletedStatus');
  }
}

/// The consumed usage for the resource.
class ConsumedUsages {
  /// The amount of the budget consumed.
  final double approximateDollarUsage;

  ConsumedUsages({
    required this.approximateDollarUsage,
  });

  factory ConsumedUsages.fromJson(Map<String, dynamic> json) {
    return ConsumedUsages(
      approximateDollarUsage: json['approximateDollarUsage'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    final approximateDollarUsage = this.approximateDollarUsage;
    return {
      'approximateDollarUsage': approximateDollarUsage,
    };
  }
}

class CopyJobTemplateResponse {
  /// The format of the job template, either <code>JSON</code> or
  /// <code>YAML</code>.
  final JobTemplateType templateType;

  CopyJobTemplateResponse({
    required this.templateType,
  });

  factory CopyJobTemplateResponse.fromJson(Map<String, dynamic> json) {
    return CopyJobTemplateResponse(
      templateType: (json['templateType'] as String).toJobTemplateType(),
    );
  }

  Map<String, dynamic> toJson() {
    final templateType = this.templateType;
    return {
      'templateType': templateType.toValue(),
    };
  }
}

enum CpuArchitectureType {
  x86_64,
  arm64,
}

extension CpuArchitectureTypeValueExtension on CpuArchitectureType {
  String toValue() {
    switch (this) {
      case CpuArchitectureType.x86_64:
        return 'x86_64';
      case CpuArchitectureType.arm64:
        return 'arm64';
    }
  }
}

extension CpuArchitectureTypeFromString on String {
  CpuArchitectureType toCpuArchitectureType() {
    switch (this) {
      case 'x86_64':
        return CpuArchitectureType.x86_64;
      case 'arm64':
        return CpuArchitectureType.arm64;
    }
    throw Exception('$this is not known in enum CpuArchitectureType');
  }
}

class CreateBudgetResponse {
  /// The budget ID.
  final String budgetId;

  CreateBudgetResponse({
    required this.budgetId,
  });

  factory CreateBudgetResponse.fromJson(Map<String, dynamic> json) {
    return CreateBudgetResponse(
      budgetId: json['budgetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final budgetId = this.budgetId;
    return {
      'budgetId': budgetId,
    };
  }
}

class CreateFarmResponse {
  /// The farm ID.
  final String farmId;

  CreateFarmResponse({
    required this.farmId,
  });

  factory CreateFarmResponse.fromJson(Map<String, dynamic> json) {
    return CreateFarmResponse(
      farmId: json['farmId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    return {
      'farmId': farmId,
    };
  }
}

class CreateFleetResponse {
  /// The fleet ID.
  final String fleetId;

  CreateFleetResponse({
    required this.fleetId,
  });

  factory CreateFleetResponse.fromJson(Map<String, dynamic> json) {
    return CreateFleetResponse(
      fleetId: json['fleetId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    return {
      'fleetId': fleetId,
    };
  }
}

class CreateJobResponse {
  /// The job ID.
  final String jobId;

  CreateJobResponse({
    required this.jobId,
  });

  factory CreateJobResponse.fromJson(Map<String, dynamic> json) {
    return CreateJobResponse(
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

enum CreateJobTargetTaskRunStatus {
  ready,
  suspended,
}

extension CreateJobTargetTaskRunStatusValueExtension
    on CreateJobTargetTaskRunStatus {
  String toValue() {
    switch (this) {
      case CreateJobTargetTaskRunStatus.ready:
        return 'READY';
      case CreateJobTargetTaskRunStatus.suspended:
        return 'SUSPENDED';
    }
  }
}

extension CreateJobTargetTaskRunStatusFromString on String {
  CreateJobTargetTaskRunStatus toCreateJobTargetTaskRunStatus() {
    switch (this) {
      case 'READY':
        return CreateJobTargetTaskRunStatus.ready;
      case 'SUSPENDED':
        return CreateJobTargetTaskRunStatus.suspended;
    }
    throw Exception('$this is not known in enum CreateJobTargetTaskRunStatus');
  }
}

class CreateLicenseEndpointResponse {
  /// The license endpoint ID.
  final String licenseEndpointId;

  CreateLicenseEndpointResponse({
    required this.licenseEndpointId,
  });

  factory CreateLicenseEndpointResponse.fromJson(Map<String, dynamic> json) {
    return CreateLicenseEndpointResponse(
      licenseEndpointId: json['licenseEndpointId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpointId = this.licenseEndpointId;
    return {
      'licenseEndpointId': licenseEndpointId,
    };
  }
}

class CreateMonitorResponse {
  /// The Amazon Resource Name (ARN) that IAM Identity Center assigns to the
  /// monitor.
  final String identityCenterApplicationArn;

  /// The unique identifier of the monitor.
  final String monitorId;

  CreateMonitorResponse({
    required this.identityCenterApplicationArn,
    required this.monitorId,
  });

  factory CreateMonitorResponse.fromJson(Map<String, dynamic> json) {
    return CreateMonitorResponse(
      identityCenterApplicationArn:
          json['identityCenterApplicationArn'] as String,
      monitorId: json['monitorId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final monitorId = this.monitorId;
    return {
      'identityCenterApplicationArn': identityCenterApplicationArn,
      'monitorId': monitorId,
    };
  }
}

class CreateQueueEnvironmentResponse {
  /// The queue environment ID.
  final String queueEnvironmentId;

  CreateQueueEnvironmentResponse({
    required this.queueEnvironmentId,
  });

  factory CreateQueueEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueEnvironmentResponse(
      queueEnvironmentId: json['queueEnvironmentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final queueEnvironmentId = this.queueEnvironmentId;
    return {
      'queueEnvironmentId': queueEnvironmentId,
    };
  }
}

class CreateQueueFleetAssociationResponse {
  CreateQueueFleetAssociationResponse();

  factory CreateQueueFleetAssociationResponse.fromJson(Map<String, dynamic> _) {
    return CreateQueueFleetAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class CreateQueueResponse {
  /// The queue ID.
  final String queueId;

  CreateQueueResponse({
    required this.queueId,
  });

  factory CreateQueueResponse.fromJson(Map<String, dynamic> json) {
    return CreateQueueResponse(
      queueId: json['queueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final queueId = this.queueId;
    return {
      'queueId': queueId,
    };
  }
}

class CreateStorageProfileResponse {
  /// The storage profile ID.
  final String storageProfileId;

  CreateStorageProfileResponse({
    required this.storageProfileId,
  });

  factory CreateStorageProfileResponse.fromJson(Map<String, dynamic> json) {
    return CreateStorageProfileResponse(
      storageProfileId: json['storageProfileId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final storageProfileId = this.storageProfileId;
    return {
      'storageProfileId': storageProfileId,
    };
  }
}

class CreateWorkerResponse {
  /// The worker ID.
  final String workerId;

  CreateWorkerResponse({
    required this.workerId,
  });

  factory CreateWorkerResponse.fromJson(Map<String, dynamic> json) {
    return CreateWorkerResponse(
      workerId: json['workerId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final workerId = this.workerId;
    return {
      'workerId': workerId,
    };
  }
}

/// The details of a customer managed fleet configuration.
class CustomerManagedFleetConfiguration {
  /// The Auto Scaling mode for the customer managed fleet configuration.
  final AutoScalingMode mode;

  /// The worker capabilities for a customer managed fleet configuration.
  final CustomerManagedWorkerCapabilities workerCapabilities;

  /// The storage profile ID.
  final String? storageProfileId;

  CustomerManagedFleetConfiguration({
    required this.mode,
    required this.workerCapabilities,
    this.storageProfileId,
  });

  factory CustomerManagedFleetConfiguration.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedFleetConfiguration(
      mode: (json['mode'] as String).toAutoScalingMode(),
      workerCapabilities: CustomerManagedWorkerCapabilities.fromJson(
          json['workerCapabilities'] as Map<String, dynamic>),
      storageProfileId: json['storageProfileId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final mode = this.mode;
    final workerCapabilities = this.workerCapabilities;
    final storageProfileId = this.storageProfileId;
    return {
      'mode': mode.toValue(),
      'workerCapabilities': workerCapabilities,
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
    };
  }
}

enum CustomerManagedFleetOperatingSystemFamily {
  windows,
  linux,
  macos,
}

extension CustomerManagedFleetOperatingSystemFamilyValueExtension
    on CustomerManagedFleetOperatingSystemFamily {
  String toValue() {
    switch (this) {
      case CustomerManagedFleetOperatingSystemFamily.windows:
        return 'WINDOWS';
      case CustomerManagedFleetOperatingSystemFamily.linux:
        return 'LINUX';
      case CustomerManagedFleetOperatingSystemFamily.macos:
        return 'MACOS';
    }
  }
}

extension CustomerManagedFleetOperatingSystemFamilyFromString on String {
  CustomerManagedFleetOperatingSystemFamily
      toCustomerManagedFleetOperatingSystemFamily() {
    switch (this) {
      case 'WINDOWS':
        return CustomerManagedFleetOperatingSystemFamily.windows;
      case 'LINUX':
        return CustomerManagedFleetOperatingSystemFamily.linux;
      case 'MACOS':
        return CustomerManagedFleetOperatingSystemFamily.macos;
    }
    throw Exception(
        '$this is not known in enum CustomerManagedFleetOperatingSystemFamily');
  }
}

/// The worker capabilities for a customer managed workflow.
class CustomerManagedWorkerCapabilities {
  /// The CPU architecture type for the customer managed worker capabilities.
  final CpuArchitectureType cpuArchitectureType;

  /// The memory (MiB).
  final MemoryMiBRange memoryMiB;

  /// The operating system (OS) family.
  final CustomerManagedFleetOperatingSystemFamily osFamily;

  /// The vCPU count for the customer manged worker capabilities.
  final VCpuCountRange vCpuCount;

  /// The range of the accelerator.
  final AcceleratorCountRange? acceleratorCount;

  /// The total memory (MiB) for the customer managed worker capabilities.
  final AcceleratorTotalMemoryMiBRange? acceleratorTotalMemoryMiB;

  /// The accelerator types for the customer managed worker capabilities.
  final List<AcceleratorType>? acceleratorTypes;

  /// Custom requirement ranges for customer managed worker capabilities.
  final List<FleetAmountCapability>? customAmounts;

  /// Custom attributes for the customer manged worker capabilities.
  final List<FleetAttributeCapability>? customAttributes;

  CustomerManagedWorkerCapabilities({
    required this.cpuArchitectureType,
    required this.memoryMiB,
    required this.osFamily,
    required this.vCpuCount,
    this.acceleratorCount,
    this.acceleratorTotalMemoryMiB,
    this.acceleratorTypes,
    this.customAmounts,
    this.customAttributes,
  });

  factory CustomerManagedWorkerCapabilities.fromJson(
      Map<String, dynamic> json) {
    return CustomerManagedWorkerCapabilities(
      cpuArchitectureType:
          (json['cpuArchitectureType'] as String).toCpuArchitectureType(),
      memoryMiB:
          MemoryMiBRange.fromJson(json['memoryMiB'] as Map<String, dynamic>),
      osFamily: (json['osFamily'] as String)
          .toCustomerManagedFleetOperatingSystemFamily(),
      vCpuCount:
          VCpuCountRange.fromJson(json['vCpuCount'] as Map<String, dynamic>),
      acceleratorCount: json['acceleratorCount'] != null
          ? AcceleratorCountRange.fromJson(
              json['acceleratorCount'] as Map<String, dynamic>)
          : null,
      acceleratorTotalMemoryMiB: json['acceleratorTotalMemoryMiB'] != null
          ? AcceleratorTotalMemoryMiBRange.fromJson(
              json['acceleratorTotalMemoryMiB'] as Map<String, dynamic>)
          : null,
      acceleratorTypes: (json['acceleratorTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toAcceleratorType())
          .toList(),
      customAmounts: (json['customAmounts'] as List?)
          ?.whereNotNull()
          .map((e) => FleetAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: (json['customAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FleetAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitectureType = this.cpuArchitectureType;
    final memoryMiB = this.memoryMiB;
    final osFamily = this.osFamily;
    final vCpuCount = this.vCpuCount;
    final acceleratorCount = this.acceleratorCount;
    final acceleratorTotalMemoryMiB = this.acceleratorTotalMemoryMiB;
    final acceleratorTypes = this.acceleratorTypes;
    final customAmounts = this.customAmounts;
    final customAttributes = this.customAttributes;
    return {
      'cpuArchitectureType': cpuArchitectureType.toValue(),
      'memoryMiB': memoryMiB,
      'osFamily': osFamily.toValue(),
      'vCpuCount': vCpuCount,
      if (acceleratorCount != null) 'acceleratorCount': acceleratorCount,
      if (acceleratorTotalMemoryMiB != null)
        'acceleratorTotalMemoryMiB': acceleratorTotalMemoryMiB,
      if (acceleratorTypes != null)
        'acceleratorTypes': acceleratorTypes.map((e) => e.toValue()).toList(),
      if (customAmounts != null) 'customAmounts': customAmounts,
      if (customAttributes != null) 'customAttributes': customAttributes,
    };
  }
}

/// The time stamp in date-time format.
class DateTimeFilterExpression {
  /// The date and time.
  final DateTime dateTime;

  /// The name of the date-time field to filter on.
  final String name;

  /// The type of comparison to use to filter the results.
  final ComparisonOperator operator;

  DateTimeFilterExpression({
    required this.dateTime,
    required this.name,
    required this.operator,
  });

  Map<String, dynamic> toJson() {
    final dateTime = this.dateTime;
    final name = this.name;
    final operator = this.operator;
    return {
      'dateTime': iso8601ToJson(dateTime),
      'name': name,
      'operator': operator.toValue(),
    };
  }
}

enum DefaultQueueBudgetAction {
  none,
  stopSchedulingAndCompleteTasks,
  stopSchedulingAndCancelTasks,
}

extension DefaultQueueBudgetActionValueExtension on DefaultQueueBudgetAction {
  String toValue() {
    switch (this) {
      case DefaultQueueBudgetAction.none:
        return 'NONE';
      case DefaultQueueBudgetAction.stopSchedulingAndCompleteTasks:
        return 'STOP_SCHEDULING_AND_COMPLETE_TASKS';
      case DefaultQueueBudgetAction.stopSchedulingAndCancelTasks:
        return 'STOP_SCHEDULING_AND_CANCEL_TASKS';
    }
  }
}

extension DefaultQueueBudgetActionFromString on String {
  DefaultQueueBudgetAction toDefaultQueueBudgetAction() {
    switch (this) {
      case 'NONE':
        return DefaultQueueBudgetAction.none;
      case 'STOP_SCHEDULING_AND_COMPLETE_TASKS':
        return DefaultQueueBudgetAction.stopSchedulingAndCompleteTasks;
      case 'STOP_SCHEDULING_AND_CANCEL_TASKS':
        return DefaultQueueBudgetAction.stopSchedulingAndCancelTasks;
    }
    throw Exception('$this is not known in enum DefaultQueueBudgetAction');
  }
}

class DeleteBudgetResponse {
  DeleteBudgetResponse();

  factory DeleteBudgetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFarmResponse {
  DeleteFarmResponse();

  factory DeleteFarmResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteFleetResponse {
  DeleteFleetResponse();

  factory DeleteFleetResponse.fromJson(Map<String, dynamic> _) {
    return DeleteFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLicenseEndpointResponse {
  DeleteLicenseEndpointResponse();

  factory DeleteLicenseEndpointResponse.fromJson(Map<String, dynamic> _) {
    return DeleteLicenseEndpointResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMeteredProductResponse {
  DeleteMeteredProductResponse();

  factory DeleteMeteredProductResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMeteredProductResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteMonitorResponse {
  DeleteMonitorResponse();

  factory DeleteMonitorResponse.fromJson(Map<String, dynamic> _) {
    return DeleteMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueEnvironmentResponse {
  DeleteQueueEnvironmentResponse();

  factory DeleteQueueEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueFleetAssociationResponse {
  DeleteQueueFleetAssociationResponse();

  factory DeleteQueueFleetAssociationResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueFleetAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteQueueResponse {
  DeleteQueueResponse();

  factory DeleteQueueResponse.fromJson(Map<String, dynamic> _) {
    return DeleteQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteStorageProfileResponse {
  DeleteStorageProfileResponse();

  factory DeleteStorageProfileResponse.fromJson(Map<String, dynamic> _) {
    return DeleteStorageProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteWorkerResponse {
  DeleteWorkerResponse();

  factory DeleteWorkerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWorkerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum DependencyConsumerResolutionStatus {
  resolved,
  unresolved,
}

extension DependencyConsumerResolutionStatusValueExtension
    on DependencyConsumerResolutionStatus {
  String toValue() {
    switch (this) {
      case DependencyConsumerResolutionStatus.resolved:
        return 'RESOLVED';
      case DependencyConsumerResolutionStatus.unresolved:
        return 'UNRESOLVED';
    }
  }
}

extension DependencyConsumerResolutionStatusFromString on String {
  DependencyConsumerResolutionStatus toDependencyConsumerResolutionStatus() {
    switch (this) {
      case 'RESOLVED':
        return DependencyConsumerResolutionStatus.resolved;
      case 'UNRESOLVED':
        return DependencyConsumerResolutionStatus.unresolved;
    }
    throw Exception(
        '$this is not known in enum DependencyConsumerResolutionStatus');
  }
}

/// The number of dependencies for the consumer.
class DependencyCounts {
  /// The number of consumers resolved.
  final int consumersResolved;

  /// The number of unresolved consumers.
  final int consumersUnresolved;

  /// The number of resolved dependencies.
  final int dependenciesResolved;

  /// The number of unresolved dependencies.
  final int dependenciesUnresolved;

  DependencyCounts({
    required this.consumersResolved,
    required this.consumersUnresolved,
    required this.dependenciesResolved,
    required this.dependenciesUnresolved,
  });

  factory DependencyCounts.fromJson(Map<String, dynamic> json) {
    return DependencyCounts(
      consumersResolved: json['consumersResolved'] as int,
      consumersUnresolved: json['consumersUnresolved'] as int,
      dependenciesResolved: json['dependenciesResolved'] as int,
      dependenciesUnresolved: json['dependenciesUnresolved'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    final consumersResolved = this.consumersResolved;
    final consumersUnresolved = this.consumersUnresolved;
    final dependenciesResolved = this.dependenciesResolved;
    final dependenciesUnresolved = this.dependenciesUnresolved;
    return {
      'consumersResolved': consumersResolved,
      'consumersUnresolved': consumersUnresolved,
      'dependenciesResolved': dependenciesResolved,
      'dependenciesUnresolved': dependenciesUnresolved,
    };
  }
}

enum DesiredWorkerStatus {
  stopped,
}

extension DesiredWorkerStatusValueExtension on DesiredWorkerStatus {
  String toValue() {
    switch (this) {
      case DesiredWorkerStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension DesiredWorkerStatusFromString on String {
  DesiredWorkerStatus toDesiredWorkerStatus() {
    switch (this) {
      case 'STOPPED':
        return DesiredWorkerStatus.stopped;
    }
    throw Exception('$this is not known in enum DesiredWorkerStatus');
  }
}

class DisassociateMemberFromFarmResponse {
  DisassociateMemberFromFarmResponse();

  factory DisassociateMemberFromFarmResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberFromFleetResponse {
  DisassociateMemberFromFleetResponse();

  factory DisassociateMemberFromFleetResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberFromJobResponse {
  DisassociateMemberFromJobResponse();

  factory DisassociateMemberFromJobResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateMemberFromQueueResponse {
  DisassociateMemberFromQueueResponse();

  factory DisassociateMemberFromQueueResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateMemberFromQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class Document {
  Document();

  factory Document.fromJson(Map<String, dynamic> _) {
    return Document();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

/// Specifies the EBS volume.
class Ec2EbsVolume {
  /// The IOPS per volume.
  final int? iops;

  /// The EBS volume size in GiB.
  final int? sizeGiB;

  /// The throughput per volume in MiB.
  final int? throughputMiB;

  Ec2EbsVolume({
    this.iops,
    this.sizeGiB,
    this.throughputMiB,
  });

  factory Ec2EbsVolume.fromJson(Map<String, dynamic> json) {
    return Ec2EbsVolume(
      iops: json['iops'] as int?,
      sizeGiB: json['sizeGiB'] as int?,
      throughputMiB: json['throughputMiB'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final sizeGiB = this.sizeGiB;
    final throughputMiB = this.throughputMiB;
    return {
      if (iops != null) 'iops': iops,
      if (sizeGiB != null) 'sizeGiB': sizeGiB,
      if (throughputMiB != null) 'throughputMiB': throughputMiB,
    };
  }
}

enum Ec2MarketType {
  onDemand,
  spot,
}

extension Ec2MarketTypeValueExtension on Ec2MarketType {
  String toValue() {
    switch (this) {
      case Ec2MarketType.onDemand:
        return 'on-demand';
      case Ec2MarketType.spot:
        return 'spot';
    }
  }
}

extension Ec2MarketTypeFromString on String {
  Ec2MarketType toEc2MarketType() {
    switch (this) {
      case 'on-demand':
        return Ec2MarketType.onDemand;
      case 'spot':
        return Ec2MarketType.spot;
    }
    throw Exception('$this is not known in enum Ec2MarketType');
  }
}

/// The details of a specified environment.
class EnvironmentDetailsEntity {
  /// The environment ID.
  final String environmentId;

  /// The job ID.
  final String jobId;

  /// The schema version in the environment.
  final String schemaVersion;

  /// The template used for the environment.
  final Document template;

  EnvironmentDetailsEntity({
    required this.environmentId,
    required this.jobId,
    required this.schemaVersion,
    required this.template,
  });

  factory EnvironmentDetailsEntity.fromJson(Map<String, dynamic> json) {
    return EnvironmentDetailsEntity(
      environmentId: json['environmentId'] as String,
      jobId: json['jobId'] as String,
      schemaVersion: json['schemaVersion'] as String,
      template: Document.fromJson(json['template'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final jobId = this.jobId;
    final schemaVersion = this.schemaVersion;
    final template = this.template;
    return {
      'environmentId': environmentId,
      'jobId': jobId,
      'schemaVersion': schemaVersion,
      'template': template,
    };
  }
}

/// The error details for the environment.
class EnvironmentDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The environment ID.
  final String environmentId;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  EnvironmentDetailsError({
    required this.code,
    required this.environmentId,
    required this.jobId,
    required this.message,
  });

  factory EnvironmentDetailsError.fromJson(Map<String, dynamic> json) {
    return EnvironmentDetailsError(
      code: (json['code'] as String).toJobEntityErrorCode(),
      environmentId: json['environmentId'] as String,
      jobId: json['jobId'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final environmentId = this.environmentId;
    final jobId = this.jobId;
    final message = this.message;
    return {
      'code': code.toValue(),
      'environmentId': environmentId,
      'jobId': jobId,
      'message': message,
    };
  }
}

/// The IDs of the job and environment.
class EnvironmentDetailsIdentifiers {
  /// The environment ID.
  final String environmentId;

  /// The job ID.
  final String jobId;

  EnvironmentDetailsIdentifiers({
    required this.environmentId,
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final environmentId = this.environmentId;
    final jobId = this.jobId;
    return {
      'environmentId': environmentId,
      'jobId': jobId,
    };
  }
}

/// The environment ID to use to enter a session action.
class EnvironmentEnterSessionActionDefinition {
  /// The environment ID.
  final String environmentId;

  EnvironmentEnterSessionActionDefinition({
    required this.environmentId,
  });

  factory EnvironmentEnterSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentEnterSessionActionDefinition(
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

/// Defines the environment a session action enters in.
class EnvironmentEnterSessionActionDefinitionSummary {
  /// The environment ID.
  final String environmentId;

  EnvironmentEnterSessionActionDefinitionSummary({
    required this.environmentId,
  });

  factory EnvironmentEnterSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentEnterSessionActionDefinitionSummary(
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

/// Defines the environment a session action exits from.
class EnvironmentExitSessionActionDefinition {
  /// The environment ID.
  final String environmentId;

  EnvironmentExitSessionActionDefinition({
    required this.environmentId,
  });

  factory EnvironmentExitSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentExitSessionActionDefinition(
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

/// A summary of the environment details for which a session action to exits.
class EnvironmentExitSessionActionDefinitionSummary {
  /// The environment ID.
  final String environmentId;

  EnvironmentExitSessionActionDefinitionSummary({
    required this.environmentId,
  });

  factory EnvironmentExitSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return EnvironmentExitSessionActionDefinitionSummary(
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

enum EnvironmentTemplateType {
  json,
  yaml,
}

extension EnvironmentTemplateTypeValueExtension on EnvironmentTemplateType {
  String toValue() {
    switch (this) {
      case EnvironmentTemplateType.json:
        return 'JSON';
      case EnvironmentTemplateType.yaml:
        return 'YAML';
    }
  }
}

extension EnvironmentTemplateTypeFromString on String {
  EnvironmentTemplateType toEnvironmentTemplateType() {
    switch (this) {
      case 'JSON':
        return EnvironmentTemplateType.json;
      case 'YAML':
        return EnvironmentTemplateType.yaml;
    }
    throw Exception('$this is not known in enum EnvironmentTemplateType');
  }
}

/// The member of a farm.
class FarmMember {
  /// The farm ID of the farm member.
  final String farmId;

  /// The identity store ID of the farm member.
  final String identityStoreId;

  /// The farm member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the farm member.
  final String principalId;

  /// The principal type of the farm member.
  final PrincipalType principalType;

  FarmMember({
    required this.farmId,
    required this.identityStoreId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
  });

  factory FarmMember.fromJson(Map<String, dynamic> json) {
    return FarmMember(
      farmId: json['farmId'] as String,
      identityStoreId: json['identityStoreId'] as String,
      membershipLevel: (json['membershipLevel'] as String).toMembershipLevel(),
      principalId: json['principalId'] as String,
      principalType: (json['principalType'] as String).toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final identityStoreId = this.identityStoreId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      'farmId': farmId,
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalId': principalId,
      'principalType': principalType.toValue(),
    };
  }
}

/// The summary of details for a farm.
class FarmSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the farm.
  final String displayName;

  /// The farm ID.
  final String farmId;

  /// The ARN for the KMS key.
  final String? kmsKeyArn;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  FarmSummary({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    this.kmsKeyArn,
    this.updatedAt,
    this.updatedBy,
  });

  factory FarmSummary.fromJson(Map<String, dynamic> json) {
    return FarmSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      farmId: json['farmId'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final kmsKeyArn = this.kmsKeyArn;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      if (kmsKeyArn != null) 'kmsKeyArn': kmsKeyArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The field sorting order and name of the field.
class FieldSortExpression {
  /// The name of the field.
  final String name;

  /// The sort order for the field.
  final SortOrder sortOrder;

  FieldSortExpression({
    required this.name,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sortOrder = this.sortOrder;
    return {
      'name': name,
      'sortOrder': sortOrder.toValue(),
    };
  }
}

/// The details of the file system location for the resource.
class FileSystemLocation {
  /// The location name.
  final String name;

  /// The file path.
  final String path;

  /// The type of file.
  final FileSystemLocationType type;

  FileSystemLocation({
    required this.name,
    required this.path,
    required this.type,
  });

  factory FileSystemLocation.fromJson(Map<String, dynamic> json) {
    return FileSystemLocation(
      name: json['name'] as String,
      path: json['path'] as String,
      type: (json['type'] as String).toFileSystemLocationType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final path = this.path;
    final type = this.type;
    return {
      'name': name,
      'path': path,
      'type': type.toValue(),
    };
  }
}

enum FileSystemLocationType {
  shared,
  local,
}

extension FileSystemLocationTypeValueExtension on FileSystemLocationType {
  String toValue() {
    switch (this) {
      case FileSystemLocationType.shared:
        return 'SHARED';
      case FileSystemLocationType.local:
        return 'LOCAL';
    }
  }
}

extension FileSystemLocationTypeFromString on String {
  FileSystemLocationType toFileSystemLocationType() {
    switch (this) {
      case 'SHARED':
        return FileSystemLocationType.shared;
      case 'LOCAL':
        return FileSystemLocationType.local;
    }
    throw Exception('$this is not known in enum FileSystemLocationType');
  }
}

/// The details of a fixed budget schedule.
class FixedBudgetSchedule {
  /// When the budget ends.
  final DateTime endTime;

  /// When the budget starts.
  final DateTime startTime;

  FixedBudgetSchedule({
    required this.endTime,
    required this.startTime,
  });

  factory FixedBudgetSchedule.fromJson(Map<String, dynamic> json) {
    return FixedBudgetSchedule(
      endTime: nonNullableTimeStampFromJson(json['endTime'] as Object),
      startTime: nonNullableTimeStampFromJson(json['startTime'] as Object),
    );
  }

  Map<String, dynamic> toJson() {
    final endTime = this.endTime;
    final startTime = this.startTime;
    return {
      'endTime': iso8601ToJson(endTime),
      'startTime': iso8601ToJson(startTime),
    };
  }
}

/// The fleet amount and attribute capabilities.
class FleetAmountCapability {
  /// The minimum amount of fleet worker capability.
  final double min;

  /// The name of the fleet capability.
  final String name;

  /// The maximum amount of the fleet worker capability.
  final double? max;

  FleetAmountCapability({
    required this.min,
    required this.name,
    this.max,
  });

  factory FleetAmountCapability.fromJson(Map<String, dynamic> json) {
    return FleetAmountCapability(
      min: json['min'] as double,
      name: json['name'] as String,
      max: json['max'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final name = this.name;
    final max = this.max;
    return {
      'min': min,
      'name': name,
      if (max != null) 'max': max,
    };
  }
}

/// Defines the fleet's capability name, minimum, and maximum.
class FleetAttributeCapability {
  /// The name of the fleet attribute capability for the worker.
  final String name;

  /// The number of fleet attribute capabilities.
  final List<String> values;

  FleetAttributeCapability({
    required this.name,
    required this.values,
  });

  factory FleetAttributeCapability.fromJson(Map<String, dynamic> json) {
    return FleetAttributeCapability(
      name: json['name'] as String,
      values: (json['values'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

/// The amounts and attributes of fleets.
class FleetCapabilities {
  /// Amount capabilities of the fleet.
  final List<FleetAmountCapability>? amounts;

  /// Attribute capabilities of the fleet.
  final List<FleetAttributeCapability>? attributes;

  FleetCapabilities({
    this.amounts,
    this.attributes,
  });

  factory FleetCapabilities.fromJson(Map<String, dynamic> json) {
    return FleetCapabilities(
      amounts: (json['amounts'] as List?)
          ?.whereNotNull()
          .map((e) => FleetAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FleetAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final amounts = this.amounts;
    final attributes = this.attributes;
    return {
      if (amounts != null) 'amounts': amounts,
      if (attributes != null) 'attributes': attributes,
    };
  }
}

/// Fleet configuration details.
class FleetConfiguration {
  /// The customer managed fleets within a fleet configuration.
  final CustomerManagedFleetConfiguration? customerManaged;

  /// The service managed Amazon EC2 instances for a fleet configuration.
  final ServiceManagedEc2FleetConfiguration? serviceManagedEc2;

  FleetConfiguration({
    this.customerManaged,
    this.serviceManagedEc2,
  });

  factory FleetConfiguration.fromJson(Map<String, dynamic> json) {
    return FleetConfiguration(
      customerManaged: json['customerManaged'] != null
          ? CustomerManagedFleetConfiguration.fromJson(
              json['customerManaged'] as Map<String, dynamic>)
          : null,
      serviceManagedEc2: json['serviceManagedEc2'] != null
          ? ServiceManagedEc2FleetConfiguration.fromJson(
              json['serviceManagedEc2'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final customerManaged = this.customerManaged;
    final serviceManagedEc2 = this.serviceManagedEc2;
    return {
      if (customerManaged != null) 'customerManaged': customerManaged,
      if (serviceManagedEc2 != null) 'serviceManagedEc2': serviceManagedEc2,
    };
  }
}

/// The fleet member.
class FleetMember {
  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The identity store ID.
  final String identityStoreId;

  /// The fleet member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the fleet member.
  final String principalId;

  /// The principal type of the fleet member.
  final PrincipalType principalType;

  FleetMember({
    required this.farmId,
    required this.fleetId,
    required this.identityStoreId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
  });

  factory FleetMember.fromJson(Map<String, dynamic> json) {
    return FleetMember(
      farmId: json['farmId'] as String,
      fleetId: json['fleetId'] as String,
      identityStoreId: json['identityStoreId'] as String,
      membershipLevel: (json['membershipLevel'] as String).toMembershipLevel(),
      principalId: json['principalId'] as String,
      principalType: (json['principalType'] as String).toPrincipalType(),
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final identityStoreId = this.identityStoreId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    return {
      'farmId': farmId,
      'fleetId': fleetId,
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalId': principalId,
      'principalType': principalType.toValue(),
    };
  }
}

enum FleetStatus {
  active,
  createInProgress,
  updateInProgress,
  createFailed,
  updateFailed,
}

extension FleetStatusValueExtension on FleetStatus {
  String toValue() {
    switch (this) {
      case FleetStatus.active:
        return 'ACTIVE';
      case FleetStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case FleetStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case FleetStatus.createFailed:
        return 'CREATE_FAILED';
      case FleetStatus.updateFailed:
        return 'UPDATE_FAILED';
    }
  }
}

extension FleetStatusFromString on String {
  FleetStatus toFleetStatus() {
    switch (this) {
      case 'ACTIVE':
        return FleetStatus.active;
      case 'CREATE_IN_PROGRESS':
        return FleetStatus.createInProgress;
      case 'UPDATE_IN_PROGRESS':
        return FleetStatus.updateInProgress;
      case 'CREATE_FAILED':
        return FleetStatus.createFailed;
      case 'UPDATE_FAILED':
        return FleetStatus.updateFailed;
    }
    throw Exception('$this is not known in enum FleetStatus');
  }
}

/// The details of a fleet.
class FleetSummary {
  /// The configuration details for the fleet.
  final FleetConfiguration configuration;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the fleet summary to update.
  final String displayName;

  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The maximum number of workers specified in the fleet.
  final int maxWorkerCount;

  /// The minimum number of workers in the fleet.
  final int minWorkerCount;

  /// The status of the fleet.
  final FleetStatus status;

  /// The number of workers in the fleet summary.
  final int workerCount;

  /// The Auto Scaling status of a fleet.
  final AutoScalingStatus? autoScalingStatus;

  /// The target number of workers in a fleet.
  final int? targetWorkerCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  FleetSummary({
    required this.configuration,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    required this.fleetId,
    required this.maxWorkerCount,
    required this.minWorkerCount,
    required this.status,
    required this.workerCount,
    this.autoScalingStatus,
    this.targetWorkerCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory FleetSummary.fromJson(Map<String, dynamic> json) {
    return FleetSummary(
      configuration: FleetConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      farmId: json['farmId'] as String,
      fleetId: json['fleetId'] as String,
      maxWorkerCount: json['maxWorkerCount'] as int,
      minWorkerCount: json['minWorkerCount'] as int,
      status: (json['status'] as String).toFleetStatus(),
      workerCount: json['workerCount'] as int,
      autoScalingStatus:
          (json['autoScalingStatus'] as String?)?.toAutoScalingStatus(),
      targetWorkerCount: json['targetWorkerCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final maxWorkerCount = this.maxWorkerCount;
    final minWorkerCount = this.minWorkerCount;
    final status = this.status;
    final workerCount = this.workerCount;
    final autoScalingStatus = this.autoScalingStatus;
    final targetWorkerCount = this.targetWorkerCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      'fleetId': fleetId,
      'maxWorkerCount': maxWorkerCount,
      'minWorkerCount': minWorkerCount,
      'status': status.toValue(),
      'workerCount': workerCount,
      if (autoScalingStatus != null)
        'autoScalingStatus': autoScalingStatus.toValue(),
      if (targetWorkerCount != null) 'targetWorkerCount': targetWorkerCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetBudgetResponse {
  /// The budget actions for the budget.
  final List<ResponseBudgetAction> actions;

  /// The consumed usage limit for the budget.
  final double approximateDollarLimit;

  /// The budget ID.
  final String budgetId;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the budget.
  final String displayName;

  /// The budget schedule.
  final BudgetSchedule schedule;

  /// The status of the budget.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–Get a budget being evaluated.
  /// </li>
  /// <li>
  /// <code>INACTIVE</code>–Get an inactive budget. This can include expired,
  /// canceled, or deleted statuses.
  /// </li>
  /// </ul>
  final BudgetStatus status;

  /// The resource that the budget is tracking usage for.
  final UsageTrackingResource usageTrackingResource;

  /// The usages of the budget.
  final ConsumedUsages usages;

  /// The description of the budget.
  final String? description;

  /// The date and time the queue stopped.
  final DateTime? queueStoppedAt;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetBudgetResponse({
    required this.actions,
    required this.approximateDollarLimit,
    required this.budgetId,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.schedule,
    required this.status,
    required this.usageTrackingResource,
    required this.usages,
    this.description,
    this.queueStoppedAt,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetBudgetResponse.fromJson(Map<String, dynamic> json) {
    return GetBudgetResponse(
      actions: (json['actions'] as List)
          .whereNotNull()
          .map((e) => ResponseBudgetAction.fromJson(e as Map<String, dynamic>))
          .toList(),
      approximateDollarLimit: json['approximateDollarLimit'] as double,
      budgetId: json['budgetId'] as String,
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      schedule:
          BudgetSchedule.fromJson(json['schedule'] as Map<String, dynamic>),
      status: (json['status'] as String).toBudgetStatus(),
      usageTrackingResource: UsageTrackingResource.fromJson(
          json['usageTrackingResource'] as Map<String, dynamic>),
      usages: ConsumedUsages.fromJson(json['usages'] as Map<String, dynamic>),
      description: json['description'] as String?,
      queueStoppedAt: timeStampFromJson(json['queueStoppedAt']),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final actions = this.actions;
    final approximateDollarLimit = this.approximateDollarLimit;
    final budgetId = this.budgetId;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final schedule = this.schedule;
    final status = this.status;
    final usageTrackingResource = this.usageTrackingResource;
    final usages = this.usages;
    final description = this.description;
    final queueStoppedAt = this.queueStoppedAt;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'actions': actions,
      'approximateDollarLimit': approximateDollarLimit,
      'budgetId': budgetId,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'schedule': schedule,
      'status': status.toValue(),
      'usageTrackingResource': usageTrackingResource,
      'usages': usages,
      if (description != null) 'description': description,
      if (queueStoppedAt != null)
        'queueStoppedAt': iso8601ToJson(queueStoppedAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetFarmResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the farm.
  final String displayName;

  /// The farm ID of the farm to get.
  final String farmId;

  /// The ARN of the KMS key used on the farm.
  final String kmsKeyArn;

  /// The description of the farm.
  final String? description;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetFarmResponse({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    required this.kmsKeyArn,
    this.description,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetFarmResponse.fromJson(Map<String, dynamic> json) {
    return GetFarmResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      farmId: json['farmId'] as String,
      kmsKeyArn: json['kmsKeyArn'] as String,
      description: json['description'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final kmsKeyArn = this.kmsKeyArn;
    final description = this.description;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      'kmsKeyArn': kmsKeyArn,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetFleetResponse {
  /// The configuration setting for the fleet.
  final FleetConfiguration configuration;

  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the fleet.
  final String displayName;

  /// The farm ID of the farm in the fleet.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The maximum number of workers specified in the fleet.
  final int maxWorkerCount;

  /// The minimum number of workers specified in the fleet.
  final int minWorkerCount;

  /// The IAM role ARN.
  final String roleArn;

  /// The Auto Scaling status of the fleet.
  final FleetStatus status;

  /// The number of workers in the fleet.
  final int workerCount;

  /// The Auto Scaling status of the fleet. Either <code>GROWING</code>,
  /// <code>STEADY</code>, or <code>SHRINKING</code>.
  final AutoScalingStatus? autoScalingStatus;

  /// Outlines what the fleet is capable of for minimums, maximums, and naming, in
  /// addition to attribute names and values.
  final FleetCapabilities? capabilities;

  /// The description of the fleet.
  final String? description;

  /// The number of target workers in the fleet.
  final int? targetWorkerCount;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetFleetResponse({
    required this.configuration,
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.farmId,
    required this.fleetId,
    required this.maxWorkerCount,
    required this.minWorkerCount,
    required this.roleArn,
    required this.status,
    required this.workerCount,
    this.autoScalingStatus,
    this.capabilities,
    this.description,
    this.targetWorkerCount,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetFleetResponse.fromJson(Map<String, dynamic> json) {
    return GetFleetResponse(
      configuration: FleetConfiguration.fromJson(
          json['configuration'] as Map<String, dynamic>),
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      farmId: json['farmId'] as String,
      fleetId: json['fleetId'] as String,
      maxWorkerCount: json['maxWorkerCount'] as int,
      minWorkerCount: json['minWorkerCount'] as int,
      roleArn: json['roleArn'] as String,
      status: (json['status'] as String).toFleetStatus(),
      workerCount: json['workerCount'] as int,
      autoScalingStatus:
          (json['autoScalingStatus'] as String?)?.toAutoScalingStatus(),
      capabilities: json['capabilities'] != null
          ? FleetCapabilities.fromJson(
              json['capabilities'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      targetWorkerCount: json['targetWorkerCount'] as int?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final configuration = this.configuration;
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final maxWorkerCount = this.maxWorkerCount;
    final minWorkerCount = this.minWorkerCount;
    final roleArn = this.roleArn;
    final status = this.status;
    final workerCount = this.workerCount;
    final autoScalingStatus = this.autoScalingStatus;
    final capabilities = this.capabilities;
    final description = this.description;
    final targetWorkerCount = this.targetWorkerCount;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'configuration': configuration,
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'farmId': farmId,
      'fleetId': fleetId,
      'maxWorkerCount': maxWorkerCount,
      'minWorkerCount': minWorkerCount,
      'roleArn': roleArn,
      'status': status.toValue(),
      'workerCount': workerCount,
      if (autoScalingStatus != null)
        'autoScalingStatus': autoScalingStatus.toValue(),
      if (capabilities != null) 'capabilities': capabilities,
      if (description != null) 'description': description,
      if (targetWorkerCount != null) 'targetWorkerCount': targetWorkerCount,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The error for the job entity.
class GetJobEntityError {
  /// The environment details for the failed job entity.
  final EnvironmentDetailsError? environmentDetails;

  /// The job attachment details for the failed job entity.
  final JobAttachmentDetailsError? jobAttachmentDetails;

  /// The job details for the failed job entity.
  final JobDetailsError? jobDetails;

  /// The step details for the failed job entity.
  final StepDetailsError? stepDetails;

  GetJobEntityError({
    this.environmentDetails,
    this.jobAttachmentDetails,
    this.jobDetails,
    this.stepDetails,
  });

  factory GetJobEntityError.fromJson(Map<String, dynamic> json) {
    return GetJobEntityError(
      environmentDetails: json['environmentDetails'] != null
          ? EnvironmentDetailsError.fromJson(
              json['environmentDetails'] as Map<String, dynamic>)
          : null,
      jobAttachmentDetails: json['jobAttachmentDetails'] != null
          ? JobAttachmentDetailsError.fromJson(
              json['jobAttachmentDetails'] as Map<String, dynamic>)
          : null,
      jobDetails: json['jobDetails'] != null
          ? JobDetailsError.fromJson(json['jobDetails'] as Map<String, dynamic>)
          : null,
      stepDetails: json['stepDetails'] != null
          ? StepDetailsError.fromJson(
              json['stepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentDetails = this.environmentDetails;
    final jobAttachmentDetails = this.jobAttachmentDetails;
    final jobDetails = this.jobDetails;
    final stepDetails = this.stepDetails;
    return {
      if (environmentDetails != null) 'environmentDetails': environmentDetails,
      if (jobAttachmentDetails != null)
        'jobAttachmentDetails': jobAttachmentDetails,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (stepDetails != null) 'stepDetails': stepDetails,
    };
  }
}

class GetJobResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The job ID.
  final String jobId;

  /// The life cycle status for the job.
  final JobLifecycleStatus lifecycleStatus;

  /// A message that communicates the status of the life cycle for the job.
  final String lifecycleStatusMessage;

  /// The name of the job.
  final String name;

  /// The job priority.
  final int priority;

  /// The attachments for the job.
  final Attachments? attachments;

  /// The description of the job.
  final String? description;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries per failed tasks.
  final int? maxRetriesPerTask;

  /// The parameters for the job.
  final Map<String, JobParameter>? parameters;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The storage profile ID associated with the job.
  final String? storageProfileId;

  /// The task status with which the job started.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// The task run status for the job.
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetJobResponse({
    required this.createdAt,
    required this.createdBy,
    required this.jobId,
    required this.lifecycleStatus,
    required this.lifecycleStatusMessage,
    required this.name,
    required this.priority,
    this.attachments,
    this.description,
    this.endedAt,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.parameters,
    this.startedAt,
    this.storageProfileId,
    this.targetTaskRunStatus,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetJobResponse.fromJson(Map<String, dynamic> json) {
    return GetJobResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      jobId: json['jobId'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toJobLifecycleStatus(),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String,
      name: json['name'] as String,
      priority: json['priority'] as int,
      attachments: json['attachments'] != null
          ? Attachments.fromJson(json['attachments'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      startedAt: timeStampFromJson(json['startedAt']),
      storageProfileId: json['storageProfileId'] as String?,
      targetTaskRunStatus:
          (json['targetTaskRunStatus'] as String?)?.toJobTargetTaskRunStatus(),
      taskRunStatus: (json['taskRunStatus'] as String?)?.toTaskRunStatus(),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTaskRunStatus(), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final priority = this.priority;
    final attachments = this.attachments;
    final description = this.description;
    final endedAt = this.endedAt;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final parameters = this.parameters;
    final startedAt = this.startedAt;
    final storageProfileId = this.storageProfileId;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'lifecycleStatusMessage': lifecycleStatusMessage,
      'name': name,
      'priority': priority,
      if (attachments != null) 'attachments': attachments,
      if (description != null) 'description': description,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (parameters != null) 'parameters': parameters,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (storageProfileId != null) 'storageProfileId': storageProfileId,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.toValue(),
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetLicenseEndpointResponse {
  /// The license endpoint ID.
  final String licenseEndpointId;

  /// The status of the license endpoint.
  final LicenseEndpointStatus status;

  /// The status message of the license endpoint.
  final String statusMessage;

  /// The DNS name.
  final String? dnsName;

  /// The security group IDs for the license endpoint.
  final List<String>? securityGroupIds;

  /// The subnet IDs.
  final List<String>? subnetIds;

  /// The VCP(virtual private cloud) ID associated with the license endpoint.
  final String? vpcId;

  GetLicenseEndpointResponse({
    required this.licenseEndpointId,
    required this.status,
    required this.statusMessage,
    this.dnsName,
    this.securityGroupIds,
    this.subnetIds,
    this.vpcId,
  });

  factory GetLicenseEndpointResponse.fromJson(Map<String, dynamic> json) {
    return GetLicenseEndpointResponse(
      licenseEndpointId: json['licenseEndpointId'] as String,
      status: (json['status'] as String).toLicenseEndpointStatus(),
      statusMessage: json['statusMessage'] as String,
      dnsName: json['dnsName'] as String?,
      securityGroupIds: (json['securityGroupIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      subnetIds: (json['subnetIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpointId = this.licenseEndpointId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final dnsName = this.dnsName;
    final securityGroupIds = this.securityGroupIds;
    final subnetIds = this.subnetIds;
    final vpcId = this.vpcId;
    return {
      'licenseEndpointId': licenseEndpointId,
      'status': status.toValue(),
      'statusMessage': statusMessage,
      if (dnsName != null) 'dnsName': dnsName,
      if (securityGroupIds != null) 'securityGroupIds': securityGroupIds,
      if (subnetIds != null) 'subnetIds': subnetIds,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class GetMonitorResponse {
  /// The UNIX timestamp of the date and time that the monitor was created.
  final DateTime createdAt;

  /// The user name of the person that created the monitor.
  final String createdBy;

  /// The name used to identify the monitor on the Deadline Cloud console.
  final String displayName;

  /// The Amazon Resource Name (ARN) that the IAM Identity Center assigned to the
  /// monitor when it was created.
  final String identityCenterApplicationArn;

  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance
  /// responsible for authenticating monitor users.
  final String identityCenterInstanceArn;

  /// The unique identifier for the monitor.
  final String monitorId;

  /// The Amazon Resource Name (ARN) of the IAM role for the monitor. Users of the
  /// monitor use this role to access Deadline Cloud resources.
  final String roleArn;

  /// The subdomain used for the monitor URL. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String subdomain;

  /// The complete URL of the monitor. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String url;

  /// The UNIX timestamp of the last date and time that the monitor was updated.
  final DateTime? updatedAt;

  /// The user name of the person that last updated the monitor.
  final String? updatedBy;

  GetMonitorResponse({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.identityCenterApplicationArn,
    required this.identityCenterInstanceArn,
    required this.monitorId,
    required this.roleArn,
    required this.subdomain,
    required this.url,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetMonitorResponse.fromJson(Map<String, dynamic> json) {
    return GetMonitorResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      identityCenterApplicationArn:
          json['identityCenterApplicationArn'] as String,
      identityCenterInstanceArn: json['identityCenterInstanceArn'] as String,
      monitorId: json['monitorId'] as String,
      roleArn: json['roleArn'] as String,
      subdomain: json['subdomain'] as String,
      url: json['url'] as String,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final identityCenterInstanceArn = this.identityCenterInstanceArn;
    final monitorId = this.monitorId;
    final roleArn = this.roleArn;
    final subdomain = this.subdomain;
    final url = this.url;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'identityCenterApplicationArn': identityCenterApplicationArn,
      'identityCenterInstanceArn': identityCenterInstanceArn,
      'monitorId': monitorId,
      'roleArn': roleArn,
      'subdomain': subdomain,
      'url': url,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetQueueEnvironmentResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.&gt;
  final String createdBy;

  /// The name of the queue environment.
  final String name;

  /// The priority of the queue environment.
  final int priority;

  /// The queue environment ID.
  final String queueEnvironmentId;

  /// The template for the queue environment.
  final String template;

  /// The type of template for the queue environment.
  final EnvironmentTemplateType templateType;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetQueueEnvironmentResponse({
    required this.createdAt,
    required this.createdBy,
    required this.name,
    required this.priority,
    required this.queueEnvironmentId,
    required this.template,
    required this.templateType,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueEnvironmentResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueEnvironmentResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      name: json['name'] as String,
      priority: json['priority'] as int,
      queueEnvironmentId: json['queueEnvironmentId'] as String,
      template: json['template'] as String,
      templateType:
          (json['templateType'] as String).toEnvironmentTemplateType(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final name = this.name;
    final priority = this.priority;
    final queueEnvironmentId = this.queueEnvironmentId;
    final template = this.template;
    final templateType = this.templateType;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'name': name,
      'priority': priority,
      'queueEnvironmentId': queueEnvironmentId,
      'template': template,
      'templateType': templateType.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetQueueFleetAssociationResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The fleet ID for the queue-fleet association.
  final String fleetId;

  /// The queue ID for the queue-fleet association.
  final String queueId;

  /// The status of the queue-fleet association.
  final QueueFleetAssociationStatus status;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetQueueFleetAssociationResponse({
    required this.createdAt,
    required this.createdBy,
    required this.fleetId,
    required this.queueId,
    required this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueFleetAssociationResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueFleetAssociationResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      fleetId: json['fleetId'] as String,
      queueId: json['queueId'] as String,
      status: (json['status'] as String).toQueueFleetAssociationStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fleetId = this.fleetId;
    final queueId = this.queueId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'fleetId': fleetId,
      'queueId': queueId,
      'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetQueueResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The default action taken on a queue if a budget wasn't configured.
  final DefaultQueueBudgetAction defaultBudgetAction;

  /// The display name of the queue.
  final String displayName;

  /// The farm ID for the queue.
  final String farmId;

  /// The queue ID.
  final String queueId;

  /// The status of the queue.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–The queue is active.
  /// </li>
  /// <li>
  /// <code>SCHEDULING</code>–The queue is scheduling.
  /// </li>
  /// <li>
  /// <code>SCHEDULING_BLOCKED</code>–The queue scheduling is blocked. See the
  /// provided reason.
  /// </li>
  /// </ul>
  final QueueStatus status;

  /// The storage profile IDs for the queue.
  final List<String>? allowedStorageProfileIds;

  /// The reason the queue was blocked.
  final QueueBlockedReason? blockedReason;

  /// The description of the queue.
  final String? description;

  /// The job attachment settings for the queue.
  final JobAttachmentSettings? jobAttachmentSettings;

  /// The jobs in the queue ran as this specified POSIX user.
  final JobRunAsUser? jobRunAsUser;

  /// A list of the required file system location names in the queue.
  final List<String>? requiredFileSystemLocationNames;

  /// The IAM role ARN.
  final String? roleArn;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetQueueResponse({
    required this.createdAt,
    required this.createdBy,
    required this.defaultBudgetAction,
    required this.displayName,
    required this.farmId,
    required this.queueId,
    required this.status,
    this.allowedStorageProfileIds,
    this.blockedReason,
    this.description,
    this.jobAttachmentSettings,
    this.jobRunAsUser,
    this.requiredFileSystemLocationNames,
    this.roleArn,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetQueueResponse.fromJson(Map<String, dynamic> json) {
    return GetQueueResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      defaultBudgetAction:
          (json['defaultBudgetAction'] as String).toDefaultQueueBudgetAction(),
      displayName: json['displayName'] as String,
      farmId: json['farmId'] as String,
      queueId: json['queueId'] as String,
      status: (json['status'] as String).toQueueStatus(),
      allowedStorageProfileIds: (json['allowedStorageProfileIds'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      blockedReason: (json['blockedReason'] as String?)?.toQueueBlockedReason(),
      description: json['description'] as String?,
      jobAttachmentSettings: json['jobAttachmentSettings'] != null
          ? JobAttachmentSettings.fromJson(
              json['jobAttachmentSettings'] as Map<String, dynamic>)
          : null,
      jobRunAsUser: json['jobRunAsUser'] != null
          ? JobRunAsUser.fromJson(json['jobRunAsUser'] as Map<String, dynamic>)
          : null,
      requiredFileSystemLocationNames:
          (json['requiredFileSystemLocationNames'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      roleArn: json['roleArn'] as String?,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final defaultBudgetAction = this.defaultBudgetAction;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final queueId = this.queueId;
    final status = this.status;
    final allowedStorageProfileIds = this.allowedStorageProfileIds;
    final blockedReason = this.blockedReason;
    final description = this.description;
    final jobAttachmentSettings = this.jobAttachmentSettings;
    final jobRunAsUser = this.jobRunAsUser;
    final requiredFileSystemLocationNames =
        this.requiredFileSystemLocationNames;
    final roleArn = this.roleArn;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'defaultBudgetAction': defaultBudgetAction.toValue(),
      'displayName': displayName,
      'farmId': farmId,
      'queueId': queueId,
      'status': status.toValue(),
      if (allowedStorageProfileIds != null)
        'allowedStorageProfileIds': allowedStorageProfileIds,
      if (blockedReason != null) 'blockedReason': blockedReason.toValue(),
      if (description != null) 'description': description,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (requiredFileSystemLocationNames != null)
        'requiredFileSystemLocationNames': requiredFileSystemLocationNames,
      if (roleArn != null) 'roleArn': roleArn,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetSessionActionResponse {
  /// The session action definition.
  final SessionActionDefinition definition;

  /// The session action ID.
  final String sessionActionId;

  /// The session ID for the session action.
  final String sessionId;

  /// The status of the session action.
  final SessionActionStatus status;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The exit code to exit the session.
  final int? processExitCode;

  /// The message that communicates the progress of the session action.
  final String? progressMessage;

  /// The percentage completed for a session action.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The Linux timestamp of the date and time the session action was last
  /// updated.
  final DateTime? workerUpdatedAt;

  GetSessionActionResponse({
    required this.definition,
    required this.sessionActionId,
    required this.sessionId,
    required this.status,
    this.endedAt,
    this.processExitCode,
    this.progressMessage,
    this.progressPercent,
    this.startedAt,
    this.workerUpdatedAt,
  });

  factory GetSessionActionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionActionResponse(
      definition: SessionActionDefinition.fromJson(
          json['definition'] as Map<String, dynamic>),
      sessionActionId: json['sessionActionId'] as String,
      sessionId: json['sessionId'] as String,
      status: (json['status'] as String).toSessionActionStatus(),
      endedAt: timeStampFromJson(json['endedAt']),
      processExitCode: json['processExitCode'] as int?,
      progressMessage: json['progressMessage'] as String?,
      progressPercent: json['progressPercent'] as double?,
      startedAt: timeStampFromJson(json['startedAt']),
      workerUpdatedAt: timeStampFromJson(json['workerUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final sessionActionId = this.sessionActionId;
    final sessionId = this.sessionId;
    final status = this.status;
    final endedAt = this.endedAt;
    final processExitCode = this.processExitCode;
    final progressMessage = this.progressMessage;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final workerUpdatedAt = this.workerUpdatedAt;
    return {
      'definition': definition,
      'sessionActionId': sessionActionId,
      'sessionId': sessionId,
      'status': status.toValue(),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (processExitCode != null) 'processExitCode': processExitCode,
      if (progressMessage != null) 'progressMessage': progressMessage,
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (workerUpdatedAt != null)
        'workerUpdatedAt': iso8601ToJson(workerUpdatedAt),
    };
  }
}

class GetSessionResponse {
  /// The fleet ID for the session.
  final String fleetId;

  /// The life cycle status of the session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The session log.
  final LogConfiguration log;

  /// The session ID.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The worker ID for the session.
  final String workerId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// Provides the Amazon EC2 properties of the host.
  final HostPropertiesResponse? hostProperties;

  /// The life cycle status with which the session started.
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  /// The worker log for the session.
  final LogConfiguration? workerLog;

  GetSessionResponse({
    required this.fleetId,
    required this.lifecycleStatus,
    required this.log,
    required this.sessionId,
    required this.startedAt,
    required this.workerId,
    this.endedAt,
    this.hostProperties,
    this.targetLifecycleStatus,
    this.updatedAt,
    this.updatedBy,
    this.workerLog,
  });

  factory GetSessionResponse.fromJson(Map<String, dynamic> json) {
    return GetSessionResponse(
      fleetId: json['fleetId'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toSessionLifecycleStatus(),
      log: LogConfiguration.fromJson(json['log'] as Map<String, dynamic>),
      sessionId: json['sessionId'] as String,
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      workerId: json['workerId'] as String,
      endedAt: timeStampFromJson(json['endedAt']),
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.toSessionLifecycleTargetStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      workerLog: json['workerLog'] != null
          ? LogConfiguration.fromJson(json['workerLog'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    final lifecycleStatus = this.lifecycleStatus;
    final log = this.log;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final workerId = this.workerId;
    final endedAt = this.endedAt;
    final hostProperties = this.hostProperties;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final workerLog = this.workerLog;
    return {
      'fleetId': fleetId,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'log': log,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      'workerId': workerId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (workerLog != null) 'workerLog': workerLog,
    };
  }
}

class GetSessionsStatisticsAggregationResponse {
  /// The status of the aggregated results.
  final SessionsStatisticsAggregationStatus status;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  /// The statistics for the specified fleets or queues.
  final List<Statistics>? statistics;

  /// A message that describes the status.
  final String? statusMessage;

  GetSessionsStatisticsAggregationResponse({
    required this.status,
    this.nextToken,
    this.statistics,
    this.statusMessage,
  });

  factory GetSessionsStatisticsAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetSessionsStatisticsAggregationResponse(
      status:
          (json['status'] as String).toSessionsStatisticsAggregationStatus(),
      nextToken: json['nextToken'] as String?,
      statistics: (json['statistics'] as List?)
          ?.whereNotNull()
          .map((e) => Statistics.fromJson(e as Map<String, dynamic>))
          .toList(),
      statusMessage: json['statusMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final nextToken = this.nextToken;
    final statistics = this.statistics;
    final statusMessage = this.statusMessage;
    return {
      'status': status.toValue(),
      if (nextToken != null) 'nextToken': nextToken,
      if (statistics != null) 'statistics': statistics,
      if (statusMessage != null) 'statusMessage': statusMessage,
    };
  }
}

class GetStepResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The life cycle status of the step.
  final StepLifecycleStatus lifecycleStatus;

  /// The name of the step.
  final String name;

  /// The step ID.
  final String stepId;

  /// The task run status for the job.
  final TaskRunStatus taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int> taskRunStatusCounts;

  /// The number of dependencies in the step.
  final DependencyCounts? dependencyCounts;

  /// The description of the step.
  final String? description;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// A message that describes the lifecycle status of the step.
  final String? lifecycleStatusMessage;

  /// A list of step parameters and the combination expression for the step.
  final ParameterSpace? parameterSpace;

  /// The required capabilities of the step.
  final StepRequiredCapabilities? requiredCapabilities;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status with which the job started.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetStepResponse({
    required this.createdAt,
    required this.createdBy,
    required this.lifecycleStatus,
    required this.name,
    required this.stepId,
    required this.taskRunStatus,
    required this.taskRunStatusCounts,
    this.dependencyCounts,
    this.description,
    this.endedAt,
    this.lifecycleStatusMessage,
    this.parameterSpace,
    this.requiredCapabilities,
    this.startedAt,
    this.targetTaskRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetStepResponse.fromJson(Map<String, dynamic> json) {
    return GetStepResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toStepLifecycleStatus(),
      name: json['name'] as String,
      stepId: json['stepId'] as String,
      taskRunStatus: (json['taskRunStatus'] as String).toTaskRunStatus(),
      taskRunStatusCounts: (json['taskRunStatusCounts'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k.toTaskRunStatus(), e as int)),
      dependencyCounts: json['dependencyCounts'] != null
          ? DependencyCounts.fromJson(
              json['dependencyCounts'] as Map<String, dynamic>)
          : null,
      description: json['description'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      parameterSpace: json['parameterSpace'] != null
          ? ParameterSpace.fromJson(
              json['parameterSpace'] as Map<String, dynamic>)
          : null,
      requiredCapabilities: json['requiredCapabilities'] != null
          ? StepRequiredCapabilities.fromJson(
              json['requiredCapabilities'] as Map<String, dynamic>)
          : null,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus:
          (json['targetTaskRunStatus'] as String?)?.toStepTargetTaskRunStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final lifecycleStatus = this.lifecycleStatus;
    final name = this.name;
    final stepId = this.stepId;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final dependencyCounts = this.dependencyCounts;
    final description = this.description;
    final endedAt = this.endedAt;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final parameterSpace = this.parameterSpace;
    final requiredCapabilities = this.requiredCapabilities;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'name': name,
      'stepId': stepId,
      'taskRunStatus': taskRunStatus.toValue(),
      'taskRunStatusCounts':
          taskRunStatusCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (dependencyCounts != null) 'dependencyCounts': dependencyCounts,
      if (description != null) 'description': description,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (parameterSpace != null) 'parameterSpace': parameterSpace,
      if (requiredCapabilities != null)
        'requiredCapabilities': requiredCapabilities,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetStorageProfileForQueueResponse {
  /// The display name of the storage profile connected to a queue.
  final String displayName;

  /// The operating system of the storage profile in the queue.
  final StorageProfileOperatingSystemFamily osFamily;

  /// The storage profile ID.
  final String storageProfileId;

  /// The location of the files for the storage profile within the queue.
  final List<FileSystemLocation>? fileSystemLocations;

  GetStorageProfileForQueueResponse({
    required this.displayName,
    required this.osFamily,
    required this.storageProfileId,
    this.fileSystemLocations,
  });

  factory GetStorageProfileForQueueResponse.fromJson(
      Map<String, dynamic> json) {
    return GetStorageProfileForQueueResponse(
      displayName: json['displayName'] as String,
      osFamily:
          (json['osFamily'] as String).toStorageProfileOperatingSystemFamily(),
      storageProfileId: json['storageProfileId'] as String,
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.whereNotNull()
          .map((e) => FileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final osFamily = this.osFamily;
    final storageProfileId = this.storageProfileId;
    final fileSystemLocations = this.fileSystemLocations;
    return {
      'displayName': displayName,
      'osFamily': osFamily.toValue(),
      'storageProfileId': storageProfileId,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
    };
  }
}

class GetStorageProfileResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The display name of the storage profile.
  final String displayName;

  /// The operating system (OS) for the storage profile.
  final StorageProfileOperatingSystemFamily osFamily;

  /// The storage profile ID.
  final String storageProfileId;

  /// The location of the files for the storage profile.
  final List<FileSystemLocation>? fileSystemLocations;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetStorageProfileResponse({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.osFamily,
    required this.storageProfileId,
    this.fileSystemLocations,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetStorageProfileResponse.fromJson(Map<String, dynamic> json) {
    return GetStorageProfileResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      osFamily:
          (json['osFamily'] as String).toStorageProfileOperatingSystemFamily(),
      storageProfileId: json['storageProfileId'] as String,
      fileSystemLocations: (json['fileSystemLocations'] as List?)
          ?.whereNotNull()
          .map((e) => FileSystemLocation.fromJson(e as Map<String, dynamic>))
          .toList(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final osFamily = this.osFamily;
    final storageProfileId = this.storageProfileId;
    final fileSystemLocations = this.fileSystemLocations;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'osFamily': osFamily.toValue(),
      'storageProfileId': storageProfileId,
      if (fileSystemLocations != null)
        'fileSystemLocations': fileSystemLocations,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetTaskResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The run status for the task.
  final TaskRunStatus runStatus;

  /// The task ID.
  final String taskId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times that the task failed and was retried.
  final int? failureRetryCount;

  /// The latest session ID for the task.
  final String? latestSessionActionId;

  /// The parameters for the task.
  final Map<String, TaskParameterValue>? parameters;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The run status with which to start the task.
  final TaskTargetRunStatus? targetRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetTaskResponse({
    required this.createdAt,
    required this.createdBy,
    required this.runStatus,
    required this.taskId,
    this.endedAt,
    this.failureRetryCount,
    this.latestSessionActionId,
    this.parameters,
    this.startedAt,
    this.targetRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetTaskResponse.fromJson(Map<String, dynamic> json) {
    return GetTaskResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      runStatus: (json['runStatus'] as String).toTaskRunStatus(),
      taskId: json['taskId'] as String,
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      latestSessionActionId: json['latestSessionActionId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      startedAt: timeStampFromJson(json['startedAt']),
      targetRunStatus:
          (json['targetRunStatus'] as String?)?.toTaskTargetRunStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final runStatus = this.runStatus;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final latestSessionActionId = this.latestSessionActionId;
    final parameters = this.parameters;
    final startedAt = this.startedAt;
    final targetRunStatus = this.targetRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'runStatus': runStatus.toValue(),
      'taskId': taskId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (latestSessionActionId != null)
        'latestSessionActionId': latestSessionActionId,
      if (parameters != null) 'parameters': parameters,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

class GetWorkerResponse {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The status of the worker.
  final WorkerStatus status;

  /// The worker ID.
  final String workerId;

  /// The host properties for the worker.
  final HostPropertiesResponse? hostProperties;

  /// The logs for the associated worker.
  final LogConfiguration? log;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  GetWorkerResponse({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.fleetId,
    required this.status,
    required this.workerId,
    this.hostProperties,
    this.log,
    this.updatedAt,
    this.updatedBy,
  });

  factory GetWorkerResponse.fromJson(Map<String, dynamic> json) {
    return GetWorkerResponse(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      farmId: json['farmId'] as String,
      fleetId: json['fleetId'] as String,
      status: (json['status'] as String).toWorkerStatus(),
      workerId: json['workerId'] as String,
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final status = this.status;
    final workerId = this.workerId;
    final hostProperties = this.hostProperties;
    final log = this.log;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'fleetId': fleetId,
      'status': status.toValue(),
      'workerId': workerId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (log != null) 'log': log,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The host property details.
class HostPropertiesRequest {
  /// The host name.
  final String? hostName;

  /// The IP address of the host.
  final IpAddresses? ipAddresses;

  HostPropertiesRequest({
    this.hostName,
    this.ipAddresses,
  });

  Map<String, dynamic> toJson() {
    final hostName = this.hostName;
    final ipAddresses = this.ipAddresses;
    return {
      if (hostName != null) 'hostName': hostName,
      if (ipAddresses != null) 'ipAddresses': ipAddresses,
    };
  }
}

/// The host property details.
class HostPropertiesResponse {
  /// The ARN of the host EC2 instance.
  final String? ec2InstanceArn;

  /// The instance type of the host EC2 instance.
  final String? ec2InstanceType;

  /// The host name.
  final String? hostName;

  /// The IP address of the host.
  final IpAddresses? ipAddresses;

  HostPropertiesResponse({
    this.ec2InstanceArn,
    this.ec2InstanceType,
    this.hostName,
    this.ipAddresses,
  });

  factory HostPropertiesResponse.fromJson(Map<String, dynamic> json) {
    return HostPropertiesResponse(
      ec2InstanceArn: json['ec2InstanceArn'] as String?,
      ec2InstanceType: json['ec2InstanceType'] as String?,
      hostName: json['hostName'] as String?,
      ipAddresses: json['ipAddresses'] != null
          ? IpAddresses.fromJson(json['ipAddresses'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceArn = this.ec2InstanceArn;
    final ec2InstanceType = this.ec2InstanceType;
    final hostName = this.hostName;
    final ipAddresses = this.ipAddresses;
    return {
      if (ec2InstanceArn != null) 'ec2InstanceArn': ec2InstanceArn,
      if (ec2InstanceType != null) 'ec2InstanceType': ec2InstanceType,
      if (hostName != null) 'hostName': hostName,
      if (ipAddresses != null) 'ipAddresses': ipAddresses,
    };
  }
}

/// The IP addresses for a host.
class IpAddresses {
  /// The IpV4 address of the network.
  final List<String>? ipV4Addresses;

  /// The IpV6 address for the network and node component.
  final List<String>? ipV6Addresses;

  IpAddresses({
    this.ipV4Addresses,
    this.ipV6Addresses,
  });

  factory IpAddresses.fromJson(Map<String, dynamic> json) {
    return IpAddresses(
      ipV4Addresses: (json['ipV4Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      ipV6Addresses: (json['ipV6Addresses'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final ipV4Addresses = this.ipV4Addresses;
    final ipV6Addresses = this.ipV6Addresses;
    return {
      if (ipV4Addresses != null) 'ipV4Addresses': ipV4Addresses,
      if (ipV6Addresses != null) 'ipV6Addresses': ipV6Addresses,
    };
  }
}

/// The job attachments.
class JobAttachmentDetailsEntity {
  /// The job attachments.
  final Attachments attachments;

  /// The job ID.
  final String jobId;

  JobAttachmentDetailsEntity({
    required this.attachments,
    required this.jobId,
  });

  factory JobAttachmentDetailsEntity.fromJson(Map<String, dynamic> json) {
    return JobAttachmentDetailsEntity(
      attachments:
          Attachments.fromJson(json['attachments'] as Map<String, dynamic>),
      jobId: json['jobId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final attachments = this.attachments;
    final jobId = this.jobId;
    return {
      'attachments': attachments,
      'jobId': jobId,
    };
  }
}

/// The error details for job attachments.
class JobAttachmentDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  JobAttachmentDetailsError({
    required this.code,
    required this.jobId,
    required this.message,
  });

  factory JobAttachmentDetailsError.fromJson(Map<String, dynamic> json) {
    return JobAttachmentDetailsError(
      code: (json['code'] as String).toJobEntityErrorCode(),
      jobId: json['jobId'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobId = this.jobId;
    final message = this.message;
    return {
      'code': code.toValue(),
      'jobId': jobId,
      'message': message,
    };
  }
}

/// Identifier details for job attachments.
class JobAttachmentDetailsIdentifiers {
  /// The job ID.
  final String jobId;

  JobAttachmentDetailsIdentifiers({
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// The job attachment settings. These are the Amazon S3 bucket name and the
/// Amazon S3 prefix.
class JobAttachmentSettings {
  /// The root prefix.
  final String rootPrefix;

  /// The Amazon S3 bucket name.
  final String s3BucketName;

  JobAttachmentSettings({
    required this.rootPrefix,
    required this.s3BucketName,
  });

  factory JobAttachmentSettings.fromJson(Map<String, dynamic> json) {
    return JobAttachmentSettings(
      rootPrefix: json['rootPrefix'] as String,
      s3BucketName: json['s3BucketName'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final rootPrefix = this.rootPrefix;
    final s3BucketName = this.s3BucketName;
    return {
      'rootPrefix': rootPrefix,
      's3BucketName': s3BucketName,
    };
  }
}

enum JobAttachmentsFileSystem {
  copied,
  virtual,
}

extension JobAttachmentsFileSystemValueExtension on JobAttachmentsFileSystem {
  String toValue() {
    switch (this) {
      case JobAttachmentsFileSystem.copied:
        return 'COPIED';
      case JobAttachmentsFileSystem.virtual:
        return 'VIRTUAL';
    }
  }
}

extension JobAttachmentsFileSystemFromString on String {
  JobAttachmentsFileSystem toJobAttachmentsFileSystem() {
    switch (this) {
      case 'COPIED':
        return JobAttachmentsFileSystem.copied;
      case 'VIRTUAL':
        return JobAttachmentsFileSystem.virtual;
    }
    throw Exception('$this is not known in enum JobAttachmentsFileSystem');
  }
}

/// The job details for a specific job.
class JobDetailsEntity {
  /// The job ID.
  final String jobId;

  /// The log group name.
  final String logGroupName;

  /// The schema version.
  final String schemaVersion;

  /// The job attachment settings.
  final JobAttachmentSettings? jobAttachmentSettings;

  /// The user name and group that the job uses when run.
  final JobRunAsUser? jobRunAsUser;

  /// The parameters.
  final Map<String, JobParameter>? parameters;

  /// The path mapping rules.
  final List<PathMappingRule>? pathMappingRules;

  /// The queue role ARN.
  final String? queueRoleArn;

  JobDetailsEntity({
    required this.jobId,
    required this.logGroupName,
    required this.schemaVersion,
    this.jobAttachmentSettings,
    this.jobRunAsUser,
    this.parameters,
    this.pathMappingRules,
    this.queueRoleArn,
  });

  factory JobDetailsEntity.fromJson(Map<String, dynamic> json) {
    return JobDetailsEntity(
      jobId: json['jobId'] as String,
      logGroupName: json['logGroupName'] as String,
      schemaVersion: json['schemaVersion'] as String,
      jobAttachmentSettings: json['jobAttachmentSettings'] != null
          ? JobAttachmentSettings.fromJson(
              json['jobAttachmentSettings'] as Map<String, dynamic>)
          : null,
      jobRunAsUser: json['jobRunAsUser'] != null
          ? JobRunAsUser.fromJson(json['jobRunAsUser'] as Map<String, dynamic>)
          : null,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      pathMappingRules: (json['pathMappingRules'] as List?)
          ?.whereNotNull()
          .map((e) => PathMappingRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      queueRoleArn: json['queueRoleArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final logGroupName = this.logGroupName;
    final schemaVersion = this.schemaVersion;
    final jobAttachmentSettings = this.jobAttachmentSettings;
    final jobRunAsUser = this.jobRunAsUser;
    final parameters = this.parameters;
    final pathMappingRules = this.pathMappingRules;
    final queueRoleArn = this.queueRoleArn;
    return {
      'jobId': jobId,
      'logGroupName': logGroupName,
      'schemaVersion': schemaVersion,
      if (jobAttachmentSettings != null)
        'jobAttachmentSettings': jobAttachmentSettings,
      if (jobRunAsUser != null) 'jobRunAsUser': jobRunAsUser,
      if (parameters != null) 'parameters': parameters,
      if (pathMappingRules != null) 'pathMappingRules': pathMappingRules,
      if (queueRoleArn != null) 'queueRoleArn': queueRoleArn,
    };
  }
}

/// The details of a job error.
class JobDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  JobDetailsError({
    required this.code,
    required this.jobId,
    required this.message,
  });

  factory JobDetailsError.fromJson(Map<String, dynamic> json) {
    return JobDetailsError(
      code: (json['code'] as String).toJobEntityErrorCode(),
      jobId: json['jobId'] as String,
      message: json['message'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobId = this.jobId;
    final message = this.message;
    return {
      'code': code.toValue(),
      'jobId': jobId,
      'message': message,
    };
  }
}

/// The identifiers for a job.
class JobDetailsIdentifiers {
  /// The job ID.
  final String jobId;

  JobDetailsIdentifiers({
    required this.jobId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    return {
      'jobId': jobId,
    };
  }
}

/// The details of a job entity.
class JobEntity {
  /// The environment details for the job entity.
  final EnvironmentDetailsEntity? environmentDetails;

  /// The job attachment details.
  final JobAttachmentDetailsEntity? jobAttachmentDetails;

  /// The job details.
  final JobDetailsEntity? jobDetails;

  /// The step details.
  final StepDetailsEntity? stepDetails;

  JobEntity({
    this.environmentDetails,
    this.jobAttachmentDetails,
    this.jobDetails,
    this.stepDetails,
  });

  factory JobEntity.fromJson(Map<String, dynamic> json) {
    return JobEntity(
      environmentDetails: json['environmentDetails'] != null
          ? EnvironmentDetailsEntity.fromJson(
              json['environmentDetails'] as Map<String, dynamic>)
          : null,
      jobAttachmentDetails: json['jobAttachmentDetails'] != null
          ? JobAttachmentDetailsEntity.fromJson(
              json['jobAttachmentDetails'] as Map<String, dynamic>)
          : null,
      jobDetails: json['jobDetails'] != null
          ? JobDetailsEntity.fromJson(
              json['jobDetails'] as Map<String, dynamic>)
          : null,
      stepDetails: json['stepDetails'] != null
          ? StepDetailsEntity.fromJson(
              json['stepDetails'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final environmentDetails = this.environmentDetails;
    final jobAttachmentDetails = this.jobAttachmentDetails;
    final jobDetails = this.jobDetails;
    final stepDetails = this.stepDetails;
    return {
      if (environmentDetails != null) 'environmentDetails': environmentDetails,
      if (jobAttachmentDetails != null)
        'jobAttachmentDetails': jobAttachmentDetails,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (stepDetails != null) 'stepDetails': stepDetails,
    };
  }
}

enum JobEntityErrorCode {
  accessDeniedException,
  internalServerException,
  validationException,
  resourceNotFoundException,
  maxPayloadSizeExceeded,
  conflictException,
}

extension JobEntityErrorCodeValueExtension on JobEntityErrorCode {
  String toValue() {
    switch (this) {
      case JobEntityErrorCode.accessDeniedException:
        return 'AccessDeniedException';
      case JobEntityErrorCode.internalServerException:
        return 'InternalServerException';
      case JobEntityErrorCode.validationException:
        return 'ValidationException';
      case JobEntityErrorCode.resourceNotFoundException:
        return 'ResourceNotFoundException';
      case JobEntityErrorCode.maxPayloadSizeExceeded:
        return 'MaxPayloadSizeExceeded';
      case JobEntityErrorCode.conflictException:
        return 'ConflictException';
    }
  }
}

extension JobEntityErrorCodeFromString on String {
  JobEntityErrorCode toJobEntityErrorCode() {
    switch (this) {
      case 'AccessDeniedException':
        return JobEntityErrorCode.accessDeniedException;
      case 'InternalServerException':
        return JobEntityErrorCode.internalServerException;
      case 'ValidationException':
        return JobEntityErrorCode.validationException;
      case 'ResourceNotFoundException':
        return JobEntityErrorCode.resourceNotFoundException;
      case 'MaxPayloadSizeExceeded':
        return JobEntityErrorCode.maxPayloadSizeExceeded;
      case 'ConflictException':
        return JobEntityErrorCode.conflictException;
    }
    throw Exception('$this is not known in enum JobEntityErrorCode');
  }
}

/// The details of a job entity identifier.
class JobEntityIdentifiersUnion {
  /// The environment details.
  final EnvironmentDetailsIdentifiers? environmentDetails;

  /// The job attachment details.
  final JobAttachmentDetailsIdentifiers? jobAttachmentDetails;

  /// The job details.
  final JobDetailsIdentifiers? jobDetails;

  /// The step details.
  final StepDetailsIdentifiers? stepDetails;

  JobEntityIdentifiersUnion({
    this.environmentDetails,
    this.jobAttachmentDetails,
    this.jobDetails,
    this.stepDetails,
  });

  Map<String, dynamic> toJson() {
    final environmentDetails = this.environmentDetails;
    final jobAttachmentDetails = this.jobAttachmentDetails;
    final jobDetails = this.jobDetails;
    final stepDetails = this.stepDetails;
    return {
      if (environmentDetails != null) 'environmentDetails': environmentDetails,
      if (jobAttachmentDetails != null)
        'jobAttachmentDetails': jobAttachmentDetails,
      if (jobDetails != null) 'jobDetails': jobDetails,
      if (stepDetails != null) 'stepDetails': stepDetails,
    };
  }
}

enum JobLifecycleStatus {
  createInProgress,
  createFailed,
  createComplete,
  uploadInProgress,
  uploadFailed,
  updateInProgress,
  updateFailed,
  updateSucceeded,
  archived,
}

extension JobLifecycleStatusValueExtension on JobLifecycleStatus {
  String toValue() {
    switch (this) {
      case JobLifecycleStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case JobLifecycleStatus.createFailed:
        return 'CREATE_FAILED';
      case JobLifecycleStatus.createComplete:
        return 'CREATE_COMPLETE';
      case JobLifecycleStatus.uploadInProgress:
        return 'UPLOAD_IN_PROGRESS';
      case JobLifecycleStatus.uploadFailed:
        return 'UPLOAD_FAILED';
      case JobLifecycleStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case JobLifecycleStatus.updateFailed:
        return 'UPDATE_FAILED';
      case JobLifecycleStatus.updateSucceeded:
        return 'UPDATE_SUCCEEDED';
      case JobLifecycleStatus.archived:
        return 'ARCHIVED';
    }
  }
}

extension JobLifecycleStatusFromString on String {
  JobLifecycleStatus toJobLifecycleStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return JobLifecycleStatus.createInProgress;
      case 'CREATE_FAILED':
        return JobLifecycleStatus.createFailed;
      case 'CREATE_COMPLETE':
        return JobLifecycleStatus.createComplete;
      case 'UPLOAD_IN_PROGRESS':
        return JobLifecycleStatus.uploadInProgress;
      case 'UPLOAD_FAILED':
        return JobLifecycleStatus.uploadFailed;
      case 'UPDATE_IN_PROGRESS':
        return JobLifecycleStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return JobLifecycleStatus.updateFailed;
      case 'UPDATE_SUCCEEDED':
        return JobLifecycleStatus.updateSucceeded;
      case 'ARCHIVED':
        return JobLifecycleStatus.archived;
    }
    throw Exception('$this is not known in enum JobLifecycleStatus');
  }
}

/// The details for a job member.
class JobMember {
  /// The farm ID.
  final String farmId;

  /// The identity store ID.
  final String identityStoreId;

  /// The job ID.
  final String jobId;

  /// The job member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the job member.
  final String principalId;

  /// The principal type of the job member.
  final PrincipalType principalType;

  /// The queue ID.
  final String queueId;

  JobMember({
    required this.farmId,
    required this.identityStoreId,
    required this.jobId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
    required this.queueId,
  });

  factory JobMember.fromJson(Map<String, dynamic> json) {
    return JobMember(
      farmId: json['farmId'] as String,
      identityStoreId: json['identityStoreId'] as String,
      jobId: json['jobId'] as String,
      membershipLevel: (json['membershipLevel'] as String).toMembershipLevel(),
      principalId: json['principalId'] as String,
      principalType: (json['principalType'] as String).toPrincipalType(),
      queueId: json['queueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final identityStoreId = this.identityStoreId;
    final jobId = this.jobId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    final queueId = this.queueId;
    return {
      'farmId': farmId,
      'identityStoreId': identityStoreId,
      'jobId': jobId,
      'membershipLevel': membershipLevel.toValue(),
      'principalId': principalId,
      'principalType': principalType.toValue(),
      'queueId': queueId,
    };
  }
}

/// The details of job parameters.
class JobParameter {
  /// A double precision IEEE-754 floating point number represented as a string.
  final String? float;

  /// A signed integer represented as a string.
  final String? intValue;

  /// A file system path represented as a string.
  final String? path;

  /// A UTF-8 string.
  final String? string;

  JobParameter({
    this.float,
    this.intValue,
    this.path,
    this.string,
  });

  factory JobParameter.fromJson(Map<String, dynamic> json) {
    return JobParameter(
      float: json['float'] as String?,
      intValue: json['int'] as String?,
      path: json['path'] as String?,
      string: json['string'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final float = this.float;
    final intValue = this.intValue;
    final path = this.path;
    final string = this.string;
    return {
      if (float != null) 'float': float,
      if (intValue != null) 'int': intValue,
      if (path != null) 'path': path,
      if (string != null) 'string': string,
    };
  }
}

/// Identifies the user for a job.
class JobRunAsUser {
  /// Specifies whether the job should run using the queue's system user or if the
  /// job should run using the worker agent system user.
  final RunAs runAs;

  /// The user and group that the jobs in the queue run as.
  final PosixUser? posix;

  /// Identifies a Microsoft Windows user.
  final WindowsUser? windows;

  JobRunAsUser({
    required this.runAs,
    this.posix,
    this.windows,
  });

  factory JobRunAsUser.fromJson(Map<String, dynamic> json) {
    return JobRunAsUser(
      runAs: (json['runAs'] as String).toRunAs(),
      posix: json['posix'] != null
          ? PosixUser.fromJson(json['posix'] as Map<String, dynamic>)
          : null,
      windows: json['windows'] != null
          ? WindowsUser.fromJson(json['windows'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final runAs = this.runAs;
    final posix = this.posix;
    final windows = this.windows;
    return {
      'runAs': runAs.toValue(),
      if (posix != null) 'posix': posix,
      if (windows != null) 'windows': windows,
    };
  }
}

/// The details of a job search.
class JobSearchSummary {
  /// The date and time the resource was created.
  final DateTime? createdAt;

  /// The user or system that created this resource.
  final String? createdBy;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The job ID.
  final String? jobId;

  /// The job parameters.
  final Map<String, JobParameter>? jobParameters;

  /// The life cycle status.
  final JobLifecycleStatus? lifecycleStatus;

  /// The life cycle status message.
  final String? lifecycleStatusMessage;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries for a job.
  final int? maxRetriesPerTask;

  /// The job name.
  final String? name;

  /// The job priority.
  final int? priority;

  /// The queue ID.
  final String? queueId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to start with on the job.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to be processed.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to be run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  JobSearchSummary({
    this.createdAt,
    this.createdBy,
    this.endedAt,
    this.jobId,
    this.jobParameters,
    this.lifecycleStatus,
    this.lifecycleStatusMessage,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.name,
    this.priority,
    this.queueId,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskRunStatus,
    this.taskRunStatusCounts,
  });

  factory JobSearchSummary.fromJson(Map<String, dynamic> json) {
    return JobSearchSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      endedAt: timeStampFromJson(json['endedAt']),
      jobId: json['jobId'] as String?,
      jobParameters: (json['jobParameters'] as Map<String, dynamic>?)?.map(
          (k, e) =>
              MapEntry(k, JobParameter.fromJson(e as Map<String, dynamic>))),
      lifecycleStatus:
          (json['lifecycleStatus'] as String?)?.toJobLifecycleStatus(),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      name: json['name'] as String?,
      priority: json['priority'] as int?,
      queueId: json['queueId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus:
          (json['targetTaskRunStatus'] as String?)?.toJobTargetTaskRunStatus(),
      taskRunStatus: (json['taskRunStatus'] as String?)?.toTaskRunStatus(),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTaskRunStatus(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final endedAt = this.endedAt;
    final jobId = this.jobId;
    final jobParameters = this.jobParameters;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final name = this.name;
    final priority = this.priority;
    final queueId = this.queueId;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (jobId != null) 'jobId': jobId,
      if (jobParameters != null) 'jobParameters': jobParameters,
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.toValue(),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (name != null) 'name': name,
      if (priority != null) 'priority': priority,
      if (queueId != null) 'queueId': queueId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.toValue(),
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// A summary of job details.
class JobSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The job ID.
  final String jobId;

  /// The life cycle status.
  final JobLifecycleStatus lifecycleStatus;

  /// The life cycle status message.
  final String lifecycleStatusMessage;

  /// The job name.
  final String name;

  /// The job priority.
  final int priority;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of task failures before the job stops running and is marked as
  /// <code>FAILED</code>.
  final int? maxFailedTasksCount;

  /// The maximum number of retries for a job.
  final int? maxRetriesPerTask;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to start with on the job.
  final JobTargetTaskRunStatus? targetTaskRunStatus;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to be processed.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to be run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  JobSummary({
    required this.createdAt,
    required this.createdBy,
    required this.jobId,
    required this.lifecycleStatus,
    required this.lifecycleStatusMessage,
    required this.name,
    required this.priority,
    this.endedAt,
    this.maxFailedTasksCount,
    this.maxRetriesPerTask,
    this.startedAt,
    this.targetTaskRunStatus,
    this.taskRunStatus,
    this.taskRunStatusCounts,
    this.updatedAt,
    this.updatedBy,
  });

  factory JobSummary.fromJson(Map<String, dynamic> json) {
    return JobSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      jobId: json['jobId'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toJobLifecycleStatus(),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String,
      name: json['name'] as String,
      priority: json['priority'] as int,
      endedAt: timeStampFromJson(json['endedAt']),
      maxFailedTasksCount: json['maxFailedTasksCount'] as int?,
      maxRetriesPerTask: json['maxRetriesPerTask'] as int?,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus:
          (json['targetTaskRunStatus'] as String?)?.toJobTargetTaskRunStatus(),
      taskRunStatus: (json['taskRunStatus'] as String?)?.toTaskRunStatus(),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTaskRunStatus(), e as int)),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final priority = this.priority;
    final endedAt = this.endedAt;
    final maxFailedTasksCount = this.maxFailedTasksCount;
    final maxRetriesPerTask = this.maxRetriesPerTask;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'lifecycleStatusMessage': lifecycleStatusMessage,
      'name': name,
      'priority': priority,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (maxFailedTasksCount != null)
        'maxFailedTasksCount': maxFailedTasksCount,
      if (maxRetriesPerTask != null) 'maxRetriesPerTask': maxRetriesPerTask,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.toValue(),
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum JobTargetTaskRunStatus {
  ready,
  failed,
  succeeded,
  canceled,
  suspended,
  pending,
}

extension JobTargetTaskRunStatusValueExtension on JobTargetTaskRunStatus {
  String toValue() {
    switch (this) {
      case JobTargetTaskRunStatus.ready:
        return 'READY';
      case JobTargetTaskRunStatus.failed:
        return 'FAILED';
      case JobTargetTaskRunStatus.succeeded:
        return 'SUCCEEDED';
      case JobTargetTaskRunStatus.canceled:
        return 'CANCELED';
      case JobTargetTaskRunStatus.suspended:
        return 'SUSPENDED';
      case JobTargetTaskRunStatus.pending:
        return 'PENDING';
    }
  }
}

extension JobTargetTaskRunStatusFromString on String {
  JobTargetTaskRunStatus toJobTargetTaskRunStatus() {
    switch (this) {
      case 'READY':
        return JobTargetTaskRunStatus.ready;
      case 'FAILED':
        return JobTargetTaskRunStatus.failed;
      case 'SUCCEEDED':
        return JobTargetTaskRunStatus.succeeded;
      case 'CANCELED':
        return JobTargetTaskRunStatus.canceled;
      case 'SUSPENDED':
        return JobTargetTaskRunStatus.suspended;
      case 'PENDING':
        return JobTargetTaskRunStatus.pending;
    }
    throw Exception('$this is not known in enum JobTargetTaskRunStatus');
  }
}

enum JobTemplateType {
  json,
  yaml,
}

extension JobTemplateTypeValueExtension on JobTemplateType {
  String toValue() {
    switch (this) {
      case JobTemplateType.json:
        return 'JSON';
      case JobTemplateType.yaml:
        return 'YAML';
    }
  }
}

extension JobTemplateTypeFromString on String {
  JobTemplateType toJobTemplateType() {
    switch (this) {
      case 'JSON':
        return JobTemplateType.json;
      case 'YAML':
        return JobTemplateType.yaml;
    }
    throw Exception('$this is not known in enum JobTemplateType');
  }
}

enum LicenseEndpointStatus {
  createInProgress,
  deleteInProgress,
  ready,
  notReady,
}

extension LicenseEndpointStatusValueExtension on LicenseEndpointStatus {
  String toValue() {
    switch (this) {
      case LicenseEndpointStatus.createInProgress:
        return 'CREATE_IN_PROGRESS';
      case LicenseEndpointStatus.deleteInProgress:
        return 'DELETE_IN_PROGRESS';
      case LicenseEndpointStatus.ready:
        return 'READY';
      case LicenseEndpointStatus.notReady:
        return 'NOT_READY';
    }
  }
}

extension LicenseEndpointStatusFromString on String {
  LicenseEndpointStatus toLicenseEndpointStatus() {
    switch (this) {
      case 'CREATE_IN_PROGRESS':
        return LicenseEndpointStatus.createInProgress;
      case 'DELETE_IN_PROGRESS':
        return LicenseEndpointStatus.deleteInProgress;
      case 'READY':
        return LicenseEndpointStatus.ready;
      case 'NOT_READY':
        return LicenseEndpointStatus.notReady;
    }
    throw Exception('$this is not known in enum LicenseEndpointStatus');
  }
}

/// The details for a license endpoint.
class LicenseEndpointSummary {
  /// The license endpoint ID.
  final String? licenseEndpointId;

  /// The status of the license endpoint.
  final LicenseEndpointStatus? status;

  /// The status message of the license endpoint.
  final String? statusMessage;

  /// The VCP(virtual private cloud) ID associated with the license endpoint.
  final String? vpcId;

  LicenseEndpointSummary({
    this.licenseEndpointId,
    this.status,
    this.statusMessage,
    this.vpcId,
  });

  factory LicenseEndpointSummary.fromJson(Map<String, dynamic> json) {
    return LicenseEndpointSummary(
      licenseEndpointId: json['licenseEndpointId'] as String?,
      status: (json['status'] as String?)?.toLicenseEndpointStatus(),
      statusMessage: json['statusMessage'] as String?,
      vpcId: json['vpcId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpointId = this.licenseEndpointId;
    final status = this.status;
    final statusMessage = this.statusMessage;
    final vpcId = this.vpcId;
    return {
      if (licenseEndpointId != null) 'licenseEndpointId': licenseEndpointId,
      if (status != null) 'status': status.toValue(),
      if (statusMessage != null) 'statusMessage': statusMessage,
      if (vpcId != null) 'vpcId': vpcId,
    };
  }
}

class ListAvailableMeteredProductsResponse {
  /// The metered products.
  final List<MeteredProductSummary> meteredProducts;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListAvailableMeteredProductsResponse({
    required this.meteredProducts,
    this.nextToken,
  });

  factory ListAvailableMeteredProductsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListAvailableMeteredProductsResponse(
      meteredProducts: (json['meteredProducts'] as List)
          .whereNotNull()
          .map((e) => MeteredProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meteredProducts = this.meteredProducts;
    final nextToken = this.nextToken;
    return {
      'meteredProducts': meteredProducts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListBudgetsResponse {
  /// The budgets to include on the list.
  final List<BudgetSummary> budgets;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListBudgetsResponse({
    required this.budgets,
    this.nextToken,
  });

  factory ListBudgetsResponse.fromJson(Map<String, dynamic> json) {
    return ListBudgetsResponse(
      budgets: (json['budgets'] as List)
          .whereNotNull()
          .map((e) => BudgetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final budgets = this.budgets;
    final nextToken = this.nextToken;
    return {
      'budgets': budgets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFarmMembersResponse {
  /// The members on the list.
  final List<FarmMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFarmMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListFarmMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListFarmMembersResponse(
      members: (json['members'] as List)
          .whereNotNull()
          .map((e) => FarmMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFarmsResponse {
  /// Farms on the list.
  final List<FarmSummary> farms;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFarmsResponse({
    required this.farms,
    this.nextToken,
  });

  factory ListFarmsResponse.fromJson(Map<String, dynamic> json) {
    return ListFarmsResponse(
      farms: (json['farms'] as List)
          .whereNotNull()
          .map((e) => FarmSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final farms = this.farms;
    final nextToken = this.nextToken;
    return {
      'farms': farms,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFleetMembersResponse {
  /// The members on the list.
  final List<FleetMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFleetMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListFleetMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetMembersResponse(
      members: (json['members'] as List)
          .whereNotNull()
          .map((e) => FleetMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListFleetsResponse {
  /// The fleets on the list.
  final List<FleetSummary> fleets;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListFleetsResponse({
    required this.fleets,
    this.nextToken,
  });

  factory ListFleetsResponse.fromJson(Map<String, dynamic> json) {
    return ListFleetsResponse(
      fleets: (json['fleets'] as List)
          .whereNotNull()
          .map((e) => FleetSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleets = this.fleets;
    final nextToken = this.nextToken;
    return {
      'fleets': fleets,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListJobMembersResponse {
  /// The members on the list.
  final List<JobMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListJobMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListJobMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListJobMembersResponse(
      members: (json['members'] as List)
          .whereNotNull()
          .map((e) => JobMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListJobsResponse {
  /// The jobs on the list.
  final List<JobSummary> jobs;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListJobsResponse({
    required this.jobs,
    this.nextToken,
  });

  factory ListJobsResponse.fromJson(Map<String, dynamic> json) {
    return ListJobsResponse(
      jobs: (json['jobs'] as List)
          .whereNotNull()
          .map((e) => JobSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final nextToken = this.nextToken;
    return {
      'jobs': jobs,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListLicenseEndpointsResponse {
  /// The license endpoints.
  final List<LicenseEndpointSummary> licenseEndpoints;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListLicenseEndpointsResponse({
    required this.licenseEndpoints,
    this.nextToken,
  });

  factory ListLicenseEndpointsResponse.fromJson(Map<String, dynamic> json) {
    return ListLicenseEndpointsResponse(
      licenseEndpoints: (json['licenseEndpoints'] as List)
          .whereNotNull()
          .map(
              (e) => LicenseEndpointSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final licenseEndpoints = this.licenseEndpoints;
    final nextToken = this.nextToken;
    return {
      'licenseEndpoints': licenseEndpoints,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMeteredProductsResponse {
  /// The metered products to list.
  final List<MeteredProductSummary> meteredProducts;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListMeteredProductsResponse({
    required this.meteredProducts,
    this.nextToken,
  });

  factory ListMeteredProductsResponse.fromJson(Map<String, dynamic> json) {
    return ListMeteredProductsResponse(
      meteredProducts: (json['meteredProducts'] as List)
          .whereNotNull()
          .map((e) => MeteredProductSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final meteredProducts = this.meteredProducts;
    final nextToken = this.nextToken;
    return {
      'meteredProducts': meteredProducts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListMonitorsResponse {
  /// A list of <code>MonitorSummary</code> objects that describe your monitors in
  /// the Deadline Cloud.
  final List<MonitorSummary> monitors;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListMonitorsResponse({
    required this.monitors,
    this.nextToken,
  });

  factory ListMonitorsResponse.fromJson(Map<String, dynamic> json) {
    return ListMonitorsResponse(
      monitors: (json['monitors'] as List)
          .whereNotNull()
          .map((e) => MonitorSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final monitors = this.monitors;
    final nextToken = this.nextToken;
    return {
      'monitors': monitors,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListQueueEnvironmentsResponse {
  /// The environments to include in the queue environments list.
  final List<QueueEnvironmentSummary> environments;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueEnvironmentsResponse({
    required this.environments,
    this.nextToken,
  });

  factory ListQueueEnvironmentsResponse.fromJson(Map<String, dynamic> json) {
    return ListQueueEnvironmentsResponse(
      environments: (json['environments'] as List)
          .whereNotNull()
          .map((e) =>
              QueueEnvironmentSummary.fromJson(e as Map<String, dynamic>))
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

class ListQueueFleetAssociationsResponse {
  /// The queue-fleet associations on the list.
  final List<QueueFleetAssociationSummary> queueFleetAssociations;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueFleetAssociationsResponse({
    required this.queueFleetAssociations,
    this.nextToken,
  });

  factory ListQueueFleetAssociationsResponse.fromJson(
      Map<String, dynamic> json) {
    return ListQueueFleetAssociationsResponse(
      queueFleetAssociations: (json['queueFleetAssociations'] as List)
          .whereNotNull()
          .map((e) =>
              QueueFleetAssociationSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueFleetAssociations = this.queueFleetAssociations;
    final nextToken = this.nextToken;
    return {
      'queueFleetAssociations': queueFleetAssociations,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListQueueMembersResponse {
  /// The members on the list.
  final List<QueueMember> members;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueueMembersResponse({
    required this.members,
    this.nextToken,
  });

  factory ListQueueMembersResponse.fromJson(Map<String, dynamic> json) {
    return ListQueueMembersResponse(
      members: (json['members'] as List)
          .whereNotNull()
          .map((e) => QueueMember.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final members = this.members;
    final nextToken = this.nextToken;
    return {
      'members': members,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListQueuesResponse {
  /// The queues on the list.
  final List<QueueSummary> queues;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListQueuesResponse({
    required this.queues,
    this.nextToken,
  });

  factory ListQueuesResponse.fromJson(Map<String, dynamic> json) {
    return ListQueuesResponse(
      queues: (json['queues'] as List)
          .whereNotNull()
          .map((e) => QueueSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queues = this.queues;
    final nextToken = this.nextToken;
    return {
      'queues': queues,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSessionActionsResponse {
  /// The session actions.
  final List<SessionActionSummary> sessionActions;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListSessionActionsResponse({
    required this.sessionActions,
    this.nextToken,
  });

  factory ListSessionActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionActionsResponse(
      sessionActions: (json['sessionActions'] as List)
          .whereNotNull()
          .map((e) => SessionActionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessionActions = this.sessionActions;
    final nextToken = this.nextToken;
    return {
      'sessionActions': sessionActions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSessionsForWorkerResponse {
  /// The sessions in the response.
  final List<WorkerSessionSummary> sessions;

  /// The token for the next set of results, or <code>null</code> to start from
  /// the beginning.
  final String? nextToken;

  ListSessionsForWorkerResponse({
    required this.sessions,
    this.nextToken,
  });

  factory ListSessionsForWorkerResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsForWorkerResponse(
      sessions: (json['sessions'] as List)
          .whereNotNull()
          .map((e) => WorkerSessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessions = this.sessions;
    final nextToken = this.nextToken;
    return {
      'sessions': sessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSessionsResponse {
  /// The sessions on the list.
  final List<SessionSummary> sessions;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListSessionsResponse({
    required this.sessions,
    this.nextToken,
  });

  factory ListSessionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSessionsResponse(
      sessions: (json['sessions'] as List)
          .whereNotNull()
          .map((e) => SessionSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final sessions = this.sessions;
    final nextToken = this.nextToken;
    return {
      'sessions': sessions,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStepConsumersResponse {
  /// The consumers on the list.
  final List<StepConsumer> consumers;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStepConsumersResponse({
    required this.consumers,
    this.nextToken,
  });

  factory ListStepConsumersResponse.fromJson(Map<String, dynamic> json) {
    return ListStepConsumersResponse(
      consumers: (json['consumers'] as List)
          .whereNotNull()
          .map((e) => StepConsumer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final consumers = this.consumers;
    final nextToken = this.nextToken;
    return {
      'consumers': consumers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStepDependenciesResponse {
  /// The dependencies on the list.
  final List<StepDependency> dependencies;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStepDependenciesResponse({
    required this.dependencies,
    this.nextToken,
  });

  factory ListStepDependenciesResponse.fromJson(Map<String, dynamic> json) {
    return ListStepDependenciesResponse(
      dependencies: (json['dependencies'] as List)
          .whereNotNull()
          .map((e) => StepDependency.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final nextToken = this.nextToken;
    return {
      'dependencies': dependencies,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStepsResponse {
  /// The steps on the list.
  final List<StepSummary> steps;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStepsResponse({
    required this.steps,
    this.nextToken,
  });

  factory ListStepsResponse.fromJson(Map<String, dynamic> json) {
    return ListStepsResponse(
      steps: (json['steps'] as List)
          .whereNotNull()
          .map((e) => StepSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    final nextToken = this.nextToken;
    return {
      'steps': steps,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStorageProfilesForQueueResponse {
  /// The storage profiles in the queue.
  final List<StorageProfileSummary> storageProfiles;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStorageProfilesForQueueResponse({
    required this.storageProfiles,
    this.nextToken,
  });

  factory ListStorageProfilesForQueueResponse.fromJson(
      Map<String, dynamic> json) {
    return ListStorageProfilesForQueueResponse(
      storageProfiles: (json['storageProfiles'] as List)
          .whereNotNull()
          .map((e) => StorageProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageProfiles = this.storageProfiles;
    final nextToken = this.nextToken;
    return {
      'storageProfiles': storageProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStorageProfilesResponse {
  /// The storage profiles.
  final List<StorageProfileSummary> storageProfiles;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListStorageProfilesResponse({
    required this.storageProfiles,
    this.nextToken,
  });

  factory ListStorageProfilesResponse.fromJson(Map<String, dynamic> json) {
    return ListStorageProfilesResponse(
      storageProfiles: (json['storageProfiles'] as List)
          .whereNotNull()
          .map((e) => StorageProfileSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final storageProfiles = this.storageProfiles;
    final nextToken = this.nextToken;
    return {
      'storageProfiles': storageProfiles,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// Each tag consists of a tag key and a tag value. Tag keys and values are both
  /// required, but tag values can be empty strings.
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

class ListTasksResponse {
  /// Tasks for the job.
  final List<TaskSummary> tasks;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListTasksResponse({
    required this.tasks,
    this.nextToken,
  });

  factory ListTasksResponse.fromJson(Map<String, dynamic> json) {
    return ListTasksResponse(
      tasks: (json['tasks'] as List)
          .whereNotNull()
          .map((e) => TaskSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final tasks = this.tasks;
    final nextToken = this.nextToken;
    return {
      'tasks': tasks,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListWorkersResponse {
  /// The workers on the list.
  final List<WorkerSummary> workers;

  /// If Deadline Cloud returns <code>nextToken</code>, then there are more
  /// results available. The value of <code>nextToken</code> is a unique
  /// pagination token for each page. To retrieve the next page, call the
  /// operation again using the returned token. Keep all other arguments
  /// unchanged. If no results remain, then <code>nextToken</code> is set to
  /// <code>null</code>. Each pagination token expires after 24 hours. If you
  /// provide a token that isn't valid, then you receive an HTTP 400
  /// <code>ValidationException</code> error.
  final String? nextToken;

  ListWorkersResponse({
    required this.workers,
    this.nextToken,
  });

  factory ListWorkersResponse.fromJson(Map<String, dynamic> json) {
    return ListWorkersResponse(
      workers: (json['workers'] as List)
          .whereNotNull()
          .map((e) => WorkerSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final workers = this.workers;
    final nextToken = this.nextToken;
    return {
      'workers': workers,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// Log configuration details.
class LogConfiguration {
  /// The log drivers for worker related logs.
  final String logDriver;

  /// The log configuration error details.
  final String? error;

  /// The options for a log driver.
  final Map<String, String>? options;

  /// The parameters for the log configuration.
  final Map<String, String>? parameters;

  LogConfiguration({
    required this.logDriver,
    this.error,
    this.options,
    this.parameters,
  });

  factory LogConfiguration.fromJson(Map<String, dynamic> json) {
    return LogConfiguration(
      logDriver: json['logDriver'] as String,
      error: json['error'] as String?,
      options: (json['options'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      parameters: (json['parameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final logDriver = this.logDriver;
    final error = this.error;
    final options = this.options;
    final parameters = this.parameters;
    return {
      'logDriver': logDriver,
      if (error != null) 'error': error,
      if (options != null) 'options': options,
      if (parameters != null) 'parameters': parameters,
    };
  }
}

enum LogicalOperator {
  and,
  or,
}

extension LogicalOperatorValueExtension on LogicalOperator {
  String toValue() {
    switch (this) {
      case LogicalOperator.and:
        return 'AND';
      case LogicalOperator.or:
        return 'OR';
    }
  }
}

extension LogicalOperatorFromString on String {
  LogicalOperator toLogicalOperator() {
    switch (this) {
      case 'AND':
        return LogicalOperator.and;
      case 'OR':
        return LogicalOperator.or;
    }
    throw Exception('$this is not known in enum LogicalOperator');
  }
}

/// The details of the manifest that links a job's source information.
class ManifestProperties {
  /// The file's root path.
  final String rootPath;

  /// The format of the root path.
  final PathFormat rootPathFormat;

  /// The file system location name.
  final String? fileSystemLocationName;

  /// The has value of the file.
  final String? inputManifestHash;

  /// The file path.
  final String? inputManifestPath;

  /// The file path relative to the directory.
  final List<String>? outputRelativeDirectories;

  ManifestProperties({
    required this.rootPath,
    required this.rootPathFormat,
    this.fileSystemLocationName,
    this.inputManifestHash,
    this.inputManifestPath,
    this.outputRelativeDirectories,
  });

  factory ManifestProperties.fromJson(Map<String, dynamic> json) {
    return ManifestProperties(
      rootPath: json['rootPath'] as String,
      rootPathFormat: (json['rootPathFormat'] as String).toPathFormat(),
      fileSystemLocationName: json['fileSystemLocationName'] as String?,
      inputManifestHash: json['inputManifestHash'] as String?,
      inputManifestPath: json['inputManifestPath'] as String?,
      outputRelativeDirectories: (json['outputRelativeDirectories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final rootPath = this.rootPath;
    final rootPathFormat = this.rootPathFormat;
    final fileSystemLocationName = this.fileSystemLocationName;
    final inputManifestHash = this.inputManifestHash;
    final inputManifestPath = this.inputManifestPath;
    final outputRelativeDirectories = this.outputRelativeDirectories;
    return {
      'rootPath': rootPath,
      'rootPathFormat': rootPathFormat.toValue(),
      if (fileSystemLocationName != null)
        'fileSystemLocationName': fileSystemLocationName,
      if (inputManifestHash != null) 'inputManifestHash': inputManifestHash,
      if (inputManifestPath != null) 'inputManifestPath': inputManifestPath,
      if (outputRelativeDirectories != null)
        'outputRelativeDirectories': outputRelativeDirectories,
    };
  }
}

enum MembershipLevel {
  viewer,
  contributor,
  owner,
  manager,
}

extension MembershipLevelValueExtension on MembershipLevel {
  String toValue() {
    switch (this) {
      case MembershipLevel.viewer:
        return 'VIEWER';
      case MembershipLevel.contributor:
        return 'CONTRIBUTOR';
      case MembershipLevel.owner:
        return 'OWNER';
      case MembershipLevel.manager:
        return 'MANAGER';
    }
  }
}

extension MembershipLevelFromString on String {
  MembershipLevel toMembershipLevel() {
    switch (this) {
      case 'VIEWER':
        return MembershipLevel.viewer;
      case 'CONTRIBUTOR':
        return MembershipLevel.contributor;
      case 'OWNER':
        return MembershipLevel.owner;
      case 'MANAGER':
        return MembershipLevel.manager;
    }
    throw Exception('$this is not known in enum MembershipLevel');
  }
}

/// The range of memory in MiB.
class MemoryMiBRange {
  /// The minimum amount of memory (in MiB).
  final int min;

  /// The maximum amount of memory (in MiB).
  final int? max;

  MemoryMiBRange({
    required this.min,
    this.max,
  });

  factory MemoryMiBRange.fromJson(Map<String, dynamic> json) {
    return MemoryMiBRange(
      min: json['min'] as int,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

/// The details of a metered product.
class MeteredProductSummary {
  /// The family to which the metered product belongs.
  final String family;

  /// The port on which the metered product should run.
  final int port;

  /// The product ID.
  final String productId;

  /// The vendor.
  final String vendor;

  MeteredProductSummary({
    required this.family,
    required this.port,
    required this.productId,
    required this.vendor,
  });

  factory MeteredProductSummary.fromJson(Map<String, dynamic> json) {
    return MeteredProductSummary(
      family: json['family'] as String,
      port: json['port'] as int,
      productId: json['productId'] as String,
      vendor: json['vendor'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final family = this.family;
    final port = this.port;
    final productId = this.productId;
    final vendor = this.vendor;
    return {
      'family': family,
      'port': port,
      'productId': productId,
      'vendor': vendor,
    };
  }
}

/// Provides information about a monitor in Deadline Cloud.
class MonitorSummary {
  /// The UNIX timestamp of the date and time that the monitor was created.
  final DateTime createdAt;

  /// The user name of the person that created the monitor.
  final String createdBy;

  /// The name of the monitor that displays on the Deadline Cloud console.
  final String displayName;

  /// The Amazon Resource Name (ARN) that the IAM Identity Center assigned to the
  /// monitor when it was created.
  final String identityCenterApplicationArn;

  /// The Amazon Resource Name (ARN) of the IAM Identity Center instance
  /// responsible for authenticating monitor users.
  final String identityCenterInstanceArn;

  /// The unique identifier for the monitor.
  final String monitorId;

  /// The Amazon Resource Name (ARN) of the IAM role for the monitor. Users of the
  /// monitor use this role to access Deadline Cloud resources.
  final String roleArn;

  /// The subdomain used for the monitor URL. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String subdomain;

  /// The complete URL of the monitor. The full URL of the monitor is
  /// subdomain.Region.deadlinecloud.amazonaws.com.
  final String url;

  /// The UNIX timestamp of the date and time that the monitor was last updated.
  final DateTime? updatedAt;

  /// The user name of the person that last updated the monitor.
  final String? updatedBy;

  MonitorSummary({
    required this.createdAt,
    required this.createdBy,
    required this.displayName,
    required this.identityCenterApplicationArn,
    required this.identityCenterInstanceArn,
    required this.monitorId,
    required this.roleArn,
    required this.subdomain,
    required this.url,
    this.updatedAt,
    this.updatedBy,
  });

  factory MonitorSummary.fromJson(Map<String, dynamic> json) {
    return MonitorSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      displayName: json['displayName'] as String,
      identityCenterApplicationArn:
          json['identityCenterApplicationArn'] as String,
      identityCenterInstanceArn: json['identityCenterInstanceArn'] as String,
      monitorId: json['monitorId'] as String,
      roleArn: json['roleArn'] as String,
      subdomain: json['subdomain'] as String,
      url: json['url'] as String,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final displayName = this.displayName;
    final identityCenterApplicationArn = this.identityCenterApplicationArn;
    final identityCenterInstanceArn = this.identityCenterInstanceArn;
    final monitorId = this.monitorId;
    final roleArn = this.roleArn;
    final subdomain = this.subdomain;
    final url = this.url;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'displayName': displayName,
      'identityCenterApplicationArn': identityCenterApplicationArn,
      'identityCenterInstanceArn': identityCenterInstanceArn,
      'monitorId': monitorId,
      'roleArn': roleArn,
      'subdomain': subdomain,
      'url': url,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of a filtered search for parameters.
class ParameterFilterExpression {
  /// The name of the parameter to filter on.
  final String name;

  /// The type of comparison to use to filter results.
  final ComparisonOperator operator;

  /// The parameter's value.
  final String value;

  ParameterFilterExpression({
    required this.name,
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      'name': name,
      'operator': operator.toValue(),
      'value': value,
    };
  }
}

/// Organizes parameters according to your specifications.
class ParameterSortExpression {
  /// The parameter name to sort by.
  final String name;

  /// The sort order for the parameter.
  final SortOrder sortOrder;

  ParameterSortExpression({
    required this.name,
    required this.sortOrder,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final sortOrder = this.sortOrder;
    return {
      'name': name,
      'sortOrder': sortOrder.toValue(),
    };
  }
}

/// The details of a search for two or more step parameters.
class ParameterSpace {
  /// The parameters to search for.
  final List<StepParameter> parameters;

  /// The combination expression to use in the search.
  final String? combination;

  ParameterSpace({
    required this.parameters,
    this.combination,
  });

  factory ParameterSpace.fromJson(Map<String, dynamic> json) {
    return ParameterSpace(
      parameters: (json['parameters'] as List)
          .whereNotNull()
          .map((e) => StepParameter.fromJson(e as Map<String, dynamic>))
          .toList(),
      combination: json['combination'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final combination = this.combination;
    return {
      'parameters': parameters,
      if (combination != null) 'combination': combination,
    };
  }
}

enum PathFormat {
  windows,
  posix,
}

extension PathFormatValueExtension on PathFormat {
  String toValue() {
    switch (this) {
      case PathFormat.windows:
        return 'windows';
      case PathFormat.posix:
        return 'posix';
    }
  }
}

extension PathFormatFromString on String {
  PathFormat toPathFormat() {
    switch (this) {
      case 'windows':
        return PathFormat.windows;
      case 'posix':
        return PathFormat.posix;
    }
    throw Exception('$this is not known in enum PathFormat');
  }
}

/// The details of a source and destination path.
class PathMappingRule {
  /// The destination path.
  final String destinationPath;

  /// The source path.
  final String sourcePath;

  /// The source path format.
  final PathFormat sourcePathFormat;

  PathMappingRule({
    required this.destinationPath,
    required this.sourcePath,
    required this.sourcePathFormat,
  });

  factory PathMappingRule.fromJson(Map<String, dynamic> json) {
    return PathMappingRule(
      destinationPath: json['destinationPath'] as String,
      sourcePath: json['sourcePath'] as String,
      sourcePathFormat: (json['sourcePathFormat'] as String).toPathFormat(),
    );
  }

  Map<String, dynamic> toJson() {
    final destinationPath = this.destinationPath;
    final sourcePath = this.sourcePath;
    final sourcePathFormat = this.sourcePathFormat;
    return {
      'destinationPath': destinationPath,
      'sourcePath': sourcePath,
      'sourcePathFormat': sourcePathFormat.toValue(),
    };
  }
}

enum Period {
  hourly,
  daily,
  weekly,
  monthly,
}

extension PeriodValueExtension on Period {
  String toValue() {
    switch (this) {
      case Period.hourly:
        return 'HOURLY';
      case Period.daily:
        return 'DAILY';
      case Period.weekly:
        return 'WEEKLY';
      case Period.monthly:
        return 'MONTHLY';
    }
  }
}

extension PeriodFromString on String {
  Period toPeriod() {
    switch (this) {
      case 'HOURLY':
        return Period.hourly;
      case 'DAILY':
        return Period.daily;
      case 'WEEKLY':
        return Period.weekly;
      case 'MONTHLY':
        return Period.monthly;
    }
    throw Exception('$this is not known in enum Period');
  }
}

/// The POSIX user.
class PosixUser {
  /// The name of the POSIX user's group.
  final String group;

  /// The name of the POSIX user.
  final String user;

  PosixUser({
    required this.group,
    required this.user,
  });

  factory PosixUser.fromJson(Map<String, dynamic> json) {
    return PosixUser(
      group: json['group'] as String,
      user: json['user'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final group = this.group;
    final user = this.user;
    return {
      'group': group,
      'user': user,
    };
  }
}

enum PrincipalType {
  user,
  group,
}

extension PrincipalTypeValueExtension on PrincipalType {
  String toValue() {
    switch (this) {
      case PrincipalType.user:
        return 'USER';
      case PrincipalType.group:
        return 'GROUP';
    }
  }
}

extension PrincipalTypeFromString on String {
  PrincipalType toPrincipalType() {
    switch (this) {
      case 'USER':
        return PrincipalType.user;
      case 'GROUP':
        return PrincipalType.group;
    }
    throw Exception('$this is not known in enum PrincipalType');
  }
}

class PutMeteredProductResponse {
  PutMeteredProductResponse();

  factory PutMeteredProductResponse.fromJson(Map<String, dynamic> _) {
    return PutMeteredProductResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum QueueBlockedReason {
  noBudgetConfigured,
  budgetThresholdReached,
}

extension QueueBlockedReasonValueExtension on QueueBlockedReason {
  String toValue() {
    switch (this) {
      case QueueBlockedReason.noBudgetConfigured:
        return 'NO_BUDGET_CONFIGURED';
      case QueueBlockedReason.budgetThresholdReached:
        return 'BUDGET_THRESHOLD_REACHED';
    }
  }
}

extension QueueBlockedReasonFromString on String {
  QueueBlockedReason toQueueBlockedReason() {
    switch (this) {
      case 'NO_BUDGET_CONFIGURED':
        return QueueBlockedReason.noBudgetConfigured;
      case 'BUDGET_THRESHOLD_REACHED':
        return QueueBlockedReason.budgetThresholdReached;
    }
    throw Exception('$this is not known in enum QueueBlockedReason');
  }
}

/// The summary of a queue environment.
class QueueEnvironmentSummary {
  /// The name of the queue environment.
  final String name;

  /// The queue environment's priority.
  final int priority;

  /// The queue environment ID.
  final String queueEnvironmentId;

  QueueEnvironmentSummary({
    required this.name,
    required this.priority,
    required this.queueEnvironmentId,
  });

  factory QueueEnvironmentSummary.fromJson(Map<String, dynamic> json) {
    return QueueEnvironmentSummary(
      name: json['name'] as String,
      priority: json['priority'] as int,
      queueEnvironmentId: json['queueEnvironmentId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final priority = this.priority;
    final queueEnvironmentId = this.queueEnvironmentId;
    return {
      'name': name,
      'priority': priority,
      'queueEnvironmentId': queueEnvironmentId,
    };
  }
}

enum QueueFleetAssociationStatus {
  active,
  stopSchedulingAndCompleteTasks,
  stopSchedulingAndCancelTasks,
  stopped,
}

extension QueueFleetAssociationStatusValueExtension
    on QueueFleetAssociationStatus {
  String toValue() {
    switch (this) {
      case QueueFleetAssociationStatus.active:
        return 'ACTIVE';
      case QueueFleetAssociationStatus.stopSchedulingAndCompleteTasks:
        return 'STOP_SCHEDULING_AND_COMPLETE_TASKS';
      case QueueFleetAssociationStatus.stopSchedulingAndCancelTasks:
        return 'STOP_SCHEDULING_AND_CANCEL_TASKS';
      case QueueFleetAssociationStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension QueueFleetAssociationStatusFromString on String {
  QueueFleetAssociationStatus toQueueFleetAssociationStatus() {
    switch (this) {
      case 'ACTIVE':
        return QueueFleetAssociationStatus.active;
      case 'STOP_SCHEDULING_AND_COMPLETE_TASKS':
        return QueueFleetAssociationStatus.stopSchedulingAndCompleteTasks;
      case 'STOP_SCHEDULING_AND_CANCEL_TASKS':
        return QueueFleetAssociationStatus.stopSchedulingAndCancelTasks;
      case 'STOPPED':
        return QueueFleetAssociationStatus.stopped;
    }
    throw Exception('$this is not known in enum QueueFleetAssociationStatus');
  }
}

/// The details of a queue-fleet association.
class QueueFleetAssociationSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The fleet ID.
  final String fleetId;

  /// The queue ID.
  final String queueId;

  /// The status of task scheduling in the queue-fleet association.
  ///
  /// <ul>
  /// <li>
  /// <code>ACTIVE</code>–Association is active.
  /// </li>
  /// <li>
  /// <code>STOP_SCHEDULING_AND_COMPLETE_TASKS</code>–Association has stopped
  /// scheduling new tasks and is completing current tasks.
  /// </li>
  /// <li>
  /// <code>STOP_SCHEDULING_AND_CANCEL_TASKS</code>–Association has stopped
  /// scheduling new tasks and is canceling current tasks.
  /// </li>
  /// <li>
  /// <code>STOPPED</code>–Association has been stopped.
  /// </li>
  /// </ul>
  final QueueFleetAssociationStatus status;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  QueueFleetAssociationSummary({
    required this.createdAt,
    required this.createdBy,
    required this.fleetId,
    required this.queueId,
    required this.status,
    this.updatedAt,
    this.updatedBy,
  });

  factory QueueFleetAssociationSummary.fromJson(Map<String, dynamic> json) {
    return QueueFleetAssociationSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      fleetId: json['fleetId'] as String,
      queueId: json['queueId'] as String,
      status: (json['status'] as String).toQueueFleetAssociationStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fleetId = this.fleetId;
    final queueId = this.queueId;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'fleetId': fleetId,
      'queueId': queueId,
      'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of a queue member.
class QueueMember {
  /// The farm ID.
  final String farmId;

  /// The identity store ID.
  final String identityStoreId;

  /// The queue member's membership level.
  final MembershipLevel membershipLevel;

  /// The principal ID of the queue member.
  final String principalId;

  /// The principal type of the queue member.
  final PrincipalType principalType;

  /// The queue ID.
  final String queueId;

  QueueMember({
    required this.farmId,
    required this.identityStoreId,
    required this.membershipLevel,
    required this.principalId,
    required this.principalType,
    required this.queueId,
  });

  factory QueueMember.fromJson(Map<String, dynamic> json) {
    return QueueMember(
      farmId: json['farmId'] as String,
      identityStoreId: json['identityStoreId'] as String,
      membershipLevel: (json['membershipLevel'] as String).toMembershipLevel(),
      principalId: json['principalId'] as String,
      principalType: (json['principalType'] as String).toPrincipalType(),
      queueId: json['queueId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final farmId = this.farmId;
    final identityStoreId = this.identityStoreId;
    final membershipLevel = this.membershipLevel;
    final principalId = this.principalId;
    final principalType = this.principalType;
    final queueId = this.queueId;
    return {
      'farmId': farmId,
      'identityStoreId': identityStoreId,
      'membershipLevel': membershipLevel.toValue(),
      'principalId': principalId,
      'principalType': principalType.toValue(),
      'queueId': queueId,
    };
  }
}

enum QueueStatus {
  idle,
  scheduling,
  schedulingBlocked,
}

extension QueueStatusValueExtension on QueueStatus {
  String toValue() {
    switch (this) {
      case QueueStatus.idle:
        return 'IDLE';
      case QueueStatus.scheduling:
        return 'SCHEDULING';
      case QueueStatus.schedulingBlocked:
        return 'SCHEDULING_BLOCKED';
    }
  }
}

extension QueueStatusFromString on String {
  QueueStatus toQueueStatus() {
    switch (this) {
      case 'IDLE':
        return QueueStatus.idle;
      case 'SCHEDULING':
        return QueueStatus.scheduling;
      case 'SCHEDULING_BLOCKED':
        return QueueStatus.schedulingBlocked;
    }
    throw Exception('$this is not known in enum QueueStatus');
  }
}

/// The details of a queue summary.
class QueueSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The default action taken on a queue summary if a budget wasn't configured.
  final DefaultQueueBudgetAction defaultBudgetAction;

  /// The display name of the queue summary to update.
  final String displayName;

  /// The farm ID.
  final String farmId;

  /// The queue ID.
  final String queueId;

  /// That status of the queue.
  final QueueStatus status;

  /// The reason the queue is blocked, if applicable.
  final QueueBlockedReason? blockedReason;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  QueueSummary({
    required this.createdAt,
    required this.createdBy,
    required this.defaultBudgetAction,
    required this.displayName,
    required this.farmId,
    required this.queueId,
    required this.status,
    this.blockedReason,
    this.updatedAt,
    this.updatedBy,
  });

  factory QueueSummary.fromJson(Map<String, dynamic> json) {
    return QueueSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      defaultBudgetAction:
          (json['defaultBudgetAction'] as String).toDefaultQueueBudgetAction(),
      displayName: json['displayName'] as String,
      farmId: json['farmId'] as String,
      queueId: json['queueId'] as String,
      status: (json['status'] as String).toQueueStatus(),
      blockedReason: (json['blockedReason'] as String?)?.toQueueBlockedReason(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final defaultBudgetAction = this.defaultBudgetAction;
    final displayName = this.displayName;
    final farmId = this.farmId;
    final queueId = this.queueId;
    final status = this.status;
    final blockedReason = this.blockedReason;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'defaultBudgetAction': defaultBudgetAction.toValue(),
      'displayName': displayName,
      'farmId': farmId,
      'queueId': queueId,
      'status': status.toValue(),
      if (blockedReason != null) 'blockedReason': blockedReason.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

/// The details of a budget action.
class ResponseBudgetAction {
  /// The percentage threshold for the budget.
  final double thresholdPercentage;

  /// The action taken on the budget once scheduling stops.
  final BudgetActionType type;

  /// The budget action description.
  final String? description;

  ResponseBudgetAction({
    required this.thresholdPercentage,
    required this.type,
    this.description,
  });

  factory ResponseBudgetAction.fromJson(Map<String, dynamic> json) {
    return ResponseBudgetAction(
      thresholdPercentage: json['thresholdPercentage'] as double,
      type: (json['type'] as String).toBudgetActionType(),
      description: json['description'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final thresholdPercentage = this.thresholdPercentage;
    final type = this.type;
    final description = this.description;
    return {
      'thresholdPercentage': thresholdPercentage,
      'type': type.toValue(),
      if (description != null) 'description': description,
    };
  }
}

enum RunAs {
  queueConfiguredUser,
  workerAgentUser,
}

extension RunAsValueExtension on RunAs {
  String toValue() {
    switch (this) {
      case RunAs.queueConfiguredUser:
        return 'QUEUE_CONFIGURED_USER';
      case RunAs.workerAgentUser:
        return 'WORKER_AGENT_USER';
    }
  }
}

extension RunAsFromString on String {
  RunAs toRunAs() {
    switch (this) {
      case 'QUEUE_CONFIGURED_USER':
        return RunAs.queueConfiguredUser;
      case 'WORKER_AGENT_USER':
        return RunAs.workerAgentUser;
    }
    throw Exception('$this is not known in enum RunAs');
  }
}

/// The Amazon S3 location information.
class S3Location {
  /// The name of the Amazon S3 bucket.
  final String bucketName;

  /// The Amazon S3 object key that uniquely identifies the Amazon S3 bucket.
  final String key;

  S3Location({
    required this.bucketName,
    required this.key,
  });

  Map<String, dynamic> toJson() {
    final bucketName = this.bucketName;
    final key = this.key;
    return {
      'bucketName': bucketName,
      'key': key,
    };
  }
}

/// The type of search filter to apply.
class SearchFilterExpression {
  /// Filters based on date and time.
  final DateTimeFilterExpression? dateTimeFilter;

  /// Filters by group.
  final SearchGroupedFilterExpressions? groupFilter;

  /// Filters by parameter.
  final ParameterFilterExpression? parameterFilter;

  /// Filters by a specified search term.
  final SearchTermFilterExpression? searchTermFilter;

  /// Filters by a string.
  final StringFilterExpression? stringFilter;

  SearchFilterExpression({
    this.dateTimeFilter,
    this.groupFilter,
    this.parameterFilter,
    this.searchTermFilter,
    this.stringFilter,
  });

  Map<String, dynamic> toJson() {
    final dateTimeFilter = this.dateTimeFilter;
    final groupFilter = this.groupFilter;
    final parameterFilter = this.parameterFilter;
    final searchTermFilter = this.searchTermFilter;
    final stringFilter = this.stringFilter;
    return {
      if (dateTimeFilter != null) 'dateTimeFilter': dateTimeFilter,
      if (groupFilter != null) 'groupFilter': groupFilter,
      if (parameterFilter != null) 'parameterFilter': parameterFilter,
      if (searchTermFilter != null) 'searchTermFilter': searchTermFilter,
      if (stringFilter != null) 'stringFilter': stringFilter,
    };
  }
}

/// The filter expression, <code>AND</code> or <code>OR</code>, to use when
/// searching among a group of search strings in a resource.
/// You can use two groupings per search each within parenthesis
/// <code>()</code>.
///
class SearchGroupedFilterExpressions {
  /// The filters to use for the search.
  final List<SearchFilterExpression> filters;

  /// The operators to include in the search.
  final LogicalOperator operator;

  SearchGroupedFilterExpressions({
    required this.filters,
    required this.operator,
  });

  Map<String, dynamic> toJson() {
    final filters = this.filters;
    final operator = this.operator;
    return {
      'filters': filters,
      'operator': operator.toValue(),
    };
  }
}

class SearchJobsResponse {
  /// The jobs in the search.
  final List<JobSearchSummary> jobs;

  /// The total number of results in the search.
  final int totalResults;

  /// The next incremental starting point after the defined
  /// <code>itemOffset</code>.
  final int? nextItemOffset;

  SearchJobsResponse({
    required this.jobs,
    required this.totalResults,
    this.nextItemOffset,
  });

  factory SearchJobsResponse.fromJson(Map<String, dynamic> json) {
    return SearchJobsResponse(
      jobs: (json['jobs'] as List)
          .whereNotNull()
          .map((e) => JobSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as int,
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final jobs = this.jobs;
    final totalResults = this.totalResults;
    final nextItemOffset = this.nextItemOffset;
    return {
      'jobs': jobs,
      'totalResults': totalResults,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

/// The resources to search.
class SearchSortExpression {
  /// Options for sorting by a field.
  final FieldSortExpression? fieldSort;

  /// Options for sorting by a parameter.
  final ParameterSortExpression? parameterSort;

  /// Options for sorting a particular user's jobs first.
  final UserJobsFirst? userJobsFirst;

  SearchSortExpression({
    this.fieldSort,
    this.parameterSort,
    this.userJobsFirst,
  });

  Map<String, dynamic> toJson() {
    final fieldSort = this.fieldSort;
    final parameterSort = this.parameterSort;
    final userJobsFirst = this.userJobsFirst;
    return {
      if (fieldSort != null) 'fieldSort': fieldSort,
      if (parameterSort != null) 'parameterSort': parameterSort,
      if (userJobsFirst != null) 'userJobsFirst': userJobsFirst,
    };
  }
}

class SearchStepsResponse {
  /// The steps in the search.
  final List<StepSearchSummary> steps;

  /// The total number of results in the search.
  final int totalResults;

  /// The next incremental starting point after the defined
  /// <code>itemOffset</code>.
  final int? nextItemOffset;

  SearchStepsResponse({
    required this.steps,
    required this.totalResults,
    this.nextItemOffset,
  });

  factory SearchStepsResponse.fromJson(Map<String, dynamic> json) {
    return SearchStepsResponse(
      steps: (json['steps'] as List)
          .whereNotNull()
          .map((e) => StepSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as int,
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final steps = this.steps;
    final totalResults = this.totalResults;
    final nextItemOffset = this.nextItemOffset;
    return {
      'steps': steps,
      'totalResults': totalResults,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

class SearchTasksResponse {
  /// Tasks in the search.
  final List<TaskSearchSummary> tasks;

  /// The total number of results in the search.
  final int totalResults;

  /// The next incremental starting point after the defined
  /// <code>itemOffset</code>.
  final int? nextItemOffset;

  SearchTasksResponse({
    required this.tasks,
    required this.totalResults,
    this.nextItemOffset,
  });

  factory SearchTasksResponse.fromJson(Map<String, dynamic> json) {
    return SearchTasksResponse(
      tasks: (json['tasks'] as List)
          .whereNotNull()
          .map((e) => TaskSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalResults: json['totalResults'] as int,
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final tasks = this.tasks;
    final totalResults = this.totalResults;
    final nextItemOffset = this.nextItemOffset;
    return {
      'tasks': tasks,
      'totalResults': totalResults,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

/// Searches for a particular search term.
class SearchTermFilterExpression {
  /// The term to search for.
  final String searchTerm;

  SearchTermFilterExpression({
    required this.searchTerm,
  });

  Map<String, dynamic> toJson() {
    final searchTerm = this.searchTerm;
    return {
      'searchTerm': searchTerm,
    };
  }
}

class SearchWorkersResponse {
  /// The total number of results in the search.
  final int totalResults;

  /// The workers for the search.
  final List<WorkerSearchSummary> workers;

  /// The next incremental starting point after the defined
  /// <code>itemOffset</code>.
  final int? nextItemOffset;

  SearchWorkersResponse({
    required this.totalResults,
    required this.workers,
    this.nextItemOffset,
  });

  factory SearchWorkersResponse.fromJson(Map<String, dynamic> json) {
    return SearchWorkersResponse(
      totalResults: json['totalResults'] as int,
      workers: (json['workers'] as List)
          .whereNotNull()
          .map((e) => WorkerSearchSummary.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextItemOffset: json['nextItemOffset'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final totalResults = this.totalResults;
    final workers = this.workers;
    final nextItemOffset = this.nextItemOffset;
    return {
      'totalResults': totalResults,
      'workers': workers,
      if (nextItemOffset != null) 'nextItemOffset': nextItemOffset,
    };
  }
}

/// The configuration details for a service managed Amazon EC2 fleet.
class ServiceManagedEc2FleetConfiguration {
  /// The Amazon EC2 instance capabilities.
  final ServiceManagedEc2InstanceCapabilities instanceCapabilities;

  /// The Amazon EC2 market type.
  final ServiceManagedEc2InstanceMarketOptions instanceMarketOptions;

  ServiceManagedEc2FleetConfiguration({
    required this.instanceCapabilities,
    required this.instanceMarketOptions,
  });

  factory ServiceManagedEc2FleetConfiguration.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2FleetConfiguration(
      instanceCapabilities: ServiceManagedEc2InstanceCapabilities.fromJson(
          json['instanceCapabilities'] as Map<String, dynamic>),
      instanceMarketOptions: ServiceManagedEc2InstanceMarketOptions.fromJson(
          json['instanceMarketOptions'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final instanceCapabilities = this.instanceCapabilities;
    final instanceMarketOptions = this.instanceMarketOptions;
    return {
      'instanceCapabilities': instanceCapabilities,
      'instanceMarketOptions': instanceMarketOptions,
    };
  }
}

/// The Amazon EC2 instance capabilities.
class ServiceManagedEc2InstanceCapabilities {
  /// The CPU architecture type.
  final CpuArchitectureType cpuArchitectureType;

  /// The memory, as MiB, for the Amazon EC2 instance type.
  final MemoryMiBRange memoryMiB;

  /// The operating system (OS) family.
  final ServiceManagedFleetOperatingSystemFamily osFamily;

  /// The amount of vCPU to require for instances in this fleet.
  final VCpuCountRange vCpuCount;

  /// The allowable Amazon EC2 instance types.
  final List<String>? allowedInstanceTypes;

  /// The custom capability amounts to require for instances in this fleet.
  final List<FleetAmountCapability>? customAmounts;

  /// The custom capability attributes to require for instances in this fleet.
  final List<FleetAttributeCapability>? customAttributes;

  /// The instance types to exclude from the fleet.
  final List<String>? excludedInstanceTypes;

  /// The root EBS volume.
  final Ec2EbsVolume? rootEbsVolume;

  ServiceManagedEc2InstanceCapabilities({
    required this.cpuArchitectureType,
    required this.memoryMiB,
    required this.osFamily,
    required this.vCpuCount,
    this.allowedInstanceTypes,
    this.customAmounts,
    this.customAttributes,
    this.excludedInstanceTypes,
    this.rootEbsVolume,
  });

  factory ServiceManagedEc2InstanceCapabilities.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2InstanceCapabilities(
      cpuArchitectureType:
          (json['cpuArchitectureType'] as String).toCpuArchitectureType(),
      memoryMiB:
          MemoryMiBRange.fromJson(json['memoryMiB'] as Map<String, dynamic>),
      osFamily: (json['osFamily'] as String)
          .toServiceManagedFleetOperatingSystemFamily(),
      vCpuCount:
          VCpuCountRange.fromJson(json['vCpuCount'] as Map<String, dynamic>),
      allowedInstanceTypes: (json['allowedInstanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      customAmounts: (json['customAmounts'] as List?)
          ?.whereNotNull()
          .map((e) => FleetAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      customAttributes: (json['customAttributes'] as List?)
          ?.whereNotNull()
          .map((e) =>
              FleetAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      excludedInstanceTypes: (json['excludedInstanceTypes'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      rootEbsVolume: json['rootEbsVolume'] != null
          ? Ec2EbsVolume.fromJson(json['rootEbsVolume'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final cpuArchitectureType = this.cpuArchitectureType;
    final memoryMiB = this.memoryMiB;
    final osFamily = this.osFamily;
    final vCpuCount = this.vCpuCount;
    final allowedInstanceTypes = this.allowedInstanceTypes;
    final customAmounts = this.customAmounts;
    final customAttributes = this.customAttributes;
    final excludedInstanceTypes = this.excludedInstanceTypes;
    final rootEbsVolume = this.rootEbsVolume;
    return {
      'cpuArchitectureType': cpuArchitectureType.toValue(),
      'memoryMiB': memoryMiB,
      'osFamily': osFamily.toValue(),
      'vCpuCount': vCpuCount,
      if (allowedInstanceTypes != null)
        'allowedInstanceTypes': allowedInstanceTypes,
      if (customAmounts != null) 'customAmounts': customAmounts,
      if (customAttributes != null) 'customAttributes': customAttributes,
      if (excludedInstanceTypes != null)
        'excludedInstanceTypes': excludedInstanceTypes,
      if (rootEbsVolume != null) 'rootEbsVolume': rootEbsVolume,
    };
  }
}

/// The details of the Amazon EC2 instance market options for a service managed
/// fleet.
class ServiceManagedEc2InstanceMarketOptions {
  /// The Amazon EC2 instance type.
  final Ec2MarketType type;

  ServiceManagedEc2InstanceMarketOptions({
    required this.type,
  });

  factory ServiceManagedEc2InstanceMarketOptions.fromJson(
      Map<String, dynamic> json) {
    return ServiceManagedEc2InstanceMarketOptions(
      type: (json['type'] as String).toEc2MarketType(),
    );
  }

  Map<String, dynamic> toJson() {
    final type = this.type;
    return {
      'type': type.toValue(),
    };
  }
}

enum ServiceManagedFleetOperatingSystemFamily {
  windows,
  linux,
}

extension ServiceManagedFleetOperatingSystemFamilyValueExtension
    on ServiceManagedFleetOperatingSystemFamily {
  String toValue() {
    switch (this) {
      case ServiceManagedFleetOperatingSystemFamily.windows:
        return 'WINDOWS';
      case ServiceManagedFleetOperatingSystemFamily.linux:
        return 'LINUX';
    }
  }
}

extension ServiceManagedFleetOperatingSystemFamilyFromString on String {
  ServiceManagedFleetOperatingSystemFamily
      toServiceManagedFleetOperatingSystemFamily() {
    switch (this) {
      case 'WINDOWS':
        return ServiceManagedFleetOperatingSystemFamily.windows;
      case 'LINUX':
        return ServiceManagedFleetOperatingSystemFamily.linux;
    }
    throw Exception(
        '$this is not known in enum ServiceManagedFleetOperatingSystemFamily');
  }
}

/// The definition of the session action.
class SessionActionDefinition {
  /// The environment to enter into.
  final EnvironmentEnterSessionActionDefinition? envEnter;

  /// The environment to exit from.
  final EnvironmentExitSessionActionDefinition? envExit;

  /// The job attachments to sync with a session action.
  final SyncInputJobAttachmentsSessionActionDefinition? syncInputJobAttachments;

  /// The task run in the session.
  final TaskRunSessionActionDefinition? taskRun;

  SessionActionDefinition({
    this.envEnter,
    this.envExit,
    this.syncInputJobAttachments,
    this.taskRun,
  });

  factory SessionActionDefinition.fromJson(Map<String, dynamic> json) {
    return SessionActionDefinition(
      envEnter: json['envEnter'] != null
          ? EnvironmentEnterSessionActionDefinition.fromJson(
              json['envEnter'] as Map<String, dynamic>)
          : null,
      envExit: json['envExit'] != null
          ? EnvironmentExitSessionActionDefinition.fromJson(
              json['envExit'] as Map<String, dynamic>)
          : null,
      syncInputJobAttachments: json['syncInputJobAttachments'] != null
          ? SyncInputJobAttachmentsSessionActionDefinition.fromJson(
              json['syncInputJobAttachments'] as Map<String, dynamic>)
          : null,
      taskRun: json['taskRun'] != null
          ? TaskRunSessionActionDefinition.fromJson(
              json['taskRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envEnter = this.envEnter;
    final envExit = this.envExit;
    final syncInputJobAttachments = this.syncInputJobAttachments;
    final taskRun = this.taskRun;
    return {
      if (envEnter != null) 'envEnter': envEnter,
      if (envExit != null) 'envExit': envExit,
      if (syncInputJobAttachments != null)
        'syncInputJobAttachments': syncInputJobAttachments,
      if (taskRun != null) 'taskRun': taskRun,
    };
  }
}

/// The details of a session action definition.
class SessionActionDefinitionSummary {
  /// The environment to enter into.
  final EnvironmentEnterSessionActionDefinitionSummary? envEnter;

  /// The environment to exit from.
  final EnvironmentExitSessionActionDefinitionSummary? envExit;

  /// The job attachments to sync with the session action definition.
  final SyncInputJobAttachmentsSessionActionDefinitionSummary?
      syncInputJobAttachments;

  /// The task run.
  final TaskRunSessionActionDefinitionSummary? taskRun;

  SessionActionDefinitionSummary({
    this.envEnter,
    this.envExit,
    this.syncInputJobAttachments,
    this.taskRun,
  });

  factory SessionActionDefinitionSummary.fromJson(Map<String, dynamic> json) {
    return SessionActionDefinitionSummary(
      envEnter: json['envEnter'] != null
          ? EnvironmentEnterSessionActionDefinitionSummary.fromJson(
              json['envEnter'] as Map<String, dynamic>)
          : null,
      envExit: json['envExit'] != null
          ? EnvironmentExitSessionActionDefinitionSummary.fromJson(
              json['envExit'] as Map<String, dynamic>)
          : null,
      syncInputJobAttachments: json['syncInputJobAttachments'] != null
          ? SyncInputJobAttachmentsSessionActionDefinitionSummary.fromJson(
              json['syncInputJobAttachments'] as Map<String, dynamic>)
          : null,
      taskRun: json['taskRun'] != null
          ? TaskRunSessionActionDefinitionSummary.fromJson(
              json['taskRun'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final envEnter = this.envEnter;
    final envExit = this.envExit;
    final syncInputJobAttachments = this.syncInputJobAttachments;
    final taskRun = this.taskRun;
    return {
      if (envEnter != null) 'envEnter': envEnter,
      if (envExit != null) 'envExit': envExit,
      if (syncInputJobAttachments != null)
        'syncInputJobAttachments': syncInputJobAttachments,
      if (taskRun != null) 'taskRun': taskRun,
    };
  }
}

enum SessionActionStatus {
  assigned,
  running,
  canceling,
  succeeded,
  failed,
  interrupted,
  canceled,
  neverAttempted,
  scheduled,
  reclaiming,
  reclaimed,
}

extension SessionActionStatusValueExtension on SessionActionStatus {
  String toValue() {
    switch (this) {
      case SessionActionStatus.assigned:
        return 'ASSIGNED';
      case SessionActionStatus.running:
        return 'RUNNING';
      case SessionActionStatus.canceling:
        return 'CANCELING';
      case SessionActionStatus.succeeded:
        return 'SUCCEEDED';
      case SessionActionStatus.failed:
        return 'FAILED';
      case SessionActionStatus.interrupted:
        return 'INTERRUPTED';
      case SessionActionStatus.canceled:
        return 'CANCELED';
      case SessionActionStatus.neverAttempted:
        return 'NEVER_ATTEMPTED';
      case SessionActionStatus.scheduled:
        return 'SCHEDULED';
      case SessionActionStatus.reclaiming:
        return 'RECLAIMING';
      case SessionActionStatus.reclaimed:
        return 'RECLAIMED';
    }
  }
}

extension SessionActionStatusFromString on String {
  SessionActionStatus toSessionActionStatus() {
    switch (this) {
      case 'ASSIGNED':
        return SessionActionStatus.assigned;
      case 'RUNNING':
        return SessionActionStatus.running;
      case 'CANCELING':
        return SessionActionStatus.canceling;
      case 'SUCCEEDED':
        return SessionActionStatus.succeeded;
      case 'FAILED':
        return SessionActionStatus.failed;
      case 'INTERRUPTED':
        return SessionActionStatus.interrupted;
      case 'CANCELED':
        return SessionActionStatus.canceled;
      case 'NEVER_ATTEMPTED':
        return SessionActionStatus.neverAttempted;
      case 'SCHEDULED':
        return SessionActionStatus.scheduled;
      case 'RECLAIMING':
        return SessionActionStatus.reclaiming;
      case 'RECLAIMED':
        return SessionActionStatus.reclaimed;
    }
    throw Exception('$this is not known in enum SessionActionStatus');
  }
}

/// The details of a session action.
class SessionActionSummary {
  /// The session action definition.
  final SessionActionDefinitionSummary definition;

  /// The session action ID.
  final String sessionActionId;

  /// The status of the session action.
  final SessionActionStatus status;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The completion percentage for the session action.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The Linux timestamp of the last date and time that the session action was
  /// updated.
  final DateTime? workerUpdatedAt;

  SessionActionSummary({
    required this.definition,
    required this.sessionActionId,
    required this.status,
    this.endedAt,
    this.progressPercent,
    this.startedAt,
    this.workerUpdatedAt,
  });

  factory SessionActionSummary.fromJson(Map<String, dynamic> json) {
    return SessionActionSummary(
      definition: SessionActionDefinitionSummary.fromJson(
          json['definition'] as Map<String, dynamic>),
      sessionActionId: json['sessionActionId'] as String,
      status: (json['status'] as String).toSessionActionStatus(),
      endedAt: timeStampFromJson(json['endedAt']),
      progressPercent: json['progressPercent'] as double?,
      startedAt: timeStampFromJson(json['startedAt']),
      workerUpdatedAt: timeStampFromJson(json['workerUpdatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    final definition = this.definition;
    final sessionActionId = this.sessionActionId;
    final status = this.status;
    final endedAt = this.endedAt;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final workerUpdatedAt = this.workerUpdatedAt;
    return {
      'definition': definition,
      'sessionActionId': sessionActionId,
      'status': status.toValue(),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (workerUpdatedAt != null)
        'workerUpdatedAt': iso8601ToJson(workerUpdatedAt),
    };
  }
}

enum SessionLifecycleStatus {
  started,
  updateInProgress,
  updateSucceeded,
  updateFailed,
  ended,
}

extension SessionLifecycleStatusValueExtension on SessionLifecycleStatus {
  String toValue() {
    switch (this) {
      case SessionLifecycleStatus.started:
        return 'STARTED';
      case SessionLifecycleStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case SessionLifecycleStatus.updateSucceeded:
        return 'UPDATE_SUCCEEDED';
      case SessionLifecycleStatus.updateFailed:
        return 'UPDATE_FAILED';
      case SessionLifecycleStatus.ended:
        return 'ENDED';
    }
  }
}

extension SessionLifecycleStatusFromString on String {
  SessionLifecycleStatus toSessionLifecycleStatus() {
    switch (this) {
      case 'STARTED':
        return SessionLifecycleStatus.started;
      case 'UPDATE_IN_PROGRESS':
        return SessionLifecycleStatus.updateInProgress;
      case 'UPDATE_SUCCEEDED':
        return SessionLifecycleStatus.updateSucceeded;
      case 'UPDATE_FAILED':
        return SessionLifecycleStatus.updateFailed;
      case 'ENDED':
        return SessionLifecycleStatus.ended;
    }
    throw Exception('$this is not known in enum SessionLifecycleStatus');
  }
}

enum SessionLifecycleTargetStatus {
  ended,
}

extension SessionLifecycleTargetStatusValueExtension
    on SessionLifecycleTargetStatus {
  String toValue() {
    switch (this) {
      case SessionLifecycleTargetStatus.ended:
        return 'ENDED';
    }
  }
}

extension SessionLifecycleTargetStatusFromString on String {
  SessionLifecycleTargetStatus toSessionLifecycleTargetStatus() {
    switch (this) {
      case 'ENDED':
        return SessionLifecycleTargetStatus.ended;
    }
    throw Exception('$this is not known in enum SessionLifecycleTargetStatus');
  }
}

/// The summary of a session.
class SessionSummary {
  /// The fleet ID.
  final String fleetId;

  /// The life cycle status for the session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The session ID.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The worker ID.
  final String workerId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The target life cycle status for the session.
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  SessionSummary({
    required this.fleetId,
    required this.lifecycleStatus,
    required this.sessionId,
    required this.startedAt,
    required this.workerId,
    this.endedAt,
    this.targetLifecycleStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory SessionSummary.fromJson(Map<String, dynamic> json) {
    return SessionSummary(
      fleetId: json['fleetId'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toSessionLifecycleStatus(),
      sessionId: json['sessionId'] as String,
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      workerId: json['workerId'] as String,
      endedAt: timeStampFromJson(json['endedAt']),
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.toSessionLifecycleTargetStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fleetId = this.fleetId;
    final lifecycleStatus = this.lifecycleStatus;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final workerId = this.workerId;
    final endedAt = this.endedAt;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'fleetId': fleetId,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      'workerId': workerId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum SessionsStatisticsAggregationStatus {
  inProgress,
  timeout,
  failed,
  completed,
}

extension SessionsStatisticsAggregationStatusValueExtension
    on SessionsStatisticsAggregationStatus {
  String toValue() {
    switch (this) {
      case SessionsStatisticsAggregationStatus.inProgress:
        return 'IN_PROGRESS';
      case SessionsStatisticsAggregationStatus.timeout:
        return 'TIMEOUT';
      case SessionsStatisticsAggregationStatus.failed:
        return 'FAILED';
      case SessionsStatisticsAggregationStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension SessionsStatisticsAggregationStatusFromString on String {
  SessionsStatisticsAggregationStatus toSessionsStatisticsAggregationStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return SessionsStatisticsAggregationStatus.inProgress;
      case 'TIMEOUT':
        return SessionsStatisticsAggregationStatus.timeout;
      case 'FAILED':
        return SessionsStatisticsAggregationStatus.failed;
      case 'COMPLETED':
        return SessionsStatisticsAggregationStatus.completed;
    }
    throw Exception(
        '$this is not known in enum SessionsStatisticsAggregationStatus');
  }
}

/// Specifies the fleet IDs or queue IDs to return statistics. You can specify
/// only fleet IDs or queue IDS, not both.
class SessionsStatisticsResources {
  /// One to 10 fleet IDs that specify the fleets to return statistics for. If you
  /// specify the <code>fleetIds</code> field, you can't specify the
  /// <code>queueIds</code> field.
  final List<String>? fleetIds;

  /// One to 10 queue IDs that specify the queues to return statistics for. If you
  /// specify the <code>queueIds</code> field, you can't specify the
  /// <code>fleetIds</code> field.
  final List<String>? queueIds;

  SessionsStatisticsResources({
    this.fleetIds,
    this.queueIds,
  });

  Map<String, dynamic> toJson() {
    final fleetIds = this.fleetIds;
    final queueIds = this.queueIds;
    return {
      if (fleetIds != null) 'fleetIds': fleetIds,
      if (queueIds != null) 'queueIds': queueIds,
    };
  }
}

enum SortOrder {
  ascending,
  descending,
}

extension SortOrderValueExtension on SortOrder {
  String toValue() {
    switch (this) {
      case SortOrder.ascending:
        return 'ASCENDING';
      case SortOrder.descending:
        return 'DESCENDING';
    }
  }
}

extension SortOrderFromString on String {
  SortOrder toSortOrder() {
    switch (this) {
      case 'ASCENDING':
        return SortOrder.ascending;
      case 'DESCENDING':
        return SortOrder.descending;
    }
    throw Exception('$this is not known in enum SortOrder');
  }
}

class StartSessionsStatisticsAggregationResponse {
  /// A unique identifier for the aggregated statistics. Use this identifier with
  /// the <code>GetAggregatedStatisticsForSessions</code> operation to return the
  /// statistics.
  final String aggregationId;

  StartSessionsStatisticsAggregationResponse({
    required this.aggregationId,
  });

  factory StartSessionsStatisticsAggregationResponse.fromJson(
      Map<String, dynamic> json) {
    return StartSessionsStatisticsAggregationResponse(
      aggregationId: json['aggregationId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final aggregationId = this.aggregationId;
    return {
      'aggregationId': aggregationId,
    };
  }
}

/// A list of statistics for a session.
class Statistics {
  /// How the statistics should appear in USD. Options include: minimum, maximum,
  /// average or sum.
  final Stats costInUsd;

  /// The number of instances in a list of statistics.
  final int count;

  /// The total aggregated runtime.
  final Stats runtimeInSeconds;

  /// The end time for the aggregation.
  final DateTime? aggregationEndTime;

  /// The start time for the aggregation.
  final DateTime? aggregationStartTime;

  /// The fleet ID.
  final String? fleetId;

  /// The type of instance.
  final String? instanceType;

  /// The job ID.
  final String? jobId;

  /// The job name.
  final String? jobName;

  /// The licensed product.
  final String? licenseProduct;

  /// The queue ID.
  final String? queueId;

  /// The type of usage for the statistics.
  final UsageType? usageType;

  /// The user ID.
  final String? userId;

  Statistics({
    required this.costInUsd,
    required this.count,
    required this.runtimeInSeconds,
    this.aggregationEndTime,
    this.aggregationStartTime,
    this.fleetId,
    this.instanceType,
    this.jobId,
    this.jobName,
    this.licenseProduct,
    this.queueId,
    this.usageType,
    this.userId,
  });

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      costInUsd: Stats.fromJson(json['costInUsd'] as Map<String, dynamic>),
      count: json['count'] as int,
      runtimeInSeconds:
          Stats.fromJson(json['runtimeInSeconds'] as Map<String, dynamic>),
      aggregationEndTime: timeStampFromJson(json['aggregationEndTime']),
      aggregationStartTime: timeStampFromJson(json['aggregationStartTime']),
      fleetId: json['fleetId'] as String?,
      instanceType: json['instanceType'] as String?,
      jobId: json['jobId'] as String?,
      jobName: json['jobName'] as String?,
      licenseProduct: json['licenseProduct'] as String?,
      queueId: json['queueId'] as String?,
      usageType: (json['usageType'] as String?)?.toUsageType(),
      userId: json['userId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final costInUsd = this.costInUsd;
    final count = this.count;
    final runtimeInSeconds = this.runtimeInSeconds;
    final aggregationEndTime = this.aggregationEndTime;
    final aggregationStartTime = this.aggregationStartTime;
    final fleetId = this.fleetId;
    final instanceType = this.instanceType;
    final jobId = this.jobId;
    final jobName = this.jobName;
    final licenseProduct = this.licenseProduct;
    final queueId = this.queueId;
    final usageType = this.usageType;
    final userId = this.userId;
    return {
      'costInUsd': costInUsd,
      'count': count,
      'runtimeInSeconds': runtimeInSeconds,
      if (aggregationEndTime != null)
        'aggregationEndTime': iso8601ToJson(aggregationEndTime),
      if (aggregationStartTime != null)
        'aggregationStartTime': iso8601ToJson(aggregationStartTime),
      if (fleetId != null) 'fleetId': fleetId,
      if (instanceType != null) 'instanceType': instanceType,
      if (jobId != null) 'jobId': jobId,
      if (jobName != null) 'jobName': jobName,
      if (licenseProduct != null) 'licenseProduct': licenseProduct,
      if (queueId != null) 'queueId': queueId,
      if (usageType != null) 'usageType': usageType.toValue(),
      if (userId != null) 'userId': userId,
    };
  }
}

/// The minimum, maximum, average, and sum.
class Stats {
  /// The average of the usage statistics.
  final double? avg;

  /// The maximum among the usage statistics.
  final double? max;

  /// The minimum of the usage statistics.
  final double? min;

  /// The sum of the usage statistics.
  final double? sum;

  Stats({
    this.avg,
    this.max,
    this.min,
    this.sum,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    return Stats(
      avg: json['avg'] as double?,
      max: json['max'] as double?,
      min: json['min'] as double?,
      sum: json['sum'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final avg = this.avg;
    final max = this.max;
    final min = this.min;
    final sum = this.sum;
    return {
      if (avg != null) 'avg': avg,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (sum != null) 'sum': sum,
    };
  }
}

/// The details outlining the minimum and maximum capability of a step.
class StepAmountCapability {
  /// The name of the step.
  final String name;

  /// The maximum amount.
  final double? max;

  /// The minimum amount.
  final double? min;

  /// The amount value.
  final double? value;

  StepAmountCapability({
    required this.name,
    this.max,
    this.min,
    this.value,
  });

  factory StepAmountCapability.fromJson(Map<String, dynamic> json) {
    return StepAmountCapability(
      name: json['name'] as String,
      max: json['max'] as double?,
      min: json['min'] as double?,
      value: json['value'] as double?,
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final max = this.max;
    final min = this.min;
    final value = this.value;
    return {
      'name': name,
      if (max != null) 'max': max,
      if (min != null) 'min': min,
      if (value != null) 'value': value,
    };
  }
}

/// The list of step attributes.
class StepAttributeCapability {
  /// The name of the step attribute.
  final String name;

  /// Requires all of the step attribute values.
  final List<String>? allOf;

  /// Requires any of the step attributes in a given list.
  final List<String>? anyOf;

  StepAttributeCapability({
    required this.name,
    this.allOf,
    this.anyOf,
  });

  factory StepAttributeCapability.fromJson(Map<String, dynamic> json) {
    return StepAttributeCapability(
      name: json['name'] as String,
      allOf: (json['allOf'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      anyOf: (json['anyOf'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final allOf = this.allOf;
    final anyOf = this.anyOf;
    return {
      'name': name,
      if (allOf != null) 'allOf': allOf,
      if (anyOf != null) 'anyOf': anyOf,
    };
  }
}

/// The details of a step consumer.
class StepConsumer {
  /// The step consumer status.
  final DependencyConsumerResolutionStatus status;

  /// The step ID.
  final String stepId;

  StepConsumer({
    required this.status,
    required this.stepId,
  });

  factory StepConsumer.fromJson(Map<String, dynamic> json) {
    return StepConsumer(
      status: (json['status'] as String).toDependencyConsumerResolutionStatus(),
      stepId: json['stepId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final stepId = this.stepId;
    return {
      'status': status.toValue(),
      'stepId': stepId,
    };
  }
}

/// The details of step dependency.
class StepDependency {
  /// The step dependency status.
  final DependencyConsumerResolutionStatus status;

  /// The step ID.
  final String stepId;

  StepDependency({
    required this.status,
    required this.stepId,
  });

  factory StepDependency.fromJson(Map<String, dynamic> json) {
    return StepDependency(
      status: (json['status'] as String).toDependencyConsumerResolutionStatus(),
      stepId: json['stepId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final stepId = this.stepId;
    return {
      'status': status.toValue(),
      'stepId': stepId,
    };
  }
}

/// The details of a step entity.
class StepDetailsEntity {
  /// The dependencies for a step.
  final List<String> dependencies;

  /// The job ID.
  final String jobId;

  /// The schema version for a step template.
  final String schemaVersion;

  /// The step ID.
  final String stepId;

  /// The template for a step.
  final Document template;

  StepDetailsEntity({
    required this.dependencies,
    required this.jobId,
    required this.schemaVersion,
    required this.stepId,
    required this.template,
  });

  factory StepDetailsEntity.fromJson(Map<String, dynamic> json) {
    return StepDetailsEntity(
      dependencies: (json['dependencies'] as List)
          .whereNotNull()
          .map((e) => e as String)
          .toList(),
      jobId: json['jobId'] as String,
      schemaVersion: json['schemaVersion'] as String,
      stepId: json['stepId'] as String,
      template: Document.fromJson(json['template'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    final dependencies = this.dependencies;
    final jobId = this.jobId;
    final schemaVersion = this.schemaVersion;
    final stepId = this.stepId;
    final template = this.template;
    return {
      'dependencies': dependencies,
      'jobId': jobId,
      'schemaVersion': schemaVersion,
      'stepId': stepId,
      'template': template,
    };
  }
}

/// The details of the step error.
class StepDetailsError {
  /// The error code.
  final JobEntityErrorCode code;

  /// The job ID.
  final String jobId;

  /// The error message detailing the error's cause.
  final String message;

  /// The step ID.
  final String stepId;

  StepDetailsError({
    required this.code,
    required this.jobId,
    required this.message,
    required this.stepId,
  });

  factory StepDetailsError.fromJson(Map<String, dynamic> json) {
    return StepDetailsError(
      code: (json['code'] as String).toJobEntityErrorCode(),
      jobId: json['jobId'] as String,
      message: json['message'] as String,
      stepId: json['stepId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final code = this.code;
    final jobId = this.jobId;
    final message = this.message;
    final stepId = this.stepId;
    return {
      'code': code.toValue(),
      'jobId': jobId,
      'message': message,
      'stepId': stepId,
    };
  }
}

/// The details of identifiers for a step.
class StepDetailsIdentifiers {
  /// The job ID.
  final String jobId;

  /// The step ID.
  final String stepId;

  StepDetailsIdentifiers({
    required this.jobId,
    required this.stepId,
  });

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final stepId = this.stepId;
    return {
      'jobId': jobId,
      'stepId': stepId,
    };
  }
}

enum StepLifecycleStatus {
  createComplete,
  updateInProgress,
  updateFailed,
  updateSucceeded,
}

extension StepLifecycleStatusValueExtension on StepLifecycleStatus {
  String toValue() {
    switch (this) {
      case StepLifecycleStatus.createComplete:
        return 'CREATE_COMPLETE';
      case StepLifecycleStatus.updateInProgress:
        return 'UPDATE_IN_PROGRESS';
      case StepLifecycleStatus.updateFailed:
        return 'UPDATE_FAILED';
      case StepLifecycleStatus.updateSucceeded:
        return 'UPDATE_SUCCEEDED';
    }
  }
}

extension StepLifecycleStatusFromString on String {
  StepLifecycleStatus toStepLifecycleStatus() {
    switch (this) {
      case 'CREATE_COMPLETE':
        return StepLifecycleStatus.createComplete;
      case 'UPDATE_IN_PROGRESS':
        return StepLifecycleStatus.updateInProgress;
      case 'UPDATE_FAILED':
        return StepLifecycleStatus.updateFailed;
      case 'UPDATE_SUCCEEDED':
        return StepLifecycleStatus.updateSucceeded;
    }
    throw Exception('$this is not known in enum StepLifecycleStatus');
  }
}

/// The details of a step parameter.
class StepParameter {
  /// The name of the parameter.
  final String name;

  /// The data type of the parameter.
  final StepParameterType type;

  StepParameter({
    required this.name,
    required this.type,
  });

  factory StepParameter.fromJson(Map<String, dynamic> json) {
    return StepParameter(
      name: json['name'] as String,
      type: (json['type'] as String).toStepParameterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final type = this.type;
    return {
      'name': name,
      'type': type.toValue(),
    };
  }
}

enum StepParameterType {
  int,
  float,
  string,
  path,
}

extension StepParameterTypeValueExtension on StepParameterType {
  String toValue() {
    switch (this) {
      case StepParameterType.int:
        return 'INT';
      case StepParameterType.float:
        return 'FLOAT';
      case StepParameterType.string:
        return 'STRING';
      case StepParameterType.path:
        return 'PATH';
    }
  }
}

extension StepParameterTypeFromString on String {
  StepParameterType toStepParameterType() {
    switch (this) {
      case 'INT':
        return StepParameterType.int;
      case 'FLOAT':
        return StepParameterType.float;
      case 'STRING':
        return StepParameterType.string;
      case 'PATH':
        return StepParameterType.path;
    }
    throw Exception('$this is not known in enum StepParameterType');
  }
}

/// The details of required step capabilities.
class StepRequiredCapabilities {
  /// The capability amounts that the step requires.
  final List<StepAmountCapability> amounts;

  /// The capability attributes that the step requires.
  final List<StepAttributeCapability> attributes;

  StepRequiredCapabilities({
    required this.amounts,
    required this.attributes,
  });

  factory StepRequiredCapabilities.fromJson(Map<String, dynamic> json) {
    return StepRequiredCapabilities(
      amounts: (json['amounts'] as List)
          .whereNotNull()
          .map((e) => StepAmountCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
      attributes: (json['attributes'] as List)
          .whereNotNull()
          .map((e) =>
              StepAttributeCapability.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final amounts = this.amounts;
    final attributes = this.attributes;
    return {
      'amounts': amounts,
      'attributes': attributes,
    };
  }
}

/// The details of a step search.
class StepSearchSummary {
  /// The date and time the resource was created.
  final DateTime? createdAt;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The job ID.
  final String? jobId;

  /// The life cycle status.
  final StepLifecycleStatus? lifecycleStatus;

  /// The life cycle status message.
  final String? lifecycleStatusMessage;

  /// The step name.
  final String? name;

  /// The parameters and combination expressions for the search.
  final ParameterSpace? parameterSpace;

  /// The queue ID.
  final String? queueId;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The step ID.
  final String? stepId;

  /// The task status to start with on the job.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to be processed.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to be run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus? taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int>? taskRunStatusCounts;

  StepSearchSummary({
    this.createdAt,
    this.endedAt,
    this.jobId,
    this.lifecycleStatus,
    this.lifecycleStatusMessage,
    this.name,
    this.parameterSpace,
    this.queueId,
    this.startedAt,
    this.stepId,
    this.targetTaskRunStatus,
    this.taskRunStatus,
    this.taskRunStatusCounts,
  });

  factory StepSearchSummary.fromJson(Map<String, dynamic> json) {
    return StepSearchSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      endedAt: timeStampFromJson(json['endedAt']),
      jobId: json['jobId'] as String?,
      lifecycleStatus:
          (json['lifecycleStatus'] as String?)?.toStepLifecycleStatus(),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      name: json['name'] as String?,
      parameterSpace: json['parameterSpace'] != null
          ? ParameterSpace.fromJson(
              json['parameterSpace'] as Map<String, dynamic>)
          : null,
      queueId: json['queueId'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      stepId: json['stepId'] as String?,
      targetTaskRunStatus:
          (json['targetTaskRunStatus'] as String?)?.toStepTargetTaskRunStatus(),
      taskRunStatus: (json['taskRunStatus'] as String?)?.toTaskRunStatus(),
      taskRunStatusCounts:
          (json['taskRunStatusCounts'] as Map<String, dynamic>?)
              ?.map((k, e) => MapEntry(k.toTaskRunStatus(), e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final endedAt = this.endedAt;
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final name = this.name;
    final parameterSpace = this.parameterSpace;
    final queueId = this.queueId;
    final startedAt = this.startedAt;
    final stepId = this.stepId;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (jobId != null) 'jobId': jobId,
      if (lifecycleStatus != null) 'lifecycleStatus': lifecycleStatus.toValue(),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (name != null) 'name': name,
      if (parameterSpace != null) 'parameterSpace': parameterSpace,
      if (queueId != null) 'queueId': queueId,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stepId != null) 'stepId': stepId,
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
      if (taskRunStatus != null) 'taskRunStatus': taskRunStatus.toValue(),
      if (taskRunStatusCounts != null)
        'taskRunStatusCounts':
            taskRunStatusCounts.map((k, e) => MapEntry(k.toValue(), e)),
    };
  }
}

/// The details for a step.
class StepSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The life cycle status.
  final StepLifecycleStatus lifecycleStatus;

  /// The name of the step.
  final String name;

  /// The step ID.
  final String stepId;

  /// The task run status for the job.
  ///
  /// <ul>
  /// <li>
  /// <code>PENDING</code>–pending and waiting for resources.
  /// </li>
  /// <li>
  /// <code>READY</code>–ready to process.
  /// </li>
  /// <li>
  /// <code>ASSIGNED</code>–assigned and will run next on a worker.
  /// </li>
  /// <li>
  /// <code>SCHEDULED</code>–scheduled to run on a worker.
  /// </li>
  /// <li>
  /// <code>INTERRUPTING</code>–being interrupted.
  /// </li>
  /// <li>
  /// <code>RUNNING</code>–running on a worker.
  /// </li>
  /// <li>
  /// <code>SUSPENDED</code>–the task is suspended.
  /// </li>
  /// <li>
  /// <code>CANCELED</code>–the task has been canceled.
  /// </li>
  /// <li>
  /// <code>FAILED</code>–the task has failed.
  /// </li>
  /// <li>
  /// <code>SUCCEEDED</code>–the task has succeeded.
  /// </li>
  /// </ul>
  final TaskRunStatus taskRunStatus;

  /// The number of tasks running on the job.
  final Map<TaskRunStatus, int> taskRunStatusCounts;

  /// The number of dependencies for the step.
  final DependencyCounts? dependencyCounts;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// A message that describes the lifecycle of the step.
  final String? lifecycleStatusMessage;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The task status to start with on the job.
  final StepTargetTaskRunStatus? targetTaskRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  StepSummary({
    required this.createdAt,
    required this.createdBy,
    required this.lifecycleStatus,
    required this.name,
    required this.stepId,
    required this.taskRunStatus,
    required this.taskRunStatusCounts,
    this.dependencyCounts,
    this.endedAt,
    this.lifecycleStatusMessage,
    this.startedAt,
    this.targetTaskRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory StepSummary.fromJson(Map<String, dynamic> json) {
    return StepSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toStepLifecycleStatus(),
      name: json['name'] as String,
      stepId: json['stepId'] as String,
      taskRunStatus: (json['taskRunStatus'] as String).toTaskRunStatus(),
      taskRunStatusCounts: (json['taskRunStatusCounts'] as Map<String, dynamic>)
          .map((k, e) => MapEntry(k.toTaskRunStatus(), e as int)),
      dependencyCounts: json['dependencyCounts'] != null
          ? DependencyCounts.fromJson(
              json['dependencyCounts'] as Map<String, dynamic>)
          : null,
      endedAt: timeStampFromJson(json['endedAt']),
      lifecycleStatusMessage: json['lifecycleStatusMessage'] as String?,
      startedAt: timeStampFromJson(json['startedAt']),
      targetTaskRunStatus:
          (json['targetTaskRunStatus'] as String?)?.toStepTargetTaskRunStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final lifecycleStatus = this.lifecycleStatus;
    final name = this.name;
    final stepId = this.stepId;
    final taskRunStatus = this.taskRunStatus;
    final taskRunStatusCounts = this.taskRunStatusCounts;
    final dependencyCounts = this.dependencyCounts;
    final endedAt = this.endedAt;
    final lifecycleStatusMessage = this.lifecycleStatusMessage;
    final startedAt = this.startedAt;
    final targetTaskRunStatus = this.targetTaskRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'name': name,
      'stepId': stepId,
      'taskRunStatus': taskRunStatus.toValue(),
      'taskRunStatusCounts':
          taskRunStatusCounts.map((k, e) => MapEntry(k.toValue(), e)),
      if (dependencyCounts != null) 'dependencyCounts': dependencyCounts,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (lifecycleStatusMessage != null)
        'lifecycleStatusMessage': lifecycleStatusMessage,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetTaskRunStatus != null)
        'targetTaskRunStatus': targetTaskRunStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum StepTargetTaskRunStatus {
  ready,
  failed,
  succeeded,
  canceled,
  suspended,
  pending,
}

extension StepTargetTaskRunStatusValueExtension on StepTargetTaskRunStatus {
  String toValue() {
    switch (this) {
      case StepTargetTaskRunStatus.ready:
        return 'READY';
      case StepTargetTaskRunStatus.failed:
        return 'FAILED';
      case StepTargetTaskRunStatus.succeeded:
        return 'SUCCEEDED';
      case StepTargetTaskRunStatus.canceled:
        return 'CANCELED';
      case StepTargetTaskRunStatus.suspended:
        return 'SUSPENDED';
      case StepTargetTaskRunStatus.pending:
        return 'PENDING';
    }
  }
}

extension StepTargetTaskRunStatusFromString on String {
  StepTargetTaskRunStatus toStepTargetTaskRunStatus() {
    switch (this) {
      case 'READY':
        return StepTargetTaskRunStatus.ready;
      case 'FAILED':
        return StepTargetTaskRunStatus.failed;
      case 'SUCCEEDED':
        return StepTargetTaskRunStatus.succeeded;
      case 'CANCELED':
        return StepTargetTaskRunStatus.canceled;
      case 'SUSPENDED':
        return StepTargetTaskRunStatus.suspended;
      case 'PENDING':
        return StepTargetTaskRunStatus.pending;
    }
    throw Exception('$this is not known in enum StepTargetTaskRunStatus');
  }
}

enum StorageProfileOperatingSystemFamily {
  windows,
  linux,
  macos,
}

extension StorageProfileOperatingSystemFamilyValueExtension
    on StorageProfileOperatingSystemFamily {
  String toValue() {
    switch (this) {
      case StorageProfileOperatingSystemFamily.windows:
        return 'WINDOWS';
      case StorageProfileOperatingSystemFamily.linux:
        return 'LINUX';
      case StorageProfileOperatingSystemFamily.macos:
        return 'MACOS';
    }
  }
}

extension StorageProfileOperatingSystemFamilyFromString on String {
  StorageProfileOperatingSystemFamily toStorageProfileOperatingSystemFamily() {
    switch (this) {
      case 'WINDOWS':
        return StorageProfileOperatingSystemFamily.windows;
      case 'LINUX':
        return StorageProfileOperatingSystemFamily.linux;
      case 'MACOS':
        return StorageProfileOperatingSystemFamily.macos;
    }
    throw Exception(
        '$this is not known in enum StorageProfileOperatingSystemFamily');
  }
}

/// The details of a storage profile.
class StorageProfileSummary {
  /// The display name of the storage profile summary to update.
  final String displayName;

  /// The operating system (OS) family.
  final StorageProfileOperatingSystemFamily osFamily;

  /// The storage profile ID.
  final String storageProfileId;

  StorageProfileSummary({
    required this.displayName,
    required this.osFamily,
    required this.storageProfileId,
  });

  factory StorageProfileSummary.fromJson(Map<String, dynamic> json) {
    return StorageProfileSummary(
      displayName: json['displayName'] as String,
      osFamily:
          (json['osFamily'] as String).toStorageProfileOperatingSystemFamily(),
      storageProfileId: json['storageProfileId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final displayName = this.displayName;
    final osFamily = this.osFamily;
    final storageProfileId = this.storageProfileId;
    return {
      'displayName': displayName,
      'osFamily': osFamily.toValue(),
      'storageProfileId': storageProfileId,
    };
  }
}

/// Searches for a particular string.
class StringFilterExpression {
  /// The field name to search.
  final String name;

  /// The type of comparison to use for this search.
  final ComparisonOperator operator;

  /// The string to search for.
  final String value;

  StringFilterExpression({
    required this.name,
    required this.operator,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final operator = this.operator;
    final value = this.value;
    return {
      'name': name,
      'operator': operator.toValue(),
      'value': value,
    };
  }
}

/// The job attachment in a session action to sync.
class SyncInputJobAttachmentsSessionActionDefinition {
  /// The step ID for the step in the job attachment.
  final String? stepId;

  SyncInputJobAttachmentsSessionActionDefinition({
    this.stepId,
  });

  factory SyncInputJobAttachmentsSessionActionDefinition.fromJson(
      Map<String, dynamic> json) {
    return SyncInputJobAttachmentsSessionActionDefinition(
      stepId: json['stepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    return {
      if (stepId != null) 'stepId': stepId,
    };
  }
}

/// The details of a synced job attachment.
class SyncInputJobAttachmentsSessionActionDefinitionSummary {
  /// The step ID of the step in the job attachment.
  final String? stepId;

  SyncInputJobAttachmentsSessionActionDefinitionSummary({
    this.stepId,
  });

  factory SyncInputJobAttachmentsSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return SyncInputJobAttachmentsSessionActionDefinitionSummary(
      stepId: json['stepId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    return {
      if (stepId != null) 'stepId': stepId,
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

/// The data types for the task parameters.
class TaskParameterValue {
  /// A double precision IEEE-754 floating point number represented as a string.
  final String? float;

  /// A signed integer represented as a string.
  final String? intValue;

  /// A file system path represented as a string.
  final String? path;

  /// A UTF-8 string.
  final String? string;

  TaskParameterValue({
    this.float,
    this.intValue,
    this.path,
    this.string,
  });

  factory TaskParameterValue.fromJson(Map<String, dynamic> json) {
    return TaskParameterValue(
      float: json['float'] as String?,
      intValue: json['int'] as String?,
      path: json['path'] as String?,
      string: json['string'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final float = this.float;
    final intValue = this.intValue;
    final path = this.path;
    final string = this.string;
    return {
      if (float != null) 'float': float,
      if (intValue != null) 'int': intValue,
      if (path != null) 'path': path,
      if (string != null) 'string': string,
    };
  }
}

/// The task, step, and parameters for the task run in the session action.
class TaskRunSessionActionDefinition {
  /// The task parameters.
  final Map<String, TaskParameterValue> parameters;

  /// The step ID.
  final String stepId;

  /// The task ID.
  final String taskId;

  TaskRunSessionActionDefinition({
    required this.parameters,
    required this.stepId,
    required this.taskId,
  });

  factory TaskRunSessionActionDefinition.fromJson(Map<String, dynamic> json) {
    return TaskRunSessionActionDefinition(
      parameters: (json['parameters'] as Map<String, dynamic>).map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      stepId: json['stepId'] as String,
      taskId: json['taskId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final parameters = this.parameters;
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'parameters': parameters,
      'stepId': stepId,
      'taskId': taskId,
    };
  }
}

/// The details of a task run in a session action.
class TaskRunSessionActionDefinitionSummary {
  /// The step ID.
  final String stepId;

  /// The task ID.
  final String taskId;

  TaskRunSessionActionDefinitionSummary({
    required this.stepId,
    required this.taskId,
  });

  factory TaskRunSessionActionDefinitionSummary.fromJson(
      Map<String, dynamic> json) {
    return TaskRunSessionActionDefinitionSummary(
      stepId: json['stepId'] as String,
      taskId: json['taskId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final stepId = this.stepId;
    final taskId = this.taskId;
    return {
      'stepId': stepId,
      'taskId': taskId,
    };
  }
}

enum TaskRunStatus {
  pending,
  ready,
  assigned,
  starting,
  scheduled,
  interrupting,
  running,
  suspended,
  canceled,
  failed,
  succeeded,
  notCompatible,
}

extension TaskRunStatusValueExtension on TaskRunStatus {
  String toValue() {
    switch (this) {
      case TaskRunStatus.pending:
        return 'PENDING';
      case TaskRunStatus.ready:
        return 'READY';
      case TaskRunStatus.assigned:
        return 'ASSIGNED';
      case TaskRunStatus.starting:
        return 'STARTING';
      case TaskRunStatus.scheduled:
        return 'SCHEDULED';
      case TaskRunStatus.interrupting:
        return 'INTERRUPTING';
      case TaskRunStatus.running:
        return 'RUNNING';
      case TaskRunStatus.suspended:
        return 'SUSPENDED';
      case TaskRunStatus.canceled:
        return 'CANCELED';
      case TaskRunStatus.failed:
        return 'FAILED';
      case TaskRunStatus.succeeded:
        return 'SUCCEEDED';
      case TaskRunStatus.notCompatible:
        return 'NOT_COMPATIBLE';
    }
  }
}

extension TaskRunStatusFromString on String {
  TaskRunStatus toTaskRunStatus() {
    switch (this) {
      case 'PENDING':
        return TaskRunStatus.pending;
      case 'READY':
        return TaskRunStatus.ready;
      case 'ASSIGNED':
        return TaskRunStatus.assigned;
      case 'STARTING':
        return TaskRunStatus.starting;
      case 'SCHEDULED':
        return TaskRunStatus.scheduled;
      case 'INTERRUPTING':
        return TaskRunStatus.interrupting;
      case 'RUNNING':
        return TaskRunStatus.running;
      case 'SUSPENDED':
        return TaskRunStatus.suspended;
      case 'CANCELED':
        return TaskRunStatus.canceled;
      case 'FAILED':
        return TaskRunStatus.failed;
      case 'SUCCEEDED':
        return TaskRunStatus.succeeded;
      case 'NOT_COMPATIBLE':
        return TaskRunStatus.notCompatible;
    }
    throw Exception('$this is not known in enum TaskRunStatus');
  }
}

/// The details of a task search.
class TaskSearchSummary {
  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times that the task failed and was retried.
  final int? failureRetryCount;

  /// The job ID.
  final String? jobId;

  /// The parameters to search for.
  final Map<String, TaskParameterValue>? parameters;

  /// The queue ID.
  final String? queueId;

  /// The run status of the task.
  final TaskRunStatus? runStatus;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The step ID.
  final String? stepId;

  /// The run status that the task is being updated to.
  final TaskTargetRunStatus? targetRunStatus;

  /// The task ID.
  final String? taskId;

  TaskSearchSummary({
    this.endedAt,
    this.failureRetryCount,
    this.jobId,
    this.parameters,
    this.queueId,
    this.runStatus,
    this.startedAt,
    this.stepId,
    this.targetRunStatus,
    this.taskId,
  });

  factory TaskSearchSummary.fromJson(Map<String, dynamic> json) {
    return TaskSearchSummary(
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      jobId: json['jobId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      queueId: json['queueId'] as String?,
      runStatus: (json['runStatus'] as String?)?.toTaskRunStatus(),
      startedAt: timeStampFromJson(json['startedAt']),
      stepId: json['stepId'] as String?,
      targetRunStatus:
          (json['targetRunStatus'] as String?)?.toTaskTargetRunStatus(),
      taskId: json['taskId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final jobId = this.jobId;
    final parameters = this.parameters;
    final queueId = this.queueId;
    final runStatus = this.runStatus;
    final startedAt = this.startedAt;
    final stepId = this.stepId;
    final targetRunStatus = this.targetRunStatus;
    final taskId = this.taskId;
    return {
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (jobId != null) 'jobId': jobId,
      if (parameters != null) 'parameters': parameters,
      if (queueId != null) 'queueId': queueId,
      if (runStatus != null) 'runStatus': runStatus.toValue(),
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (stepId != null) 'stepId': stepId,
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.toValue(),
      if (taskId != null) 'taskId': taskId,
    };
  }
}

/// The details of a task.
class TaskSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The run status of the task.
  final TaskRunStatus runStatus;

  /// The task ID.
  final String taskId;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The number of times that the task failed and was retried.
  final int? failureRetryCount;

  /// The latest session action for the task.
  final String? latestSessionActionId;

  /// The task parameters.
  final Map<String, TaskParameterValue>? parameters;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The run status on which the started.
  final TaskTargetRunStatus? targetRunStatus;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  TaskSummary({
    required this.createdAt,
    required this.createdBy,
    required this.runStatus,
    required this.taskId,
    this.endedAt,
    this.failureRetryCount,
    this.latestSessionActionId,
    this.parameters,
    this.startedAt,
    this.targetRunStatus,
    this.updatedAt,
    this.updatedBy,
  });

  factory TaskSummary.fromJson(Map<String, dynamic> json) {
    return TaskSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      runStatus: (json['runStatus'] as String).toTaskRunStatus(),
      taskId: json['taskId'] as String,
      endedAt: timeStampFromJson(json['endedAt']),
      failureRetryCount: json['failureRetryCount'] as int?,
      latestSessionActionId: json['latestSessionActionId'] as String?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(k, TaskParameterValue.fromJson(e as Map<String, dynamic>))),
      startedAt: timeStampFromJson(json['startedAt']),
      targetRunStatus:
          (json['targetRunStatus'] as String?)?.toTaskTargetRunStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final runStatus = this.runStatus;
    final taskId = this.taskId;
    final endedAt = this.endedAt;
    final failureRetryCount = this.failureRetryCount;
    final latestSessionActionId = this.latestSessionActionId;
    final parameters = this.parameters;
    final startedAt = this.startedAt;
    final targetRunStatus = this.targetRunStatus;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'runStatus': runStatus.toValue(),
      'taskId': taskId,
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (failureRetryCount != null) 'failureRetryCount': failureRetryCount,
      if (latestSessionActionId != null)
        'latestSessionActionId': latestSessionActionId,
      if (parameters != null) 'parameters': parameters,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (targetRunStatus != null) 'targetRunStatus': targetRunStatus.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
    };
  }
}

enum TaskTargetRunStatus {
  ready,
  failed,
  succeeded,
  canceled,
  suspended,
  pending,
}

extension TaskTargetRunStatusValueExtension on TaskTargetRunStatus {
  String toValue() {
    switch (this) {
      case TaskTargetRunStatus.ready:
        return 'READY';
      case TaskTargetRunStatus.failed:
        return 'FAILED';
      case TaskTargetRunStatus.succeeded:
        return 'SUCCEEDED';
      case TaskTargetRunStatus.canceled:
        return 'CANCELED';
      case TaskTargetRunStatus.suspended:
        return 'SUSPENDED';
      case TaskTargetRunStatus.pending:
        return 'PENDING';
    }
  }
}

extension TaskTargetRunStatusFromString on String {
  TaskTargetRunStatus toTaskTargetRunStatus() {
    switch (this) {
      case 'READY':
        return TaskTargetRunStatus.ready;
      case 'FAILED':
        return TaskTargetRunStatus.failed;
      case 'SUCCEEDED':
        return TaskTargetRunStatus.succeeded;
      case 'CANCELED':
        return TaskTargetRunStatus.canceled;
      case 'SUSPENDED':
        return TaskTargetRunStatus.suspended;
      case 'PENDING':
        return TaskTargetRunStatus.pending;
    }
    throw Exception('$this is not known in enum TaskTargetRunStatus');
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

class UpdateBudgetResponse {
  UpdateBudgetResponse();

  factory UpdateBudgetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateBudgetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFarmResponse {
  UpdateFarmResponse();

  factory UpdateFarmResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFarmResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateFleetResponse {
  UpdateFleetResponse();

  factory UpdateFleetResponse.fromJson(Map<String, dynamic> _) {
    return UpdateFleetResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum UpdateJobLifecycleStatus {
  archived,
}

extension UpdateJobLifecycleStatusValueExtension on UpdateJobLifecycleStatus {
  String toValue() {
    switch (this) {
      case UpdateJobLifecycleStatus.archived:
        return 'ARCHIVED';
    }
  }
}

extension UpdateJobLifecycleStatusFromString on String {
  UpdateJobLifecycleStatus toUpdateJobLifecycleStatus() {
    switch (this) {
      case 'ARCHIVED':
        return UpdateJobLifecycleStatus.archived;
    }
    throw Exception('$this is not known in enum UpdateJobLifecycleStatus');
  }
}

class UpdateJobResponse {
  UpdateJobResponse();

  factory UpdateJobResponse.fromJson(Map<String, dynamic> _) {
    return UpdateJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateMonitorResponse {
  UpdateMonitorResponse();

  factory UpdateMonitorResponse.fromJson(Map<String, dynamic> _) {
    return UpdateMonitorResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateQueueEnvironmentResponse {
  UpdateQueueEnvironmentResponse();

  factory UpdateQueueEnvironmentResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueEnvironmentResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateQueueFleetAssociationResponse {
  UpdateQueueFleetAssociationResponse();

  factory UpdateQueueFleetAssociationResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueFleetAssociationResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum UpdateQueueFleetAssociationStatus {
  active,
  stopSchedulingAndCompleteTasks,
  stopSchedulingAndCancelTasks,
}

extension UpdateQueueFleetAssociationStatusValueExtension
    on UpdateQueueFleetAssociationStatus {
  String toValue() {
    switch (this) {
      case UpdateQueueFleetAssociationStatus.active:
        return 'ACTIVE';
      case UpdateQueueFleetAssociationStatus.stopSchedulingAndCompleteTasks:
        return 'STOP_SCHEDULING_AND_COMPLETE_TASKS';
      case UpdateQueueFleetAssociationStatus.stopSchedulingAndCancelTasks:
        return 'STOP_SCHEDULING_AND_CANCEL_TASKS';
    }
  }
}

extension UpdateQueueFleetAssociationStatusFromString on String {
  UpdateQueueFleetAssociationStatus toUpdateQueueFleetAssociationStatus() {
    switch (this) {
      case 'ACTIVE':
        return UpdateQueueFleetAssociationStatus.active;
      case 'STOP_SCHEDULING_AND_COMPLETE_TASKS':
        return UpdateQueueFleetAssociationStatus.stopSchedulingAndCompleteTasks;
      case 'STOP_SCHEDULING_AND_CANCEL_TASKS':
        return UpdateQueueFleetAssociationStatus.stopSchedulingAndCancelTasks;
    }
    throw Exception(
        '$this is not known in enum UpdateQueueFleetAssociationStatus');
  }
}

class UpdateQueueResponse {
  UpdateQueueResponse();

  factory UpdateQueueResponse.fromJson(Map<String, dynamic> _) {
    return UpdateQueueResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateSessionResponse {
  UpdateSessionResponse();

  factory UpdateSessionResponse.fromJson(Map<String, dynamic> _) {
    return UpdateSessionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStepResponse {
  UpdateStepResponse();

  factory UpdateStepResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStepResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateStorageProfileResponse {
  UpdateStorageProfileResponse();

  factory UpdateStorageProfileResponse.fromJson(Map<String, dynamic> _) {
    return UpdateStorageProfileResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateTaskResponse {
  UpdateTaskResponse();

  factory UpdateTaskResponse.fromJson(Map<String, dynamic> _) {
    return UpdateTaskResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class UpdateWorkerResponse {
  /// The worker log to update.
  final LogConfiguration? log;

  UpdateWorkerResponse({
    this.log,
  });

  factory UpdateWorkerResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkerResponse(
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final log = this.log;
    return {
      if (log != null) 'log': log,
    };
  }
}

class UpdateWorkerScheduleResponse {
  /// The assigned sessions to update.
  final Map<String, AssignedSession> assignedSessions;

  /// The session actions associated with the worker schedule to cancel.
  final Map<String, List<String>> cancelSessionActions;

  /// Updates the time interval (in seconds) for the schedule.
  final int updateIntervalSeconds;

  /// The status to update the worker to.
  final DesiredWorkerStatus? desiredWorkerStatus;

  UpdateWorkerScheduleResponse({
    required this.assignedSessions,
    required this.cancelSessionActions,
    required this.updateIntervalSeconds,
    this.desiredWorkerStatus,
  });

  factory UpdateWorkerScheduleResponse.fromJson(Map<String, dynamic> json) {
    return UpdateWorkerScheduleResponse(
      assignedSessions: (json['assignedSessions'] as Map<String, dynamic>).map(
          (k, e) =>
              MapEntry(k, AssignedSession.fromJson(e as Map<String, dynamic>))),
      cancelSessionActions: (json['cancelSessionActions']
              as Map<String, dynamic>)
          .map((k, e) => MapEntry(
              k, (e as List).whereNotNull().map((e) => e as String).toList())),
      updateIntervalSeconds: json['updateIntervalSeconds'] as int,
      desiredWorkerStatus:
          (json['desiredWorkerStatus'] as String?)?.toDesiredWorkerStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final assignedSessions = this.assignedSessions;
    final cancelSessionActions = this.cancelSessionActions;
    final updateIntervalSeconds = this.updateIntervalSeconds;
    final desiredWorkerStatus = this.desiredWorkerStatus;
    return {
      'assignedSessions': assignedSessions,
      'cancelSessionActions': cancelSessionActions,
      'updateIntervalSeconds': updateIntervalSeconds,
      if (desiredWorkerStatus != null)
        'desiredWorkerStatus': desiredWorkerStatus.toValue(),
    };
  }
}

/// The updated session action information as it relates to completion and
/// progress of the session.
class UpdatedSessionActionInfo {
  /// The status of the session upon completion.
  final CompletedStatus? completedStatus;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The process exit code.
  final int? processExitCode;

  /// A message to indicate the progress of the updated session action.
  final String? progressMessage;

  /// The percentage completed.
  final double? progressPercent;

  /// The date and time the resource started running.
  final DateTime? startedAt;

  /// The updated time.
  final DateTime? updatedAt;

  UpdatedSessionActionInfo({
    this.completedStatus,
    this.endedAt,
    this.processExitCode,
    this.progressMessage,
    this.progressPercent,
    this.startedAt,
    this.updatedAt,
  });

  Map<String, dynamic> toJson() {
    final completedStatus = this.completedStatus;
    final endedAt = this.endedAt;
    final processExitCode = this.processExitCode;
    final progressMessage = this.progressMessage;
    final progressPercent = this.progressPercent;
    final startedAt = this.startedAt;
    final updatedAt = this.updatedAt;
    return {
      if (completedStatus != null) 'completedStatus': completedStatus.toValue(),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (processExitCode != null) 'processExitCode': processExitCode,
      if (progressMessage != null) 'progressMessage': progressMessage,
      if (progressPercent != null) 'progressPercent': progressPercent,
      if (startedAt != null) 'startedAt': iso8601ToJson(startedAt),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
    };
  }
}

enum UpdatedWorkerStatus {
  started,
  stopping,
  stopped,
}

extension UpdatedWorkerStatusValueExtension on UpdatedWorkerStatus {
  String toValue() {
    switch (this) {
      case UpdatedWorkerStatus.started:
        return 'STARTED';
      case UpdatedWorkerStatus.stopping:
        return 'STOPPING';
      case UpdatedWorkerStatus.stopped:
        return 'STOPPED';
    }
  }
}

extension UpdatedWorkerStatusFromString on String {
  UpdatedWorkerStatus toUpdatedWorkerStatus() {
    switch (this) {
      case 'STARTED':
        return UpdatedWorkerStatus.started;
      case 'STOPPING':
        return UpdatedWorkerStatus.stopping;
      case 'STOPPED':
        return UpdatedWorkerStatus.stopped;
    }
    throw Exception('$this is not known in enum UpdatedWorkerStatus');
  }
}

enum UsageGroupByField {
  queueId,
  fleetId,
  jobId,
  userId,
  usageType,
  instanceType,
  licenseProduct,
}

extension UsageGroupByFieldValueExtension on UsageGroupByField {
  String toValue() {
    switch (this) {
      case UsageGroupByField.queueId:
        return 'QUEUE_ID';
      case UsageGroupByField.fleetId:
        return 'FLEET_ID';
      case UsageGroupByField.jobId:
        return 'JOB_ID';
      case UsageGroupByField.userId:
        return 'USER_ID';
      case UsageGroupByField.usageType:
        return 'USAGE_TYPE';
      case UsageGroupByField.instanceType:
        return 'INSTANCE_TYPE';
      case UsageGroupByField.licenseProduct:
        return 'LICENSE_PRODUCT';
    }
  }
}

extension UsageGroupByFieldFromString on String {
  UsageGroupByField toUsageGroupByField() {
    switch (this) {
      case 'QUEUE_ID':
        return UsageGroupByField.queueId;
      case 'FLEET_ID':
        return UsageGroupByField.fleetId;
      case 'JOB_ID':
        return UsageGroupByField.jobId;
      case 'USER_ID':
        return UsageGroupByField.userId;
      case 'USAGE_TYPE':
        return UsageGroupByField.usageType;
      case 'INSTANCE_TYPE':
        return UsageGroupByField.instanceType;
      case 'LICENSE_PRODUCT':
        return UsageGroupByField.licenseProduct;
    }
    throw Exception('$this is not known in enum UsageGroupByField');
  }
}

enum UsageStatistic {
  sum,
  min,
  max,
  avg,
}

extension UsageStatisticValueExtension on UsageStatistic {
  String toValue() {
    switch (this) {
      case UsageStatistic.sum:
        return 'SUM';
      case UsageStatistic.min:
        return 'MIN';
      case UsageStatistic.max:
        return 'MAX';
      case UsageStatistic.avg:
        return 'AVG';
    }
  }
}

extension UsageStatisticFromString on String {
  UsageStatistic toUsageStatistic() {
    switch (this) {
      case 'SUM':
        return UsageStatistic.sum;
      case 'MIN':
        return UsageStatistic.min;
      case 'MAX':
        return UsageStatistic.max;
      case 'AVG':
        return UsageStatistic.avg;
    }
    throw Exception('$this is not known in enum UsageStatistic');
  }
}

/// The usage details of the allotted budget.
class UsageTrackingResource {
  /// The queue ID.
  final String? queueId;

  UsageTrackingResource({
    this.queueId,
  });

  factory UsageTrackingResource.fromJson(Map<String, dynamic> json) {
    return UsageTrackingResource(
      queueId: json['queueId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final queueId = this.queueId;
    return {
      if (queueId != null) 'queueId': queueId,
    };
  }
}

enum UsageType {
  compute,
  license,
}

extension UsageTypeValueExtension on UsageType {
  String toValue() {
    switch (this) {
      case UsageType.compute:
        return 'COMPUTE';
      case UsageType.license:
        return 'LICENSE';
    }
  }
}

extension UsageTypeFromString on String {
  UsageType toUsageType() {
    switch (this) {
      case 'COMPUTE':
        return UsageType.compute;
      case 'LICENSE':
        return UsageType.license;
    }
    throw Exception('$this is not known in enum UsageType');
  }
}

/// Allows setting a specific user's job to run first.
class UserJobsFirst {
  /// The user's ID.
  final String userIdentityId;

  UserJobsFirst({
    required this.userIdentityId,
  });

  Map<String, dynamic> toJson() {
    final userIdentityId = this.userIdentityId;
    return {
      'userIdentityId': userIdentityId,
    };
  }
}

/// The allowable range of vCPU processing power for the fleet.
class VCpuCountRange {
  /// The minimum amount of vCPU.
  final int min;

  /// The maximum amount of vCPU.
  final int? max;

  VCpuCountRange({
    required this.min,
    this.max,
  });

  factory VCpuCountRange.fromJson(Map<String, dynamic> json) {
    return VCpuCountRange(
      min: json['min'] as int,
      max: json['max'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final min = this.min;
    final max = this.max;
    return {
      'min': min,
      if (max != null) 'max': max,
    };
  }
}

/// The Windows user details.
class WindowsUser {
  /// The password ARN for the Windows user.
  final String passwordArn;

  /// The user.
  final String user;

  WindowsUser({
    required this.passwordArn,
    required this.user,
  });

  factory WindowsUser.fromJson(Map<String, dynamic> json) {
    return WindowsUser(
      passwordArn: json['passwordArn'] as String,
      user: json['user'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final passwordArn = this.passwordArn;
    final user = this.user;
    return {
      'passwordArn': passwordArn,
      'user': user,
    };
  }
}

/// The details of the worker amount capability.
class WorkerAmountCapability {
  /// The name of the worker amount capability.
  final String name;

  /// The value of the worker amount capability.
  final double value;

  WorkerAmountCapability({
    required this.name,
    required this.value,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final value = this.value;
    return {
      'name': name,
      'value': value,
    };
  }
}

/// The details of the worker attribute capability.
class WorkerAttributeCapability {
  /// The name of the worker attribute capability.
  final String name;

  /// The values of the worker amount capability.
  final List<String> values;

  WorkerAttributeCapability({
    required this.name,
    required this.values,
  });

  Map<String, dynamic> toJson() {
    final name = this.name;
    final values = this.values;
    return {
      'name': name,
      'values': values,
    };
  }
}

/// The details for worker capabilities.
class WorkerCapabilities {
  /// The worker capabilities amounts on a list of worker capabilities.
  final List<WorkerAmountCapability> amounts;

  /// The worker attribute capabilities in the list of attribute capabilities.
  final List<WorkerAttributeCapability> attributes;

  WorkerCapabilities({
    required this.amounts,
    required this.attributes,
  });

  Map<String, dynamic> toJson() {
    final amounts = this.amounts;
    final attributes = this.attributes;
    return {
      'amounts': amounts,
      'attributes': attributes,
    };
  }
}

/// The details of a worker search.
class WorkerSearchSummary {
  /// The date and time the resource was created.
  final DateTime? createdAt;

  /// The user or system that created this resource.
  final String? createdBy;

  /// The fleet ID.
  final String? fleetId;

  /// Provides the Amazon EC2 instance properties of the worker host.
  final HostPropertiesResponse? hostProperties;

  /// The status of the worker search.
  final WorkerStatus? status;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  /// The worker ID.
  final String? workerId;

  WorkerSearchSummary({
    this.createdAt,
    this.createdBy,
    this.fleetId,
    this.hostProperties,
    this.status,
    this.updatedAt,
    this.updatedBy,
    this.workerId,
  });

  factory WorkerSearchSummary.fromJson(Map<String, dynamic> json) {
    return WorkerSearchSummary(
      createdAt: timeStampFromJson(json['createdAt']),
      createdBy: json['createdBy'] as String?,
      fleetId: json['fleetId'] as String?,
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toWorkerStatus(),
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
      workerId: json['workerId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final fleetId = this.fleetId;
    final hostProperties = this.hostProperties;
    final status = this.status;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    final workerId = this.workerId;
    return {
      if (createdAt != null) 'createdAt': iso8601ToJson(createdAt),
      if (createdBy != null) 'createdBy': createdBy,
      if (fleetId != null) 'fleetId': fleetId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (status != null) 'status': status.toValue(),
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
      if (workerId != null) 'workerId': workerId,
    };
  }
}

/// Summarizes the session for a particular worker.
class WorkerSessionSummary {
  /// The job ID for the job associated with the worker's session.
  final String jobId;

  /// The life cycle status for the worker's session.
  final SessionLifecycleStatus lifecycleStatus;

  /// The queue ID for the queue associated to the worker.
  final String queueId;

  /// The session ID for the session action.
  final String sessionId;

  /// The date and time the resource started running.
  final DateTime startedAt;

  /// The date and time the resource ended running.
  final DateTime? endedAt;

  /// The life cycle status
  final SessionLifecycleTargetStatus? targetLifecycleStatus;

  WorkerSessionSummary({
    required this.jobId,
    required this.lifecycleStatus,
    required this.queueId,
    required this.sessionId,
    required this.startedAt,
    this.endedAt,
    this.targetLifecycleStatus,
  });

  factory WorkerSessionSummary.fromJson(Map<String, dynamic> json) {
    return WorkerSessionSummary(
      jobId: json['jobId'] as String,
      lifecycleStatus:
          (json['lifecycleStatus'] as String).toSessionLifecycleStatus(),
      queueId: json['queueId'] as String,
      sessionId: json['sessionId'] as String,
      startedAt: nonNullableTimeStampFromJson(json['startedAt'] as Object),
      endedAt: timeStampFromJson(json['endedAt']),
      targetLifecycleStatus: (json['targetLifecycleStatus'] as String?)
          ?.toSessionLifecycleTargetStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobId = this.jobId;
    final lifecycleStatus = this.lifecycleStatus;
    final queueId = this.queueId;
    final sessionId = this.sessionId;
    final startedAt = this.startedAt;
    final endedAt = this.endedAt;
    final targetLifecycleStatus = this.targetLifecycleStatus;
    return {
      'jobId': jobId,
      'lifecycleStatus': lifecycleStatus.toValue(),
      'queueId': queueId,
      'sessionId': sessionId,
      'startedAt': iso8601ToJson(startedAt),
      if (endedAt != null) 'endedAt': iso8601ToJson(endedAt),
      if (targetLifecycleStatus != null)
        'targetLifecycleStatus': targetLifecycleStatus.toValue(),
    };
  }
}

enum WorkerStatus {
  created,
  started,
  stopping,
  stopped,
  notResponding,
  notCompatible,
  running,
  idle,
}

extension WorkerStatusValueExtension on WorkerStatus {
  String toValue() {
    switch (this) {
      case WorkerStatus.created:
        return 'CREATED';
      case WorkerStatus.started:
        return 'STARTED';
      case WorkerStatus.stopping:
        return 'STOPPING';
      case WorkerStatus.stopped:
        return 'STOPPED';
      case WorkerStatus.notResponding:
        return 'NOT_RESPONDING';
      case WorkerStatus.notCompatible:
        return 'NOT_COMPATIBLE';
      case WorkerStatus.running:
        return 'RUNNING';
      case WorkerStatus.idle:
        return 'IDLE';
    }
  }
}

extension WorkerStatusFromString on String {
  WorkerStatus toWorkerStatus() {
    switch (this) {
      case 'CREATED':
        return WorkerStatus.created;
      case 'STARTED':
        return WorkerStatus.started;
      case 'STOPPING':
        return WorkerStatus.stopping;
      case 'STOPPED':
        return WorkerStatus.stopped;
      case 'NOT_RESPONDING':
        return WorkerStatus.notResponding;
      case 'NOT_COMPATIBLE':
        return WorkerStatus.notCompatible;
      case 'RUNNING':
        return WorkerStatus.running;
      case 'IDLE':
        return WorkerStatus.idle;
    }
    throw Exception('$this is not known in enum WorkerStatus');
  }
}

/// The summary of details for a worker.
class WorkerSummary {
  /// The date and time the resource was created.
  final DateTime createdAt;

  /// The user or system that created this resource.
  final String createdBy;

  /// The farm ID.
  final String farmId;

  /// The fleet ID.
  final String fleetId;

  /// The status of the worker.
  final WorkerStatus status;

  /// The worker ID.
  final String workerId;

  /// The host properties of the worker.
  final HostPropertiesResponse? hostProperties;

  /// The log configuration for the worker.
  final LogConfiguration? log;

  /// The date and time the resource was updated.
  final DateTime? updatedAt;

  /// The user or system that updated this resource.
  final String? updatedBy;

  WorkerSummary({
    required this.createdAt,
    required this.createdBy,
    required this.farmId,
    required this.fleetId,
    required this.status,
    required this.workerId,
    this.hostProperties,
    this.log,
    this.updatedAt,
    this.updatedBy,
  });

  factory WorkerSummary.fromJson(Map<String, dynamic> json) {
    return WorkerSummary(
      createdAt: nonNullableTimeStampFromJson(json['createdAt'] as Object),
      createdBy: json['createdBy'] as String,
      farmId: json['farmId'] as String,
      fleetId: json['fleetId'] as String,
      status: (json['status'] as String).toWorkerStatus(),
      workerId: json['workerId'] as String,
      hostProperties: json['hostProperties'] != null
          ? HostPropertiesResponse.fromJson(
              json['hostProperties'] as Map<String, dynamic>)
          : null,
      log: json['log'] != null
          ? LogConfiguration.fromJson(json['log'] as Map<String, dynamic>)
          : null,
      updatedAt: timeStampFromJson(json['updatedAt']),
      updatedBy: json['updatedBy'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdAt = this.createdAt;
    final createdBy = this.createdBy;
    final farmId = this.farmId;
    final fleetId = this.fleetId;
    final status = this.status;
    final workerId = this.workerId;
    final hostProperties = this.hostProperties;
    final log = this.log;
    final updatedAt = this.updatedAt;
    final updatedBy = this.updatedBy;
    return {
      'createdAt': iso8601ToJson(createdAt),
      'createdBy': createdBy,
      'farmId': farmId,
      'fleetId': fleetId,
      'status': status.toValue(),
      'workerId': workerId,
      if (hostProperties != null) 'hostProperties': hostProperties,
      if (log != null) 'log': log,
      if (updatedAt != null) 'updatedAt': iso8601ToJson(updatedAt),
      if (updatedBy != null) 'updatedBy': updatedBy,
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

class InternalServerErrorException extends _s.GenericAwsException {
  InternalServerErrorException({String? type, String? message})
      : super(
            type: type, code: 'InternalServerErrorException', message: message);
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
  'InternalServerErrorException': (type, message) =>
      InternalServerErrorException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
