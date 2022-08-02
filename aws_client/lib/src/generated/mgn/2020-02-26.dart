// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name
// ignore_for_file: camel_case_types

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

/// The Application Migration Service service.
class Mgn {
  final _s.RestJsonProtocol _protocol;
  Mgn({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.RestJsonProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'mgn',
            signingName: 'mgn',
          ),
          region: region,
          credentials: credentials,
          endpointUrl: endpointUrl,
        );

  /// Allows the user to set the SourceServer.LifeCycle.state property for
  /// specific Source Server IDs to one of the following: READY_FOR_TEST or
  /// READY_FOR_CUTOVER. This command only works if the Source Server is already
  /// launchable (dataReplicationInfo.lagDuration is not null.)
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [lifeCycle] :
  /// The request to change the source server migration lifecycle state.
  ///
  /// Parameter [sourceServerID] :
  /// The request to change the source server migration lifecycle state by
  /// source server ID.
  Future<SourceServer> changeServerLifeCycleState({
    required ChangeServerLifeCycleStateSourceServerLifecycle lifeCycle,
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(lifeCycle, 'lifeCycle');
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'lifeCycle': lifeCycle,
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ChangeServerLifeCycleState',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [postLaunchActions] :
  /// Request to associate the default Application Migration Service Security
  /// group with the Replication Settings template.
  ///
  /// Parameter [tags] :
  /// Request to associate the default Application Migration Service Security
  /// group with the Replication Settings template.
  Future<LaunchConfigurationTemplate> createLaunchConfigurationTemplate({
    PostLaunchActions? postLaunchActions,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfigurationTemplate.fromJson(response);
  }

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Request to associate the default Application Migration Service Security
  /// group with the Replication Settings template.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Request to configure bandwidth throttling during Replication Settings
  /// template creation.
  ///
  /// Parameter [createPublicIP] :
  /// Request to create Public IP during Replication Settings template creation.
  ///
  /// Parameter [dataPlaneRouting] :
  /// Request to configure data plane routing during Replication Settings
  /// template creation.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// Request to configure the default large staging disk EBS volume type during
  /// Replication Settings template creation.
  ///
  /// Parameter [ebsEncryption] :
  /// Request to configure EBS encryption during Replication Settings template
  /// creation.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// Request to configure the Replication Server instance type during
  /// Replication Settings template creation.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// Request to configure the Replication Server Security group ID during
  /// Replication Settings template creation.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// Request to configure the Staging Area subnet ID during Replication
  /// Settings template creation.
  ///
  /// Parameter [stagingAreaTags] :
  /// Request to configure Staging Area tags during Replication Settings
  /// template creation.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Request to use Dedicated Replication Servers during Replication Settings
  /// template creation.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// Request to configure an EBS encryption key during Replication Settings
  /// template creation.
  ///
  /// Parameter [tags] :
  /// Request to configure tags during Replication Settings template creation.
  Future<ReplicationConfigurationTemplate>
      createReplicationConfigurationTemplate({
    required bool associateDefaultSecurityGroup,
    required int bandwidthThrottling,
    required bool createPublicIP,
    required ReplicationConfigurationDataPlaneRouting dataPlaneRouting,
    required ReplicationConfigurationDefaultLargeStagingDiskType
        defaultLargeStagingDiskType,
    required ReplicationConfigurationEbsEncryption ebsEncryption,
    required String replicationServerInstanceType,
    required List<String> replicationServersSecurityGroupsIDs,
    required String stagingAreaSubnetId,
    required Map<String, String> stagingAreaTags,
    required bool useDedicatedReplicationServer,
    String? ebsEncryptionKeyArn,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(
        associateDefaultSecurityGroup, 'associateDefaultSecurityGroup');
    ArgumentError.checkNotNull(bandwidthThrottling, 'bandwidthThrottling');
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      1152921504606846976,
      isRequired: true,
    );
    ArgumentError.checkNotNull(createPublicIP, 'createPublicIP');
    ArgumentError.checkNotNull(dataPlaneRouting, 'dataPlaneRouting');
    ArgumentError.checkNotNull(
        defaultLargeStagingDiskType, 'defaultLargeStagingDiskType');
    ArgumentError.checkNotNull(ebsEncryption, 'ebsEncryption');
    ArgumentError.checkNotNull(
        replicationServerInstanceType, 'replicationServerInstanceType');
    ArgumentError.checkNotNull(replicationServersSecurityGroupsIDs,
        'replicationServersSecurityGroupsIDs');
    ArgumentError.checkNotNull(stagingAreaSubnetId, 'stagingAreaSubnetId');
    ArgumentError.checkNotNull(stagingAreaTags, 'stagingAreaTags');
    ArgumentError.checkNotNull(
        useDedicatedReplicationServer, 'useDedicatedReplicationServer');
    final $payload = <String, dynamic>{
      'associateDefaultSecurityGroup': associateDefaultSecurityGroup,
      'bandwidthThrottling': bandwidthThrottling,
      'createPublicIP': createPublicIP,
      'dataPlaneRouting': dataPlaneRouting.toValue(),
      'defaultLargeStagingDiskType': defaultLargeStagingDiskType.toValue(),
      'ebsEncryption': ebsEncryption.toValue(),
      'replicationServerInstanceType': replicationServerInstanceType,
      'replicationServersSecurityGroupsIDs':
          replicationServersSecurityGroupsIDs,
      'stagingAreaSubnetId': stagingAreaSubnetId,
      'stagingAreaTags': stagingAreaTags,
      'useDedicatedReplicationServer': useDedicatedReplicationServer,
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
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobID] :
  /// Request to delete Job from service by Job ID.
  Future<void> deleteJob({
    required String jobID,
  }) async {
    ArgumentError.checkNotNull(jobID, 'jobID');
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

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// ID of resource to be deleted.
  Future<void> deleteLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
  }) async {
    ArgumentError.checkNotNull(
        launchConfigurationTemplateID, 'launchConfigurationTemplateID');
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

  /// Deletes a single Replication Configuration Template by ID
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [replicationConfigurationTemplateID] :
  /// Request to delete Replication Configuration Template from service by
  /// Replication Configuration Template ID.
  Future<void> deleteReplicationConfigurationTemplate({
    required String replicationConfigurationTemplateID,
  }) async {
    ArgumentError.checkNotNull(replicationConfigurationTemplateID,
        'replicationConfigurationTemplateID');
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

  /// Deletes a single source server by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to delete Source Server from service by Server ID.
  Future<void> deleteSourceServer({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
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

  /// Deletes a given vCenter client by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [vcenterClientID] :
  /// ID of resource to be deleted.
  Future<void> deleteVcenterClient({
    required String vcenterClientID,
  }) async {
    ArgumentError.checkNotNull(vcenterClientID, 'vcenterClientID');
    final $payload = <String, dynamic>{
      'vcenterClientID': vcenterClientID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteVcenterClient',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Retrieves detailed job log items with paging.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [jobID] :
  /// Request to describe Job log job ID.
  ///
  /// Parameter [maxResults] :
  /// Request to describe Job log item maximum results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe Job log next token.
  Future<DescribeJobLogItemsResponse> describeJobLogItems({
    required String jobID,
    int? maxResults,
    String? nextToken,
  }) async {
    ArgumentError.checkNotNull(jobID, 'jobID');
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

  /// Returns a list of Jobs. Use the JobsID and fromDate and toData filters to
  /// limit which jobs are returned. The response is sorted by creationDataTime
  /// - latest date first. Jobs are normally created by the StartTest,
  /// StartCutover, and TerminateTargetInstances APIs. Jobs are also created by
  /// DiagnosticLaunch and TerminateDiagnosticInstances, which are APIs
  /// available only to *Support* and only used in response to relevant support
  /// tickets.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Request to describe Job log filters.
  ///
  /// Parameter [maxResults] :
  /// Request to describe job log items by max results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe job log items by next token.
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

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [launchConfigurationTemplateIDs] :
  /// Request to disconnect Source Server from service by Server ID.
  ///
  /// Parameter [maxResults] :
  /// Request to disconnect Source Server from service by Server ID.
  ///
  /// Parameter [nextToken] :
  /// Request to disconnect Source Server from service by Server ID.
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
      1152921504606846976,
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

  /// Lists all ReplicationConfigurationTemplates, filtered by Source Server
  /// IDs.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Request to describe Replication Configuration template by max results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe Replication Configuration template by next token.
  ///
  /// Parameter [replicationConfigurationTemplateIDs] :
  /// Request to describe Replication Configuration template by template IDs.
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

  /// Retrieves all SourceServers or multiple SourceServers by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// Request to filter Source Servers list.
  ///
  /// Parameter [maxResults] :
  /// Request to filter Source Servers list by maximum results.
  ///
  /// Parameter [nextToken] :
  /// Request to filter Source Servers list by next token.
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

  /// Returns a list of the installed vCenter clients.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// Maximum results to be returned in DescribeVcenterClients.
  ///
  /// Parameter [nextToken] :
  /// Next pagination token to be provided for DescribeVcenterClients.
  Future<DescribeVcenterClientsResponse> describeVcenterClients({
    int? maxResults,
    String? nextToken,
  }) async {
    _s.validateNumRange(
      'maxResults',
      maxResults,
      1,
      1152921504606846976,
    );
    final $query = <String, List<String>>{
      if (maxResults != null) 'maxResults': [maxResults.toString()],
      if (nextToken != null) 'nextToken': [nextToken],
    };
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/DescribeVcenterClients',
      queryParams: $query,
      exceptionFnMap: _exceptionFns,
    );
    return DescribeVcenterClientsResponse.fromJson(response);
  }

  /// Disconnects specific Source Servers from Application Migration Service.
  /// Data replication is stopped immediately. All AWS resources created by
  /// Application Migration Service for enabling the replication of these source
  /// servers will be terminated / deleted within 90 minutes. Launched Test or
  /// Cutover instances will NOT be terminated. If the agent on the source
  /// server has not been prevented from communicating with the Application
  /// Migration Service service, then it will receive a command to uninstall
  /// itself (within approximately 10 minutes). The following properties of the
  /// SourceServer will be changed immediately:
  /// dataReplicationInfo.dataReplicationState will be set to DISCONNECTED; The
  /// totalStorageBytes property for each of dataReplicationInfo.replicatedDisks
  /// will be set to zero; dataReplicationInfo.lagDuration and
  /// dataReplicationInfo.lagDuration will be nullified.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to disconnect Source Server from service by Server ID.
  Future<SourceServer> disconnectFromService({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisconnectFromService',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Finalizes the cutover immediately for specific Source Servers. All AWS
  /// resources created by Application Migration Service for enabling the
  /// replication of these source servers will be terminated / deleted within 90
  /// minutes. Launched Test or Cutover instances will NOT be terminated. The
  /// AWS Replication Agent will receive a command to uninstall itself (within
  /// 10 minutes). The following properties of the SourceServer will be changed
  /// immediately: dataReplicationInfo.dataReplicationState will be changed to
  /// DISCONNECTED; The SourceServer.lifeCycle.state will be changed to CUTOVER;
  /// The totalStorageBytes property fo each of
  /// dataReplicationInfo.replicatedDisks will be set to zero;
  /// dataReplicationInfo.lagDuration and dataReplicationInfo.lagDuration will
  /// be nullified.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to finalize Cutover by Source Server ID.
  Future<SourceServer> finalizeCutover({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/FinalizeCutover',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Lists all LaunchConfigurations available, filtered by Source Server IDs.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to get Launch Configuration information by Source Server ID.
  Future<LaunchConfiguration> getLaunchConfiguration({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
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

  /// Lists all ReplicationConfigurations, filtered by Source Server ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sourceServerID] :
  /// Request to get Replication Configuration by Source Server ID.
  Future<ReplicationConfiguration> getReplicationConfiguration({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
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

  /// Initialize Application Migration Service.
  ///
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  Future<void> initializeService() async {
    final response = await _protocol.send(
      payload: null,
      method: 'POST',
      requestUri: '/InitializeService',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// List all tags for your Application Migration Service resources.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// List tags for resource request by ARN.
  Future<ListTagsForResourceResponse> listTagsForResource({
    required String resourceArn,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// Archives specific Source Servers by setting the SourceServer.isArchived
  /// property to true for specified SourceServers by ID. This command only
  /// works for SourceServers with a lifecycle. state which equals DISCONNECTED
  /// or CUTOVER.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Mark as archived by Source Server ID.
  Future<SourceServer> markAsArchived({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MarkAsArchived',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Causes the data replication initiation sequence to begin immediately upon
  /// next Handshake for specified SourceServer IDs, regardless of when the
  /// previous initiation started. This command will not work if the
  /// SourceServer is not stalled or is in a DISCONNECTED or STOPPED state.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [sourceServerID] :
  /// Retry data replication for Source Server ID.
  Future<SourceServer> retryDataReplication({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
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

  /// Launches a Cutover Instance for specific Source Servers. This command
  /// starts a LAUNCH job whose initiatedBy property is StartCutover and changes
  /// the SourceServer.lifeCycle.state property to CUTTING_OVER.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerIDs] :
  /// Start Cutover by Source Server IDs.
  ///
  /// Parameter [tags] :
  /// Start Cutover by Tags.
  Future<StartCutoverResponse> startCutover({
    required List<String> sourceServerIDs,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(sourceServerIDs, 'sourceServerIDs');
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartCutover',
      exceptionFnMap: _exceptionFns,
    );
    return StartCutoverResponse.fromJson(response);
  }

  /// Starts replication for SNAPSHOT_SHIPPING agents.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// ID of source server on which to start replication.
  Future<SourceServer> startReplication({
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Launches a Test Instance for specific Source Servers. This command starts
  /// a LAUNCH job whose initiatedBy property is StartTest and changes the
  /// SourceServer.lifeCycle.state property to TESTING.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerIDs] :
  /// Start Test for Source Server IDs.
  ///
  /// Parameter [tags] :
  /// Start Test by Tags.
  Future<StartTestResponse> startTest({
    required List<String> sourceServerIDs,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(sourceServerIDs, 'sourceServerIDs');
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartTest',
      exceptionFnMap: _exceptionFns,
    );
    return StartTestResponse.fromJson(response);
  }

  /// Adds or overwrites only the specified tags for the specified Application
  /// Migration Service resource or resources. When you specify an existing tag
  /// key, the value is overwritten with the new value. Each resource can have a
  /// maximum of 50 tags. Each tag consists of a key and optional value.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// Tag resource by ARN.
  ///
  /// Parameter [tags] :
  /// Tag resource by Tags.
  Future<void> tagResource({
    required String resourceArn,
    required Map<String, String> tags,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tags, 'tags');
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

  /// Starts a job that terminates specific launched EC2 Test and Cutover
  /// instances. This command will not work for any Source Server with a
  /// lifecycle.state of TESTING, CUTTING_OVER, or CUTOVER.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerIDs] :
  /// Terminate Target instance by Source Server IDs.
  ///
  /// Parameter [tags] :
  /// Terminate Target instance by Tags.
  Future<TerminateTargetInstancesResponse> terminateTargetInstances({
    required List<String> sourceServerIDs,
    Map<String, String>? tags,
  }) async {
    ArgumentError.checkNotNull(sourceServerIDs, 'sourceServerIDs');
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/TerminateTargetInstances',
      exceptionFnMap: _exceptionFns,
    );
    return TerminateTargetInstancesResponse.fromJson(response);
  }

  /// Deletes the specified set of tags from the specified set of Application
  /// Migration Service resources.
  ///
  /// May throw [ResourceNotFoundException].
  /// May throw [ThrottlingException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [InternalServerException].
  ///
  /// Parameter [resourceArn] :
  /// Untag resource by ARN.
  ///
  /// Parameter [tagKeys] :
  /// Untag resource by Keys.
  Future<void> untagResource({
    required String resourceArn,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceArn, 'resourceArn');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
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

  /// Updates multiple LaunchConfigurations by Source Server ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Update Launch configuration by Source Server ID request.
  ///
  /// Parameter [bootMode] :
  /// Update Launch configuration boot mode request.
  ///
  /// Parameter [copyPrivateIp] :
  /// Update Launch configuration copy Private IP request.
  ///
  /// Parameter [copyTags] :
  /// Update Launch configuration copy Tags request.
  ///
  /// Parameter [launchDisposition] :
  /// Update Launch configuration launch disposition request.
  ///
  /// Parameter [licensing] :
  /// Update Launch configuration licensing request.
  ///
  /// Parameter [name] :
  /// Update Launch configuration name request.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Update Launch configuration Target instance right sizing request.
  Future<LaunchConfiguration> updateLaunchConfiguration({
    required String sourceServerID,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? name,
    PostLaunchActions? postLaunchActions,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (bootMode != null) 'bootMode': bootMode.toValue(),
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (name != null) 'name': name,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
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

  /// Creates a new ReplicationConfigurationTemplate.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Update Launch configuration Target instance right sizing request.
  ///
  /// Parameter [postLaunchActions] :
  /// Update Launch configuration Target instance right sizing request.
  Future<LaunchConfigurationTemplate> updateLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
    PostLaunchActions? postLaunchActions,
  }) async {
    ArgumentError.checkNotNull(
        launchConfigurationTemplateID, 'launchConfigurationTemplateID');
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateLaunchConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return LaunchConfigurationTemplate.fromJson(response);
  }

  /// Allows you to update multiple ReplicationConfigurations by Source Server
  /// ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Update replication configuration Source Server ID request.
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Update replication configuration associate default Application Migration
  /// Service Security group request.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Update replication configuration bandwidth throttling request.
  ///
  /// Parameter [createPublicIP] :
  /// Update replication configuration create Public IP request.
  ///
  /// Parameter [dataPlaneRouting] :
  /// Update replication configuration data plane routing request.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// Update replication configuration use default large Staging Disk type
  /// request.
  ///
  /// Parameter [ebsEncryption] :
  /// Update replication configuration EBS encryption request.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// Update replication configuration EBS encryption key ARN request.
  ///
  /// Parameter [name] :
  /// Update replication configuration name request.
  ///
  /// Parameter [replicatedDisks] :
  /// Update replication configuration replicated disks request.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// Update replication configuration Replication Server instance type request.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// Update replication configuration Replication Server Security Groups IDs
  /// request.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// Update replication configuration Staging Area subnet request.
  ///
  /// Parameter [stagingAreaTags] :
  /// Update replication configuration Staging Area Tags request.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Update replication configuration use dedicated Replication Server request.
  Future<ReplicationConfiguration> updateReplicationConfiguration({
    required String sourceServerID,
    bool? associateDefaultSecurityGroup,
    int? bandwidthThrottling,
    bool? createPublicIP,
    ReplicationConfigurationDataPlaneRouting? dataPlaneRouting,
    ReplicationConfigurationDefaultLargeStagingDiskType?
        defaultLargeStagingDiskType,
    ReplicationConfigurationEbsEncryption? ebsEncryption,
    String? ebsEncryptionKeyArn,
    String? name,
    List<ReplicationConfigurationReplicatedDisk>? replicatedDisks,
    String? replicationServerInstanceType,
    List<String>? replicationServersSecurityGroupsIDs,
    String? stagingAreaSubnetId,
    Map<String, String>? stagingAreaTags,
    bool? useDedicatedReplicationServer,
  }) async {
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
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

  /// Updates multiple ReplicationConfigurationTemplates by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [replicationConfigurationTemplateID] :
  /// Update replication configuration template template ID request.
  ///
  /// Parameter [arn] :
  /// Update replication configuration template ARN request.
  ///
  /// Parameter [associateDefaultSecurityGroup] :
  /// Update replication configuration template associate default Application
  /// Migration Service Security group request.
  ///
  /// Parameter [bandwidthThrottling] :
  /// Update replication configuration template bandwidth throttling request.
  ///
  /// Parameter [createPublicIP] :
  /// Update replication configuration template create Public IP request.
  ///
  /// Parameter [dataPlaneRouting] :
  /// Update replication configuration template data plane routing request.
  ///
  /// Parameter [defaultLargeStagingDiskType] :
  /// Update replication configuration template use default large Staging Disk
  /// type request.
  ///
  /// Parameter [ebsEncryption] :
  /// Update replication configuration template EBS encryption request.
  ///
  /// Parameter [ebsEncryptionKeyArn] :
  /// Update replication configuration template EBS encryption key ARN request.
  ///
  /// Parameter [replicationServerInstanceType] :
  /// Update replication configuration template Replication Server instance type
  /// request.
  ///
  /// Parameter [replicationServersSecurityGroupsIDs] :
  /// Update replication configuration template Replication Server Security
  /// groups IDs request.
  ///
  /// Parameter [stagingAreaSubnetId] :
  /// Update replication configuration template Staging Area subnet ID request.
  ///
  /// Parameter [stagingAreaTags] :
  /// Update replication configuration template Staging Area Tags request.
  ///
  /// Parameter [useDedicatedReplicationServer] :
  /// Update replication configuration template use dedicated Replication Server
  /// request.
  Future<ReplicationConfigurationTemplate>
      updateReplicationConfigurationTemplate({
    required String replicationConfigurationTemplateID,
    String? arn,
    bool? associateDefaultSecurityGroup,
    int? bandwidthThrottling,
    bool? createPublicIP,
    ReplicationConfigurationDataPlaneRouting? dataPlaneRouting,
    ReplicationConfigurationDefaultLargeStagingDiskType?
        defaultLargeStagingDiskType,
    ReplicationConfigurationEbsEncryption? ebsEncryption,
    String? ebsEncryptionKeyArn,
    String? replicationServerInstanceType,
    List<String>? replicationServersSecurityGroupsIDs,
    String? stagingAreaSubnetId,
    Map<String, String>? stagingAreaTags,
    bool? useDedicatedReplicationServer,
  }) async {
    ArgumentError.checkNotNull(replicationConfigurationTemplateID,
        'replicationConfigurationTemplateID');
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

  /// Allows you to change between the AGENT_BASED replication type and the
  /// SNAPSHOT_SHIPPING replication type.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [replicationType] :
  /// Replication type to which to update source server.
  ///
  /// Parameter [sourceServerID] :
  /// ID of source server on which to update replication type.
  Future<SourceServer> updateSourceServerReplicationType({
    required ReplicationType replicationType,
    required String sourceServerID,
  }) async {
    ArgumentError.checkNotNull(replicationType, 'replicationType');
    ArgumentError.checkNotNull(sourceServerID, 'sourceServerID');
    final $payload = <String, dynamic>{
      'replicationType': replicationType.toValue(),
      'sourceServerID': sourceServerID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateSourceServerReplicationType',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }
}

enum BootMode {
  legacyBios,
  uefi,
}

extension on BootMode {
  String toValue() {
    switch (this) {
      case BootMode.legacyBios:
        return 'LEGACY_BIOS';
      case BootMode.uefi:
        return 'UEFI';
    }
  }
}

extension on String {
  BootMode toBootMode() {
    switch (this) {
      case 'LEGACY_BIOS':
        return BootMode.legacyBios;
      case 'UEFI':
        return BootMode.uefi;
    }
    throw Exception('$this is not known in enum BootMode');
  }
}

/// Source server CPU information.
class CPU {
  /// The number of CPU cores on the source server.
  final int? cores;

  /// The source server's CPU model name.
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

/// The request to change the source server migration lifecycle state.
class ChangeServerLifeCycleStateSourceServerLifecycle {
  /// The request to change the source server migration lifecycle state.
  final ChangeServerLifeCycleStateSourceServerLifecycleState state;

  ChangeServerLifeCycleStateSourceServerLifecycle({
    required this.state,
  });

  factory ChangeServerLifeCycleStateSourceServerLifecycle.fromJson(
      Map<String, dynamic> json) {
    return ChangeServerLifeCycleStateSourceServerLifecycle(
      state: (json['state'] as String)
          .toChangeServerLifeCycleStateSourceServerLifecycleState(),
    );
  }

  Map<String, dynamic> toJson() {
    final state = this.state;
    return {
      'state': state.toValue(),
    };
  }
}

enum ChangeServerLifeCycleStateSourceServerLifecycleState {
  readyForTest,
  readyForCutover,
  cutover,
}

extension on ChangeServerLifeCycleStateSourceServerLifecycleState {
  String toValue() {
    switch (this) {
      case ChangeServerLifeCycleStateSourceServerLifecycleState.readyForTest:
        return 'READY_FOR_TEST';
      case ChangeServerLifeCycleStateSourceServerLifecycleState.readyForCutover:
        return 'READY_FOR_CUTOVER';
      case ChangeServerLifeCycleStateSourceServerLifecycleState.cutover:
        return 'CUTOVER';
    }
  }
}

extension on String {
  ChangeServerLifeCycleStateSourceServerLifecycleState
      toChangeServerLifeCycleStateSourceServerLifecycleState() {
    switch (this) {
      case 'READY_FOR_TEST':
        return ChangeServerLifeCycleStateSourceServerLifecycleState
            .readyForTest;
      case 'READY_FOR_CUTOVER':
        return ChangeServerLifeCycleStateSourceServerLifecycleState
            .readyForCutover;
      case 'CUTOVER':
        return ChangeServerLifeCycleStateSourceServerLifecycleState.cutover;
    }
    throw Exception(
        '$this is not known in enum ChangeServerLifeCycleStateSourceServerLifecycleState');
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
  unsupportedVmConfiguration,
  lastSnapshotJobFailed,
}

extension on DataReplicationErrorString {
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
      case DataReplicationErrorString.unsupportedVmConfiguration:
        return 'UNSUPPORTED_VM_CONFIGURATION';
      case DataReplicationErrorString.lastSnapshotJobFailed:
        return 'LAST_SNAPSHOT_JOB_FAILED';
    }
  }
}

extension on String {
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
      case 'UNSUPPORTED_VM_CONFIGURATION':
        return DataReplicationErrorString.unsupportedVmConfiguration;
      case 'LAST_SNAPSHOT_JOB_FAILED':
        return DataReplicationErrorString.lastSnapshotJobFailed;
    }
    throw Exception('$this is not known in enum DataReplicationErrorString');
  }
}

/// Request data replication info.
class DataReplicationInfo {
  /// Error in obtaining data replication info.
  final DataReplicationError? dataReplicationError;

  /// Request to query whether data replication has been initiated.
  final DataReplicationInitiation? dataReplicationInitiation;

  /// Request to query the data replication state.
  final DataReplicationState? dataReplicationState;

  /// Request to query the time when data replication will be complete.
  final String? etaDateTime;

  /// Request to query data replication lag duration.
  final String? lagDuration;

  /// Request to query data replication last snapshot time.
  final String? lastSnapshotDateTime;

  /// Request to query disks replicated.
  final List<DataReplicationInfoReplicatedDisk>? replicatedDisks;

  DataReplicationInfo({
    this.dataReplicationError,
    this.dataReplicationInitiation,
    this.dataReplicationState,
    this.etaDateTime,
    this.lagDuration,
    this.lastSnapshotDateTime,
    this.replicatedDisks,
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
      lastSnapshotDateTime: json['lastSnapshotDateTime'] as String?,
      replicatedDisks: (json['replicatedDisks'] as List?)
          ?.whereNotNull()
          .map((e) => DataReplicationInfoReplicatedDisk.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final dataReplicationError = this.dataReplicationError;
    final dataReplicationInitiation = this.dataReplicationInitiation;
    final dataReplicationState = this.dataReplicationState;
    final etaDateTime = this.etaDateTime;
    final lagDuration = this.lagDuration;
    final lastSnapshotDateTime = this.lastSnapshotDateTime;
    final replicatedDisks = this.replicatedDisks;
    return {
      if (dataReplicationError != null)
        'dataReplicationError': dataReplicationError,
      if (dataReplicationInitiation != null)
        'dataReplicationInitiation': dataReplicationInitiation,
      if (dataReplicationState != null)
        'dataReplicationState': dataReplicationState.toValue(),
      if (etaDateTime != null) 'etaDateTime': etaDateTime,
      if (lagDuration != null) 'lagDuration': lagDuration,
      if (lastSnapshotDateTime != null)
        'lastSnapshotDateTime': lastSnapshotDateTime,
      if (replicatedDisks != null) 'replicatedDisks': replicatedDisks,
    };
  }
}

/// Request to query disks replicated.
class DataReplicationInfoReplicatedDisk {
  /// Request to query data replication backlog size in bytes.
  final int? backloggedStorageBytes;

  /// Request to query device name.
  final String? deviceName;

  /// Request to query amount of data replicated in bytes.
  final int? replicatedStorageBytes;

  /// Request to query amount of data rescanned in bytes.
  final int? rescannedStorageBytes;

  /// Request to query total amount of data replicated in bytes.
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
  /// Request to query next data initiation date and time.
  final String? nextAttemptDateTime;

  /// Request to query data initiation start date and time.
  final String? startDateTime;

  /// Request to query data initiation steps.
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
  /// Request to query data initiation step name.
  final DataReplicationInitiationStepName? name;

  /// Request to query data initiation status.
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

extension on DataReplicationInitiationStepName {
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

extension on String {
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

extension on DataReplicationInitiationStepStatus {
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

extension on String {
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
  pendingSnapshotShipping,
  shippingSnapshot,
}

extension on DataReplicationState {
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
      case DataReplicationState.pendingSnapshotShipping:
        return 'PENDING_SNAPSHOT_SHIPPING';
      case DataReplicationState.shippingSnapshot:
        return 'SHIPPING_SNAPSHOT';
    }
  }
}

extension on String {
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
      case 'PENDING_SNAPSHOT_SHIPPING':
        return DataReplicationState.pendingSnapshotShipping;
      case 'SHIPPING_SNAPSHOT':
        return DataReplicationState.shippingSnapshot;
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
  /// Request to describe Job log response items.
  final List<JobLog>? items;

  /// Request to describe Job log response next token.
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

/// Request to describe Job log filters.
class DescribeJobsRequestFilters {
  /// Request to describe Job log filters by date.
  final String? fromDate;

  /// Request to describe Job log filters by job ID.
  final List<String>? jobIDs;

  /// Request to describe job log items by last date.
  final String? toDate;

  DescribeJobsRequestFilters({
    this.fromDate,
    this.jobIDs,
    this.toDate,
  });

  factory DescribeJobsRequestFilters.fromJson(Map<String, dynamic> json) {
    return DescribeJobsRequestFilters(
      fromDate: json['fromDate'] as String?,
      jobIDs: (json['jobIDs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      toDate: json['toDate'] as String?,
    );
  }

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
  /// Request to describe Job log items.
  final List<Job>? items;

  /// Request to describe Job response by next token.
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
  /// Request to disconnect Source Server from service by Server ID.
  final List<LaunchConfigurationTemplate>? items;

  /// Request to disconnect Source Server from service by Server ID.
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

class DescribeReplicationConfigurationTemplatesResponse {
  /// Request to describe Replication Configuration template by items.
  final List<ReplicationConfigurationTemplate>? items;

  /// Request to describe Replication Configuration template by next token.
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

/// Request to filter Source Servers list.
class DescribeSourceServersRequestFilters {
  /// Request to filter Source Servers list by archived.
  final bool? isArchived;

  /// Request to filter Source Servers list by life cycle states.
  final List<LifeCycleState>? lifeCycleStates;

  /// Request to filter Source Servers list by replication type.
  final List<ReplicationType>? replicationTypes;

  /// Request to filter Source Servers list by Source Server ID.
  final List<String>? sourceServerIDs;

  DescribeSourceServersRequestFilters({
    this.isArchived,
    this.lifeCycleStates,
    this.replicationTypes,
    this.sourceServerIDs,
  });

  factory DescribeSourceServersRequestFilters.fromJson(
      Map<String, dynamic> json) {
    return DescribeSourceServersRequestFilters(
      isArchived: json['isArchived'] as bool?,
      lifeCycleStates: (json['lifeCycleStates'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toLifeCycleState())
          .toList(),
      replicationTypes: (json['replicationTypes'] as List?)
          ?.whereNotNull()
          .map((e) => (e as String).toReplicationType())
          .toList(),
      sourceServerIDs: (json['sourceServerIDs'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final isArchived = this.isArchived;
    final lifeCycleStates = this.lifeCycleStates;
    final replicationTypes = this.replicationTypes;
    final sourceServerIDs = this.sourceServerIDs;
    return {
      if (isArchived != null) 'isArchived': isArchived,
      if (lifeCycleStates != null)
        'lifeCycleStates': lifeCycleStates.map((e) => e.toValue()).toList(),
      if (replicationTypes != null)
        'replicationTypes': replicationTypes.map((e) => e.toValue()).toList(),
      if (sourceServerIDs != null) 'sourceServerIDs': sourceServerIDs,
    };
  }
}

class DescribeSourceServersResponse {
  /// Request to filter Source Servers list by item.
  final List<SourceServer>? items;

  /// Request to filter Source Servers next token.
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

class DescribeVcenterClientsResponse {
  /// List of items returned by DescribeVcenterClients.
  final List<VcenterClient>? items;

  /// Next pagination token returned from DescribeVcenterClients.
  final String? nextToken;

  DescribeVcenterClientsResponse({
    this.items,
    this.nextToken,
  });

  factory DescribeVcenterClientsResponse.fromJson(Map<String, dynamic> json) {
    return DescribeVcenterClientsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => VcenterClient.fromJson(e as Map<String, dynamic>))
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

/// The disk identifier.
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

enum FirstBoot {
  waiting,
  succeeded,
  unknown,
  stopped,
}

extension on FirstBoot {
  String toValue() {
    switch (this) {
      case FirstBoot.waiting:
        return 'WAITING';
      case FirstBoot.succeeded:
        return 'SUCCEEDED';
      case FirstBoot.unknown:
        return 'UNKNOWN';
      case FirstBoot.stopped:
        return 'STOPPED';
    }
  }
}

extension on String {
  FirstBoot toFirstBoot() {
    switch (this) {
      case 'WAITING':
        return FirstBoot.waiting;
      case 'SUCCEEDED':
        return FirstBoot.succeeded;
      case 'UNKNOWN':
        return FirstBoot.unknown;
      case 'STOPPED':
        return FirstBoot.stopped;
    }
    throw Exception('$this is not known in enum FirstBoot');
  }
}

/// Identification hints.
class IdentificationHints {
  /// AWS Instance ID identification hint.
  final String? awsInstanceID;

  /// FQDN address identification hint.
  final String? fqdn;

  /// Hostname identification hint.
  final String? hostname;

  /// vCenter VM path identification hint.
  final String? vmPath;

  /// vmWare UUID identification hint.
  final String? vmWareUuid;

  IdentificationHints({
    this.awsInstanceID,
    this.fqdn,
    this.hostname,
    this.vmPath,
    this.vmWareUuid,
  });

  factory IdentificationHints.fromJson(Map<String, dynamic> json) {
    return IdentificationHints(
      awsInstanceID: json['awsInstanceID'] as String?,
      fqdn: json['fqdn'] as String?,
      hostname: json['hostname'] as String?,
      vmPath: json['vmPath'] as String?,
      vmWareUuid: json['vmWareUuid'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final awsInstanceID = this.awsInstanceID;
    final fqdn = this.fqdn;
    final hostname = this.hostname;
    final vmPath = this.vmPath;
    final vmWareUuid = this.vmWareUuid;
    return {
      if (awsInstanceID != null) 'awsInstanceID': awsInstanceID,
      if (fqdn != null) 'fqdn': fqdn,
      if (hostname != null) 'hostname': hostname,
      if (vmPath != null) 'vmPath': vmPath,
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
  startTest,
  startCutover,
  diagnostic,
  terminate,
}

extension on InitiatedBy {
  String toValue() {
    switch (this) {
      case InitiatedBy.startTest:
        return 'START_TEST';
      case InitiatedBy.startCutover:
        return 'START_CUTOVER';
      case InitiatedBy.diagnostic:
        return 'DIAGNOSTIC';
      case InitiatedBy.terminate:
        return 'TERMINATE';
    }
  }
}

extension on String {
  InitiatedBy toInitiatedBy() {
    switch (this) {
      case 'START_TEST':
        return InitiatedBy.startTest;
      case 'START_CUTOVER':
        return InitiatedBy.startCutover;
      case 'DIAGNOSTIC':
        return InitiatedBy.diagnostic;
      case 'TERMINATE':
        return InitiatedBy.terminate;
    }
    throw Exception('$this is not known in enum InitiatedBy');
  }
}

/// Job.
class Job {
  /// Job ID.
  final String jobID;

  /// the ARN of the specific Job.
  final String? arn;

  /// Job creation time.
  final String? creationDateTime;

  /// Job end time.
  final String? endDateTime;

  /// Job initiated by field.
  final InitiatedBy? initiatedBy;

  /// Servers participating in a specific Job.
  final List<ParticipatingServer>? participatingServers;

  /// Job status.
  final JobStatus? status;

  /// Tags associated with specific Job.
  final Map<String, String>? tags;

  /// Job type.
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

/// Job log.
class JobLog {
  /// Job log event.
  final JobLogEvent? event;

  /// Job event data
  final JobLogEventData? eventData;

  /// Job log event date and time.
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
  conversionStart,
  conversionEnd,
  conversionFail,
  launchStart,
  launchFailed,
  jobCancel,
  jobEnd,
}

extension on JobLogEvent {
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

extension on String {
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

/// Job log data
class JobLogEventData {
  /// Job Event conversion Server ID.
  final String? conversionServerID;

  /// Job error.
  final String? rawError;

  /// Job Event Source Server ID.
  final String? sourceServerID;

  /// Job Event Target instance ID.
  final String? targetInstanceID;

  JobLogEventData({
    this.conversionServerID,
    this.rawError,
    this.sourceServerID,
    this.targetInstanceID,
  });

  factory JobLogEventData.fromJson(Map<String, dynamic> json) {
    return JobLogEventData(
      conversionServerID: json['conversionServerID'] as String?,
      rawError: json['rawError'] as String?,
      sourceServerID: json['sourceServerID'] as String?,
      targetInstanceID: json['targetInstanceID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final conversionServerID = this.conversionServerID;
    final rawError = this.rawError;
    final sourceServerID = this.sourceServerID;
    final targetInstanceID = this.targetInstanceID;
    return {
      if (conversionServerID != null) 'conversionServerID': conversionServerID,
      if (rawError != null) 'rawError': rawError,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (targetInstanceID != null) 'targetInstanceID': targetInstanceID,
    };
  }
}

/// Job type.
class JobPostLaunchActionsLaunchStatus {
  /// Job type.
  final String? executionID;

  /// Job type.
  final PostLaunchActionExecutionStatus? executionStatus;

  /// Job type.
  final String? failureReason;

  /// Job type.
  final SsmDocument? ssmDocument;

  /// Job type.
  final SsmDocumentType? ssmDocumentType;

  JobPostLaunchActionsLaunchStatus({
    this.executionID,
    this.executionStatus,
    this.failureReason,
    this.ssmDocument,
    this.ssmDocumentType,
  });

  factory JobPostLaunchActionsLaunchStatus.fromJson(Map<String, dynamic> json) {
    return JobPostLaunchActionsLaunchStatus(
      executionID: json['executionID'] as String?,
      executionStatus: (json['executionStatus'] as String?)
          ?.toPostLaunchActionExecutionStatus(),
      failureReason: json['failureReason'] as String?,
      ssmDocument: json['ssmDocument'] != null
          ? SsmDocument.fromJson(json['ssmDocument'] as Map<String, dynamic>)
          : null,
      ssmDocumentType:
          (json['ssmDocumentType'] as String?)?.toSsmDocumentType(),
    );
  }

  Map<String, dynamic> toJson() {
    final executionID = this.executionID;
    final executionStatus = this.executionStatus;
    final failureReason = this.failureReason;
    final ssmDocument = this.ssmDocument;
    final ssmDocumentType = this.ssmDocumentType;
    return {
      if (executionID != null) 'executionID': executionID,
      if (executionStatus != null) 'executionStatus': executionStatus.toValue(),
      if (failureReason != null) 'failureReason': failureReason,
      if (ssmDocument != null) 'ssmDocument': ssmDocument,
      if (ssmDocumentType != null) 'ssmDocumentType': ssmDocumentType.toValue(),
    };
  }
}

enum JobStatus {
  pending,
  started,
  completed,
}

extension on JobStatus {
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

extension on String {
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
}

extension on JobType {
  String toValue() {
    switch (this) {
      case JobType.launch:
        return 'LAUNCH';
      case JobType.terminate:
        return 'TERMINATE';
    }
  }
}

extension on String {
  JobType toJobType() {
    switch (this) {
      case 'LAUNCH':
        return JobType.launch;
      case 'TERMINATE':
        return JobType.terminate;
    }
    throw Exception('$this is not known in enum JobType');
  }
}

class LaunchConfiguration {
  /// Launch configuration boot mode.
  final BootMode? bootMode;

  /// Copy Private IP during Launch Configuration.
  final bool? copyPrivateIp;

  /// Copy Tags during Launch Configuration.
  final bool? copyTags;

  /// Launch configuration EC2 Launch template ID.
  final String? ec2LaunchTemplateID;

  /// Launch disposition for launch configuration.
  final LaunchDisposition? launchDisposition;

  /// Launch configuration OS licensing.
  final Licensing? licensing;

  /// Launch configuration name.
  final String? name;
  final PostLaunchActions? postLaunchActions;

  /// Launch configuration Source Server ID.
  final String? sourceServerID;

  /// Launch configuration Target instance type right sizing method.
  final TargetInstanceTypeRightSizingMethod?
      targetInstanceTypeRightSizingMethod;

  LaunchConfiguration({
    this.bootMode,
    this.copyPrivateIp,
    this.copyTags,
    this.ec2LaunchTemplateID,
    this.launchDisposition,
    this.licensing,
    this.name,
    this.postLaunchActions,
    this.sourceServerID,
    this.targetInstanceTypeRightSizingMethod,
  });

  factory LaunchConfiguration.fromJson(Map<String, dynamic> json) {
    return LaunchConfiguration(
      bootMode: (json['bootMode'] as String?)?.toBootMode(),
      copyPrivateIp: json['copyPrivateIp'] as bool?,
      copyTags: json['copyTags'] as bool?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      launchDisposition:
          (json['launchDisposition'] as String?)?.toLaunchDisposition(),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      name: json['name'] as String?,
      postLaunchActions: json['postLaunchActions'] != null
          ? PostLaunchActions.fromJson(
              json['postLaunchActions'] as Map<String, dynamic>)
          : null,
      sourceServerID: json['sourceServerID'] as String?,
      targetInstanceTypeRightSizingMethod:
          (json['targetInstanceTypeRightSizingMethod'] as String?)
              ?.toTargetInstanceTypeRightSizingMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final bootMode = this.bootMode;
    final copyPrivateIp = this.copyPrivateIp;
    final copyTags = this.copyTags;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final name = this.name;
    final postLaunchActions = this.postLaunchActions;
    final sourceServerID = this.sourceServerID;
    final targetInstanceTypeRightSizingMethod =
        this.targetInstanceTypeRightSizingMethod;
    return {
      if (bootMode != null) 'bootMode': bootMode.toValue(),
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (name != null) 'name': name,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (targetInstanceTypeRightSizingMethod != null)
        'targetInstanceTypeRightSizingMethod':
            targetInstanceTypeRightSizingMethod.toValue(),
    };
  }
}

class LaunchConfigurationTemplate {
  /// Copy Private IP during Launch Configuration.
  final String launchConfigurationTemplateID;

  /// Copy Private IP during Launch Configuration.
  final String? arn;

  /// Copy Private IP during Launch Configuration.
  final PostLaunchActions? postLaunchActions;

  /// Copy Private IP during Launch Configuration.
  final Map<String, String>? tags;

  LaunchConfigurationTemplate({
    required this.launchConfigurationTemplateID,
    this.arn,
    this.postLaunchActions,
    this.tags,
  });

  factory LaunchConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return LaunchConfigurationTemplate(
      launchConfigurationTemplateID:
          json['launchConfigurationTemplateID'] as String,
      arn: json['arn'] as String?,
      postLaunchActions: json['postLaunchActions'] != null
          ? PostLaunchActions.fromJson(
              json['postLaunchActions'] as Map<String, dynamic>)
          : null,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final launchConfigurationTemplateID = this.launchConfigurationTemplateID;
    final arn = this.arn;
    final postLaunchActions = this.postLaunchActions;
    final tags = this.tags;
    return {
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (tags != null) 'tags': tags,
    };
  }
}

enum LaunchDisposition {
  stopped,
  started,
}

extension on LaunchDisposition {
  String toValue() {
    switch (this) {
      case LaunchDisposition.stopped:
        return 'STOPPED';
      case LaunchDisposition.started:
        return 'STARTED';
    }
  }
}

extension on String {
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

extension on LaunchStatus {
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

extension on String {
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

/// Launched instance.
class LaunchedInstance {
  /// Launched instance EC2 ID.
  final String? ec2InstanceID;

  /// Launched instance first boot.
  final FirstBoot? firstBoot;

  /// Launched instance Job ID.
  final String? jobID;

  LaunchedInstance({
    this.ec2InstanceID,
    this.firstBoot,
    this.jobID,
  });

  factory LaunchedInstance.fromJson(Map<String, dynamic> json) {
    return LaunchedInstance(
      ec2InstanceID: json['ec2InstanceID'] as String?,
      firstBoot: (json['firstBoot'] as String?)?.toFirstBoot(),
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final ec2InstanceID = this.ec2InstanceID;
    final firstBoot = this.firstBoot;
    final jobID = this.jobID;
    return {
      if (ec2InstanceID != null) 'ec2InstanceID': ec2InstanceID,
      if (firstBoot != null) 'firstBoot': firstBoot.toValue(),
      if (jobID != null) 'jobID': jobID,
    };
  }
}

/// Configure Licensing.
class Licensing {
  /// Configure BYOL OS licensing.
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

/// Lifecycle.
class LifeCycle {
  /// Lifecycle added to service data and time.
  final String? addedToServiceDateTime;

  /// Lifecycle elapsed time and duration.
  final String? elapsedReplicationDuration;

  /// Lifecycle replication initiation date and time.
  final String? firstByteDateTime;

  /// Lifecycle last Cutover.
  final LifeCycleLastCutover? lastCutover;

  /// Lifecycle last seen date and time.
  final String? lastSeenByServiceDateTime;

  /// Lifecycle last Test.
  final LifeCycleLastTest? lastTest;

  /// Lifecycle state.
  final LifeCycleState? state;

  LifeCycle({
    this.addedToServiceDateTime,
    this.elapsedReplicationDuration,
    this.firstByteDateTime,
    this.lastCutover,
    this.lastSeenByServiceDateTime,
    this.lastTest,
    this.state,
  });

  factory LifeCycle.fromJson(Map<String, dynamic> json) {
    return LifeCycle(
      addedToServiceDateTime: json['addedToServiceDateTime'] as String?,
      elapsedReplicationDuration: json['elapsedReplicationDuration'] as String?,
      firstByteDateTime: json['firstByteDateTime'] as String?,
      lastCutover: json['lastCutover'] != null
          ? LifeCycleLastCutover.fromJson(
              json['lastCutover'] as Map<String, dynamic>)
          : null,
      lastSeenByServiceDateTime: json['lastSeenByServiceDateTime'] as String?,
      lastTest: json['lastTest'] != null
          ? LifeCycleLastTest.fromJson(json['lastTest'] as Map<String, dynamic>)
          : null,
      state: (json['state'] as String?)?.toLifeCycleState(),
    );
  }

  Map<String, dynamic> toJson() {
    final addedToServiceDateTime = this.addedToServiceDateTime;
    final elapsedReplicationDuration = this.elapsedReplicationDuration;
    final firstByteDateTime = this.firstByteDateTime;
    final lastCutover = this.lastCutover;
    final lastSeenByServiceDateTime = this.lastSeenByServiceDateTime;
    final lastTest = this.lastTest;
    final state = this.state;
    return {
      if (addedToServiceDateTime != null)
        'addedToServiceDateTime': addedToServiceDateTime,
      if (elapsedReplicationDuration != null)
        'elapsedReplicationDuration': elapsedReplicationDuration,
      if (firstByteDateTime != null) 'firstByteDateTime': firstByteDateTime,
      if (lastCutover != null) 'lastCutover': lastCutover,
      if (lastSeenByServiceDateTime != null)
        'lastSeenByServiceDateTime': lastSeenByServiceDateTime,
      if (lastTest != null) 'lastTest': lastTest,
      if (state != null) 'state': state.toValue(),
    };
  }
}

/// Lifecycle last Cutover .
class LifeCycleLastCutover {
  /// Lifecycle Cutover finalized date and time.
  final LifeCycleLastCutoverFinalized? finalized;

  /// Lifecycle last Cutover initiated.
  final LifeCycleLastCutoverInitiated? initiated;

  /// Lifecycle last Cutover reverted.
  final LifeCycleLastCutoverReverted? reverted;

  LifeCycleLastCutover({
    this.finalized,
    this.initiated,
    this.reverted,
  });

  factory LifeCycleLastCutover.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutover(
      finalized: json['finalized'] != null
          ? LifeCycleLastCutoverFinalized.fromJson(
              json['finalized'] as Map<String, dynamic>)
          : null,
      initiated: json['initiated'] != null
          ? LifeCycleLastCutoverInitiated.fromJson(
              json['initiated'] as Map<String, dynamic>)
          : null,
      reverted: json['reverted'] != null
          ? LifeCycleLastCutoverReverted.fromJson(
              json['reverted'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finalized = this.finalized;
    final initiated = this.initiated;
    final reverted = this.reverted;
    return {
      if (finalized != null) 'finalized': finalized,
      if (initiated != null) 'initiated': initiated,
      if (reverted != null) 'reverted': reverted,
    };
  }
}

/// Lifecycle Cutover finalized
class LifeCycleLastCutoverFinalized {
  /// Lifecycle Cutover finalized date and time.
  final String? apiCallDateTime;

  LifeCycleLastCutoverFinalized({
    this.apiCallDateTime,
  });

  factory LifeCycleLastCutoverFinalized.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutoverFinalized(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

/// Lifecycle last Cutover initiated.
class LifeCycleLastCutoverInitiated {
  /// <p/>
  final String? apiCallDateTime;

  /// Lifecycle last Cutover initiated by Job ID.
  final String? jobID;

  LifeCycleLastCutoverInitiated({
    this.apiCallDateTime,
    this.jobID,
  });

  factory LifeCycleLastCutoverInitiated.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutoverInitiated(
      apiCallDateTime: json['apiCallDateTime'] as String?,
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    final jobID = this.jobID;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
      if (jobID != null) 'jobID': jobID,
    };
  }
}

/// Lifecycle last Cutover reverted.
class LifeCycleLastCutoverReverted {
  /// Lifecycle last Cutover reverted API call date time.
  final String? apiCallDateTime;

  LifeCycleLastCutoverReverted({
    this.apiCallDateTime,
  });

  factory LifeCycleLastCutoverReverted.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastCutoverReverted(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

/// Lifecycle last Test.
class LifeCycleLastTest {
  /// Lifecycle last Test finalized.
  final LifeCycleLastTestFinalized? finalized;

  /// Lifecycle last Test initiated.
  final LifeCycleLastTestInitiated? initiated;

  /// Lifecycle last Test reverted.
  final LifeCycleLastTestReverted? reverted;

  LifeCycleLastTest({
    this.finalized,
    this.initiated,
    this.reverted,
  });

  factory LifeCycleLastTest.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTest(
      finalized: json['finalized'] != null
          ? LifeCycleLastTestFinalized.fromJson(
              json['finalized'] as Map<String, dynamic>)
          : null,
      initiated: json['initiated'] != null
          ? LifeCycleLastTestInitiated.fromJson(
              json['initiated'] as Map<String, dynamic>)
          : null,
      reverted: json['reverted'] != null
          ? LifeCycleLastTestReverted.fromJson(
              json['reverted'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final finalized = this.finalized;
    final initiated = this.initiated;
    final reverted = this.reverted;
    return {
      if (finalized != null) 'finalized': finalized,
      if (initiated != null) 'initiated': initiated,
      if (reverted != null) 'reverted': reverted,
    };
  }
}

/// Lifecycle last Test finalized.
class LifeCycleLastTestFinalized {
  /// Lifecycle Test failed API call date and time.
  final String? apiCallDateTime;

  LifeCycleLastTestFinalized({
    this.apiCallDateTime,
  });

  factory LifeCycleLastTestFinalized.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTestFinalized(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

/// Lifecycle last Test initiated.
class LifeCycleLastTestInitiated {
  /// Lifecycle last Test initiated API call date and time.
  final String? apiCallDateTime;

  /// Lifecycle last Test initiated Job ID.
  final String? jobID;

  LifeCycleLastTestInitiated({
    this.apiCallDateTime,
    this.jobID,
  });

  factory LifeCycleLastTestInitiated.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTestInitiated(
      apiCallDateTime: json['apiCallDateTime'] as String?,
      jobID: json['jobID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    final jobID = this.jobID;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
      if (jobID != null) 'jobID': jobID,
    };
  }
}

/// Lifecycle last Test reverted.
class LifeCycleLastTestReverted {
  /// Lifecycle last Test reverted API call date and time.
  final String? apiCallDateTime;

  LifeCycleLastTestReverted({
    this.apiCallDateTime,
  });

  factory LifeCycleLastTestReverted.fromJson(Map<String, dynamic> json) {
    return LifeCycleLastTestReverted(
      apiCallDateTime: json['apiCallDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final apiCallDateTime = this.apiCallDateTime;
    return {
      if (apiCallDateTime != null) 'apiCallDateTime': apiCallDateTime,
    };
  }
}

enum LifeCycleState {
  stopped,
  notReady,
  readyForTest,
  testing,
  readyForCutover,
  cuttingOver,
  cutover,
  disconnected,
  discovered,
}

extension on LifeCycleState {
  String toValue() {
    switch (this) {
      case LifeCycleState.stopped:
        return 'STOPPED';
      case LifeCycleState.notReady:
        return 'NOT_READY';
      case LifeCycleState.readyForTest:
        return 'READY_FOR_TEST';
      case LifeCycleState.testing:
        return 'TESTING';
      case LifeCycleState.readyForCutover:
        return 'READY_FOR_CUTOVER';
      case LifeCycleState.cuttingOver:
        return 'CUTTING_OVER';
      case LifeCycleState.cutover:
        return 'CUTOVER';
      case LifeCycleState.disconnected:
        return 'DISCONNECTED';
      case LifeCycleState.discovered:
        return 'DISCOVERED';
    }
  }
}

extension on String {
  LifeCycleState toLifeCycleState() {
    switch (this) {
      case 'STOPPED':
        return LifeCycleState.stopped;
      case 'NOT_READY':
        return LifeCycleState.notReady;
      case 'READY_FOR_TEST':
        return LifeCycleState.readyForTest;
      case 'TESTING':
        return LifeCycleState.testing;
      case 'READY_FOR_CUTOVER':
        return LifeCycleState.readyForCutover;
      case 'CUTTING_OVER':
        return LifeCycleState.cuttingOver;
      case 'CUTOVER':
        return LifeCycleState.cutover;
      case 'DISCONNECTED':
        return LifeCycleState.disconnected;
      case 'DISCOVERED':
        return LifeCycleState.discovered;
    }
    throw Exception('$this is not known in enum LifeCycleState');
  }
}

class ListTagsForResourceResponse {
  /// List tags for resource response.
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

  /// Network interface primary IP.
  final bool? isPrimary;

  /// Network interface Mac address.
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
  /// OS full string.
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

/// Server participating in Job.
class ParticipatingServer {
  /// Participating server Source Server ID.
  final String sourceServerID;

  /// Participating server launch status.
  final LaunchStatus? launchStatus;

  /// Participating server Source Server ID.
  final String? launchedEc2InstanceID;

  /// Participating server Source Server ID.
  final PostLaunchActionsStatus? postLaunchActionsStatus;

  ParticipatingServer({
    required this.sourceServerID,
    this.launchStatus,
    this.launchedEc2InstanceID,
    this.postLaunchActionsStatus,
  });

  factory ParticipatingServer.fromJson(Map<String, dynamic> json) {
    return ParticipatingServer(
      sourceServerID: json['sourceServerID'] as String,
      launchStatus: (json['launchStatus'] as String?)?.toLaunchStatus(),
      launchedEc2InstanceID: json['launchedEc2InstanceID'] as String?,
      postLaunchActionsStatus: json['postLaunchActionsStatus'] != null
          ? PostLaunchActionsStatus.fromJson(
              json['postLaunchActionsStatus'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final sourceServerID = this.sourceServerID;
    final launchStatus = this.launchStatus;
    final launchedEc2InstanceID = this.launchedEc2InstanceID;
    final postLaunchActionsStatus = this.postLaunchActionsStatus;
    return {
      'sourceServerID': sourceServerID,
      if (launchStatus != null) 'launchStatus': launchStatus.toValue(),
      if (launchedEc2InstanceID != null)
        'launchedEc2InstanceID': launchedEc2InstanceID,
      if (postLaunchActionsStatus != null)
        'postLaunchActionsStatus': postLaunchActionsStatus,
    };
  }
}

enum PostLaunchActionExecutionStatus {
  inProgress,
  success,
  failed,
}

extension on PostLaunchActionExecutionStatus {
  String toValue() {
    switch (this) {
      case PostLaunchActionExecutionStatus.inProgress:
        return 'IN_PROGRESS';
      case PostLaunchActionExecutionStatus.success:
        return 'SUCCESS';
      case PostLaunchActionExecutionStatus.failed:
        return 'FAILED';
    }
  }
}

extension on String {
  PostLaunchActionExecutionStatus toPostLaunchActionExecutionStatus() {
    switch (this) {
      case 'IN_PROGRESS':
        return PostLaunchActionExecutionStatus.inProgress;
      case 'SUCCESS':
        return PostLaunchActionExecutionStatus.success;
      case 'FAILED':
        return PostLaunchActionExecutionStatus.failed;
    }
    throw Exception(
        '$this is not known in enum PostLaunchActionExecutionStatus');
  }
}

/// Server participating in Job.
class PostLaunchActions {
  /// Server participating in Job.
  final String? cloudWatchLogGroupName;

  /// Server participating in Job.
  final PostLaunchActionsDeploymentType? deployment;

  /// Server participating in Job.
  final String? s3LogBucket;

  /// Server participating in Job.
  final String? s3OutputKeyPrefix;

  /// Server participating in Job.
  final List<SsmDocument>? ssmDocuments;

  PostLaunchActions({
    this.cloudWatchLogGroupName,
    this.deployment,
    this.s3LogBucket,
    this.s3OutputKeyPrefix,
    this.ssmDocuments,
  });

  factory PostLaunchActions.fromJson(Map<String, dynamic> json) {
    return PostLaunchActions(
      cloudWatchLogGroupName: json['cloudWatchLogGroupName'] as String?,
      deployment:
          (json['deployment'] as String?)?.toPostLaunchActionsDeploymentType(),
      s3LogBucket: json['s3LogBucket'] as String?,
      s3OutputKeyPrefix: json['s3OutputKeyPrefix'] as String?,
      ssmDocuments: (json['ssmDocuments'] as List?)
          ?.whereNotNull()
          .map((e) => SsmDocument.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchLogGroupName = this.cloudWatchLogGroupName;
    final deployment = this.deployment;
    final s3LogBucket = this.s3LogBucket;
    final s3OutputKeyPrefix = this.s3OutputKeyPrefix;
    final ssmDocuments = this.ssmDocuments;
    return {
      if (cloudWatchLogGroupName != null)
        'cloudWatchLogGroupName': cloudWatchLogGroupName,
      if (deployment != null) 'deployment': deployment.toValue(),
      if (s3LogBucket != null) 's3LogBucket': s3LogBucket,
      if (s3OutputKeyPrefix != null) 's3OutputKeyPrefix': s3OutputKeyPrefix,
      if (ssmDocuments != null) 'ssmDocuments': ssmDocuments,
    };
  }
}

enum PostLaunchActionsDeploymentType {
  testAndCutover,
  cutoverOnly,
}

extension on PostLaunchActionsDeploymentType {
  String toValue() {
    switch (this) {
      case PostLaunchActionsDeploymentType.testAndCutover:
        return 'TEST_AND_CUTOVER';
      case PostLaunchActionsDeploymentType.cutoverOnly:
        return 'CUTOVER_ONLY';
    }
  }
}

extension on String {
  PostLaunchActionsDeploymentType toPostLaunchActionsDeploymentType() {
    switch (this) {
      case 'TEST_AND_CUTOVER':
        return PostLaunchActionsDeploymentType.testAndCutover;
      case 'CUTOVER_ONLY':
        return PostLaunchActionsDeploymentType.cutoverOnly;
    }
    throw Exception(
        '$this is not known in enum PostLaunchActionsDeploymentType');
  }
}

/// Server participating in Job.
class PostLaunchActionsStatus {
  /// Server participating in Job.
  final List<JobPostLaunchActionsLaunchStatus>?
      postLaunchActionsLaunchStatusList;

  /// Server participating in Job.
  final String? ssmAgentDiscoveryDatetime;

  PostLaunchActionsStatus({
    this.postLaunchActionsLaunchStatusList,
    this.ssmAgentDiscoveryDatetime,
  });

  factory PostLaunchActionsStatus.fromJson(Map<String, dynamic> json) {
    return PostLaunchActionsStatus(
      postLaunchActionsLaunchStatusList:
          (json['postLaunchActionsLaunchStatusList'] as List?)
              ?.whereNotNull()
              .map((e) => JobPostLaunchActionsLaunchStatus.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
      ssmAgentDiscoveryDatetime: json['ssmAgentDiscoveryDatetime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final postLaunchActionsLaunchStatusList =
        this.postLaunchActionsLaunchStatusList;
    final ssmAgentDiscoveryDatetime = this.ssmAgentDiscoveryDatetime;
    return {
      if (postLaunchActionsLaunchStatusList != null)
        'postLaunchActionsLaunchStatusList': postLaunchActionsLaunchStatusList,
      if (ssmAgentDiscoveryDatetime != null)
        'ssmAgentDiscoveryDatetime': ssmAgentDiscoveryDatetime,
    };
  }
}

class ReplicationConfiguration {
  /// Replication Configuration associate default Application Migration Service
  /// Security Group.
  final bool? associateDefaultSecurityGroup;

  /// Replication Configuration set bandwidth throttling.
  final int? bandwidthThrottling;

  /// Replication Configuration create Public IP.
  final bool? createPublicIP;

  /// Replication Configuration data plane routing.
  final ReplicationConfigurationDataPlaneRouting? dataPlaneRouting;

  /// Replication Configuration use default large Staging Disks.
  final ReplicationConfigurationDefaultLargeStagingDiskType?
      defaultLargeStagingDiskType;

  /// Replication Configuration EBS encryption.
  final ReplicationConfigurationEbsEncryption? ebsEncryption;

  /// Replication Configuration EBS encryption key ARN.
  final String? ebsEncryptionKeyArn;

  /// Replication Configuration name.
  final String? name;

  /// Replication Configuration replicated disks.
  final List<ReplicationConfigurationReplicatedDisk>? replicatedDisks;

  /// Replication Configuration Replication Server instance type.
  final String? replicationServerInstanceType;

  /// Replication Configuration Replication Server Security Group IDs.
  final List<String>? replicationServersSecurityGroupsIDs;

  /// Replication Configuration Source Server ID.
  final String? sourceServerID;

  /// Replication Configuration Staging Area subnet ID.
  final String? stagingAreaSubnetId;

  /// Replication Configuration Staging Area tags.
  final Map<String, String>? stagingAreaTags;

  /// Replication Configuration use Dedicated Replication Server.
  final bool? useDedicatedReplicationServer;

  ReplicationConfiguration({
    this.associateDefaultSecurityGroup,
    this.bandwidthThrottling,
    this.createPublicIP,
    this.dataPlaneRouting,
    this.defaultLargeStagingDiskType,
    this.ebsEncryption,
    this.ebsEncryptionKeyArn,
    this.name,
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
    final bandwidthThrottling = this.bandwidthThrottling;
    final createPublicIP = this.createPublicIP;
    final dataPlaneRouting = this.dataPlaneRouting;
    final defaultLargeStagingDiskType = this.defaultLargeStagingDiskType;
    final ebsEncryption = this.ebsEncryption;
    final ebsEncryptionKeyArn = this.ebsEncryptionKeyArn;
    final name = this.name;
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

extension on ReplicationConfigurationDataPlaneRouting {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationDataPlaneRouting.privateIp:
        return 'PRIVATE_IP';
      case ReplicationConfigurationDataPlaneRouting.publicIp:
        return 'PUBLIC_IP';
    }
  }
}

extension on String {
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
  st1,
  gp3,
}

extension on ReplicationConfigurationDefaultLargeStagingDiskType {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationDefaultLargeStagingDiskType.gp2:
        return 'GP2';
      case ReplicationConfigurationDefaultLargeStagingDiskType.st1:
        return 'ST1';
      case ReplicationConfigurationDefaultLargeStagingDiskType.gp3:
        return 'GP3';
    }
  }
}

extension on String {
  ReplicationConfigurationDefaultLargeStagingDiskType
      toReplicationConfigurationDefaultLargeStagingDiskType() {
    switch (this) {
      case 'GP2':
        return ReplicationConfigurationDefaultLargeStagingDiskType.gp2;
      case 'ST1':
        return ReplicationConfigurationDefaultLargeStagingDiskType.st1;
      case 'GP3':
        return ReplicationConfigurationDefaultLargeStagingDiskType.gp3;
    }
    throw Exception(
        '$this is not known in enum ReplicationConfigurationDefaultLargeStagingDiskType');
  }
}

enum ReplicationConfigurationEbsEncryption {
  $default,
  custom,
}

extension on ReplicationConfigurationEbsEncryption {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationEbsEncryption.$default:
        return 'DEFAULT';
      case ReplicationConfigurationEbsEncryption.custom:
        return 'CUSTOM';
    }
  }
}

extension on String {
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

/// Replication Configuration replicated disk.
class ReplicationConfigurationReplicatedDisk {
  /// Replication Configuration replicated disk device name.
  final String? deviceName;

  /// Replication Configuration replicated disk IOPs.
  final int? iops;

  /// Replication Configuration replicated disk boot disk.
  final bool? isBootDisk;

  /// Replication Configuration replicated disk staging disk type.
  final ReplicationConfigurationReplicatedDiskStagingDiskType? stagingDiskType;

  /// Replication Configuration replicated disk throughput.
  final int? throughput;

  ReplicationConfigurationReplicatedDisk({
    this.deviceName,
    this.iops,
    this.isBootDisk,
    this.stagingDiskType,
    this.throughput,
  });

  factory ReplicationConfigurationReplicatedDisk.fromJson(
      Map<String, dynamic> json) {
    return ReplicationConfigurationReplicatedDisk(
      deviceName: json['deviceName'] as String?,
      iops: json['iops'] as int?,
      isBootDisk: json['isBootDisk'] as bool?,
      stagingDiskType: (json['stagingDiskType'] as String?)
          ?.toReplicationConfigurationReplicatedDiskStagingDiskType(),
      throughput: json['throughput'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final deviceName = this.deviceName;
    final iops = this.iops;
    final isBootDisk = this.isBootDisk;
    final stagingDiskType = this.stagingDiskType;
    final throughput = this.throughput;
    return {
      if (deviceName != null) 'deviceName': deviceName,
      if (iops != null) 'iops': iops,
      if (isBootDisk != null) 'isBootDisk': isBootDisk,
      if (stagingDiskType != null) 'stagingDiskType': stagingDiskType.toValue(),
      if (throughput != null) 'throughput': throughput,
    };
  }
}

enum ReplicationConfigurationReplicatedDiskStagingDiskType {
  auto,
  gp2,
  io1,
  sc1,
  st1,
  standard,
  gp3,
  io2,
}

extension on ReplicationConfigurationReplicatedDiskStagingDiskType {
  String toValue() {
    switch (this) {
      case ReplicationConfigurationReplicatedDiskStagingDiskType.auto:
        return 'AUTO';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.gp2:
        return 'GP2';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.io1:
        return 'IO1';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.sc1:
        return 'SC1';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.st1:
        return 'ST1';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.standard:
        return 'STANDARD';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.gp3:
        return 'GP3';
      case ReplicationConfigurationReplicatedDiskStagingDiskType.io2:
        return 'IO2';
    }
  }
}

extension on String {
  ReplicationConfigurationReplicatedDiskStagingDiskType
      toReplicationConfigurationReplicatedDiskStagingDiskType() {
    switch (this) {
      case 'AUTO':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.auto;
      case 'GP2':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.gp2;
      case 'IO1':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.io1;
      case 'SC1':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.sc1;
      case 'ST1':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.st1;
      case 'STANDARD':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.standard;
      case 'GP3':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.gp3;
      case 'IO2':
        return ReplicationConfigurationReplicatedDiskStagingDiskType.io2;
    }
    throw Exception(
        '$this is not known in enum ReplicationConfigurationReplicatedDiskStagingDiskType');
  }
}

class ReplicationConfigurationTemplate {
  /// Replication Configuration template ID.
  final String replicationConfigurationTemplateID;

  /// Replication Configuration template ARN.
  final String? arn;

  /// Replication Configuration template associate default Application Migration
  /// Service Security group.
  final bool? associateDefaultSecurityGroup;

  /// Replication Configuration template bandwidth throttling.
  final int? bandwidthThrottling;

  /// Replication Configuration template create Public IP.
  final bool? createPublicIP;

  /// Replication Configuration template data plane routing.
  final ReplicationConfigurationDataPlaneRouting? dataPlaneRouting;

  /// Replication Configuration template use default large Staging Disk type.
  final ReplicationConfigurationDefaultLargeStagingDiskType?
      defaultLargeStagingDiskType;

  /// Replication Configuration template EBS encryption.
  final ReplicationConfigurationEbsEncryption? ebsEncryption;

  /// Replication Configuration template EBS encryption key ARN.
  final String? ebsEncryptionKeyArn;

  /// Replication Configuration template server instance type.
  final String? replicationServerInstanceType;

  /// Replication Configuration template server Security Groups IDs.
  final List<String>? replicationServersSecurityGroupsIDs;

  /// Replication Configuration template Staging Area subnet ID.
  final String? stagingAreaSubnetId;

  /// Replication Configuration template Staging Area Tags.
  final Map<String, String>? stagingAreaTags;

  /// Replication Configuration template Tags.
  final Map<String, String>? tags;

  /// Replication Configuration template use Dedicated Replication Server.
  final bool? useDedicatedReplicationServer;

  ReplicationConfigurationTemplate({
    required this.replicationConfigurationTemplateID,
    this.arn,
    this.associateDefaultSecurityGroup,
    this.bandwidthThrottling,
    this.createPublicIP,
    this.dataPlaneRouting,
    this.defaultLargeStagingDiskType,
    this.ebsEncryption,
    this.ebsEncryptionKeyArn,
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
    final bandwidthThrottling = this.bandwidthThrottling;
    final createPublicIP = this.createPublicIP;
    final dataPlaneRouting = this.dataPlaneRouting;
    final defaultLargeStagingDiskType = this.defaultLargeStagingDiskType;
    final ebsEncryption = this.ebsEncryption;
    final ebsEncryptionKeyArn = this.ebsEncryptionKeyArn;
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

enum ReplicationType {
  agentBased,
  snapshotShipping,
}

extension on ReplicationType {
  String toValue() {
    switch (this) {
      case ReplicationType.agentBased:
        return 'AGENT_BASED';
      case ReplicationType.snapshotShipping:
        return 'SNAPSHOT_SHIPPING';
    }
  }
}

extension on String {
  ReplicationType toReplicationType() {
    switch (this) {
      case 'AGENT_BASED':
        return ReplicationType.agentBased;
      case 'SNAPSHOT_SHIPPING':
        return ReplicationType.snapshotShipping;
    }
    throw Exception('$this is not known in enum ReplicationType');
  }
}

/// Source server properties.
class SourceProperties {
  /// Source Server CPUs.
  final List<CPU>? cpus;

  /// Source Server disks.
  final List<Disk>? disks;

  /// Source server identification hints.
  final IdentificationHints? identificationHints;

  /// Source server last update date and time.
  final String? lastUpdatedDateTime;

  /// Source server network interfaces.
  final List<NetworkInterface>? networkInterfaces;

  /// Source server OS.
  final OS? os;

  /// Source server RAM in bytes.
  final int? ramBytes;

  /// Source server recommended instance type.
  final String? recommendedInstanceType;

  SourceProperties({
    this.cpus,
    this.disks,
    this.identificationHints,
    this.lastUpdatedDateTime,
    this.networkInterfaces,
    this.os,
    this.ramBytes,
    this.recommendedInstanceType,
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
    };
  }
}

class SourceServer {
  /// Source server ARN.
  final String? arn;

  /// Source server data replication info.
  final DataReplicationInfo? dataReplicationInfo;

  /// Source server archived status.
  final bool? isArchived;

  /// Source server launched instance.
  final LaunchedInstance? launchedInstance;

  /// Source server lifecycle state.
  final LifeCycle? lifeCycle;

  /// Source server replication type.
  final ReplicationType? replicationType;

  /// Source server properties.
  final SourceProperties? sourceProperties;

  /// Source server ID.
  final String? sourceServerID;

  /// Source server Tags.
  final Map<String, String>? tags;

  /// Source server vCenter client id.
  final String? vcenterClientID;

  SourceServer({
    this.arn,
    this.dataReplicationInfo,
    this.isArchived,
    this.launchedInstance,
    this.lifeCycle,
    this.replicationType,
    this.sourceProperties,
    this.sourceServerID,
    this.tags,
    this.vcenterClientID,
  });

  factory SourceServer.fromJson(Map<String, dynamic> json) {
    return SourceServer(
      arn: json['arn'] as String?,
      dataReplicationInfo: json['dataReplicationInfo'] != null
          ? DataReplicationInfo.fromJson(
              json['dataReplicationInfo'] as Map<String, dynamic>)
          : null,
      isArchived: json['isArchived'] as bool?,
      launchedInstance: json['launchedInstance'] != null
          ? LaunchedInstance.fromJson(
              json['launchedInstance'] as Map<String, dynamic>)
          : null,
      lifeCycle: json['lifeCycle'] != null
          ? LifeCycle.fromJson(json['lifeCycle'] as Map<String, dynamic>)
          : null,
      replicationType:
          (json['replicationType'] as String?)?.toReplicationType(),
      sourceProperties: json['sourceProperties'] != null
          ? SourceProperties.fromJson(
              json['sourceProperties'] as Map<String, dynamic>)
          : null,
      sourceServerID: json['sourceServerID'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vcenterClientID: json['vcenterClientID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final dataReplicationInfo = this.dataReplicationInfo;
    final isArchived = this.isArchived;
    final launchedInstance = this.launchedInstance;
    final lifeCycle = this.lifeCycle;
    final replicationType = this.replicationType;
    final sourceProperties = this.sourceProperties;
    final sourceServerID = this.sourceServerID;
    final tags = this.tags;
    final vcenterClientID = this.vcenterClientID;
    return {
      if (arn != null) 'arn': arn,
      if (dataReplicationInfo != null)
        'dataReplicationInfo': dataReplicationInfo,
      if (isArchived != null) 'isArchived': isArchived,
      if (launchedInstance != null) 'launchedInstance': launchedInstance,
      if (lifeCycle != null) 'lifeCycle': lifeCycle,
      if (replicationType != null) 'replicationType': replicationType.toValue(),
      if (sourceProperties != null) 'sourceProperties': sourceProperties,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (tags != null) 'tags': tags,
      if (vcenterClientID != null) 'vcenterClientID': vcenterClientID,
    };
  }
}

/// Source server replication type.
class SsmDocument {
  /// Source server replication type.
  final String actionName;

  /// Source server replication type.
  final String ssmDocumentName;

  /// Source server replication type.
  final bool? mustSucceedForCutover;

  /// Source server replication type.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// Source server replication type.
  final int? timeoutSeconds;

  SsmDocument({
    required this.actionName,
    required this.ssmDocumentName,
    this.mustSucceedForCutover,
    this.parameters,
    this.timeoutSeconds,
  });

  factory SsmDocument.fromJson(Map<String, dynamic> json) {
    return SsmDocument(
      actionName: json['actionName'] as String,
      ssmDocumentName: json['ssmDocumentName'] as String,
      mustSucceedForCutover: json['mustSucceedForCutover'] as bool?,
      parameters: (json['parameters'] as Map<String, dynamic>?)?.map((k, e) =>
          MapEntry(
              k,
              (e as List)
                  .whereNotNull()
                  .map((e) => SsmParameterStoreParameter.fromJson(
                      e as Map<String, dynamic>))
                  .toList())),
      timeoutSeconds: json['timeoutSeconds'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final actionName = this.actionName;
    final ssmDocumentName = this.ssmDocumentName;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      'actionName': actionName,
      'ssmDocumentName': ssmDocumentName,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
  }
}

enum SsmDocumentType {
  automation,
  command,
}

extension on SsmDocumentType {
  String toValue() {
    switch (this) {
      case SsmDocumentType.automation:
        return 'AUTOMATION';
      case SsmDocumentType.command:
        return 'COMMAND';
    }
  }
}

extension on String {
  SsmDocumentType toSsmDocumentType() {
    switch (this) {
      case 'AUTOMATION':
        return SsmDocumentType.automation;
      case 'COMMAND':
        return SsmDocumentType.command;
    }
    throw Exception('$this is not known in enum SsmDocumentType');
  }
}

/// Source server replication type.
class SsmParameterStoreParameter {
  /// Source server replication type.
  final String parameterName;

  /// Source server replication type.
  final SsmParameterStoreParameterType parameterType;

  SsmParameterStoreParameter({
    required this.parameterName,
    required this.parameterType,
  });

  factory SsmParameterStoreParameter.fromJson(Map<String, dynamic> json) {
    return SsmParameterStoreParameter(
      parameterName: json['parameterName'] as String,
      parameterType:
          (json['parameterType'] as String).toSsmParameterStoreParameterType(),
    );
  }

  Map<String, dynamic> toJson() {
    final parameterName = this.parameterName;
    final parameterType = this.parameterType;
    return {
      'parameterName': parameterName,
      'parameterType': parameterType.toValue(),
    };
  }
}

enum SsmParameterStoreParameterType {
  string,
}

extension on SsmParameterStoreParameterType {
  String toValue() {
    switch (this) {
      case SsmParameterStoreParameterType.string:
        return 'STRING';
    }
  }
}

extension on String {
  SsmParameterStoreParameterType toSsmParameterStoreParameterType() {
    switch (this) {
      case 'STRING':
        return SsmParameterStoreParameterType.string;
    }
    throw Exception(
        '$this is not known in enum SsmParameterStoreParameterType');
  }
}

class StartCutoverResponse {
  /// Start Cutover Job response.
  final Job? job;

  StartCutoverResponse({
    this.job,
  });

  factory StartCutoverResponse.fromJson(Map<String, dynamic> json) {
    return StartCutoverResponse(
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

class StartTestResponse {
  /// Start Test Job response.
  final Job? job;

  StartTestResponse({
    this.job,
  });

  factory StartTestResponse.fromJson(Map<String, dynamic> json) {
    return StartTestResponse(
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

enum TargetInstanceTypeRightSizingMethod {
  none,
  basic,
}

extension on TargetInstanceTypeRightSizingMethod {
  String toValue() {
    switch (this) {
      case TargetInstanceTypeRightSizingMethod.none:
        return 'NONE';
      case TargetInstanceTypeRightSizingMethod.basic:
        return 'BASIC';
    }
  }
}

extension on String {
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

class TerminateTargetInstancesResponse {
  /// Terminate Target instance Job response.
  final Job? job;

  TerminateTargetInstancesResponse({
    this.job,
  });

  factory TerminateTargetInstancesResponse.fromJson(Map<String, dynamic> json) {
    return TerminateTargetInstancesResponse(
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

/// vCenter client.
class VcenterClient {
  /// Arn of vCenter client.
  final String? arn;

  /// Datacenter name of vCenter client.
  final String? datacenterName;

  /// Hostname of vCenter client .
  final String? hostname;

  /// Last seen time of vCenter client.
  final String? lastSeenDatetime;

  /// Tags for Source Server of vCenter client.
  final Map<String, String>? sourceServerTags;

  /// Tags for vCenter client.
  final Map<String, String>? tags;

  /// ID of vCenter client.
  final String? vcenterClientID;

  /// Vcenter UUID of vCenter client.
  final String? vcenterUUID;

  VcenterClient({
    this.arn,
    this.datacenterName,
    this.hostname,
    this.lastSeenDatetime,
    this.sourceServerTags,
    this.tags,
    this.vcenterClientID,
    this.vcenterUUID,
  });

  factory VcenterClient.fromJson(Map<String, dynamic> json) {
    return VcenterClient(
      arn: json['arn'] as String?,
      datacenterName: json['datacenterName'] as String?,
      hostname: json['hostname'] as String?,
      lastSeenDatetime: json['lastSeenDatetime'] as String?,
      sourceServerTags: (json['sourceServerTags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      vcenterClientID: json['vcenterClientID'] as String?,
      vcenterUUID: json['vcenterUUID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final datacenterName = this.datacenterName;
    final hostname = this.hostname;
    final lastSeenDatetime = this.lastSeenDatetime;
    final sourceServerTags = this.sourceServerTags;
    final tags = this.tags;
    final vcenterClientID = this.vcenterClientID;
    final vcenterUUID = this.vcenterUUID;
    return {
      if (arn != null) 'arn': arn,
      if (datacenterName != null) 'datacenterName': datacenterName,
      if (hostname != null) 'hostname': hostname,
      if (lastSeenDatetime != null) 'lastSeenDatetime': lastSeenDatetime,
      if (sourceServerTags != null) 'sourceServerTags': sourceServerTags,
      if (tags != null) 'tags': tags,
      if (vcenterClientID != null) 'vcenterClientID': vcenterClientID,
      if (vcenterUUID != null) 'vcenterUUID': vcenterUUID,
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
