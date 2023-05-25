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

/// AWS Elastic Disaster Recovery Service.
class Drs {
  final _s.RestJsonProtocol _protocol;
  Drs({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'drs',
            signingName: 'drs',
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

  /// Create an extended source server in the target Account based on the source
  /// server in staging account.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerArn] :
  /// This defines the ARN of the source server in staging Account based on
  /// which you want to create an extended source server.
  ///
  /// Parameter [tags] :
  /// A list of tags associated with the extended source server.
  Future<CreateExtendedSourceServerResponse> createExtendedSourceServer({
    required String sourceServerArn,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerArn': sourceServerArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateExtendedSourceServer',
      exceptionFnMap: _exceptionFns,
    );
    return CreateExtendedSourceServerResponse.fromJson(response);
  }

  /// Creates a new Launch Configuration Template.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [copyPrivateIp] :
  /// Copy private IP.
  ///
  /// Parameter [copyTags] :
  /// Copy tags.
  ///
  /// Parameter [launchDisposition] :
  /// Launch disposition.
  ///
  /// Parameter [licensing] :
  /// Licensing.
  ///
  /// Parameter [tags] :
  /// Request to associate tags during creation of a Launch Configuration
  /// Template.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Target instance type right-sizing method.
  Future<CreateLaunchConfigurationTemplateResponse>
      createLaunchConfigurationTemplate({
    bool? copyPrivateIp,
    bool? copyTags,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    Map<String, String>? tags,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    final $payload = <String, dynamic>{
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (tags != null) 'tags': tags,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return CreateLaunchConfigurationTemplateResponse.fromJson(response);
  }

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [InternalServerException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Whether to associate the default Elastic Disaster Recovery Security group
  /// with the Replication Configuration Template.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Source Server in Mbps.
  ///
  /// Parameter [createPublicIP] :
  /// Whether to create a Public IP for the Recovery Instance by default.
  ///
  /// Parameter [dataPlaneRouting] :
  /// The data plane routing mechanism that will be used for replication.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// The Staging Disk EBS volume type to be used during replication.
  ///
  /// Parameter [ebsEncryption] :
  /// The type of EBS encryption to be used during replication.
  ///
  /// Parameter [pitPolicy] :
  /// The Point in time (PIT) policy to manage snapshots taken during
  /// replication.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// The instance type to be used for the replication server.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// The security group IDs that will be used by the replication server.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// The subnet to be used by the replication staging area.
  ///
  /// Parameter [stagingAreaTags] :
  /// A set of tags to be associated with all resources created in the
  /// replication staging area: EC2 replication server, EBS volumes, EBS
  /// snapshots, etc.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Whether to use a dedicated Replication Server in the replication staging
  /// area.
  ///
  /// Parameter [autoReplicateNewDisks] :
  /// Whether to allow the AWS replication agent to automatically replicate
  /// newly added disks.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// The ARN of the EBS encryption key to be used during replication.
  ///
  /// Parameter [tags] :
  /// A set of tags to be associated with the Replication Configuration Template
  /// resource.
  Future<ReplicationConfigurationTemplate>
      createReplicationConfigurationTemplate({
    required bool associateDefaultSecurityGroup,
    required int bandwidthThrottling,
    required bool createPublicIP,
    required ReplicationConfigurationDataPlaneRouting dataPlaneRouting,
    required ReplicationConfigurationDefaultLargeStagingDiskType
        defaultLargeStagingDiskType,
    required ReplicationConfigurationEbsEncryption ebsEncryption,
    required List<PITPolicyRule> pitPolicy,
    required String replicationServerInstanceType,
    required List<String> replicationServersSecurityGroupsIDs,
    required String stagingAreaSubnetId,
    required Map<String, String> stagingAreaTags,
    required bool useDedicatedReplicationServer,
    bool? autoReplicateNewDisks,
    String? ebsEncryptionKeyArn,
    Map<String, String>? tags,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      1152921504606846976,
      isRequired: true,
    );
    final $payload = <String, dynamic>{
      'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      'bandwidthThrottling': bandwidthThrottling,
      'createPublicIP': createPublicIP,
      'dataPlaneRouting': dataPlaneRouting.toValue(),
      'defaultLargeStagingDiskType': defaultLargeStagingDiskType.toValue(),
      'ebsEncryption': ebsEncryption.toValue(),
      'pitPolicy': pitPolicy,
      'replicationServerInstanceType': replicationServerInstanceType,
      'replicationServersSecurityGroupsIDs':
          replicationServersSecurityGroupsIDs,
      'stagingAreaSubnetId': stagingAreaSubnetId,
      'stagingAreaTags': stagingAreaTags,
      'useDedicatedReplicationServer': useDedicatedReplicationServer,
      if (autoReplicateNewDisks != null)
        'autoReplicateNewDisks': autoReplicateNewDisks,
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfigurationTemplate.fromJson(response);
  }

  /// Deletes a single Job by ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [jobID] :
  /// The ID of the Job to be deleted.
  Future<void> deleteJob({
    required String jobID,
  }) async {
    final $payload = <String, dynamic>{
      'jobID': jobID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteJob',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a single Launch Configuration Template by ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// The ID of the Launch Configuration Template to be deleted.
  Future<void> deleteLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
  }) async {
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a single Recovery Instance by ID. This deletes the Recovery
  /// Instance resource from Elastic Disaster Recovery. The Recovery Instance
  /// must be disconnected first in order to delete it.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceID] :
  /// The ID of the Recovery Instance to be deleted.
  Future<void> deleteRecoveryInstance({
    required String recoveryInstanceID,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceID': recoveryInstanceID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteRecoveryInstance',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a single Replication Configuration Template by ID
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [replicationConfigurationTemplateID] :
  /// The ID of the Replication Configuration Template to be deleted.
  Future<void> deleteReplicationConfigurationTemplate({
    required String replicationConfigurationTemplateID,
  }) async {
    final $payload = <String, dynamic>{
      'replicationConfigurationTemplateID': replicationConfigurationTemplateID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a single Source Server by ID. The Source Server must be
  /// disconnected first.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server to be deleted.
  Future<void> deleteSourceServer({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteSourceServer',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves a detailed Job log with pagination.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [jobID] :
  /// The ID of the Job for which Job log items will be retrieved.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Job log items to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Job log items to retrieve.
  Future<DescribeJobLogItemsResponse> describeJobLogItems({
    required String jobID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'jobID': jobID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeJobLogItems',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobLogItemsResponse.fromJson(response);
  }

  /// Returns a list of Jobs. Use the JobsID and fromDate and toDate filters to
  /// limit which jobs are returned. The response is sorted by creationDataTime
  /// - latest date first. Jobs are created by the StartRecovery,
  /// TerminateRecoveryInstances and StartFailbackLaunch APIs. Jobs are also
  /// created by DiagnosticLaunch and TerminateDiagnosticInstances, which are
  /// APIs available only to *Support* and only used in response to relevant
  /// support tickets.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [filters] :
  /// A set of filters by which to return Jobs.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Jobs to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Job to retrieve.
  Future<DescribeJobsResponse> describeJobs({
    DescribeJobsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeJobs',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeJobsResponse.fromJson(response);
  }

  /// Lists all Launch Configuration Templates, filtered by Launch Configuration
  /// Template IDs
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [launchConfigurationTemplateIDs] :
  /// Request to filter Launch Configuration Templates list by Launch
  /// Configuration Template ID.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to be returned in DescribeLaunchConfigurationTemplates.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Launch Configuration Template to retrieve.
  Future<DescribeLaunchConfigurationTemplatesResponse>
      describeLaunchConfigurationTemplates({
    List<String>? launchConfigurationTemplateIDs,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1000,
    );
    final $payload = <String, dynamic>{
      if (launchConfigurationTemplateIDs != null)
        'launchConfigurationTemplateIDs': launchConfigurationTemplateIDs,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeLaunchConfigurationTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeLaunchConfigurationTemplatesResponse.fromJson(response);
  }

  /// Lists all Recovery Instances or multiple Recovery Instances by ID.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [filters] :
  /// A set of filters by which to return Recovery Instances.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Recovery Instances to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Recovery Instance to retrieve.
  Future<DescribeRecoveryInstancesResponse> describeRecoveryInstances({
    DescribeRecoveryInstancesRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeRecoveryInstances',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecoveryInstancesResponse.fromJson(response);
  }

  /// Lists all Recovery Snapshots for a single Source Server.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// Filter Recovery Snapshots by Source Server ID.
  ///
  /// Parameter [filters] :
  /// A set of filters by which to return Recovery Snapshots.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Recovery Snapshots to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Recovery Snapshot to retrieve.
  ///
  /// Parameter [order] :
  /// The sorted ordering by which to return Recovery Snapshots.
  Future<DescribeRecoverySnapshotsResponse> describeRecoverySnapshots({
    required String sourceServerID,
    DescribeRecoverySnapshotsRequestFilters? filters,
    int? maxResults,
    String? nextToken,
    RecoverySnapshotsOrder? order,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (order != null) 'order': order.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeRecoverySnapshots',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeRecoverySnapshotsResponse.fromJson(response);
  }

  /// Lists all ReplicationConfigurationTemplates, filtered by Source Server
  /// IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Replication Configuration Templates to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Replication Configuration Template to retrieve.
  ///
  /// Parameter [replicationConfigurationTemplateIDs] :
  /// The IDs of the Replication Configuration Templates to retrieve. An empty
  /// list means all Replication Configuration Templates.
  Future<DescribeReplicationConfigurationTemplatesResponse>
      describeReplicationConfigurationTemplates({
    int? maxResults,
    String? nextToken,
    List<String>? replicationConfigurationTemplateIDs,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
      if (replicationConfigurationTemplateIDs != null)
        'replicationConfigurationTemplateIDs':
            replicationConfigurationTemplateIDs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeReplicationConfigurationTemplates',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeReplicationConfigurationTemplatesResponse.fromJson(response);
  }

  /// Lists all Source Servers or multiple Source Servers filtered by ID.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [filters] :
  /// A set of filters by which to return Source Servers.
  ///
  /// Parameter [maxResults] :
  /// Maximum number of Source Servers to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next Source Server to retrieve.
  Future<DescribeSourceServersResponse> describeSourceServers({
    DescribeSourceServersRequestFilters? filters,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DescribeSourceServers',
      exceptionFnMap: _exceptionFns,
    );
    return DescribeSourceServersResponse.fromJson(response);
  }

  /// Disconnect a Recovery Instance from Elastic Disaster Recovery. Data
  /// replication is stopped immediately. All AWS resources created by Elastic
  /// Disaster Recovery for enabling the replication of the Recovery Instance
  /// will be terminated / deleted within 90 minutes. If the agent on the
  /// Recovery Instance has not been prevented from communicating with the
  /// Elastic Disaster Recovery service, then it will receive a command to
  /// uninstall itself (within approximately 10 minutes). The following
  /// properties of the Recovery Instance will be changed immediately:
  /// dataReplicationInfo.dataReplicationState will be set to DISCONNECTED; The
  /// totalStorageBytes property for each of dataReplicationInfo.replicatedDisks
  /// will be set to zero; dataReplicationInfo.lagDuration and
  /// dataReplicationInfo.lagDuration will be nullified.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceID] :
  /// The ID of the Recovery Instance to disconnect.
  Future<void> disconnectRecoveryInstance({
    required String recoveryInstanceID,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceID': recoveryInstanceID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisconnectRecoveryInstance',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disconnects a specific Source Server from Elastic Disaster Recovery. Data
  /// replication is stopped immediately. All AWS resources created by Elastic
  /// Disaster Recovery for enabling the replication of the Source Server will
  /// be terminated / deleted within 90 minutes. You cannot disconnect a Source
  /// Server if it has a Recovery Instance. If the agent on the Source Server
  /// has not been prevented from communicating with the Elastic Disaster
  /// Recovery service, then it will receive a command to uninstall itself
  /// (within approximately 10 minutes). The following properties of the
  /// SourceServer will be changed immediately:
  /// dataReplicationInfo.dataReplicationState will be set to DISCONNECTED; The
  /// totalStorageBytes property for each of dataReplicationInfo.replicatedDisks
  /// will be set to zero; dataReplicationInfo.lagDuration and
  /// dataReplicationInfo.lagDuration will be nullified.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server to disconnect.
  Future<SourceServer> disconnectSourceServer({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisconnectSourceServer',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Lists all Failback ReplicationConfigurations, filtered by Recovery
  /// Instance ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceID] :
  /// The ID of the Recovery Instance whose failback replication configuration
  /// should be returned.
  Future<GetFailbackReplicationConfigurationResponse>
      getFailbackReplicationConfiguration({
    required String recoveryInstanceID,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceID': recoveryInstanceID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetFailbackReplicationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return GetFailbackReplicationConfigurationResponse.fromJson(response);
  }

  /// Gets a LaunchConfiguration, filtered by Source Server IDs.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server that we want to retrieve a Launch
  /// Configuration for.
  Future<LaunchConfiguration> getLaunchConfiguration({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetLaunchConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfiguration.fromJson(response);
  }

  /// Gets a ReplicationConfiguration, filtered by Source Server ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Serve for this Replication Configuration.r
  Future<ReplicationConfiguration> getReplicationConfiguration({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/GetReplicationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfiguration.fromJson(response);
  }

  /// Initialize Elastic Disaster Recovery.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  Future<void> initializeService() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/InitializeService',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Returns a list of source servers on a staging account that are extensible,
  /// which means that: a. The source server is not already extended into this
  /// Account. b. The source server on the Account we’re reading from is not an
  /// extension of another source server.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [stagingAccountID] :
  /// The Id of the staging Account to retrieve extensible source servers from.
  ///
  /// Parameter [maxResults] :
  /// The maximum number of extensible source servers to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next extensible source server to retrieve.
  Future<ListExtensibleSourceServersResponse> listExtensibleSourceServers({
    required String stagingAccountID,
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      300,
    );
    final $payload = <String, dynamic>{
      'stagingAccountID': stagingAccountID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListExtensibleSourceServers',
      exceptionFnMap: _exceptionFns,
    );
    return ListExtensibleSourceServersResponse.fromJson(response);
  }

  /// Returns an array of staging accounts for existing extended source servers.
  ///
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [maxResults] :
  /// The maximum number of staging Accounts to retrieve.
  ///
  /// Parameter [nextToken] :
  /// The token of the next staging Account to retrieve.
  Future<ListStagingAccountsResponse> listStagingAccounts({
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
      requestUri: '/ListStagingAccounts',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return ListStagingAccountsResponse.fromJson(response);
  }

  /// List all tags for your Elastic Disaster Recovery resources.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// The ARN of the resource whose tags should be returned.
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

  /// WARNING: RetryDataReplication is deprecated. Causes the data replication
  /// initiation sequence to begin immediately upon next Handshake for the
  /// specified Source Server ID, regardless of when the previous initiation
  /// started. This command will work only if the Source Server is stalled or is
  /// in a DISCONNECTED or STOPPED state.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server whose data replication should be retried.
  @Deprecated('WARNING: RetryDataReplication is deprecated')
  Future<SourceServer> retryDataReplication({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RetryDataReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Start replication to origin / target region - applies only to protected
  /// instances that originated in EC2. For recovery instances on target region
  /// - starts replication back to origin region. For failback instances on
  /// origin region - starts replication to target region to re-protect them.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceID] :
  /// The ID of the Recovery Instance that we want to reverse the replication
  /// for.
  Future<ReverseReplicationResponse> reverseReplication({
    required String recoveryInstanceID,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceID': recoveryInstanceID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ReverseReplication',
      exceptionFnMap: _exceptionFns,
    );
    return ReverseReplicationResponse.fromJson(response);
  }

  /// Initiates a Job for launching the machine that is being failed back to
  /// from the specified Recovery Instance. This will run conversion on the
  /// failback client and will reboot your machine, thus completing the failback
  /// process.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceIDs] :
  /// The IDs of the Recovery Instance whose failback launch we want to request.
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the failback launch Job.
  Future<StartFailbackLaunchResponse> startFailbackLaunch({
    required List<String> recoveryInstanceIDs,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceIDs': recoveryInstanceIDs,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartFailbackLaunch',
      exceptionFnMap: _exceptionFns,
    );
    return StartFailbackLaunchResponse.fromJson(response);
  }

  /// Launches Recovery Instances for the specified Source Servers. For each
  /// Source Server you may choose a point in time snapshot to launch from, or
  /// use an on demand snapshot.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServers] :
  /// The Source Servers that we want to start a Recovery Job for.
  ///
  /// Parameter [isDrill] :
  /// Whether this Source Server Recovery operation is a drill or not.
  ///
  /// Parameter [tags] :
  /// The tags to be associated with the Recovery Job.
  Future<StartRecoveryResponse> startRecovery({
    required List<StartRecoveryRequestSourceServer> sourceServers,
    bool? isDrill,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServers': sourceServers,
      if (isDrill != null) 'isDrill': isDrill,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartRecovery',
      exceptionFnMap: _exceptionFns,
    );
    return StartRecoveryResponse.fromJson(response);
  }

  /// Starts replication for a stopped Source Server. This action would make the
  /// Source Server protected again and restart billing for it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server to start replication for.
  Future<StartReplicationResponse> startReplication({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartReplication',
      exceptionFnMap: _exceptionFns,
    );
    return StartReplicationResponse.fromJson(response);
  }

  /// Stops the failback process for a specified Recovery Instance. This changes
  /// the Failback State of the Recovery Instance back to FAILBACK_NOT_STARTED.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceID] :
  /// The ID of the Recovery Instance we want to stop failback for.
  Future<void> stopFailback({
    required String recoveryInstanceID,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceID': recoveryInstanceID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopFailback',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Stops replication for a Source Server. This action would make the Source
  /// Server unprotected, delete its existing snapshots and stop billing for it.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server to stop replication for.
  Future<StopReplicationResponse> stopReplication({
    required String sourceServerID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopReplication',
      exceptionFnMap: _exceptionFns,
    );
    return StopReplicationResponse.fromJson(response);
  }

  /// Adds or overwrites only the specified tags for the specified Elastic
  /// Disaster Recovery resource or resources. When you specify an existing tag
  /// key, the value is overwritten with the new value. Each resource can have a
  /// maximum of 50 tags. Each tag consists of a key and optional value.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be added or updated.
  ///
  /// Parameter [tags] :
  /// Array of tags to be added or updated.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    final $payload = <String, dynamic>{
      'tags': tags,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Initiates a Job for terminating the EC2 resources associated with the
  /// specified Recovery Instances, and then will delete the Recovery Instances
  /// from the Elastic Disaster Recovery service.
  ///
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ThrottlingException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceIDs] :
  /// The IDs of the Recovery Instances that should be terminated.
  Future<TerminateRecoveryInstancesResponse> terminateRecoveryInstances({
    required List<String> recoveryInstanceIDs,
  }) async {
    final $payload = <String, dynamic>{
      'recoveryInstanceIDs': recoveryInstanceIDs,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TerminateRecoveryInstances',
      exceptionFnMap: _exceptionFns,
    );
    return TerminateRecoveryInstancesResponse.fromJson(response);
  }

  /// Deletes the specified set of tags from the specified set of Elastic
  /// Disaster Recovery resources.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  ///
  /// Parameter [resourceArn] :
  /// ARN of the resource for which tags are to be removed.
  ///
  /// Parameter [tagKeys] :
  /// Array of tags to be removed.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    final $query = <String, List<String>>{
      'tagKeys': tagKeys,
    };
    await _protocol.send(
      payload: null,
      method: 'DELETE',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Allows you to update the failback replication configuration of a Recovery
  /// Instance by ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [recoveryInstanceID] :
  /// The ID of the Recovery Instance.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Recovery Instance in Mbps.
  ///
  /// Parameter [name] :
  /// The name of the Failback Replication Configuration.
  ///
  /// Parameter [usePrivateIP] :
  /// Whether to use Private IP for the failback replication of the Recovery
  /// Instance.
  Future<void> updateFailbackReplicationConfiguration({
    required String recoveryInstanceID,
    int? bandwidthThrottling,
    String? name,
    bool? usePrivateIP,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'recoveryInstanceID': recoveryInstanceID,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (name != null) 'name': name,
      if (usePrivateIP != null) 'usePrivateIP': usePrivateIP,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateFailbackReplicationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Updates a LaunchConfiguration by Source Server ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server that we want to retrieve a Launch
  /// Configuration for.
  ///
  /// Parameter [copyPrivateIp] :
  /// Whether we should copy the Private IP of the Source Server to the Recovery
  /// Instance.
  ///
  /// Parameter [copyTags] :
  /// Whether we want to copy the tags of the Source Server to the EC2 machine
  /// of the Recovery Instance.
  ///
  /// Parameter [launchDisposition] :
  /// The state of the Recovery Instance in EC2 after the recovery operation.
  ///
  /// Parameter [licensing] :
  /// The licensing configuration to be used for this launch configuration.
  ///
  /// Parameter [name] :
  /// The name of the launch configuration.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Whether Elastic Disaster Recovery should try to automatically choose the
  /// instance type that best matches the OS, CPU, and RAM of your Source
  /// Server.
  Future<LaunchConfiguration> updateLaunchConfiguration({
    required String sourceServerID,
    bool? copyPrivateIp,
    bool? copyTags,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? name,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (name != null) 'name': name,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLaunchConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfiguration.fromJson(response);
  }

  /// Updates an existing Launch Configuration Template by ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch Configuration Template ID.
  ///
  /// Parameter [copyPrivateIp] :
  /// Copy private IP.
  ///
  /// Parameter [copyTags] :
  /// Copy tags.
  ///
  /// Parameter [launchDisposition] :
  /// Launch disposition.
  ///
  /// Parameter [licensing] :
  /// Licensing.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Target instance type right-sizing method.
  Future<UpdateLaunchConfigurationTemplateResponse>
      updateLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
    bool? copyPrivateIp,
    bool? copyTags,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.toValue(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return UpdateLaunchConfigurationTemplateResponse.fromJson(response);
  }

  /// Allows you to update a ReplicationConfiguration by Source Server ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ConflictException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [sourceServerID] :
  /// The ID of the Source Server for this Replication Configuration.
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Whether to associate the default Elastic Disaster Recovery Security group
  /// with the Replication Configuration.
  ///
  /// Parameter [autoReplicateNewDisks] :
  /// Whether to allow the AWS replication agent to automatically replicate
  /// newly added disks.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Source Server in Mbps.
  ///
  /// Parameter [createPublicIP] :
  /// Whether to create a Public IP for the Recovery Instance by default.
  ///
  /// Parameter [dataPlaneRouting] :
  /// The data plane routing mechanism that will be used for replication.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// The Staging Disk EBS volume type to be used during replication.
  ///
  /// Parameter [ebsEncryption] :
  /// The type of EBS encryption to be used during replication.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// The ARN of the EBS encryption key to be used during replication.
  ///
  /// Parameter [name] :
  /// The name of the Replication Configuration.
  ///
  /// Parameter [pitPolicy] :
  /// The Point in time (PIT) policy to manage snapshots taken during
  /// replication.
  ///
  /// Parameter [replicatedDisks] :
  /// The configuration of the disks of the Source Server to be replicated.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// The instance type to be used for the replication server.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// The security group IDs that will be used by the replication server.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// The subnet to be used by the replication staging area.
  ///
  /// Parameter [stagingAreaTags] :
  /// A set of tags to be associated with all resources created in the
  /// replication staging area: EC2 replication server, EBS volumes, EBS
  /// snapshots, etc.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Whether to use a dedicated Replication Server in the replication staging
  /// area.
  Future<ReplicationConfiguration> updateReplicationConfiguration({
    required String sourceServerID,
    bool? associateDefaultSecurityGroup,
    bool? autoReplicateNewDisks,
    int? bandwidthThrottling,
    bool? createPublicIP,
    ReplicationConfigurationDataPlaneRouting? dataPlaneRouting,
    ReplicationConfigurationDefaultLargeStagingDiskType?
        defaultLargeStagingDiskType,
    ReplicationConfigurationEbsEncryption? ebsEncryption,
    String? ebsEncryptionKeyArn,
    String? name,
    List<PITPolicyRule>? pitPolicy,
    List<ReplicationConfigurationReplicatedDisk>? replicatedDisks,
    String? replicationServerInstanceType,
    List<String>? replicationServersSecurityGroupsIDs,
    String? stagingAreaSubnetId,
    Map<String, String>? stagingAreaTags,
    bool? useDedicatedReplicationServer,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (autoReplicateNewDisks != null)
        'autoReplicateNewDisks': autoReplicateNewDisks,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null)
        'dataPlaneRouting': dataPlaneRouting.toValue(),
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.toValue(),
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.toValue(),
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (name != null) 'name': name,
      if (pitPolicy != null) 'pitPolicy': pitPolicy,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateReplicationConfiguration',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfiguration.fromJson(response);
  }

  /// Updates a ReplicationConfigurationTemplate by ID.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [InternalServerException].
  /// May throw [ThrottlingException].
  /// May throw [AccessDeniedException].
  /// May throw [ValidationException].
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [replicationConfigurationTemplateID] :
  /// The Replication Configuration Template ID.
  ///
  /// Parameter [arn] :
  /// The Replication Configuration Template ARN.
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Whether to associate the default Elastic Disaster Recovery Security group
  /// with the Replication Configuration Template.
  ///
  /// Parameter [autoReplicateNewDisks] :
  /// Whether to allow the AWS replication agent to automatically replicate
  /// newly added disks.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Source Server in Mbps.
  ///
  /// Parameter [createPublicIP] :
  /// Whether to create a Public IP for the Recovery Instance by default.
  ///
  /// Parameter [dataPlaneRouting] :
  /// The data plane routing mechanism that will be used for replication.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// The Staging Disk EBS volume type to be used during replication.
  ///
  /// Parameter [ebsEncryption] :
  /// The type of EBS encryption to be used during replication.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// The ARN of the EBS encryption key to be used during replication.
  ///
  /// Parameter [pitPolicy] :
  /// The Point in time (PIT) policy to manage snapshots taken during
  /// replication.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// The instance type to be used for the replication server.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// The security group IDs that will be used by the replication server.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// The subnet to be used by the replication staging area.
  ///
  /// Parameter [stagingAreaTags] :
  /// A set of tags to be associated with all resources created in the
  /// replication staging area: EC2 replication server, EBS volumes, EBS
  /// snapshots, etc.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Whether to use a dedicated Replication Server in the replication staging
  /// area.
  Future<ReplicationConfigurationTemplate>
      updateReplicationConfigurationTemplate({
    required String replicationConfigurationTemplateID,
    String? arn,
    bool? associateDefaultSecurityGroup,
    bool? autoReplicateNewDisks,
    int? bandwidthThrottling,
    bool? createPublicIP,
    ReplicationConfigurationDataPlaneRouting? dataPlaneRouting,
    ReplicationConfigurationDefaultLargeStagingDiskType?
        defaultLargeStagingDiskType,
    ReplicationConfigurationEbsEncryption? ebsEncryption,
    String? ebsEncryptionKeyArn,
    List<PITPolicyRule>? pitPolicy,
    String? replicationServerInstanceType,
    List<String>? replicationServersSecurityGroupsIDs,
    String? stagingAreaSubnetId,
    Map<String, String>? stagingAreaTags,
    bool? useDedicatedReplicationServer,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'replicationConfigurationTemplateID': replicationConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (autoReplicateNewDisks != null)
        'autoReplicateNewDisks': autoReplicateNewDisks,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null)
        'dataPlaneRouting': dataPlaneRouting.toValue(),
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.toValue(),
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.toValue(),
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (pitPolicy != null) 'pitPolicy': pitPolicy,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfigurationTemplate.fromJson(response);
  }
}

/// AWS account.
class Account {
  /// Account ID of AWS account.
  final String? accountID;

  Account({
    this.accountID,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      accountID: json['accountID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountID = this.accountID;
    return {
      if (accountID != null) 'accountID': accountID,
    };
  }
}

/// Information about a server's CPU.
class CPU {
  /// The number of CPU cores.
  final int? cores;

  /// The model name of the CPU.
  final String? modelName;

  CPU({
    this.cores,
    this.modelName,
  });

  factory CPU.fromJson(Map<String, dynamic> json) {
    return CPU(
      cores: json['cores'] as int?,
      modelName: json['modelName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cores = this.cores;
    final modelName = this.modelName;
    return {
      if (cores != null) 'cores': cores,
      if (modelName != null) 'modelName': modelName,
    };
  }
}

/// Properties of a conversion job
class ConversionProperties {
  /// The timestamp of when the snapshot being converted was taken
  final String? dataTimestamp;

  /// Whether the volume being converted uses UEFI or not
  final bool? forceUefi;

  /// The root volume name of a conversion job
  final String? rootVolumeName;

  /// A mapping between the volumes being converted and the converted snapshot ids
  final Map<String, Map<String, String>>? volumeToConversionMap;

  /// A mapping between the volumes and their sizes
  final Map<String, int>? volumeToVolumeSize;

  ConversionProperties({
    this.dataTimestamp,
    this.forceUefi,
    this.rootVolumeName,
    this.volumeToConversionMap,
    this.volumeToVolumeSize,
  });

  factory ConversionProperties.fromJson(Map<String, dynamic> json) {
    return ConversionProperties(
      dataTimestamp: json['dataTimestamp'] as String?,
      forceUefi: json['forceUefi'] as bool?,
      rootVolumeName: json['rootVolumeName'] as String?,
      volumeToConversionMap:
          (json['volumeToConversionMap'] as Map<String, dynamic>?)?.map(
              (k, e) => MapEntry(
                  k,
                  (e as Map<String, dynamic>)
                      .map((k, e) => MapEntry(k, e as String)))),
      volumeToVolumeSize: (json['volumeToVolumeSize'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as int)),
    );
  }

  Map<String, dynamic> toJson() {
    final dataTimestamp = this.dataTimestamp;
    final forceUefi = this.forceUefi;
    final rootVolumeName = this.rootVolumeName;
    final volumeToConversionMap = this.volumeToConversionMap;
    final volumeToVolumeSize = this.volumeToVolumeSize;
    return {
      if (dataTimestamp != null) 'dataTimestamp': dataTimestamp,
      if (forceUefi != null) 'forceUefi': forceUefi,
      if (rootVolumeName != null) 'rootVolumeName': rootVolumeName,
      if (volumeToConversionMap != null)
        'volumeToConversionMap': volumeToConversionMap,
      if (volumeToVolumeSize != null) 'volumeToVolumeSize': volumeToVolumeSize,
    };
  }
}

class CreateExtendedSourceServerResponse {
  /// Created extended source server.
  final SourceServer? sourceServer;

  CreateExtendedSourceServerResponse({
    this.sourceServer,
  });

  factory CreateExtendedSourceServerResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateExtendedSourceServerResponse(
      sourceServer: json['sourceServer'] != null
          ? SourceServer.fromJson(json['sourceServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceServer = this.sourceServer;
    return {
      if (sourceServer != null) 'sourceServer': sourceServer,
    };
  }
}

class CreateLaunchConfigurationTemplateResponse {
  /// Created Launch Configuration Template.
  final LaunchConfigurationTemplate? launchConfigurationTemplate;

  CreateLaunchConfigurationTemplateResponse({
    this.launchConfigurationTemplate,
  });

  factory CreateLaunchConfigurationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return CreateLaunchConfigurationTemplateResponse(
      launchConfigurationTemplate: json['launchConfigurationTemplate'] != null
          ? LaunchConfigurationTemplate.fromJson(
              json['launchConfigurationTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchConfigurationTemplate = this.launchConfigurationTemplate;
    return {
      if (launchConfigurationTemplate != null)
        'launchConfigurationTemplate': launchConfigurationTemplate,
    };
  }
}

/// Error in data replication.
class DataReplicationError {
  /// Error in data replication.
  final DataReplicationErrorString? error;

  /// Error in data replication.
  final String? rawError;

  DataReplicationError({
    this.error,
    this.rawError,
  });

  factory DataReplicationError.fromJson(Map<String, dynamic> json) {
    return DataReplicationError(
      error: (json['error'] as String?)?.toDataReplicationErrorString(),
      rawError: json['rawError'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final rawError = this.rawError;
    return {
      if (error != null) 'error': error.toValue(),
      if (rawError != null) 'rawError': rawError,
    };
  }
}

enum DataReplicationErrorString {
  agentNotSeen,
  snapshotsFailure,
  notConverging,
  unstableNetwork,
  failedToCreateSecurityGroup,
  failedToLaunchReplicationServer,
  failedToBootReplicationServer,
  failedToAuthenticateWithService,
  failedToDownloadReplicationSoftware,
  failedToCreateStagingDisks,
  failedToAttachStagingDisks,
  failedToPairReplicationServerWithAgent,
  failedToConnectAgentToReplicationServer,
  failedToStartDataTransfer,
}

extension DataReplicationErrorStringValueExtension
    on DataReplicationErrorString {
  String toValue() {
    switch (this) {
      case DataReplicationErrorString.agentNotSeen:
        return 'AGENT_NOT_SEEN';
      case DataReplicationErrorString.snapshotsFailure:
        return 'SNAPSHOTS_FAILURE';
      case DataReplicationErrorString.notConverging:
        return 'NOT_CONVERGING';
      case DataReplicationErrorString.unstableNetwork:
        return 'UNSTABLE_NETWORK';
      case DataReplicationErrorString.failedToCreateSecurityGroup:
        return 'FAILED_TO_CREATE_SECURITY_GROUP';
      case DataReplicationErrorString.failedToLaunchReplicationServer:
        return 'FAILED_TO_LAUNCH_REPLICATION_SERVER';
      case DataReplicationErrorString.failedToBootReplicationServer:
        return 'FAILED_TO_BOOT_REPLICATION_SERVER';
      case DataReplicationErrorString.failedToAuthenticateWithService:
        return 'FAILED_TO_AUTHENTICATE_WITH_SERVICE';
      case DataReplicationErrorString.failedToDownloadReplicationSoftware:
        return 'FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE';
      case DataReplicationErrorString.failedToCreateStagingDisks:
        return 'FAILED_TO_CREATE_STAGING_DISKS';
      case DataReplicationErrorString.failedToAttachStagingDisks:
        return 'FAILED_TO_ATTACH_STAGING_DISKS';
      case DataReplicationErrorString.failedToPairReplicationServerWithAgent:
        return 'FAILED_TO_PAIR_REPLICATION_SERVER_WITH_AGENT';
      case DataReplicationErrorString.failedToConnectAgentToReplicationServer:
        return 'FAILED_TO_CONNECT_AGENT_TO_REPLICATION_SERVER';
      case DataReplicationErrorString.failedToStartDataTransfer:
        return 'FAILED_TO_START_DATA_TRANSFER';
    }
  }
}

extension DataReplicationErrorStringFromString on String {
  DataReplicationErrorString toDataReplicationErrorString() {
    switch (this) {
      case 'AGENT_NOT_SEEN':
        return DataReplicationErrorString.agentNotSeen;
      case 'SNAPSHOTS_FAILURE':
        return DataReplicationErrorString.snapshotsFailure;
      case 'NOT_CONVERGING':
        return DataReplicationErrorString.notConverging;
      case 'UNSTABLE_NETWORK':
        return DataReplicationErrorString.unstableNetwork;
      case 'FAILED_TO_CREATE_SECURITY_GROUP':
        return DataReplicationErrorString.failedToCreateSecurityGroup;
      case 'FAILED_TO_LAUNCH_REPLICATION_SERVER':
        return DataReplicationErrorString.failedToLaunchReplicationServer;
      case 'FAILED_TO_BOOT_REPLICATION_SERVER':
        return DataReplicationErrorString.failedToBootReplicationServer;
      case 'FAILED_TO_AUTHENTICATE_WITH_SERVICE':
        return DataReplicationErrorString.failedToAuthenticateWithService;
      case 'FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE':
        return DataReplicationErrorString.failedToDownloadReplicationSoftware;
      case 'FAILED_TO_CREATE_STAGING_DISKS':
        return DataReplicationErrorString.failedToCreateStagingDisks;
      case 'FAILED_TO_ATTACH_STAGING_DISKS':
        return DataReplicationErrorString.failedToAttachStagingDisks;
      case 'FAILED_TO_PAIR_REPLICATION_SERVER_WITH_AGENT':
        return DataReplicationErrorString
            .failedToPairReplicationServerWithAgent;
      case 'FAILED_TO_CONNECT_AGENT_TO_REPLICATION_SERVER':
        return DataReplicationErrorString
            .failedToConnectAgentToReplicationServer;
      case 'FAILED_TO_START_DATA_TRANSFER':
        return DataReplicationErrorString.failedToStartDataTransfer;
    }
    throw Exception('$this is not known in enum DataReplicationErrorString');
  }
}

/// Information about Data Replication
class DataReplicationInfo {
  /// Error in data replication.
  final DataReplicationError? dataReplicationError;

  /// Information about whether the data replication has been initiated.
  final DataReplicationInitiation? dataReplicationInitiation;

  /// The state of the data replication.
  final DataReplicationState? dataReplicationState;

  /// An estimate of when the data replication will be completed.
  final String? etaDateTime;

  /// Data replication lag duration.
  final String? lagDuration;

  /// The disks that should be replicated.
  final List<DataReplicationInfoReplicatedDisk>? replicatedDisks;

  /// AWS Availability zone into which data is being replicated.
  final String? stagingAvailabilityZone;

  DataReplicationInfo({
    this.dataReplicationError,
    this.dataReplicationInitiation,
    this.dataReplicationState,
    this.etaDateTime,
    this.lagDuration,
    this.replicatedDisks,
    this.stagingAvailabilityZone,
  });

  factory DataReplicationInfo.fromJson(Map<String, dynamic> json) {
    return DataReplicationInfo(
      dataReplicationError: json['dataReplicationError'] != null
          ? DataReplicationError.fromJson(
              json['dataReplicationError'] as Map<String, dynamic>)
          : null,
      dataReplicationInitiation: json['dataReplicationInitiation'] != null
          ? DataReplicationInitiation.fromJson(
              json['dataReplicationInitiation'] as Map<String, dynamic>)
          : null,
      dataReplicationState:
          (json['dataReplicationState'] as String?)?.toDataReplicationState(),
      etaDateTime: json['etaDateTime'] as String?,
      lagDuration: json['lagDuration'] as String?,
      replicatedDisks: (json['replicatedDisks'] as List?)
          ?.whereNotNull()
          .map((e) => DataReplicationInfoReplicatedDisk.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      stagingAvailabilityZone: json['stagingAvailabilityZone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplicationError = this.dataReplicationError;
    final dataReplicationInitiation = this.dataReplicationInitiation;
    final dataReplicationState = this.dataReplicationState;
    final etaDateTime = this.etaDateTime;
    final lagDuration = this.lagDuration;
    final replicatedDisks = this.replicatedDisks;
    final stagingAvailabilityZone = this.stagingAvailabilityZone;
    return {
      if (dataReplicationError != null)
        'dataReplicationError': dataReplicationError,
      if (dataReplicationInitiation != null)
        'dataReplicationInitiation': dataReplicationInitiation,
      if (dataReplicationState != null)
        'dataReplicationState': dataReplicationState.toValue(),
      if (etaDateTime != null) 'etaDateTime': etaDateTime,
      if (lagDuration != null) 'lagDuration': lagDuration,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (stagingAvailabilityZone != null)
        'stagingAvailabilityZone': stagingAvailabilityZone,
    };
  }
}

/// A disk that should be replicated.
class DataReplicationInfoReplicatedDisk {
  /// The size of the replication backlog in bytes.
  final int? backloggedStorageBytes;

  /// The name of the device.
  final String? deviceName;

  /// The amount of data replicated so far in bytes.
  final int? replicatedStorageBytes;

  /// The amount of data to be rescanned in bytes.
  final int? rescannedStorageBytes;

  /// The total amount of data to be replicated in bytes.
  final int? totalStorageBytes;

  DataReplicationInfoReplicatedDisk({
    this.backloggedStorageBytes,
    this.deviceName,
    this.replicatedStorageBytes,
    this.rescannedStorageBytes,
    this.totalStorageBytes,
  });

  factory DataReplicationInfoReplicatedDisk.fromJson(
      Map<String, dynamic> json) {
    return DataReplicationInfoReplicatedDisk(
      backloggedStorageBytes: json['backloggedStorageBytes'] as int?,
      deviceName: json['deviceName'] as String?,
      replicatedStorageBytes: json['replicatedStorageBytes'] as int?,
      rescannedStorageBytes: json['rescannedStorageBytes'] as int?,
      totalStorageBytes: json['totalStorageBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backloggedStorageBytes = this.backloggedStorageBytes;
    final deviceName = this.deviceName;
    final replicatedStorageBytes = this.replicatedStorageBytes;
    final rescannedStorageBytes = this.rescannedStorageBytes;
    final totalStorageBytes = this.totalStorageBytes;
    return {
      if (backloggedStorageBytes != null)
        'backloggedStorageBytes': backloggedStorageBytes,
      if (deviceName != null) 'deviceName': deviceName,
      if (replicatedStorageBytes != null)
        'replicatedStorageBytes': replicatedStorageBytes,
      if (rescannedStorageBytes != null)
        'rescannedStorageBytes': rescannedStorageBytes,
      if (totalStorageBytes != null) 'totalStorageBytes': totalStorageBytes,
    };
  }
}

/// Data replication initiation.
class DataReplicationInitiation {
  /// The date and time of the next attempt to initiate data replication.
  final String? nextAttemptDateTime;

  /// The date and time of the current attempt to initiate data replication.
  final String? startDateTime;

  /// The steps of the current attempt to initiate data replication.
  final List<DataReplicationInitiationStep>? steps;

  DataReplicationInitiation({
    this.nextAttemptDateTime,
    this.startDateTime,
    this.steps,
  });

  factory DataReplicationInitiation.fromJson(Map<String, dynamic> json) {
    return DataReplicationInitiation(
      nextAttemptDateTime: json['nextAttemptDateTime'] as String?,
      startDateTime: json['startDateTime'] as String?,
      steps: (json['steps'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DataReplicationInitiationStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final nextAttemptDateTime = this.nextAttemptDateTime;
    final startDateTime = this.startDateTime;
    final steps = this.steps;
    return {
      if (nextAttemptDateTime != null)
        'nextAttemptDateTime': nextAttemptDateTime,
      if (startDateTime != null) 'startDateTime': startDateTime,
      if (steps != null) 'steps': steps,
    };
  }
}

/// Data replication initiation step.
class DataReplicationInitiationStep {
  /// The name of the step.
  final DataReplicationInitiationStepName? name;

  /// The status of the step.
  final DataReplicationInitiationStepStatus? status;

  DataReplicationInitiationStep({
    this.name,
    this.status,
  });

  factory DataReplicationInitiationStep.fromJson(Map<String, dynamic> json) {
    return DataReplicationInitiationStep(
      name: (json['name'] as String?)?.toDataReplicationInitiationStepName(),
      status:
          (json['status'] as String?)?.toDataReplicationInitiationStepStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum DataReplicationInitiationStepName {
  wait,
  createSecurityGroup,
  launchReplicationServer,
  bootReplicationServer,
  authenticateWithService,
  downloadReplicationSoftware,
  createStagingDisks,
  attachStagingDisks,
  pairReplicationServerWithAgent,
  connectAgentToReplicationServer,
  startDataTransfer,
}

extension DataReplicationInitiationStepNameValueExtension
    on DataReplicationInitiationStepName {
  String toValue() {
    switch (this) {
      case DataReplicationInitiationStepName.wait:
        return 'WAIT';
      case DataReplicationInitiationStepName.createSecurityGroup:
        return 'CREATE_SECURITY_GROUP';
      case DataReplicationInitiationStepName.launchReplicationServer:
        return 'LAUNCH_REPLICATION_SERVER';
      case DataReplicationInitiationStepName.bootReplicationServer:
        return 'BOOT_REPLICATION_SERVER';
      case DataReplicationInitiationStepName.authenticateWithService:
        return 'AUTHENTICATE_WITH_SERVICE';
      case DataReplicationInitiationStepName.downloadReplicationSoftware:
        return 'DOWNLOAD_REPLICATION_SOFTWARE';
      case DataReplicationInitiationStepName.createStagingDisks:
        return 'CREATE_STAGING_DISKS';
      case DataReplicationInitiationStepName.attachStagingDisks:
        return 'ATTACH_STAGING_DISKS';
      case DataReplicationInitiationStepName.pairReplicationServerWithAgent:
        return 'PAIR_REPLICATION_SERVER_WITH_AGENT';
      case DataReplicationInitiationStepName.connectAgentToReplicationServer:
        return 'CONNECT_AGENT_TO_REPLICATION_SERVER';
      case DataReplicationInitiationStepName.startDataTransfer:
        return 'START_DATA_TRANSFER';
    }
  }
}

extension DataReplicationInitiationStepNameFromString on String {
  DataReplicationInitiationStepName toDataReplicationInitiationStepName() {
    switch (this) {
      case 'WAIT':
        return DataReplicationInitiationStepName.wait;
      case 'CREATE_SECURITY_GROUP':
        return DataReplicationInitiationStepName.createSecurityGroup;
      case 'LAUNCH_REPLICATION_SERVER':
        return DataReplicationInitiationStepName.launchReplicationServer;
      case 'BOOT_REPLICATION_SERVER':
        return DataReplicationInitiationStepName.bootReplicationServer;
      case 'AUTHENTICATE_WITH_SERVICE':
        return DataReplicationInitiationStepName.authenticateWithService;
      case 'DOWNLOAD_REPLICATION_SOFTWARE':
        return DataReplicationInitiationStepName.downloadReplicationSoftware;
      case 'CREATE_STAGING_DISKS':
        return DataReplicationInitiationStepName.createStagingDisks;
      case 'ATTACH_STAGING_DISKS':
        return DataReplicationInitiationStepName.attachStagingDisks;
      case 'PAIR_REPLICATION_SERVER_WITH_AGENT':
        return DataReplicationInitiationStepName.pairReplicationServerWithAgent;
      case 'CONNECT_AGENT_TO_REPLICATION_SERVER':
        return DataReplicationInitiationStepName
            .connectAgentToReplicationServer;
      case 'START_DATA_TRANSFER':
        return DataReplicationInitiationStepName.startDataTransfer;
    }
    throw Exception(
        '$this is not known in enum DataReplicationInitiationStepName');
  }
}

enum DataReplicationInitiationStepStatus {
  notStarted,
  inProgress,
  succeeded,
  failed,
  skipped,
}

extension DataReplicationInitiationStepStatusValueExtension
    on DataReplicationInitiationStepStatus {
  String toValue() {
    switch (this) {
      case DataReplicationInitiationStepStatus.notStarted:
        return 'NOT_STARTED';
      case DataReplicationInitiationStepStatus.inProgress:
        return 'IN_PROGRESS';
      case DataReplicationInitiationStepStatus.succeeded:
        return 'SUCCEEDED';
      case DataReplicationInitiationStepStatus.failed:
        return 'FAILED';
      case DataReplicationInitiationStepStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension DataReplicationInitiationStepStatusFromString on String {
  DataReplicationInitiationStepStatus toDataReplicationInitiationStepStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return DataReplicationInitiationStepStatus.notStarted;
      case 'IN_PROGRESS':
        return DataReplicationInitiationStepStatus.inProgress;
      case 'SUCCEEDED':
        return DataReplicationInitiationStepStatus.succeeded;
      case 'FAILED':
        return DataReplicationInitiationStepStatus.failed;
      case 'SKIPPED':
        return DataReplicationInitiationStepStatus.skipped;
    }
    throw Exception(
        '$this is not known in enum DataReplicationInitiationStepStatus');
  }
}

enum DataReplicationState {
  stopped,
  initiating,
  initialSync,
  backlog,
  creatingSnapshot,
  continuous,
  paused,
  rescan,
  stalled,
  disconnected,
}

extension DataReplicationStateValueExtension on DataReplicationState {
  String toValue() {
    switch (this) {
      case DataReplicationState.stopped:
        return 'STOPPED';
      case DataReplicationState.initiating:
        return 'INITIATING';
      case DataReplicationState.initialSync:
        return 'INITIAL_SYNC';
      case DataReplicationState.backlog:
        return 'BACKLOG';
      case DataReplicationState.creatingSnapshot:
        return 'CREATING_SNAPSHOT';
      case DataReplicationState.continuous:
        return 'CONTINUOUS';
      case DataReplicationState.paused:
        return 'PAUSED';
      case DataReplicationState.rescan:
        return 'RESCAN';
      case DataReplicationState.stalled:
        return 'STALLED';
      case DataReplicationState.disconnected:
        return 'DISCONNECTED';
    }
  }
}

extension DataReplicationStateFromString on String {
  DataReplicationState toDataReplicationState() {
    switch (this) {
      case 'STOPPED':
        return DataReplicationState.stopped;
      case 'INITIATING':
        return DataReplicationState.initiating;
      case 'INITIAL_SYNC':
        return DataReplicationState.initialSync;
      case 'BACKLOG':
        return DataReplicationState.backlog;
      case 'CREATING_SNAPSHOT':
        return DataReplicationState.creatingSnapshot;
      case 'CONTINUOUS':
        return DataReplicationState.continuous;
      case 'PAUSED':
        return DataReplicationState.paused;
      case 'RESCAN':
        return DataReplicationState.rescan;
      case 'STALLED':
        return DataReplicationState.stalled;
      case 'DISCONNECTED':
        return DataReplicationState.disconnected;
    }
    throw Exception('$this is not known in enum DataReplicationState');
  }
}

class DeleteJobResponse {
  DeleteJobResponse();

  factory DeleteJobResponse.fromJson(Map<String, dynamic> _) {
    return DeleteJobResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteLaunchConfigurationTemplateResponse {
  DeleteLaunchConfigurationTemplateResponse();

  factory DeleteLaunchConfigurationTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteLaunchConfigurationTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteReplicationConfigurationTemplateResponse {
  DeleteReplicationConfigurationTemplateResponse();

  factory DeleteReplicationConfigurationTemplateResponse.fromJson(
      Map<String, dynamic> _) {
    return DeleteReplicationConfigurationTemplateResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DeleteSourceServerResponse {
  DeleteSourceServerResponse();

  factory DeleteSourceServerResponse.fromJson(Map<String, dynamic> _) {
    return DeleteSourceServerResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DescribeJobLogItemsResponse {
  /// An array of Job log items.
  final List<JobLog>? items;

  /// The token of the next Job log items to retrieve.
  final String? nextToken;

  DescribeJobLogItemsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeJobLogItemsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobLogItemsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => JobLog.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A set of filters by which to return Jobs.
class DescribeJobsRequestFilters {
  /// The start date in a date range query.
  final String? fromDate;

  /// An array of Job IDs that should be returned. An empty array means all jobs.
  final List<String>? jobIDs;

  /// The end date in a date range query.
  final String? toDate;

  DescribeJobsRequestFilters({
    this.fromDate,
    this.jobIDs,
    this.toDate,
  });

  Map<String, dynamic> toJson() {
    final fromDate = this.fromDate;
    final jobIDs = this.jobIDs;
    final toDate = this.toDate;
    return {
      if (fromDate != null) 'fromDate': fromDate,
      if (jobIDs != null) 'jobIDs': jobIDs,
      if (toDate != null) 'toDate': toDate,
    };
  }
}

class DescribeJobsResponse {
  /// An array of Jobs.
  final List<Job>? items;

  /// The token of the next Job to retrieve.
  final String? nextToken;

  DescribeJobsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeJobsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeJobsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Job.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeLaunchConfigurationTemplatesResponse {
  /// List of items returned by DescribeLaunchConfigurationTemplates.
  final List<LaunchConfigurationTemplate>? items;

  /// The token of the next Launch Configuration Template to retrieve.
  final String? nextToken;

  DescribeLaunchConfigurationTemplatesResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeLaunchConfigurationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeLaunchConfigurationTemplatesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              LaunchConfigurationTemplate.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A set of filters by which to return Recovery Instances.
class DescribeRecoveryInstancesRequestFilters {
  /// An array of Recovery Instance IDs that should be returned. An empty array
  /// means all Recovery Instances.
  final List<String>? recoveryInstanceIDs;

  /// An array of Source Server IDs for which associated Recovery Instances should
  /// be returned.
  final List<String>? sourceServerIDs;

  DescribeRecoveryInstancesRequestFilters({
    this.recoveryInstanceIDs,
    this.sourceServerIDs,
  });

  Map<String, dynamic> toJson() {
    final recoveryInstanceIDs = this.recoveryInstanceIDs;
    final sourceServerIDs = this.sourceServerIDs;
    return {
      if (recoveryInstanceIDs != null)
        'recoveryInstanceIDs': recoveryInstanceIDs,
      if (sourceServerIDs != null) 'sourceServerIDs': sourceServerIDs,
    };
  }
}

class DescribeRecoveryInstancesResponse {
  /// An array of Recovery Instances.
  final List<RecoveryInstance>? items;

  /// The token of the next Recovery Instance to retrieve.
  final String? nextToken;

  DescribeRecoveryInstancesResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeRecoveryInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRecoveryInstancesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecoveryInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A set of filters by which to return Recovery Snapshots.
class DescribeRecoverySnapshotsRequestFilters {
  /// The start date in a date range query.
  final String? fromDateTime;

  /// The end date in a date range query.
  final String? toDateTime;

  DescribeRecoverySnapshotsRequestFilters({
    this.fromDateTime,
    this.toDateTime,
  });

  Map<String, dynamic> toJson() {
    final fromDateTime = this.fromDateTime;
    final toDateTime = this.toDateTime;
    return {
      if (fromDateTime != null) 'fromDateTime': fromDateTime,
      if (toDateTime != null) 'toDateTime': toDateTime,
    };
  }
}

class DescribeRecoverySnapshotsResponse {
  /// An array of Recovery Snapshots.
  final List<RecoverySnapshot>? items;

  /// The token of the next Recovery Snapshot to retrieve.
  final String? nextToken;

  DescribeRecoverySnapshotsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeRecoverySnapshotsResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeRecoverySnapshotsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => RecoverySnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class DescribeReplicationConfigurationTemplatesResponse {
  /// An array of Replication Configuration Templates.
  final List<ReplicationConfigurationTemplate>? items;

  /// The token of the next Replication Configuration Template to retrieve.
  final String? nextToken;

  DescribeReplicationConfigurationTemplatesResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeReplicationConfigurationTemplatesResponse.fromJson(
      Map<String, dynamic> json) {
    return DescribeReplicationConfigurationTemplatesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationConfigurationTemplate.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// A set of filters by which to return Source Servers.
class DescribeSourceServersRequestFilters {
  /// An ID that describes the hardware of the Source Server. This is either an
  /// EC2 instance id, a VMware uuid or a mac address.
  final String? hardwareId;

  /// An array of Source Servers IDs that should be returned. An empty array means
  /// all Source Servers.
  final List<String>? sourceServerIDs;

  /// An array of staging account IDs that extended source servers belong to. An
  /// empty array means all source servers will be shown.
  final List<String>? stagingAccountIDs;

  DescribeSourceServersRequestFilters({
    this.hardwareId,
    this.sourceServerIDs,
    this.stagingAccountIDs,
  });

  Map<String, dynamic> toJson() {
    final hardwareId = this.hardwareId;
    final sourceServerIDs = this.sourceServerIDs;
    final stagingAccountIDs = this.stagingAccountIDs;
    return {
      if (hardwareId != null) 'hardwareId': hardwareId,
      if (sourceServerIDs != null) 'sourceServerIDs': sourceServerIDs,
      if (stagingAccountIDs != null) 'stagingAccountIDs': stagingAccountIDs,
    };
  }
}

class DescribeSourceServersResponse {
  /// An array of Source Servers.
  final List<SourceServer>? items;

  /// The token of the next Source Server to retrieve.
  final String? nextToken;

  DescribeSourceServersResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeSourceServersResponse.fromJson(Map<String, dynamic> json) {
    return DescribeSourceServersResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => SourceServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

/// An object representing a data storage device on a server.
class Disk {
  /// The amount of storage on the disk in bytes.
  final int? bytes;

  /// The disk or device name.
  final String? deviceName;

  Disk({
    this.bytes,
    this.deviceName,
  });

  factory Disk.fromJson(Map<String, dynamic> json) {
    return Disk(
      bytes: json['bytes'] as int?,
      deviceName: json['deviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final deviceName = this.deviceName;
    return {
      if (bytes != null) 'bytes': bytes,
      if (deviceName != null) 'deviceName': deviceName,
    };
  }
}

enum EC2InstanceState {
  pending,
  running,
  stopping,
  stopped,
  shuttingDown,
  terminated,
  notFound,
}

extension EC2InstanceStateValueExtension on EC2InstanceState {
  String toValue() {
    switch (this) {
      case EC2InstanceState.pending:
        return 'PENDING';
      case EC2InstanceState.running:
        return 'RUNNING';
      case EC2InstanceState.stopping:
        return 'STOPPING';
      case EC2InstanceState.stopped:
        return 'STOPPED';
      case EC2InstanceState.shuttingDown:
        return 'SHUTTING-DOWN';
      case EC2InstanceState.terminated:
        return 'TERMINATED';
      case EC2InstanceState.notFound:
        return 'NOT_FOUND';
    }
  }
}

extension EC2InstanceStateFromString on String {
  EC2InstanceState toEC2InstanceState() {
    switch (this) {
      case 'PENDING':
        return EC2InstanceState.pending;
      case 'RUNNING':
        return EC2InstanceState.running;
      case 'STOPPING':
        return EC2InstanceState.stopping;
      case 'STOPPED':
        return EC2InstanceState.stopped;
      case 'SHUTTING-DOWN':
        return EC2InstanceState.shuttingDown;
      case 'TERMINATED':
        return EC2InstanceState.terminated;
      case 'NOT_FOUND':
        return EC2InstanceState.notFound;
    }
    throw Exception('$this is not known in enum EC2InstanceState');
  }
}

enum ExtensionStatus {
  extended,
  extensionError,
  notExtended,
}

extension ExtensionStatusValueExtension on ExtensionStatus {
  String toValue() {
    switch (this) {
      case ExtensionStatus.extended:
        return 'EXTENDED';
      case ExtensionStatus.extensionError:
        return 'EXTENSION_ERROR';
      case ExtensionStatus.notExtended:
        return 'NOT_EXTENDED';
    }
  }
}

extension ExtensionStatusFromString on String {
  ExtensionStatus toExtensionStatus() {
    switch (this) {
      case 'EXTENDED':
        return ExtensionStatus.extended;
      case 'EXTENSION_ERROR':
        return ExtensionStatus.extensionError;
      case 'NOT_EXTENDED':
        return ExtensionStatus.notExtended;
    }
    throw Exception('$this is not known in enum ExtensionStatus');
  }
}

enum FailbackLaunchType {
  recovery,
  drill,
}

extension FailbackLaunchTypeValueExtension on FailbackLaunchType {
  String toValue() {
    switch (this) {
      case FailbackLaunchType.recovery:
        return 'RECOVERY';
      case FailbackLaunchType.drill:
        return 'DRILL';
    }
  }
}

extension FailbackLaunchTypeFromString on String {
  FailbackLaunchType toFailbackLaunchType() {
    switch (this) {
      case 'RECOVERY':
        return FailbackLaunchType.recovery;
      case 'DRILL':
        return FailbackLaunchType.drill;
    }
    throw Exception('$this is not known in enum FailbackLaunchType');
  }
}

enum FailbackReplicationError {
  agentNotSeen,
  failbackClientNotSeen,
  notConverging,
  unstableNetwork,
  failedToEstablishRecoveryInstanceCommunication,
  failedToDownloadReplicationSoftwareToFailbackClient,
  failedToConfigureReplicationSoftware,
  failedToPairAgentWithReplicationSoftware,
  failedToEstablishAgentReplicatorSoftwareCommunication,
  failedGettingReplicationState,
  snapshotsFailure,
  failedToCreateSecurityGroup,
  failedToLaunchReplicationServer,
  failedToBootReplicationServer,
  failedToAuthenticateWithService,
  failedToDownloadReplicationSoftware,
  failedToCreateStagingDisks,
  failedToAttachStagingDisks,
  failedToPairReplicationServerWithAgent,
  failedToConnectAgentToReplicationServer,
  failedToStartDataTransfer,
}

extension FailbackReplicationErrorValueExtension on FailbackReplicationError {
  String toValue() {
    switch (this) {
      case FailbackReplicationError.agentNotSeen:
        return 'AGENT_NOT_SEEN';
      case FailbackReplicationError.failbackClientNotSeen:
        return 'FAILBACK_CLIENT_NOT_SEEN';
      case FailbackReplicationError.notConverging:
        return 'NOT_CONVERGING';
      case FailbackReplicationError.unstableNetwork:
        return 'UNSTABLE_NETWORK';
      case FailbackReplicationError
            .failedToEstablishRecoveryInstanceCommunication:
        return 'FAILED_TO_ESTABLISH_RECOVERY_INSTANCE_COMMUNICATION';
      case FailbackReplicationError
            .failedToDownloadReplicationSoftwareToFailbackClient:
        return 'FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE_TO_FAILBACK_CLIENT';
      case FailbackReplicationError.failedToConfigureReplicationSoftware:
        return 'FAILED_TO_CONFIGURE_REPLICATION_SOFTWARE';
      case FailbackReplicationError.failedToPairAgentWithReplicationSoftware:
        return 'FAILED_TO_PAIR_AGENT_WITH_REPLICATION_SOFTWARE';
      case FailbackReplicationError
            .failedToEstablishAgentReplicatorSoftwareCommunication:
        return 'FAILED_TO_ESTABLISH_AGENT_REPLICATOR_SOFTWARE_COMMUNICATION';
      case FailbackReplicationError.failedGettingReplicationState:
        return 'FAILED_GETTING_REPLICATION_STATE';
      case FailbackReplicationError.snapshotsFailure:
        return 'SNAPSHOTS_FAILURE';
      case FailbackReplicationError.failedToCreateSecurityGroup:
        return 'FAILED_TO_CREATE_SECURITY_GROUP';
      case FailbackReplicationError.failedToLaunchReplicationServer:
        return 'FAILED_TO_LAUNCH_REPLICATION_SERVER';
      case FailbackReplicationError.failedToBootReplicationServer:
        return 'FAILED_TO_BOOT_REPLICATION_SERVER';
      case FailbackReplicationError.failedToAuthenticateWithService:
        return 'FAILED_TO_AUTHENTICATE_WITH_SERVICE';
      case FailbackReplicationError.failedToDownloadReplicationSoftware:
        return 'FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE';
      case FailbackReplicationError.failedToCreateStagingDisks:
        return 'FAILED_TO_CREATE_STAGING_DISKS';
      case FailbackReplicationError.failedToAttachStagingDisks:
        return 'FAILED_TO_ATTACH_STAGING_DISKS';
      case FailbackReplicationError.failedToPairReplicationServerWithAgent:
        return 'FAILED_TO_PAIR_REPLICATION_SERVER_WITH_AGENT';
      case FailbackReplicationError.failedToConnectAgentToReplicationServer:
        return 'FAILED_TO_CONNECT_AGENT_TO_REPLICATION_SERVER';
      case FailbackReplicationError.failedToStartDataTransfer:
        return 'FAILED_TO_START_DATA_TRANSFER';
    }
  }
}

extension FailbackReplicationErrorFromString on String {
  FailbackReplicationError toFailbackReplicationError() {
    switch (this) {
      case 'AGENT_NOT_SEEN':
        return FailbackReplicationError.agentNotSeen;
      case 'FAILBACK_CLIENT_NOT_SEEN':
        return FailbackReplicationError.failbackClientNotSeen;
      case 'NOT_CONVERGING':
        return FailbackReplicationError.notConverging;
      case 'UNSTABLE_NETWORK':
        return FailbackReplicationError.unstableNetwork;
      case 'FAILED_TO_ESTABLISH_RECOVERY_INSTANCE_COMMUNICATION':
        return FailbackReplicationError
            .failedToEstablishRecoveryInstanceCommunication;
      case 'FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE_TO_FAILBACK_CLIENT':
        return FailbackReplicationError
            .failedToDownloadReplicationSoftwareToFailbackClient;
      case 'FAILED_TO_CONFIGURE_REPLICATION_SOFTWARE':
        return FailbackReplicationError.failedToConfigureReplicationSoftware;
      case 'FAILED_TO_PAIR_AGENT_WITH_REPLICATION_SOFTWARE':
        return FailbackReplicationError
            .failedToPairAgentWithReplicationSoftware;
      case 'FAILED_TO_ESTABLISH_AGENT_REPLICATOR_SOFTWARE_COMMUNICATION':
        return FailbackReplicationError
            .failedToEstablishAgentReplicatorSoftwareCommunication;
      case 'FAILED_GETTING_REPLICATION_STATE':
        return FailbackReplicationError.failedGettingReplicationState;
      case 'SNAPSHOTS_FAILURE':
        return FailbackReplicationError.snapshotsFailure;
      case 'FAILED_TO_CREATE_SECURITY_GROUP':
        return FailbackReplicationError.failedToCreateSecurityGroup;
      case 'FAILED_TO_LAUNCH_REPLICATION_SERVER':
        return FailbackReplicationError.failedToLaunchReplicationServer;
      case 'FAILED_TO_BOOT_REPLICATION_SERVER':
        return FailbackReplicationError.failedToBootReplicationServer;
      case 'FAILED_TO_AUTHENTICATE_WITH_SERVICE':
        return FailbackReplicationError.failedToAuthenticateWithService;
      case 'FAILED_TO_DOWNLOAD_REPLICATION_SOFTWARE':
        return FailbackReplicationError.failedToDownloadReplicationSoftware;
      case 'FAILED_TO_CREATE_STAGING_DISKS':
        return FailbackReplicationError.failedToCreateStagingDisks;
      case 'FAILED_TO_ATTACH_STAGING_DISKS':
        return FailbackReplicationError.failedToAttachStagingDisks;
      case 'FAILED_TO_PAIR_REPLICATION_SERVER_WITH_AGENT':
        return FailbackReplicationError.failedToPairReplicationServerWithAgent;
      case 'FAILED_TO_CONNECT_AGENT_TO_REPLICATION_SERVER':
        return FailbackReplicationError.failedToConnectAgentToReplicationServer;
      case 'FAILED_TO_START_DATA_TRANSFER':
        return FailbackReplicationError.failedToStartDataTransfer;
    }
    throw Exception('$this is not known in enum FailbackReplicationError');
  }
}

enum FailbackState {
  failbackNotStarted,
  failbackInProgress,
  failbackReadyForLaunch,
  failbackCompleted,
  failbackError,
  failbackNotReadyForLaunch,
  failbackLaunchStateNotAvailable,
}

extension FailbackStateValueExtension on FailbackState {
  String toValue() {
    switch (this) {
      case FailbackState.failbackNotStarted:
        return 'FAILBACK_NOT_STARTED';
      case FailbackState.failbackInProgress:
        return 'FAILBACK_IN_PROGRESS';
      case FailbackState.failbackReadyForLaunch:
        return 'FAILBACK_READY_FOR_LAUNCH';
      case FailbackState.failbackCompleted:
        return 'FAILBACK_COMPLETED';
      case FailbackState.failbackError:
        return 'FAILBACK_ERROR';
      case FailbackState.failbackNotReadyForLaunch:
        return 'FAILBACK_NOT_READY_FOR_LAUNCH';
      case FailbackState.failbackLaunchStateNotAvailable:
        return 'FAILBACK_LAUNCH_STATE_NOT_AVAILABLE';
    }
  }
}

extension FailbackStateFromString on String {
  FailbackState toFailbackState() {
    switch (this) {
      case 'FAILBACK_NOT_STARTED':
        return FailbackState.failbackNotStarted;
      case 'FAILBACK_IN_PROGRESS':
        return FailbackState.failbackInProgress;
      case 'FAILBACK_READY_FOR_LAUNCH':
        return FailbackState.failbackReadyForLaunch;
      case 'FAILBACK_COMPLETED':
        return FailbackState.failbackCompleted;
      case 'FAILBACK_ERROR':
        return FailbackState.failbackError;
      case 'FAILBACK_NOT_READY_FOR_LAUNCH':
        return FailbackState.failbackNotReadyForLaunch;
      case 'FAILBACK_LAUNCH_STATE_NOT_AVAILABLE':
        return FailbackState.failbackLaunchStateNotAvailable;
    }
    throw Exception('$this is not known in enum FailbackState');
  }
}

class GetFailbackReplicationConfigurationResponse {
  /// The ID of the Recovery Instance.
  final String recoveryInstanceID;

  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Recovery Instance in Mbps.
  final int? bandwidthThrottling;

  /// The name of the Failback Replication Configuration.
  final String? name;

  /// Whether to use Private IP for the failback replication of the Recovery
  /// Instance.
  final bool? usePrivateIP;

  GetFailbackReplicationConfigurationResponse({
    required this.recoveryInstanceID,
    this.bandwidthThrottling,
    this.name,
    this.usePrivateIP,
  });

  factory GetFailbackReplicationConfigurationResponse.fromJson(
      Map<String, dynamic> json) {
    return GetFailbackReplicationConfigurationResponse(
      recoveryInstanceID: json['recoveryInstanceID'] as String,
      bandwidthThrottling: json['bandwidthThrottling'] as int?,
      name: json['name'] as String?,
      usePrivateIP: json['usePrivateIP'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final recoveryInstanceID = this.recoveryInstanceID;
    final bandwidthThrottling = this.bandwidthThrottling;
    final name = this.name;
    final usePrivateIP = this.usePrivateIP;
    return {
      'recoveryInstanceID': recoveryInstanceID,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (name != null) 'name': name,
      if (usePrivateIP != null) 'usePrivateIP': usePrivateIP,
    };
  }
}

/// Hints used to uniquely identify a machine.
class IdentificationHints {
  /// AWS Instance ID identification hint.
  final String? awsInstanceID;

  /// Fully Qualified Domain Name identification hint.
  final String? fqdn;

  /// Hostname identification hint.
  final String? hostname;

  /// vCenter VM path identification hint.
  final String? vmWareUuid;

  IdentificationHints({
    this.awsInstanceID,
    this.fqdn,
    this.hostname,
    this.vmWareUuid,
  });

  factory IdentificationHints.fromJson(Map<String, dynamic> json) {
    return IdentificationHints(
      awsInstanceID: json['awsInstanceID'] as String?,
      fqdn: json['fqdn'] as String?,
      hostname: json['hostname'] as String?,
      vmWareUuid: json['vmWareUuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsInstanceID = this.awsInstanceID;
    final fqdn = this.fqdn;
    final hostname = this.hostname;
    final vmWareUuid = this.vmWareUuid;
    return {
      if (awsInstanceID != null) 'awsInstanceID': awsInstanceID,
      if (fqdn != null) 'fqdn': fqdn,
      if (hostname != null) 'hostname': hostname,
      if (vmWareUuid != null) 'vmWareUuid': vmWareUuid,
    };
  }
}

class InitializeServiceResponse {
  InitializeServiceResponse();

  factory InitializeServiceResponse.fromJson(Map<String, dynamic> _) {
    return InitializeServiceResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum InitiatedBy {
  startRecovery,
  startDrill,
  failback,
  diagnostic,
  terminateRecoveryInstances,
  targetAccount,
}

extension InitiatedByValueExtension on InitiatedBy {
  String toValue() {
    switch (this) {
      case InitiatedBy.startRecovery:
        return 'START_RECOVERY';
      case InitiatedBy.startDrill:
        return 'START_DRILL';
      case InitiatedBy.failback:
        return 'FAILBACK';
      case InitiatedBy.diagnostic:
        return 'DIAGNOSTIC';
      case InitiatedBy.terminateRecoveryInstances:
        return 'TERMINATE_RECOVERY_INSTANCES';
      case InitiatedBy.targetAccount:
        return 'TARGET_ACCOUNT';
    }
  }
}

extension InitiatedByFromString on String {
  InitiatedBy toInitiatedBy() {
    switch (this) {
      case 'START_RECOVERY':
        return InitiatedBy.startRecovery;
      case 'START_DRILL':
        return InitiatedBy.startDrill;
      case 'FAILBACK':
        return InitiatedBy.failback;
      case 'DIAGNOSTIC':
        return InitiatedBy.diagnostic;
      case 'TERMINATE_RECOVERY_INSTANCES':
        return InitiatedBy.terminateRecoveryInstances;
      case 'TARGET_ACCOUNT':
        return InitiatedBy.targetAccount;
    }
    throw Exception('$this is not known in enum InitiatedBy');
  }
}

/// A job is an asynchronous workflow.
class Job {
  /// The ID of the Job.
  final String jobID;

  /// The ARN of a Job.
  final String? arn;

  /// The date and time of when the Job was created.
  final String? creationDateTime;

  /// The date and time of when the Job ended.
  final String? endDateTime;

  /// A string representing who initiated the Job.
  final InitiatedBy? initiatedBy;

  /// A list of servers that the Job is acting upon.
  final List<ParticipatingServer>? participatingServers;

  /// The status of the Job.
  final JobStatus? status;

  /// A list of tags associated with the Job.
  final Map<String, String>? tags;

  /// The type of the Job.
  final JobType? type;

  Job({
    required this.jobID,
    this.arn,
    this.creationDateTime,
    this.endDateTime,
    this.initiatedBy,
    this.participatingServers,
    this.status,
    this.tags,
    this.type,
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      jobID: json['jobID'] as String,
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      initiatedBy: (json['initiatedBy'] as String?)?.toInitiatedBy(),
      participatingServers: (json['participatingServers'] as List?)
          ?.whereNotNull()
          .map((e) => ParticipatingServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: (json['status'] as String?)?.toJobStatus(),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      type: (json['type'] as String?)?.toJobType(),
    );
  }

  Map<String, dynamic> toJson() {
    final jobID = this.jobID;
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final initiatedBy = this.initiatedBy;
    final participatingServers = this.participatingServers;
    final status = this.status;
    final tags = this.tags;
    final type = this.type;
    return {
      'jobID': jobID,
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (initiatedBy != null) 'initiatedBy': initiatedBy.toValue(),
      if (participatingServers != null)
        'participatingServers': participatingServers,
      if (status != null) 'status': status.toValue(),
      if (tags != null) 'tags': tags,
      if (type != null) 'type': type.toValue(),
    };
  }
}

/// A log outputted by a Job.
class JobLog {
  /// The event represents the type of a log.
  final JobLogEvent? event;

  /// Metadata associated with a Job log.
  final JobLogEventData? eventData;

  /// The date and time the log was taken.
  final String? logDateTime;

  JobLog({
    this.event,
    this.eventData,
    this.logDateTime,
  });

  factory JobLog.fromJson(Map<String, dynamic> json) {
    return JobLog(
      event: (json['event'] as String?)?.toJobLogEvent(),
      eventData: json['eventData'] != null
          ? JobLogEventData.fromJson(json['eventData'] as Map<String, dynamic>)
          : null,
      logDateTime: json['logDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final event = this.event;
    final eventData = this.eventData;
    final logDateTime = this.logDateTime;
    return {
      if (event != null) 'event': event.toValue(),
      if (eventData != null) 'eventData': eventData,
      if (logDateTime != null) 'logDateTime': logDateTime,
    };
  }
}

enum JobLogEvent {
  jobStart,
  serverSkipped,
  cleanupStart,
  cleanupEnd,
  cleanupFail,
  snapshotStart,
  snapshotEnd,
  snapshotFail,
  usingPreviousSnapshot,
  usingPreviousSnapshotFailed,
  conversionStart,
  conversionEnd,
  conversionFail,
  launchStart,
  launchFailed,
  jobCancel,
  jobEnd,
}

extension JobLogEventValueExtension on JobLogEvent {
  String toValue() {
    switch (this) {
      case JobLogEvent.jobStart:
        return 'JOB_START';
      case JobLogEvent.serverSkipped:
        return 'SERVER_SKIPPED';
      case JobLogEvent.cleanupStart:
        return 'CLEANUP_START';
      case JobLogEvent.cleanupEnd:
        return 'CLEANUP_END';
      case JobLogEvent.cleanupFail:
        return 'CLEANUP_FAIL';
      case JobLogEvent.snapshotStart:
        return 'SNAPSHOT_START';
      case JobLogEvent.snapshotEnd:
        return 'SNAPSHOT_END';
      case JobLogEvent.snapshotFail:
        return 'SNAPSHOT_FAIL';
      case JobLogEvent.usingPreviousSnapshot:
        return 'USING_PREVIOUS_SNAPSHOT';
      case JobLogEvent.usingPreviousSnapshotFailed:
        return 'USING_PREVIOUS_SNAPSHOT_FAILED';
      case JobLogEvent.conversionStart:
        return 'CONVERSION_START';
      case JobLogEvent.conversionEnd:
        return 'CONVERSION_END';
      case JobLogEvent.conversionFail:
        return 'CONVERSION_FAIL';
      case JobLogEvent.launchStart:
        return 'LAUNCH_START';
      case JobLogEvent.launchFailed:
        return 'LAUNCH_FAILED';
      case JobLogEvent.jobCancel:
        return 'JOB_CANCEL';
      case JobLogEvent.jobEnd:
        return 'JOB_END';
    }
  }
}

extension JobLogEventFromString on String {
  JobLogEvent toJobLogEvent() {
    switch (this) {
      case 'JOB_START':
        return JobLogEvent.jobStart;
      case 'SERVER_SKIPPED':
        return JobLogEvent.serverSkipped;
      case 'CLEANUP_START':
        return JobLogEvent.cleanupStart;
      case 'CLEANUP_END':
        return JobLogEvent.cleanupEnd;
      case 'CLEANUP_FAIL':
        return JobLogEvent.cleanupFail;
      case 'SNAPSHOT_START':
        return JobLogEvent.snapshotStart;
      case 'SNAPSHOT_END':
        return JobLogEvent.snapshotEnd;
      case 'SNAPSHOT_FAIL':
        return JobLogEvent.snapshotFail;
      case 'USING_PREVIOUS_SNAPSHOT':
        return JobLogEvent.usingPreviousSnapshot;
      case 'USING_PREVIOUS_SNAPSHOT_FAILED':
        return JobLogEvent.usingPreviousSnapshotFailed;
      case 'CONVERSION_START':
        return JobLogEvent.conversionStart;
      case 'CONVERSION_END':
        return JobLogEvent.conversionEnd;
      case 'CONVERSION_FAIL':
        return JobLogEvent.conversionFail;
      case 'LAUNCH_START':
        return JobLogEvent.launchStart;
      case 'LAUNCH_FAILED':
        return JobLogEvent.launchFailed;
      case 'JOB_CANCEL':
        return JobLogEvent.jobCancel;
      case 'JOB_END':
        return JobLogEvent.jobEnd;
    }
    throw Exception('$this is not known in enum JobLogEvent');
  }
}

/// Metadata associated with a Job log.
class JobLogEventData {
  /// Properties of a conversion job
  final ConversionProperties? conversionProperties;

  /// The ID of a conversion server.
  final String? conversionServerID;

  /// A string representing a job error.
  final String? rawError;

  /// The ID of a Source Server.
  final String? sourceServerID;

  /// The ID of a Recovery Instance.
  final String? targetInstanceID;

  JobLogEventData({
    this.conversionProperties,
    this.conversionServerID,
    this.rawError,
    this.sourceServerID,
    this.targetInstanceID,
  });

  factory JobLogEventData.fromJson(Map<String, dynamic> json) {
    return JobLogEventData(
      conversionProperties: json['conversionProperties'] != null
          ? ConversionProperties.fromJson(
              json['conversionProperties'] as Map<String, dynamic>)
          : null,
      conversionServerID: json['conversionServerID'] as String?,
      rawError: json['rawError'] as String?,
      sourceServerID: json['sourceServerID'] as String?,
      targetInstanceID: json['targetInstanceID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversionProperties = this.conversionProperties;
    final conversionServerID = this.conversionServerID;
    final rawError = this.rawError;
    final sourceServerID = this.sourceServerID;
    final targetInstanceID = this.targetInstanceID;
    return {
      if (conversionProperties != null)
        'conversionProperties': conversionProperties,
      if (conversionServerID != null) 'conversionServerID': conversionServerID,
      if (rawError != null) 'rawError': rawError,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (targetInstanceID != null) 'targetInstanceID': targetInstanceID,
    };
  }
}

enum JobStatus {
  pending,
  started,
  completed,
}

extension JobStatusValueExtension on JobStatus {
  String toValue() {
    switch (this) {
      case JobStatus.pending:
        return 'PENDING';
      case JobStatus.started:
        return 'STARTED';
      case JobStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension JobStatusFromString on String {
  JobStatus toJobStatus() {
    switch (this) {
      case 'PENDING':
        return JobStatus.pending;
      case 'STARTED':
        return JobStatus.started;
      case 'COMPLETED':
        return JobStatus.completed;
    }
    throw Exception('$this is not known in enum JobStatus');
  }
}

enum JobType {
  launch,
  terminate,
  createConvertedSnapshot,
}

extension JobTypeValueExtension on JobType {
  String toValue() {
    switch (this) {
      case JobType.launch:
        return 'LAUNCH';
      case JobType.terminate:
        return 'TERMINATE';
      case JobType.createConvertedSnapshot:
        return 'CREATE_CONVERTED_SNAPSHOT';
    }
  }
}

extension JobTypeFromString on String {
  JobType toJobType() {
    switch (this) {
      case 'LAUNCH':
        return JobType.launch;
      case 'TERMINATE':
        return JobType.terminate;
      case 'CREATE_CONVERTED_SNAPSHOT':
        return JobType.createConvertedSnapshot;
    }
    throw Exception('$this is not known in enum JobType');
  }
}

enum LastLaunchResult {
  notStarted,
  pending,
  succeeded,
  failed,
}

extension LastLaunchResultValueExtension on LastLaunchResult {
  String toValue() {
    switch (this) {
      case LastLaunchResult.notStarted:
        return 'NOT_STARTED';
      case LastLaunchResult.pending:
        return 'PENDING';
      case LastLaunchResult.succeeded:
        return 'SUCCEEDED';
      case LastLaunchResult.failed:
        return 'FAILED';
    }
  }
}

extension LastLaunchResultFromString on String {
  LastLaunchResult toLastLaunchResult() {
    switch (this) {
      case 'NOT_STARTED':
        return LastLaunchResult.notStarted;
      case 'PENDING':
        return LastLaunchResult.pending;
      case 'SUCCEEDED':
        return LastLaunchResult.succeeded;
      case 'FAILED':
        return LastLaunchResult.failed;
    }
    throw Exception('$this is not known in enum LastLaunchResult');
  }
}

enum LastLaunchType {
  recovery,
  drill,
}

extension LastLaunchTypeValueExtension on LastLaunchType {
  String toValue() {
    switch (this) {
      case LastLaunchType.recovery:
        return 'RECOVERY';
      case LastLaunchType.drill:
        return 'DRILL';
    }
  }
}

extension LastLaunchTypeFromString on String {
  LastLaunchType toLastLaunchType() {
    switch (this) {
      case 'RECOVERY':
        return LastLaunchType.recovery;
      case 'DRILL':
        return LastLaunchType.drill;
    }
    throw Exception('$this is not known in enum LastLaunchType');
  }
}

class LaunchConfiguration {
  /// Whether we should copy the Private IP of the Source Server to the Recovery
  /// Instance.
  final bool? copyPrivateIp;

  /// Whether we want to copy the tags of the Source Server to the EC2 machine of
  /// the Recovery Instance.
  final bool? copyTags;

  /// The EC2 launch template ID of this launch configuration.
  final String? ec2LaunchTemplateID;

  /// The state of the Recovery Instance in EC2 after the recovery operation.
  final LaunchDisposition? launchDisposition;

  /// The licensing configuration to be used for this launch configuration.
  final Licensing? licensing;

  /// The name of the launch configuration.
  final String? name;

  /// The ID of the Source Server for this launch configuration.
  final String? sourceServerID;

  /// Whether Elastic Disaster Recovery should try to automatically choose the
  /// instance type that best matches the OS, CPU, and RAM of your Source Server.
  final TargetInstanceTypeRightSizingMethod?
      targetInstanceTypeRightSizingMethod;

  LaunchConfiguration({
    this.copyPrivateIp,
    this.copyTags,
    this.ec2LaunchTemplateID,
    this.launchDisposition,
    this.licensing,
    this.name,
    this.sourceServerID,
    this.targetInstanceTypeRightSizingMethod,
  });

  factory LaunchConfiguration.fromJson(Map<String, dynamic> json) {
    return LaunchConfiguration(
      copyPrivateIp: json['copyPrivateIp'] as bool?,
      copyTags: json['copyTags'] as bool?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      launchDisposition:
          (json['launchDisposition'] as String?)?.toLaunchDisposition(),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      sourceServerID: json['sourceServerID'] as String?,
      targetInstanceTypeRightSizingMethod:
          (json['targetInstanceTypeRightSizingMethod'] as String?)
              ?.toTargetInstanceTypeRightSizingMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final copyPrivateIp = this.copyPrivateIp;
    final copyTags = this.copyTags;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final name = this.name;
    final sourceServerID = this.sourceServerID;
    final targetInstanceTypeRightSizingMethod =
        this.targetInstanceTypeRightSizingMethod;
    return {
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (name != null) 'name': name,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.toValue(),
    };
  }
}

/// Account level Launch Configuration Template.
class LaunchConfigurationTemplate {
  /// ARN of the Launch Configuration Template.
  final String? arn;

  /// Copy private IP.
  final bool? copyPrivateIp;

  /// Copy tags.
  final bool? copyTags;

  /// ID of the Launch Configuration Template.
  final String? launchConfigurationTemplateID;

  /// Launch disposition.
  final LaunchDisposition? launchDisposition;

  /// Licensing.
  final Licensing? licensing;

  /// Tags of the Launch Configuration Template.
  final Map<String, String>? tags;

  /// Target instance type right-sizing method.
  final TargetInstanceTypeRightSizingMethod?
      targetInstanceTypeRightSizingMethod;

  LaunchConfigurationTemplate({
    this.arn,
    this.copyPrivateIp,
    this.copyTags,
    this.launchConfigurationTemplateID,
    this.launchDisposition,
    this.licensing,
    this.tags,
    this.targetInstanceTypeRightSizingMethod,
  });

  factory LaunchConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return LaunchConfigurationTemplate(
      arn: json['arn'] as String?,
      copyPrivateIp: json['copyPrivateIp'] as bool?,
      copyTags: json['copyTags'] as bool?,
      launchConfigurationTemplateID:
          json['launchConfigurationTemplateID'] as String?,
      launchDisposition:
          (json['launchDisposition'] as String?)?.toLaunchDisposition(),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetInstanceTypeRightSizingMethod:
          (json['targetInstanceTypeRightSizingMethod'] as String?)
              ?.toTargetInstanceTypeRightSizingMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final copyPrivateIp = this.copyPrivateIp;
    final copyTags = this.copyTags;
    final launchConfigurationTemplateID = this.launchConfigurationTemplateID;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final tags = this.tags;
    final targetInstanceTypeRightSizingMethod =
        this.targetInstanceTypeRightSizingMethod;
    return {
      if (arn != null) 'arn': arn,
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (launchConfigurationTemplateID != null)
        'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (tags != null) 'tags': tags,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.toValue(),
    };
  }
}

enum LaunchDisposition {
  stopped,
  started,
}

extension LaunchDispositionValueExtension on LaunchDisposition {
  String toValue() {
    switch (this) {
      case LaunchDisposition.stopped:
        return 'STOPPED';
      case LaunchDisposition.started:
        return 'STARTED';
    }
  }
}

extension LaunchDispositionFromString on String {
  LaunchDisposition toLaunchDisposition() {
    switch (this) {
      case 'STOPPED':
        return LaunchDisposition.stopped;
      case 'STARTED':
        return LaunchDisposition.started;
    }
    throw Exception('$this is not known in enum LaunchDisposition');
  }
}

enum LaunchStatus {
  pending,
  inProgress,
  launched,
  failed,
  terminated,
}

extension LaunchStatusValueExtension on LaunchStatus {
  String toValue() {
    switch (this) {
      case LaunchStatus.pending:
        return 'PENDING';
      case LaunchStatus.inProgress:
        return 'IN_PROGRESS';
      case LaunchStatus.launched:
        return 'LAUNCHED';
      case LaunchStatus.failed:
        return 'FAILED';
      case LaunchStatus.terminated:
        return 'TERMINATED';
    }
  }
}

extension LaunchStatusFromString on String {
  LaunchStatus toLaunchStatus() {
    switch (this) {
      case 'PENDING':
        return LaunchStatus.pending;
      case 'IN_PROGRESS':
        return LaunchStatus.inProgress;
      case 'LAUNCHED':
        return LaunchStatus.launched;
      case 'FAILED':
        return LaunchStatus.failed;
      case 'TERMINATED':
        return LaunchStatus.terminated;
    }
    throw Exception('$this is not known in enum LaunchStatus');
  }
}

/// Configuration of a machine's license.
class Licensing {
  /// Whether to enable "Bring your own license" or not.
  final bool? osByol;

  Licensing({
    this.osByol,
  });

  factory Licensing.fromJson(Map<String, dynamic> json) {
    return Licensing(
      osByol: json['osByol'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final osByol = this.osByol;
    return {
      if (osByol != null) 'osByol': osByol,
    };
  }
}

/// An object representing the Source Server Lifecycle.
class LifeCycle {
  /// The date and time of when the Source Server was added to the service.
  final String? addedToServiceDateTime;

  /// The amount of time that the Source Server has been replicating for.
  final String? elapsedReplicationDuration;

  /// The date and time of the first byte that was replicated from the Source
  /// Server.
  final String? firstByteDateTime;

  /// An object containing information regarding the last launch of the Source
  /// Server.
  final LifeCycleLastLaunch? lastLaunch;

  /// The date and time this Source Server was last seen by the service.
  final String? lastSeenByServiceDateTime;

  LifeCycle({
    this.addedToServiceDateTime,
    this.elapsedReplicationDuration,
    this.firstByteDateTime,
    this.lastLaunch,
    this.lastSeenByServiceDateTime,
  });

  factory LifeCycle.fromJson(Map<String, dynamic> json) {
    return LifeCycle(
      addedToServiceDateTime: json['addedToServiceDateTime'] as String?,
      elapsedReplicationDuration: json['elapsedReplicationDuration'] as String?,
      firstByteDateTime: json['firstByteDateTime'] as String?,
      lastLaunch: json['lastLaunch'] != null
          ? LifeCycleLastLaunch.fromJson(
              json['lastLaunch'] as Map<String, dynamic>)
          : null,
      lastSeenByServiceDateTime: json['lastSeenByServiceDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final addedToServiceDateTime = this.addedToServiceDateTime;
    final elapsedReplicationDuration = this.elapsedReplicationDuration;
    final firstByteDateTime = this.firstByteDateTime;
    final lastLaunch = this.lastLaunch;
    final lastSeenByServiceDateTime = this.lastSeenByServiceDateTime;
    return {
      if (addedToServiceDateTime != null)
        'addedToServiceDateTime': addedToServiceDateTime,
      if (elapsedReplicationDuration != null)
        'elapsedReplicationDuration': elapsedReplicationDuration,
      if (firstByteDateTime != null) 'firstByteDateTime': firstByteDateTime,
      if (lastLaunch != null) 'lastLaunch': lastLaunch,
      if (lastSeenByServiceDateTime != null)
        'lastSeenByServiceDateTime': lastSeenByServiceDateTime,
    };
  }
}

/// An object containing information regarding the last launch of a Source
/// Server.
class LifeCycleLastLaunch {
  /// An object containing information regarding the initiation of the last launch
  /// of a Source Server.
  final LifeCycleLastLaunchInitiated? initiated;

  /// Status of Source Server's last launch.
  final LaunchStatus? status;

  LifeCycleLastLaunch({
    this.initiated,
    this.status,
  });

  factory LifeCycleLastLaunch.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastLaunch(
      initiated: json['initiated'] != null
          ? LifeCycleLastLaunchInitiated.fromJson(
              json['initiated'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toLaunchStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final initiated = this.initiated;
    final status = this.status;
    return {
      if (initiated != null) 'initiated': initiated,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// An object containing information regarding the initiation of the last launch
/// of a Source Server.
class LifeCycleLastLaunchInitiated {
  /// The date and time the last Source Server launch was initiated.
  final String? apiCallDateTime;

  /// The ID of the Job that was used to last launch the Source Server.
  final String? jobID;

  /// The Job type that was used to last launch the Source Server.
  final LastLaunchType? type;

  LifeCycleLastLaunchInitiated({
    this.apiCallDateTime,
    this.jobID,
    this.type,
  });

  factory LifeCycleLastLaunchInitiated.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastLaunchInitiated(
      apiCallDateTime: json['apiCallDateTime'] as String?,
      jobID: json['jobID'] as String?,
      type: (json['type'] as String?)?.toLastLaunchType(),
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    final jobID = this.jobID;
    final type = this.type;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
      if (jobID != null) 'jobID': jobID,
      if (type != null) 'type': type.toValue(),
    };
  }
}

class ListExtensibleSourceServersResponse {
  /// A list of source servers on a staging Account that are extensible.
  final List<StagingSourceServer>? items;

  /// The token of the next extensible source server to retrieve.
  final String? nextToken;

  ListExtensibleSourceServersResponse({
    this.items,
    this.nextToken,
  });

  factory ListExtensibleSourceServersResponse.fromJson(
      Map<String, dynamic> json) {
    return ListExtensibleSourceServersResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => StagingSourceServer.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      if (items != null) 'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListStagingAccountsResponse {
  /// An array of staging AWS Accounts.
  final List<Account>? accounts;

  /// The token of the next staging Account to retrieve.
  final String? nextToken;

  ListStagingAccountsResponse({
    this.accounts,
    this.nextToken,
  });

  factory ListStagingAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListStagingAccountsResponse(
      accounts: (json['accounts'] as List?)
          ?.whereNotNull()
          .map((e) => Account.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accounts = this.accounts;
    final nextToken = this.nextToken;
    return {
      if (accounts != null) 'accounts': accounts,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListTagsForResourceResponse {
  /// The tags of the requested resource.
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

/// Network interface.
class NetworkInterface {
  /// Network interface IPs.
  final List<String>? ips;

  /// Whether this is the primary network interface.
  final bool? isPrimary;

  /// The MAC address of the network interface.
  final String? macAddress;

  NetworkInterface({
    this.ips,
    this.isPrimary,
    this.macAddress,
  });

  factory NetworkInterface.fromJson(Map<String, dynamic> json) {
    return NetworkInterface(
      ips: (json['ips'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      isPrimary: json['isPrimary'] as bool?,
      macAddress: json['macAddress'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ips = this.ips;
    final isPrimary = this.isPrimary;
    final macAddress = this.macAddress;
    return {
      if (ips != null) 'ips': ips,
      if (isPrimary != null) 'isPrimary': isPrimary,
      if (macAddress != null) 'macAddress': macAddress,
    };
  }
}

/// Operating System.
class OS {
  /// The long name of the Operating System.
  final String? fullString;

  OS({
    this.fullString,
  });

  factory OS.fromJson(Map<String, dynamic> json) {
    return OS(
      fullString: json['fullString'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final fullString = this.fullString;
    return {
      if (fullString != null) 'fullString': fullString,
    };
  }
}

enum OriginEnvironment {
  onPremises,
  aws,
}

extension OriginEnvironmentValueExtension on OriginEnvironment {
  String toValue() {
    switch (this) {
      case OriginEnvironment.onPremises:
        return 'ON_PREMISES';
      case OriginEnvironment.aws:
        return 'AWS';
    }
  }
}

extension OriginEnvironmentFromString on String {
  OriginEnvironment toOriginEnvironment() {
    switch (this) {
      case 'ON_PREMISES':
        return OriginEnvironment.onPremises;
      case 'AWS':
        return OriginEnvironment.aws;
    }
    throw Exception('$this is not known in enum OriginEnvironment');
  }
}

/// A rule in the Point in Time (PIT) policy representing when to take snapshots
/// and how long to retain them for.
class PITPolicyRule {
  /// How often, in the chosen units, a snapshot should be taken.
  final int interval;

  /// The duration to retain a snapshot for, in the chosen units.
  final int retentionDuration;

  /// The units used to measure the interval and retentionDuration.
  final PITPolicyRuleUnits units;

  /// Whether this rule is enabled or not.
  final bool? enabled;

  /// The ID of the rule.
  final int? ruleID;

  PITPolicyRule({
    required this.interval,
    required this.retentionDuration,
    required this.units,
    this.enabled,
    this.ruleID,
  });

  factory PITPolicyRule.fromJson(Map<String, dynamic> json) {
    return PITPolicyRule(
      interval: json['interval'] as int,
      retentionDuration: json['retentionDuration'] as int,
      units: (json['units'] as String).toPITPolicyRuleUnits(),
      enabled: json['enabled'] as bool?,
      ruleID: json['ruleID'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final interval = this.interval;
    final retentionDuration = this.retentionDuration;
    final units = this.units;
    final enabled = this.enabled;
    final ruleID = this.ruleID;
    return {
      'interval': interval,
      'retentionDuration': retentionDuration,
      'units': units.toValue(),
      if (enabled != null) 'enabled': enabled,
      if (ruleID != null) 'ruleID': ruleID,
    };
  }
}

enum PITPolicyRuleUnits {
  minute,
  hour,
  day,
}

extension PITPolicyRuleUnitsValueExtension on PITPolicyRuleUnits {
  String toValue() {
    switch (this) {
      case PITPolicyRuleUnits.minute:
        return 'MINUTE';
      case PITPolicyRuleUnits.hour:
        return 'HOUR';
      case PITPolicyRuleUnits.day:
        return 'DAY';
    }
  }
}

extension PITPolicyRuleUnitsFromString on String {
  PITPolicyRuleUnits toPITPolicyRuleUnits() {
    switch (this) {
      case 'MINUTE':
        return PITPolicyRuleUnits.minute;
      case 'HOUR':
        return PITPolicyRuleUnits.hour;
      case 'DAY':
        return PITPolicyRuleUnits.day;
    }
    throw Exception('$this is not known in enum PITPolicyRuleUnits');
  }
}

/// Represents a server participating in an asynchronous Job.
class ParticipatingServer {
  /// The launch status of a participating server.
  final LaunchStatus? launchStatus;

  /// The Recovery Instance ID of a participating server.
  final String? recoveryInstanceID;

  /// The Source Server ID of a participating server.
  final String? sourceServerID;

  ParticipatingServer({
    this.launchStatus,
    this.recoveryInstanceID,
    this.sourceServerID,
  });

  factory ParticipatingServer.fromJson(Map<String, dynamic> json) {
    return ParticipatingServer(
      launchStatus: (json['launchStatus'] as String?)?.toLaunchStatus(),
      recoveryInstanceID: json['recoveryInstanceID'] as String?,
      sourceServerID: json['sourceServerID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final launchStatus = this.launchStatus;
    final recoveryInstanceID = this.recoveryInstanceID;
    final sourceServerID = this.sourceServerID;
    return {
      if (launchStatus != null) 'launchStatus': launchStatus.toValue(),
      if (recoveryInstanceID != null) 'recoveryInstanceID': recoveryInstanceID,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
    };
  }
}

/// A Recovery Instance is a replica of a Source Server running on EC2.
class RecoveryInstance {
  /// The ARN of the Recovery Instance.
  final String? arn;

  /// The Data Replication Info of the Recovery Instance.
  final RecoveryInstanceDataReplicationInfo? dataReplicationInfo;

  /// The EC2 instance ID of the Recovery Instance.
  final String? ec2InstanceID;

  /// The state of the EC2 instance for this Recovery Instance.
  final EC2InstanceState? ec2InstanceState;

  /// An object representing failback related information of the Recovery
  /// Instance.
  final RecoveryInstanceFailback? failback;

  /// Whether this Recovery Instance was created for a drill or for an actual
  /// Recovery event.
  final bool? isDrill;

  /// The ID of the Job that created the Recovery Instance.
  final String? jobID;

  /// AWS availability zone associated with the recovery instance.
  final String? originAvailabilityZone;

  /// Environment (On Premises / AWS) of the instance that the recovery instance
  /// originated from.
  final OriginEnvironment? originEnvironment;

  /// The date and time of the Point in Time (PIT) snapshot that this Recovery
  /// Instance was launched from.
  final String? pointInTimeSnapshotDateTime;

  /// The ID of the Recovery Instance.
  final String? recoveryInstanceID;

  /// Properties of the Recovery Instance machine.
  final RecoveryInstanceProperties? recoveryInstanceProperties;

  /// The Source Server ID that this Recovery Instance is associated with.
  final String? sourceServerID;

  /// An array of tags that are associated with the Recovery Instance.
  final Map<String, String>? tags;

  RecoveryInstance({
    this.arn,
    this.dataReplicationInfo,
    this.ec2InstanceID,
    this.ec2InstanceState,
    this.failback,
    this.isDrill,
    this.jobID,
    this.originAvailabilityZone,
    this.originEnvironment,
    this.pointInTimeSnapshotDateTime,
    this.recoveryInstanceID,
    this.recoveryInstanceProperties,
    this.sourceServerID,
    this.tags,
  });

  factory RecoveryInstance.fromJson(Map<String, dynamic> json) {
    return RecoveryInstance(
      arn: json['arn'] as String?,
      dataReplicationInfo: json['dataReplicationInfo'] != null
          ? RecoveryInstanceDataReplicationInfo.fromJson(
              json['dataReplicationInfo'] as Map<String, dynamic>)
          : null,
      ec2InstanceID: json['ec2InstanceID'] as String?,
      ec2InstanceState:
          (json['ec2InstanceState'] as String?)?.toEC2InstanceState(),
      failback: json['failback'] != null
          ? RecoveryInstanceFailback.fromJson(
              json['failback'] as Map<String, dynamic>)
          : null,
      isDrill: json['isDrill'] as bool?,
      jobID: json['jobID'] as String?,
      originAvailabilityZone: json['originAvailabilityZone'] as String?,
      originEnvironment:
          (json['originEnvironment'] as String?)?.toOriginEnvironment(),
      pointInTimeSnapshotDateTime:
          json['pointInTimeSnapshotDateTime'] as String?,
      recoveryInstanceID: json['recoveryInstanceID'] as String?,
      recoveryInstanceProperties: json['recoveryInstanceProperties'] != null
          ? RecoveryInstanceProperties.fromJson(
              json['recoveryInstanceProperties'] as Map<String, dynamic>)
          : null,
      sourceServerID: json['sourceServerID'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataReplicationInfo = this.dataReplicationInfo;
    final ec2InstanceID = this.ec2InstanceID;
    final ec2InstanceState = this.ec2InstanceState;
    final failback = this.failback;
    final isDrill = this.isDrill;
    final jobID = this.jobID;
    final originAvailabilityZone = this.originAvailabilityZone;
    final originEnvironment = this.originEnvironment;
    final pointInTimeSnapshotDateTime = this.pointInTimeSnapshotDateTime;
    final recoveryInstanceID = this.recoveryInstanceID;
    final recoveryInstanceProperties = this.recoveryInstanceProperties;
    final sourceServerID = this.sourceServerID;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dataReplicationInfo != null)
        'dataReplicationInfo': dataReplicationInfo,
      if (ec2InstanceID != null) 'ec2InstanceID': ec2InstanceID,
      if (ec2InstanceState != null)
        'ec2InstanceState': ec2InstanceState.toValue(),
      if (failback != null) 'failback': failback,
      if (isDrill != null) 'isDrill': isDrill,
      if (jobID != null) 'jobID': jobID,
      if (originAvailabilityZone != null)
        'originAvailabilityZone': originAvailabilityZone,
      if (originEnvironment != null)
        'originEnvironment': originEnvironment.toValue(),
      if (pointInTimeSnapshotDateTime != null)
        'pointInTimeSnapshotDateTime': pointInTimeSnapshotDateTime,
      if (recoveryInstanceID != null) 'recoveryInstanceID': recoveryInstanceID,
      if (recoveryInstanceProperties != null)
        'recoveryInstanceProperties': recoveryInstanceProperties,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Error in data replication.
class RecoveryInstanceDataReplicationError {
  /// Error in data replication.
  final FailbackReplicationError? error;

  /// Error in data replication.
  final String? rawError;

  RecoveryInstanceDataReplicationError({
    this.error,
    this.rawError,
  });

  factory RecoveryInstanceDataReplicationError.fromJson(
      Map<String, dynamic> json) {
    return RecoveryInstanceDataReplicationError(
      error: (json['error'] as String?)?.toFailbackReplicationError(),
      rawError: json['rawError'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final error = this.error;
    final rawError = this.rawError;
    return {
      if (error != null) 'error': error.toValue(),
      if (rawError != null) 'rawError': rawError,
    };
  }
}

/// Information about Data Replication
class RecoveryInstanceDataReplicationInfo {
  /// Information about Data Replication
  final RecoveryInstanceDataReplicationError? dataReplicationError;

  /// Information about whether the data replication has been initiated.
  final RecoveryInstanceDataReplicationInitiation? dataReplicationInitiation;

  /// The state of the data replication.
  final RecoveryInstanceDataReplicationState? dataReplicationState;

  /// An estimate of when the data replication will be completed.
  final String? etaDateTime;

  /// Data replication lag duration.
  final String? lagDuration;

  /// The disks that should be replicated.
  final List<RecoveryInstanceDataReplicationInfoReplicatedDisk>?
      replicatedDisks;

  /// AWS Availability zone into which data is being replicated.
  final String? stagingAvailabilityZone;

  RecoveryInstanceDataReplicationInfo({
    this.dataReplicationError,
    this.dataReplicationInitiation,
    this.dataReplicationState,
    this.etaDateTime,
    this.lagDuration,
    this.replicatedDisks,
    this.stagingAvailabilityZone,
  });

  factory RecoveryInstanceDataReplicationInfo.fromJson(
      Map<String, dynamic> json) {
    return RecoveryInstanceDataReplicationInfo(
      dataReplicationError: json['dataReplicationError'] != null
          ? RecoveryInstanceDataReplicationError.fromJson(
              json['dataReplicationError'] as Map<String, dynamic>)
          : null,
      dataReplicationInitiation: json['dataReplicationInitiation'] != null
          ? RecoveryInstanceDataReplicationInitiation.fromJson(
              json['dataReplicationInitiation'] as Map<String, dynamic>)
          : null,
      dataReplicationState: (json['dataReplicationState'] as String?)
          ?.toRecoveryInstanceDataReplicationState(),
      etaDateTime: json['etaDateTime'] as String?,
      lagDuration: json['lagDuration'] as String?,
      replicatedDisks: (json['replicatedDisks'] as List?)
          ?.whereNotNull()
          .map((e) =>
              RecoveryInstanceDataReplicationInfoReplicatedDisk.fromJson(
                  e as Map<String, dynamic>))
          .toList(),
      stagingAvailabilityZone: json['stagingAvailabilityZone'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplicationError = this.dataReplicationError;
    final dataReplicationInitiation = this.dataReplicationInitiation;
    final dataReplicationState = this.dataReplicationState;
    final etaDateTime = this.etaDateTime;
    final lagDuration = this.lagDuration;
    final replicatedDisks = this.replicatedDisks;
    final stagingAvailabilityZone = this.stagingAvailabilityZone;
    return {
      if (dataReplicationError != null)
        'dataReplicationError': dataReplicationError,
      if (dataReplicationInitiation != null)
        'dataReplicationInitiation': dataReplicationInitiation,
      if (dataReplicationState != null)
        'dataReplicationState': dataReplicationState.toValue(),
      if (etaDateTime != null) 'etaDateTime': etaDateTime,
      if (lagDuration != null) 'lagDuration': lagDuration,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (stagingAvailabilityZone != null)
        'stagingAvailabilityZone': stagingAvailabilityZone,
    };
  }
}

/// A disk that should be replicated.
class RecoveryInstanceDataReplicationInfoReplicatedDisk {
  /// The size of the replication backlog in bytes.
  final int? backloggedStorageBytes;

  /// The name of the device.
  final String? deviceName;

  /// The amount of data replicated so far in bytes.
  final int? replicatedStorageBytes;

  /// The amount of data to be rescanned in bytes.
  final int? rescannedStorageBytes;

  /// The total amount of data to be replicated in bytes.
  final int? totalStorageBytes;

  RecoveryInstanceDataReplicationInfoReplicatedDisk({
    this.backloggedStorageBytes,
    this.deviceName,
    this.replicatedStorageBytes,
    this.rescannedStorageBytes,
    this.totalStorageBytes,
  });

  factory RecoveryInstanceDataReplicationInfoReplicatedDisk.fromJson(
      Map<String, dynamic> json) {
    return RecoveryInstanceDataReplicationInfoReplicatedDisk(
      backloggedStorageBytes: json['backloggedStorageBytes'] as int?,
      deviceName: json['deviceName'] as String?,
      replicatedStorageBytes: json['replicatedStorageBytes'] as int?,
      rescannedStorageBytes: json['rescannedStorageBytes'] as int?,
      totalStorageBytes: json['totalStorageBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final backloggedStorageBytes = this.backloggedStorageBytes;
    final deviceName = this.deviceName;
    final replicatedStorageBytes = this.replicatedStorageBytes;
    final rescannedStorageBytes = this.rescannedStorageBytes;
    final totalStorageBytes = this.totalStorageBytes;
    return {
      if (backloggedStorageBytes != null)
        'backloggedStorageBytes': backloggedStorageBytes,
      if (deviceName != null) 'deviceName': deviceName,
      if (replicatedStorageBytes != null)
        'replicatedStorageBytes': replicatedStorageBytes,
      if (rescannedStorageBytes != null)
        'rescannedStorageBytes': rescannedStorageBytes,
      if (totalStorageBytes != null) 'totalStorageBytes': totalStorageBytes,
    };
  }
}

/// Data replication initiation.
class RecoveryInstanceDataReplicationInitiation {
  /// The date and time of the current attempt to initiate data replication.
  final String? startDateTime;

  /// The steps of the current attempt to initiate data replication.
  final List<RecoveryInstanceDataReplicationInitiationStep>? steps;

  RecoveryInstanceDataReplicationInitiation({
    this.startDateTime,
    this.steps,
  });

  factory RecoveryInstanceDataReplicationInitiation.fromJson(
      Map<String, dynamic> json) {
    return RecoveryInstanceDataReplicationInitiation(
      startDateTime: json['startDateTime'] as String?,
      steps: (json['steps'] as List?)
          ?.whereNotNull()
          .map((e) => RecoveryInstanceDataReplicationInitiationStep.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final startDateTime = this.startDateTime;
    final steps = this.steps;
    return {
      if (startDateTime != null) 'startDateTime': startDateTime,
      if (steps != null) 'steps': steps,
    };
  }
}

/// Data replication initiation step.
class RecoveryInstanceDataReplicationInitiationStep {
  /// The name of the step.
  final RecoveryInstanceDataReplicationInitiationStepName? name;

  /// The status of the step.
  final RecoveryInstanceDataReplicationInitiationStepStatus? status;

  RecoveryInstanceDataReplicationInitiationStep({
    this.name,
    this.status,
  });

  factory RecoveryInstanceDataReplicationInitiationStep.fromJson(
      Map<String, dynamic> json) {
    return RecoveryInstanceDataReplicationInitiationStep(
      name: (json['name'] as String?)
          ?.toRecoveryInstanceDataReplicationInitiationStepName(),
      status: (json['status'] as String?)
          ?.toRecoveryInstanceDataReplicationInitiationStepStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final status = this.status;
    return {
      if (name != null) 'name': name.toValue(),
      if (status != null) 'status': status.toValue(),
    };
  }
}

enum RecoveryInstanceDataReplicationInitiationStepName {
  linkFailbackClientWithRecoveryInstance,
  completeVolumeMapping,
  establishRecoveryInstanceCommunication,
  downloadReplicationSoftwareToFailbackClient,
  configureReplicationSoftware,
  pairAgentWithReplicationSoftware,
  establishAgentReplicatorSoftwareCommunication,
  wait,
  createSecurityGroup,
  launchReplicationServer,
  bootReplicationServer,
  authenticateWithService,
  downloadReplicationSoftware,
  createStagingDisks,
  attachStagingDisks,
  pairReplicationServerWithAgent,
  connectAgentToReplicationServer,
  startDataTransfer,
}

extension RecoveryInstanceDataReplicationInitiationStepNameValueExtension
    on RecoveryInstanceDataReplicationInitiationStepName {
  String toValue() {
    switch (this) {
      case RecoveryInstanceDataReplicationInitiationStepName
            .linkFailbackClientWithRecoveryInstance:
        return 'LINK_FAILBACK_CLIENT_WITH_RECOVERY_INSTANCE';
      case RecoveryInstanceDataReplicationInitiationStepName
            .completeVolumeMapping:
        return 'COMPLETE_VOLUME_MAPPING';
      case RecoveryInstanceDataReplicationInitiationStepName
            .establishRecoveryInstanceCommunication:
        return 'ESTABLISH_RECOVERY_INSTANCE_COMMUNICATION';
      case RecoveryInstanceDataReplicationInitiationStepName
            .downloadReplicationSoftwareToFailbackClient:
        return 'DOWNLOAD_REPLICATION_SOFTWARE_TO_FAILBACK_CLIENT';
      case RecoveryInstanceDataReplicationInitiationStepName
            .configureReplicationSoftware:
        return 'CONFIGURE_REPLICATION_SOFTWARE';
      case RecoveryInstanceDataReplicationInitiationStepName
            .pairAgentWithReplicationSoftware:
        return 'PAIR_AGENT_WITH_REPLICATION_SOFTWARE';
      case RecoveryInstanceDataReplicationInitiationStepName
            .establishAgentReplicatorSoftwareCommunication:
        return 'ESTABLISH_AGENT_REPLICATOR_SOFTWARE_COMMUNICATION';
      case RecoveryInstanceDataReplicationInitiationStepName.wait:
        return 'WAIT';
      case RecoveryInstanceDataReplicationInitiationStepName
            .createSecurityGroup:
        return 'CREATE_SECURITY_GROUP';
      case RecoveryInstanceDataReplicationInitiationStepName
            .launchReplicationServer:
        return 'LAUNCH_REPLICATION_SERVER';
      case RecoveryInstanceDataReplicationInitiationStepName
            .bootReplicationServer:
        return 'BOOT_REPLICATION_SERVER';
      case RecoveryInstanceDataReplicationInitiationStepName
            .authenticateWithService:
        return 'AUTHENTICATE_WITH_SERVICE';
      case RecoveryInstanceDataReplicationInitiationStepName
            .downloadReplicationSoftware:
        return 'DOWNLOAD_REPLICATION_SOFTWARE';
      case RecoveryInstanceDataReplicationInitiationStepName.createStagingDisks:
        return 'CREATE_STAGING_DISKS';
      case RecoveryInstanceDataReplicationInitiationStepName.attachStagingDisks:
        return 'ATTACH_STAGING_DISKS';
      case RecoveryInstanceDataReplicationInitiationStepName
            .pairReplicationServerWithAgent:
        return 'PAIR_REPLICATION_SERVER_WITH_AGENT';
      case RecoveryInstanceDataReplicationInitiationStepName
            .connectAgentToReplicationServer:
        return 'CONNECT_AGENT_TO_REPLICATION_SERVER';
      case RecoveryInstanceDataReplicationInitiationStepName.startDataTransfer:
        return 'START_DATA_TRANSFER';
    }
  }
}

extension RecoveryInstanceDataReplicationInitiationStepNameFromString
    on String {
  RecoveryInstanceDataReplicationInitiationStepName
      toRecoveryInstanceDataReplicationInitiationStepName() {
    switch (this) {
      case 'LINK_FAILBACK_CLIENT_WITH_RECOVERY_INSTANCE':
        return RecoveryInstanceDataReplicationInitiationStepName
            .linkFailbackClientWithRecoveryInstance;
      case 'COMPLETE_VOLUME_MAPPING':
        return RecoveryInstanceDataReplicationInitiationStepName
            .completeVolumeMapping;
      case 'ESTABLISH_RECOVERY_INSTANCE_COMMUNICATION':
        return RecoveryInstanceDataReplicationInitiationStepName
            .establishRecoveryInstanceCommunication;
      case 'DOWNLOAD_REPLICATION_SOFTWARE_TO_FAILBACK_CLIENT':
        return RecoveryInstanceDataReplicationInitiationStepName
            .downloadReplicationSoftwareToFailbackClient;
      case 'CONFIGURE_REPLICATION_SOFTWARE':
        return RecoveryInstanceDataReplicationInitiationStepName
            .configureReplicationSoftware;
      case 'PAIR_AGENT_WITH_REPLICATION_SOFTWARE':
        return RecoveryInstanceDataReplicationInitiationStepName
            .pairAgentWithReplicationSoftware;
      case 'ESTABLISH_AGENT_REPLICATOR_SOFTWARE_COMMUNICATION':
        return RecoveryInstanceDataReplicationInitiationStepName
            .establishAgentReplicatorSoftwareCommunication;
      case 'WAIT':
        return RecoveryInstanceDataReplicationInitiationStepName.wait;
      case 'CREATE_SECURITY_GROUP':
        return RecoveryInstanceDataReplicationInitiationStepName
            .createSecurityGroup;
      case 'LAUNCH_REPLICATION_SERVER':
        return RecoveryInstanceDataReplicationInitiationStepName
            .launchReplicationServer;
      case 'BOOT_REPLICATION_SERVER':
        return RecoveryInstanceDataReplicationInitiationStepName
            .bootReplicationServer;
      case 'AUTHENTICATE_WITH_SERVICE':
        return RecoveryInstanceDataReplicationInitiationStepName
            .authenticateWithService;
      case 'DOWNLOAD_REPLICATION_SOFTWARE':
        return RecoveryInstanceDataReplicationInitiationStepName
            .downloadReplicationSoftware;
      case 'CREATE_STAGING_DISKS':
        return RecoveryInstanceDataReplicationInitiationStepName
            .createStagingDisks;
      case 'ATTACH_STAGING_DISKS':
        return RecoveryInstanceDataReplicationInitiationStepName
            .attachStagingDisks;
      case 'PAIR_REPLICATION_SERVER_WITH_AGENT':
        return RecoveryInstanceDataReplicationInitiationStepName
            .pairReplicationServerWithAgent;
      case 'CONNECT_AGENT_TO_REPLICATION_SERVER':
        return RecoveryInstanceDataReplicationInitiationStepName
            .connectAgentToReplicationServer;
      case 'START_DATA_TRANSFER':
        return RecoveryInstanceDataReplicationInitiationStepName
            .startDataTransfer;
    }
    throw Exception(
        '$this is not known in enum RecoveryInstanceDataReplicationInitiationStepName');
  }
}

enum RecoveryInstanceDataReplicationInitiationStepStatus {
  notStarted,
  inProgress,
  succeeded,
  failed,
  skipped,
}

extension RecoveryInstanceDataReplicationInitiationStepStatusValueExtension
    on RecoveryInstanceDataReplicationInitiationStepStatus {
  String toValue() {
    switch (this) {
      case RecoveryInstanceDataReplicationInitiationStepStatus.notStarted:
        return 'NOT_STARTED';
      case RecoveryInstanceDataReplicationInitiationStepStatus.inProgress:
        return 'IN_PROGRESS';
      case RecoveryInstanceDataReplicationInitiationStepStatus.succeeded:
        return 'SUCCEEDED';
      case RecoveryInstanceDataReplicationInitiationStepStatus.failed:
        return 'FAILED';
      case RecoveryInstanceDataReplicationInitiationStepStatus.skipped:
        return 'SKIPPED';
    }
  }
}

extension RecoveryInstanceDataReplicationInitiationStepStatusFromString
    on String {
  RecoveryInstanceDataReplicationInitiationStepStatus
      toRecoveryInstanceDataReplicationInitiationStepStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return RecoveryInstanceDataReplicationInitiationStepStatus.notStarted;
      case 'IN_PROGRESS':
        return RecoveryInstanceDataReplicationInitiationStepStatus.inProgress;
      case 'SUCCEEDED':
        return RecoveryInstanceDataReplicationInitiationStepStatus.succeeded;
      case 'FAILED':
        return RecoveryInstanceDataReplicationInitiationStepStatus.failed;
      case 'SKIPPED':
        return RecoveryInstanceDataReplicationInitiationStepStatus.skipped;
    }
    throw Exception(
        '$this is not known in enum RecoveryInstanceDataReplicationInitiationStepStatus');
  }
}

enum RecoveryInstanceDataReplicationState {
  stopped,
  initiating,
  initialSync,
  backlog,
  creatingSnapshot,
  continuous,
  paused,
  rescan,
  stalled,
  disconnected,
  replicationStateNotAvailable,
  notStarted,
}

extension RecoveryInstanceDataReplicationStateValueExtension
    on RecoveryInstanceDataReplicationState {
  String toValue() {
    switch (this) {
      case RecoveryInstanceDataReplicationState.stopped:
        return 'STOPPED';
      case RecoveryInstanceDataReplicationState.initiating:
        return 'INITIATING';
      case RecoveryInstanceDataReplicationState.initialSync:
        return 'INITIAL_SYNC';
      case RecoveryInstanceDataReplicationState.backlog:
        return 'BACKLOG';
      case RecoveryInstanceDataReplicationState.creatingSnapshot:
        return 'CREATING_SNAPSHOT';
      case RecoveryInstanceDataReplicationState.continuous:
        return 'CONTINUOUS';
      case RecoveryInstanceDataReplicationState.paused:
        return 'PAUSED';
      case RecoveryInstanceDataReplicationState.rescan:
        return 'RESCAN';
      case RecoveryInstanceDataReplicationState.stalled:
        return 'STALLED';
      case RecoveryInstanceDataReplicationState.disconnected:
        return 'DISCONNECTED';
      case RecoveryInstanceDataReplicationState.replicationStateNotAvailable:
        return 'REPLICATION_STATE_NOT_AVAILABLE';
      case RecoveryInstanceDataReplicationState.notStarted:
        return 'NOT_STARTED';
    }
  }
}

extension RecoveryInstanceDataReplicationStateFromString on String {
  RecoveryInstanceDataReplicationState
      toRecoveryInstanceDataReplicationState() {
    switch (this) {
      case 'STOPPED':
        return RecoveryInstanceDataReplicationState.stopped;
      case 'INITIATING':
        return RecoveryInstanceDataReplicationState.initiating;
      case 'INITIAL_SYNC':
        return RecoveryInstanceDataReplicationState.initialSync;
      case 'BACKLOG':
        return RecoveryInstanceDataReplicationState.backlog;
      case 'CREATING_SNAPSHOT':
        return RecoveryInstanceDataReplicationState.creatingSnapshot;
      case 'CONTINUOUS':
        return RecoveryInstanceDataReplicationState.continuous;
      case 'PAUSED':
        return RecoveryInstanceDataReplicationState.paused;
      case 'RESCAN':
        return RecoveryInstanceDataReplicationState.rescan;
      case 'STALLED':
        return RecoveryInstanceDataReplicationState.stalled;
      case 'DISCONNECTED':
        return RecoveryInstanceDataReplicationState.disconnected;
      case 'REPLICATION_STATE_NOT_AVAILABLE':
        return RecoveryInstanceDataReplicationState
            .replicationStateNotAvailable;
      case 'NOT_STARTED':
        return RecoveryInstanceDataReplicationState.notStarted;
    }
    throw Exception(
        '$this is not known in enum RecoveryInstanceDataReplicationState');
  }
}

/// An object representing a block storage device on the Recovery Instance.
class RecoveryInstanceDisk {
  /// The amount of storage on the disk in bytes.
  final int? bytes;

  /// The EBS Volume ID of this disk.
  final String? ebsVolumeID;

  /// The internal device name of this disk. This is the name that is visible on
  /// the machine itself and not from the EC2 console.
  final String? internalDeviceName;

  RecoveryInstanceDisk({
    this.bytes,
    this.ebsVolumeID,
    this.internalDeviceName,
  });

  factory RecoveryInstanceDisk.fromJson(Map<String, dynamic> json) {
    return RecoveryInstanceDisk(
      bytes: json['bytes'] as int?,
      ebsVolumeID: json['ebsVolumeID'] as String?,
      internalDeviceName: json['internalDeviceName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final bytes = this.bytes;
    final ebsVolumeID = this.ebsVolumeID;
    final internalDeviceName = this.internalDeviceName;
    return {
      if (bytes != null) 'bytes': bytes,
      if (ebsVolumeID != null) 'ebsVolumeID': ebsVolumeID,
      if (internalDeviceName != null) 'internalDeviceName': internalDeviceName,
    };
  }
}

/// An object representing failback related information of the Recovery
/// Instance.
class RecoveryInstanceFailback {
  /// The date and time the agent on the Recovery Instance was last seen by the
  /// service.
  final String? agentLastSeenByServiceDateTime;

  /// The amount of time that the Recovery Instance has been replicating for.
  final String? elapsedReplicationDuration;

  /// The ID of the failback client that this Recovery Instance is associated
  /// with.
  final String? failbackClientID;

  /// The date and time that the failback client was last seen by the service.
  final String? failbackClientLastSeenByServiceDateTime;

  /// The date and time that the failback initiation started.
  final String? failbackInitiationTime;

  /// The Job ID of the last failback log for this Recovery Instance.
  final String? failbackJobID;

  /// The launch type (Recovery / Drill) of the last launch for the failback
  /// replication of this recovery instance.
  final FailbackLaunchType? failbackLaunchType;

  /// Whether we are failing back to the original Source Server for this Recovery
  /// Instance.
  final bool? failbackToOriginalServer;

  /// The date and time of the first byte that was replicated from the Recovery
  /// Instance.
  final String? firstByteDateTime;

  /// The state of the failback process that this Recovery Instance is in.
  final FailbackState? state;

  RecoveryInstanceFailback({
    this.agentLastSeenByServiceDateTime,
    this.elapsedReplicationDuration,
    this.failbackClientID,
    this.failbackClientLastSeenByServiceDateTime,
    this.failbackInitiationTime,
    this.failbackJobID,
    this.failbackLaunchType,
    this.failbackToOriginalServer,
    this.firstByteDateTime,
    this.state,
  });

  factory RecoveryInstanceFailback.fromJson(Map<String, dynamic> json) {
    return RecoveryInstanceFailback(
      agentLastSeenByServiceDateTime:
          json['agentLastSeenByServiceDateTime'] as String?,
      elapsedReplicationDuration: json['elapsedReplicationDuration'] as String?,
      failbackClientID: json['failbackClientID'] as String?,
      failbackClientLastSeenByServiceDateTime:
          json['failbackClientLastSeenByServiceDateTime'] as String?,
      failbackInitiationTime: json['failbackInitiationTime'] as String?,
      failbackJobID: json['failbackJobID'] as String?,
      failbackLaunchType:
          (json['failbackLaunchType'] as String?)?.toFailbackLaunchType(),
      failbackToOriginalServer: json['failbackToOriginalServer'] as bool?,
      firstByteDateTime: json['firstByteDateTime'] as String?,
      state: (json['state'] as String?)?.toFailbackState(),
    );
  }

  Map<String, dynamic> toJson() {
    final agentLastSeenByServiceDateTime = this.agentLastSeenByServiceDateTime;
    final elapsedReplicationDuration = this.elapsedReplicationDuration;
    final failbackClientID = this.failbackClientID;
    final failbackClientLastSeenByServiceDateTime =
        this.failbackClientLastSeenByServiceDateTime;
    final failbackInitiationTime = this.failbackInitiationTime;
    final failbackJobID = this.failbackJobID;
    final failbackLaunchType = this.failbackLaunchType;
    final failbackToOriginalServer = this.failbackToOriginalServer;
    final firstByteDateTime = this.firstByteDateTime;
    final state = this.state;
    return {
      if (agentLastSeenByServiceDateTime != null)
        'agentLastSeenByServiceDateTime': agentLastSeenByServiceDateTime,
      if (elapsedReplicationDuration != null)
        'elapsedReplicationDuration': elapsedReplicationDuration,
      if (failbackClientID != null) 'failbackClientID': failbackClientID,
      if (failbackClientLastSeenByServiceDateTime != null)
        'failbackClientLastSeenByServiceDateTime':
            failbackClientLastSeenByServiceDateTime,
      if (failbackInitiationTime != null)
        'failbackInitiationTime': failbackInitiationTime,
      if (failbackJobID != null) 'failbackJobID': failbackJobID,
      if (failbackLaunchType != null)
        'failbackLaunchType': failbackLaunchType.toValue(),
      if (failbackToOriginalServer != null)
        'failbackToOriginalServer': failbackToOriginalServer,
      if (firstByteDateTime != null) 'firstByteDateTime': firstByteDateTime,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Properties of the Recovery Instance machine.
class RecoveryInstanceProperties {
  /// An array of CPUs.
  final List<CPU>? cpus;

  /// An array of disks.
  final List<RecoveryInstanceDisk>? disks;

  /// Hints used to uniquely identify a machine.
  final IdentificationHints? identificationHints;

  /// The date and time the Recovery Instance properties were last updated on.
  final String? lastUpdatedDateTime;

  /// An array of network interfaces.
  final List<NetworkInterface>? networkInterfaces;

  /// Operating system.
  final OS? os;

  /// The amount of RAM in bytes.
  final int? ramBytes;

  RecoveryInstanceProperties({
    this.cpus,
    this.disks,
    this.identificationHints,
    this.lastUpdatedDateTime,
    this.networkInterfaces,
    this.os,
    this.ramBytes,
  });

  factory RecoveryInstanceProperties.fromJson(Map<String, dynamic> json) {
    return RecoveryInstanceProperties(
      cpus: (json['cpus'] as List?)
          ?.whereNotNull()
          .map((e) => CPU.fromJson(e as Map<String, dynamic>))
          .toList(),
      disks: (json['disks'] as List?)
          ?.whereNotNull()
          .map((e) => RecoveryInstanceDisk.fromJson(e as Map<String, dynamic>))
          .toList(),
      identificationHints: json['identificationHints'] != null
          ? IdentificationHints.fromJson(
              json['identificationHints'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: json['lastUpdatedDateTime'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      os: json['os'] != null
          ? OS.fromJson(json['os'] as Map<String, dynamic>)
          : null,
      ramBytes: json['ramBytes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpus = this.cpus;
    final disks = this.disks;
    final identificationHints = this.identificationHints;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final networkInterfaces = this.networkInterfaces;
    final os = this.os;
    final ramBytes = this.ramBytes;
    return {
      if (cpus != null) 'cpus': cpus,
      if (disks != null) 'disks': disks,
      if (identificationHints != null)
        'identificationHints': identificationHints,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': lastUpdatedDateTime,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (os != null) 'os': os,
      if (ramBytes != null) 'ramBytes': ramBytes,
    };
  }
}

/// A snapshot of a Source Server used during recovery.
class RecoverySnapshot {
  /// The timestamp of when we expect the snapshot to be taken.
  final String expectedTimestamp;

  /// The ID of the Recovery Snapshot.
  final String snapshotID;

  /// The ID of the Source Server that the snapshot was taken for.
  final String sourceServerID;

  /// A list of EBS snapshots.
  final List<String>? ebsSnapshots;

  /// The actual timestamp that the snapshot was taken.
  final String? timestamp;

  RecoverySnapshot({
    required this.expectedTimestamp,
    required this.snapshotID,
    required this.sourceServerID,
    this.ebsSnapshots,
    this.timestamp,
  });

  factory RecoverySnapshot.fromJson(Map<String, dynamic> json) {
    return RecoverySnapshot(
      expectedTimestamp: json['expectedTimestamp'] as String,
      snapshotID: json['snapshotID'] as String,
      sourceServerID: json['sourceServerID'] as String,
      ebsSnapshots: (json['ebsSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      timestamp: json['timestamp'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final expectedTimestamp = this.expectedTimestamp;
    final snapshotID = this.snapshotID;
    final sourceServerID = this.sourceServerID;
    final ebsSnapshots = this.ebsSnapshots;
    final timestamp = this.timestamp;
    return {
      'expectedTimestamp': expectedTimestamp,
      'snapshotID': snapshotID,
      'sourceServerID': sourceServerID,
      if (ebsSnapshots != null) 'ebsSnapshots': ebsSnapshots,
      if (timestamp != null) 'timestamp': timestamp,
    };
  }
}

enum RecoverySnapshotsOrder {
  asc,
  desc,
}

extension RecoverySnapshotsOrderValueExtension on RecoverySnapshotsOrder {
  String toValue() {
    switch (this) {
      case RecoverySnapshotsOrder.asc:
        return 'ASC';
      case RecoverySnapshotsOrder.desc:
        return 'DESC';
    }
  }
}

extension RecoverySnapshotsOrderFromString on String {
  RecoverySnapshotsOrder toRecoverySnapshotsOrder() {
    switch (this) {
      case 'ASC':
        return RecoverySnapshotsOrder.asc;
      case 'DESC':
        return RecoverySnapshotsOrder.desc;
    }
    throw Exception('$this is not known in enum RecoverySnapshotsOrder');
  }
}

class ReplicationConfiguration {
  /// Whether to associate the default Elastic Disaster Recovery Security group
  /// with the Replication Configuration.
  final bool? associateDefaultSecurityGroup;

  /// Whether to allow the AWS replication agent to automatically replicate newly
  /// added disks.
  final bool? autoReplicateNewDisks;

  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Source Server in Mbps.
  final int? bandwidthThrottling;

  /// Whether to create a Public IP for the Recovery Instance by default.
  final bool? createPublicIP;

  /// The data plane routing mechanism that will be used for replication.
  final ReplicationConfigurationDataPlaneRouting? dataPlaneRouting;

  /// The Staging Disk EBS volume type to be used during replication.
  final ReplicationConfigurationDefaultLargeStagingDiskType?
      defaultLargeStagingDiskType;

  /// The type of EBS encryption to be used during replication.
  final ReplicationConfigurationEbsEncryption? ebsEncryption;

  /// The ARN of the EBS encryption key to be used during replication.
  final String? ebsEncryptionKeyArn;

  /// The name of the Replication Configuration.
  final String? name;

  /// The Point in time (PIT) policy to manage snapshots taken during replication.
  final List<PITPolicyRule>? pitPolicy;

  /// The configuration of the disks of the Source Server to be replicated.
  final List<ReplicationConfigurationReplicatedDisk>? replicatedDisks;

  /// The instance type to be used for the replication server.
  final String? replicationServerInstanceType;

  /// The security group IDs that will be used by the replication server.
  final List<String>? replicationServersSecurityGroupsIDs;

  /// The ID of the Source Server for this Replication Configuration.
  final String? sourceServerID;

  /// The subnet to be used by the replication staging area.
  final String? stagingAreaSubnetId;

  /// A set of tags to be associated with all resources created in the replication
  /// staging area: EC2 replication server, EBS volumes, EBS snapshots, etc.
  final Map<String, String>? stagingAreaTags;

  /// Whether to use a dedicated Replication Server in the replication staging
  /// area.
  final bool? useDedicatedReplicationServer;

  ReplicationConfiguration({
    this.associateDefaultSecurityGroup,
    this.autoReplicateNewDisks,
    this.bandwidthThrottling,
    this.createPublicIP,
    this.dataPlaneRouting,
    this.defaultLargeStagingDiskType,
    this.ebsEncryption,
    this.ebsEncryptionKeyArn,
    this.name,
    this.pitPolicy,
    this.replicatedDisks,
    this.replicationServerInstanceType,
    this.replicationServersSecurityGroupsIDs,
    this.sourceServerID,
    this.stagingAreaSubnetId,
    this.stagingAreaTags,
    this.useDedicatedReplicationServer,
  });

  factory ReplicationConfiguration.fromJson(Map<String, dynamic> json) {
    return ReplicationConfiguration(
      associateDefaultSecurityGroup:
          json['associateDefaultSecurityGroup'] as bool?,
      autoReplicateNewDisks: json['autoReplicateNewDisks'] as bool?,
      bandwidthThrottling: json['bandwidthThrottling'] as int?,
      createPublicIP: json['createPublicIP'] as bool?,
      dataPlaneRouting: (json['dataPlaneRouting'] as String?)
          ?.toReplicationConfigurationDataPlaneRouting(),
      defaultLargeStagingDiskType:
          (json['defaultLargeStagingDiskType'] as String?)
              ?.toReplicationConfigurationDefaultLargeStagingDiskType(),
      ebsEncryption: (json['ebsEncryption'] as String?)
          ?.toReplicationConfigurationEbsEncryption(),
      ebsEncryptionKeyArn: json['ebsEncryptionKeyArn'] as String?,
      name: json['name'] as String?,
      pitPolicy: (json['pitPolicy'] as List?)
          ?.whereNotNull()
          .map((e) => PITPolicyRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      replicatedDisks: (json['replicatedDisks'] as List?)
          ?.whereNotNull()
          .map((e) => ReplicationConfigurationReplicatedDisk.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      replicationServerInstanceType:
          json['replicationServerInstanceType'] as String?,
      replicationServersSecurityGroupsIDs:
          (json['replicationServersSecurityGroupsIDs'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      sourceServerID: json['sourceServerID'] as String?,
      stagingAreaSubnetId: json['stagingAreaSubnetId'] as String?,
      stagingAreaTags: (json['stagingAreaTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useDedicatedReplicationServer:
          json['useDedicatedReplicationServer'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final associateDefaultSecurityGroup = this.associateDefaultSecurityGroup;
    final autoReplicateNewDisks = this.autoReplicateNewDisks;
    final bandwidthThrottling = this.bandwidthThrottling;
    final createPublicIP = this.createPublicIP;
    final dataPlaneRouting = this.dataPlaneRouting;
    final defaultLargeStagingDiskType = this.defaultLargeStagingDiskType;
    final ebsEncryption = this.ebsEncryption;
    final ebsEncryptionKeyArn = this.ebsEncryptionKeyArn;
    final name = this.name;
    final pitPolicy = this.pitPolicy;
    final replicatedDisks = this.replicatedDisks;
    final replicationServerInstanceType = this.replicationServerInstanceType;
    final replicationServersSecurityGroupsIDs =
        this.replicationServersSecurityGroupsIDs;
    final sourceServerID = this.sourceServerID;
    final stagingAreaSubnetId = this.stagingAreaSubnetId;
    final stagingAreaTags = this.stagingAreaTags;
    final useDedicatedReplicationServer = this.useDedicatedReplicationServer;
    return {
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (autoReplicateNewDisks != null)
        'autoReplicateNewDisks': autoReplicateNewDisks,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null)
        'dataPlaneRouting': dataPlaneRouting.toValue(),
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.toValue(),
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.toValue(),
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (name != null) 'name': name,
      if (pitPolicy != null) 'pitPolicy': pitPolicy,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
    };
  }
}

enum ReplicationConfigurationDataPlaneRouting {
  privateIp,
  publicIp,
}

extension ReplicationConfigurationDataPlaneRoutingValueExtension
    on ReplicationConfigurationDataPlaneRouting {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationDataPlaneRouting.privateIp:
        return 'PRIVATE_IP';
      case ReplicationConfigurationDataPlaneRouting.publicIp:
        return 'PUBLIC_IP';
    }
  }
}

extension ReplicationConfigurationDataPlaneRoutingFromString on String {
  ReplicationConfigurationDataPlaneRouting
      toReplicationConfigurationDataPlaneRouting() {
    switch (this) {
      case 'PRIVATE_IP':
        return ReplicationConfigurationDataPlaneRouting.privateIp;
      case 'PUBLIC_IP':
        return ReplicationConfigurationDataPlaneRouting.publicIp;
    }
    throw Exception(
        '$this is not known in enum ReplicationConfigurationDataPlaneRouting');
  }
}

enum ReplicationConfigurationDefaultLargeStagingDiskType {
  gp2,
  gp3,
  st1,
  auto,
}

extension ReplicationConfigurationDefaultLargeStagingDiskTypeValueExtension
    on ReplicationConfigurationDefaultLargeStagingDiskType {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationDefaultLargeStagingDiskType.gp2:
        return 'GP2';
      case ReplicationConfigurationDefaultLargeStagingDiskType.gp3:
        return 'GP3';
      case ReplicationConfigurationDefaultLargeStagingDiskType.st1:
        return 'ST1';
      case ReplicationConfigurationDefaultLargeStagingDiskType.auto:
        return 'AUTO';
    }
  }
}

extension ReplicationConfigurationDefaultLargeStagingDiskTypeFromString
    on String {
  ReplicationConfigurationDefaultLargeStagingDiskType
      toReplicationConfigurationDefaultLargeStagingDiskType() {
    switch (this) {
      case 'GP2':
        return ReplicationConfigurationDefaultLargeStagingDiskType.gp2;
      case 'GP3':
        return ReplicationConfigurationDefaultLargeStagingDiskType.gp3;
      case 'ST1':
        return ReplicationConfigurationDefaultLargeStagingDiskType.st1;
      case 'AUTO':
        return ReplicationConfigurationDefaultLargeStagingDiskType.auto;
    }
    throw Exception(
        '$this is not known in enum ReplicationConfigurationDefaultLargeStagingDiskType');
  }
}

enum ReplicationConfigurationEbsEncryption {
  $default,
  custom,
}

extension ReplicationConfigurationEbsEncryptionValueExtension
    on ReplicationConfigurationEbsEncryption {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationEbsEncryption.$default:
        return 'DEFAULT';
      case ReplicationConfigurationEbsEncryption.custom:
        return 'CUSTOM';
    }
  }
}

extension ReplicationConfigurationEbsEncryptionFromString on String {
  ReplicationConfigurationEbsEncryption
      toReplicationConfigurationEbsEncryption() {
    switch (this) {
      case 'DEFAULT':
        return ReplicationConfigurationEbsEncryption.$default;
      case 'CUSTOM':
        return ReplicationConfigurationEbsEncryption.custom;
    }
    throw Exception(
        '$this is not known in enum ReplicationConfigurationEbsEncryption');
  }
}

/// The configuration of a disk of the Source Server to be replicated.
class ReplicationConfigurationReplicatedDisk {
  /// The name of the device.
  final String? deviceName;

  /// The requested number of I/O operations per second (IOPS).
  final int? iops;

  /// Whether to boot from this disk or not.
  final bool? isBootDisk;

  /// The Staging Disk EBS volume type to be used during replication when
  /// <code>stagingDiskType</code> is set to Auto. This is a read-only field.
  final ReplicationConfigurationReplicatedDiskStagingDiskType?
      optimizedStagingDiskType;

  /// The Staging Disk EBS volume type to be used during replication.
  final ReplicationConfigurationReplicatedDiskStagingDiskType? stagingDiskType;

  /// The throughput to use for the EBS volume in MiB/s. This parameter is valid
  /// only for gp3 volumes.
  final int? throughput;

  ReplicationConfigurationReplicatedDisk({
    this.deviceName,
    this.iops,
    this.isBootDisk,
    this.optimizedStagingDiskType,
    this.stagingDiskType,
    this.throughput,
  });

  factory ReplicationConfigurationReplicatedDisk.fromJson(
      Map<String, dynamic> json) {
    return ReplicationConfigurationReplicatedDisk(
      deviceName: json['deviceName'] as String?,
      iops: json['iops'] as int?,
      isBootDisk: json['isBootDisk'] as bool?,
      optimizedStagingDiskType: (json['optimizedStagingDiskType'] as String?)
          ?.toReplicationConfigurationReplicatedDiskStagingDiskType(),
      stagingDiskType: (json['stagingDiskType'] as String?)
          ?.toReplicationConfigurationReplicatedDiskStagingDiskType(),
      throughput: json['throughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final iops = this.iops;
    final isBootDisk = this.isBootDisk;
    final optimizedStagingDiskType = this.optimizedStagingDiskType;
    final stagingDiskType = this.stagingDiskType;
    final throughput = this.throughput;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (iops != null) 'iops': iops,
      if (isBootDisk != null) 'isBootDisk': isBootDisk,
      if (optimizedStagingDiskType != null)
        'optimizedStagingDiskType': optimizedStagingDiskType.toValue(),
      if (stagingDiskType != null) 'stagingDiskType': stagingDiskType.toValue(),
      if (throughput != null) 'throughput': throughput,
    };
  }
}

enum ReplicationConfigurationReplicatedDiskStagingDiskType {
  auto,
  gp2,
  gp3,
  io1,
  sc1,
  st1,
  standard,
}

extension ReplicationConfigurationReplicatedDiskStagingDiskTypeValueExtension
    on ReplicationConfigurationReplicatedDiskStagingDiskType {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationReplicatedDiskStagingDiskType.auto:
        return 'AUTO';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.gp2:
        return 'GP2';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.gp3:
        return 'GP3';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.io1:
        return 'IO1';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.sc1:
        return 'SC1';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.st1:
        return 'ST1';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.standard:
        return 'STANDARD';
    }
  }
}

extension ReplicationConfigurationReplicatedDiskStagingDiskTypeFromString
    on String {
  ReplicationConfigurationReplicatedDiskStagingDiskType
      toReplicationConfigurationReplicatedDiskStagingDiskType() {
    switch (this) {
      case 'AUTO':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.auto;
      case 'GP2':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.gp2;
      case 'GP3':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.gp3;
      case 'IO1':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.io1;
      case 'SC1':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.sc1;
      case 'ST1':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.st1;
      case 'STANDARD':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.standard;
    }
    throw Exception(
        '$this is not known in enum ReplicationConfigurationReplicatedDiskStagingDiskType');
  }
}

class ReplicationConfigurationTemplate {
  /// The Replication Configuration Template ID.
  final String replicationConfigurationTemplateID;

  /// The Replication Configuration Template ARN.
  final String? arn;

  /// Whether to associate the default Elastic Disaster Recovery Security group
  /// with the Replication Configuration Template.
  final bool? associateDefaultSecurityGroup;

  /// Whether to allow the AWS replication agent to automatically replicate newly
  /// added disks.
  final bool? autoReplicateNewDisks;

  /// Configure bandwidth throttling for the outbound data transfer rate of the
  /// Source Server in Mbps.
  final int? bandwidthThrottling;

  /// Whether to create a Public IP for the Recovery Instance by default.
  final bool? createPublicIP;

  /// The data plane routing mechanism that will be used for replication.
  final ReplicationConfigurationDataPlaneRouting? dataPlaneRouting;

  /// The Staging Disk EBS volume type to be used during replication.
  final ReplicationConfigurationDefaultLargeStagingDiskType?
      defaultLargeStagingDiskType;

  /// The type of EBS encryption to be used during replication.
  final ReplicationConfigurationEbsEncryption? ebsEncryption;

  /// The ARN of the EBS encryption key to be used during replication.
  final String? ebsEncryptionKeyArn;

  /// The Point in time (PIT) policy to manage snapshots taken during replication.
  final List<PITPolicyRule>? pitPolicy;

  /// The instance type to be used for the replication server.
  final String? replicationServerInstanceType;

  /// The security group IDs that will be used by the replication server.
  final List<String>? replicationServersSecurityGroupsIDs;

  /// The subnet to be used by the replication staging area.
  final String? stagingAreaSubnetId;

  /// A set of tags to be associated with all resources created in the replication
  /// staging area: EC2 replication server, EBS volumes, EBS snapshots, etc.
  final Map<String, String>? stagingAreaTags;

  /// A set of tags to be associated with the Replication Configuration Template
  /// resource.
  final Map<String, String>? tags;

  /// Whether to use a dedicated Replication Server in the replication staging
  /// area.
  final bool? useDedicatedReplicationServer;

  ReplicationConfigurationTemplate({
    required this.replicationConfigurationTemplateID,
    this.arn,
    this.associateDefaultSecurityGroup,
    this.autoReplicateNewDisks,
    this.bandwidthThrottling,
    this.createPublicIP,
    this.dataPlaneRouting,
    this.defaultLargeStagingDiskType,
    this.ebsEncryption,
    this.ebsEncryptionKeyArn,
    this.pitPolicy,
    this.replicationServerInstanceType,
    this.replicationServersSecurityGroupsIDs,
    this.stagingAreaSubnetId,
    this.stagingAreaTags,
    this.tags,
    this.useDedicatedReplicationServer,
  });

  factory ReplicationConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return ReplicationConfigurationTemplate(
      replicationConfigurationTemplateID:
          json['replicationConfigurationTemplateID'] as String,
      arn: json['arn'] as String?,
      associateDefaultSecurityGroup:
          json['associateDefaultSecurityGroup'] as bool?,
      autoReplicateNewDisks: json['autoReplicateNewDisks'] as bool?,
      bandwidthThrottling: json['bandwidthThrottling'] as int?,
      createPublicIP: json['createPublicIP'] as bool?,
      dataPlaneRouting: (json['dataPlaneRouting'] as String?)
          ?.toReplicationConfigurationDataPlaneRouting(),
      defaultLargeStagingDiskType:
          (json['defaultLargeStagingDiskType'] as String?)
              ?.toReplicationConfigurationDefaultLargeStagingDiskType(),
      ebsEncryption: (json['ebsEncryption'] as String?)
          ?.toReplicationConfigurationEbsEncryption(),
      ebsEncryptionKeyArn: json['ebsEncryptionKeyArn'] as String?,
      pitPolicy: (json['pitPolicy'] as List?)
          ?.whereNotNull()
          .map((e) => PITPolicyRule.fromJson(e as Map<String, dynamic>))
          .toList(),
      replicationServerInstanceType:
          json['replicationServerInstanceType'] as String?,
      replicationServersSecurityGroupsIDs:
          (json['replicationServersSecurityGroupsIDs'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      stagingAreaSubnetId: json['stagingAreaSubnetId'] as String?,
      stagingAreaTags: (json['stagingAreaTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      useDedicatedReplicationServer:
          json['useDedicatedReplicationServer'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final replicationConfigurationTemplateID =
        this.replicationConfigurationTemplateID;
    final arn = this.arn;
    final associateDefaultSecurityGroup = this.associateDefaultSecurityGroup;
    final autoReplicateNewDisks = this.autoReplicateNewDisks;
    final bandwidthThrottling = this.bandwidthThrottling;
    final createPublicIP = this.createPublicIP;
    final dataPlaneRouting = this.dataPlaneRouting;
    final defaultLargeStagingDiskType = this.defaultLargeStagingDiskType;
    final ebsEncryption = this.ebsEncryption;
    final ebsEncryptionKeyArn = this.ebsEncryptionKeyArn;
    final pitPolicy = this.pitPolicy;
    final replicationServerInstanceType = this.replicationServerInstanceType;
    final replicationServersSecurityGroupsIDs =
        this.replicationServersSecurityGroupsIDs;
    final stagingAreaSubnetId = this.stagingAreaSubnetId;
    final stagingAreaTags = this.stagingAreaTags;
    final tags = this.tags;
    final useDedicatedReplicationServer = this.useDedicatedReplicationServer;
    return {
      'replicationConfigurationTemplateID': replicationConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (associateDefaultSecurityGroup != null)
        'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      if (autoReplicateNewDisks != null)
        'autoReplicateNewDisks': autoReplicateNewDisks,
      if (bandwidthThrottling != null)
        'bandwidthThrottling': bandwidthThrottling,
      if (createPublicIP != null) 'createPublicIP': createPublicIP,
      if (dataPlaneRouting != null)
        'dataPlaneRouting': dataPlaneRouting.toValue(),
      if (defaultLargeStagingDiskType != null)
        'defaultLargeStagingDiskType': defaultLargeStagingDiskType.toValue(),
      if (ebsEncryption != null) 'ebsEncryption': ebsEncryption.toValue(),
      if (ebsEncryptionKeyArn != null)
        'ebsEncryptionKeyArn': ebsEncryptionKeyArn,
      if (pitPolicy != null) 'pitPolicy': pitPolicy,
      if (replicationServerInstanceType != null)
        'replicationServerInstanceType': replicationServerInstanceType,
      if (replicationServersSecurityGroupsIDs != null)
        'replicationServersSecurityGroupsIDs':
            replicationServersSecurityGroupsIDs,
      if (stagingAreaSubnetId != null)
        'stagingAreaSubnetId': stagingAreaSubnetId,
      if (stagingAreaTags != null) 'stagingAreaTags': stagingAreaTags,
      if (tags != null) 'tags': tags,
      if (useDedicatedReplicationServer != null)
        'useDedicatedReplicationServer': useDedicatedReplicationServer,
    };
  }
}

/// Replication direction designates if this is a failover replication, or a
/// failback replication. When a DRS agent is installed on an instance, the
/// replication direction is failover. In cases where a recovery launch was made
/// in the recovery location and a new recovery instance was created, and then a
/// failback replication was initiated from that recovery instance back to the
/// origin location, then the replication direction will be failback.
enum ReplicationDirection {
  failover,
  failback,
}

extension ReplicationDirectionValueExtension on ReplicationDirection {
  String toValue() {
    switch (this) {
      case ReplicationDirection.failover:
        return 'FAILOVER';
      case ReplicationDirection.failback:
        return 'FAILBACK';
    }
  }
}

extension ReplicationDirectionFromString on String {
  ReplicationDirection toReplicationDirection() {
    switch (this) {
      case 'FAILOVER':
        return ReplicationDirection.failover;
      case 'FAILBACK':
        return ReplicationDirection.failback;
    }
    throw Exception('$this is not known in enum ReplicationDirection');
  }
}

class ReverseReplicationResponse {
  /// ARN of created SourceServer.
  final String? reversedDirectionSourceServerArn;

  ReverseReplicationResponse({
    this.reversedDirectionSourceServerArn,
  });

  factory ReverseReplicationResponse.fromJson(Map<String, dynamic> json) {
    return ReverseReplicationResponse(
      reversedDirectionSourceServerArn:
          json['reversedDirectionSourceServerArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final reversedDirectionSourceServerArn =
        this.reversedDirectionSourceServerArn;
    return {
      if (reversedDirectionSourceServerArn != null)
        'reversedDirectionSourceServerArn': reversedDirectionSourceServerArn,
    };
  }
}

/// Properties of the cloud environment where this Source Server originated
/// from.
class SourceCloudProperties {
  /// AWS Account ID for an EC2-originated Source Server.
  final String? originAccountID;

  /// AWS Availability Zone for an EC2-originated Source Server.
  final String? originAvailabilityZone;

  /// AWS Region for an EC2-originated Source Server.
  final String? originRegion;

  SourceCloudProperties({
    this.originAccountID,
    this.originAvailabilityZone,
    this.originRegion,
  });

  factory SourceCloudProperties.fromJson(Map<String, dynamic> json) {
    return SourceCloudProperties(
      originAccountID: json['originAccountID'] as String?,
      originAvailabilityZone: json['originAvailabilityZone'] as String?,
      originRegion: json['originRegion'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final originAccountID = this.originAccountID;
    final originAvailabilityZone = this.originAvailabilityZone;
    final originRegion = this.originRegion;
    return {
      if (originAccountID != null) 'originAccountID': originAccountID,
      if (originAvailabilityZone != null)
        'originAvailabilityZone': originAvailabilityZone,
      if (originRegion != null) 'originRegion': originRegion,
    };
  }
}

/// Properties of the Source Server machine.
class SourceProperties {
  /// An array of CPUs.
  final List<CPU>? cpus;

  /// An array of disks.
  final List<Disk>? disks;

  /// Hints used to uniquely identify a machine.
  final IdentificationHints? identificationHints;

  /// The date and time the Source Properties were last updated on.
  final String? lastUpdatedDateTime;

  /// An array of network interfaces.
  final List<NetworkInterface>? networkInterfaces;

  /// Operating system.
  final OS? os;

  /// The amount of RAM in bytes.
  final int? ramBytes;

  /// The recommended EC2 instance type that will be used when recovering the
  /// Source Server.
  final String? recommendedInstanceType;

  /// Are EC2 nitro instance types supported when recovering the Source Server.
  final bool? supportsNitroInstances;

  SourceProperties({
    this.cpus,
    this.disks,
    this.identificationHints,
    this.lastUpdatedDateTime,
    this.networkInterfaces,
    this.os,
    this.ramBytes,
    this.recommendedInstanceType,
    this.supportsNitroInstances,
  });

  factory SourceProperties.fromJson(Map<String, dynamic> json) {
    return SourceProperties(
      cpus: (json['cpus'] as List?)
          ?.whereNotNull()
          .map((e) => CPU.fromJson(e as Map<String, dynamic>))
          .toList(),
      disks: (json['disks'] as List?)
          ?.whereNotNull()
          .map((e) => Disk.fromJson(e as Map<String, dynamic>))
          .toList(),
      identificationHints: json['identificationHints'] != null
          ? IdentificationHints.fromJson(
              json['identificationHints'] as Map<String, dynamic>)
          : null,
      lastUpdatedDateTime: json['lastUpdatedDateTime'] as String?,
      networkInterfaces: (json['networkInterfaces'] as List?)
          ?.whereNotNull()
          .map((e) => NetworkInterface.fromJson(e as Map<String, dynamic>))
          .toList(),
      os: json['os'] != null
          ? OS.fromJson(json['os'] as Map<String, dynamic>)
          : null,
      ramBytes: json['ramBytes'] as int?,
      recommendedInstanceType: json['recommendedInstanceType'] as String?,
      supportsNitroInstances: json['supportsNitroInstances'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    final cpus = this.cpus;
    final disks = this.disks;
    final identificationHints = this.identificationHints;
    final lastUpdatedDateTime = this.lastUpdatedDateTime;
    final networkInterfaces = this.networkInterfaces;
    final os = this.os;
    final ramBytes = this.ramBytes;
    final recommendedInstanceType = this.recommendedInstanceType;
    final supportsNitroInstances = this.supportsNitroInstances;
    return {
      if (cpus != null) 'cpus': cpus,
      if (disks != null) 'disks': disks,
      if (identificationHints != null)
        'identificationHints': identificationHints,
      if (lastUpdatedDateTime != null)
        'lastUpdatedDateTime': lastUpdatedDateTime,
      if (networkInterfaces != null) 'networkInterfaces': networkInterfaces,
      if (os != null) 'os': os,
      if (ramBytes != null) 'ramBytes': ramBytes,
      if (recommendedInstanceType != null)
        'recommendedInstanceType': recommendedInstanceType,
      if (supportsNitroInstances != null)
        'supportsNitroInstances': supportsNitroInstances,
    };
  }
}

class SourceServer {
  /// The ARN of the Source Server.
  final String? arn;

  /// The Data Replication Info of the Source Server.
  final DataReplicationInfo? dataReplicationInfo;

  /// The status of the last recovery launch of this Source Server.
  final LastLaunchResult? lastLaunchResult;

  /// The lifecycle information of this Source Server.
  final LifeCycle? lifeCycle;

  /// The ID of the Recovery Instance associated with this Source Server.
  final String? recoveryInstanceId;

  /// Replication direction of the Source Server.
  final ReplicationDirection? replicationDirection;

  /// For EC2-originated Source Servers which have been failed over and then
  /// failed back, this value will mean the ARN of the Source Server on the
  /// opposite replication direction.
  final String? reversedDirectionSourceServerArn;

  /// Source cloud properties of the Source Server.
  final SourceCloudProperties? sourceCloudProperties;

  /// The source properties of the Source Server.
  final SourceProperties? sourceProperties;

  /// The ID of the Source Server.
  final String? sourceServerID;

  /// The staging area of the source server.
  final StagingArea? stagingArea;

  /// The tags associated with the Source Server.
  final Map<String, String>? tags;

  SourceServer({
    this.arn,
    this.dataReplicationInfo,
    this.lastLaunchResult,
    this.lifeCycle,
    this.recoveryInstanceId,
    this.replicationDirection,
    this.reversedDirectionSourceServerArn,
    this.sourceCloudProperties,
    this.sourceProperties,
    this.sourceServerID,
    this.stagingArea,
    this.tags,
  });

  factory SourceServer.fromJson(Map<String, dynamic> json) {
    return SourceServer(
      arn: json['arn'] as String?,
      dataReplicationInfo: json['dataReplicationInfo'] != null
          ? DataReplicationInfo.fromJson(
              json['dataReplicationInfo'] as Map<String, dynamic>)
          : null,
      lastLaunchResult:
          (json['lastLaunchResult'] as String?)?.toLastLaunchResult(),
      lifeCycle: json['lifeCycle'] != null
          ? LifeCycle.fromJson(json['lifeCycle'] as Map<String, dynamic>)
          : null,
      recoveryInstanceId: json['recoveryInstanceId'] as String?,
      replicationDirection:
          (json['replicationDirection'] as String?)?.toReplicationDirection(),
      reversedDirectionSourceServerArn:
          json['reversedDirectionSourceServerArn'] as String?,
      sourceCloudProperties: json['sourceCloudProperties'] != null
          ? SourceCloudProperties.fromJson(
              json['sourceCloudProperties'] as Map<String, dynamic>)
          : null,
      sourceProperties: json['sourceProperties'] != null
          ? SourceProperties.fromJson(
              json['sourceProperties'] as Map<String, dynamic>)
          : null,
      sourceServerID: json['sourceServerID'] as String?,
      stagingArea: json['stagingArea'] != null
          ? StagingArea.fromJson(json['stagingArea'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataReplicationInfo = this.dataReplicationInfo;
    final lastLaunchResult = this.lastLaunchResult;
    final lifeCycle = this.lifeCycle;
    final recoveryInstanceId = this.recoveryInstanceId;
    final replicationDirection = this.replicationDirection;
    final reversedDirectionSourceServerArn =
        this.reversedDirectionSourceServerArn;
    final sourceCloudProperties = this.sourceCloudProperties;
    final sourceProperties = this.sourceProperties;
    final sourceServerID = this.sourceServerID;
    final stagingArea = this.stagingArea;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (dataReplicationInfo != null)
        'dataReplicationInfo': dataReplicationInfo,
      if (lastLaunchResult != null)
        'lastLaunchResult': lastLaunchResult.toValue(),
      if (lifeCycle != null) 'lifeCycle': lifeCycle,
      if (recoveryInstanceId != null) 'recoveryInstanceId': recoveryInstanceId,
      if (replicationDirection != null)
        'replicationDirection': replicationDirection.toValue(),
      if (reversedDirectionSourceServerArn != null)
        'reversedDirectionSourceServerArn': reversedDirectionSourceServerArn,
      if (sourceCloudProperties != null)
        'sourceCloudProperties': sourceCloudProperties,
      if (sourceProperties != null) 'sourceProperties': sourceProperties,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (stagingArea != null) 'stagingArea': stagingArea,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Staging information related to source server.
class StagingArea {
  /// Shows an error message that occurred when DRS tried to access the staging
  /// source server. In this case StagingArea$status will have value
  /// EXTENSION_ERROR
  final String? errorMessage;

  /// Account ID of the account to which source server belongs. If this source
  /// server is extended - shows Account ID of staging source server.
  final String? stagingAccountID;

  /// Arn of the staging source server if this source server is extended
  final String? stagingSourceServerArn;

  /// Status of Source server extension. Possible values: (a) NOT_EXTENDED - This
  /// is a source server that is replicating in the current account. (b) EXTENDED
  /// - Source server is extended from a staging source server. In this case, the
  /// value of stagingSourceServerArn is pointing to the Arn of the source server
  /// in the staging account. (c) EXTENSION_ERROR - Some issue occurred when
  /// accessing staging source server. In this case, errorMessage field will
  /// contain an error message that explains what happened.
  final ExtensionStatus? status;

  StagingArea({
    this.errorMessage,
    this.stagingAccountID,
    this.stagingSourceServerArn,
    this.status,
  });

  factory StagingArea.fromJson(Map<String, dynamic> json) {
    return StagingArea(
      errorMessage: json['errorMessage'] as String?,
      stagingAccountID: json['stagingAccountID'] as String?,
      stagingSourceServerArn: json['stagingSourceServerArn'] as String?,
      status: (json['status'] as String?)?.toExtensionStatus(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorMessage = this.errorMessage;
    final stagingAccountID = this.stagingAccountID;
    final stagingSourceServerArn = this.stagingSourceServerArn;
    final status = this.status;
    return {
      if (errorMessage != null) 'errorMessage': errorMessage,
      if (stagingAccountID != null) 'stagingAccountID': stagingAccountID,
      if (stagingSourceServerArn != null)
        'stagingSourceServerArn': stagingSourceServerArn,
      if (status != null) 'status': status.toValue(),
    };
  }
}

/// Source server in staging account that extended source server connected to.
class StagingSourceServer {
  /// The ARN of the source server.
  final String? arn;

  /// Hostname of staging source server.
  final String? hostname;

  /// A list of tags associated with the staging source server.
  final Map<String, String>? tags;

  StagingSourceServer({
    this.arn,
    this.hostname,
    this.tags,
  });

  factory StagingSourceServer.fromJson(Map<String, dynamic> json) {
    return StagingSourceServer(
      arn: json['arn'] as String?,
      hostname: json['hostname'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final hostname = this.hostname;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (hostname != null) 'hostname': hostname,
      if (tags != null) 'tags': tags,
    };
  }
}

class StartFailbackLaunchResponse {
  /// The failback launch Job.
  final Job? job;

  StartFailbackLaunchResponse({
    this.job,
  });

  factory StartFailbackLaunchResponse.fromJson(Map<String, dynamic> json) {
    return StartFailbackLaunchResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

/// An object representing the Source Server to recover.
class StartRecoveryRequestSourceServer {
  /// The ID of the Source Server you want to recover.
  final String sourceServerID;

  /// The ID of a Recovery Snapshot we want to recover from. Omit this field to
  /// launch from the latest data by taking an on-demand snapshot.
  final String? recoverySnapshotID;

  StartRecoveryRequestSourceServer({
    required this.sourceServerID,
    this.recoverySnapshotID,
  });

  Map<String, dynamic> toJson() {
    final sourceServerID = this.sourceServerID;
    final recoverySnapshotID = this.recoverySnapshotID;
    return {
      'sourceServerID': sourceServerID,
      if (recoverySnapshotID != null) 'recoverySnapshotID': recoverySnapshotID,
    };
  }
}

class StartRecoveryResponse {
  /// The Recovery Job.
  final Job? job;

  StartRecoveryResponse({
    this.job,
  });

  factory StartRecoveryResponse.fromJson(Map<String, dynamic> json) {
    return StartRecoveryResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class StartReplicationResponse {
  /// The Source Server that this action was targeted on.
  final SourceServer? sourceServer;

  StartReplicationResponse({
    this.sourceServer,
  });

  factory StartReplicationResponse.fromJson(Map<String, dynamic> json) {
    return StartReplicationResponse(
      sourceServer: json['sourceServer'] != null
          ? SourceServer.fromJson(json['sourceServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceServer = this.sourceServer;
    return {
      if (sourceServer != null) 'sourceServer': sourceServer,
    };
  }
}

class StopReplicationResponse {
  /// The Source Server that this action was targeted on.
  final SourceServer? sourceServer;

  StopReplicationResponse({
    this.sourceServer,
  });

  factory StopReplicationResponse.fromJson(Map<String, dynamic> json) {
    return StopReplicationResponse(
      sourceServer: json['sourceServer'] != null
          ? SourceServer.fromJson(json['sourceServer'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceServer = this.sourceServer;
    return {
      if (sourceServer != null) 'sourceServer': sourceServer,
    };
  }
}

enum TargetInstanceTypeRightSizingMethod {
  none,
  basic,
}

extension TargetInstanceTypeRightSizingMethodValueExtension
    on TargetInstanceTypeRightSizingMethod {
  String toValue() {
    switch (this) {
      case TargetInstanceTypeRightSizingMethod.none:
        return 'NONE';
      case TargetInstanceTypeRightSizingMethod.basic:
        return 'BASIC';
    }
  }
}

extension TargetInstanceTypeRightSizingMethodFromString on String {
  TargetInstanceTypeRightSizingMethod toTargetInstanceTypeRightSizingMethod() {
    switch (this) {
      case 'NONE':
        return TargetInstanceTypeRightSizingMethod.none;
      case 'BASIC':
        return TargetInstanceTypeRightSizingMethod.basic;
    }
    throw Exception(
        '$this is not known in enum TargetInstanceTypeRightSizingMethod');
  }
}

class TerminateRecoveryInstancesResponse {
  /// The Job for terminating the Recovery Instances.
  final Job? job;

  TerminateRecoveryInstancesResponse({
    this.job,
  });

  factory TerminateRecoveryInstancesResponse.fromJson(
      Map<String, dynamic> json) {
    return TerminateRecoveryInstancesResponse(
      job: json['job'] != null
          ? Job.fromJson(json['job'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final job = this.job;
    return {
      if (job != null) 'job': job,
    };
  }
}

class UpdateLaunchConfigurationTemplateResponse {
  /// Updated Launch Configuration Template.
  final LaunchConfigurationTemplate? launchConfigurationTemplate;

  UpdateLaunchConfigurationTemplateResponse({
    this.launchConfigurationTemplate,
  });

  factory UpdateLaunchConfigurationTemplateResponse.fromJson(
      Map<String, dynamic> json) {
    return UpdateLaunchConfigurationTemplateResponse(
      launchConfigurationTemplate: json['launchConfigurationTemplate'] != null
          ? LaunchConfigurationTemplate.fromJson(
              json['launchConfigurationTemplate'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final launchConfigurationTemplate = this.launchConfigurationTemplate;
    return {
      if (launchConfigurationTemplate != null)
        'launchConfigurationTemplate': launchConfigurationTemplate,
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

class ThrottlingException extends _s.GenericAwsException {
  ThrottlingException({String? type, String? message})
      : super(type: type, code: 'ThrottlingException', message: message);
}

class UninitializedAccountException extends _s.GenericAwsException {
  UninitializedAccountException({String? type, String? message})
      : super(
            type: type,
            code: 'UninitializedAccountException',
            message: message);
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
  'InternalServerException': (type, message) =>
      InternalServerException(type: type, message: message),
  'ResourceNotFoundException': (type, message) =>
      ResourceNotFoundException(type: type, message: message),
  'ServiceQuotaExceededException': (type, message) =>
      ServiceQuotaExceededException(type: type, message: message),
  'ThrottlingException': (type, message) =>
      ThrottlingException(type: type, message: message),
  'UninitializedAccountException': (type, message) =>
      UninitializedAccountException(type: type, message: message),
  'ValidationException': (type, message) =>
      ValidationException(type: type, message: message),
};
