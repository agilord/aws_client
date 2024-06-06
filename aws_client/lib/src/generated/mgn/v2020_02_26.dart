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

/// The Application Migration Service service.
class Mgn {
  final _s.RestJsonProtocol _protocol;
  Mgn({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
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

  /// Archive application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Application> archiveApplication({
    required String applicationID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ArchiveApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Archive wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Wave> archiveWave({
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ArchiveWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }

  /// Associate applications to wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationIDs] :
  /// Application IDs list.
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> associateApplications({
    required List<String> applicationIDs,
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationIDs': applicationIDs,
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AssociateApplications',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Associate source servers to application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [sourceServerIDs] :
  /// Source server IDs list.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> associateSourceServers({
    required String applicationID,
    required List<String> sourceServerIDs,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/AssociateSourceServers',
      exceptionFnMap: _exceptionFns,
    );
  }

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
  ///
  /// Parameter [accountID] :
  /// The request to change the source server migration account ID.
  Future<SourceServer> changeServerLifeCycleState({
    required ChangeServerLifeCycleStateSourceServerLifecycle lifeCycle,
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'lifeCycle': lifeCycle,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ChangeServerLifeCycleState',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Create application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// Application name.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Application description.
  ///
  /// Parameter [tags] :
  /// Application tags.
  Future<Application> createApplication({
    required String name,
    String? accountID,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Create Connector.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [name] :
  /// Create Connector request name.
  ///
  /// Parameter [ssmInstanceID] :
  /// Create Connector request SSM instance ID.
  ///
  /// Parameter [ssmCommandConfig] :
  /// Create Connector request SSM command config.
  ///
  /// Parameter [tags] :
  /// Create Connector request tags.
  Future<Connector> createConnector({
    required String name,
    required String ssmInstanceID,
    ConnectorSsmCommandConfig? ssmCommandConfig,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      'ssmInstanceID': ssmInstanceID,
      if (ssmCommandConfig != null) 'ssmCommandConfig': ssmCommandConfig,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateConnector',
      exceptionFnMap: _exceptionFns,
    );
    return Connector.fromJson(response);
  }

  /// Creates a new Launch Configuration Template.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [associatePublicIpAddress] :
  /// Associate public Ip address.
  ///
  /// Parameter [bootMode] :
  /// Launch configuration template boot mode.
  ///
  /// Parameter [copyPrivateIp] :
  /// Copy private Ip.
  ///
  /// Parameter [copyTags] :
  /// Copy tags.
  ///
  /// Parameter [enableMapAutoTagging] :
  /// Enable map auto tagging.
  ///
  /// Parameter [largeVolumeConf] :
  /// Large volume config.
  ///
  /// Parameter [launchDisposition] :
  /// Launch disposition.
  ///
  /// Parameter [mapAutoTaggingMpeID] :
  /// Launch configuration template map auto tagging MPE ID.
  ///
  /// Parameter [postLaunchActions] :
  /// Launch configuration template post launch actions.
  ///
  /// Parameter [smallVolumeConf] :
  /// Small volume config.
  ///
  /// Parameter [smallVolumeMaxSize] :
  /// Small volume maximum size.
  ///
  /// Parameter [tags] :
  /// Request to associate tags during creation of a Launch Configuration
  /// Template.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Target instance type right-sizing method.
  Future<LaunchConfigurationTemplate> createLaunchConfigurationTemplate({
    bool? associatePublicIpAddress,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    bool? enableMapAutoTagging,
    LaunchTemplateDiskConf? largeVolumeConf,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? mapAutoTaggingMpeID,
    PostLaunchActions? postLaunchActions,
    LaunchTemplateDiskConf? smallVolumeConf,
    int? smallVolumeMaxSize,
    Map<String, String>? tags,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    _s.validateNumRange(
      'smallVolumeMaxSize',
      smallVolumeMaxSize,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (bootMode != null) 'bootMode': bootMode.toValue(),
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (largeVolumeConf != null) 'largeVolumeConf': largeVolumeConf,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (smallVolumeConf != null) 'smallVolumeConf': smallVolumeConf,
      if (smallVolumeMaxSize != null) 'smallVolumeMaxSize': smallVolumeMaxSize,
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
  ///
  /// Parameter [useFipsEndpoint] :
  /// Request to use Fips Endpoint during Replication Settings template
  /// creation.
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
    bool? useFipsEndpoint,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      10000,
      isRequired: true,
    );
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
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfigurationTemplate.fromJson(response);
  }

  /// Create wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [name] :
  /// Wave name.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Wave description.
  ///
  /// Parameter [tags] :
  /// Wave tags.
  Future<Wave> createWave({
    required String name,
    String? accountID,
    String? description,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'name': name,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (tags != null) 'tags': tags,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/CreateWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }

  /// Delete application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> deleteApplication({
    required String applicationID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteApplication',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Delete Connector.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorID] :
  /// Delete Connector request connector ID.
  Future<void> deleteConnector({
    required String connectorID,
  }) async {
    final $payload = <String, dynamic>{
      'connectorID': connectorID,
    };
    await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteConnector',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Deletes a single Job by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [jobID] :
  /// Request to delete Job from service by Job ID.
  ///
  /// Parameter [accountID] :
  /// Request to delete Job from service by Account ID.
  Future<void> deleteJob({
    required String jobID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'jobID': jobID,
      if (accountID != null) 'accountID': accountID,
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
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// ID of resource to be deleted.
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
  ///
  /// Parameter [accountID] :
  /// Request to delete Source Server from service by Account ID.
  Future<void> deleteSourceServer({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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

  /// Delete wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> deleteWave({
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DeleteWave',
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
  /// Parameter [accountID] :
  /// Request to describe Job log Account ID.
  ///
  /// Parameter [maxResults] :
  /// Request to describe Job log item maximum results.
  ///
  /// Parameter [nextToken] :
  /// Request to describe Job log next token.
  Future<DescribeJobLogItemsResponse> describeJobLogItems({
    required String jobID,
    String? accountID,
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
      'jobID': jobID,
      if (accountID != null) 'accountID': accountID,
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
  /// Parameter [accountID] :
  /// Request to describe job log items by Account ID.
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
    String? accountID,
    DescribeJobsRequestFilters? filters,
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
      if (accountID != null) 'accountID': accountID,
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
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [launchConfigurationTemplateIDs] :
  /// Request to filter Launch Configuration Templates list by Launch
  /// Configuration Template ID.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to be returned in DescribeLaunchConfigurationTemplates.
  ///
  /// Parameter [nextToken] :
  /// Next pagination token returned from DescribeLaunchConfigurationTemplates.
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
      1000,
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
  /// Parameter [accountID] :
  /// Request to filter Source Servers list by Accoun ID.
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
    String? accountID,
    DescribeSourceServersRequestFilters? filters,
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
      if (accountID != null) 'accountID': accountID,
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
      1000,
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

  /// Disassociate applications from wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationIDs] :
  /// Application IDs list.
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> disassociateApplications({
    required List<String> applicationIDs,
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationIDs': applicationIDs,
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisassociateApplications',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Disassociate source servers from application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [sourceServerIDs] :
  /// Source server IDs list.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<void> disassociateSourceServers({
    required String applicationID,
    required List<String> sourceServerIDs,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/DisassociateSourceServers',
      exceptionFnMap: _exceptionFns,
    );
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
  ///
  /// Parameter [accountID] :
  /// Request to disconnect Source Server from service by Account ID.
  Future<SourceServer> disconnectFromService({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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
  ///
  /// Parameter [accountID] :
  /// Request to finalize Cutover by Source Account ID.
  Future<SourceServer> finalizeCutover({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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
  ///
  /// Parameter [accountID] :
  /// Request to get Launch Configuration information by Account ID.
  Future<LaunchConfiguration> getLaunchConfiguration({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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
  ///
  /// Parameter [accountID] :
  /// Request to get Replication Configuration by Account ID.
  Future<ReplicationConfiguration> getReplicationConfiguration({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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

  /// Retrieves all applications or multiple applications by ID.
  ///
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [accountID] :
  /// Applications list Account ID.
  ///
  /// Parameter [filters] :
  /// Applications list filters.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to return when listing applications.
  ///
  /// Parameter [nextToken] :
  /// Request next token.
  Future<ListApplicationsResponse> listApplications({
    String? accountID,
    ListApplicationsRequestFilters? filters,
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
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListApplications',
      exceptionFnMap: _exceptionFns,
    );
    return ListApplicationsResponse.fromJson(response);
  }

  /// List Connectors.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// List Connectors Request filters.
  ///
  /// Parameter [maxResults] :
  /// List Connectors Request max results.
  ///
  /// Parameter [nextToken] :
  /// List Connectors Request next token.
  Future<ListConnectorsResponse> listConnectors({
    ListConnectorsRequestFilters? filters,
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
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListConnectors',
      exceptionFnMap: _exceptionFns,
    );
    return ListConnectorsResponse.fromJson(response);
  }

  /// List export errors.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [exportID] :
  /// List export errors request export id.
  ///
  /// Parameter [maxResults] :
  /// List export errors request max results.
  ///
  /// Parameter [nextToken] :
  /// List export errors request next token.
  Future<ListExportErrorsResponse> listExportErrors({
    required String exportID,
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
      'exportID': exportID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListExportErrors',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportErrorsResponse.fromJson(response);
  }

  /// List exports.
  ///
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [maxResults] :
  /// List export request max results.
  ///
  /// Parameter [nextToken] :
  /// List export request next token.
  Future<ListExportsResponse> listExports({
    ListExportsRequestFilters? filters,
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
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListExports',
      exceptionFnMap: _exceptionFns,
    );
    return ListExportsResponse.fromJson(response);
  }

  /// List import errors.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [importID] :
  /// List import errors request import id.
  ///
  /// Parameter [maxResults] :
  /// List import errors request max results.
  ///
  /// Parameter [nextToken] :
  /// List import errors request next token.
  Future<ListImportErrorsResponse> listImportErrors({
    required String importID,
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
      'importID': importID,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImportErrors',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportErrorsResponse.fromJson(response);
  }

  /// List imports.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [filters] :
  /// List imports request filters.
  ///
  /// Parameter [maxResults] :
  /// List imports request max results.
  ///
  /// Parameter [nextToken] :
  /// List imports request next token.
  Future<ListImportsResponse> listImports({
    ListImportsRequestFilters? filters,
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
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListImports',
      exceptionFnMap: _exceptionFns,
    );
    return ListImportsResponse.fromJson(response);
  }

  /// List Managed Accounts.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  ///
  /// Parameter [maxResults] :
  /// List managed accounts request max results.
  ///
  /// Parameter [nextToken] :
  /// List managed accounts request next token.
  Future<ListManagedAccountsResponse> listManagedAccounts({
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
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListManagedAccounts',
      exceptionFnMap: _exceptionFns,
    );
    return ListManagedAccountsResponse.fromJson(response);
  }

  /// List source server post migration custom actions.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [sourceServerID] :
  /// Source server ID.
  ///
  /// Parameter [accountID] :
  /// Account ID to return when listing source server post migration custom
  /// actions.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing source server post migration custom actions.
  ///
  /// Parameter [maxResults] :
  /// Maximum amount of items to return when listing source server post
  /// migration custom actions.
  ///
  /// Parameter [nextToken] :
  /// Next token to use when listing source server post migration custom
  /// actions.
  Future<ListSourceServerActionsResponse> listSourceServerActions({
    required String sourceServerID,
    String? accountID,
    SourceServerActionsRequestFilters? filters,
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
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListSourceServerActions',
      exceptionFnMap: _exceptionFns,
    );
    return ListSourceServerActionsResponse.fromJson(response);
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
    final response = await _protocol.send(
      payload: null,
      method: 'GET',
      requestUri: '/tags/${Uri.encodeComponent(resourceArn)}',
      exceptionFnMap: _exceptionFns,
    );
    return ListTagsForResourceResponse.fromJson(response);
  }

  /// List template post migration custom actions.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch configuration template ID.
  ///
  /// Parameter [filters] :
  /// Filters to apply when listing template post migration custom actions.
  ///
  /// Parameter [maxResults] :
  /// Maximum amount of items to return when listing template post migration
  /// custom actions.
  ///
  /// Parameter [nextToken] :
  /// Next token to use when listing template post migration custom actions.
  Future<ListTemplateActionsResponse> listTemplateActions({
    required String launchConfigurationTemplateID,
    TemplateActionsRequestFilters? filters,
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
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListTemplateActions',
      exceptionFnMap: _exceptionFns,
    );
    return ListTemplateActionsResponse.fromJson(response);
  }

  /// Retrieves all waves or multiple waves by ID.
  ///
  /// May throw [UninitializedAccountException].
  ///
  /// Parameter [accountID] :
  /// Request account ID.
  ///
  /// Parameter [filters] :
  /// Waves list filters.
  ///
  /// Parameter [maxResults] :
  /// Maximum results to return when listing waves.
  ///
  /// Parameter [nextToken] :
  /// Request next token.
  Future<ListWavesResponse> listWaves({
    String? accountID,
    ListWavesRequestFilters? filters,
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
      if (accountID != null) 'accountID': accountID,
      if (filters != null) 'filters': filters,
      if (maxResults != null) 'maxResults': maxResults,
      if (nextToken != null) 'nextToken': nextToken,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ListWaves',
      exceptionFnMap: _exceptionFns,
    );
    return ListWavesResponse.fromJson(response);
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
  ///
  /// Parameter [accountID] :
  /// Mark as archived by Account ID.
  Future<SourceServer> markAsArchived({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/MarkAsArchived',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Pause Replication.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Pause Replication Request source server ID.
  ///
  /// Parameter [accountID] :
  /// Pause Replication Request account ID.
  Future<SourceServer> pauseReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PauseReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Put source server post migration custom action.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [actionID] :
  /// Source server post migration custom action ID.
  ///
  /// Parameter [actionName] :
  /// Source server post migration custom action name.
  ///
  /// Parameter [documentIdentifier] :
  /// Source server post migration custom action document identifier.
  ///
  /// Parameter [order] :
  /// Source server post migration custom action order.
  ///
  /// Parameter [sourceServerID] :
  /// Source server ID.
  ///
  /// Parameter [accountID] :
  /// Source server post migration custom account ID.
  ///
  /// Parameter [active] :
  /// Source server post migration custom action active status.
  ///
  /// Parameter [category] :
  /// Source server post migration custom action category.
  ///
  /// Parameter [description] :
  /// Source server post migration custom action description.
  ///
  /// Parameter [documentVersion] :
  /// Source server post migration custom action document version.
  ///
  /// Parameter [externalParameters] :
  /// Source server post migration custom action external parameters.
  ///
  /// Parameter [mustSucceedForCutover] :
  /// Source server post migration custom action must succeed for cutover.
  ///
  /// Parameter [parameters] :
  /// Source server post migration custom action parameters.
  ///
  /// Parameter [timeoutSeconds] :
  /// Source server post migration custom action timeout in seconds.
  Future<SourceServerActionDocument> putSourceServerAction({
    required String actionID,
    required String actionName,
    required String documentIdentifier,
    required int order,
    required String sourceServerID,
    String? accountID,
    bool? active,
    ActionCategory? category,
    String? description,
    String? documentVersion,
    Map<String, SsmExternalParameter>? externalParameters,
    bool? mustSucceedForCutover,
    Map<String, List<SsmParameterStoreParameter>>? parameters,
    int? timeoutSeconds,
  }) async {
    _s.validateNumRange(
      'order',
      order,
      1001,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'timeoutSeconds',
      timeoutSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'actionName': actionName,
      'documentIdentifier': documentIdentifier,
      'order': order,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (active != null) 'active': active,
      if (category != null) 'category': category.toValue(),
      if (description != null) 'description': description,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutSourceServerAction',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServerActionDocument.fromJson(response);
  }

  /// Put template post migration custom action.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [actionID] :
  /// Template post migration custom action ID.
  ///
  /// Parameter [actionName] :
  /// Template post migration custom action name.
  ///
  /// Parameter [documentIdentifier] :
  /// Template post migration custom action document identifier.
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch configuration template ID.
  ///
  /// Parameter [order] :
  /// Template post migration custom action order.
  ///
  /// Parameter [active] :
  /// Template post migration custom action active status.
  ///
  /// Parameter [category] :
  /// Template post migration custom action category.
  ///
  /// Parameter [description] :
  /// Template post migration custom action description.
  ///
  /// Parameter [documentVersion] :
  /// Template post migration custom action document version.
  ///
  /// Parameter [externalParameters] :
  /// Template post migration custom action external parameters.
  ///
  /// Parameter [mustSucceedForCutover] :
  /// Template post migration custom action must succeed for cutover.
  ///
  /// Parameter [operatingSystem] :
  /// Operating system eligible for this template post migration custom action.
  ///
  /// Parameter [parameters] :
  /// Template post migration custom action parameters.
  ///
  /// Parameter [timeoutSeconds] :
  /// Template post migration custom action timeout in seconds.
  Future<TemplateActionDocument> putTemplateAction({
    required String actionID,
    required String actionName,
    required String documentIdentifier,
    required String launchConfigurationTemplateID,
    required int order,
    bool? active,
    ActionCategory? category,
    String? description,
    String? documentVersion,
    Map<String, SsmExternalParameter>? externalParameters,
    bool? mustSucceedForCutover,
    String? operatingSystem,
    Map<String, List<SsmParameterStoreParameter>>? parameters,
    int? timeoutSeconds,
  }) async {
    _s.validateNumRange(
      'order',
      order,
      1001,
      10000,
      isRequired: true,
    );
    _s.validateNumRange(
      'timeoutSeconds',
      timeoutSeconds,
      1,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'actionName': actionName,
      'documentIdentifier': documentIdentifier,
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      'order': order,
      if (active != null) 'active': active,
      if (category != null) 'category': category.toValue(),
      if (description != null) 'description': description,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (operatingSystem != null) 'operatingSystem': operatingSystem,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/PutTemplateAction',
      exceptionFnMap: _exceptionFns,
    );
    return TemplateActionDocument.fromJson(response);
  }

  /// Remove source server post migration custom action.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// Source server post migration custom action ID to remove.
  ///
  /// Parameter [sourceServerID] :
  /// Source server ID of the post migration custom action to remove.
  ///
  /// Parameter [accountID] :
  /// Source server post migration account ID.
  Future<void> removeSourceServerAction({
    required String actionID,
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RemoveSourceServerAction',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Remove template post migration custom action.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [actionID] :
  /// Template post migration custom action ID to remove.
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch configuration template ID of the post migration custom action to
  /// remove.
  Future<void> removeTemplateAction({
    required String actionID,
    required String launchConfigurationTemplateID,
  }) async {
    final $payload = <String, dynamic>{
      'actionID': actionID,
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/RemoveTemplateAction',
      exceptionFnMap: _exceptionFns,
    );
  }

  /// Resume Replication.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Resume Replication Request source server ID.
  ///
  /// Parameter [accountID] :
  /// Resume Replication Request account ID.
  Future<SourceServer> resumeReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/ResumeReplication',
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
  ///
  /// Parameter [accountID] :
  /// Retry data replication for Account ID.
  Future<SourceServer> retryDataReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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
  /// Parameter [accountID] :
  /// Start Cutover by Account IDs
  ///
  /// Parameter [tags] :
  /// Start Cutover by Tags.
  Future<StartCutoverResponse> startCutover({
    required List<String> sourceServerIDs,
    String? accountID,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
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

  /// Start export.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [s3Bucket] :
  /// Start export request s3 bucket.
  ///
  /// Parameter [s3Key] :
  /// Start export request s3key.
  ///
  /// Parameter [s3BucketOwner] :
  /// Start export request s3 bucket owner.
  Future<StartExportResponse> startExport({
    required String s3Bucket,
    required String s3Key,
    String? s3BucketOwner,
  }) async {
    final $payload = <String, dynamic>{
      's3Bucket': s3Bucket,
      's3Key': s3Key,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartExport',
      exceptionFnMap: _exceptionFns,
    );
    return StartExportResponse.fromJson(response);
  }

  /// Start import.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [s3BucketSource] :
  /// Start import request s3 bucket source.
  ///
  /// Parameter [clientToken] :
  /// Start import request client token.
  Future<StartImportResponse> startImport({
    required S3BucketSource s3BucketSource,
    String? clientToken,
  }) async {
    final $payload = <String, dynamic>{
      's3BucketSource': s3BucketSource,
      'clientToken': clientToken ?? _s.generateIdempotencyToken(),
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StartImport',
      exceptionFnMap: _exceptionFns,
    );
    return StartImportResponse.fromJson(response);
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
  ///
  /// Parameter [accountID] :
  /// Account ID on which to start replication.
  Future<SourceServer> startReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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
  /// Parameter [accountID] :
  /// Start Test for Account ID.
  ///
  /// Parameter [tags] :
  /// Start Test by Tags.
  Future<StartTestResponse> startTest({
    required List<String> sourceServerIDs,
    String? accountID,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
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

  /// Stop Replication.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ServiceQuotaExceededException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Stop Replication Request source server ID.
  ///
  /// Parameter [accountID] :
  /// Stop Replication Request account ID.
  Future<SourceServer> stopReplication({
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/StopReplication',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
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
  /// Parameter [accountID] :
  /// Terminate Target instance by Account ID
  ///
  /// Parameter [tags] :
  /// Terminate Target instance by Tags.
  Future<TerminateTargetInstancesResponse> terminateTargetInstances({
    required List<String> sourceServerIDs,
    String? accountID,
    Map<String, String>? tags,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerIDs': sourceServerIDs,
      if (accountID != null) 'accountID': accountID,
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

  /// Unarchive application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Application> unarchiveApplication({
    required String applicationID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UnarchiveApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Unarchive wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ServiceQuotaExceededException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  Future<Wave> unarchiveWave({
    required String waveID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UnarchiveWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
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

  /// Update application.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [applicationID] :
  /// Application ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Application description.
  ///
  /// Parameter [name] :
  /// Application name.
  Future<Application> updateApplication({
    required String applicationID,
    String? accountID,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'applicationID': applicationID,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateApplication',
      exceptionFnMap: _exceptionFns,
    );
    return Application.fromJson(response);
  }

  /// Update Connector.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  ///
  /// Parameter [connectorID] :
  /// Update Connector request connector ID.
  ///
  /// Parameter [name] :
  /// Update Connector request name.
  ///
  /// Parameter [ssmCommandConfig] :
  /// Update Connector request SSM command config.
  Future<Connector> updateConnector({
    required String connectorID,
    String? name,
    ConnectorSsmCommandConfig? ssmCommandConfig,
  }) async {
    final $payload = <String, dynamic>{
      'connectorID': connectorID,
      if (name != null) 'name': name,
      if (ssmCommandConfig != null) 'ssmCommandConfig': ssmCommandConfig,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateConnector',
      exceptionFnMap: _exceptionFns,
    );
    return Connector.fromJson(response);
  }

  /// Updates multiple LaunchConfigurations by Source Server ID.
  /// <note>
  /// bootMode valid values are <code>LEGACY_BIOS | UEFI</code>
  /// </note>
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Update Launch configuration by Source Server ID request.
  ///
  /// Parameter [accountID] :
  /// Update Launch configuration Account ID.
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
  /// Parameter [enableMapAutoTagging] :
  /// Enable map auto tagging.
  ///
  /// Parameter [launchDisposition] :
  /// Update Launch configuration launch disposition request.
  ///
  /// Parameter [licensing] :
  /// Update Launch configuration licensing request.
  ///
  /// Parameter [mapAutoTaggingMpeID] :
  /// Launch configuration map auto tagging MPE ID.
  ///
  /// Parameter [name] :
  /// Update Launch configuration name request.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Update Launch configuration Target instance right sizing request.
  Future<LaunchConfiguration> updateLaunchConfiguration({
    required String sourceServerID,
    String? accountID,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    bool? enableMapAutoTagging,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? mapAutoTaggingMpeID,
    String? name,
    PostLaunchActions? postLaunchActions,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (bootMode != null) 'bootMode': bootMode.toValue(),
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
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

  /// Updates an existing Launch Configuration Template by ID.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ValidationException].
  /// May throw [AccessDeniedException].
  ///
  /// Parameter [launchConfigurationTemplateID] :
  /// Launch Configuration Template ID.
  ///
  /// Parameter [associatePublicIpAddress] :
  /// Associate public Ip address.
  ///
  /// Parameter [bootMode] :
  /// Launch configuration template boot mode.
  ///
  /// Parameter [copyPrivateIp] :
  /// Copy private Ip.
  ///
  /// Parameter [copyTags] :
  /// Copy tags.
  ///
  /// Parameter [enableMapAutoTagging] :
  /// Enable map auto tagging.
  ///
  /// Parameter [largeVolumeConf] :
  /// Large volume config.
  ///
  /// Parameter [launchDisposition] :
  /// Launch disposition.
  ///
  /// Parameter [mapAutoTaggingMpeID] :
  /// Launch configuration template map auto tagging MPE ID.
  ///
  /// Parameter [postLaunchActions] :
  /// Post Launch Action to execute on the Test or Cutover instance.
  ///
  /// Parameter [smallVolumeConf] :
  /// Small volume config.
  ///
  /// Parameter [smallVolumeMaxSize] :
  /// Small volume maximum size.
  ///
  /// Parameter [targetInstanceTypeRightSizingMethod] :
  /// Target instance type right-sizing method.
  Future<LaunchConfigurationTemplate> updateLaunchConfigurationTemplate({
    required String launchConfigurationTemplateID,
    bool? associatePublicIpAddress,
    BootMode? bootMode,
    bool? copyPrivateIp,
    bool? copyTags,
    bool? enableMapAutoTagging,
    LaunchTemplateDiskConf? largeVolumeConf,
    LaunchDisposition? launchDisposition,
    Licensing? licensing,
    String? mapAutoTaggingMpeID,
    PostLaunchActions? postLaunchActions,
    LaunchTemplateDiskConf? smallVolumeConf,
    int? smallVolumeMaxSize,
    TargetInstanceTypeRightSizingMethod? targetInstanceTypeRightSizingMethod,
  }) async {
    _s.validateNumRange(
      'smallVolumeMaxSize',
      smallVolumeMaxSize,
      0,
      1152921504606846976,
    );
    final $payload = <String, dynamic>{
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (bootMode != null) 'bootMode': bootMode.toValue(),
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (largeVolumeConf != null) 'largeVolumeConf': largeVolumeConf,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (smallVolumeConf != null) 'smallVolumeConf': smallVolumeConf,
      if (smallVolumeMaxSize != null) 'smallVolumeMaxSize': smallVolumeMaxSize,
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
  /// Parameter [accountID] :
  /// Update replication configuration Account ID request.
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
  ///
  /// Parameter [useFipsEndpoint] :
  /// Update replication configuration use Fips Endpoint.
  Future<ReplicationConfiguration> updateReplicationConfiguration({
    required String sourceServerID,
    String? accountID,
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
    bool? useFipsEndpoint,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      10000,
    );
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
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
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
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
  ///
  /// Parameter [useFipsEndpoint] :
  /// Update replication configuration template use Fips Endpoint request.
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
    bool? useFipsEndpoint,
  }) async {
    _s.validateNumRange(
      'bandwidthThrottling',
      bandwidthThrottling,
      0,
      10000,
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
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateReplicationConfigurationTemplate',
      exceptionFnMap: _exceptionFns,
    );
    return ReplicationConfigurationTemplate.fromJson(response);
  }

  /// Update Source Server.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [sourceServerID] :
  /// Update Source Server request source server ID.
  ///
  /// Parameter [accountID] :
  /// Update Source Server request account ID.
  ///
  /// Parameter [connectorAction] :
  /// Update Source Server request connector action.
  Future<SourceServer> updateSourceServer({
    required String sourceServerID,
    String? accountID,
    SourceServerConnectorAction? connectorAction,
  }) async {
    final $payload = <String, dynamic>{
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
      if (connectorAction != null) 'connectorAction': connectorAction,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateSourceServer',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
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
  ///
  /// Parameter [accountID] :
  /// Account ID on which to update replication type.
  Future<SourceServer> updateSourceServerReplicationType({
    required ReplicationType replicationType,
    required String sourceServerID,
    String? accountID,
  }) async {
    final $payload = <String, dynamic>{
      'replicationType': replicationType.toValue(),
      'sourceServerID': sourceServerID,
      if (accountID != null) 'accountID': accountID,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateSourceServerReplicationType',
      exceptionFnMap: _exceptionFns,
    );
    return SourceServer.fromJson(response);
  }

  /// Update wave.
  ///
  /// May throw [UninitializedAccountException].
  /// May throw [ResourceNotFoundException].
  /// May throw [ConflictException].
  ///
  /// Parameter [waveID] :
  /// Wave ID.
  ///
  /// Parameter [accountID] :
  /// Account ID.
  ///
  /// Parameter [description] :
  /// Wave description.
  ///
  /// Parameter [name] :
  /// Wave name.
  Future<Wave> updateWave({
    required String waveID,
    String? accountID,
    String? description,
    String? name,
  }) async {
    final $payload = <String, dynamic>{
      'waveID': waveID,
      if (accountID != null) 'accountID': accountID,
      if (description != null) 'description': description,
      if (name != null) 'name': name,
    };
    final response = await _protocol.send(
      payload: $payload,
      method: 'POST',
      requestUri: '/UpdateWave',
      exceptionFnMap: _exceptionFns,
    );
    return Wave.fromJson(response);
  }
}

enum ActionCategory {
  disasterRecovery,
  operatingSystem,
  licenseAndSubscription,
  validation,
  observability,
  refactoring,
  security,
  networking,
  configuration,
  backup,
  other,
}

extension ActionCategoryValueExtension on ActionCategory {
  String toValue() {
    switch (this) {
      case ActionCategory.disasterRecovery:
        return 'DISASTER_RECOVERY';
      case ActionCategory.operatingSystem:
        return 'OPERATING_SYSTEM';
      case ActionCategory.licenseAndSubscription:
        return 'LICENSE_AND_SUBSCRIPTION';
      case ActionCategory.validation:
        return 'VALIDATION';
      case ActionCategory.observability:
        return 'OBSERVABILITY';
      case ActionCategory.refactoring:
        return 'REFACTORING';
      case ActionCategory.security:
        return 'SECURITY';
      case ActionCategory.networking:
        return 'NETWORKING';
      case ActionCategory.configuration:
        return 'CONFIGURATION';
      case ActionCategory.backup:
        return 'BACKUP';
      case ActionCategory.other:
        return 'OTHER';
    }
  }
}

extension ActionCategoryFromString on String {
  ActionCategory toActionCategory() {
    switch (this) {
      case 'DISASTER_RECOVERY':
        return ActionCategory.disasterRecovery;
      case 'OPERATING_SYSTEM':
        return ActionCategory.operatingSystem;
      case 'LICENSE_AND_SUBSCRIPTION':
        return ActionCategory.licenseAndSubscription;
      case 'VALIDATION':
        return ActionCategory.validation;
      case 'OBSERVABILITY':
        return ActionCategory.observability;
      case 'REFACTORING':
        return ActionCategory.refactoring;
      case 'SECURITY':
        return ActionCategory.security;
      case 'NETWORKING':
        return ActionCategory.networking;
      case 'CONFIGURATION':
        return ActionCategory.configuration;
      case 'BACKUP':
        return ActionCategory.backup;
      case 'OTHER':
        return ActionCategory.other;
    }
    throw Exception('$this is not known in enum ActionCategory');
  }
}

class Application {
  /// Application aggregated status.
  final ApplicationAggregatedStatus? applicationAggregatedStatus;

  /// Application ID.
  final String? applicationID;

  /// Application ARN.
  final String? arn;

  /// Application creation dateTime.
  final String? creationDateTime;

  /// Application description.
  final String? description;

  /// Application archival status.
  final bool? isArchived;

  /// Application last modified dateTime.
  final String? lastModifiedDateTime;

  /// Application name.
  final String? name;

  /// Application tags.
  final Map<String, String>? tags;

  /// Application wave ID.
  final String? waveID;

  Application({
    this.applicationAggregatedStatus,
    this.applicationID,
    this.arn,
    this.creationDateTime,
    this.description,
    this.isArchived,
    this.lastModifiedDateTime,
    this.name,
    this.tags,
    this.waveID,
  });

  factory Application.fromJson(Map<String, dynamic> json) {
    return Application(
      applicationAggregatedStatus: json['applicationAggregatedStatus'] != null
          ? ApplicationAggregatedStatus.fromJson(
              json['applicationAggregatedStatus'] as Map<String, dynamic>)
          : null,
      applicationID: json['applicationID'] as String?,
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      description: json['description'] as String?,
      isArchived: json['isArchived'] as bool?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      waveID: json['waveID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationAggregatedStatus = this.applicationAggregatedStatus;
    final applicationID = this.applicationID;
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final isArchived = this.isArchived;
    final lastModifiedDateTime = this.lastModifiedDateTime;
    final name = this.name;
    final tags = this.tags;
    final waveID = this.waveID;
    return {
      if (applicationAggregatedStatus != null)
        'applicationAggregatedStatus': applicationAggregatedStatus,
      if (applicationID != null) 'applicationID': applicationID,
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (description != null) 'description': description,
      if (isArchived != null) 'isArchived': isArchived,
      if (lastModifiedDateTime != null)
        'lastModifiedDateTime': lastModifiedDateTime,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (waveID != null) 'waveID': waveID,
    };
  }
}

/// Application aggregated status.
class ApplicationAggregatedStatus {
  /// Application aggregated status health status.
  final ApplicationHealthStatus? healthStatus;

  /// Application aggregated status last update dateTime.
  final String? lastUpdateDateTime;

  /// Application aggregated status progress status.
  final ApplicationProgressStatus? progressStatus;

  /// Application aggregated status total source servers amount.
  final int? totalSourceServers;

  ApplicationAggregatedStatus({
    this.healthStatus,
    this.lastUpdateDateTime,
    this.progressStatus,
    this.totalSourceServers,
  });

  factory ApplicationAggregatedStatus.fromJson(Map<String, dynamic> json) {
    return ApplicationAggregatedStatus(
      healthStatus:
          (json['healthStatus'] as String?)?.toApplicationHealthStatus(),
      lastUpdateDateTime: json['lastUpdateDateTime'] as String?,
      progressStatus:
          (json['progressStatus'] as String?)?.toApplicationProgressStatus(),
      totalSourceServers: json['totalSourceServers'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthStatus = this.healthStatus;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final progressStatus = this.progressStatus;
    final totalSourceServers = this.totalSourceServers;
    return {
      if (healthStatus != null) 'healthStatus': healthStatus.toValue(),
      if (lastUpdateDateTime != null) 'lastUpdateDateTime': lastUpdateDateTime,
      if (progressStatus != null) 'progressStatus': progressStatus.toValue(),
      if (totalSourceServers != null) 'totalSourceServers': totalSourceServers,
    };
  }
}

enum ApplicationHealthStatus {
  healthy,
  lagging,
  error,
}

extension ApplicationHealthStatusValueExtension on ApplicationHealthStatus {
  String toValue() {
    switch (this) {
      case ApplicationHealthStatus.healthy:
        return 'HEALTHY';
      case ApplicationHealthStatus.lagging:
        return 'LAGGING';
      case ApplicationHealthStatus.error:
        return 'ERROR';
    }
  }
}

extension ApplicationHealthStatusFromString on String {
  ApplicationHealthStatus toApplicationHealthStatus() {
    switch (this) {
      case 'HEALTHY':
        return ApplicationHealthStatus.healthy;
      case 'LAGGING':
        return ApplicationHealthStatus.lagging;
      case 'ERROR':
        return ApplicationHealthStatus.error;
    }
    throw Exception('$this is not known in enum ApplicationHealthStatus');
  }
}

enum ApplicationProgressStatus {
  notStarted,
  inProgress,
  completed,
}

extension ApplicationProgressStatusValueExtension on ApplicationProgressStatus {
  String toValue() {
    switch (this) {
      case ApplicationProgressStatus.notStarted:
        return 'NOT_STARTED';
      case ApplicationProgressStatus.inProgress:
        return 'IN_PROGRESS';
      case ApplicationProgressStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension ApplicationProgressStatusFromString on String {
  ApplicationProgressStatus toApplicationProgressStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return ApplicationProgressStatus.notStarted;
      case 'IN_PROGRESS':
        return ApplicationProgressStatus.inProgress;
      case 'COMPLETED':
        return ApplicationProgressStatus.completed;
    }
    throw Exception('$this is not known in enum ApplicationProgressStatus');
  }
}

class AssociateApplicationsResponse {
  AssociateApplicationsResponse();

  factory AssociateApplicationsResponse.fromJson(Map<String, dynamic> _) {
    return AssociateApplicationsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class AssociateSourceServersResponse {
  AssociateSourceServersResponse();

  factory AssociateSourceServersResponse.fromJson(Map<String, dynamic> _) {
    return AssociateSourceServersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

enum BootMode {
  legacyBios,
  uefi,
  useSource,
}

extension BootModeValueExtension on BootMode {
  String toValue() {
    switch (this) {
      case BootMode.legacyBios:
        return 'LEGACY_BIOS';
      case BootMode.uefi:
        return 'UEFI';
      case BootMode.useSource:
        return 'USE_SOURCE';
    }
  }
}

extension BootModeFromString on String {
  BootMode toBootMode() {
    switch (this) {
      case 'LEGACY_BIOS':
        return BootMode.legacyBios;
      case 'UEFI':
        return BootMode.uefi;
      case 'USE_SOURCE':
        return BootMode.useSource;
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

extension ChangeServerLifeCycleStateSourceServerLifecycleStateValueExtension
    on ChangeServerLifeCycleStateSourceServerLifecycleState {
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

extension ChangeServerLifeCycleStateSourceServerLifecycleStateFromString
    on String {
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

class Connector {
  /// Connector arn.
  final String? arn;

  /// Connector ID.
  final String? connectorID;

  /// Connector name.
  final String? name;

  /// Connector SSM command config.
  final ConnectorSsmCommandConfig? ssmCommandConfig;

  /// Connector SSM instance ID.
  final String? ssmInstanceID;

  /// Connector tags.
  final Map<String, String>? tags;

  Connector({
    this.arn,
    this.connectorID,
    this.name,
    this.ssmCommandConfig,
    this.ssmInstanceID,
    this.tags,
  });

  factory Connector.fromJson(Map<String, dynamic> json) {
    return Connector(
      arn: json['arn'] as String?,
      connectorID: json['connectorID'] as String?,
      name: json['name'] as String?,
      ssmCommandConfig: json['ssmCommandConfig'] != null
          ? ConnectorSsmCommandConfig.fromJson(
              json['ssmCommandConfig'] as Map<String, dynamic>)
          : null,
      ssmInstanceID: json['ssmInstanceID'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final connectorID = this.connectorID;
    final name = this.name;
    final ssmCommandConfig = this.ssmCommandConfig;
    final ssmInstanceID = this.ssmInstanceID;
    final tags = this.tags;
    return {
      if (arn != null) 'arn': arn,
      if (connectorID != null) 'connectorID': connectorID,
      if (name != null) 'name': name,
      if (ssmCommandConfig != null) 'ssmCommandConfig': ssmCommandConfig,
      if (ssmInstanceID != null) 'ssmInstanceID': ssmInstanceID,
      if (tags != null) 'tags': tags,
    };
  }
}

/// Connector SSM command config.
class ConnectorSsmCommandConfig {
  /// Connector SSM command config CloudWatch output enabled.
  final bool cloudWatchOutputEnabled;

  /// Connector SSM command config S3 output enabled.
  final bool s3OutputEnabled;

  /// Connector SSM command config CloudWatch log group name.
  final String? cloudWatchLogGroupName;

  /// Connector SSM command config output S3 bucket name.
  final String? outputS3BucketName;

  ConnectorSsmCommandConfig({
    required this.cloudWatchOutputEnabled,
    required this.s3OutputEnabled,
    this.cloudWatchLogGroupName,
    this.outputS3BucketName,
  });

  factory ConnectorSsmCommandConfig.fromJson(Map<String, dynamic> json) {
    return ConnectorSsmCommandConfig(
      cloudWatchOutputEnabled: json['cloudWatchOutputEnabled'] as bool,
      s3OutputEnabled: json['s3OutputEnabled'] as bool,
      cloudWatchLogGroupName: json['cloudWatchLogGroupName'] as String?,
      outputS3BucketName: json['outputS3BucketName'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final cloudWatchOutputEnabled = this.cloudWatchOutputEnabled;
    final s3OutputEnabled = this.s3OutputEnabled;
    final cloudWatchLogGroupName = this.cloudWatchLogGroupName;
    final outputS3BucketName = this.outputS3BucketName;
    return {
      'cloudWatchOutputEnabled': cloudWatchOutputEnabled,
      's3OutputEnabled': s3OutputEnabled,
      if (cloudWatchLogGroupName != null)
        'cloudWatchLogGroupName': cloudWatchLogGroupName,
      if (outputS3BucketName != null) 'outputS3BucketName': outputS3BucketName,
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
  unsupportedVmConfiguration,
  lastSnapshotJobFailed,
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
      case DataReplicationErrorString.unsupportedVmConfiguration:
        return 'UNSUPPORTED_VM_CONFIGURATION';
      case DataReplicationErrorString.lastSnapshotJobFailed:
        return 'LAST_SNAPSHOT_JOB_FAILED';
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
  pendingSnapshotShipping,
  shippingSnapshot,
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
      case DataReplicationState.pendingSnapshotShipping:
        return 'PENDING_SNAPSHOT_SHIPPING';
      case DataReplicationState.shippingSnapshot:
        return 'SHIPPING_SNAPSHOT';
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
      case 'PENDING_SNAPSHOT_SHIPPING':
        return DataReplicationState.pendingSnapshotShipping;
      case 'SHIPPING_SNAPSHOT':
        return DataReplicationState.shippingSnapshot;
    }
    throw Exception('$this is not known in enum DataReplicationState');
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

class DeleteWaveResponse {
  DeleteWaveResponse();

  factory DeleteWaveResponse.fromJson(Map<String, dynamic> _) {
    return DeleteWaveResponse();
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
  /// List of items returned by DescribeLaunchConfigurationTemplates.
  final List<LaunchConfigurationTemplate>? items;

  /// Next pagination token returned from DescribeLaunchConfigurationTemplates.
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
  /// Request to filter Source Servers list by application IDs.
  final List<String>? applicationIDs;

  /// Request to filter Source Servers list by archived.
  final bool? isArchived;

  /// Request to filter Source Servers list by life cycle states.
  final List<LifeCycleState>? lifeCycleStates;

  /// Request to filter Source Servers list by replication type.
  final List<ReplicationType>? replicationTypes;

  /// Request to filter Source Servers list by Source Server ID.
  final List<String>? sourceServerIDs;

  DescribeSourceServersRequestFilters({
    this.applicationIDs,
    this.isArchived,
    this.lifeCycleStates,
    this.replicationTypes,
    this.sourceServerIDs,
  });

  Map<String, dynamic> toJson() {
    final applicationIDs = this.applicationIDs;
    final isArchived = this.isArchived;
    final lifeCycleStates = this.lifeCycleStates;
    final replicationTypes = this.replicationTypes;
    final sourceServerIDs = this.sourceServerIDs;
    return {
      if (applicationIDs != null) 'applicationIDs': applicationIDs,
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

class DisassociateApplicationsResponse {
  DisassociateApplicationsResponse();

  factory DisassociateApplicationsResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateApplicationsResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class DisassociateSourceServersResponse {
  DisassociateSourceServersResponse();

  factory DisassociateSourceServersResponse.fromJson(Map<String, dynamic> _) {
    return DisassociateSourceServersResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

/// Export errors data.
class ExportErrorData {
  /// Export errors data raw error.
  final String? rawError;

  ExportErrorData({
    this.rawError,
  });

  factory ExportErrorData.fromJson(Map<String, dynamic> json) {
    return ExportErrorData(
      rawError: json['rawError'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final rawError = this.rawError;
    return {
      if (rawError != null) 'rawError': rawError,
    };
  }
}

enum ExportStatus {
  pending,
  started,
  failed,
  succeeded,
}

extension ExportStatusValueExtension on ExportStatus {
  String toValue() {
    switch (this) {
      case ExportStatus.pending:
        return 'PENDING';
      case ExportStatus.started:
        return 'STARTED';
      case ExportStatus.failed:
        return 'FAILED';
      case ExportStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension ExportStatusFromString on String {
  ExportStatus toExportStatus() {
    switch (this) {
      case 'PENDING':
        return ExportStatus.pending;
      case 'STARTED':
        return ExportStatus.started;
      case 'FAILED':
        return ExportStatus.failed;
      case 'SUCCEEDED':
        return ExportStatus.succeeded;
    }
    throw Exception('$this is not known in enum ExportStatus');
  }
}

/// Export task.
class ExportTask {
  /// Export task creation datetime.
  final String? creationDateTime;

  /// Export task end datetime.
  final String? endDateTime;

  /// Export task id.
  final String? exportID;

  /// Export task progress percentage.
  final double? progressPercentage;

  /// Export task s3 bucket.
  final String? s3Bucket;

  /// Export task s3 bucket owner.
  final String? s3BucketOwner;

  /// Export task s3 key.
  final String? s3Key;

  /// Export task status.
  final ExportStatus? status;

  /// Export task summary.
  final ExportTaskSummary? summary;

  ExportTask({
    this.creationDateTime,
    this.endDateTime,
    this.exportID,
    this.progressPercentage,
    this.s3Bucket,
    this.s3BucketOwner,
    this.s3Key,
    this.status,
    this.summary,
  });

  factory ExportTask.fromJson(Map<String, dynamic> json) {
    return ExportTask(
      creationDateTime: json['creationDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      exportID: json['exportID'] as String?,
      progressPercentage: json['progressPercentage'] as double?,
      s3Bucket: json['s3Bucket'] as String?,
      s3BucketOwner: json['s3BucketOwner'] as String?,
      s3Key: json['s3Key'] as String?,
      status: (json['status'] as String?)?.toExportStatus(),
      summary: json['summary'] != null
          ? ExportTaskSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final exportID = this.exportID;
    final progressPercentage = this.progressPercentage;
    final s3Bucket = this.s3Bucket;
    final s3BucketOwner = this.s3BucketOwner;
    final s3Key = this.s3Key;
    final status = this.status;
    final summary = this.summary;
    return {
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (exportID != null) 'exportID': exportID,
      if (progressPercentage != null) 'progressPercentage': progressPercentage,
      if (s3Bucket != null) 's3Bucket': s3Bucket,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
      if (s3Key != null) 's3Key': s3Key,
      if (status != null) 'status': status.toValue(),
      if (summary != null) 'summary': summary,
    };
  }
}

/// Export task error.
class ExportTaskError {
  /// Export task error data.
  final ExportErrorData? errorData;

  /// Export task error datetime.
  final String? errorDateTime;

  ExportTaskError({
    this.errorData,
    this.errorDateTime,
  });

  factory ExportTaskError.fromJson(Map<String, dynamic> json) {
    return ExportTaskError(
      errorData: json['errorData'] != null
          ? ExportErrorData.fromJson(json['errorData'] as Map<String, dynamic>)
          : null,
      errorDateTime: json['errorDateTime'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final errorData = this.errorData;
    final errorDateTime = this.errorDateTime;
    return {
      if (errorData != null) 'errorData': errorData,
      if (errorDateTime != null) 'errorDateTime': errorDateTime,
    };
  }
}

/// Export task summary.
class ExportTaskSummary {
  /// Export task summary applications count.
  final int? applicationsCount;

  /// Export task summary servers count.
  final int? serversCount;

  /// Export task summary waves count.
  final int? wavesCount;

  ExportTaskSummary({
    this.applicationsCount,
    this.serversCount,
    this.wavesCount,
  });

  factory ExportTaskSummary.fromJson(Map<String, dynamic> json) {
    return ExportTaskSummary(
      applicationsCount: json['applicationsCount'] as int?,
      serversCount: json['serversCount'] as int?,
      wavesCount: json['wavesCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationsCount = this.applicationsCount;
    final serversCount = this.serversCount;
    final wavesCount = this.wavesCount;
    return {
      if (applicationsCount != null) 'applicationsCount': applicationsCount,
      if (serversCount != null) 'serversCount': serversCount,
      if (wavesCount != null) 'wavesCount': wavesCount,
    };
  }
}

enum FirstBoot {
  waiting,
  succeeded,
  unknown,
  stopped,
}

extension FirstBootValueExtension on FirstBoot {
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

extension FirstBootFromString on String {
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

/// Import error data.
class ImportErrorData {
  /// Import error data source account ID.
  final String? accountID;

  /// Import error data application ID.
  final String? applicationID;

  /// Import error data ec2 LaunchTemplate ID.
  final String? ec2LaunchTemplateID;

  /// Import error data raw error.
  final String? rawError;

  /// Import error data row number.
  final int? rowNumber;

  /// Import error data source server ID.
  final String? sourceServerID;

  /// Import error data wave id.
  final String? waveID;

  ImportErrorData({
    this.accountID,
    this.applicationID,
    this.ec2LaunchTemplateID,
    this.rawError,
    this.rowNumber,
    this.sourceServerID,
    this.waveID,
  });

  factory ImportErrorData.fromJson(Map<String, dynamic> json) {
    return ImportErrorData(
      accountID: json['accountID'] as String?,
      applicationID: json['applicationID'] as String?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      rawError: json['rawError'] as String?,
      rowNumber: json['rowNumber'] as int?,
      sourceServerID: json['sourceServerID'] as String?,
      waveID: json['waveID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountID = this.accountID;
    final applicationID = this.applicationID;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final rawError = this.rawError;
    final rowNumber = this.rowNumber;
    final sourceServerID = this.sourceServerID;
    final waveID = this.waveID;
    return {
      if (accountID != null) 'accountID': accountID,
      if (applicationID != null) 'applicationID': applicationID,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (rawError != null) 'rawError': rawError,
      if (rowNumber != null) 'rowNumber': rowNumber,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (waveID != null) 'waveID': waveID,
    };
  }
}

enum ImportErrorType {
  validationError,
  processingError,
}

extension ImportErrorTypeValueExtension on ImportErrorType {
  String toValue() {
    switch (this) {
      case ImportErrorType.validationError:
        return 'VALIDATION_ERROR';
      case ImportErrorType.processingError:
        return 'PROCESSING_ERROR';
    }
  }
}

extension ImportErrorTypeFromString on String {
  ImportErrorType toImportErrorType() {
    switch (this) {
      case 'VALIDATION_ERROR':
        return ImportErrorType.validationError;
      case 'PROCESSING_ERROR':
        return ImportErrorType.processingError;
    }
    throw Exception('$this is not known in enum ImportErrorType');
  }
}

enum ImportStatus {
  pending,
  started,
  failed,
  succeeded,
}

extension ImportStatusValueExtension on ImportStatus {
  String toValue() {
    switch (this) {
      case ImportStatus.pending:
        return 'PENDING';
      case ImportStatus.started:
        return 'STARTED';
      case ImportStatus.failed:
        return 'FAILED';
      case ImportStatus.succeeded:
        return 'SUCCEEDED';
    }
  }
}

extension ImportStatusFromString on String {
  ImportStatus toImportStatus() {
    switch (this) {
      case 'PENDING':
        return ImportStatus.pending;
      case 'STARTED':
        return ImportStatus.started;
      case 'FAILED':
        return ImportStatus.failed;
      case 'SUCCEEDED':
        return ImportStatus.succeeded;
    }
    throw Exception('$this is not known in enum ImportStatus');
  }
}

/// Import task.
class ImportTask {
  /// Import task creation datetime.
  final String? creationDateTime;

  /// Import task end datetime.
  final String? endDateTime;

  /// Import task id.
  final String? importID;

  /// Import task progress percentage.
  final double? progressPercentage;

  /// Import task s3 bucket source.
  final S3BucketSource? s3BucketSource;

  /// Import task status.
  final ImportStatus? status;

  /// Import task summary.
  final ImportTaskSummary? summary;

  ImportTask({
    this.creationDateTime,
    this.endDateTime,
    this.importID,
    this.progressPercentage,
    this.s3BucketSource,
    this.status,
    this.summary,
  });

  factory ImportTask.fromJson(Map<String, dynamic> json) {
    return ImportTask(
      creationDateTime: json['creationDateTime'] as String?,
      endDateTime: json['endDateTime'] as String?,
      importID: json['importID'] as String?,
      progressPercentage: json['progressPercentage'] as double?,
      s3BucketSource: json['s3BucketSource'] != null
          ? S3BucketSource.fromJson(
              json['s3BucketSource'] as Map<String, dynamic>)
          : null,
      status: (json['status'] as String?)?.toImportStatus(),
      summary: json['summary'] != null
          ? ImportTaskSummary.fromJson(json['summary'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final creationDateTime = this.creationDateTime;
    final endDateTime = this.endDateTime;
    final importID = this.importID;
    final progressPercentage = this.progressPercentage;
    final s3BucketSource = this.s3BucketSource;
    final status = this.status;
    final summary = this.summary;
    return {
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (endDateTime != null) 'endDateTime': endDateTime,
      if (importID != null) 'importID': importID,
      if (progressPercentage != null) 'progressPercentage': progressPercentage,
      if (s3BucketSource != null) 's3BucketSource': s3BucketSource,
      if (status != null) 'status': status.toValue(),
      if (summary != null) 'summary': summary,
    };
  }
}

/// Import task error.
class ImportTaskError {
  /// Import task error data.
  final ImportErrorData? errorData;

  /// Import task error datetime.
  final String? errorDateTime;

  /// Import task error type.
  final ImportErrorType? errorType;

  ImportTaskError({
    this.errorData,
    this.errorDateTime,
    this.errorType,
  });

  factory ImportTaskError.fromJson(Map<String, dynamic> json) {
    return ImportTaskError(
      errorData: json['errorData'] != null
          ? ImportErrorData.fromJson(json['errorData'] as Map<String, dynamic>)
          : null,
      errorDateTime: json['errorDateTime'] as String?,
      errorType: (json['errorType'] as String?)?.toImportErrorType(),
    );
  }

  Map<String, dynamic> toJson() {
    final errorData = this.errorData;
    final errorDateTime = this.errorDateTime;
    final errorType = this.errorType;
    return {
      if (errorData != null) 'errorData': errorData,
      if (errorDateTime != null) 'errorDateTime': errorDateTime,
      if (errorType != null) 'errorType': errorType.toValue(),
    };
  }
}

/// Import task summary.
class ImportTaskSummary {
  /// Import task summary applications.
  final ImportTaskSummaryApplications? applications;

  /// Import task summary servers.
  final ImportTaskSummaryServers? servers;

  /// Import task summary waves.
  final ImportTaskSummaryWaves? waves;

  ImportTaskSummary({
    this.applications,
    this.servers,
    this.waves,
  });

  factory ImportTaskSummary.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummary(
      applications: json['applications'] != null
          ? ImportTaskSummaryApplications.fromJson(
              json['applications'] as Map<String, dynamic>)
          : null,
      servers: json['servers'] != null
          ? ImportTaskSummaryServers.fromJson(
              json['servers'] as Map<String, dynamic>)
          : null,
      waves: json['waves'] != null
          ? ImportTaskSummaryWaves.fromJson(
              json['waves'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final applications = this.applications;
    final servers = this.servers;
    final waves = this.waves;
    return {
      if (applications != null) 'applications': applications,
      if (servers != null) 'servers': servers,
      if (waves != null) 'waves': waves,
    };
  }
}

/// Import task summary applications.
class ImportTaskSummaryApplications {
  /// Import task summary applications created count.
  final int? createdCount;

  /// Import task summary applications modified count.
  final int? modifiedCount;

  ImportTaskSummaryApplications({
    this.createdCount,
    this.modifiedCount,
  });

  factory ImportTaskSummaryApplications.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummaryApplications(
      createdCount: json['createdCount'] as int?,
      modifiedCount: json['modifiedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdCount = this.createdCount;
    final modifiedCount = this.modifiedCount;
    return {
      if (createdCount != null) 'createdCount': createdCount,
      if (modifiedCount != null) 'modifiedCount': modifiedCount,
    };
  }
}

/// Import task summary servers.
class ImportTaskSummaryServers {
  /// Import task summary servers created count.
  final int? createdCount;

  /// Import task summary servers modified count.
  final int? modifiedCount;

  ImportTaskSummaryServers({
    this.createdCount,
    this.modifiedCount,
  });

  factory ImportTaskSummaryServers.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummaryServers(
      createdCount: json['createdCount'] as int?,
      modifiedCount: json['modifiedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdCount = this.createdCount;
    final modifiedCount = this.modifiedCount;
    return {
      if (createdCount != null) 'createdCount': createdCount,
      if (modifiedCount != null) 'modifiedCount': modifiedCount,
    };
  }
}

/// Import task summery waves.
class ImportTaskSummaryWaves {
  /// Import task summery waves created count.
  final int? createdCount;

  /// Import task summery waves modified count.
  final int? modifiedCount;

  ImportTaskSummaryWaves({
    this.createdCount,
    this.modifiedCount,
  });

  factory ImportTaskSummaryWaves.fromJson(Map<String, dynamic> json) {
    return ImportTaskSummaryWaves(
      createdCount: json['createdCount'] as int?,
      modifiedCount: json['modifiedCount'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final createdCount = this.createdCount;
    final modifiedCount = this.modifiedCount;
    return {
      if (createdCount != null) 'createdCount': createdCount,
      if (modifiedCount != null) 'modifiedCount': modifiedCount,
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

extension InitiatedByValueExtension on InitiatedBy {
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

extension InitiatedByFromString on String {
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

/// Launch Status of the Job Post Launch Actions.
class JobPostLaunchActionsLaunchStatus {
  /// AWS Systems Manager Document's execution ID of the of the Job Post Launch
  /// Actions.
  final String? executionID;

  /// AWS Systems Manager Document's execution status.
  final PostLaunchActionExecutionStatus? executionStatus;

  /// AWS Systems Manager Document's failure reason.
  final String? failureReason;

  /// AWS Systems Manager's Document of the of the Job Post Launch Actions.
  final SsmDocument? ssmDocument;

  /// AWS Systems Manager Document type.
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
}

extension JobTypeValueExtension on JobType {
  String toValue() {
    switch (this) {
      case JobType.launch:
        return 'LAUNCH';
      case JobType.terminate:
        return 'TERMINATE';
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

  /// Enable map auto tagging.
  final bool? enableMapAutoTagging;

  /// Launch disposition for launch configuration.
  final LaunchDisposition? launchDisposition;

  /// Launch configuration OS licensing.
  final Licensing? licensing;

  /// Map auto tagging MPE ID.
  final String? mapAutoTaggingMpeID;

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
    this.enableMapAutoTagging,
    this.launchDisposition,
    this.licensing,
    this.mapAutoTaggingMpeID,
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
      enableMapAutoTagging: json['enableMapAutoTagging'] as bool?,
      launchDisposition:
          (json['launchDisposition'] as String?)?.toLaunchDisposition(),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      mapAutoTaggingMpeID: json['mapAutoTaggingMpeID'] as String?,
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
    final enableMapAutoTagging = this.enableMapAutoTagging;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final mapAutoTaggingMpeID = this.mapAutoTaggingMpeID;
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
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
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
  /// ID of the Launch Configuration Template.
  final String launchConfigurationTemplateID;

  /// ARN of the Launch Configuration Template.
  final String? arn;

  /// Associate public Ip address.
  final bool? associatePublicIpAddress;

  /// Launch configuration template boot mode.
  final BootMode? bootMode;

  /// Copy private Ip.
  final bool? copyPrivateIp;

  /// Copy tags.
  final bool? copyTags;

  /// EC2 launch template ID.
  final String? ec2LaunchTemplateID;

  /// Enable map auto tagging.
  final bool? enableMapAutoTagging;

  /// Large volume config.
  final LaunchTemplateDiskConf? largeVolumeConf;

  /// Launch disposition.
  final LaunchDisposition? launchDisposition;
  final Licensing? licensing;

  /// Launch configuration template map auto tagging MPE ID.
  final String? mapAutoTaggingMpeID;

  /// Post Launch Actions of the Launch Configuration Template.
  final PostLaunchActions? postLaunchActions;

  /// Small volume config.
  final LaunchTemplateDiskConf? smallVolumeConf;

  /// Small volume maximum size.
  final int? smallVolumeMaxSize;

  /// Tags of the Launch Configuration Template.
  final Map<String, String>? tags;

  /// Target instance type right-sizing method.
  final TargetInstanceTypeRightSizingMethod?
      targetInstanceTypeRightSizingMethod;

  LaunchConfigurationTemplate({
    required this.launchConfigurationTemplateID,
    this.arn,
    this.associatePublicIpAddress,
    this.bootMode,
    this.copyPrivateIp,
    this.copyTags,
    this.ec2LaunchTemplateID,
    this.enableMapAutoTagging,
    this.largeVolumeConf,
    this.launchDisposition,
    this.licensing,
    this.mapAutoTaggingMpeID,
    this.postLaunchActions,
    this.smallVolumeConf,
    this.smallVolumeMaxSize,
    this.tags,
    this.targetInstanceTypeRightSizingMethod,
  });

  factory LaunchConfigurationTemplate.fromJson(Map<String, dynamic> json) {
    return LaunchConfigurationTemplate(
      launchConfigurationTemplateID:
          json['launchConfigurationTemplateID'] as String,
      arn: json['arn'] as String?,
      associatePublicIpAddress: json['associatePublicIpAddress'] as bool?,
      bootMode: (json['bootMode'] as String?)?.toBootMode(),
      copyPrivateIp: json['copyPrivateIp'] as bool?,
      copyTags: json['copyTags'] as bool?,
      ec2LaunchTemplateID: json['ec2LaunchTemplateID'] as String?,
      enableMapAutoTagging: json['enableMapAutoTagging'] as bool?,
      largeVolumeConf: json['largeVolumeConf'] != null
          ? LaunchTemplateDiskConf.fromJson(
              json['largeVolumeConf'] as Map<String, dynamic>)
          : null,
      launchDisposition:
          (json['launchDisposition'] as String?)?.toLaunchDisposition(),
      licensing: json['licensing'] != null
          ? Licensing.fromJson(json['licensing'] as Map<String, dynamic>)
          : null,
      mapAutoTaggingMpeID: json['mapAutoTaggingMpeID'] as String?,
      postLaunchActions: json['postLaunchActions'] != null
          ? PostLaunchActions.fromJson(
              json['postLaunchActions'] as Map<String, dynamic>)
          : null,
      smallVolumeConf: json['smallVolumeConf'] != null
          ? LaunchTemplateDiskConf.fromJson(
              json['smallVolumeConf'] as Map<String, dynamic>)
          : null,
      smallVolumeMaxSize: json['smallVolumeMaxSize'] as int?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      targetInstanceTypeRightSizingMethod:
          (json['targetInstanceTypeRightSizingMethod'] as String?)
              ?.toTargetInstanceTypeRightSizingMethod(),
    );
  }

  Map<String, dynamic> toJson() {
    final launchConfigurationTemplateID = this.launchConfigurationTemplateID;
    final arn = this.arn;
    final associatePublicIpAddress = this.associatePublicIpAddress;
    final bootMode = this.bootMode;
    final copyPrivateIp = this.copyPrivateIp;
    final copyTags = this.copyTags;
    final ec2LaunchTemplateID = this.ec2LaunchTemplateID;
    final enableMapAutoTagging = this.enableMapAutoTagging;
    final largeVolumeConf = this.largeVolumeConf;
    final launchDisposition = this.launchDisposition;
    final licensing = this.licensing;
    final mapAutoTaggingMpeID = this.mapAutoTaggingMpeID;
    final postLaunchActions = this.postLaunchActions;
    final smallVolumeConf = this.smallVolumeConf;
    final smallVolumeMaxSize = this.smallVolumeMaxSize;
    final tags = this.tags;
    final targetInstanceTypeRightSizingMethod =
        this.targetInstanceTypeRightSizingMethod;
    return {
      'launchConfigurationTemplateID': launchConfigurationTemplateID,
      if (arn != null) 'arn': arn,
      if (associatePublicIpAddress != null)
        'associatePublicIpAddress': associatePublicIpAddress,
      if (bootMode != null) 'bootMode': bootMode.toValue(),
      if (copyPrivateIp != null) 'copyPrivateIp': copyPrivateIp,
      if (copyTags != null) 'copyTags': copyTags,
      if (ec2LaunchTemplateID != null)
        'ec2LaunchTemplateID': ec2LaunchTemplateID,
      if (enableMapAutoTagging != null)
        'enableMapAutoTagging': enableMapAutoTagging,
      if (largeVolumeConf != null) 'largeVolumeConf': largeVolumeConf,
      if (launchDisposition != null)
        'launchDisposition': launchDisposition.toValue(),
      if (licensing != null) 'licensing': licensing,
      if (mapAutoTaggingMpeID != null)
        'mapAutoTaggingMpeID': mapAutoTaggingMpeID,
      if (postLaunchActions != null) 'postLaunchActions': postLaunchActions,
      if (smallVolumeConf != null) 'smallVolumeConf': smallVolumeConf,
      if (smallVolumeMaxSize != null) 'smallVolumeMaxSize': smallVolumeMaxSize,
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

/// Launch template disk configuration.
class LaunchTemplateDiskConf {
  /// Launch template disk iops configuration.
  final int? iops;

  /// Launch template disk throughput configuration.
  final int? throughput;

  /// Launch template disk volume type configuration.
  final VolumeType? volumeType;

  LaunchTemplateDiskConf({
    this.iops,
    this.throughput,
    this.volumeType,
  });

  factory LaunchTemplateDiskConf.fromJson(Map<String, dynamic> json) {
    return LaunchTemplateDiskConf(
      iops: json['iops'] as int?,
      throughput: json['throughput'] as int?,
      volumeType: (json['volumeType'] as String?)?.toVolumeType(),
    );
  }

  Map<String, dynamic> toJson() {
    final iops = this.iops;
    final throughput = this.throughput;
    final volumeType = this.volumeType;
    return {
      if (iops != null) 'iops': iops,
      if (throughput != null) 'throughput': throughput,
      if (volumeType != null) 'volumeType': volumeType.toValue(),
    };
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
  pendingInstallation,
}

extension LifeCycleStateValueExtension on LifeCycleState {
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
      case LifeCycleState.pendingInstallation:
        return 'PENDING_INSTALLATION';
    }
  }
}

extension LifeCycleStateFromString on String {
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
      case 'PENDING_INSTALLATION':
        return LifeCycleState.pendingInstallation;
    }
    throw Exception('$this is not known in enum LifeCycleState');
  }
}

/// Applications list filters.
class ListApplicationsRequestFilters {
  /// Filter applications list by application ID.
  final List<String>? applicationIDs;

  /// Filter applications list by archival status.
  final bool? isArchived;

  /// Filter applications list by wave ID.
  final List<String>? waveIDs;

  ListApplicationsRequestFilters({
    this.applicationIDs,
    this.isArchived,
    this.waveIDs,
  });

  Map<String, dynamic> toJson() {
    final applicationIDs = this.applicationIDs;
    final isArchived = this.isArchived;
    final waveIDs = this.waveIDs;
    return {
      if (applicationIDs != null) 'applicationIDs': applicationIDs,
      if (isArchived != null) 'isArchived': isArchived,
      if (waveIDs != null) 'waveIDs': waveIDs,
    };
  }
}

class ListApplicationsResponse {
  /// Applications list.
  final List<Application>? items;

  /// Response next token.
  final String? nextToken;

  ListApplicationsResponse({
    this.items,
    this.nextToken,
  });

  factory ListApplicationsResponse.fromJson(Map<String, dynamic> json) {
    return ListApplicationsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Application.fromJson(e as Map<String, dynamic>))
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

/// List Connectors Request Filters.
class ListConnectorsRequestFilters {
  /// List Connectors Request Filters connector IDs.
  final List<String>? connectorIDs;

  ListConnectorsRequestFilters({
    this.connectorIDs,
  });

  Map<String, dynamic> toJson() {
    final connectorIDs = this.connectorIDs;
    return {
      if (connectorIDs != null) 'connectorIDs': connectorIDs,
    };
  }
}

class ListConnectorsResponse {
  /// List connectors response items.
  final List<Connector>? items;

  /// List connectors response next token.
  final String? nextToken;

  ListConnectorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListConnectorsResponse.fromJson(Map<String, dynamic> json) {
    return ListConnectorsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Connector.fromJson(e as Map<String, dynamic>))
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

/// List export errors response.
class ListExportErrorsResponse {
  /// List export errors response items.
  final List<ExportTaskError>? items;

  /// List export errors response next token.
  final String? nextToken;

  ListExportErrorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListExportErrorsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportErrorsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ExportTaskError.fromJson(e as Map<String, dynamic>))
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

/// List exports request filters.
class ListExportsRequestFilters {
  /// List exports request filters export ids.
  final List<String>? exportIDs;

  ListExportsRequestFilters({
    this.exportIDs,
  });

  Map<String, dynamic> toJson() {
    final exportIDs = this.exportIDs;
    return {
      if (exportIDs != null) 'exportIDs': exportIDs,
    };
  }
}

/// List export response.
class ListExportsResponse {
  /// List export response items.
  final List<ExportTask>? items;

  /// List export response next token.
  final String? nextToken;

  ListExportsResponse({
    this.items,
    this.nextToken,
  });

  factory ListExportsResponse.fromJson(Map<String, dynamic> json) {
    return ListExportsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ExportTask.fromJson(e as Map<String, dynamic>))
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

/// List imports errors response.
class ListImportErrorsResponse {
  /// List imports errors response items.
  final List<ImportTaskError>? items;

  /// List imports errors response next token.
  final String? nextToken;

  ListImportErrorsResponse({
    this.items,
    this.nextToken,
  });

  factory ListImportErrorsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportErrorsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ImportTaskError.fromJson(e as Map<String, dynamic>))
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

/// List imports request filters.
class ListImportsRequestFilters {
  /// List imports request filters import IDs.
  final List<String>? importIDs;

  ListImportsRequestFilters({
    this.importIDs,
  });

  Map<String, dynamic> toJson() {
    final importIDs = this.importIDs;
    return {
      if (importIDs != null) 'importIDs': importIDs,
    };
  }
}

/// List import response.
class ListImportsResponse {
  /// List import response items.
  final List<ImportTask>? items;

  /// List import response next token.
  final String? nextToken;

  ListImportsResponse({
    this.items,
    this.nextToken,
  });

  factory ListImportsResponse.fromJson(Map<String, dynamic> json) {
    return ListImportsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => ImportTask.fromJson(e as Map<String, dynamic>))
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

/// List managed accounts response.
class ListManagedAccountsResponse {
  /// List managed accounts response items.
  final List<ManagedAccount> items;

  /// List managed accounts response next token.
  final String? nextToken;

  ListManagedAccountsResponse({
    required this.items,
    this.nextToken,
  });

  factory ListManagedAccountsResponse.fromJson(Map<String, dynamic> json) {
    return ListManagedAccountsResponse(
      items: (json['items'] as List)
          .whereNotNull()
          .map((e) => ManagedAccount.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextToken: json['nextToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final items = this.items;
    final nextToken = this.nextToken;
    return {
      'items': items,
      if (nextToken != null) 'nextToken': nextToken,
    };
  }
}

class ListSourceServerActionsResponse {
  /// List of source server post migration custom actions.
  final List<SourceServerActionDocument>? items;

  /// Next token returned when listing source server post migration custom
  /// actions.
  final String? nextToken;

  ListSourceServerActionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListSourceServerActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListSourceServerActionsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) =>
              SourceServerActionDocument.fromJson(e as Map<String, dynamic>))
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

class ListTemplateActionsResponse {
  /// List of template post migration custom actions.
  final List<TemplateActionDocument>? items;

  /// Next token returned when listing template post migration custom actions.
  final String? nextToken;

  ListTemplateActionsResponse({
    this.items,
    this.nextToken,
  });

  factory ListTemplateActionsResponse.fromJson(Map<String, dynamic> json) {
    return ListTemplateActionsResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map(
              (e) => TemplateActionDocument.fromJson(e as Map<String, dynamic>))
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

/// Waves list filters.
class ListWavesRequestFilters {
  /// Filter waves list by archival status.
  final bool? isArchived;

  /// Filter waves list by wave ID.
  final List<String>? waveIDs;

  ListWavesRequestFilters({
    this.isArchived,
    this.waveIDs,
  });

  Map<String, dynamic> toJson() {
    final isArchived = this.isArchived;
    final waveIDs = this.waveIDs;
    return {
      if (isArchived != null) 'isArchived': isArchived,
      if (waveIDs != null) 'waveIDs': waveIDs,
    };
  }
}

class ListWavesResponse {
  /// Waves list.
  final List<Wave>? items;

  /// Response next token.
  final String? nextToken;

  ListWavesResponse({
    this.items,
    this.nextToken,
  });

  factory ListWavesResponse.fromJson(Map<String, dynamic> json) {
    return ListWavesResponse(
      items: (json['items'] as List?)
          ?.whereNotNull()
          .map((e) => Wave.fromJson(e as Map<String, dynamic>))
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

/// Managed account.
class ManagedAccount {
  /// Managed account, account ID.
  final String? accountId;

  ManagedAccount({
    this.accountId,
  });

  factory ManagedAccount.fromJson(Map<String, dynamic> json) {
    return ManagedAccount(
      accountId: json['accountId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final accountId = this.accountId;
    return {
      if (accountId != null) 'accountId': accountId,
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

  /// Participating server's launched ec2 instance ID.
  final String? launchedEc2InstanceID;

  /// Participating server's Post Launch Actions Status.
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

extension PostLaunchActionExecutionStatusValueExtension
    on PostLaunchActionExecutionStatus {
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

extension PostLaunchActionExecutionStatusFromString on String {
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

/// Post Launch Actions to executed on the Test or Cutover instance.
class PostLaunchActions {
  /// AWS Systems Manager Command's CloudWatch log group name.
  final String? cloudWatchLogGroupName;

  /// Deployment type in which AWS Systems Manager Documents will be executed.
  final PostLaunchActionsDeploymentType? deployment;

  /// AWS Systems Manager Command's logs S3 log bucket.
  final String? s3LogBucket;

  /// AWS Systems Manager Command's logs S3 output key prefix.
  final String? s3OutputKeyPrefix;

  /// AWS Systems Manager Documents.
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
  testOnly,
}

extension PostLaunchActionsDeploymentTypeValueExtension
    on PostLaunchActionsDeploymentType {
  String toValue() {
    switch (this) {
      case PostLaunchActionsDeploymentType.testAndCutover:
        return 'TEST_AND_CUTOVER';
      case PostLaunchActionsDeploymentType.cutoverOnly:
        return 'CUTOVER_ONLY';
      case PostLaunchActionsDeploymentType.testOnly:
        return 'TEST_ONLY';
    }
  }
}

extension PostLaunchActionsDeploymentTypeFromString on String {
  PostLaunchActionsDeploymentType toPostLaunchActionsDeploymentType() {
    switch (this) {
      case 'TEST_AND_CUTOVER':
        return PostLaunchActionsDeploymentType.testAndCutover;
      case 'CUTOVER_ONLY':
        return PostLaunchActionsDeploymentType.cutoverOnly;
      case 'TEST_ONLY':
        return PostLaunchActionsDeploymentType.testOnly;
    }
    throw Exception(
        '$this is not known in enum PostLaunchActionsDeploymentType');
  }
}

/// Status of the Post Launch Actions running on the Test or Cutover instance.
class PostLaunchActionsStatus {
  /// List of Post Launch Action status.
  final List<JobPostLaunchActionsLaunchStatus>?
      postLaunchActionsLaunchStatusList;

  /// Time where the AWS Systems Manager was detected as running on the Test or
  /// Cutover instance.
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

class RemoveSourceServerActionResponse {
  RemoveSourceServerActionResponse();

  factory RemoveSourceServerActionResponse.fromJson(Map<String, dynamic> _) {
    return RemoveSourceServerActionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
  }
}

class RemoveTemplateActionResponse {
  RemoveTemplateActionResponse();

  factory RemoveTemplateActionResponse.fromJson(Map<String, dynamic> _) {
    return RemoveTemplateActionResponse();
  }

  Map<String, dynamic> toJson() {
    return {};
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

  /// Replication Configuration use Fips Endpoint.
  final bool? useFipsEndpoint;

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
    this.useFipsEndpoint,
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
      useFipsEndpoint: json['useFipsEndpoint'] as bool?,
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
    final useFipsEndpoint = this.useFipsEndpoint;
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
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
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
  st1,
  gp3,
}

extension ReplicationConfigurationDefaultLargeStagingDiskTypeValueExtension
    on ReplicationConfigurationDefaultLargeStagingDiskType {
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

extension ReplicationConfigurationDefaultLargeStagingDiskTypeFromString
    on String {
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

extension ReplicationConfigurationReplicatedDiskStagingDiskTypeValueExtension
    on ReplicationConfigurationReplicatedDiskStagingDiskType {
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

extension ReplicationConfigurationReplicatedDiskStagingDiskTypeFromString
    on String {
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

  /// Replication Configuration template use Fips Endpoint.
  final bool? useFipsEndpoint;

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
    this.useFipsEndpoint,
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
      useFipsEndpoint: json['useFipsEndpoint'] as bool?,
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
    final useFipsEndpoint = this.useFipsEndpoint;
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
      if (useFipsEndpoint != null) 'useFipsEndpoint': useFipsEndpoint,
    };
  }
}

enum ReplicationType {
  agentBased,
  snapshotShipping,
}

extension ReplicationTypeValueExtension on ReplicationType {
  String toValue() {
    switch (this) {
      case ReplicationType.agentBased:
        return 'AGENT_BASED';
      case ReplicationType.snapshotShipping:
        return 'SNAPSHOT_SHIPPING';
    }
  }
}

extension ReplicationTypeFromString on String {
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

/// S3 bucket source.
class S3BucketSource {
  /// S3 bucket source s3 bucket.
  final String s3Bucket;

  /// S3 bucket source s3 key.
  final String s3Key;

  /// S3 bucket source s3 bucket owner.
  final String? s3BucketOwner;

  S3BucketSource({
    required this.s3Bucket,
    required this.s3Key,
    this.s3BucketOwner,
  });

  factory S3BucketSource.fromJson(Map<String, dynamic> json) {
    return S3BucketSource(
      s3Bucket: json['s3Bucket'] as String,
      s3Key: json['s3Key'] as String,
      s3BucketOwner: json['s3BucketOwner'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final s3Bucket = this.s3Bucket;
    final s3Key = this.s3Key;
    final s3BucketOwner = this.s3BucketOwner;
    return {
      's3Bucket': s3Bucket,
      's3Key': s3Key,
      if (s3BucketOwner != null) 's3BucketOwner': s3BucketOwner,
    };
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
  /// Source server application ID.
  final String? applicationID;

  /// Source server ARN.
  final String? arn;

  /// Source Server connector action.
  final SourceServerConnectorAction? connectorAction;

  /// Source server data replication info.
  final DataReplicationInfo? dataReplicationInfo;

  /// Source server fqdn for action framework.
  final String? fqdnForActionFramework;

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

  /// Source server user provided ID.
  final String? userProvidedID;

  /// Source server vCenter client id.
  final String? vcenterClientID;

  SourceServer({
    this.applicationID,
    this.arn,
    this.connectorAction,
    this.dataReplicationInfo,
    this.fqdnForActionFramework,
    this.isArchived,
    this.launchedInstance,
    this.lifeCycle,
    this.replicationType,
    this.sourceProperties,
    this.sourceServerID,
    this.tags,
    this.userProvidedID,
    this.vcenterClientID,
  });

  factory SourceServer.fromJson(Map<String, dynamic> json) {
    return SourceServer(
      applicationID: json['applicationID'] as String?,
      arn: json['arn'] as String?,
      connectorAction: json['connectorAction'] != null
          ? SourceServerConnectorAction.fromJson(
              json['connectorAction'] as Map<String, dynamic>)
          : null,
      dataReplicationInfo: json['dataReplicationInfo'] != null
          ? DataReplicationInfo.fromJson(
              json['dataReplicationInfo'] as Map<String, dynamic>)
          : null,
      fqdnForActionFramework: json['fqdnForActionFramework'] as String?,
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
      userProvidedID: json['userProvidedID'] as String?,
      vcenterClientID: json['vcenterClientID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final applicationID = this.applicationID;
    final arn = this.arn;
    final connectorAction = this.connectorAction;
    final dataReplicationInfo = this.dataReplicationInfo;
    final fqdnForActionFramework = this.fqdnForActionFramework;
    final isArchived = this.isArchived;
    final launchedInstance = this.launchedInstance;
    final lifeCycle = this.lifeCycle;
    final replicationType = this.replicationType;
    final sourceProperties = this.sourceProperties;
    final sourceServerID = this.sourceServerID;
    final tags = this.tags;
    final userProvidedID = this.userProvidedID;
    final vcenterClientID = this.vcenterClientID;
    return {
      if (applicationID != null) 'applicationID': applicationID,
      if (arn != null) 'arn': arn,
      if (connectorAction != null) 'connectorAction': connectorAction,
      if (dataReplicationInfo != null)
        'dataReplicationInfo': dataReplicationInfo,
      if (fqdnForActionFramework != null)
        'fqdnForActionFramework': fqdnForActionFramework,
      if (isArchived != null) 'isArchived': isArchived,
      if (launchedInstance != null) 'launchedInstance': launchedInstance,
      if (lifeCycle != null) 'lifeCycle': lifeCycle,
      if (replicationType != null) 'replicationType': replicationType.toValue(),
      if (sourceProperties != null) 'sourceProperties': sourceProperties,
      if (sourceServerID != null) 'sourceServerID': sourceServerID,
      if (tags != null) 'tags': tags,
      if (userProvidedID != null) 'userProvidedID': userProvidedID,
      if (vcenterClientID != null) 'vcenterClientID': vcenterClientID,
    };
  }
}

class SourceServerActionDocument {
  /// Source server post migration custom action ID.
  final String? actionID;

  /// Source server post migration custom action name.
  final String? actionName;

  /// Source server post migration custom action active status.
  final bool? active;

  /// Source server post migration custom action category.
  final ActionCategory? category;

  /// Source server post migration custom action description.
  final String? description;

  /// Source server post migration custom action document identifier.
  final String? documentIdentifier;

  /// Source server post migration custom action document version.
  final String? documentVersion;

  /// Source server post migration custom action external parameters.
  final Map<String, SsmExternalParameter>? externalParameters;

  /// Source server post migration custom action must succeed for cutover.
  final bool? mustSucceedForCutover;

  /// Source server post migration custom action order.
  final int? order;

  /// Source server post migration custom action parameters.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// Source server post migration custom action timeout in seconds.
  final int? timeoutSeconds;

  SourceServerActionDocument({
    this.actionID,
    this.actionName,
    this.active,
    this.category,
    this.description,
    this.documentIdentifier,
    this.documentVersion,
    this.externalParameters,
    this.mustSucceedForCutover,
    this.order,
    this.parameters,
    this.timeoutSeconds,
  });

  factory SourceServerActionDocument.fromJson(Map<String, dynamic> json) {
    return SourceServerActionDocument(
      actionID: json['actionID'] as String?,
      actionName: json['actionName'] as String?,
      active: json['active'] as bool?,
      category: (json['category'] as String?)?.toActionCategory(),
      description: json['description'] as String?,
      documentIdentifier: json['documentIdentifier'] as String?,
      documentVersion: json['documentVersion'] as String?,
      externalParameters: (json['externalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, SsmExternalParameter.fromJson(e as Map<String, dynamic>))),
      mustSucceedForCutover: json['mustSucceedForCutover'] as bool?,
      order: json['order'] as int?,
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
    final actionID = this.actionID;
    final actionName = this.actionName;
    final active = this.active;
    final category = this.category;
    final description = this.description;
    final documentIdentifier = this.documentIdentifier;
    final documentVersion = this.documentVersion;
    final externalParameters = this.externalParameters;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final order = this.order;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      if (actionID != null) 'actionID': actionID,
      if (actionName != null) 'actionName': actionName,
      if (active != null) 'active': active,
      if (category != null) 'category': category.toValue(),
      if (description != null) 'description': description,
      if (documentIdentifier != null) 'documentIdentifier': documentIdentifier,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (order != null) 'order': order,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
  }
}

/// Source server post migration custom action filters.
class SourceServerActionsRequestFilters {
  /// Action IDs to filter source server post migration custom actions by.
  final List<String>? actionIDs;

  SourceServerActionsRequestFilters({
    this.actionIDs,
  });

  Map<String, dynamic> toJson() {
    final actionIDs = this.actionIDs;
    return {
      if (actionIDs != null) 'actionIDs': actionIDs,
    };
  }
}

/// Source Server connector action.
class SourceServerConnectorAction {
  /// Source Server connector action connector arn.
  final String? connectorArn;

  /// Source Server connector action credentials secret arn.
  final String? credentialsSecretArn;

  SourceServerConnectorAction({
    this.connectorArn,
    this.credentialsSecretArn,
  });

  factory SourceServerConnectorAction.fromJson(Map<String, dynamic> json) {
    return SourceServerConnectorAction(
      connectorArn: json['connectorArn'] as String?,
      credentialsSecretArn: json['credentialsSecretArn'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final connectorArn = this.connectorArn;
    final credentialsSecretArn = this.credentialsSecretArn;
    return {
      if (connectorArn != null) 'connectorArn': connectorArn,
      if (credentialsSecretArn != null)
        'credentialsSecretArn': credentialsSecretArn,
    };
  }
}

/// AWS Systems Manager Document.
class SsmDocument {
  /// User-friendly name for the AWS Systems Manager Document.
  final String actionName;

  /// AWS Systems Manager Document name or full ARN.
  final String ssmDocumentName;

  /// AWS Systems Manager Document external parameters.
  final Map<String, SsmExternalParameter>? externalParameters;

  /// If true, Cutover will not be enabled if the document has failed.
  final bool? mustSucceedForCutover;

  /// AWS Systems Manager Document parameters.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// AWS Systems Manager Document timeout seconds.
  final int? timeoutSeconds;

  SsmDocument({
    required this.actionName,
    required this.ssmDocumentName,
    this.externalParameters,
    this.mustSucceedForCutover,
    this.parameters,
    this.timeoutSeconds,
  });

  factory SsmDocument.fromJson(Map<String, dynamic> json) {
    return SsmDocument(
      actionName: json['actionName'] as String,
      ssmDocumentName: json['ssmDocumentName'] as String,
      externalParameters: (json['externalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, SsmExternalParameter.fromJson(e as Map<String, dynamic>))),
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
    final externalParameters = this.externalParameters;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      'actionName': actionName,
      'ssmDocumentName': ssmDocumentName,
      if (externalParameters != null) 'externalParameters': externalParameters,
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

extension SsmDocumentTypeValueExtension on SsmDocumentType {
  String toValue() {
    switch (this) {
      case SsmDocumentType.automation:
        return 'AUTOMATION';
      case SsmDocumentType.command:
        return 'COMMAND';
    }
  }
}

extension SsmDocumentTypeFromString on String {
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

/// AWS Systems Manager Document external parameter.
class SsmExternalParameter {
  /// AWS Systems Manager Document external parameters dynamic path.
  final String? dynamicPath;

  SsmExternalParameter({
    this.dynamicPath,
  });

  factory SsmExternalParameter.fromJson(Map<String, dynamic> json) {
    return SsmExternalParameter(
      dynamicPath: json['dynamicPath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final dynamicPath = this.dynamicPath;
    return {
      if (dynamicPath != null) 'dynamicPath': dynamicPath,
    };
  }
}

/// AWS Systems Manager Parameter Store parameter.
class SsmParameterStoreParameter {
  /// AWS Systems Manager Parameter Store parameter name.
  final String parameterName;

  /// AWS Systems Manager Parameter Store parameter type.
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

extension SsmParameterStoreParameterTypeValueExtension
    on SsmParameterStoreParameterType {
  String toValue() {
    switch (this) {
      case SsmParameterStoreParameterType.string:
        return 'STRING';
    }
  }
}

extension SsmParameterStoreParameterTypeFromString on String {
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

/// Start export response.
class StartExportResponse {
  /// Start export response export task.
  final ExportTask? exportTask;

  StartExportResponse({
    this.exportTask,
  });

  factory StartExportResponse.fromJson(Map<String, dynamic> json) {
    return StartExportResponse(
      exportTask: json['exportTask'] != null
          ? ExportTask.fromJson(json['exportTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final exportTask = this.exportTask;
    return {
      if (exportTask != null) 'exportTask': exportTask,
    };
  }
}

/// Start import response.
class StartImportResponse {
  /// Start import response import task.
  final ImportTask? importTask;

  StartImportResponse({
    this.importTask,
  });

  factory StartImportResponse.fromJson(Map<String, dynamic> json) {
    return StartImportResponse(
      importTask: json['importTask'] != null
          ? ImportTask.fromJson(json['importTask'] as Map<String, dynamic>)
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final importTask = this.importTask;
    return {
      if (importTask != null) 'importTask': importTask,
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

class TemplateActionDocument {
  /// Template post migration custom action ID.
  final String? actionID;

  /// Template post migration custom action name.
  final String? actionName;

  /// Template post migration custom action active status.
  final bool? active;

  /// Template post migration custom action category.
  final ActionCategory? category;

  /// Template post migration custom action description.
  final String? description;

  /// Template post migration custom action document identifier.
  final String? documentIdentifier;

  /// Template post migration custom action document version.
  final String? documentVersion;

  /// Template post migration custom action external parameters.
  final Map<String, SsmExternalParameter>? externalParameters;

  /// Template post migration custom action must succeed for cutover.
  final bool? mustSucceedForCutover;

  /// Operating system eligible for this template post migration custom action.
  final String? operatingSystem;

  /// Template post migration custom action order.
  final int? order;

  /// Template post migration custom action parameters.
  final Map<String, List<SsmParameterStoreParameter>>? parameters;

  /// Template post migration custom action timeout in seconds.
  final int? timeoutSeconds;

  TemplateActionDocument({
    this.actionID,
    this.actionName,
    this.active,
    this.category,
    this.description,
    this.documentIdentifier,
    this.documentVersion,
    this.externalParameters,
    this.mustSucceedForCutover,
    this.operatingSystem,
    this.order,
    this.parameters,
    this.timeoutSeconds,
  });

  factory TemplateActionDocument.fromJson(Map<String, dynamic> json) {
    return TemplateActionDocument(
      actionID: json['actionID'] as String?,
      actionName: json['actionName'] as String?,
      active: json['active'] as bool?,
      category: (json['category'] as String?)?.toActionCategory(),
      description: json['description'] as String?,
      documentIdentifier: json['documentIdentifier'] as String?,
      documentVersion: json['documentVersion'] as String?,
      externalParameters: (json['externalParameters'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(
              k, SsmExternalParameter.fromJson(e as Map<String, dynamic>))),
      mustSucceedForCutover: json['mustSucceedForCutover'] as bool?,
      operatingSystem: json['operatingSystem'] as String?,
      order: json['order'] as int?,
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
    final actionID = this.actionID;
    final actionName = this.actionName;
    final active = this.active;
    final category = this.category;
    final description = this.description;
    final documentIdentifier = this.documentIdentifier;
    final documentVersion = this.documentVersion;
    final externalParameters = this.externalParameters;
    final mustSucceedForCutover = this.mustSucceedForCutover;
    final operatingSystem = this.operatingSystem;
    final order = this.order;
    final parameters = this.parameters;
    final timeoutSeconds = this.timeoutSeconds;
    return {
      if (actionID != null) 'actionID': actionID,
      if (actionName != null) 'actionName': actionName,
      if (active != null) 'active': active,
      if (category != null) 'category': category.toValue(),
      if (description != null) 'description': description,
      if (documentIdentifier != null) 'documentIdentifier': documentIdentifier,
      if (documentVersion != null) 'documentVersion': documentVersion,
      if (externalParameters != null) 'externalParameters': externalParameters,
      if (mustSucceedForCutover != null)
        'mustSucceedForCutover': mustSucceedForCutover,
      if (operatingSystem != null) 'operatingSystem': operatingSystem,
      if (order != null) 'order': order,
      if (parameters != null) 'parameters': parameters,
      if (timeoutSeconds != null) 'timeoutSeconds': timeoutSeconds,
    };
  }
}

/// Template post migration custom action filters.
class TemplateActionsRequestFilters {
  /// Action IDs to filter template post migration custom actions by.
  final List<String>? actionIDs;

  TemplateActionsRequestFilters({
    this.actionIDs,
  });

  Map<String, dynamic> toJson() {
    final actionIDs = this.actionIDs;
    return {
      if (actionIDs != null) 'actionIDs': actionIDs,
    };
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

enum VolumeType {
  io1,
  io2,
  gp3,
  gp2,
  st1,
  sc1,
  standard,
}

extension VolumeTypeValueExtension on VolumeType {
  String toValue() {
    switch (this) {
      case VolumeType.io1:
        return 'io1';
      case VolumeType.io2:
        return 'io2';
      case VolumeType.gp3:
        return 'gp3';
      case VolumeType.gp2:
        return 'gp2';
      case VolumeType.st1:
        return 'st1';
      case VolumeType.sc1:
        return 'sc1';
      case VolumeType.standard:
        return 'standard';
    }
  }
}

extension VolumeTypeFromString on String {
  VolumeType toVolumeType() {
    switch (this) {
      case 'io1':
        return VolumeType.io1;
      case 'io2':
        return VolumeType.io2;
      case 'gp3':
        return VolumeType.gp3;
      case 'gp2':
        return VolumeType.gp2;
      case 'st1':
        return VolumeType.st1;
      case 'sc1':
        return VolumeType.sc1;
      case 'standard':
        return VolumeType.standard;
    }
    throw Exception('$this is not known in enum VolumeType');
  }
}

class Wave {
  /// Wave ARN.
  final String? arn;

  /// Wave creation dateTime.
  final String? creationDateTime;

  /// Wave description.
  final String? description;

  /// Wave archival status.
  final bool? isArchived;

  /// Wave last modified dateTime.
  final String? lastModifiedDateTime;

  /// Wave name.
  final String? name;

  /// Wave tags.
  final Map<String, String>? tags;

  /// Wave aggregated status.
  final WaveAggregatedStatus? waveAggregatedStatus;

  /// Wave ID.
  final String? waveID;

  Wave({
    this.arn,
    this.creationDateTime,
    this.description,
    this.isArchived,
    this.lastModifiedDateTime,
    this.name,
    this.tags,
    this.waveAggregatedStatus,
    this.waveID,
  });

  factory Wave.fromJson(Map<String, dynamic> json) {
    return Wave(
      arn: json['arn'] as String?,
      creationDateTime: json['creationDateTime'] as String?,
      description: json['description'] as String?,
      isArchived: json['isArchived'] as bool?,
      lastModifiedDateTime: json['lastModifiedDateTime'] as String?,
      name: json['name'] as String?,
      tags: (json['tags'] as Map<String, dynamic>?)
          ?.map((k, e) => MapEntry(k, e as String)),
      waveAggregatedStatus: json['waveAggregatedStatus'] != null
          ? WaveAggregatedStatus.fromJson(
              json['waveAggregatedStatus'] as Map<String, dynamic>)
          : null,
      waveID: json['waveID'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final arn = this.arn;
    final creationDateTime = this.creationDateTime;
    final description = this.description;
    final isArchived = this.isArchived;
    final lastModifiedDateTime = this.lastModifiedDateTime;
    final name = this.name;
    final tags = this.tags;
    final waveAggregatedStatus = this.waveAggregatedStatus;
    final waveID = this.waveID;
    return {
      if (arn != null) 'arn': arn,
      if (creationDateTime != null) 'creationDateTime': creationDateTime,
      if (description != null) 'description': description,
      if (isArchived != null) 'isArchived': isArchived,
      if (lastModifiedDateTime != null)
        'lastModifiedDateTime': lastModifiedDateTime,
      if (name != null) 'name': name,
      if (tags != null) 'tags': tags,
      if (waveAggregatedStatus != null)
        'waveAggregatedStatus': waveAggregatedStatus,
      if (waveID != null) 'waveID': waveID,
    };
  }
}

/// Wave aggregated status.
class WaveAggregatedStatus {
  /// Wave aggregated status health status.
  final WaveHealthStatus? healthStatus;

  /// Wave aggregated status last update dateTime.
  final String? lastUpdateDateTime;

  /// Wave aggregated status progress status.
  final WaveProgressStatus? progressStatus;

  /// DateTime marking when the first source server in the wave started
  /// replication.
  final String? replicationStartedDateTime;

  /// Wave aggregated status total applications amount.
  final int? totalApplications;

  WaveAggregatedStatus({
    this.healthStatus,
    this.lastUpdateDateTime,
    this.progressStatus,
    this.replicationStartedDateTime,
    this.totalApplications,
  });

  factory WaveAggregatedStatus.fromJson(Map<String, dynamic> json) {
    return WaveAggregatedStatus(
      healthStatus: (json['healthStatus'] as String?)?.toWaveHealthStatus(),
      lastUpdateDateTime: json['lastUpdateDateTime'] as String?,
      progressStatus:
          (json['progressStatus'] as String?)?.toWaveProgressStatus(),
      replicationStartedDateTime: json['replicationStartedDateTime'] as String?,
      totalApplications: json['totalApplications'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    final healthStatus = this.healthStatus;
    final lastUpdateDateTime = this.lastUpdateDateTime;
    final progressStatus = this.progressStatus;
    final replicationStartedDateTime = this.replicationStartedDateTime;
    final totalApplications = this.totalApplications;
    return {
      if (healthStatus != null) 'healthStatus': healthStatus.toValue(),
      if (lastUpdateDateTime != null) 'lastUpdateDateTime': lastUpdateDateTime,
      if (progressStatus != null) 'progressStatus': progressStatus.toValue(),
      if (replicationStartedDateTime != null)
        'replicationStartedDateTime': replicationStartedDateTime,
      if (totalApplications != null) 'totalApplications': totalApplications,
    };
  }
}

enum WaveHealthStatus {
  healthy,
  lagging,
  error,
}

extension WaveHealthStatusValueExtension on WaveHealthStatus {
  String toValue() {
    switch (this) {
      case WaveHealthStatus.healthy:
        return 'HEALTHY';
      case WaveHealthStatus.lagging:
        return 'LAGGING';
      case WaveHealthStatus.error:
        return 'ERROR';
    }
  }
}

extension WaveHealthStatusFromString on String {
  WaveHealthStatus toWaveHealthStatus() {
    switch (this) {
      case 'HEALTHY':
        return WaveHealthStatus.healthy;
      case 'LAGGING':
        return WaveHealthStatus.lagging;
      case 'ERROR':
        return WaveHealthStatus.error;
    }
    throw Exception('$this is not known in enum WaveHealthStatus');
  }
}

enum WaveProgressStatus {
  notStarted,
  inProgress,
  completed,
}

extension WaveProgressStatusValueExtension on WaveProgressStatus {
  String toValue() {
    switch (this) {
      case WaveProgressStatus.notStarted:
        return 'NOT_STARTED';
      case WaveProgressStatus.inProgress:
        return 'IN_PROGRESS';
      case WaveProgressStatus.completed:
        return 'COMPLETED';
    }
  }
}

extension WaveProgressStatusFromString on String {
  WaveProgressStatus toWaveProgressStatus() {
    switch (this) {
      case 'NOT_STARTED':
        return WaveProgressStatus.notStarted;
      case 'IN_PROGRESS':
        return WaveProgressStatus.inProgress;
      case 'COMPLETED':
        return WaveProgressStatus.completed;
    }
    throw Exception('$this is not known in enum WaveProgressStatus');
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
