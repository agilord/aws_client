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

import '2013-01-10.meta.dart';
export '../../shared/shared.dart' show AwsClientCredentials;

class Rds {
  final _s.QueryProtocol _protocol;
  final Map<String, _s.Shape> shapes;

  Rds({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.Client? client,
  })  : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds',
          ),
          region: region,
          credentials: credentials,
        ),
        shapes = shapesJson
            .map((key, value) => MapEntry(key, _s.Shape.fromJson(value)));

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(sourceIdentifier, 'sourceIdentifier');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'AddSourceIdentifierToSubscription',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddSourceIdentifierToSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'AddSourceIdentifierToSubscriptionResult',
    );
    return AddSourceIdentifierToSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<void> addTagsToResource({
    required String resourceName,
    required List<Tag> tags,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tags, 'tags');
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['Tags'] = tags;
    await _protocol.send(
      $request,
      action: 'AddTagsToResource',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AddTagsToResourceMessage'],
      shapes: shapes,
    );
  }

  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [AuthorizationAlreadyExistsFault].
  /// May throw [AuthorizationQuotaExceededFault].
  Future<AuthorizeDBSecurityGroupIngressResult>
      authorizeDBSecurityGroupIngress({
    required String dBSecurityGroupName,
    String? cidrip,
    String? eC2SecurityGroupId,
    String? eC2SecurityGroupName,
    String? eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupId?.also((arg) => $request['EC2SecurityGroupId'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeDBSecurityGroupIngress',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['AuthorizeDBSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'AuthorizeDBSecurityGroupIngressResult',
    );
    return AuthorizeDBSecurityGroupIngressResult.fromXml($result);
  }

  ///
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [SnapshotQuotaExceededFault].
  Future<CopyDBSnapshotResult> copyDBSnapshot({
    required String sourceDBSnapshotIdentifier,
    required String targetDBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBSnapshotIdentifier, 'sourceDBSnapshotIdentifier');
    ArgumentError.checkNotNull(
        targetDBSnapshotIdentifier, 'targetDBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceDBSnapshotIdentifier'] = sourceDBSnapshotIdentifier;
    $request['TargetDBSnapshotIdentifier'] = targetDBSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBSnapshot',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CopyDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CopyDBSnapshotResult',
    );
    return CopyDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<CreateDBInstanceResult> createDBInstance({
    required int allocatedStorage,
    required String dBInstanceClass,
    required String dBInstanceIdentifier,
    required String engine,
    required String masterUserPassword,
    required String masterUsername,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    int? backupRetentionPeriod,
    String? characterSetName,
    String? dBName,
    String? dBParameterGroupName,
    List<String>? dBSecurityGroups,
    String? dBSubnetGroupName,
    String? engineVersion,
    int? iops,
    String? licenseModel,
    bool? multiAZ,
    String? optionGroupName,
    int? port,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    bool? publiclyAccessible,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(allocatedStorage, 'allocatedStorage');
    ArgumentError.checkNotNull(dBInstanceClass, 'dBInstanceClass');
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(engine, 'engine');
    ArgumentError.checkNotNull(masterUserPassword, 'masterUserPassword');
    ArgumentError.checkNotNull(masterUsername, 'masterUsername');
    final $request = <String, dynamic>{};
    $request['AllocatedStorage'] = allocatedStorage;
    $request['DBInstanceClass'] = dBInstanceClass;
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['Engine'] = engine;
    $request['MasterUserPassword'] = masterUserPassword;
    $request['MasterUsername'] = masterUsername;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    characterSetName?.also((arg) => $request['CharacterSetName'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstance',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBInstanceResult',
    );
    return CreateDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<CreateDBInstanceReadReplicaResult> createDBInstanceReadReplica({
    required String dBInstanceIdentifier,
    required String sourceDBInstanceIdentifier,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    String? dBInstanceClass,
    int? iops,
    String? optionGroupName,
    int? port,
    bool? publiclyAccessible,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(
        sourceDBInstanceIdentifier, 'sourceDBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['SourceDBInstanceIdentifier'] = sourceDBInstanceIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstanceReadReplica',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBInstanceReadReplicaMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBInstanceReadReplicaResult',
    );
    return CreateDBInstanceReadReplicaResult.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupQuotaExceededFault].
  /// May throw [DBParameterGroupAlreadyExistsFault].
  Future<CreateDBParameterGroupResult> createDBParameterGroup({
    required String dBParameterGroupFamily,
    required String dBParameterGroupName,
    required String description,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    ArgumentError.checkNotNull(description, 'description');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Description'] = description;
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBParameterGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBParameterGroupResult',
    );
    return CreateDBParameterGroupResult.fromXml($result);
  }

  ///
  /// May throw [DBSecurityGroupAlreadyExistsFault].
  /// May throw [DBSecurityGroupQuotaExceededFault].
  /// May throw [DBSecurityGroupNotSupportedFault].
  Future<CreateDBSecurityGroupResult> createDBSecurityGroup({
    required String dBSecurityGroupDescription,
    required String dBSecurityGroupName,
  }) async {
    ArgumentError.checkNotNull(
        dBSecurityGroupDescription, 'dBSecurityGroupDescription');
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupDescription'] = dBSecurityGroupDescription;
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSecurityGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSecurityGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSecurityGroupResult',
    );
    return CreateDBSecurityGroupResult.fromXml($result);
  }

  ///
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [SnapshotQuotaExceededFault].
  Future<CreateDBSnapshotResult> createDBSnapshot({
    required String dBInstanceIdentifier,
    required String dBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSnapshot',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSnapshotResult',
    );
    return CreateDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [DBSubnetGroupAlreadyExistsFault].
  /// May throw [DBSubnetGroupQuotaExceededFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  Future<CreateDBSubnetGroupResult> createDBSubnetGroup({
    required String dBSubnetGroupDescription,
    required String dBSubnetGroupName,
    required List<String> subnetIds,
  }) async {
    ArgumentError.checkNotNull(
        dBSubnetGroupDescription, 'dBSubnetGroupDescription');
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupDescription'] = dBSubnetGroupDescription;
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSubnetGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateDBSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateDBSubnetGroupResult',
    );
    return CreateDBSubnetGroupResult.fromXml($result);
  }

  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionAlreadyExistFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<CreateEventSubscriptionResult> createEventSubscription({
    required String snsTopicArn,
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    List<String>? sourceIds,
    String? sourceType,
  }) async {
    ArgumentError.checkNotNull(snsTopicArn, 'snsTopicArn');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SnsTopicArn'] = snsTopicArn;
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    sourceIds?.also((arg) => $request['SourceIds'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'CreateEventSubscription',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'CreateEventSubscriptionResult',
    );
    return CreateEventSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [OptionGroupAlreadyExistsFault].
  /// May throw [OptionGroupQuotaExceededFault].
  Future<CreateOptionGroupResult> createOptionGroup({
    required String engineName,
    required String majorEngineVersion,
    required String optionGroupDescription,
    required String optionGroupName,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    ArgumentError.checkNotNull(majorEngineVersion, 'majorEngineVersion');
    ArgumentError.checkNotNull(
        optionGroupDescription, 'optionGroupDescription');
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{};
    $request['EngineName'] = engineName;
    $request['MajorEngineVersion'] = majorEngineVersion;
    $request['OptionGroupDescription'] = optionGroupDescription;
    $request['OptionGroupName'] = optionGroupName;
    final $result = await _protocol.send(
      $request,
      action: 'CreateOptionGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['CreateOptionGroupMessage'],
      shapes: shapes,
      resultWrapper: 'CreateOptionGroupResult',
    );
    return CreateOptionGroupResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBSnapshotAlreadyExistsFault].
  /// May throw [SnapshotQuotaExceededFault].
  Future<DeleteDBInstanceResult> deleteDBInstance({
    required String dBInstanceIdentifier,
    String? finalDBSnapshotIdentifier,
    bool? skipFinalSnapshot,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    finalDBSnapshotIdentifier
        ?.also((arg) => $request['FinalDBSnapshotIdentifier'] = arg);
    skipFinalSnapshot?.also((arg) => $request['SkipFinalSnapshot'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBInstance',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBInstanceResult',
    );
    return DeleteDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  Future<void> deleteDBParameterGroup({
    required String dBParameterGroupName,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBParameterGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBParameterGroupMessage'],
      shapes: shapes,
    );
  }

  ///
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  Future<void> deleteDBSecurityGroup({
    required String dBSecurityGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBSecurityGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSecurityGroupMessage'],
      shapes: shapes,
    );
  }

  ///
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<DeleteDBSnapshotResult> deleteDBSnapshot({
    required String dBSnapshotIdentifier,
  }) async {
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBSnapshot',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteDBSnapshotResult',
    );
    return DeleteDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBSubnetGroupStateFault].
  /// May throw [InvalidDBSubnetStateFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  Future<void> deleteDBSubnetGroup({
    required String dBSubnetGroupName,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteDBSubnetGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteDBSubnetGroupMessage'],
      shapes: shapes,
    );
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidEventSubscriptionStateFault].
  Future<DeleteEventSubscriptionResult> deleteEventSubscription({
    required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'DeleteEventSubscription',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'DeleteEventSubscriptionResult',
    );
    return DeleteEventSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [InvalidOptionGroupStateFault].
  Future<void> deleteOptionGroup({
    required String optionGroupName,
  }) async {
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{};
    $request['OptionGroupName'] = optionGroupName;
    await _protocol.send(
      $request,
      action: 'DeleteOptionGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DeleteOptionGroupMessage'],
      shapes: shapes,
    );
  }

  Future<DBEngineVersionMessage> describeDBEngineVersions({
    String? dBParameterGroupFamily,
    bool? defaultOnly,
    String? engine,
    String? engineVersion,
    bool? listSupportedCharacterSets,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBParameterGroupFamily
        ?.also((arg) => $request['DBParameterGroupFamily'] = arg);
    defaultOnly?.also((arg) => $request['DefaultOnly'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    listSupportedCharacterSets
        ?.also((arg) => $request['ListSupportedCharacterSets'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBEngineVersions',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBEngineVersionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBEngineVersionsResult',
    );
    return DBEngineVersionMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  Future<DBInstanceMessage> describeDBInstances({
    String? dBInstanceIdentifier,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBInstances',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBInstancesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBInstancesResult',
    );
    return DBInstanceMessage.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupsMessage> describeDBParameterGroups({
    String? dBParameterGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameterGroups',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBParameterGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBParameterGroupsResult',
    );
    return DBParameterGroupsMessage.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupDetails> describeDBParameters({
    required String dBParameterGroupName,
    String? marker,
    int? maxRecords,
    String? source,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    source?.also((arg) => $request['Source'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameters',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBParametersResult',
    );
    return DBParameterGroupDetails.fromXml($result);
  }

  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  Future<DBSecurityGroupMessage> describeDBSecurityGroups({
    String? dBSecurityGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBSecurityGroupName?.also((arg) => $request['DBSecurityGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSecurityGroups',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSecurityGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSecurityGroupsResult',
    );
    return DBSecurityGroupMessage.fromXml($result);
  }

  ///
  /// May throw [DBSnapshotNotFoundFault].
  Future<DBSnapshotMessage> describeDBSnapshots({
    String? dBInstanceIdentifier,
    String? dBSnapshotIdentifier,
    String? marker,
    int? maxRecords,
    String? snapshotType,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceIdentifier?.also((arg) => $request['DBInstanceIdentifier'] = arg);
    dBSnapshotIdentifier?.also((arg) => $request['DBSnapshotIdentifier'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    snapshotType?.also((arg) => $request['SnapshotType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSnapshots',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSnapshotsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSnapshotsResult',
    );
    return DBSnapshotMessage.fromXml($result);
  }

  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  Future<DBSubnetGroupMessage> describeDBSubnetGroups({
    String? dBSubnetGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, dynamic>{};
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSubnetGroups',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeDBSubnetGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeDBSubnetGroupsResult',
    );
    return DBSubnetGroupMessage.fromXml($result);
  }

  Future<DescribeEngineDefaultParametersResult>
      describeEngineDefaultParameters({
    required String dBParameterGroupFamily,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(
        dBParameterGroupFamily, 'dBParameterGroupFamily');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupFamily'] = dBParameterGroupFamily;
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultParameters',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEngineDefaultParametersMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEngineDefaultParametersResult',
    );
    return DescribeEngineDefaultParametersResult.fromXml($result);
  }

  Future<EventCategoriesMessage> describeEventCategories({
    String? sourceType,
  }) async {
    final $request = <String, dynamic>{};
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventCategories',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventCategoriesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventCategoriesResult',
    );
    return EventCategoriesMessage.fromXml($result);
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  Future<EventSubscriptionsMessage> describeEventSubscriptions({
    String? marker,
    int? maxRecords,
    String? subscriptionName,
  }) async {
    final $request = <String, dynamic>{};
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    subscriptionName?.also((arg) => $request['SubscriptionName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventSubscriptions',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventSubscriptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventSubscriptionsResult',
    );
    return EventSubscriptionsMessage.fromXml($result);
  }

  Future<EventsMessage> describeEvents({
    int? duration,
    DateTime? endTime,
    List<String>? eventCategories,
    String? marker,
    int? maxRecords,
    String? sourceIdentifier,
    SourceType? sourceType,
    DateTime? startTime,
  }) async {
    final $request = <String, dynamic>{};
    duration?.also((arg) => $request['Duration'] = arg);
    endTime?.also((arg) => $request['EndTime'] = _s.iso8601ToJson(arg));
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    sourceIdentifier?.also((arg) => $request['SourceIdentifier'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg.toValue());
    startTime?.also((arg) => $request['StartTime'] = _s.iso8601ToJson(arg));
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeEventsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeEventsResult',
    );
    return EventsMessage.fromXml($result);
  }

  Future<OptionGroupOptionsMessage> describeOptionGroupOptions({
    required String engineName,
    String? majorEngineVersion,
    String? marker,
    int? maxRecords,
  }) async {
    ArgumentError.checkNotNull(engineName, 'engineName');
    final $request = <String, dynamic>{};
    $request['EngineName'] = engineName;
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOptionGroupOptions',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOptionGroupOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOptionGroupOptionsResult',
    );
    return OptionGroupOptionsMessage.fromXml($result);
  }

  ///
  /// May throw [OptionGroupNotFoundFault].
  Future<OptionGroups> describeOptionGroups({
    String? engineName,
    String? majorEngineVersion,
    String? marker,
    int? maxRecords,
    String? optionGroupName,
  }) async {
    final $request = <String, dynamic>{};
    engineName?.also((arg) => $request['EngineName'] = arg);
    majorEngineVersion?.also((arg) => $request['MajorEngineVersion'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOptionGroups',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOptionGroupsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOptionGroupsResult',
    );
    return OptionGroups.fromXml($result);
  }

  Future<OrderableDBInstanceOptionsMessage> describeOrderableDBInstanceOptions({
    required String engine,
    String? dBInstanceClass,
    String? engineVersion,
    String? licenseModel,
    String? marker,
    int? maxRecords,
    bool? vpc,
  }) async {
    ArgumentError.checkNotNull(engine, 'engine');
    final $request = <String, dynamic>{};
    $request['Engine'] = engine;
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    vpc?.also((arg) => $request['Vpc'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOrderableDBInstanceOptions',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeOrderableDBInstanceOptionsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeOrderableDBInstanceOptionsResult',
    );
    return OrderableDBInstanceOptionsMessage.fromXml($result);
  }

  ///
  /// May throw [ReservedDBInstanceNotFoundFault].
  Future<ReservedDBInstanceMessage> describeReservedDBInstances({
    String? dBInstanceClass,
    String? duration,
    String? marker,
    int? maxRecords,
    bool? multiAZ,
    String? offeringType,
    String? productDescription,
    String? reservedDBInstanceId,
    String? reservedDBInstancesOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedDBInstanceId?.also((arg) => $request['ReservedDBInstanceId'] = arg);
    reservedDBInstancesOfferingId
        ?.also((arg) => $request['ReservedDBInstancesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedDBInstances',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedDBInstancesMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedDBInstancesResult',
    );
    return ReservedDBInstanceMessage.fromXml($result);
  }

  ///
  /// May throw [ReservedDBInstancesOfferingNotFoundFault].
  Future<ReservedDBInstancesOfferingMessage>
      describeReservedDBInstancesOfferings({
    String? dBInstanceClass,
    String? duration,
    String? marker,
    int? maxRecords,
    bool? multiAZ,
    String? offeringType,
    String? productDescription,
    String? reservedDBInstancesOfferingId,
  }) async {
    final $request = <String, dynamic>{};
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    duration?.also((arg) => $request['Duration'] = arg);
    marker?.also((arg) => $request['Marker'] = arg);
    maxRecords?.also((arg) => $request['MaxRecords'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    offeringType?.also((arg) => $request['OfferingType'] = arg);
    productDescription?.also((arg) => $request['ProductDescription'] = arg);
    reservedDBInstancesOfferingId
        ?.also((arg) => $request['ReservedDBInstancesOfferingId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedDBInstancesOfferings',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['DescribeReservedDBInstancesOfferingsMessage'],
      shapes: shapes,
      resultWrapper: 'DescribeReservedDBInstancesOfferingsResult',
    );
    return ReservedDBInstancesOfferingMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<TagListMessage> listTagsForResource({
    required String resourceName,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ListTagsForResourceMessage'],
      shapes: shapes,
      resultWrapper: 'ListTagsForResourceResult',
    );
    return TagListMessage.fromXml($result);
  }

  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  /// May throw [DBUpgradeDependencyFailureFault].
  Future<ModifyDBInstanceResult> modifyDBInstance({
    required String dBInstanceIdentifier,
    int? allocatedStorage,
    bool? allowMajorVersionUpgrade,
    bool? applyImmediately,
    bool? autoMinorVersionUpgrade,
    int? backupRetentionPeriod,
    String? dBInstanceClass,
    String? dBParameterGroupName,
    List<String>? dBSecurityGroups,
    String? engineVersion,
    int? iops,
    String? masterUserPassword,
    bool? multiAZ,
    String? newDBInstanceIdentifier,
    String? optionGroupName,
    String? preferredBackupWindow,
    String? preferredMaintenanceWindow,
    List<String>? vpcSecurityGroupIds,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    allocatedStorage?.also((arg) => $request['AllocatedStorage'] = arg);
    allowMajorVersionUpgrade
        ?.also((arg) => $request['AllowMajorVersionUpgrade'] = arg);
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBParameterGroupName?.also((arg) => $request['DBParameterGroupName'] = arg);
    dBSecurityGroups?.also((arg) => $request['DBSecurityGroups'] = arg);
    engineVersion?.also((arg) => $request['EngineVersion'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    masterUserPassword?.also((arg) => $request['MasterUserPassword'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    newDBInstanceIdentifier
        ?.also((arg) => $request['NewDBInstanceIdentifier'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    preferredMaintenanceWindow
        ?.also((arg) => $request['PreferredMaintenanceWindow'] = arg);
    vpcSecurityGroupIds?.also((arg) => $request['VpcSecurityGroupIds'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBInstance',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBInstanceResult',
    );
    return ModifyDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  /// May throw [InvalidDBParameterGroupStateFault].
  Future<DBParameterGroupNameMessage> modifyDBParameterGroup({
    required String dBParameterGroupName,
    required List<Parameter> parameters,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    ArgumentError.checkNotNull(parameters, 'parameters');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    $request['Parameters'] = parameters;
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBParameterGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  ///
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetQuotaExceededFault].
  /// May throw [SubnetAlreadyInUse].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  Future<ModifyDBSubnetGroupResult> modifyDBSubnetGroup({
    required String dBSubnetGroupName,
    required List<String> subnetIds,
    String? dBSubnetGroupDescription,
  }) async {
    ArgumentError.checkNotNull(dBSubnetGroupName, 'dBSubnetGroupName');
    ArgumentError.checkNotNull(subnetIds, 'subnetIds');
    final $request = <String, dynamic>{};
    $request['DBSubnetGroupName'] = dBSubnetGroupName;
    $request['SubnetIds'] = subnetIds;
    dBSubnetGroupDescription
        ?.also((arg) => $request['DBSubnetGroupDescription'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBSubnetGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyDBSubnetGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyDBSubnetGroupResult',
    );
    return ModifyDBSubnetGroupResult.fromXml($result);
  }

  ///
  /// May throw [EventSubscriptionQuotaExceededFault].
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SNSInvalidTopicFault].
  /// May throw [SNSNoAuthorizationFault].
  /// May throw [SNSTopicArnNotFoundFault].
  /// May throw [SubscriptionCategoryNotFoundFault].
  Future<ModifyEventSubscriptionResult> modifyEventSubscription({
    required String subscriptionName,
    bool? enabled,
    List<String>? eventCategories,
    String? snsTopicArn,
    String? sourceType,
  }) async {
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SubscriptionName'] = subscriptionName;
    enabled?.also((arg) => $request['Enabled'] = arg);
    eventCategories?.also((arg) => $request['EventCategories'] = arg);
    snsTopicArn?.also((arg) => $request['SnsTopicArn'] = arg);
    sourceType?.also((arg) => $request['SourceType'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyEventSubscription',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyEventSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyEventSubscriptionResult',
    );
    return ModifyEventSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [InvalidOptionGroupStateFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<ModifyOptionGroupResult> modifyOptionGroup({
    required String optionGroupName,
    bool? applyImmediately,
    List<OptionConfiguration>? optionsToInclude,
    List<String>? optionsToRemove,
  }) async {
    ArgumentError.checkNotNull(optionGroupName, 'optionGroupName');
    final $request = <String, dynamic>{};
    $request['OptionGroupName'] = optionGroupName;
    applyImmediately?.also((arg) => $request['ApplyImmediately'] = arg);
    optionsToInclude?.also((arg) => $request['OptionsToInclude'] = arg);
    optionsToRemove?.also((arg) => $request['OptionsToRemove'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ModifyOptionGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ModifyOptionGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ModifyOptionGroupResult',
    );
    return ModifyOptionGroupResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  Future<PromoteReadReplicaResult> promoteReadReplica({
    required String dBInstanceIdentifier,
    int? backupRetentionPeriod,
    String? preferredBackupWindow,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    backupRetentionPeriod
        ?.also((arg) => $request['BackupRetentionPeriod'] = arg);
    preferredBackupWindow
        ?.also((arg) => $request['PreferredBackupWindow'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PromoteReadReplica',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PromoteReadReplicaMessage'],
      shapes: shapes,
      resultWrapper: 'PromoteReadReplicaResult',
    );
    return PromoteReadReplicaResult.fromXml($result);
  }

  ///
  /// May throw [ReservedDBInstancesOfferingNotFoundFault].
  /// May throw [ReservedDBInstanceAlreadyExistsFault].
  /// May throw [ReservedDBInstanceQuotaExceededFault].
  Future<PurchaseReservedDBInstancesOfferingResult>
      purchaseReservedDBInstancesOffering({
    required String reservedDBInstancesOfferingId,
    int? dBInstanceCount,
    String? reservedDBInstanceId,
  }) async {
    ArgumentError.checkNotNull(
        reservedDBInstancesOfferingId, 'reservedDBInstancesOfferingId');
    final $request = <String, dynamic>{};
    $request['ReservedDBInstancesOfferingId'] = reservedDBInstancesOfferingId;
    dBInstanceCount?.also((arg) => $request['DBInstanceCount'] = arg);
    reservedDBInstanceId?.also((arg) => $request['ReservedDBInstanceId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'PurchaseReservedDBInstancesOffering',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['PurchaseReservedDBInstancesOfferingMessage'],
      shapes: shapes,
      resultWrapper: 'PurchaseReservedDBInstancesOfferingResult',
    );
    return PurchaseReservedDBInstancesOfferingResult.fromXml($result);
  }

  ///
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [DBInstanceNotFoundFault].
  Future<RebootDBInstanceResult> rebootDBInstance({
    required String dBInstanceIdentifier,
    bool? forceFailover,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    forceFailover?.also((arg) => $request['ForceFailover'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RebootDBInstance',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RebootDBInstanceMessage'],
      shapes: shapes,
      resultWrapper: 'RebootDBInstanceResult',
    );
    return RebootDBInstanceResult.fromXml($result);
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<RemoveSourceIdentifierFromSubscriptionResult>
      removeSourceIdentifierFromSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    ArgumentError.checkNotNull(sourceIdentifier, 'sourceIdentifier');
    ArgumentError.checkNotNull(subscriptionName, 'subscriptionName');
    final $request = <String, dynamic>{};
    $request['SourceIdentifier'] = sourceIdentifier;
    $request['SubscriptionName'] = subscriptionName;
    final $result = await _protocol.send(
      $request,
      action: 'RemoveSourceIdentifierFromSubscription',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveSourceIdentifierFromSubscriptionMessage'],
      shapes: shapes,
      resultWrapper: 'RemoveSourceIdentifierFromSubscriptionResult',
    );
    return RemoveSourceIdentifierFromSubscriptionResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<void> removeTagsFromResource({
    required String resourceName,
    required List<String> tagKeys,
  }) async {
    ArgumentError.checkNotNull(resourceName, 'resourceName');
    ArgumentError.checkNotNull(tagKeys, 'tagKeys');
    final $request = <String, dynamic>{};
    $request['ResourceName'] = resourceName;
    $request['TagKeys'] = tagKeys;
    await _protocol.send(
      $request,
      action: 'RemoveTagsFromResource',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RemoveTagsFromResourceMessage'],
      shapes: shapes,
    );
  }

  ///
  /// May throw [InvalidDBParameterGroupStateFault].
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupNameMessage> resetDBParameterGroup({
    required String dBParameterGroupName,
    List<Parameter>? parameters,
    bool? resetAllParameters,
  }) async {
    ArgumentError.checkNotNull(dBParameterGroupName, 'dBParameterGroupName');
    final $request = <String, dynamic>{};
    $request['DBParameterGroupName'] = dBParameterGroupName;
    parameters?.also((arg) => $request['Parameters'] = arg);
    resetAllParameters?.also((arg) => $request['ResetAllParameters'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'ResetDBParameterGroup',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['ResetDBParameterGroupMessage'],
      shapes: shapes,
      resultWrapper: 'ResetDBParameterGroupResult',
    );
    return DBParameterGroupNameMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBSnapshotNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<RestoreDBInstanceFromDBSnapshotResult>
      restoreDBInstanceFromDBSnapshot({
    required String dBInstanceIdentifier,
    required String dBSnapshotIdentifier,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    String? dBInstanceClass,
    String? dBName,
    String? dBSubnetGroupName,
    String? engine,
    int? iops,
    String? licenseModel,
    bool? multiAZ,
    String? optionGroupName,
    int? port,
    bool? publiclyAccessible,
  }) async {
    ArgumentError.checkNotNull(dBInstanceIdentifier, 'dBInstanceIdentifier');
    ArgumentError.checkNotNull(dBSnapshotIdentifier, 'dBSnapshotIdentifier');
    final $request = <String, dynamic>{};
    $request['DBInstanceIdentifier'] = dBInstanceIdentifier;
    $request['DBSnapshotIdentifier'] = dBSnapshotIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceFromDBSnapshot',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBInstanceFromDBSnapshotMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBInstanceFromDBSnapshotResult',
    );
    return RestoreDBInstanceFromDBSnapshotResult.fromXml($result);
  }

  ///
  /// May throw [DBInstanceAlreadyExistsFault].
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [InstanceQuotaExceededFault].
  /// May throw [InsufficientDBInstanceCapacityFault].
  /// May throw [InvalidDBInstanceStateFault].
  /// May throw [PointInTimeRestoreNotEnabledFault].
  /// May throw [StorageQuotaExceededFault].
  /// May throw [InvalidVPCNetworkStateFault].
  /// May throw [InvalidRestoreFault].
  /// May throw [DBSubnetGroupNotFoundFault].
  /// May throw [DBSubnetGroupDoesNotCoverEnoughAZs].
  /// May throw [InvalidSubnet].
  /// May throw [ProvisionedIopsNotAvailableInAZFault].
  /// May throw [OptionGroupNotFoundFault].
  Future<RestoreDBInstanceToPointInTimeResult> restoreDBInstanceToPointInTime({
    required String sourceDBInstanceIdentifier,
    required String targetDBInstanceIdentifier,
    bool? autoMinorVersionUpgrade,
    String? availabilityZone,
    String? dBInstanceClass,
    String? dBName,
    String? dBSubnetGroupName,
    String? engine,
    int? iops,
    String? licenseModel,
    bool? multiAZ,
    String? optionGroupName,
    int? port,
    bool? publiclyAccessible,
    DateTime? restoreTime,
    bool? useLatestRestorableTime,
  }) async {
    ArgumentError.checkNotNull(
        sourceDBInstanceIdentifier, 'sourceDBInstanceIdentifier');
    ArgumentError.checkNotNull(
        targetDBInstanceIdentifier, 'targetDBInstanceIdentifier');
    final $request = <String, dynamic>{};
    $request['SourceDBInstanceIdentifier'] = sourceDBInstanceIdentifier;
    $request['TargetDBInstanceIdentifier'] = targetDBInstanceIdentifier;
    autoMinorVersionUpgrade
        ?.also((arg) => $request['AutoMinorVersionUpgrade'] = arg);
    availabilityZone?.also((arg) => $request['AvailabilityZone'] = arg);
    dBInstanceClass?.also((arg) => $request['DBInstanceClass'] = arg);
    dBName?.also((arg) => $request['DBName'] = arg);
    dBSubnetGroupName?.also((arg) => $request['DBSubnetGroupName'] = arg);
    engine?.also((arg) => $request['Engine'] = arg);
    iops?.also((arg) => $request['Iops'] = arg);
    licenseModel?.also((arg) => $request['LicenseModel'] = arg);
    multiAZ?.also((arg) => $request['MultiAZ'] = arg);
    optionGroupName?.also((arg) => $request['OptionGroupName'] = arg);
    port?.also((arg) => $request['Port'] = arg);
    publiclyAccessible?.also((arg) => $request['PubliclyAccessible'] = arg);
    restoreTime?.also((arg) => $request['RestoreTime'] = _s.iso8601ToJson(arg));
    useLatestRestorableTime
        ?.also((arg) => $request['UseLatestRestorableTime'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceToPointInTime',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RestoreDBInstanceToPointInTimeMessage'],
      shapes: shapes,
      resultWrapper: 'RestoreDBInstanceToPointInTimeResult',
    );
    return RestoreDBInstanceToPointInTimeResult.fromXml($result);
  }

  ///
  /// May throw [DBSecurityGroupNotFoundFault].
  /// May throw [AuthorizationNotFoundFault].
  /// May throw [InvalidDBSecurityGroupStateFault].
  Future<RevokeDBSecurityGroupIngressResult> revokeDBSecurityGroupIngress({
    required String dBSecurityGroupName,
    String? cidrip,
    String? eC2SecurityGroupId,
    String? eC2SecurityGroupName,
    String? eC2SecurityGroupOwnerId,
  }) async {
    ArgumentError.checkNotNull(dBSecurityGroupName, 'dBSecurityGroupName');
    final $request = <String, dynamic>{};
    $request['DBSecurityGroupName'] = dBSecurityGroupName;
    cidrip?.also((arg) => $request['CIDRIP'] = arg);
    eC2SecurityGroupId?.also((arg) => $request['EC2SecurityGroupId'] = arg);
    eC2SecurityGroupName?.also((arg) => $request['EC2SecurityGroupName'] = arg);
    eC2SecurityGroupOwnerId
        ?.also((arg) => $request['EC2SecurityGroupOwnerId'] = arg);
    final $result = await _protocol.send(
      $request,
      action: 'RevokeDBSecurityGroupIngress',
      version: '2013-01-10',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      shape: shapes['RevokeDBSecurityGroupIngressMessage'],
      shapes: shapes,
      resultWrapper: 'RevokeDBSecurityGroupIngressResult',
    );
    return RevokeDBSecurityGroupIngressResult.fromXml($result);
  }
}

class AddSourceIdentifierToSubscriptionResult {
  final EventSubscription? eventSubscription;

  AddSourceIdentifierToSubscriptionResult({
    this.eventSubscription,
  });

  factory AddSourceIdentifierToSubscriptionResult.fromJson(
      Map<String, dynamic> json) {
    return AddSourceIdentifierToSubscriptionResult(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  factory AddSourceIdentifierToSubscriptionResult.fromXml(_s.XmlElement elem) {
    return AddSourceIdentifierToSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

enum ApplyMethod {
  immediate,
  pendingReboot,
}

extension on ApplyMethod {
  String toValue() {
    switch (this) {
      case ApplyMethod.immediate:
        return 'immediate';
      case ApplyMethod.pendingReboot:
        return 'pending-reboot';
    }
  }
}

extension on String {
  ApplyMethod toApplyMethod() {
    switch (this) {
      case 'immediate':
        return ApplyMethod.immediate;
      case 'pending-reboot':
        return ApplyMethod.pendingReboot;
    }
    throw Exception('$this is not known in enum ApplyMethod');
  }
}

class AuthorizeDBSecurityGroupIngressResult {
  final DBSecurityGroup? dBSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });

  factory AuthorizeDBSecurityGroupIngressResult.fromJson(
      Map<String, dynamic> json) {
    return AuthorizeDBSecurityGroupIngressResult(
      dBSecurityGroup: json['DBSecurityGroup'] != null
          ? DBSecurityGroup.fromJson(
              json['DBSecurityGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory AuthorizeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return AuthorizeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroup = this.dBSecurityGroup;
    return {
      if (dBSecurityGroup != null) 'DBSecurityGroup': dBSecurityGroup,
    };
  }
}

class AvailabilityZone {
  final String? name;
  final bool? provisionedIopsCapable;

  AvailabilityZone({
    this.name,
    this.provisionedIopsCapable,
  });

  factory AvailabilityZone.fromJson(Map<String, dynamic> json) {
    return AvailabilityZone(
      name: json['Name'] as String?,
      provisionedIopsCapable: json['ProvisionedIopsCapable'] as bool?,
    );
  }

  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
      provisionedIopsCapable:
          _s.extractXmlBoolValue(elem, 'ProvisionedIopsCapable'),
    );
  }

  Map<String, dynamic> toJson() {
    final name = this.name;
    final provisionedIopsCapable = this.provisionedIopsCapable;
    return {
      if (name != null) 'Name': name,
      if (provisionedIopsCapable != null)
        'ProvisionedIopsCapable': provisionedIopsCapable,
    };
  }
}

class CharacterSet {
  final String? characterSetDescription;
  final String? characterSetName;

  CharacterSet({
    this.characterSetDescription,
    this.characterSetName,
  });

  factory CharacterSet.fromJson(Map<String, dynamic> json) {
    return CharacterSet(
      characterSetDescription: json['CharacterSetDescription'] as String?,
      characterSetName: json['CharacterSetName'] as String?,
    );
  }

  factory CharacterSet.fromXml(_s.XmlElement elem) {
    return CharacterSet(
      characterSetDescription:
          _s.extractXmlStringValue(elem, 'CharacterSetDescription'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
    );
  }

  Map<String, dynamic> toJson() {
    final characterSetDescription = this.characterSetDescription;
    final characterSetName = this.characterSetName;
    return {
      if (characterSetDescription != null)
        'CharacterSetDescription': characterSetDescription,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
    };
  }
}

class CopyDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  CopyDBSnapshotResult({
    this.dBSnapshot,
  });

  factory CopyDBSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CopyDBSnapshotResult(
      dBSnapshot: json['DBSnapshot'] != null
          ? DBSnapshot.fromJson(json['DBSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CopyDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSnapshot = this.dBSnapshot;
    return {
      if (dBSnapshot != null) 'DBSnapshot': dBSnapshot,
    };
  }
}

class CreateDBInstanceReadReplicaResult {
  final DBInstance? dBInstance;

  CreateDBInstanceReadReplicaResult({
    this.dBInstance,
  });

  factory CreateDBInstanceReadReplicaResult.fromJson(
      Map<String, dynamic> json) {
    return CreateDBInstanceReadReplicaResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateDBInstanceReadReplicaResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceReadReplicaResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class CreateDBInstanceResult {
  final DBInstance? dBInstance;

  CreateDBInstanceResult({
    this.dBInstance,
  });

  factory CreateDBInstanceResult.fromJson(Map<String, dynamic> json) {
    return CreateDBInstanceResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateDBInstanceResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class CreateDBParameterGroupResult {
  final DBParameterGroup? dBParameterGroup;

  CreateDBParameterGroupResult({
    this.dBParameterGroup,
  });

  factory CreateDBParameterGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateDBParameterGroupResult(
      dBParameterGroup: json['DBParameterGroup'] != null
          ? DBParameterGroup.fromJson(
              json['DBParameterGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let((e) => DBParameterGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroup = this.dBParameterGroup;
    return {
      if (dBParameterGroup != null) 'DBParameterGroup': dBParameterGroup,
    };
  }
}

class CreateDBSecurityGroupResult {
  final DBSecurityGroup? dBSecurityGroup;

  CreateDBSecurityGroupResult({
    this.dBSecurityGroup,
  });

  factory CreateDBSecurityGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateDBSecurityGroupResult(
      dBSecurityGroup: json['DBSecurityGroup'] != null
          ? DBSecurityGroup.fromJson(
              json['DBSecurityGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateDBSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSecurityGroupResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroup = this.dBSecurityGroup;
    return {
      if (dBSecurityGroup != null) 'DBSecurityGroup': dBSecurityGroup,
    };
  }
}

class CreateDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  CreateDBSnapshotResult({
    this.dBSnapshot,
  });

  factory CreateDBSnapshotResult.fromJson(Map<String, dynamic> json) {
    return CreateDBSnapshotResult(
      dBSnapshot: json['DBSnapshot'] != null
          ? DBSnapshot.fromJson(json['DBSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSnapshot = this.dBSnapshot;
    return {
      if (dBSnapshot != null) 'DBSnapshot': dBSnapshot,
    };
  }
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup? dBSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dBSubnetGroup,
  });

  factory CreateDBSubnetGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateDBSubnetGroupResult(
      dBSubnetGroup: json['DBSubnetGroup'] != null
          ? DBSubnetGroup.fromJson(
              json['DBSubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSubnetGroup = this.dBSubnetGroup;
    return {
      if (dBSubnetGroup != null) 'DBSubnetGroup': dBSubnetGroup,
    };
  }
}

class CreateEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });

  factory CreateEventSubscriptionResult.fromJson(Map<String, dynamic> json) {
    return CreateEventSubscriptionResult(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class CreateOptionGroupResult {
  final OptionGroup? optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });

  factory CreateOptionGroupResult.fromJson(Map<String, dynamic> json) {
    return CreateOptionGroupResult(
      optionGroup: json['OptionGroup'] != null
          ? OptionGroup.fromJson(json['OptionGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory CreateOptionGroupResult.fromXml(_s.XmlElement elem) {
    return CreateOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final optionGroup = this.optionGroup;
    return {
      if (optionGroup != null) 'OptionGroup': optionGroup,
    };
  }
}

class DBEngineVersion {
  final String? dBEngineDescription;
  final String? dBEngineVersionDescription;
  final String? dBParameterGroupFamily;
  final CharacterSet? defaultCharacterSet;
  final String? engine;
  final String? engineVersion;
  final List<CharacterSet>? supportedCharacterSets;

  DBEngineVersion({
    this.dBEngineDescription,
    this.dBEngineVersionDescription,
    this.dBParameterGroupFamily,
    this.defaultCharacterSet,
    this.engine,
    this.engineVersion,
    this.supportedCharacterSets,
  });

  factory DBEngineVersion.fromJson(Map<String, dynamic> json) {
    return DBEngineVersion(
      dBEngineDescription: json['DBEngineDescription'] as String?,
      dBEngineVersionDescription: json['DBEngineVersionDescription'] as String?,
      dBParameterGroupFamily: json['DBParameterGroupFamily'] as String?,
      defaultCharacterSet: json['DefaultCharacterSet'] != null
          ? CharacterSet.fromJson(
              json['DefaultCharacterSet'] as Map<String, dynamic>)
          : null,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      supportedCharacterSets: (json['SupportedCharacterSets'] as List?)
          ?.whereNotNull()
          .map((e) => CharacterSet.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory DBEngineVersion.fromXml(_s.XmlElement elem) {
    return DBEngineVersion(
      dBEngineDescription:
          _s.extractXmlStringValue(elem, 'DBEngineDescription'),
      dBEngineVersionDescription:
          _s.extractXmlStringValue(elem, 'DBEngineVersionDescription'),
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      defaultCharacterSet: _s
          .extractXmlChild(elem, 'DefaultCharacterSet')
          ?.let((e) => CharacterSet.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      supportedCharacterSets: _s
          .extractXmlChild(elem, 'SupportedCharacterSets')
          ?.let((elem) => elem
              .findElements('CharacterSet')
              .map((c) => CharacterSet.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final dBEngineDescription = this.dBEngineDescription;
    final dBEngineVersionDescription = this.dBEngineVersionDescription;
    final dBParameterGroupFamily = this.dBParameterGroupFamily;
    final defaultCharacterSet = this.defaultCharacterSet;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final supportedCharacterSets = this.supportedCharacterSets;
    return {
      if (dBEngineDescription != null)
        'DBEngineDescription': dBEngineDescription,
      if (dBEngineVersionDescription != null)
        'DBEngineVersionDescription': dBEngineVersionDescription,
      if (dBParameterGroupFamily != null)
        'DBParameterGroupFamily': dBParameterGroupFamily,
      if (defaultCharacterSet != null)
        'DefaultCharacterSet': defaultCharacterSet,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (supportedCharacterSets != null)
        'SupportedCharacterSets': supportedCharacterSets,
    };
  }
}

class DBEngineVersionMessage {
  final List<DBEngineVersion>? dBEngineVersions;
  final String? marker;

  DBEngineVersionMessage({
    this.dBEngineVersions,
    this.marker,
  });

  factory DBEngineVersionMessage.fromJson(Map<String, dynamic> json) {
    return DBEngineVersionMessage(
      dBEngineVersions: (json['DBEngineVersions'] as List?)
          ?.whereNotNull()
          .map((e) => DBEngineVersion.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory DBEngineVersionMessage.fromXml(_s.XmlElement elem) {
    return DBEngineVersionMessage(
      dBEngineVersions: _s.extractXmlChild(elem, 'DBEngineVersions')?.let(
          (elem) => elem
              .findElements('DBEngineVersion')
              .map((c) => DBEngineVersion.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBEngineVersions = this.dBEngineVersions;
    final marker = this.marker;
    return {
      if (dBEngineVersions != null) 'DBEngineVersions': dBEngineVersions,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DBInstance {
  final int? allocatedStorage;
  final bool? autoMinorVersionUpgrade;
  final String? availabilityZone;
  final int? backupRetentionPeriod;
  final String? characterSetName;
  final String? dBInstanceClass;
  final String? dBInstanceIdentifier;
  final String? dBInstanceStatus;
  final String? dBName;
  final List<DBParameterGroupStatus>? dBParameterGroups;
  final List<DBSecurityGroupMembership>? dBSecurityGroups;
  final DBSubnetGroup? dBSubnetGroup;
  final Endpoint? endpoint;
  final String? engine;
  final String? engineVersion;
  final DateTime? instanceCreateTime;
  final int? iops;
  final DateTime? latestRestorableTime;
  final String? licenseModel;
  final String? masterUsername;
  final bool? multiAZ;
  final OptionGroupMembership? optionGroupMembership;
  final PendingModifiedValues? pendingModifiedValues;
  final String? preferredBackupWindow;
  final String? preferredMaintenanceWindow;
  final bool? publiclyAccessible;
  final List<String>? readReplicaDBInstanceIdentifiers;
  final String? readReplicaSourceDBInstanceIdentifier;
  final String? secondaryAvailabilityZone;
  final List<VpcSecurityGroupMembership>? vpcSecurityGroups;

  DBInstance({
    this.allocatedStorage,
    this.autoMinorVersionUpgrade,
    this.availabilityZone,
    this.backupRetentionPeriod,
    this.characterSetName,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.dBInstanceStatus,
    this.dBName,
    this.dBParameterGroups,
    this.dBSecurityGroups,
    this.dBSubnetGroup,
    this.endpoint,
    this.engine,
    this.engineVersion,
    this.instanceCreateTime,
    this.iops,
    this.latestRestorableTime,
    this.licenseModel,
    this.masterUsername,
    this.multiAZ,
    this.optionGroupMembership,
    this.pendingModifiedValues,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaSourceDBInstanceIdentifier,
    this.secondaryAvailabilityZone,
    this.vpcSecurityGroups,
  });

  factory DBInstance.fromJson(Map<String, dynamic> json) {
    return DBInstance(
      allocatedStorage: json['AllocatedStorage'] as int?,
      autoMinorVersionUpgrade: json['AutoMinorVersionUpgrade'] as bool?,
      availabilityZone: json['AvailabilityZone'] as String?,
      backupRetentionPeriod: json['BackupRetentionPeriod'] as int?,
      characterSetName: json['CharacterSetName'] as String?,
      dBInstanceClass: json['DBInstanceClass'] as String?,
      dBInstanceIdentifier: json['DBInstanceIdentifier'] as String?,
      dBInstanceStatus: json['DBInstanceStatus'] as String?,
      dBName: json['DBName'] as String?,
      dBParameterGroups: (json['DBParameterGroups'] as List?)
          ?.whereNotNull()
          .map(
              (e) => DBParameterGroupStatus.fromJson(e as Map<String, dynamic>))
          .toList(),
      dBSecurityGroups: (json['DBSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DBSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      dBSubnetGroup: json['DBSubnetGroup'] != null
          ? DBSubnetGroup.fromJson(
              json['DBSubnetGroup'] as Map<String, dynamic>)
          : null,
      endpoint: json['Endpoint'] != null
          ? Endpoint.fromJson(json['Endpoint'] as Map<String, dynamic>)
          : null,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      instanceCreateTime: timeStampFromJson(json['InstanceCreateTime']),
      iops: json['Iops'] as int?,
      latestRestorableTime: timeStampFromJson(json['LatestRestorableTime']),
      licenseModel: json['LicenseModel'] as String?,
      masterUsername: json['MasterUsername'] as String?,
      multiAZ: json['MultiAZ'] as bool?,
      optionGroupMembership: json['OptionGroupMembership'] != null
          ? OptionGroupMembership.fromJson(
              json['OptionGroupMembership'] as Map<String, dynamic>)
          : null,
      pendingModifiedValues: json['PendingModifiedValues'] != null
          ? PendingModifiedValues.fromJson(
              json['PendingModifiedValues'] as Map<String, dynamic>)
          : null,
      preferredBackupWindow: json['PreferredBackupWindow'] as String?,
      preferredMaintenanceWindow: json['PreferredMaintenanceWindow'] as String?,
      publiclyAccessible: json['PubliclyAccessible'] as bool?,
      readReplicaDBInstanceIdentifiers:
          (json['ReadReplicaDBInstanceIdentifiers'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
      readReplicaSourceDBInstanceIdentifier:
          json['ReadReplicaSourceDBInstanceIdentifier'] as String?,
      secondaryAvailabilityZone: json['SecondaryAvailabilityZone'] as String?,
      vpcSecurityGroups: (json['VpcSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) =>
              VpcSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory DBInstance.fromXml(_s.XmlElement elem) {
    return DBInstance(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      autoMinorVersionUpgrade:
          _s.extractXmlBoolValue(elem, 'AutoMinorVersionUpgrade'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBInstanceStatus: _s.extractXmlStringValue(elem, 'DBInstanceStatus'),
      dBName: _s.extractXmlStringValue(elem, 'DBName'),
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map((c) => DBParameterGroupStatus.fromXml(c))
              .toList()),
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroupMembership.fromXml(c))
              .toList()),
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
      endpoint:
          _s.extractXmlChild(elem, 'Endpoint')?.let((e) => Endpoint.fromXml(e)),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      latestRestorableTime:
          _s.extractXmlDateTimeValue(elem, 'LatestRestorableTime'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      optionGroupMembership: _s
          .extractXmlChild(elem, 'OptionGroupMembership')
          ?.let((e) => OptionGroupMembership.fromXml(e)),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let((e) => PendingModifiedValues.fromXml(e)),
      preferredBackupWindow:
          _s.extractXmlStringValue(elem, 'PreferredBackupWindow'),
      preferredMaintenanceWindow:
          _s.extractXmlStringValue(elem, 'PreferredMaintenanceWindow'),
      publiclyAccessible: _s.extractXmlBoolValue(elem, 'PubliclyAccessible'),
      readReplicaDBInstanceIdentifiers: _s
          .extractXmlChild(elem, 'ReadReplicaDBInstanceIdentifiers')
          ?.let((elem) => _s.extractXmlStringListValues(
              elem, 'ReadReplicaDBInstanceIdentifier')),
      readReplicaSourceDBInstanceIdentifier: _s.extractXmlStringValue(
          elem, 'ReadReplicaSourceDBInstanceIdentifier'),
      secondaryAvailabilityZone:
          _s.extractXmlStringValue(elem, 'SecondaryAvailabilityZone'),
      vpcSecurityGroups: _s.extractXmlChild(elem, 'VpcSecurityGroups')?.let(
          (elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final autoMinorVersionUpgrade = this.autoMinorVersionUpgrade;
    final availabilityZone = this.availabilityZone;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final characterSetName = this.characterSetName;
    final dBInstanceClass = this.dBInstanceClass;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final dBInstanceStatus = this.dBInstanceStatus;
    final dBName = this.dBName;
    final dBParameterGroups = this.dBParameterGroups;
    final dBSecurityGroups = this.dBSecurityGroups;
    final dBSubnetGroup = this.dBSubnetGroup;
    final endpoint = this.endpoint;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final instanceCreateTime = this.instanceCreateTime;
    final iops = this.iops;
    final latestRestorableTime = this.latestRestorableTime;
    final licenseModel = this.licenseModel;
    final masterUsername = this.masterUsername;
    final multiAZ = this.multiAZ;
    final optionGroupMembership = this.optionGroupMembership;
    final pendingModifiedValues = this.pendingModifiedValues;
    final preferredBackupWindow = this.preferredBackupWindow;
    final preferredMaintenanceWindow = this.preferredMaintenanceWindow;
    final publiclyAccessible = this.publiclyAccessible;
    final readReplicaDBInstanceIdentifiers =
        this.readReplicaDBInstanceIdentifiers;
    final readReplicaSourceDBInstanceIdentifier =
        this.readReplicaSourceDBInstanceIdentifier;
    final secondaryAvailabilityZone = this.secondaryAvailabilityZone;
    final vpcSecurityGroups = this.vpcSecurityGroups;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (dBInstanceStatus != null) 'DBInstanceStatus': dBInstanceStatus,
      if (dBName != null) 'DBName': dBName,
      if (dBParameterGroups != null) 'DBParameterGroups': dBParameterGroups,
      if (dBSecurityGroups != null) 'DBSecurityGroups': dBSecurityGroups,
      if (dBSubnetGroup != null) 'DBSubnetGroup': dBSubnetGroup,
      if (endpoint != null) 'Endpoint': endpoint,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (instanceCreateTime != null)
        'InstanceCreateTime': unixTimestampToJson(instanceCreateTime),
      if (iops != null) 'Iops': iops,
      if (latestRestorableTime != null)
        'LatestRestorableTime': unixTimestampToJson(latestRestorableTime),
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (optionGroupMembership != null)
        'OptionGroupMembership': optionGroupMembership,
      if (pendingModifiedValues != null)
        'PendingModifiedValues': pendingModifiedValues,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null) 'PubliclyAccessible': publiclyAccessible,
      if (readReplicaDBInstanceIdentifiers != null)
        'ReadReplicaDBInstanceIdentifiers': readReplicaDBInstanceIdentifiers,
      if (readReplicaSourceDBInstanceIdentifier != null)
        'ReadReplicaSourceDBInstanceIdentifier':
            readReplicaSourceDBInstanceIdentifier,
      if (secondaryAvailabilityZone != null)
        'SecondaryAvailabilityZone': secondaryAvailabilityZone,
      if (vpcSecurityGroups != null) 'VpcSecurityGroups': vpcSecurityGroups,
    };
  }
}

class DBInstanceMessage {
  final List<DBInstance>? dBInstances;
  final String? marker;

  DBInstanceMessage({
    this.dBInstances,
    this.marker,
  });

  factory DBInstanceMessage.fromJson(Map<String, dynamic> json) {
    return DBInstanceMessage(
      dBInstances: (json['DBInstances'] as List?)
          ?.whereNotNull()
          .map((e) => DBInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory DBInstanceMessage.fromXml(_s.XmlElement elem) {
    return DBInstanceMessage(
      dBInstances: _s.extractXmlChild(elem, 'DBInstances')?.let((elem) => elem
          .findElements('DBInstance')
          .map((c) => DBInstance.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstances = this.dBInstances;
    final marker = this.marker;
    return {
      if (dBInstances != null) 'DBInstances': dBInstances,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DBParameterGroup {
  final String? dBParameterGroupFamily;
  final String? dBParameterGroupName;
  final String? description;

  DBParameterGroup({
    this.dBParameterGroupFamily,
    this.dBParameterGroupName,
    this.description,
  });

  factory DBParameterGroup.fromJson(Map<String, dynamic> json) {
    return DBParameterGroup(
      dBParameterGroupFamily: json['DBParameterGroupFamily'] as String?,
      dBParameterGroupName: json['DBParameterGroupName'] as String?,
      description: json['Description'] as String?,
    );
  }

  factory DBParameterGroup.fromXml(_s.XmlElement elem) {
    return DBParameterGroup(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroupFamily = this.dBParameterGroupFamily;
    final dBParameterGroupName = this.dBParameterGroupName;
    final description = this.description;
    return {
      if (dBParameterGroupFamily != null)
        'DBParameterGroupFamily': dBParameterGroupFamily,
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
      if (description != null) 'Description': description,
    };
  }
}

class DBParameterGroupDetails {
  final String? marker;
  final List<Parameter>? parameters;

  DBParameterGroupDetails({
    this.marker,
    this.parameters,
  });

  factory DBParameterGroupDetails.fromJson(Map<String, dynamic> json) {
    return DBParameterGroupDetails(
      marker: json['Marker'] as String?,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory DBParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final parameters = this.parameters;
    return {
      if (marker != null) 'Marker': marker,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

class DBParameterGroupNameMessage {
  final String? dBParameterGroupName;

  DBParameterGroupNameMessage({
    this.dBParameterGroupName,
  });

  factory DBParameterGroupNameMessage.fromJson(Map<String, dynamic> json) {
    return DBParameterGroupNameMessage(
      dBParameterGroupName: json['DBParameterGroupName'] as String?,
    );
  }

  factory DBParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupNameMessage(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroupName = this.dBParameterGroupName;
    return {
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
    };
  }
}

class DBParameterGroupStatus {
  final String? dBParameterGroupName;
  final String? parameterApplyStatus;

  DBParameterGroupStatus({
    this.dBParameterGroupName,
    this.parameterApplyStatus,
  });

  factory DBParameterGroupStatus.fromJson(Map<String, dynamic> json) {
    return DBParameterGroupStatus(
      dBParameterGroupName: json['DBParameterGroupName'] as String?,
      parameterApplyStatus: json['ParameterApplyStatus'] as String?,
    );
  }

  factory DBParameterGroupStatus.fromXml(_s.XmlElement elem) {
    return DBParameterGroupStatus(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroupName = this.dBParameterGroupName;
    final parameterApplyStatus = this.parameterApplyStatus;
    return {
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
      if (parameterApplyStatus != null)
        'ParameterApplyStatus': parameterApplyStatus,
    };
  }
}

class DBParameterGroupsMessage {
  final List<DBParameterGroup>? dBParameterGroups;
  final String? marker;

  DBParameterGroupsMessage({
    this.dBParameterGroups,
    this.marker,
  });

  factory DBParameterGroupsMessage.fromJson(Map<String, dynamic> json) {
    return DBParameterGroupsMessage(
      dBParameterGroups: (json['DBParameterGroups'] as List?)
          ?.whereNotNull()
          .map((e) => DBParameterGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory DBParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupsMessage(
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map((c) => DBParameterGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroups = this.dBParameterGroups;
    final marker = this.marker;
    return {
      if (dBParameterGroups != null) 'DBParameterGroups': dBParameterGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DBSecurityGroup {
  final String? dBSecurityGroupDescription;
  final String? dBSecurityGroupName;
  final List<EC2SecurityGroup>? eC2SecurityGroups;
  final List<IPRange>? iPRanges;
  final String? ownerId;
  final String? vpcId;

  DBSecurityGroup({
    this.dBSecurityGroupDescription,
    this.dBSecurityGroupName,
    this.eC2SecurityGroups,
    this.iPRanges,
    this.ownerId,
    this.vpcId,
  });

  factory DBSecurityGroup.fromJson(Map<String, dynamic> json) {
    return DBSecurityGroup(
      dBSecurityGroupDescription: json['DBSecurityGroupDescription'] as String?,
      dBSecurityGroupName: json['DBSecurityGroupName'] as String?,
      eC2SecurityGroups: (json['EC2SecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => EC2SecurityGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      iPRanges: (json['IPRanges'] as List?)
          ?.whereNotNull()
          .map((e) => IPRange.fromJson(e as Map<String, dynamic>))
          .toList(),
      ownerId: json['OwnerId'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  factory DBSecurityGroup.fromXml(_s.XmlElement elem) {
    return DBSecurityGroup(
      dBSecurityGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupDescription'),
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      eC2SecurityGroups: _s.extractXmlChild(elem, 'EC2SecurityGroups')?.let(
          (elem) => elem
              .findElements('EC2SecurityGroup')
              .map((c) => EC2SecurityGroup.fromXml(c))
              .toList()),
      iPRanges: _s.extractXmlChild(elem, 'IPRanges')?.let((elem) =>
          elem.findElements('IPRange').map((c) => IPRange.fromXml(c)).toList()),
      ownerId: _s.extractXmlStringValue(elem, 'OwnerId'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroupDescription = this.dBSecurityGroupDescription;
    final dBSecurityGroupName = this.dBSecurityGroupName;
    final eC2SecurityGroups = this.eC2SecurityGroups;
    final iPRanges = this.iPRanges;
    final ownerId = this.ownerId;
    final vpcId = this.vpcId;
    return {
      if (dBSecurityGroupDescription != null)
        'DBSecurityGroupDescription': dBSecurityGroupDescription,
      if (dBSecurityGroupName != null)
        'DBSecurityGroupName': dBSecurityGroupName,
      if (eC2SecurityGroups != null) 'EC2SecurityGroups': eC2SecurityGroups,
      if (iPRanges != null) 'IPRanges': iPRanges,
      if (ownerId != null) 'OwnerId': ownerId,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class DBSecurityGroupMembership {
  final String? dBSecurityGroupName;
  final String? status;

  DBSecurityGroupMembership({
    this.dBSecurityGroupName,
    this.status,
  });

  factory DBSecurityGroupMembership.fromJson(Map<String, dynamic> json) {
    return DBSecurityGroupMembership(
      dBSecurityGroupName: json['DBSecurityGroupName'] as String?,
      status: json['Status'] as String?,
    );
  }

  factory DBSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMembership(
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroupName = this.dBSecurityGroupName;
    final status = this.status;
    return {
      if (dBSecurityGroupName != null)
        'DBSecurityGroupName': dBSecurityGroupName,
      if (status != null) 'Status': status,
    };
  }
}

class DBSecurityGroupMessage {
  final List<DBSecurityGroup>? dBSecurityGroups;
  final String? marker;

  DBSecurityGroupMessage({
    this.dBSecurityGroups,
    this.marker,
  });

  factory DBSecurityGroupMessage.fromJson(Map<String, dynamic> json) {
    return DBSecurityGroupMessage(
      dBSecurityGroups: (json['DBSecurityGroups'] as List?)
          ?.whereNotNull()
          .map((e) => DBSecurityGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory DBSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMessage(
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroups = this.dBSecurityGroups;
    final marker = this.marker;
    return {
      if (dBSecurityGroups != null) 'DBSecurityGroups': dBSecurityGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DBSnapshot {
  final int? allocatedStorage;
  final String? availabilityZone;
  final String? dBInstanceIdentifier;
  final String? dBSnapshotIdentifier;
  final String? engine;
  final String? engineVersion;
  final DateTime? instanceCreateTime;
  final int? iops;
  final String? licenseModel;
  final String? masterUsername;
  final int? port;
  final DateTime? snapshotCreateTime;
  final String? snapshotType;
  final String? status;
  final String? vpcId;

  DBSnapshot({
    this.allocatedStorage,
    this.availabilityZone,
    this.dBInstanceIdentifier,
    this.dBSnapshotIdentifier,
    this.engine,
    this.engineVersion,
    this.instanceCreateTime,
    this.iops,
    this.licenseModel,
    this.masterUsername,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.status,
    this.vpcId,
  });

  factory DBSnapshot.fromJson(Map<String, dynamic> json) {
    return DBSnapshot(
      allocatedStorage: json['AllocatedStorage'] as int?,
      availabilityZone: json['AvailabilityZone'] as String?,
      dBInstanceIdentifier: json['DBInstanceIdentifier'] as String?,
      dBSnapshotIdentifier: json['DBSnapshotIdentifier'] as String?,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      instanceCreateTime: timeStampFromJson(json['InstanceCreateTime']),
      iops: json['Iops'] as int?,
      licenseModel: json['LicenseModel'] as String?,
      masterUsername: json['MasterUsername'] as String?,
      port: json['Port'] as int?,
      snapshotCreateTime: timeStampFromJson(json['SnapshotCreateTime']),
      snapshotType: json['SnapshotType'] as String?,
      status: json['Status'] as String?,
      vpcId: json['VpcId'] as String?,
    );
  }

  factory DBSnapshot.fromXml(_s.XmlElement elem) {
    return DBSnapshot(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      availabilityZone: _s.extractXmlStringValue(elem, 'AvailabilityZone'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      dBSnapshotIdentifier:
          _s.extractXmlStringValue(elem, 'DBSnapshotIdentifier'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      instanceCreateTime:
          _s.extractXmlDateTimeValue(elem, 'InstanceCreateTime'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      masterUsername: _s.extractXmlStringValue(elem, 'MasterUsername'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final availabilityZone = this.availabilityZone;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final dBSnapshotIdentifier = this.dBSnapshotIdentifier;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final instanceCreateTime = this.instanceCreateTime;
    final iops = this.iops;
    final licenseModel = this.licenseModel;
    final masterUsername = this.masterUsername;
    final port = this.port;
    final snapshotCreateTime = this.snapshotCreateTime;
    final snapshotType = this.snapshotType;
    final status = this.status;
    final vpcId = this.vpcId;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (dBSnapshotIdentifier != null)
        'DBSnapshotIdentifier': dBSnapshotIdentifier,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (instanceCreateTime != null)
        'InstanceCreateTime': unixTimestampToJson(instanceCreateTime),
      if (iops != null) 'Iops': iops,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (masterUsername != null) 'MasterUsername': masterUsername,
      if (port != null) 'Port': port,
      if (snapshotCreateTime != null)
        'SnapshotCreateTime': unixTimestampToJson(snapshotCreateTime),
      if (snapshotType != null) 'SnapshotType': snapshotType,
      if (status != null) 'Status': status,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class DBSnapshotMessage {
  final List<DBSnapshot>? dBSnapshots;
  final String? marker;

  DBSnapshotMessage({
    this.dBSnapshots,
    this.marker,
  });

  factory DBSnapshotMessage.fromJson(Map<String, dynamic> json) {
    return DBSnapshotMessage(
      dBSnapshots: (json['DBSnapshots'] as List?)
          ?.whereNotNull()
          .map((e) => DBSnapshot.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory DBSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBSnapshotMessage(
      dBSnapshots: _s.extractXmlChild(elem, 'DBSnapshots')?.let((elem) => elem
          .findElements('DBSnapshot')
          .map((c) => DBSnapshot.fromXml(c))
          .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSnapshots = this.dBSnapshots;
    final marker = this.marker;
    return {
      if (dBSnapshots != null) 'DBSnapshots': dBSnapshots,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DBSubnetGroup {
  final String? dBSubnetGroupDescription;
  final String? dBSubnetGroupName;
  final String? subnetGroupStatus;
  final List<Subnet>? subnets;
  final String? vpcId;

  DBSubnetGroup({
    this.dBSubnetGroupDescription,
    this.dBSubnetGroupName,
    this.subnetGroupStatus,
    this.subnets,
    this.vpcId,
  });

  factory DBSubnetGroup.fromJson(Map<String, dynamic> json) {
    return DBSubnetGroup(
      dBSubnetGroupDescription: json['DBSubnetGroupDescription'] as String?,
      dBSubnetGroupName: json['DBSubnetGroupName'] as String?,
      subnetGroupStatus: json['SubnetGroupStatus'] as String?,
      subnets: (json['Subnets'] as List?)
          ?.whereNotNull()
          .map((e) => Subnet.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  factory DBSubnetGroup.fromXml(_s.XmlElement elem) {
    return DBSubnetGroup(
      dBSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSubnetGroupDescription'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      subnetGroupStatus: _s.extractXmlStringValue(elem, 'SubnetGroupStatus'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let((elem) =>
          elem.findElements('Subnet').map((c) => Subnet.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSubnetGroupDescription = this.dBSubnetGroupDescription;
    final dBSubnetGroupName = this.dBSubnetGroupName;
    final subnetGroupStatus = this.subnetGroupStatus;
    final subnets = this.subnets;
    final vpcId = this.vpcId;
    return {
      if (dBSubnetGroupDescription != null)
        'DBSubnetGroupDescription': dBSubnetGroupDescription,
      if (dBSubnetGroupName != null) 'DBSubnetGroupName': dBSubnetGroupName,
      if (subnetGroupStatus != null) 'SubnetGroupStatus': subnetGroupStatus,
      if (subnets != null) 'Subnets': subnets,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class DBSubnetGroupMessage {
  final List<DBSubnetGroup>? dBSubnetGroups;
  final String? marker;

  DBSubnetGroupMessage({
    this.dBSubnetGroups,
    this.marker,
  });

  factory DBSubnetGroupMessage.fromJson(Map<String, dynamic> json) {
    return DBSubnetGroupMessage(
      dBSubnetGroups: (json['DBSubnetGroups'] as List?)
          ?.whereNotNull()
          .map((e) => DBSubnetGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory DBSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSubnetGroupMessage(
      dBSubnetGroups: _s.extractXmlChild(elem, 'DBSubnetGroups')?.let((elem) =>
          elem
              .findElements('DBSubnetGroup')
              .map((c) => DBSubnetGroup.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSubnetGroups = this.dBSubnetGroups;
    final marker = this.marker;
    return {
      if (dBSubnetGroups != null) 'DBSubnetGroups': dBSubnetGroups,
      if (marker != null) 'Marker': marker,
    };
  }
}

class DeleteDBInstanceResult {
  final DBInstance? dBInstance;

  DeleteDBInstanceResult({
    this.dBInstance,
  });

  factory DeleteDBInstanceResult.fromJson(Map<String, dynamic> json) {
    return DeleteDBInstanceResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory DeleteDBInstanceResult.fromXml(_s.XmlElement elem) {
    return DeleteDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class DeleteDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  DeleteDBSnapshotResult({
    this.dBSnapshot,
  });

  factory DeleteDBSnapshotResult.fromJson(Map<String, dynamic> json) {
    return DeleteDBSnapshotResult(
      dBSnapshot: json['DBSnapshot'] != null
          ? DBSnapshot.fromJson(json['DBSnapshot'] as Map<String, dynamic>)
          : null,
    );
  }

  factory DeleteDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBSnapshotResult(
      dBSnapshot: _s
          .extractXmlChild(elem, 'DBSnapshot')
          ?.let((e) => DBSnapshot.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSnapshot = this.dBSnapshot;
    return {
      if (dBSnapshot != null) 'DBSnapshot': dBSnapshot,
    };
  }
}

class DeleteEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  DeleteEventSubscriptionResult({
    this.eventSubscription,
  });

  factory DeleteEventSubscriptionResult.fromJson(Map<String, dynamic> json) {
    return DeleteEventSubscriptionResult(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  factory DeleteEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return DeleteEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class DescribeEngineDefaultParametersResult {
  final EngineDefaults? engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });

  factory DescribeEngineDefaultParametersResult.fromJson(
      Map<String, dynamic> json) {
    return DescribeEngineDefaultParametersResult(
      engineDefaults: json['EngineDefaults'] != null
          ? EngineDefaults.fromJson(
              json['EngineDefaults'] as Map<String, dynamic>)
          : null,
    );
  }

  factory DescribeEngineDefaultParametersResult.fromXml(_s.XmlElement elem) {
    return DescribeEngineDefaultParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let((e) => EngineDefaults.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final engineDefaults = this.engineDefaults;
    return {
      if (engineDefaults != null) 'EngineDefaults': engineDefaults,
    };
  }
}

class EC2SecurityGroup {
  final String? eC2SecurityGroupId;
  final String? eC2SecurityGroupName;
  final String? eC2SecurityGroupOwnerId;
  final String? status;

  EC2SecurityGroup({
    this.eC2SecurityGroupId,
    this.eC2SecurityGroupName,
    this.eC2SecurityGroupOwnerId,
    this.status,
  });

  factory EC2SecurityGroup.fromJson(Map<String, dynamic> json) {
    return EC2SecurityGroup(
      eC2SecurityGroupId: json['EC2SecurityGroupId'] as String?,
      eC2SecurityGroupName: json['EC2SecurityGroupName'] as String?,
      eC2SecurityGroupOwnerId: json['EC2SecurityGroupOwnerId'] as String?,
      status: json['Status'] as String?,
    );
  }

  factory EC2SecurityGroup.fromXml(_s.XmlElement elem) {
    return EC2SecurityGroup(
      eC2SecurityGroupId: _s.extractXmlStringValue(elem, 'EC2SecurityGroupId'),
      eC2SecurityGroupName:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupName'),
      eC2SecurityGroupOwnerId:
          _s.extractXmlStringValue(elem, 'EC2SecurityGroupOwnerId'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final eC2SecurityGroupId = this.eC2SecurityGroupId;
    final eC2SecurityGroupName = this.eC2SecurityGroupName;
    final eC2SecurityGroupOwnerId = this.eC2SecurityGroupOwnerId;
    final status = this.status;
    return {
      if (eC2SecurityGroupId != null) 'EC2SecurityGroupId': eC2SecurityGroupId,
      if (eC2SecurityGroupName != null)
        'EC2SecurityGroupName': eC2SecurityGroupName,
      if (eC2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': eC2SecurityGroupOwnerId,
      if (status != null) 'Status': status,
    };
  }
}

class Endpoint {
  final String? address;
  final int? port;

  Endpoint({
    this.address,
    this.port,
  });

  factory Endpoint.fromJson(Map<String, dynamic> json) {
    return Endpoint(
      address: json['Address'] as String?,
      port: json['Port'] as int?,
    );
  }

  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      address: _s.extractXmlStringValue(elem, 'Address'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }

  Map<String, dynamic> toJson() {
    final address = this.address;
    final port = this.port;
    return {
      if (address != null) 'Address': address,
      if (port != null) 'Port': port,
    };
  }
}

class EngineDefaults {
  final String? dBParameterGroupFamily;
  final String? marker;
  final List<Parameter>? parameters;

  EngineDefaults({
    this.dBParameterGroupFamily,
    this.marker,
    this.parameters,
  });

  factory EngineDefaults.fromJson(Map<String, dynamic> json) {
    return EngineDefaults(
      dBParameterGroupFamily: json['DBParameterGroupFamily'] as String?,
      marker: json['Marker'] as String?,
      parameters: (json['Parameters'] as List?)
          ?.whereNotNull()
          .map((e) => Parameter.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory EngineDefaults.fromXml(_s.XmlElement elem) {
    return EngineDefaults(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) => elem
          .findElements('Parameter')
          .map((c) => Parameter.fromXml(c))
          .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final dBParameterGroupFamily = this.dBParameterGroupFamily;
    final marker = this.marker;
    final parameters = this.parameters;
    return {
      if (dBParameterGroupFamily != null)
        'DBParameterGroupFamily': dBParameterGroupFamily,
      if (marker != null) 'Marker': marker,
      if (parameters != null) 'Parameters': parameters,
    };
  }
}

class Event {
  final DateTime? date;
  final List<String>? eventCategories;
  final String? message;
  final String? sourceIdentifier;
  final SourceType? sourceType;

  Event({
    this.date,
    this.eventCategories,
    this.message,
    this.sourceIdentifier,
    this.sourceType,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      date: timeStampFromJson(json['Date']),
      eventCategories: (json['EventCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      message: json['Message'] as String?,
      sourceIdentifier: json['SourceIdentifier'] as String?,
      sourceType: (json['SourceType'] as String?)?.toSourceType(),
    );
  }

  factory Event.fromXml(_s.XmlElement elem) {
    return Event(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType')?.toSourceType(),
    );
  }

  Map<String, dynamic> toJson() {
    final date = this.date;
    final eventCategories = this.eventCategories;
    final message = this.message;
    final sourceIdentifier = this.sourceIdentifier;
    final sourceType = this.sourceType;
    return {
      if (date != null) 'Date': unixTimestampToJson(date),
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (message != null) 'Message': message,
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType.toValue(),
    };
  }
}

class EventCategoriesMap {
  final List<String>? eventCategories;
  final String? sourceType;

  EventCategoriesMap({
    this.eventCategories,
    this.sourceType,
  });

  factory EventCategoriesMap.fromJson(Map<String, dynamic> json) {
    return EventCategoriesMap(
      eventCategories: (json['EventCategories'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceType: json['SourceType'] as String?,
    );
  }

  factory EventCategoriesMap.fromXml(_s.XmlElement elem) {
    return EventCategoriesMap(
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategories = this.eventCategories;
    final sourceType = this.sourceType;
    return {
      if (eventCategories != null) 'EventCategories': eventCategories,
      if (sourceType != null) 'SourceType': sourceType,
    };
  }
}

class EventCategoriesMessage {
  final List<EventCategoriesMap>? eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });

  factory EventCategoriesMessage.fromJson(Map<String, dynamic> json) {
    return EventCategoriesMessage(
      eventCategoriesMapList: (json['EventCategoriesMapList'] as List?)
          ?.whereNotNull()
          .map((e) => EventCategoriesMap.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory EventCategoriesMessage.fromXml(_s.XmlElement elem) {
    return EventCategoriesMessage(
      eventCategoriesMapList: _s
          .extractXmlChild(elem, 'EventCategoriesMapList')
          ?.let((elem) => elem
              .findElements('EventCategoriesMap')
              .map((c) => EventCategoriesMap.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final eventCategoriesMapList = this.eventCategoriesMapList;
    return {
      if (eventCategoriesMapList != null)
        'EventCategoriesMapList': eventCategoriesMapList,
    };
  }
}

class EventSubscription {
  final String? custSubscriptionId;
  final String? customerAwsId;
  final bool? enabled;
  final List<String>? eventCategoriesList;
  final String? id;
  final String? snsTopicArn;
  final List<String>? sourceIdsList;
  final String? sourceType;
  final String? status;
  final String? subscriptionCreationTime;

  EventSubscription({
    this.custSubscriptionId,
    this.customerAwsId,
    this.enabled,
    this.eventCategoriesList,
    this.id,
    this.snsTopicArn,
    this.sourceIdsList,
    this.sourceType,
    this.status,
    this.subscriptionCreationTime,
  });

  factory EventSubscription.fromJson(Map<String, dynamic> json) {
    return EventSubscription(
      custSubscriptionId: json['CustSubscriptionId'] as String?,
      customerAwsId: json['CustomerAwsId'] as String?,
      enabled: json['Enabled'] as bool?,
      eventCategoriesList: (json['EventCategoriesList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      id: json['Id'] as String?,
      snsTopicArn: json['SnsTopicArn'] as String?,
      sourceIdsList: (json['SourceIdsList'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      sourceType: json['SourceType'] as String?,
      status: json['Status'] as String?,
      subscriptionCreationTime: json['SubscriptionCreationTime'] as String?,
    );
  }

  factory EventSubscription.fromXml(_s.XmlElement elem) {
    return EventSubscription(
      custSubscriptionId: _s.extractXmlStringValue(elem, 'CustSubscriptionId'),
      customerAwsId: _s.extractXmlStringValue(elem, 'CustomerAwsId'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      eventCategoriesList: _s
          .extractXmlChild(elem, 'EventCategoriesList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      id: _s.extractXmlStringValue(elem, 'Id'),
      snsTopicArn: _s.extractXmlStringValue(elem, 'SnsTopicArn'),
      sourceIdsList: _s
          .extractXmlChild(elem, 'SourceIdsList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'SourceId')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      subscriptionCreationTime:
          _s.extractXmlStringValue(elem, 'SubscriptionCreationTime'),
    );
  }

  Map<String, dynamic> toJson() {
    final custSubscriptionId = this.custSubscriptionId;
    final customerAwsId = this.customerAwsId;
    final enabled = this.enabled;
    final eventCategoriesList = this.eventCategoriesList;
    final id = this.id;
    final snsTopicArn = this.snsTopicArn;
    final sourceIdsList = this.sourceIdsList;
    final sourceType = this.sourceType;
    final status = this.status;
    final subscriptionCreationTime = this.subscriptionCreationTime;
    return {
      if (custSubscriptionId != null) 'CustSubscriptionId': custSubscriptionId,
      if (customerAwsId != null) 'CustomerAwsId': customerAwsId,
      if (enabled != null) 'Enabled': enabled,
      if (eventCategoriesList != null)
        'EventCategoriesList': eventCategoriesList,
      if (id != null) 'Id': id,
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sourceIdsList != null) 'SourceIdsList': sourceIdsList,
      if (sourceType != null) 'SourceType': sourceType,
      if (status != null) 'Status': status,
      if (subscriptionCreationTime != null)
        'SubscriptionCreationTime': subscriptionCreationTime,
    };
  }
}

class EventSubscriptionsMessage {
  final List<EventSubscription>? eventSubscriptionsList;
  final String? marker;

  EventSubscriptionsMessage({
    this.eventSubscriptionsList,
    this.marker,
  });

  factory EventSubscriptionsMessage.fromJson(Map<String, dynamic> json) {
    return EventSubscriptionsMessage(
      eventSubscriptionsList: (json['EventSubscriptionsList'] as List?)
          ?.whereNotNull()
          .map((e) => EventSubscription.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory EventSubscriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventSubscriptionsMessage(
      eventSubscriptionsList: _s
          .extractXmlChild(elem, 'EventSubscriptionsList')
          ?.let((elem) => elem
              .findElements('EventSubscription')
              .map((c) => EventSubscription.fromXml(c))
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscriptionsList = this.eventSubscriptionsList;
    final marker = this.marker;
    return {
      if (eventSubscriptionsList != null)
        'EventSubscriptionsList': eventSubscriptionsList,
      if (marker != null) 'Marker': marker,
    };
  }
}

class EventsMessage {
  final List<Event>? events;
  final String? marker;

  EventsMessage({
    this.events,
    this.marker,
  });

  factory EventsMessage.fromJson(Map<String, dynamic> json) {
    return EventsMessage(
      events: (json['Events'] as List?)
          ?.whereNotNull()
          .map((e) => Event.fromJson(e as Map<String, dynamic>))
          .toList(),
      marker: json['Marker'] as String?,
    );
  }

  factory EventsMessage.fromXml(_s.XmlElement elem) {
    return EventsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let((elem) =>
          elem.findElements('Event').map((c) => Event.fromXml(c)).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }

  Map<String, dynamic> toJson() {
    final events = this.events;
    final marker = this.marker;
    return {
      if (events != null) 'Events': events,
      if (marker != null) 'Marker': marker,
    };
  }
}

class IPRange {
  final String? cidrip;
  final String? status;

  IPRange({
    this.cidrip,
    this.status,
  });

  factory IPRange.fromJson(Map<String, dynamic> json) {
    return IPRange(
      cidrip: json['CIDRIP'] as String?,
      status: json['Status'] as String?,
    );
  }

  factory IPRange.fromXml(_s.XmlElement elem) {
    return IPRange(
      cidrip: _s.extractXmlStringValue(elem, 'CIDRIP'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final cidrip = this.cidrip;
    final status = this.status;
    return {
      if (cidrip != null) 'CIDRIP': cidrip,
      if (status != null) 'Status': status,
    };
  }
}

class ModifyDBInstanceResult {
  final DBInstance? dBInstance;

  ModifyDBInstanceResult({
    this.dBInstance,
  });

  factory ModifyDBInstanceResult.fromJson(Map<String, dynamic> json) {
    return ModifyDBInstanceResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ModifyDBInstanceResult.fromXml(_s.XmlElement elem) {
    return ModifyDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup? dBSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dBSubnetGroup,
  });

  factory ModifyDBSubnetGroupResult.fromJson(Map<String, dynamic> json) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup: json['DBSubnetGroup'] != null
          ? DBSubnetGroup.fromJson(
              json['DBSubnetGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ModifyDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup: _s
          .extractXmlChild(elem, 'DBSubnetGroup')
          ?.let((e) => DBSubnetGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSubnetGroup = this.dBSubnetGroup;
    return {
      if (dBSubnetGroup != null) 'DBSubnetGroup': dBSubnetGroup,
    };
  }
}

class ModifyEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });

  factory ModifyEventSubscriptionResult.fromJson(Map<String, dynamic> json) {
    return ModifyEventSubscriptionResult(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ModifyEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return ModifyEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class ModifyOptionGroupResult {
  final OptionGroup? optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });

  factory ModifyOptionGroupResult.fromJson(Map<String, dynamic> json) {
    return ModifyOptionGroupResult(
      optionGroup: json['OptionGroup'] != null
          ? OptionGroup.fromJson(json['OptionGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory ModifyOptionGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyOptionGroupResult(
      optionGroup: _s
          .extractXmlChild(elem, 'OptionGroup')
          ?.let((e) => OptionGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final optionGroup = this.optionGroup;
    return {
      if (optionGroup != null) 'OptionGroup': optionGroup,
    };
  }
}

class Option {
  final List<DBSecurityGroupMembership>? dBSecurityGroupMemberships;
  final String? optionDescription;
  final String? optionName;
  final int? port;
  final List<VpcSecurityGroupMembership>? vpcSecurityGroupMemberships;

  Option({
    this.dBSecurityGroupMemberships,
    this.optionDescription,
    this.optionName,
    this.port,
    this.vpcSecurityGroupMemberships,
  });

  factory Option.fromJson(Map<String, dynamic> json) {
    return Option(
      dBSecurityGroupMemberships: (json['DBSecurityGroupMemberships'] as List?)
          ?.whereNotNull()
          .map((e) =>
              DBSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
      optionDescription: json['OptionDescription'] as String?,
      optionName: json['OptionName'] as String?,
      port: json['Port'] as int?,
      vpcSecurityGroupMemberships: (json['VpcSecurityGroupMemberships']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              VpcSecurityGroupMembership.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory Option.fromXml(_s.XmlElement elem) {
    return Option(
      dBSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'DBSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('DBSecurityGroup')
              .map((c) => DBSecurityGroupMembership.fromXml(c))
              .toList()),
      optionDescription: _s.extractXmlStringValue(elem, 'OptionDescription'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      vpcSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'VpcSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map((c) => VpcSecurityGroupMembership.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroupMemberships = this.dBSecurityGroupMemberships;
    final optionDescription = this.optionDescription;
    final optionName = this.optionName;
    final port = this.port;
    final vpcSecurityGroupMemberships = this.vpcSecurityGroupMemberships;
    return {
      if (dBSecurityGroupMemberships != null)
        'DBSecurityGroupMemberships': dBSecurityGroupMemberships,
      if (optionDescription != null) 'OptionDescription': optionDescription,
      if (optionName != null) 'OptionName': optionName,
      if (port != null) 'Port': port,
      if (vpcSecurityGroupMemberships != null)
        'VpcSecurityGroupMemberships': vpcSecurityGroupMemberships,
    };
  }
}

class OptionConfiguration {
  final String optionName;
  final List<String>? dBSecurityGroupMemberships;
  final int? port;
  final List<String>? vpcSecurityGroupMemberships;

  OptionConfiguration({
    required this.optionName,
    this.dBSecurityGroupMemberships,
    this.port,
    this.vpcSecurityGroupMemberships,
  });

  factory OptionConfiguration.fromJson(Map<String, dynamic> json) {
    return OptionConfiguration(
      optionName: json['OptionName'] as String,
      dBSecurityGroupMemberships: (json['DBSecurityGroupMemberships'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      port: json['Port'] as int?,
      vpcSecurityGroupMemberships:
          (json['VpcSecurityGroupMemberships'] as List?)
              ?.whereNotNull()
              .map((e) => e as String)
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final optionName = this.optionName;
    final dBSecurityGroupMemberships = this.dBSecurityGroupMemberships;
    final port = this.port;
    final vpcSecurityGroupMemberships = this.vpcSecurityGroupMemberships;
    return {
      'OptionName': optionName,
      if (dBSecurityGroupMemberships != null)
        'DBSecurityGroupMemberships': dBSecurityGroupMemberships,
      if (port != null) 'Port': port,
      if (vpcSecurityGroupMemberships != null)
        'VpcSecurityGroupMemberships': vpcSecurityGroupMemberships,
    };
  }
}

class OptionGroup {
  final bool? allowsVpcAndNonVpcInstanceMemberships;
  final String? engineName;
  final String? majorEngineVersion;
  final String? optionGroupDescription;
  final String? optionGroupName;
  final List<Option>? options;
  final String? vpcId;

  OptionGroup({
    this.allowsVpcAndNonVpcInstanceMemberships,
    this.engineName,
    this.majorEngineVersion,
    this.optionGroupDescription,
    this.optionGroupName,
    this.options,
    this.vpcId,
  });

  factory OptionGroup.fromJson(Map<String, dynamic> json) {
    return OptionGroup(
      allowsVpcAndNonVpcInstanceMemberships:
          json['AllowsVpcAndNonVpcInstanceMemberships'] as bool?,
      engineName: json['EngineName'] as String?,
      majorEngineVersion: json['MajorEngineVersion'] as String?,
      optionGroupDescription: json['OptionGroupDescription'] as String?,
      optionGroupName: json['OptionGroupName'] as String?,
      options: (json['Options'] as List?)
          ?.whereNotNull()
          .map((e) => Option.fromJson(e as Map<String, dynamic>))
          .toList(),
      vpcId: json['VpcId'] as String?,
    );
  }

  factory OptionGroup.fromXml(_s.XmlElement elem) {
    return OptionGroup(
      allowsVpcAndNonVpcInstanceMemberships:
          _s.extractXmlBoolValue(elem, 'AllowsVpcAndNonVpcInstanceMemberships'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      optionGroupDescription:
          _s.extractXmlStringValue(elem, 'OptionGroupDescription'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      options: _s.extractXmlChild(elem, 'Options')?.let((elem) =>
          elem.findElements('Option').map((c) => Option.fromXml(c)).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowsVpcAndNonVpcInstanceMemberships =
        this.allowsVpcAndNonVpcInstanceMemberships;
    final engineName = this.engineName;
    final majorEngineVersion = this.majorEngineVersion;
    final optionGroupDescription = this.optionGroupDescription;
    final optionGroupName = this.optionGroupName;
    final options = this.options;
    final vpcId = this.vpcId;
    return {
      if (allowsVpcAndNonVpcInstanceMemberships != null)
        'AllowsVpcAndNonVpcInstanceMemberships':
            allowsVpcAndNonVpcInstanceMemberships,
      if (engineName != null) 'EngineName': engineName,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (optionGroupDescription != null)
        'OptionGroupDescription': optionGroupDescription,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (options != null) 'Options': options,
      if (vpcId != null) 'VpcId': vpcId,
    };
  }
}

class OptionGroupMembership {
  final String? optionGroupName;
  final String? status;

  OptionGroupMembership({
    this.optionGroupName,
    this.status,
  });

  factory OptionGroupMembership.fromJson(Map<String, dynamic> json) {
    return OptionGroupMembership(
      optionGroupName: json['OptionGroupName'] as String?,
      status: json['Status'] as String?,
    );
  }

  factory OptionGroupMembership.fromXml(_s.XmlElement elem) {
    return OptionGroupMembership(
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }

  Map<String, dynamic> toJson() {
    final optionGroupName = this.optionGroupName;
    final status = this.status;
    return {
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (status != null) 'Status': status,
    };
  }
}

class OptionGroupOption {
  final int? defaultPort;
  final String? description;
  final String? engineName;
  final String? majorEngineVersion;
  final String? minimumRequiredMinorEngineVersion;
  final String? name;
  final List<String>? optionsDependedOn;
  final bool? portRequired;

  OptionGroupOption({
    this.defaultPort,
    this.description,
    this.engineName,
    this.majorEngineVersion,
    this.minimumRequiredMinorEngineVersion,
    this.name,
    this.optionsDependedOn,
    this.portRequired,
  });

  factory OptionGroupOption.fromJson(Map<String, dynamic> json) {
    return OptionGroupOption(
      defaultPort: json['DefaultPort'] as int?,
      description: json['Description'] as String?,
      engineName: json['EngineName'] as String?,
      majorEngineVersion: json['MajorEngineVersion'] as String?,
      minimumRequiredMinorEngineVersion:
          json['MinimumRequiredMinorEngineVersion'] as String?,
      name: json['Name'] as String?,
      optionsDependedOn: (json['OptionsDependedOn'] as List?)
          ?.whereNotNull()
          .map((e) => e as String)
          .toList(),
      portRequired: json['PortRequired'] as bool?,
    );
  }

  factory OptionGroupOption.fromXml(_s.XmlElement elem) {
    return OptionGroupOption(
      defaultPort: _s.extractXmlIntValue(elem, 'DefaultPort'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      minimumRequiredMinorEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumRequiredMinorEngineVersion'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      optionsDependedOn: _s
          .extractXmlChild(elem, 'OptionsDependedOn')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'OptionName')),
      portRequired: _s.extractXmlBoolValue(elem, 'PortRequired'),
    );
  }

  Map<String, dynamic> toJson() {
    final defaultPort = this.defaultPort;
    final description = this.description;
    final engineName = this.engineName;
    final majorEngineVersion = this.majorEngineVersion;
    final minimumRequiredMinorEngineVersion =
        this.minimumRequiredMinorEngineVersion;
    final name = this.name;
    final optionsDependedOn = this.optionsDependedOn;
    final portRequired = this.portRequired;
    return {
      if (defaultPort != null) 'DefaultPort': defaultPort,
      if (description != null) 'Description': description,
      if (engineName != null) 'EngineName': engineName,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (minimumRequiredMinorEngineVersion != null)
        'MinimumRequiredMinorEngineVersion': minimumRequiredMinorEngineVersion,
      if (name != null) 'Name': name,
      if (optionsDependedOn != null) 'OptionsDependedOn': optionsDependedOn,
      if (portRequired != null) 'PortRequired': portRequired,
    };
  }
}

class OptionGroupOptionsMessage {
  final String? marker;
  final List<OptionGroupOption>? optionGroupOptions;

  OptionGroupOptionsMessage({
    this.marker,
    this.optionGroupOptions,
  });

  factory OptionGroupOptionsMessage.fromJson(Map<String, dynamic> json) {
    return OptionGroupOptionsMessage(
      marker: json['Marker'] as String?,
      optionGroupOptions: (json['OptionGroupOptions'] as List?)
          ?.whereNotNull()
          .map((e) => OptionGroupOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OptionGroupOptionsMessage.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupOptions: _s.extractXmlChild(elem, 'OptionGroupOptions')?.let(
          (elem) => elem
              .findElements('OptionGroupOption')
              .map((c) => OptionGroupOption.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final optionGroupOptions = this.optionGroupOptions;
    return {
      if (marker != null) 'Marker': marker,
      if (optionGroupOptions != null) 'OptionGroupOptions': optionGroupOptions,
    };
  }
}

class OptionGroups {
  final String? marker;
  final List<OptionGroup>? optionGroupsList;

  OptionGroups({
    this.marker,
    this.optionGroupsList,
  });

  factory OptionGroups.fromJson(Map<String, dynamic> json) {
    return OptionGroups(
      marker: json['Marker'] as String?,
      optionGroupsList: (json['OptionGroupsList'] as List?)
          ?.whereNotNull()
          .map((e) => OptionGroup.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OptionGroups.fromXml(_s.XmlElement elem) {
    return OptionGroups(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupsList: _s.extractXmlChild(elem, 'OptionGroupsList')?.let(
          (elem) => elem
              .findElements('OptionGroup')
              .map((c) => OptionGroup.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final optionGroupsList = this.optionGroupsList;
    return {
      if (marker != null) 'Marker': marker,
      if (optionGroupsList != null) 'OptionGroupsList': optionGroupsList,
    };
  }
}

class OrderableDBInstanceOption {
  final List<AvailabilityZone>? availabilityZones;
  final String? dBInstanceClass;
  final String? engine;
  final String? engineVersion;
  final String? licenseModel;
  final bool? multiAZCapable;
  final bool? readReplicaCapable;
  final bool? vpc;

  OrderableDBInstanceOption({
    this.availabilityZones,
    this.dBInstanceClass,
    this.engine,
    this.engineVersion,
    this.licenseModel,
    this.multiAZCapable,
    this.readReplicaCapable,
    this.vpc,
  });

  factory OrderableDBInstanceOption.fromJson(Map<String, dynamic> json) {
    return OrderableDBInstanceOption(
      availabilityZones: (json['AvailabilityZones'] as List?)
          ?.whereNotNull()
          .map((e) => AvailabilityZone.fromJson(e as Map<String, dynamic>))
          .toList(),
      dBInstanceClass: json['DBInstanceClass'] as String?,
      engine: json['Engine'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      licenseModel: json['LicenseModel'] as String?,
      multiAZCapable: json['MultiAZCapable'] as bool?,
      readReplicaCapable: json['ReadReplicaCapable'] as bool?,
      vpc: json['Vpc'] as bool?,
    );
  }

  factory OrderableDBInstanceOption.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOption(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('AvailabilityZone')
              .map((c) => AvailabilityZone.fromXml(c))
              .toList()),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      licenseModel: _s.extractXmlStringValue(elem, 'LicenseModel'),
      multiAZCapable: _s.extractXmlBoolValue(elem, 'MultiAZCapable'),
      readReplicaCapable: _s.extractXmlBoolValue(elem, 'ReadReplicaCapable'),
      vpc: _s.extractXmlBoolValue(elem, 'Vpc'),
    );
  }

  Map<String, dynamic> toJson() {
    final availabilityZones = this.availabilityZones;
    final dBInstanceClass = this.dBInstanceClass;
    final engine = this.engine;
    final engineVersion = this.engineVersion;
    final licenseModel = this.licenseModel;
    final multiAZCapable = this.multiAZCapable;
    final readReplicaCapable = this.readReplicaCapable;
    final vpc = this.vpc;
    return {
      if (availabilityZones != null) 'AvailabilityZones': availabilityZones,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (multiAZCapable != null) 'MultiAZCapable': multiAZCapable,
      if (readReplicaCapable != null) 'ReadReplicaCapable': readReplicaCapable,
      if (vpc != null) 'Vpc': vpc,
    };
  }
}

class OrderableDBInstanceOptionsMessage {
  final String? marker;
  final List<OrderableDBInstanceOption>? orderableDBInstanceOptions;

  OrderableDBInstanceOptionsMessage({
    this.marker,
    this.orderableDBInstanceOptions,
  });

  factory OrderableDBInstanceOptionsMessage.fromJson(
      Map<String, dynamic> json) {
    return OrderableDBInstanceOptionsMessage(
      marker: json['Marker'] as String?,
      orderableDBInstanceOptions: (json['OrderableDBInstanceOptions'] as List?)
          ?.whereNotNull()
          .map((e) =>
              OrderableDBInstanceOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory OrderableDBInstanceOptionsMessage.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      orderableDBInstanceOptions: _s
          .extractXmlChild(elem, 'OrderableDBInstanceOptions')
          ?.let((elem) => elem
              .findElements('OrderableDBInstanceOption')
              .map((c) => OrderableDBInstanceOption.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final orderableDBInstanceOptions = this.orderableDBInstanceOptions;
    return {
      if (marker != null) 'Marker': marker,
      if (orderableDBInstanceOptions != null)
        'OrderableDBInstanceOptions': orderableDBInstanceOptions,
    };
  }
}

class Parameter {
  final String? allowedValues;
  final ApplyMethod? applyMethod;
  final String? applyType;
  final String? dataType;
  final String? description;
  final bool? isModifiable;
  final String? minimumEngineVersion;
  final String? parameterName;
  final String? parameterValue;
  final String? source;

  Parameter({
    this.allowedValues,
    this.applyMethod,
    this.applyType,
    this.dataType,
    this.description,
    this.isModifiable,
    this.minimumEngineVersion,
    this.parameterName,
    this.parameterValue,
    this.source,
  });

  factory Parameter.fromJson(Map<String, dynamic> json) {
    return Parameter(
      allowedValues: json['AllowedValues'] as String?,
      applyMethod: (json['ApplyMethod'] as String?)?.toApplyMethod(),
      applyType: json['ApplyType'] as String?,
      dataType: json['DataType'] as String?,
      description: json['Description'] as String?,
      isModifiable: json['IsModifiable'] as bool?,
      minimumEngineVersion: json['MinimumEngineVersion'] as String?,
      parameterName: json['ParameterName'] as String?,
      parameterValue: json['ParameterValue'] as String?,
      source: json['Source'] as String?,
    );
  }

  factory Parameter.fromXml(_s.XmlElement elem) {
    return Parameter(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyMethod:
          _s.extractXmlStringValue(elem, 'ApplyMethod')?.toApplyMethod(),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      minimumEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumEngineVersion'),
      parameterName: _s.extractXmlStringValue(elem, 'ParameterName'),
      parameterValue: _s.extractXmlStringValue(elem, 'ParameterValue'),
      source: _s.extractXmlStringValue(elem, 'Source'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final applyMethod = this.applyMethod;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final description = this.description;
    final isModifiable = this.isModifiable;
    final minimumEngineVersion = this.minimumEngineVersion;
    final parameterName = this.parameterName;
    final parameterValue = this.parameterValue;
    final source = this.source;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (applyMethod != null) 'ApplyMethod': applyMethod.toValue(),
      if (applyType != null) 'ApplyType': applyType,
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (isModifiable != null) 'IsModifiable': isModifiable,
      if (minimumEngineVersion != null)
        'MinimumEngineVersion': minimumEngineVersion,
      if (parameterName != null) 'ParameterName': parameterName,
      if (parameterValue != null) 'ParameterValue': parameterValue,
      if (source != null) 'Source': source,
    };
  }
}

class PendingModifiedValues {
  final int? allocatedStorage;
  final int? backupRetentionPeriod;
  final String? dBInstanceClass;
  final String? dBInstanceIdentifier;
  final String? engineVersion;
  final int? iops;
  final String? masterUserPassword;
  final bool? multiAZ;
  final int? port;

  PendingModifiedValues({
    this.allocatedStorage,
    this.backupRetentionPeriod,
    this.dBInstanceClass,
    this.dBInstanceIdentifier,
    this.engineVersion,
    this.iops,
    this.masterUserPassword,
    this.multiAZ,
    this.port,
  });

  factory PendingModifiedValues.fromJson(Map<String, dynamic> json) {
    return PendingModifiedValues(
      allocatedStorage: json['AllocatedStorage'] as int?,
      backupRetentionPeriod: json['BackupRetentionPeriod'] as int?,
      dBInstanceClass: json['DBInstanceClass'] as String?,
      dBInstanceIdentifier: json['DBInstanceIdentifier'] as String?,
      engineVersion: json['EngineVersion'] as String?,
      iops: json['Iops'] as int?,
      masterUserPassword: json['MasterUserPassword'] as String?,
      multiAZ: json['MultiAZ'] as bool?,
      port: json['Port'] as int?,
    );
  }

  factory PendingModifiedValues.fromXml(_s.XmlElement elem) {
    return PendingModifiedValues(
      allocatedStorage: _s.extractXmlIntValue(elem, 'AllocatedStorage'),
      backupRetentionPeriod:
          _s.extractXmlIntValue(elem, 'BackupRetentionPeriod'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceIdentifier:
          _s.extractXmlStringValue(elem, 'DBInstanceIdentifier'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      iops: _s.extractXmlIntValue(elem, 'Iops'),
      masterUserPassword: _s.extractXmlStringValue(elem, 'MasterUserPassword'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
  }

  Map<String, dynamic> toJson() {
    final allocatedStorage = this.allocatedStorage;
    final backupRetentionPeriod = this.backupRetentionPeriod;
    final dBInstanceClass = this.dBInstanceClass;
    final dBInstanceIdentifier = this.dBInstanceIdentifier;
    final engineVersion = this.engineVersion;
    final iops = this.iops;
    final masterUserPassword = this.masterUserPassword;
    final multiAZ = this.multiAZ;
    final port = this.port;
    return {
      if (allocatedStorage != null) 'AllocatedStorage': allocatedStorage,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iops != null) 'Iops': iops,
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (port != null) 'Port': port,
    };
  }
}

class PromoteReadReplicaResult {
  final DBInstance? dBInstance;

  PromoteReadReplicaResult({
    this.dBInstance,
  });

  factory PromoteReadReplicaResult.fromJson(Map<String, dynamic> json) {
    return PromoteReadReplicaResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory PromoteReadReplicaResult.fromXml(_s.XmlElement elem) {
    return PromoteReadReplicaResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class PurchaseReservedDBInstancesOfferingResult {
  final ReservedDBInstance? reservedDBInstance;

  PurchaseReservedDBInstancesOfferingResult({
    this.reservedDBInstance,
  });

  factory PurchaseReservedDBInstancesOfferingResult.fromJson(
      Map<String, dynamic> json) {
    return PurchaseReservedDBInstancesOfferingResult(
      reservedDBInstance: json['ReservedDBInstance'] != null
          ? ReservedDBInstance.fromJson(
              json['ReservedDBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory PurchaseReservedDBInstancesOfferingResult.fromXml(
      _s.XmlElement elem) {
    return PurchaseReservedDBInstancesOfferingResult(
      reservedDBInstance: _s
          .extractXmlChild(elem, 'ReservedDBInstance')
          ?.let((e) => ReservedDBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final reservedDBInstance = this.reservedDBInstance;
    return {
      if (reservedDBInstance != null) 'ReservedDBInstance': reservedDBInstance,
    };
  }
}

class RebootDBInstanceResult {
  final DBInstance? dBInstance;

  RebootDBInstanceResult({
    this.dBInstance,
  });

  factory RebootDBInstanceResult.fromJson(Map<String, dynamic> json) {
    return RebootDBInstanceResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory RebootDBInstanceResult.fromXml(_s.XmlElement elem) {
    return RebootDBInstanceResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class RecurringCharge {
  final double? recurringChargeAmount;
  final String? recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });

  factory RecurringCharge.fromJson(Map<String, dynamic> json) {
    return RecurringCharge(
      recurringChargeAmount: json['RecurringChargeAmount'] as double?,
      recurringChargeFrequency: json['RecurringChargeFrequency'] as String?,
    );
  }

  factory RecurringCharge.fromXml(_s.XmlElement elem) {
    return RecurringCharge(
      recurringChargeAmount:
          _s.extractXmlDoubleValue(elem, 'RecurringChargeAmount'),
      recurringChargeFrequency:
          _s.extractXmlStringValue(elem, 'RecurringChargeFrequency'),
    );
  }

  Map<String, dynamic> toJson() {
    final recurringChargeAmount = this.recurringChargeAmount;
    final recurringChargeFrequency = this.recurringChargeFrequency;
    return {
      if (recurringChargeAmount != null)
        'RecurringChargeAmount': recurringChargeAmount,
      if (recurringChargeFrequency != null)
        'RecurringChargeFrequency': recurringChargeFrequency,
    };
  }
}

class RemoveSourceIdentifierFromSubscriptionResult {
  final EventSubscription? eventSubscription;

  RemoveSourceIdentifierFromSubscriptionResult({
    this.eventSubscription,
  });

  factory RemoveSourceIdentifierFromSubscriptionResult.fromJson(
      Map<String, dynamic> json) {
    return RemoveSourceIdentifierFromSubscriptionResult(
      eventSubscription: json['EventSubscription'] != null
          ? EventSubscription.fromJson(
              json['EventSubscription'] as Map<String, dynamic>)
          : null,
    );
  }

  factory RemoveSourceIdentifierFromSubscriptionResult.fromXml(
      _s.XmlElement elem) {
    return RemoveSourceIdentifierFromSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let((e) => EventSubscription.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final eventSubscription = this.eventSubscription;
    return {
      if (eventSubscription != null) 'EventSubscription': eventSubscription,
    };
  }
}

class ReservedDBInstance {
  final String? currencyCode;
  final String? dBInstanceClass;
  final int? dBInstanceCount;
  final int? duration;
  final double? fixedPrice;
  final bool? multiAZ;
  final String? offeringType;
  final String? productDescription;
  final List<RecurringCharge>? recurringCharges;
  final String? reservedDBInstanceId;
  final String? reservedDBInstancesOfferingId;
  final DateTime? startTime;
  final String? state;
  final double? usagePrice;

  ReservedDBInstance({
    this.currencyCode,
    this.dBInstanceClass,
    this.dBInstanceCount,
    this.duration,
    this.fixedPrice,
    this.multiAZ,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedDBInstanceId,
    this.reservedDBInstancesOfferingId,
    this.startTime,
    this.state,
    this.usagePrice,
  });

  factory ReservedDBInstance.fromJson(Map<String, dynamic> json) {
    return ReservedDBInstance(
      currencyCode: json['CurrencyCode'] as String?,
      dBInstanceClass: json['DBInstanceClass'] as String?,
      dBInstanceCount: json['DBInstanceCount'] as int?,
      duration: json['Duration'] as int?,
      fixedPrice: json['FixedPrice'] as double?,
      multiAZ: json['MultiAZ'] as bool?,
      offeringType: json['OfferingType'] as String?,
      productDescription: json['ProductDescription'] as String?,
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservedDBInstanceId: json['ReservedDBInstanceId'] as String?,
      reservedDBInstancesOfferingId:
          json['ReservedDBInstancesOfferingId'] as String?,
      startTime: timeStampFromJson(json['StartTime']),
      state: json['State'] as String?,
      usagePrice: json['UsagePrice'] as double?,
    );
  }

  factory ReservedDBInstance.fromXml(_s.XmlElement elem) {
    return ReservedDBInstance(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      dBInstanceCount: _s.extractXmlIntValue(elem, 'DBInstanceCount'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedDBInstanceId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstanceId'),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      startTime: _s.extractXmlDateTimeValue(elem, 'StartTime'),
      state: _s.extractXmlStringValue(elem, 'State'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final dBInstanceClass = this.dBInstanceClass;
    final dBInstanceCount = this.dBInstanceCount;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final multiAZ = this.multiAZ;
    final offeringType = this.offeringType;
    final productDescription = this.productDescription;
    final recurringCharges = this.recurringCharges;
    final reservedDBInstanceId = this.reservedDBInstanceId;
    final reservedDBInstancesOfferingId = this.reservedDBInstancesOfferingId;
    final startTime = this.startTime;
    final state = this.state;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBInstanceCount != null) 'DBInstanceCount': dBInstanceCount,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (offeringType != null) 'OfferingType': offeringType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedDBInstanceId != null)
        'ReservedDBInstanceId': reservedDBInstanceId,
      if (reservedDBInstancesOfferingId != null)
        'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
      if (startTime != null) 'StartTime': unixTimestampToJson(startTime),
      if (state != null) 'State': state,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

class ReservedDBInstanceMessage {
  final String? marker;
  final List<ReservedDBInstance>? reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });

  factory ReservedDBInstanceMessage.fromJson(Map<String, dynamic> json) {
    return ReservedDBInstanceMessage(
      marker: json['Marker'] as String?,
      reservedDBInstances: (json['ReservedDBInstances'] as List?)
          ?.whereNotNull()
          .map((e) => ReservedDBInstance.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ReservedDBInstanceMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstanceMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstances: _s.extractXmlChild(elem, 'ReservedDBInstances')?.let(
          (elem) => elem
              .findElements('ReservedDBInstance')
              .map((c) => ReservedDBInstance.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedDBInstances = this.reservedDBInstances;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedDBInstances != null)
        'ReservedDBInstances': reservedDBInstances,
    };
  }
}

class ReservedDBInstancesOffering {
  final String? currencyCode;
  final String? dBInstanceClass;
  final int? duration;
  final double? fixedPrice;
  final bool? multiAZ;
  final String? offeringType;
  final String? productDescription;
  final List<RecurringCharge>? recurringCharges;
  final String? reservedDBInstancesOfferingId;
  final double? usagePrice;

  ReservedDBInstancesOffering({
    this.currencyCode,
    this.dBInstanceClass,
    this.duration,
    this.fixedPrice,
    this.multiAZ,
    this.offeringType,
    this.productDescription,
    this.recurringCharges,
    this.reservedDBInstancesOfferingId,
    this.usagePrice,
  });

  factory ReservedDBInstancesOffering.fromJson(Map<String, dynamic> json) {
    return ReservedDBInstancesOffering(
      currencyCode: json['CurrencyCode'] as String?,
      dBInstanceClass: json['DBInstanceClass'] as String?,
      duration: json['Duration'] as int?,
      fixedPrice: json['FixedPrice'] as double?,
      multiAZ: json['MultiAZ'] as bool?,
      offeringType: json['OfferingType'] as String?,
      productDescription: json['ProductDescription'] as String?,
      recurringCharges: (json['RecurringCharges'] as List?)
          ?.whereNotNull()
          .map((e) => RecurringCharge.fromJson(e as Map<String, dynamic>))
          .toList(),
      reservedDBInstancesOfferingId:
          json['ReservedDBInstancesOfferingId'] as String?,
      usagePrice: json['UsagePrice'] as double?,
    );
  }

  factory ReservedDBInstancesOffering.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOffering(
      currencyCode: _s.extractXmlStringValue(elem, 'CurrencyCode'),
      dBInstanceClass: _s.extractXmlStringValue(elem, 'DBInstanceClass'),
      duration: _s.extractXmlIntValue(elem, 'Duration'),
      fixedPrice: _s.extractXmlDoubleValue(elem, 'FixedPrice'),
      multiAZ: _s.extractXmlBoolValue(elem, 'MultiAZ'),
      offeringType: _s.extractXmlStringValue(elem, 'OfferingType'),
      productDescription: _s.extractXmlStringValue(elem, 'ProductDescription'),
      recurringCharges: _s.extractXmlChild(elem, 'RecurringCharges')?.let(
          (elem) => elem
              .findElements('RecurringCharge')
              .map((c) => RecurringCharge.fromXml(c))
              .toList()),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }

  Map<String, dynamic> toJson() {
    final currencyCode = this.currencyCode;
    final dBInstanceClass = this.dBInstanceClass;
    final duration = this.duration;
    final fixedPrice = this.fixedPrice;
    final multiAZ = this.multiAZ;
    final offeringType = this.offeringType;
    final productDescription = this.productDescription;
    final recurringCharges = this.recurringCharges;
    final reservedDBInstancesOfferingId = this.reservedDBInstancesOfferingId;
    final usagePrice = this.usagePrice;
    return {
      if (currencyCode != null) 'CurrencyCode': currencyCode,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (duration != null) 'Duration': duration,
      if (fixedPrice != null) 'FixedPrice': fixedPrice,
      if (multiAZ != null) 'MultiAZ': multiAZ,
      if (offeringType != null) 'OfferingType': offeringType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (recurringCharges != null) 'RecurringCharges': recurringCharges,
      if (reservedDBInstancesOfferingId != null)
        'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
      if (usagePrice != null) 'UsagePrice': usagePrice,
    };
  }
}

class ReservedDBInstancesOfferingMessage {
  final String? marker;
  final List<ReservedDBInstancesOffering>? reservedDBInstancesOfferings;

  ReservedDBInstancesOfferingMessage({
    this.marker,
    this.reservedDBInstancesOfferings,
  });

  factory ReservedDBInstancesOfferingMessage.fromJson(
      Map<String, dynamic> json) {
    return ReservedDBInstancesOfferingMessage(
      marker: json['Marker'] as String?,
      reservedDBInstancesOfferings: (json['ReservedDBInstancesOfferings']
              as List?)
          ?.whereNotNull()
          .map((e) =>
              ReservedDBInstancesOffering.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory ReservedDBInstancesOfferingMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOfferingMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstancesOfferings: _s
          .extractXmlChild(elem, 'ReservedDBInstancesOfferings')
          ?.let((elem) => elem
              .findElements('ReservedDBInstancesOffering')
              .map((c) => ReservedDBInstancesOffering.fromXml(c))
              .toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final marker = this.marker;
    final reservedDBInstancesOfferings = this.reservedDBInstancesOfferings;
    return {
      if (marker != null) 'Marker': marker,
      if (reservedDBInstancesOfferings != null)
        'ReservedDBInstancesOfferings': reservedDBInstancesOfferings,
    };
  }
}

class RestoreDBInstanceFromDBSnapshotResult {
  final DBInstance? dBInstance;

  RestoreDBInstanceFromDBSnapshotResult({
    this.dBInstance,
  });

  factory RestoreDBInstanceFromDBSnapshotResult.fromJson(
      Map<String, dynamic> json) {
    return RestoreDBInstanceFromDBSnapshotResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory RestoreDBInstanceFromDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceFromDBSnapshotResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class RestoreDBInstanceToPointInTimeResult {
  final DBInstance? dBInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dBInstance,
  });

  factory RestoreDBInstanceToPointInTimeResult.fromJson(
      Map<String, dynamic> json) {
    return RestoreDBInstanceToPointInTimeResult(
      dBInstance: json['DBInstance'] != null
          ? DBInstance.fromJson(json['DBInstance'] as Map<String, dynamic>)
          : null,
    );
  }

  factory RestoreDBInstanceToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceToPointInTimeResult(
      dBInstance: _s
          .extractXmlChild(elem, 'DBInstance')
          ?.let((e) => DBInstance.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBInstance = this.dBInstance;
    return {
      if (dBInstance != null) 'DBInstance': dBInstance,
    };
  }
}

class RevokeDBSecurityGroupIngressResult {
  final DBSecurityGroup? dBSecurityGroup;

  RevokeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });

  factory RevokeDBSecurityGroupIngressResult.fromJson(
      Map<String, dynamic> json) {
    return RevokeDBSecurityGroupIngressResult(
      dBSecurityGroup: json['DBSecurityGroup'] != null
          ? DBSecurityGroup.fromJson(
              json['DBSecurityGroup'] as Map<String, dynamic>)
          : null,
    );
  }

  factory RevokeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let((e) => DBSecurityGroup.fromXml(e)),
    );
  }

  Map<String, dynamic> toJson() {
    final dBSecurityGroup = this.dBSecurityGroup;
    return {
      if (dBSecurityGroup != null) 'DBSecurityGroup': dBSecurityGroup,
    };
  }
}

enum SourceType {
  dbInstance,
  dbParameterGroup,
  dbSecurityGroup,
  dbSnapshot,
}

extension on SourceType {
  String toValue() {
    switch (this) {
      case SourceType.dbInstance:
        return 'db-instance';
      case SourceType.dbParameterGroup:
        return 'db-parameter-group';
      case SourceType.dbSecurityGroup:
        return 'db-security-group';
      case SourceType.dbSnapshot:
        return 'db-snapshot';
    }
  }
}

extension on String {
  SourceType toSourceType() {
    switch (this) {
      case 'db-instance':
        return SourceType.dbInstance;
      case 'db-parameter-group':
        return SourceType.dbParameterGroup;
      case 'db-security-group':
        return SourceType.dbSecurityGroup;
      case 'db-snapshot':
        return SourceType.dbSnapshot;
    }
    throw Exception('$this is not known in enum SourceType');
  }
}

class Subnet {
  final AvailabilityZone? subnetAvailabilityZone;
  final String? subnetIdentifier;
  final String? subnetStatus;

  Subnet({
    this.subnetAvailabilityZone,
    this.subnetIdentifier,
    this.subnetStatus,
  });

  factory Subnet.fromJson(Map<String, dynamic> json) {
    return Subnet(
      subnetAvailabilityZone: json['SubnetAvailabilityZone'] != null
          ? AvailabilityZone.fromJson(
              json['SubnetAvailabilityZone'] as Map<String, dynamic>)
          : null,
      subnetIdentifier: json['SubnetIdentifier'] as String?,
      subnetStatus: json['SubnetStatus'] as String?,
    );
  }

  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let((e) => AvailabilityZone.fromXml(e)),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetStatus: _s.extractXmlStringValue(elem, 'SubnetStatus'),
    );
  }

  Map<String, dynamic> toJson() {
    final subnetAvailabilityZone = this.subnetAvailabilityZone;
    final subnetIdentifier = this.subnetIdentifier;
    final subnetStatus = this.subnetStatus;
    return {
      if (subnetAvailabilityZone != null)
        'SubnetAvailabilityZone': subnetAvailabilityZone,
      if (subnetIdentifier != null) 'SubnetIdentifier': subnetIdentifier,
      if (subnetStatus != null) 'SubnetStatus': subnetStatus,
    };
  }
}

class Tag {
  final String? key;
  final String? value;

  Tag({
    this.key,
    this.value,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      key: json['Key'] as String?,
      value: json['Value'] as String?,
    );
  }

  factory Tag.fromXml(_s.XmlElement elem) {
    return Tag(
      key: _s.extractXmlStringValue(elem, 'Key'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final key = this.key;
    final value = this.value;
    return {
      if (key != null) 'Key': key,
      if (value != null) 'Value': value,
    };
  }
}

class TagListMessage {
  final List<Tag>? tagList;

  TagListMessage({
    this.tagList,
  });

  factory TagListMessage.fromJson(Map<String, dynamic> json) {
    return TagListMessage(
      tagList: (json['TagList'] as List?)
          ?.whereNotNull()
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  factory TagListMessage.fromXml(_s.XmlElement elem) {
    return TagListMessage(
      tagList: _s.extractXmlChild(elem, 'TagList')?.let((elem) =>
          elem.findElements('Tag').map((c) => Tag.fromXml(c)).toList()),
    );
  }

  Map<String, dynamic> toJson() {
    final tagList = this.tagList;
    return {
      if (tagList != null) 'TagList': tagList,
    };
  }
}

class VpcSecurityGroupMembership {
  final String? status;
  final String? vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });

  factory VpcSecurityGroupMembership.fromJson(Map<String, dynamic> json) {
    return VpcSecurityGroupMembership(
      status: json['Status'] as String?,
      vpcSecurityGroupId: json['VpcSecurityGroupId'] as String?,
    );
  }

  factory VpcSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return VpcSecurityGroupMembership(
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcSecurityGroupId: _s.extractXmlStringValue(elem, 'VpcSecurityGroupId'),
    );
  }

  Map<String, dynamic> toJson() {
    final status = this.status;
    final vpcSecurityGroupId = this.vpcSecurityGroupId;
    return {
      if (status != null) 'Status': status,
      if (vpcSecurityGroupId != null) 'VpcSecurityGroupId': vpcSecurityGroupId,
    };
  }
}

class AuthorizationAlreadyExistsFault extends _s.GenericAwsException {
  AuthorizationAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationAlreadyExistsFault',
            message: message);
}

class AuthorizationNotFoundFault extends _s.GenericAwsException {
  AuthorizationNotFoundFault({String? type, String? message})
      : super(type: type, code: 'AuthorizationNotFoundFault', message: message);
}

class AuthorizationQuotaExceededFault extends _s.GenericAwsException {
  AuthorizationQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'AuthorizationQuotaExceededFault',
            message: message);
}

class DBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  DBInstanceAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'DBInstanceAlreadyExistsFault', message: message);
}

class DBInstanceNotFoundFault extends _s.GenericAwsException {
  DBInstanceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBInstanceNotFoundFault', message: message);
}

class DBParameterGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBParameterGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBParameterGroupAlreadyExistsFault',
            message: message);
}

class DBParameterGroupNotFoundFault extends _s.GenericAwsException {
  DBParameterGroupNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBParameterGroupNotFoundFault',
            message: message);
}

class DBParameterGroupQuotaExceededFault extends _s.GenericAwsException {
  DBParameterGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBParameterGroupQuotaExceededFault',
            message: message);
}

class DBSecurityGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSecurityGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSecurityGroupAlreadyExistsFault',
            message: message);
}

class DBSecurityGroupNotFoundFault extends _s.GenericAwsException {
  DBSecurityGroupNotFoundFault({String? type, String? message})
      : super(
            type: type, code: 'DBSecurityGroupNotFoundFault', message: message);
}

class DBSecurityGroupNotSupportedFault extends _s.GenericAwsException {
  DBSecurityGroupNotSupportedFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSecurityGroupNotSupportedFault',
            message: message);
}

class DBSecurityGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSecurityGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSecurityGroupQuotaExceededFault',
            message: message);
}

class DBSnapshotAlreadyExistsFault extends _s.GenericAwsException {
  DBSnapshotAlreadyExistsFault({String? type, String? message})
      : super(
            type: type, code: 'DBSnapshotAlreadyExistsFault', message: message);
}

class DBSnapshotNotFoundFault extends _s.GenericAwsException {
  DBSnapshotNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBSnapshotNotFoundFault', message: message);
}

class DBSubnetGroupAlreadyExistsFault extends _s.GenericAwsException {
  DBSubnetGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSubnetGroupAlreadyExistsFault',
            message: message);
}

class DBSubnetGroupDoesNotCoverEnoughAZs extends _s.GenericAwsException {
  DBSubnetGroupDoesNotCoverEnoughAZs({String? type, String? message})
      : super(
            type: type,
            code: 'DBSubnetGroupDoesNotCoverEnoughAZs',
            message: message);
}

class DBSubnetGroupNotFoundFault extends _s.GenericAwsException {
  DBSubnetGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBSubnetGroupNotFoundFault', message: message);
}

class DBSubnetGroupQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBSubnetGroupQuotaExceededFault',
            message: message);
}

class DBSubnetQuotaExceededFault extends _s.GenericAwsException {
  DBSubnetQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'DBSubnetQuotaExceededFault', message: message);
}

class DBUpgradeDependencyFailureFault extends _s.GenericAwsException {
  DBUpgradeDependencyFailureFault({String? type, String? message})
      : super(
            type: type,
            code: 'DBUpgradeDependencyFailureFault',
            message: message);
}

class EventSubscriptionQuotaExceededFault extends _s.GenericAwsException {
  EventSubscriptionQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'EventSubscriptionQuotaExceededFault',
            message: message);
}

class InstanceQuotaExceededFault extends _s.GenericAwsException {
  InstanceQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'InstanceQuotaExceededFault', message: message);
}

class InsufficientDBInstanceCapacityFault extends _s.GenericAwsException {
  InsufficientDBInstanceCapacityFault({String? type, String? message})
      : super(
            type: type,
            code: 'InsufficientDBInstanceCapacityFault',
            message: message);
}

class InvalidDBInstanceStateFault extends _s.GenericAwsException {
  InvalidDBInstanceStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidDBInstanceStateFault', message: message);
}

class InvalidDBParameterGroupStateFault extends _s.GenericAwsException {
  InvalidDBParameterGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBParameterGroupStateFault',
            message: message);
}

class InvalidDBSecurityGroupStateFault extends _s.GenericAwsException {
  InvalidDBSecurityGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBSecurityGroupStateFault',
            message: message);
}

class InvalidDBSnapshotStateFault extends _s.GenericAwsException {
  InvalidDBSnapshotStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidDBSnapshotStateFault', message: message);
}

class InvalidDBSubnetGroupStateFault extends _s.GenericAwsException {
  InvalidDBSubnetGroupStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidDBSubnetGroupStateFault',
            message: message);
}

class InvalidDBSubnetStateFault extends _s.GenericAwsException {
  InvalidDBSubnetStateFault({String? type, String? message})
      : super(type: type, code: 'InvalidDBSubnetStateFault', message: message);
}

class InvalidEventSubscriptionStateFault extends _s.GenericAwsException {
  InvalidEventSubscriptionStateFault({String? type, String? message})
      : super(
            type: type,
            code: 'InvalidEventSubscriptionStateFault',
            message: message);
}

class InvalidOptionGroupStateFault extends _s.GenericAwsException {
  InvalidOptionGroupStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidOptionGroupStateFault', message: message);
}

class InvalidRestoreFault extends _s.GenericAwsException {
  InvalidRestoreFault({String? type, String? message})
      : super(type: type, code: 'InvalidRestoreFault', message: message);
}

class InvalidSubnet extends _s.GenericAwsException {
  InvalidSubnet({String? type, String? message})
      : super(type: type, code: 'InvalidSubnet', message: message);
}

class InvalidVPCNetworkStateFault extends _s.GenericAwsException {
  InvalidVPCNetworkStateFault({String? type, String? message})
      : super(
            type: type, code: 'InvalidVPCNetworkStateFault', message: message);
}

class OptionGroupAlreadyExistsFault extends _s.GenericAwsException {
  OptionGroupAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'OptionGroupAlreadyExistsFault',
            message: message);
}

class OptionGroupNotFoundFault extends _s.GenericAwsException {
  OptionGroupNotFoundFault({String? type, String? message})
      : super(type: type, code: 'OptionGroupNotFoundFault', message: message);
}

class OptionGroupQuotaExceededFault extends _s.GenericAwsException {
  OptionGroupQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'OptionGroupQuotaExceededFault',
            message: message);
}

class PointInTimeRestoreNotEnabledFault extends _s.GenericAwsException {
  PointInTimeRestoreNotEnabledFault({String? type, String? message})
      : super(
            type: type,
            code: 'PointInTimeRestoreNotEnabledFault',
            message: message);
}

class ProvisionedIopsNotAvailableInAZFault extends _s.GenericAwsException {
  ProvisionedIopsNotAvailableInAZFault({String? type, String? message})
      : super(
            type: type,
            code: 'ProvisionedIopsNotAvailableInAZFault',
            message: message);
}

class ReservedDBInstanceAlreadyExistsFault extends _s.GenericAwsException {
  ReservedDBInstanceAlreadyExistsFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstanceAlreadyExistsFault',
            message: message);
}

class ReservedDBInstanceNotFoundFault extends _s.GenericAwsException {
  ReservedDBInstanceNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstanceNotFoundFault',
            message: message);
}

class ReservedDBInstanceQuotaExceededFault extends _s.GenericAwsException {
  ReservedDBInstanceQuotaExceededFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstanceQuotaExceededFault',
            message: message);
}

class ReservedDBInstancesOfferingNotFoundFault extends _s.GenericAwsException {
  ReservedDBInstancesOfferingNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'ReservedDBInstancesOfferingNotFoundFault',
            message: message);
}

class SNSInvalidTopicFault extends _s.GenericAwsException {
  SNSInvalidTopicFault({String? type, String? message})
      : super(type: type, code: 'SNSInvalidTopicFault', message: message);
}

class SNSNoAuthorizationFault extends _s.GenericAwsException {
  SNSNoAuthorizationFault({String? type, String? message})
      : super(type: type, code: 'SNSNoAuthorizationFault', message: message);
}

class SNSTopicArnNotFoundFault extends _s.GenericAwsException {
  SNSTopicArnNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SNSTopicArnNotFoundFault', message: message);
}

class SnapshotQuotaExceededFault extends _s.GenericAwsException {
  SnapshotQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'SnapshotQuotaExceededFault', message: message);
}

class SourceNotFoundFault extends _s.GenericAwsException {
  SourceNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SourceNotFoundFault', message: message);
}

class StorageQuotaExceededFault extends _s.GenericAwsException {
  StorageQuotaExceededFault({String? type, String? message})
      : super(type: type, code: 'StorageQuotaExceededFault', message: message);
}

class SubnetAlreadyInUse extends _s.GenericAwsException {
  SubnetAlreadyInUse({String? type, String? message})
      : super(type: type, code: 'SubnetAlreadyInUse', message: message);
}

class SubscriptionAlreadyExistFault extends _s.GenericAwsException {
  SubscriptionAlreadyExistFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionAlreadyExistFault',
            message: message);
}

class SubscriptionCategoryNotFoundFault extends _s.GenericAwsException {
  SubscriptionCategoryNotFoundFault({String? type, String? message})
      : super(
            type: type,
            code: 'SubscriptionCategoryNotFoundFault',
            message: message);
}

class SubscriptionNotFoundFault extends _s.GenericAwsException {
  SubscriptionNotFoundFault({String? type, String? message})
      : super(type: type, code: 'SubscriptionNotFoundFault', message: message);
}

final _exceptionFns = <String, _s.AwsExceptionFn>{
  'AuthorizationAlreadyExistsFault': (type, message) =>
      AuthorizationAlreadyExistsFault(type: type, message: message),
  'AuthorizationNotFoundFault': (type, message) =>
      AuthorizationNotFoundFault(type: type, message: message),
  'AuthorizationQuotaExceededFault': (type, message) =>
      AuthorizationQuotaExceededFault(type: type, message: message),
  'DBInstanceAlreadyExistsFault': (type, message) =>
      DBInstanceAlreadyExistsFault(type: type, message: message),
  'DBInstanceNotFoundFault': (type, message) =>
      DBInstanceNotFoundFault(type: type, message: message),
  'DBParameterGroupAlreadyExistsFault': (type, message) =>
      DBParameterGroupAlreadyExistsFault(type: type, message: message),
  'DBParameterGroupNotFoundFault': (type, message) =>
      DBParameterGroupNotFoundFault(type: type, message: message),
  'DBParameterGroupQuotaExceededFault': (type, message) =>
      DBParameterGroupQuotaExceededFault(type: type, message: message),
  'DBSecurityGroupAlreadyExistsFault': (type, message) =>
      DBSecurityGroupAlreadyExistsFault(type: type, message: message),
  'DBSecurityGroupNotFoundFault': (type, message) =>
      DBSecurityGroupNotFoundFault(type: type, message: message),
  'DBSecurityGroupNotSupportedFault': (type, message) =>
      DBSecurityGroupNotSupportedFault(type: type, message: message),
  'DBSecurityGroupQuotaExceededFault': (type, message) =>
      DBSecurityGroupQuotaExceededFault(type: type, message: message),
  'DBSnapshotAlreadyExistsFault': (type, message) =>
      DBSnapshotAlreadyExistsFault(type: type, message: message),
  'DBSnapshotNotFoundFault': (type, message) =>
      DBSnapshotNotFoundFault(type: type, message: message),
  'DBSubnetGroupAlreadyExistsFault': (type, message) =>
      DBSubnetGroupAlreadyExistsFault(type: type, message: message),
  'DBSubnetGroupDoesNotCoverEnoughAZs': (type, message) =>
      DBSubnetGroupDoesNotCoverEnoughAZs(type: type, message: message),
  'DBSubnetGroupNotFoundFault': (type, message) =>
      DBSubnetGroupNotFoundFault(type: type, message: message),
  'DBSubnetGroupQuotaExceededFault': (type, message) =>
      DBSubnetGroupQuotaExceededFault(type: type, message: message),
  'DBSubnetQuotaExceededFault': (type, message) =>
      DBSubnetQuotaExceededFault(type: type, message: message),
  'DBUpgradeDependencyFailureFault': (type, message) =>
      DBUpgradeDependencyFailureFault(type: type, message: message),
  'EventSubscriptionQuotaExceededFault': (type, message) =>
      EventSubscriptionQuotaExceededFault(type: type, message: message),
  'InstanceQuotaExceededFault': (type, message) =>
      InstanceQuotaExceededFault(type: type, message: message),
  'InsufficientDBInstanceCapacityFault': (type, message) =>
      InsufficientDBInstanceCapacityFault(type: type, message: message),
  'InvalidDBInstanceStateFault': (type, message) =>
      InvalidDBInstanceStateFault(type: type, message: message),
  'InvalidDBParameterGroupStateFault': (type, message) =>
      InvalidDBParameterGroupStateFault(type: type, message: message),
  'InvalidDBSecurityGroupStateFault': (type, message) =>
      InvalidDBSecurityGroupStateFault(type: type, message: message),
  'InvalidDBSnapshotStateFault': (type, message) =>
      InvalidDBSnapshotStateFault(type: type, message: message),
  'InvalidDBSubnetGroupStateFault': (type, message) =>
      InvalidDBSubnetGroupStateFault(type: type, message: message),
  'InvalidDBSubnetStateFault': (type, message) =>
      InvalidDBSubnetStateFault(type: type, message: message),
  'InvalidEventSubscriptionStateFault': (type, message) =>
      InvalidEventSubscriptionStateFault(type: type, message: message),
  'InvalidOptionGroupStateFault': (type, message) =>
      InvalidOptionGroupStateFault(type: type, message: message),
  'InvalidRestoreFault': (type, message) =>
      InvalidRestoreFault(type: type, message: message),
  'InvalidSubnet': (type, message) =>
      InvalidSubnet(type: type, message: message),
  'InvalidVPCNetworkStateFault': (type, message) =>
      InvalidVPCNetworkStateFault(type: type, message: message),
  'OptionGroupAlreadyExistsFault': (type, message) =>
      OptionGroupAlreadyExistsFault(type: type, message: message),
  'OptionGroupNotFoundFault': (type, message) =>
      OptionGroupNotFoundFault(type: type, message: message),
  'OptionGroupQuotaExceededFault': (type, message) =>
      OptionGroupQuotaExceededFault(type: type, message: message),
  'PointInTimeRestoreNotEnabledFault': (type, message) =>
      PointInTimeRestoreNotEnabledFault(type: type, message: message),
  'ProvisionedIopsNotAvailableInAZFault': (type, message) =>
      ProvisionedIopsNotAvailableInAZFault(type: type, message: message),
  'ReservedDBInstanceAlreadyExistsFault': (type, message) =>
      ReservedDBInstanceAlreadyExistsFault(type: type, message: message),
  'ReservedDBInstanceNotFoundFault': (type, message) =>
      ReservedDBInstanceNotFoundFault(type: type, message: message),
  'ReservedDBInstanceQuotaExceededFault': (type, message) =>
      ReservedDBInstanceQuotaExceededFault(type: type, message: message),
  'ReservedDBInstancesOfferingNotFoundFault': (type, message) =>
      ReservedDBInstancesOfferingNotFoundFault(type: type, message: message),
  'SNSInvalidTopicFault': (type, message) =>
      SNSInvalidTopicFault(type: type, message: message),
  'SNSNoAuthorizationFault': (type, message) =>
      SNSNoAuthorizationFault(type: type, message: message),
  'SNSTopicArnNotFoundFault': (type, message) =>
      SNSTopicArnNotFoundFault(type: type, message: message),
  'SnapshotQuotaExceededFault': (type, message) =>
      SnapshotQuotaExceededFault(type: type, message: message),
  'SourceNotFoundFault': (type, message) =>
      SourceNotFoundFault(type: type, message: message),
  'StorageQuotaExceededFault': (type, message) =>
      StorageQuotaExceededFault(type: type, message: message),
  'SubnetAlreadyInUse': (type, message) =>
      SubnetAlreadyInUse(type: type, message: message),
  'SubscriptionAlreadyExistFault': (type, message) =>
      SubscriptionAlreadyExistFault(type: type, message: message),
  'SubscriptionCategoryNotFoundFault': (type, message) =>
      SubscriptionCategoryNotFoundFault(type: type, message: message),
  'SubscriptionNotFoundFault': (type, message) =>
      SubscriptionNotFoundFault(type: type, message: message),
};
