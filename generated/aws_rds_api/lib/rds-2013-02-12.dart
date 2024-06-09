// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: unused_element
// ignore_for_file: unused_field
// ignore_for_file: unused_import
// ignore_for_file: unused_local_variable
// ignore_for_file: unused_shown_name

import 'dart:convert';
import 'dart:typed_data';

import 'package:shared_aws_api/shared.dart' as _s;
import 'package:shared_aws_api/shared.dart'
    show
        rfc822ToJson,
        iso8601ToJson,
        unixTimestampToJson,
        nonNullableTimeStampFromJson,
        timeStampFromJson;

export 'package:shared_aws_api/shared.dart' show AwsClientCredentials;

class RDS {
  final _s.QueryProtocol _protocol;

  RDS({
    required String region,
    _s.AwsClientCredentials? credentials,
    _s.AwsClientCredentialsProvider? credentialsProvider,
    _s.Client? client,
    String? endpointUrl,
  }) : _protocol = _s.QueryProtocol(
          client: client,
          service: _s.ServiceMetadata(
            endpointPrefix: 'rds',
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

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [SourceNotFoundFault].
  Future<AddSourceIdentifierToSubscriptionResult>
      addSourceIdentifierToSubscription({
    required String sourceIdentifier,
    required String subscriptionName,
  }) async {
    final $request = <String, String>{
      'SourceIdentifier': sourceIdentifier,
      'SubscriptionName': subscriptionName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'AddSourceIdentifierToSubscription',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'ResourceName': resourceName,
      if (tags.isEmpty)
        'Tags': ''
      else
        for (var i1 = 0; i1 < tags.length; i1++)
          for (var e3 in tags[i1].toQueryMap().entries)
            'Tags.Tag.${i1 + 1}.${e3.key}': e3.value,
    };
    await _protocol.send(
      $request,
      action: 'AddTagsToResource',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBSecurityGroupName': dBSecurityGroupName,
      if (cidrip != null) 'CIDRIP': cidrip,
      if (eC2SecurityGroupId != null) 'EC2SecurityGroupId': eC2SecurityGroupId,
      if (eC2SecurityGroupName != null)
        'EC2SecurityGroupName': eC2SecurityGroupName,
      if (eC2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': eC2SecurityGroupOwnerId,
    };
    final $result = await _protocol.send(
      $request,
      action: 'AuthorizeDBSecurityGroupIngress',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'SourceDBSnapshotIdentifier': sourceDBSnapshotIdentifier,
      'TargetDBSnapshotIdentifier': targetDBSnapshotIdentifier,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CopyDBSnapshot',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'AllocatedStorage': allocatedStorage.toString(),
      'DBInstanceClass': dBInstanceClass,
      'DBInstanceIdentifier': dBInstanceIdentifier,
      'Engine': engine,
      'MasterUserPassword': masterUserPassword,
      'MasterUsername': masterUsername,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade.toString(),
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod.toString(),
      if (characterSetName != null) 'CharacterSetName': characterSetName,
      if (dBName != null) 'DBName': dBName,
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
      if (dBSecurityGroups != null)
        if (dBSecurityGroups.isEmpty)
          'DBSecurityGroups': ''
        else
          for (var i1 = 0; i1 < dBSecurityGroups.length; i1++)
            'DBSecurityGroups.DBSecurityGroupName.${i1 + 1}':
                dBSecurityGroups[i1],
      if (dBSubnetGroupName != null) 'DBSubnetGroupName': dBSubnetGroupName,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iops != null) 'Iops': iops.toString(),
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (multiAZ != null) 'MultiAZ': multiAZ.toString(),
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (port != null) 'Port': port.toString(),
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (publiclyAccessible != null)
        'PubliclyAccessible': publiclyAccessible.toString(),
      if (vpcSecurityGroupIds != null)
        if (vpcSecurityGroupIds.isEmpty)
          'VpcSecurityGroupIds': ''
        else
          for (var i1 = 0; i1 < vpcSecurityGroupIds.length; i1++)
            'VpcSecurityGroupIds.VpcSecurityGroupId.${i1 + 1}':
                vpcSecurityGroupIds[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstance',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      'SourceDBInstanceIdentifier': sourceDBInstanceIdentifier,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade.toString(),
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (iops != null) 'Iops': iops.toString(),
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (port != null) 'Port': port.toString(),
      if (publiclyAccessible != null)
        'PubliclyAccessible': publiclyAccessible.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBInstanceReadReplica',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBParameterGroupFamily': dBParameterGroupFamily,
      'DBParameterGroupName': dBParameterGroupName,
      'Description': description,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBParameterGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBSecurityGroupDescription': dBSecurityGroupDescription,
      'DBSecurityGroupName': dBSecurityGroupName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSecurityGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      'DBSnapshotIdentifier': dBSnapshotIdentifier,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSnapshot',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBSubnetGroupDescription': dBSubnetGroupDescription,
      'DBSubnetGroupName': dBSubnetGroupName,
      if (subnetIds.isEmpty)
        'SubnetIds': ''
      else
        for (var i1 = 0; i1 < subnetIds.length; i1++)
          'SubnetIds.SubnetIdentifier.${i1 + 1}': subnetIds[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateDBSubnetGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'SnsTopicArn': snsTopicArn,
      'SubscriptionName': subscriptionName,
      if (enabled != null) 'Enabled': enabled.toString(),
      if (eventCategories != null)
        if (eventCategories.isEmpty)
          'EventCategories': ''
        else
          for (var i1 = 0; i1 < eventCategories.length; i1++)
            'EventCategories.EventCategory.${i1 + 1}': eventCategories[i1],
      if (sourceIds != null)
        if (sourceIds.isEmpty)
          'SourceIds': ''
        else
          for (var i1 = 0; i1 < sourceIds.length; i1++)
            'SourceIds.SourceId.${i1 + 1}': sourceIds[i1],
      if (sourceType != null) 'SourceType': sourceType,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateEventSubscription',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'EngineName': engineName,
      'MajorEngineVersion': majorEngineVersion,
      'OptionGroupDescription': optionGroupDescription,
      'OptionGroupName': optionGroupName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'CreateOptionGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      if (finalDBSnapshotIdentifier != null)
        'FinalDBSnapshotIdentifier': finalDBSnapshotIdentifier,
      if (skipFinalSnapshot != null)
        'SkipFinalSnapshot': skipFinalSnapshot.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBInstance',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBParameterGroupName': dBParameterGroupName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteDBParameterGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [InvalidDBSecurityGroupStateFault].
  /// May throw [DBSecurityGroupNotFoundFault].
  Future<void> deleteDBSecurityGroup({
    required String dBSecurityGroupName,
  }) async {
    final $request = <String, String>{
      'DBSecurityGroupName': dBSecurityGroupName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteDBSecurityGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [InvalidDBSnapshotStateFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<DeleteDBSnapshotResult> deleteDBSnapshot({
    required String dBSnapshotIdentifier,
  }) async {
    final $request = <String, String>{
      'DBSnapshotIdentifier': dBSnapshotIdentifier,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DeleteDBSnapshot',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBSubnetGroupName': dBSubnetGroupName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteDBSubnetGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
    );
  }

  ///
  /// May throw [SubscriptionNotFoundFault].
  /// May throw [InvalidEventSubscriptionStateFault].
  Future<DeleteEventSubscriptionResult> deleteEventSubscription({
    required String subscriptionName,
  }) async {
    final $request = <String, String>{
      'SubscriptionName': subscriptionName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DeleteEventSubscription',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'OptionGroupName': optionGroupName,
    };
    await _protocol.send(
      $request,
      action: 'DeleteOptionGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBParameterGroupFamily != null)
        'DBParameterGroupFamily': dBParameterGroupFamily,
      if (defaultOnly != null) 'DefaultOnly': defaultOnly.toString(),
      if (engine != null) 'Engine': engine,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (listSupportedCharacterSets != null)
        'ListSupportedCharacterSets': listSupportedCharacterSets.toString(),
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBEngineVersions',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBInstances',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBInstancesResult',
    );
    return DBInstanceMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  Future<DescribeDBLogFilesResponse> describeDBLogFiles({
    required String dBInstanceIdentifier,
    int? fileLastWritten,
    int? fileSize,
    String? filenameContains,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      if (fileLastWritten != null)
        'FileLastWritten': fileLastWritten.toString(),
      if (fileSize != null) 'FileSize': fileSize.toString(),
      if (filenameContains != null) 'FilenameContains': filenameContains,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBLogFiles',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeDBLogFilesResult',
    );
    return DescribeDBLogFilesResponse.fromXml($result);
  }

  ///
  /// May throw [DBParameterGroupNotFoundFault].
  Future<DBParameterGroupsMessage> describeDBParameterGroups({
    String? dBParameterGroupName,
    String? marker,
    int? maxRecords,
  }) async {
    final $request = <String, String>{
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameterGroups',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBParameterGroupName': dBParameterGroupName,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (source != null) 'Source': source,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBParameters',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBSecurityGroupName != null)
        'DBSecurityGroupName': dBSecurityGroupName,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSecurityGroups',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBInstanceIdentifier != null)
        'DBInstanceIdentifier': dBInstanceIdentifier,
      if (dBSnapshotIdentifier != null)
        'DBSnapshotIdentifier': dBSnapshotIdentifier,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (snapshotType != null) 'SnapshotType': snapshotType,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSnapshots',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBSubnetGroupName != null) 'DBSubnetGroupName': dBSubnetGroupName,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeDBSubnetGroups',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBParameterGroupFamily': dBParameterGroupFamily,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEngineDefaultParameters',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeEngineDefaultParametersResult',
    );
    return DescribeEngineDefaultParametersResult.fromXml($result);
  }

  Future<EventCategoriesMessage> describeEventCategories({
    String? sourceType,
  }) async {
    final $request = <String, String>{
      if (sourceType != null) 'SourceType': sourceType,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventCategories',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (subscriptionName != null) 'SubscriptionName': subscriptionName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEventSubscriptions',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (duration != null) 'Duration': duration.toString(),
      if (endTime != null) 'EndTime': _s.iso8601ToJson(endTime),
      if (eventCategories != null)
        if (eventCategories.isEmpty)
          'EventCategories': ''
        else
          for (var i1 = 0; i1 < eventCategories.length; i1++)
            'EventCategories.EventCategory.${i1 + 1}': eventCategories[i1],
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (sourceIdentifier != null) 'SourceIdentifier': sourceIdentifier,
      if (sourceType != null) 'SourceType': sourceType.value,
      if (startTime != null) 'StartTime': _s.iso8601ToJson(startTime),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeEvents',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'EngineName': engineName,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOptionGroupOptions',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (engineName != null) 'EngineName': engineName,
      if (majorEngineVersion != null) 'MajorEngineVersion': majorEngineVersion,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOptionGroups',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'Engine': engine,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (vpc != null) 'Vpc': vpc.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeOrderableDBInstanceOptions',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (duration != null) 'Duration': duration,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (multiAZ != null) 'MultiAZ': multiAZ.toString(),
      if (offeringType != null) 'OfferingType': offeringType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (reservedDBInstanceId != null)
        'ReservedDBInstanceId': reservedDBInstanceId,
      if (reservedDBInstancesOfferingId != null)
        'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedDBInstances',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (duration != null) 'Duration': duration,
      if (marker != null) 'Marker': marker,
      if (maxRecords != null) 'MaxRecords': maxRecords.toString(),
      if (multiAZ != null) 'MultiAZ': multiAZ.toString(),
      if (offeringType != null) 'OfferingType': offeringType,
      if (productDescription != null) 'ProductDescription': productDescription,
      if (reservedDBInstancesOfferingId != null)
        'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
    };
    final $result = await _protocol.send(
      $request,
      action: 'DescribeReservedDBInstancesOfferings',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DescribeReservedDBInstancesOfferingsResult',
    );
    return ReservedDBInstancesOfferingMessage.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBLogFileNotFoundFault].
  Future<DownloadDBLogFilePortionDetails> downloadDBLogFilePortion({
    required String dBInstanceIdentifier,
    required String logFileName,
    String? marker,
    int? numberOfLines,
  }) async {
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      'LogFileName': logFileName,
      if (marker != null) 'Marker': marker,
      if (numberOfLines != null) 'NumberOfLines': numberOfLines.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'DownloadDBLogFilePortion',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
      resultWrapper: 'DownloadDBLogFilePortionResult',
    );
    return DownloadDBLogFilePortionDetails.fromXml($result);
  }

  ///
  /// May throw [DBInstanceNotFoundFault].
  /// May throw [DBSnapshotNotFoundFault].
  Future<TagListMessage> listTagsForResource({
    required String resourceName,
  }) async {
    final $request = <String, String>{
      'ResourceName': resourceName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ListTagsForResource',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      if (allocatedStorage != null)
        'AllocatedStorage': allocatedStorage.toString(),
      if (allowMajorVersionUpgrade != null)
        'AllowMajorVersionUpgrade': allowMajorVersionUpgrade.toString(),
      if (applyImmediately != null)
        'ApplyImmediately': applyImmediately.toString(),
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade.toString(),
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod.toString(),
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBParameterGroupName != null)
        'DBParameterGroupName': dBParameterGroupName,
      if (dBSecurityGroups != null)
        if (dBSecurityGroups.isEmpty)
          'DBSecurityGroups': ''
        else
          for (var i1 = 0; i1 < dBSecurityGroups.length; i1++)
            'DBSecurityGroups.DBSecurityGroupName.${i1 + 1}':
                dBSecurityGroups[i1],
      if (engineVersion != null) 'EngineVersion': engineVersion,
      if (iops != null) 'Iops': iops.toString(),
      if (masterUserPassword != null) 'MasterUserPassword': masterUserPassword,
      if (multiAZ != null) 'MultiAZ': multiAZ.toString(),
      if (newDBInstanceIdentifier != null)
        'NewDBInstanceIdentifier': newDBInstanceIdentifier,
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
      if (preferredMaintenanceWindow != null)
        'PreferredMaintenanceWindow': preferredMaintenanceWindow,
      if (vpcSecurityGroupIds != null)
        if (vpcSecurityGroupIds.isEmpty)
          'VpcSecurityGroupIds': ''
        else
          for (var i1 = 0; i1 < vpcSecurityGroupIds.length; i1++)
            'VpcSecurityGroupIds.VpcSecurityGroupId.${i1 + 1}':
                vpcSecurityGroupIds[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBInstance',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBParameterGroupName': dBParameterGroupName,
      if (parameters.isEmpty)
        'Parameters': ''
      else
        for (var i1 = 0; i1 < parameters.length; i1++)
          for (var e3 in parameters[i1].toQueryMap().entries)
            'Parameters.Parameter.${i1 + 1}.${e3.key}': e3.value,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBParameterGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBSubnetGroupName': dBSubnetGroupName,
      if (subnetIds.isEmpty)
        'SubnetIds': ''
      else
        for (var i1 = 0; i1 < subnetIds.length; i1++)
          'SubnetIds.SubnetIdentifier.${i1 + 1}': subnetIds[i1],
      if (dBSubnetGroupDescription != null)
        'DBSubnetGroupDescription': dBSubnetGroupDescription,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ModifyDBSubnetGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'SubscriptionName': subscriptionName,
      if (enabled != null) 'Enabled': enabled.toString(),
      if (eventCategories != null)
        if (eventCategories.isEmpty)
          'EventCategories': ''
        else
          for (var i1 = 0; i1 < eventCategories.length; i1++)
            'EventCategories.EventCategory.${i1 + 1}': eventCategories[i1],
      if (snsTopicArn != null) 'SnsTopicArn': snsTopicArn,
      if (sourceType != null) 'SourceType': sourceType,
    };
    final $result = await _protocol.send(
      $request,
      action: 'ModifyEventSubscription',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'OptionGroupName': optionGroupName,
      if (applyImmediately != null)
        'ApplyImmediately': applyImmediately.toString(),
      if (optionsToInclude != null)
        if (optionsToInclude.isEmpty)
          'OptionsToInclude': ''
        else
          for (var i1 = 0; i1 < optionsToInclude.length; i1++)
            for (var e3 in optionsToInclude[i1].toQueryMap().entries)
              'OptionsToInclude.OptionConfiguration.${i1 + 1}.${e3.key}':
                  e3.value,
      if (optionsToRemove != null)
        if (optionsToRemove.isEmpty)
          'OptionsToRemove': ''
        else
          for (var i1 = 0; i1 < optionsToRemove.length; i1++)
            'OptionsToRemove.member.${i1 + 1}': optionsToRemove[i1],
    };
    final $result = await _protocol.send(
      $request,
      action: 'ModifyOptionGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      if (backupRetentionPeriod != null)
        'BackupRetentionPeriod': backupRetentionPeriod.toString(),
      if (preferredBackupWindow != null)
        'PreferredBackupWindow': preferredBackupWindow,
    };
    final $result = await _protocol.send(
      $request,
      action: 'PromoteReadReplica',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'ReservedDBInstancesOfferingId': reservedDBInstancesOfferingId,
      if (dBInstanceCount != null)
        'DBInstanceCount': dBInstanceCount.toString(),
      if (reservedDBInstanceId != null)
        'ReservedDBInstanceId': reservedDBInstanceId,
    };
    final $result = await _protocol.send(
      $request,
      action: 'PurchaseReservedDBInstancesOffering',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      if (forceFailover != null) 'ForceFailover': forceFailover.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'RebootDBInstance',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'SourceIdentifier': sourceIdentifier,
      'SubscriptionName': subscriptionName,
    };
    final $result = await _protocol.send(
      $request,
      action: 'RemoveSourceIdentifierFromSubscription',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'ResourceName': resourceName,
      if (tagKeys.isEmpty)
        'TagKeys': ''
      else
        for (var i1 = 0; i1 < tagKeys.length; i1++)
          'TagKeys.member.${i1 + 1}': tagKeys[i1],
    };
    await _protocol.send(
      $request,
      action: 'RemoveTagsFromResource',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBParameterGroupName': dBParameterGroupName,
      if (parameters != null)
        if (parameters.isEmpty)
          'Parameters': ''
        else
          for (var i1 = 0; i1 < parameters.length; i1++)
            for (var e3 in parameters[i1].toQueryMap().entries)
              'Parameters.Parameter.${i1 + 1}.${e3.key}': e3.value,
      if (resetAllParameters != null)
        'ResetAllParameters': resetAllParameters.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'ResetDBParameterGroup',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBInstanceIdentifier': dBInstanceIdentifier,
      'DBSnapshotIdentifier': dBSnapshotIdentifier,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade.toString(),
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBName != null) 'DBName': dBName,
      if (dBSubnetGroupName != null) 'DBSubnetGroupName': dBSubnetGroupName,
      if (engine != null) 'Engine': engine,
      if (iops != null) 'Iops': iops.toString(),
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (multiAZ != null) 'MultiAZ': multiAZ.toString(),
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (port != null) 'Port': port.toString(),
      if (publiclyAccessible != null)
        'PubliclyAccessible': publiclyAccessible.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceFromDBSnapshot',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'SourceDBInstanceIdentifier': sourceDBInstanceIdentifier,
      'TargetDBInstanceIdentifier': targetDBInstanceIdentifier,
      if (autoMinorVersionUpgrade != null)
        'AutoMinorVersionUpgrade': autoMinorVersionUpgrade.toString(),
      if (availabilityZone != null) 'AvailabilityZone': availabilityZone,
      if (dBInstanceClass != null) 'DBInstanceClass': dBInstanceClass,
      if (dBName != null) 'DBName': dBName,
      if (dBSubnetGroupName != null) 'DBSubnetGroupName': dBSubnetGroupName,
      if (engine != null) 'Engine': engine,
      if (iops != null) 'Iops': iops.toString(),
      if (licenseModel != null) 'LicenseModel': licenseModel,
      if (multiAZ != null) 'MultiAZ': multiAZ.toString(),
      if (optionGroupName != null) 'OptionGroupName': optionGroupName,
      if (port != null) 'Port': port.toString(),
      if (publiclyAccessible != null)
        'PubliclyAccessible': publiclyAccessible.toString(),
      if (restoreTime != null) 'RestoreTime': _s.iso8601ToJson(restoreTime),
      if (useLatestRestorableTime != null)
        'UseLatestRestorableTime': useLatestRestorableTime.toString(),
    };
    final $result = await _protocol.send(
      $request,
      action: 'RestoreDBInstanceToPointInTime',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
    final $request = <String, String>{
      'DBSecurityGroupName': dBSecurityGroupName,
      if (cidrip != null) 'CIDRIP': cidrip,
      if (eC2SecurityGroupId != null) 'EC2SecurityGroupId': eC2SecurityGroupId,
      if (eC2SecurityGroupName != null)
        'EC2SecurityGroupName': eC2SecurityGroupName,
      if (eC2SecurityGroupOwnerId != null)
        'EC2SecurityGroupOwnerId': eC2SecurityGroupOwnerId,
    };
    final $result = await _protocol.send(
      $request,
      action: 'RevokeDBSecurityGroupIngress',
      version: '2013-02-12',
      method: 'POST',
      requestUri: '/',
      exceptionFnMap: _exceptionFns,
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
  factory AddSourceIdentifierToSubscriptionResult.fromXml(_s.XmlElement elem) {
    return AddSourceIdentifierToSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }
}

enum ApplyMethod {
  immediate('immediate'),
  pendingReboot('pending-reboot'),
  ;

  final String value;

  const ApplyMethod(this.value);

  static ApplyMethod fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum ApplyMethod'));
}

class AuthorizeDBSecurityGroupIngressResult {
  final DBSecurityGroup? dBSecurityGroup;

  AuthorizeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });
  factory AuthorizeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return AuthorizeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let(DBSecurityGroup.fromXml),
    );
  }
}

class AvailabilityZone {
  final String? name;
  final bool? provisionedIopsCapable;

  AvailabilityZone({
    this.name,
    this.provisionedIopsCapable,
  });
  factory AvailabilityZone.fromXml(_s.XmlElement elem) {
    return AvailabilityZone(
      name: _s.extractXmlStringValue(elem, 'Name'),
      provisionedIopsCapable:
          _s.extractXmlBoolValue(elem, 'ProvisionedIopsCapable'),
    );
  }
}

class CharacterSet {
  final String? characterSetDescription;
  final String? characterSetName;

  CharacterSet({
    this.characterSetDescription,
    this.characterSetName,
  });
  factory CharacterSet.fromXml(_s.XmlElement elem) {
    return CharacterSet(
      characterSetDescription:
          _s.extractXmlStringValue(elem, 'CharacterSetDescription'),
      characterSetName: _s.extractXmlStringValue(elem, 'CharacterSetName'),
    );
  }
}

class CopyDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  CopyDBSnapshotResult({
    this.dBSnapshot,
  });
  factory CopyDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CopyDBSnapshotResult(
      dBSnapshot:
          _s.extractXmlChild(elem, 'DBSnapshot')?.let(DBSnapshot.fromXml),
    );
  }
}

class CreateDBInstanceReadReplicaResult {
  final DBInstance? dBInstance;

  CreateDBInstanceReadReplicaResult({
    this.dBInstance,
  });
  factory CreateDBInstanceReadReplicaResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceReadReplicaResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class CreateDBInstanceResult {
  final DBInstance? dBInstance;

  CreateDBInstanceResult({
    this.dBInstance,
  });
  factory CreateDBInstanceResult.fromXml(_s.XmlElement elem) {
    return CreateDBInstanceResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class CreateDBParameterGroupResult {
  final DBParameterGroup? dBParameterGroup;

  CreateDBParameterGroupResult({
    this.dBParameterGroup,
  });
  factory CreateDBParameterGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBParameterGroupResult(
      dBParameterGroup: _s
          .extractXmlChild(elem, 'DBParameterGroup')
          ?.let(DBParameterGroup.fromXml),
    );
  }
}

class CreateDBSecurityGroupResult {
  final DBSecurityGroup? dBSecurityGroup;

  CreateDBSecurityGroupResult({
    this.dBSecurityGroup,
  });
  factory CreateDBSecurityGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSecurityGroupResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let(DBSecurityGroup.fromXml),
    );
  }
}

class CreateDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  CreateDBSnapshotResult({
    this.dBSnapshot,
  });
  factory CreateDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return CreateDBSnapshotResult(
      dBSnapshot:
          _s.extractXmlChild(elem, 'DBSnapshot')?.let(DBSnapshot.fromXml),
    );
  }
}

class CreateDBSubnetGroupResult {
  final DBSubnetGroup? dBSubnetGroup;

  CreateDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory CreateDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return CreateDBSubnetGroupResult(
      dBSubnetGroup:
          _s.extractXmlChild(elem, 'DBSubnetGroup')?.let(DBSubnetGroup.fromXml),
    );
  }
}

class CreateEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  CreateEventSubscriptionResult({
    this.eventSubscription,
  });
  factory CreateEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return CreateEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }
}

class CreateOptionGroupResult {
  final OptionGroup? optionGroup;

  CreateOptionGroupResult({
    this.optionGroup,
  });
  factory CreateOptionGroupResult.fromXml(_s.XmlElement elem) {
    return CreateOptionGroupResult(
      optionGroup:
          _s.extractXmlChild(elem, 'OptionGroup')?.let(OptionGroup.fromXml),
    );
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
          ?.let(CharacterSet.fromXml),
      engine: _s.extractXmlStringValue(elem, 'Engine'),
      engineVersion: _s.extractXmlStringValue(elem, 'EngineVersion'),
      supportedCharacterSets: _s
          .extractXmlChild(elem, 'SupportedCharacterSets')
          ?.let((elem) => elem
              .findElements('CharacterSet')
              .map(CharacterSet.fromXml)
              .toList()),
    );
  }
}

class DBEngineVersionMessage {
  final List<DBEngineVersion>? dBEngineVersions;
  final String? marker;

  DBEngineVersionMessage({
    this.dBEngineVersions,
    this.marker,
  });
  factory DBEngineVersionMessage.fromXml(_s.XmlElement elem) {
    return DBEngineVersionMessage(
      dBEngineVersions: _s.extractXmlChild(elem, 'DBEngineVersions')?.let(
          (elem) => elem
              .findElements('DBEngineVersion')
              .map(DBEngineVersion.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  final List<OptionGroupMembership>? optionGroupMemberships;
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
    this.optionGroupMemberships,
    this.pendingModifiedValues,
    this.preferredBackupWindow,
    this.preferredMaintenanceWindow,
    this.publiclyAccessible,
    this.readReplicaDBInstanceIdentifiers,
    this.readReplicaSourceDBInstanceIdentifier,
    this.secondaryAvailabilityZone,
    this.vpcSecurityGroups,
  });
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
              .map(DBParameterGroupStatus.fromXml)
              .toList()),
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map(DBSecurityGroupMembership.fromXml)
              .toList()),
      dBSubnetGroup:
          _s.extractXmlChild(elem, 'DBSubnetGroup')?.let(DBSubnetGroup.fromXml),
      endpoint: _s.extractXmlChild(elem, 'Endpoint')?.let(Endpoint.fromXml),
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
      optionGroupMemberships: _s
          .extractXmlChild(elem, 'OptionGroupMemberships')
          ?.let((elem) => elem
              .findElements('OptionGroupMembership')
              .map(OptionGroupMembership.fromXml)
              .toList()),
      pendingModifiedValues: _s
          .extractXmlChild(elem, 'PendingModifiedValues')
          ?.let(PendingModifiedValues.fromXml),
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
              .map(VpcSecurityGroupMembership.fromXml)
              .toList()),
    );
  }
}

class DBInstanceMessage {
  final List<DBInstance>? dBInstances;
  final String? marker;

  DBInstanceMessage({
    this.dBInstances,
    this.marker,
  });
  factory DBInstanceMessage.fromXml(_s.XmlElement elem) {
    return DBInstanceMessage(
      dBInstances: _s.extractXmlChild(elem, 'DBInstances')?.let((elem) =>
          elem.findElements('DBInstance').map(DBInstance.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  factory DBParameterGroup.fromXml(_s.XmlElement elem) {
    return DBParameterGroup(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      description: _s.extractXmlStringValue(elem, 'Description'),
    );
  }
}

class DBParameterGroupDetails {
  final String? marker;
  final List<Parameter>? parameters;

  DBParameterGroupDetails({
    this.marker,
    this.parameters,
  });
  factory DBParameterGroupDetails.fromXml(_s.XmlElement elem) {
    return DBParameterGroupDetails(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
    );
  }
}

class DBParameterGroupNameMessage {
  final String? dBParameterGroupName;

  DBParameterGroupNameMessage({
    this.dBParameterGroupName,
  });
  factory DBParameterGroupNameMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupNameMessage(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
    );
  }
}

class DBParameterGroupStatus {
  final String? dBParameterGroupName;
  final String? parameterApplyStatus;

  DBParameterGroupStatus({
    this.dBParameterGroupName,
    this.parameterApplyStatus,
  });
  factory DBParameterGroupStatus.fromXml(_s.XmlElement elem) {
    return DBParameterGroupStatus(
      dBParameterGroupName:
          _s.extractXmlStringValue(elem, 'DBParameterGroupName'),
      parameterApplyStatus:
          _s.extractXmlStringValue(elem, 'ParameterApplyStatus'),
    );
  }
}

class DBParameterGroupsMessage {
  final List<DBParameterGroup>? dBParameterGroups;
  final String? marker;

  DBParameterGroupsMessage({
    this.dBParameterGroups,
    this.marker,
  });
  factory DBParameterGroupsMessage.fromXml(_s.XmlElement elem) {
    return DBParameterGroupsMessage(
      dBParameterGroups: _s.extractXmlChild(elem, 'DBParameterGroups')?.let(
          (elem) => elem
              .findElements('DBParameterGroup')
              .map(DBParameterGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  factory DBSecurityGroup.fromXml(_s.XmlElement elem) {
    return DBSecurityGroup(
      dBSecurityGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupDescription'),
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      eC2SecurityGroups: _s.extractXmlChild(elem, 'EC2SecurityGroups')?.let(
          (elem) => elem
              .findElements('EC2SecurityGroup')
              .map(EC2SecurityGroup.fromXml)
              .toList()),
      iPRanges: _s.extractXmlChild(elem, 'IPRanges')?.let(
          (elem) => elem.findElements('IPRange').map(IPRange.fromXml).toList()),
      ownerId: _s.extractXmlStringValue(elem, 'OwnerId'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

class DBSecurityGroupMembership {
  final String? dBSecurityGroupName;
  final String? status;

  DBSecurityGroupMembership({
    this.dBSecurityGroupName,
    this.status,
  });
  factory DBSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMembership(
      dBSecurityGroupName:
          _s.extractXmlStringValue(elem, 'DBSecurityGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

class DBSecurityGroupMessage {
  final List<DBSecurityGroup>? dBSecurityGroups;
  final String? marker;

  DBSecurityGroupMessage({
    this.dBSecurityGroups,
    this.marker,
  });
  factory DBSecurityGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSecurityGroupMessage(
      dBSecurityGroups: _s.extractXmlChild(elem, 'DBSecurityGroups')?.let(
          (elem) => elem
              .findElements('DBSecurityGroup')
              .map(DBSecurityGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  final String? optionGroupName;
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
    this.optionGroupName,
    this.port,
    this.snapshotCreateTime,
    this.snapshotType,
    this.status,
    this.vpcId,
  });
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
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      snapshotCreateTime:
          _s.extractXmlDateTimeValue(elem, 'SnapshotCreateTime'),
      snapshotType: _s.extractXmlStringValue(elem, 'SnapshotType'),
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

class DBSnapshotMessage {
  final List<DBSnapshot>? dBSnapshots;
  final String? marker;

  DBSnapshotMessage({
    this.dBSnapshots,
    this.marker,
  });
  factory DBSnapshotMessage.fromXml(_s.XmlElement elem) {
    return DBSnapshotMessage(
      dBSnapshots: _s.extractXmlChild(elem, 'DBSnapshots')?.let((elem) =>
          elem.findElements('DBSnapshot').map(DBSnapshot.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
  factory DBSubnetGroup.fromXml(_s.XmlElement elem) {
    return DBSubnetGroup(
      dBSubnetGroupDescription:
          _s.extractXmlStringValue(elem, 'DBSubnetGroupDescription'),
      dBSubnetGroupName: _s.extractXmlStringValue(elem, 'DBSubnetGroupName'),
      subnetGroupStatus: _s.extractXmlStringValue(elem, 'SubnetGroupStatus'),
      subnets: _s.extractXmlChild(elem, 'Subnets')?.let(
          (elem) => elem.findElements('Subnet').map(Subnet.fromXml).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

class DBSubnetGroupMessage {
  final List<DBSubnetGroup>? dBSubnetGroups;
  final String? marker;

  DBSubnetGroupMessage({
    this.dBSubnetGroups,
    this.marker,
  });
  factory DBSubnetGroupMessage.fromXml(_s.XmlElement elem) {
    return DBSubnetGroupMessage(
      dBSubnetGroups: _s.extractXmlChild(elem, 'DBSubnetGroups')?.let((elem) =>
          elem
              .findElements('DBSubnetGroup')
              .map(DBSubnetGroup.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class DeleteDBInstanceResult {
  final DBInstance? dBInstance;

  DeleteDBInstanceResult({
    this.dBInstance,
  });
  factory DeleteDBInstanceResult.fromXml(_s.XmlElement elem) {
    return DeleteDBInstanceResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class DeleteDBSnapshotResult {
  final DBSnapshot? dBSnapshot;

  DeleteDBSnapshotResult({
    this.dBSnapshot,
  });
  factory DeleteDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return DeleteDBSnapshotResult(
      dBSnapshot:
          _s.extractXmlChild(elem, 'DBSnapshot')?.let(DBSnapshot.fromXml),
    );
  }
}

class DeleteEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  DeleteEventSubscriptionResult({
    this.eventSubscription,
  });
  factory DeleteEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return DeleteEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }
}

class DescribeDBLogFilesDetails {
  final int? lastWritten;
  final String? logFileName;
  final int? size;

  DescribeDBLogFilesDetails({
    this.lastWritten,
    this.logFileName,
    this.size,
  });
  factory DescribeDBLogFilesDetails.fromXml(_s.XmlElement elem) {
    return DescribeDBLogFilesDetails(
      lastWritten: _s.extractXmlIntValue(elem, 'LastWritten'),
      logFileName: _s.extractXmlStringValue(elem, 'LogFileName'),
      size: _s.extractXmlIntValue(elem, 'Size'),
    );
  }
}

class DescribeDBLogFilesResponse {
  final List<DescribeDBLogFilesDetails>? describeDBLogFiles;
  final String? marker;

  DescribeDBLogFilesResponse({
    this.describeDBLogFiles,
    this.marker,
  });
  factory DescribeDBLogFilesResponse.fromXml(_s.XmlElement elem) {
    return DescribeDBLogFilesResponse(
      describeDBLogFiles: _s.extractXmlChild(elem, 'DescribeDBLogFiles')?.let(
          (elem) => elem
              .findElements('DescribeDBLogFilesDetails')
              .map(DescribeDBLogFilesDetails.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class DescribeEngineDefaultParametersResult {
  final EngineDefaults? engineDefaults;

  DescribeEngineDefaultParametersResult({
    this.engineDefaults,
  });
  factory DescribeEngineDefaultParametersResult.fromXml(_s.XmlElement elem) {
    return DescribeEngineDefaultParametersResult(
      engineDefaults: _s
          .extractXmlChild(elem, 'EngineDefaults')
          ?.let(EngineDefaults.fromXml),
    );
  }
}

class DownloadDBLogFilePortionDetails {
  final bool? additionalDataPending;
  final String? logFileData;
  final String? marker;

  DownloadDBLogFilePortionDetails({
    this.additionalDataPending,
    this.logFileData,
    this.marker,
  });
  factory DownloadDBLogFilePortionDetails.fromXml(_s.XmlElement elem) {
    return DownloadDBLogFilePortionDetails(
      additionalDataPending:
          _s.extractXmlBoolValue(elem, 'AdditionalDataPending'),
      logFileData: _s.extractXmlStringValue(elem, 'LogFileData'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
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
}

class Endpoint {
  final String? address;
  final int? port;

  Endpoint({
    this.address,
    this.port,
  });
  factory Endpoint.fromXml(_s.XmlElement elem) {
    return Endpoint(
      address: _s.extractXmlStringValue(elem, 'Address'),
      port: _s.extractXmlIntValue(elem, 'Port'),
    );
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
  factory EngineDefaults.fromXml(_s.XmlElement elem) {
    return EngineDefaults(
      dBParameterGroupFamily:
          _s.extractXmlStringValue(elem, 'DBParameterGroupFamily'),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      parameters: _s.extractXmlChild(elem, 'Parameters')?.let((elem) =>
          elem.findElements('Parameter').map(Parameter.fromXml).toList()),
    );
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
  factory Event.fromXml(_s.XmlElement elem) {
    return Event(
      date: _s.extractXmlDateTimeValue(elem, 'Date'),
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      message: _s.extractXmlStringValue(elem, 'Message'),
      sourceIdentifier: _s.extractXmlStringValue(elem, 'SourceIdentifier'),
      sourceType: _s
          .extractXmlStringValue(elem, 'SourceType')
          ?.let(SourceType.fromString),
    );
  }
}

class EventCategoriesMap {
  final List<String>? eventCategories;
  final String? sourceType;

  EventCategoriesMap({
    this.eventCategories,
    this.sourceType,
  });
  factory EventCategoriesMap.fromXml(_s.XmlElement elem) {
    return EventCategoriesMap(
      eventCategories: _s
          .extractXmlChild(elem, 'EventCategories')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
      sourceType: _s.extractXmlStringValue(elem, 'SourceType'),
    );
  }
}

class EventCategoriesMessage {
  final List<EventCategoriesMap>? eventCategoriesMapList;

  EventCategoriesMessage({
    this.eventCategoriesMapList,
  });
  factory EventCategoriesMessage.fromXml(_s.XmlElement elem) {
    return EventCategoriesMessage(
      eventCategoriesMapList: _s
          .extractXmlChild(elem, 'EventCategoriesMapList')
          ?.let((elem) => elem
              .findElements('EventCategoriesMap')
              .map(EventCategoriesMap.fromXml)
              .toList()),
    );
  }
}

class EventSubscription {
  final String? custSubscriptionId;
  final String? customerAwsId;
  final bool? enabled;
  final List<String>? eventCategoriesList;
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
    this.snsTopicArn,
    this.sourceIdsList,
    this.sourceType,
    this.status,
    this.subscriptionCreationTime,
  });
  factory EventSubscription.fromXml(_s.XmlElement elem) {
    return EventSubscription(
      custSubscriptionId: _s.extractXmlStringValue(elem, 'CustSubscriptionId'),
      customerAwsId: _s.extractXmlStringValue(elem, 'CustomerAwsId'),
      enabled: _s.extractXmlBoolValue(elem, 'Enabled'),
      eventCategoriesList: _s
          .extractXmlChild(elem, 'EventCategoriesList')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'EventCategory')),
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
}

class EventSubscriptionsMessage {
  final List<EventSubscription>? eventSubscriptionsList;
  final String? marker;

  EventSubscriptionsMessage({
    this.eventSubscriptionsList,
    this.marker,
  });
  factory EventSubscriptionsMessage.fromXml(_s.XmlElement elem) {
    return EventSubscriptionsMessage(
      eventSubscriptionsList: _s
          .extractXmlChild(elem, 'EventSubscriptionsList')
          ?.let((elem) => elem
              .findElements('EventSubscription')
              .map(EventSubscription.fromXml)
              .toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class EventsMessage {
  final List<Event>? events;
  final String? marker;

  EventsMessage({
    this.events,
    this.marker,
  });
  factory EventsMessage.fromXml(_s.XmlElement elem) {
    return EventsMessage(
      events: _s.extractXmlChild(elem, 'Events')?.let(
          (elem) => elem.findElements('Event').map(Event.fromXml).toList()),
      marker: _s.extractXmlStringValue(elem, 'Marker'),
    );
  }
}

class IPRange {
  final String? cidrip;
  final String? status;

  IPRange({
    this.cidrip,
    this.status,
  });
  factory IPRange.fromXml(_s.XmlElement elem) {
    return IPRange(
      cidrip: _s.extractXmlStringValue(elem, 'CIDRIP'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

class ModifyDBInstanceResult {
  final DBInstance? dBInstance;

  ModifyDBInstanceResult({
    this.dBInstance,
  });
  factory ModifyDBInstanceResult.fromXml(_s.XmlElement elem) {
    return ModifyDBInstanceResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class ModifyDBSubnetGroupResult {
  final DBSubnetGroup? dBSubnetGroup;

  ModifyDBSubnetGroupResult({
    this.dBSubnetGroup,
  });
  factory ModifyDBSubnetGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyDBSubnetGroupResult(
      dBSubnetGroup:
          _s.extractXmlChild(elem, 'DBSubnetGroup')?.let(DBSubnetGroup.fromXml),
    );
  }
}

class ModifyEventSubscriptionResult {
  final EventSubscription? eventSubscription;

  ModifyEventSubscriptionResult({
    this.eventSubscription,
  });
  factory ModifyEventSubscriptionResult.fromXml(_s.XmlElement elem) {
    return ModifyEventSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
  }
}

class ModifyOptionGroupResult {
  final OptionGroup? optionGroup;

  ModifyOptionGroupResult({
    this.optionGroup,
  });
  factory ModifyOptionGroupResult.fromXml(_s.XmlElement elem) {
    return ModifyOptionGroupResult(
      optionGroup:
          _s.extractXmlChild(elem, 'OptionGroup')?.let(OptionGroup.fromXml),
    );
  }
}

class Option {
  final List<DBSecurityGroupMembership>? dBSecurityGroupMemberships;
  final String? optionDescription;
  final String? optionName;
  final List<OptionSetting>? optionSettings;
  final bool? persistent;
  final int? port;
  final List<VpcSecurityGroupMembership>? vpcSecurityGroupMemberships;

  Option({
    this.dBSecurityGroupMemberships,
    this.optionDescription,
    this.optionName,
    this.optionSettings,
    this.persistent,
    this.port,
    this.vpcSecurityGroupMemberships,
  });
  factory Option.fromXml(_s.XmlElement elem) {
    return Option(
      dBSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'DBSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('DBSecurityGroup')
              .map(DBSecurityGroupMembership.fromXml)
              .toList()),
      optionDescription: _s.extractXmlStringValue(elem, 'OptionDescription'),
      optionName: _s.extractXmlStringValue(elem, 'OptionName'),
      optionSettings: _s.extractXmlChild(elem, 'OptionSettings')?.let((elem) =>
          elem
              .findElements('OptionSetting')
              .map(OptionSetting.fromXml)
              .toList()),
      persistent: _s.extractXmlBoolValue(elem, 'Persistent'),
      port: _s.extractXmlIntValue(elem, 'Port'),
      vpcSecurityGroupMemberships: _s
          .extractXmlChild(elem, 'VpcSecurityGroupMemberships')
          ?.let((elem) => elem
              .findElements('VpcSecurityGroupMembership')
              .map(VpcSecurityGroupMembership.fromXml)
              .toList()),
    );
  }
}

class OptionConfiguration {
  final String optionName;
  final List<String>? dBSecurityGroupMemberships;
  final List<OptionSetting>? optionSettings;
  final int? port;
  final List<String>? vpcSecurityGroupMemberships;

  OptionConfiguration({
    required this.optionName,
    this.dBSecurityGroupMemberships,
    this.optionSettings,
    this.port,
    this.vpcSecurityGroupMemberships,
  });

  Map<String, dynamic> toJson() {
    final optionName = this.optionName;
    final dBSecurityGroupMemberships = this.dBSecurityGroupMemberships;
    final optionSettings = this.optionSettings;
    final port = this.port;
    final vpcSecurityGroupMemberships = this.vpcSecurityGroupMemberships;
    return {
      'OptionName': optionName,
      if (dBSecurityGroupMemberships != null)
        'DBSecurityGroupMemberships': dBSecurityGroupMemberships,
      if (optionSettings != null) 'OptionSettings': optionSettings,
      if (port != null) 'Port': port,
      if (vpcSecurityGroupMemberships != null)
        'VpcSecurityGroupMemberships': vpcSecurityGroupMemberships,
    };
  }

  Map<String, String> toQueryMap() {
    final optionName = this.optionName;
    final dBSecurityGroupMemberships = this.dBSecurityGroupMemberships;
    final optionSettings = this.optionSettings;
    final port = this.port;
    final vpcSecurityGroupMemberships = this.vpcSecurityGroupMemberships;
    return {
      'OptionName': optionName,
      if (dBSecurityGroupMemberships != null)
        if (dBSecurityGroupMemberships.isEmpty)
          'DBSecurityGroupName': ''
        else
          for (var i1 = 0; i1 < dBSecurityGroupMemberships.length; i1++)
            'DBSecurityGroupName.DBSecurityGroupName.${i1 + 1}':
                dBSecurityGroupMemberships[i1],
      if (optionSettings != null)
        if (optionSettings.isEmpty)
          'OptionSetting': ''
        else
          for (var i1 = 0; i1 < optionSettings.length; i1++)
            for (var e3 in optionSettings[i1].toQueryMap().entries)
              'OptionSetting.OptionSetting.${i1 + 1}.${e3.key}': e3.value,
      if (port != null) 'Port': port.toString(),
      if (vpcSecurityGroupMemberships != null)
        if (vpcSecurityGroupMemberships.isEmpty)
          'VpcSecurityGroupId': ''
        else
          for (var i1 = 0; i1 < vpcSecurityGroupMemberships.length; i1++)
            'VpcSecurityGroupId.VpcSecurityGroupId.${i1 + 1}':
                vpcSecurityGroupMemberships[i1],
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
  factory OptionGroup.fromXml(_s.XmlElement elem) {
    return OptionGroup(
      allowsVpcAndNonVpcInstanceMemberships:
          _s.extractXmlBoolValue(elem, 'AllowsVpcAndNonVpcInstanceMemberships'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      optionGroupDescription:
          _s.extractXmlStringValue(elem, 'OptionGroupDescription'),
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      options: _s.extractXmlChild(elem, 'Options')?.let(
          (elem) => elem.findElements('Option').map(Option.fromXml).toList()),
      vpcId: _s.extractXmlStringValue(elem, 'VpcId'),
    );
  }
}

class OptionGroupMembership {
  final String? optionGroupName;
  final String? status;

  OptionGroupMembership({
    this.optionGroupName,
    this.status,
  });
  factory OptionGroupMembership.fromXml(_s.XmlElement elem) {
    return OptionGroupMembership(
      optionGroupName: _s.extractXmlStringValue(elem, 'OptionGroupName'),
      status: _s.extractXmlStringValue(elem, 'Status'),
    );
  }
}

class OptionGroupOption {
  final int? defaultPort;
  final String? description;
  final String? engineName;
  final String? majorEngineVersion;
  final String? minimumRequiredMinorEngineVersion;
  final String? name;
  final List<OptionGroupOptionSetting>? optionGroupOptionSettings;
  final List<String>? optionsDependedOn;
  final bool? persistent;
  final bool? portRequired;

  OptionGroupOption({
    this.defaultPort,
    this.description,
    this.engineName,
    this.majorEngineVersion,
    this.minimumRequiredMinorEngineVersion,
    this.name,
    this.optionGroupOptionSettings,
    this.optionsDependedOn,
    this.persistent,
    this.portRequired,
  });
  factory OptionGroupOption.fromXml(_s.XmlElement elem) {
    return OptionGroupOption(
      defaultPort: _s.extractXmlIntValue(elem, 'DefaultPort'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      engineName: _s.extractXmlStringValue(elem, 'EngineName'),
      majorEngineVersion: _s.extractXmlStringValue(elem, 'MajorEngineVersion'),
      minimumRequiredMinorEngineVersion:
          _s.extractXmlStringValue(elem, 'MinimumRequiredMinorEngineVersion'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      optionGroupOptionSettings: _s
          .extractXmlChild(elem, 'OptionGroupOptionSettings')
          ?.let((elem) => elem
              .findElements('OptionGroupOptionSetting')
              .map(OptionGroupOptionSetting.fromXml)
              .toList()),
      optionsDependedOn: _s
          .extractXmlChild(elem, 'OptionsDependedOn')
          ?.let((elem) => _s.extractXmlStringListValues(elem, 'OptionName')),
      persistent: _s.extractXmlBoolValue(elem, 'Persistent'),
      portRequired: _s.extractXmlBoolValue(elem, 'PortRequired'),
    );
  }
}

class OptionGroupOptionSetting {
  final String? allowedValues;
  final String? applyType;
  final String? defaultValue;
  final bool? isModifiable;
  final String? settingDescription;
  final String? settingName;

  OptionGroupOptionSetting({
    this.allowedValues,
    this.applyType,
    this.defaultValue,
    this.isModifiable,
    this.settingDescription,
    this.settingName,
  });
  factory OptionGroupOptionSetting.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionSetting(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      settingDescription: _s.extractXmlStringValue(elem, 'SettingDescription'),
      settingName: _s.extractXmlStringValue(elem, 'SettingName'),
    );
  }
}

class OptionGroupOptionsMessage {
  final String? marker;
  final List<OptionGroupOption>? optionGroupOptions;

  OptionGroupOptionsMessage({
    this.marker,
    this.optionGroupOptions,
  });
  factory OptionGroupOptionsMessage.fromXml(_s.XmlElement elem) {
    return OptionGroupOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupOptions: _s.extractXmlChild(elem, 'OptionGroupOptions')?.let(
          (elem) => elem
              .findElements('OptionGroupOption')
              .map(OptionGroupOption.fromXml)
              .toList()),
    );
  }
}

class OptionGroups {
  final String? marker;
  final List<OptionGroup>? optionGroupsList;

  OptionGroups({
    this.marker,
    this.optionGroupsList,
  });
  factory OptionGroups.fromXml(_s.XmlElement elem) {
    return OptionGroups(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      optionGroupsList: _s.extractXmlChild(elem, 'OptionGroupsList')?.let(
          (elem) => elem
              .findElements('OptionGroup')
              .map(OptionGroup.fromXml)
              .toList()),
    );
  }
}

class OptionSetting {
  final String? allowedValues;
  final String? applyType;
  final String? dataType;
  final String? defaultValue;
  final String? description;
  final bool? isCollection;
  final bool? isModifiable;
  final String? name;
  final String? value;

  OptionSetting({
    this.allowedValues,
    this.applyType,
    this.dataType,
    this.defaultValue,
    this.description,
    this.isCollection,
    this.isModifiable,
    this.name,
    this.value,
  });
  factory OptionSetting.fromXml(_s.XmlElement elem) {
    return OptionSetting(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyType: _s.extractXmlStringValue(elem, 'ApplyType'),
      dataType: _s.extractXmlStringValue(elem, 'DataType'),
      defaultValue: _s.extractXmlStringValue(elem, 'DefaultValue'),
      description: _s.extractXmlStringValue(elem, 'Description'),
      isCollection: _s.extractXmlBoolValue(elem, 'IsCollection'),
      isModifiable: _s.extractXmlBoolValue(elem, 'IsModifiable'),
      name: _s.extractXmlStringValue(elem, 'Name'),
      value: _s.extractXmlStringValue(elem, 'Value'),
    );
  }

  Map<String, dynamic> toJson() {
    final allowedValues = this.allowedValues;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final isCollection = this.isCollection;
    final isModifiable = this.isModifiable;
    final name = this.name;
    final value = this.value;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (applyType != null) 'ApplyType': applyType,
      if (dataType != null) 'DataType': dataType,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (isCollection != null) 'IsCollection': isCollection,
      if (isModifiable != null) 'IsModifiable': isModifiable,
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
    };
  }

  Map<String, String> toQueryMap() {
    final allowedValues = this.allowedValues;
    final applyType = this.applyType;
    final dataType = this.dataType;
    final defaultValue = this.defaultValue;
    final description = this.description;
    final isCollection = this.isCollection;
    final isModifiable = this.isModifiable;
    final name = this.name;
    final value = this.value;
    return {
      if (allowedValues != null) 'AllowedValues': allowedValues,
      if (applyType != null) 'ApplyType': applyType,
      if (dataType != null) 'DataType': dataType,
      if (defaultValue != null) 'DefaultValue': defaultValue,
      if (description != null) 'Description': description,
      if (isCollection != null) 'IsCollection': isCollection.toString(),
      if (isModifiable != null) 'IsModifiable': isModifiable.toString(),
      if (name != null) 'Name': name,
      if (value != null) 'Value': value,
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
  factory OrderableDBInstanceOption.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOption(
      availabilityZones: _s.extractXmlChild(elem, 'AvailabilityZones')?.let(
          (elem) => elem
              .findElements('AvailabilityZone')
              .map(AvailabilityZone.fromXml)
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
}

class OrderableDBInstanceOptionsMessage {
  final String? marker;
  final List<OrderableDBInstanceOption>? orderableDBInstanceOptions;

  OrderableDBInstanceOptionsMessage({
    this.marker,
    this.orderableDBInstanceOptions,
  });
  factory OrderableDBInstanceOptionsMessage.fromXml(_s.XmlElement elem) {
    return OrderableDBInstanceOptionsMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      orderableDBInstanceOptions: _s
          .extractXmlChild(elem, 'OrderableDBInstanceOptions')
          ?.let((elem) => elem
              .findElements('OrderableDBInstanceOption')
              .map(OrderableDBInstanceOption.fromXml)
              .toList()),
    );
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
  factory Parameter.fromXml(_s.XmlElement elem) {
    return Parameter(
      allowedValues: _s.extractXmlStringValue(elem, 'AllowedValues'),
      applyMethod: _s
          .extractXmlStringValue(elem, 'ApplyMethod')
          ?.let(ApplyMethod.fromString),
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
      if (applyMethod != null) 'ApplyMethod': applyMethod.value,
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

  Map<String, String> toQueryMap() {
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
      if (applyMethod != null) 'ApplyMethod': applyMethod.value,
      if (applyType != null) 'ApplyType': applyType,
      if (dataType != null) 'DataType': dataType,
      if (description != null) 'Description': description,
      if (isModifiable != null) 'IsModifiable': isModifiable.toString(),
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
}

class PromoteReadReplicaResult {
  final DBInstance? dBInstance;

  PromoteReadReplicaResult({
    this.dBInstance,
  });
  factory PromoteReadReplicaResult.fromXml(_s.XmlElement elem) {
    return PromoteReadReplicaResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class PurchaseReservedDBInstancesOfferingResult {
  final ReservedDBInstance? reservedDBInstance;

  PurchaseReservedDBInstancesOfferingResult({
    this.reservedDBInstance,
  });
  factory PurchaseReservedDBInstancesOfferingResult.fromXml(
      _s.XmlElement elem) {
    return PurchaseReservedDBInstancesOfferingResult(
      reservedDBInstance: _s
          .extractXmlChild(elem, 'ReservedDBInstance')
          ?.let(ReservedDBInstance.fromXml),
    );
  }
}

class RebootDBInstanceResult {
  final DBInstance? dBInstance;

  RebootDBInstanceResult({
    this.dBInstance,
  });
  factory RebootDBInstanceResult.fromXml(_s.XmlElement elem) {
    return RebootDBInstanceResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class RecurringCharge {
  final double? recurringChargeAmount;
  final String? recurringChargeFrequency;

  RecurringCharge({
    this.recurringChargeAmount,
    this.recurringChargeFrequency,
  });
  factory RecurringCharge.fromXml(_s.XmlElement elem) {
    return RecurringCharge(
      recurringChargeAmount:
          _s.extractXmlDoubleValue(elem, 'RecurringChargeAmount'),
      recurringChargeFrequency:
          _s.extractXmlStringValue(elem, 'RecurringChargeFrequency'),
    );
  }
}

class RemoveSourceIdentifierFromSubscriptionResult {
  final EventSubscription? eventSubscription;

  RemoveSourceIdentifierFromSubscriptionResult({
    this.eventSubscription,
  });
  factory RemoveSourceIdentifierFromSubscriptionResult.fromXml(
      _s.XmlElement elem) {
    return RemoveSourceIdentifierFromSubscriptionResult(
      eventSubscription: _s
          .extractXmlChild(elem, 'EventSubscription')
          ?.let(EventSubscription.fromXml),
    );
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
              .map(RecurringCharge.fromXml)
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
}

class ReservedDBInstanceMessage {
  final String? marker;
  final List<ReservedDBInstance>? reservedDBInstances;

  ReservedDBInstanceMessage({
    this.marker,
    this.reservedDBInstances,
  });
  factory ReservedDBInstanceMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstanceMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstances: _s.extractXmlChild(elem, 'ReservedDBInstances')?.let(
          (elem) => elem
              .findElements('ReservedDBInstance')
              .map(ReservedDBInstance.fromXml)
              .toList()),
    );
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
              .map(RecurringCharge.fromXml)
              .toList()),
      reservedDBInstancesOfferingId:
          _s.extractXmlStringValue(elem, 'ReservedDBInstancesOfferingId'),
      usagePrice: _s.extractXmlDoubleValue(elem, 'UsagePrice'),
    );
  }
}

class ReservedDBInstancesOfferingMessage {
  final String? marker;
  final List<ReservedDBInstancesOffering>? reservedDBInstancesOfferings;

  ReservedDBInstancesOfferingMessage({
    this.marker,
    this.reservedDBInstancesOfferings,
  });
  factory ReservedDBInstancesOfferingMessage.fromXml(_s.XmlElement elem) {
    return ReservedDBInstancesOfferingMessage(
      marker: _s.extractXmlStringValue(elem, 'Marker'),
      reservedDBInstancesOfferings: _s
          .extractXmlChild(elem, 'ReservedDBInstancesOfferings')
          ?.let((elem) => elem
              .findElements('ReservedDBInstancesOffering')
              .map(ReservedDBInstancesOffering.fromXml)
              .toList()),
    );
  }
}

class RestoreDBInstanceFromDBSnapshotResult {
  final DBInstance? dBInstance;

  RestoreDBInstanceFromDBSnapshotResult({
    this.dBInstance,
  });
  factory RestoreDBInstanceFromDBSnapshotResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceFromDBSnapshotResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class RestoreDBInstanceToPointInTimeResult {
  final DBInstance? dBInstance;

  RestoreDBInstanceToPointInTimeResult({
    this.dBInstance,
  });
  factory RestoreDBInstanceToPointInTimeResult.fromXml(_s.XmlElement elem) {
    return RestoreDBInstanceToPointInTimeResult(
      dBInstance:
          _s.extractXmlChild(elem, 'DBInstance')?.let(DBInstance.fromXml),
    );
  }
}

class RevokeDBSecurityGroupIngressResult {
  final DBSecurityGroup? dBSecurityGroup;

  RevokeDBSecurityGroupIngressResult({
    this.dBSecurityGroup,
  });
  factory RevokeDBSecurityGroupIngressResult.fromXml(_s.XmlElement elem) {
    return RevokeDBSecurityGroupIngressResult(
      dBSecurityGroup: _s
          .extractXmlChild(elem, 'DBSecurityGroup')
          ?.let(DBSecurityGroup.fromXml),
    );
  }
}

enum SourceType {
  dbInstance('db-instance'),
  dbParameterGroup('db-parameter-group'),
  dbSecurityGroup('db-security-group'),
  dbSnapshot('db-snapshot'),
  ;

  final String value;

  const SourceType(this.value);

  static SourceType fromString(String value) => values.firstWhere(
      (e) => e.value == value,
      orElse: () => throw Exception('$value is not known in enum SourceType'));
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
  factory Subnet.fromXml(_s.XmlElement elem) {
    return Subnet(
      subnetAvailabilityZone: _s
          .extractXmlChild(elem, 'SubnetAvailabilityZone')
          ?.let(AvailabilityZone.fromXml),
      subnetIdentifier: _s.extractXmlStringValue(elem, 'SubnetIdentifier'),
      subnetStatus: _s.extractXmlStringValue(elem, 'SubnetStatus'),
    );
  }
}

class Tag {
  final String? key;
  final String? value;

  Tag({
    this.key,
    this.value,
  });
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

  Map<String, String> toQueryMap() {
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
  factory TagListMessage.fromXml(_s.XmlElement elem) {
    return TagListMessage(
      tagList: _s
          .extractXmlChild(elem, 'TagList')
          ?.let((elem) => elem.findElements('Tag').map(Tag.fromXml).toList()),
    );
  }
}

class VpcSecurityGroupMembership {
  final String? status;
  final String? vpcSecurityGroupId;

  VpcSecurityGroupMembership({
    this.status,
    this.vpcSecurityGroupId,
  });
  factory VpcSecurityGroupMembership.fromXml(_s.XmlElement elem) {
    return VpcSecurityGroupMembership(
      status: _s.extractXmlStringValue(elem, 'Status'),
      vpcSecurityGroupId: _s.extractXmlStringValue(elem, 'VpcSecurityGroupId'),
    );
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

class DBLogFileNotFoundFault extends _s.GenericAwsException {
  DBLogFileNotFoundFault({String? type, String? message})
      : super(type: type, code: 'DBLogFileNotFoundFault', message: message);
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
  'DBLogFileNotFoundFault': (type, message) =>
      DBLogFileNotFoundFault(type: type, message: message),
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
